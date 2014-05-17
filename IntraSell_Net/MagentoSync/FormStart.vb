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
        Dim exp As CustomerSync = New CustomerSync
        exp.InitialExportAllIntraSellCustomers()
    End Sub
#End Region


#Region "Kategorien&Podukte"
    Private Sub btnExportKategorien_Click(sender As System.Object, e As System.EventArgs) Handles btnExportKategorien.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.InitialExportAllCategories()
    End Sub


    Private Sub btnExportProducts_Click(sender As System.Object, e As System.EventArgs) Handles btnExportProducts.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.InitialExportAllProducts()
    End Sub

#End Region

    Private Sub btnImportOrders_Click(sender As System.Object, e As System.EventArgs) Handles btnImportOrders.Click

    End Sub
End Class
