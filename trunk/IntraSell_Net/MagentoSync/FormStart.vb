Public Class FormStart

    Private Sub FormStart_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Dim customerS As CustomerSync = New CustomerSync
        customerS.CustomerSync()
    End Sub
End Class
