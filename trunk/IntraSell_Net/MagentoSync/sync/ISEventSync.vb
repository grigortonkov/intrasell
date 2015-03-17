Public Class ISEventSync

    Dim magento As MagentoConn = New MagentoConn
    Dim intrasell As IntraSellConn = New IntraSellConn
    Dim s As Boolean

    ''' <summary>
    ''' Export all intrasell events to magento 
    ''' </summary>
    ''' <remarks></remarks>
    Public Sub ExportAllEvents()
        ModuleLog.Log("ExportAllEvents starts")
        Dim counter = 0
        Dim lastId As Long = 0

        Dim reader = New Global.MySql.Data.MySqlClient.MySqlDataAdapter
        reader.DeleteCommand = New Global.MySql.Data.MySqlClient.MySqlCommand

        Try

            intrasell.init()
            intrasell.MySQLConn.Open()

            reader.DeleteCommand.Connection = intrasell.MySQLConn

            reader.SelectCommand = New Global.MySql.Data.MySqlClient.MySqlCommand
            reader.SelectCommand.Connection = intrasell.MySQLConn

            reader.SelectCommand.CommandText = "select count(*) from magento_export order by timestamp limit 10"


            Dim allCount = reader.SelectCommand.ExecuteScalar

            reader.SelectCommand.CommandText = "select max(id) as LastId,  table_name, key_name, key_value  from magento_export group by table_name, key_name, key_value limit 10"


            Dim obj = reader.SelectCommand.ExecuteReader()

            Dim custSync = New CustomerSync

            Dim orderSync = New OrderSync

            While obj.Read
                lastId = obj.Item("LastId")
                counter = counter + 1
                ModuleLog.Log("Export event for table:" + obj.Item("table_name") & " key:" & obj.Item("key_name") & " value:" & obj.Item("key_value"))
                Try

               
                If obj.Item("table_name") = "ofAdressen" Then
                    custSync.InitialExportAllIntraSellCustomers(obj.Item("key_value"))
                ElseIf obj.Item("table_name") = "buchRechnung" Then
                    Dim woherAuftrag As String = intrasell.vars.firstRow("select woher from buchRechnung where Nummer = '" & obj.Item("key_value") & "'")
                    If Not woherAuftrag Is Nothing Then
                        orderSync.ExportOrderStatus(Nothing, woherAuftrag.Replace("AU", ""))
                    End If
                End If

                Catch ex As Exception
                    ModuleLog.Log(ex)
                End Try
                'update form 
                FormStart.setProgress(counter / allCount)
            End While
            obj.Close()


        Catch ex As Exception
            ModuleLog.Log(ex)
        Finally
            FormStart.setProgress(1)
            'delete row from the table 

            If lastId > 0 Then
                ModuleLog.Log("delete old events before id " & lastId)
                reader.DeleteCommand.CommandText = "delete from magento_export where id <= " & lastId
                reader.DeleteCommand.ExecuteScalar()
            End If

            intrasell.CloseConn()
        End Try


    End Sub

End Class
