Imports System.Threading

Public Class FormStart

    Private Sub FormStart_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        ModuleLog.Init()
        ModuleLog.Log("Start")

        If IsNumeric(My.MySettings.Default.SyncIntervalSeconds) Then
            If 1 * (My.MySettings.Default.SyncIntervalSeconds) > 0 Then
                ModuleLog.Log("Timer job enabled every " + My.MySettings.Default.SyncIntervalSeconds + " seconds")
                TimerSync.Interval = My.MySettings.Default.SyncIntervalSeconds * 1000
                TimerSync.Enabled = True
            End If

        Else
            ModuleLog.Log("Timer job disabled")
            TimerSync.Enabled = False
        End If

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

    Private Sub btnMagento2ISKunden_Click(sender As System.Object, e As System.EventArgs) Handles btnMagento2ISKunden.Click
        Dim customerS As CustomerSync = New CustomerSync
        customerS.ImportNewMagentoCustomers(Me.DateTimePickerOrdersSince.Value)
    End Sub

    Private Sub btnKunden_Click(sender As System.Object, e As System.EventArgs) Handles btnKunden.Click
        Dim exp As CustomerSync = New CustomerSync
        exp.InitialExportAllIntraSellCustomers(Me.txtIDNR.Text)
    End Sub
#End Region


#Region "Kategorien&Podukte"
    Private Sub btnExportKategorien_Click(sender As System.Object, e As System.EventArgs) Handles btnExportKategorien.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.InitialExportAllCategories()
    End Sub

    Private Sub btnExportProducts_Click(sender As System.Object, e As System.EventArgs) Handles btnExportProducts.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.InitialExportAllProducts(Me.txtEAN.Text)
    End Sub

    Private Sub btnExportLagerstand_Click(sender As System.Object, e As System.EventArgs) Handles btnExportLagerstand.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.ExportProductLagerstand(Me.txtEAN.Text)
    End Sub

#End Region


#Region "Orders"


    Private Sub btnImportOrders_Click(sender As System.Object, e As System.EventArgs) Handles btnImportOrders.Click
        Me.btnImportOrders.Enabled = False
        BackgroundProcess()
        Me.btnImportOrders.Enabled = True
        'Dim trd = New Thread(AddressOf BackgroundProcess)
        'trd.IsBackground = True
        'trd.Start()
        'Me.btnImportOrders.Enabled = False
    End Sub

    Sub BackgroundProcess()
        Dim exp As OrderSync = New OrderSync
        exp.ImportNewOrders(Me.DateTimePickerOrdersSince.Value)
        'btn.Enabled = True
    End Sub

    Private Sub TimerSync_Tick(sender As System.Object, e As System.EventArgs) Handles TimerSync.Tick
        'Orders
        btnImportOrders_Click(Nothing, Nothing)
        'Kunden
        btnMagento2ISKunden_Click(Nothing, Nothing)
    End Sub

    Private Sub Label3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label3.Click
        Me.txtIDNR.Text = ""
    End Sub

    Private Sub Label4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label4.Click
        Me.txtEAN.Text = ""
    End Sub


    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles btnExportOrderStatus.Click
        Dim exp As OrderSync = New OrderSync
        exp.ExportOrderStatus(Me.DateTimePickerOrdersSince.Value)
        'btn.Enabled = True
    End Sub
#End Region
End Class
