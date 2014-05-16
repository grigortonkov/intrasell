Public Class MagentoConn
    Public sessionid As String
    Public client As MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient

    Sub OpenConn()
        client = New MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient
        Try
            sessionid = client.login("root", "Mama123123")
            Debug.Print("Session ID = " & sessionId)
        Catch ex As Exception
            Debug.Print("Ex = " & ex.StackTrace)
        End Try
    End Sub

    Sub CloseConn()
        sessionid = Nothing
        client = Nothing
    End Sub

End Class
