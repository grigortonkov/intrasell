Public Class IntraSellDB
    Public objConnection As Microsoft.Data.Odbc.OdbcConnection
    Public command As Microsoft.Data.Odbc.OdbcCommand
    Public Const NOT_DEFINED = "n.a."


    Public Function getNextId(ByVal tableName As String, ByVal fieldName As String) As String
        Dim cmdNID As Microsoft.Data.Odbc.OdbcCommand
        cmdNID = New Microsoft.Data.Odbc.OdbcCommand("select max(" & fieldName & ")+1 as nId from " & tableName)
        cmdNID.Connection = objConnection
        Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = cmdNID.ExecuteReader()

        If myReader.Read() Then
            getNextId = myReader.GetString(0)
        Else
            getNextId = 1
        End If
        myReader.Close()
        cmdNID.Dispose()
    End Function

    Public Function tableValue(ByVal tableName As String, ByVal fieldName As String, ByVal fieldValue As String, ByVal returnField As String) As String
        Dim cmdNID As Microsoft.Data.Odbc.OdbcCommand
        cmdNID = New Microsoft.Data.Odbc.OdbcCommand("select " & returnField & " as f from " & tableName & " where " & fieldName & " = " & fieldValue)
        cmdNID.Connection = objConnection
        Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = cmdNID.ExecuteReader()

        If myReader.Read() Then
            tableValue = myReader.GetString(0)
        Else
            tableValue = NOT_DEFINED
        End If

        myReader.Close()
        cmdNID.Dispose()
    End Function

    Public Function ObjConnectionExecute(ByVal sql As String)
        Dim command As Microsoft.Data.Odbc.OdbcCommand
        command = New Microsoft.Data.Odbc.OdbcCommand(sql)
        command.Connection = objConnection
        command.ExecuteNonQuery()
        command.Dispose()
    End Function


    Public Function firstValue(ByVal sql As String) As String
        Dim cmdNID As Microsoft.Data.Odbc.OdbcCommand
        cmdNID = New Microsoft.Data.Odbc.OdbcCommand(sql)
        cmdNID.Connection = objConnection
        Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = cmdNID.ExecuteReader()

        If myReader.Read() Then
            firstValue = myReader.GetString(0)
        Else
            firstValue = NOT_DEFINED
        End If

        myReader.Close()
        cmdNID.Dispose()
    End Function

End Class
