Public Class MagentoConn
    Public sessionid As String = Nothing
    Public client As MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient

    Sub OpenConn()
        ModuleLog.Log("Open connection to magento")

        If Not sessionid Is Nothing Then Exit Sub

        client = New MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient
        Try
            sessionid = client.login(MagentoSync.My.MySettings.Default.Magento_username, MagentoSync.My.MySettings.Default.Magento_password)
            ModuleLog.Log("Session ID = " & sessionid)
        Catch ex As Exception
            ModuleLog.Log(ex)
        End Try
    End Sub

    Sub CloseConn()
        sessionid = Nothing
        client = Nothing
    End Sub

End Class
