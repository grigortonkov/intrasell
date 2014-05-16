Public Class FormStart

    Private Sub FormStart_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
       
    End Sub


    Private Sub btnCheckMagento_Click(sender As System.Object, e As System.EventArgs) Handles btnCheckMagento.Click
        Try
            Dim mc As MagentoConn = New MagentoConn
            mc.OpenConn()
            Me.lblMagentoConn.BackColor = Color.YellowGreen
        Catch ex As Exception
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    
    Private Sub btnCheckIS_Click(sender As System.Object, e As System.EventArgs) Handles btnCheckIS.Click
        Try
            Dim mc As IntraSellConn = New IntraSellConn
            mc.OpenConn()
            Me.lblintraSellConn.BackColor = Color.YellowGreen
        Catch ex As Exception
            Me.lblintraSellConn.BackColor = Color.Red
        End Try
    End Sub

#Region "Kunden"
    Public Sub Sync()
        Dim customerS As CustomerSync = New CustomerSync
        customerS.ImportNewMagentoCustomers()
    End Sub
    Private Sub btnKunden_Click(sender As System.Object, e As System.EventArgs) Handles btnKunden.Click
        Dim customerS As CustomerSync = New CustomerSync
        customerS.InitialExportAllIntraSellCustomers()
    End Sub
#End Region

End Class
