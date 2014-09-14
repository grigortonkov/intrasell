Public Class MagentoConn
    Public sessionid As String = Nothing
    Public client As MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient

    Sub OpenConn()
        If Not sessionid Is Nothing Then Exit Sub
        ModuleLog.Log("Open magento")
        client = New MagentoSyncService.Mage_Api_Model_Server_V2_HandlerPortTypeClient
        Try
            sessionid = client.login(MagentoSync.My.MySettings.Default.Magento_username, MagentoSync.My.MySettings.Default.Magento_password)
            'ModuleLog.Log("Session ID = " & sessionid)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Throw ex
        End Try
    End Sub

    Sub CloseConn()
        ModuleLog.Log("Close magento")
        sessionid = Nothing
        client = Nothing
    End Sub

End Class
