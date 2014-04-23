Public Class CustomerSync

    Public Sub CustomerSync()

        Dim e As MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient

        e = New MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient

        Dim sessionId = Nothing

        Try
            sessionId = e.login("root", "Mama123123")
            Debug.Print("Session ID = " & sessionId)
        Catch ex As Exception
            Debug.Print("Ex = " & ex.StackTrace)
        End Try

        Try
            Dim list As MagentoSyncService.customerCustomerEntity() = e.customerCustomerList(sessionId, Nothing)
            Debug.Print("Found " & list.Count.ToString & " customers.")
            Dim c As MagentoSyncService.customerCustomerEntity

            For i As Int16 = 1 To list.Count
                c = list.ElementAt(i)
                Debug.Print("Firstname " & c.firstname)
            Next
        Catch ex As Exception
            Debug.Print("Ex = " & ex.StackTrace)
        End Try
    End Sub

End Class
