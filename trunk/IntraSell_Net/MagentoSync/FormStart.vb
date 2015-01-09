Imports System.Threading

Public Class FormStart

    Private trd As Thread
    Private Shared progress As Decimal = 0 'Number 0..1 showing the current progress if the current task 
    Private Shared logBuffer As String

    ''' <summary>
    ''' add new log line 
    ''' </summary>
    ''' <param name="logline"></param>
    ''' <remarks></remarks>
    Sub pushLog(logline As String)
        logBuffer = logline & vbNewLine & logBuffer
    End Sub
    Sub setProgress(newValue As Decimal)
        progress = newValue
    End Sub

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
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub


    Private Sub btnCheckIS_Click(sender As System.Object, e As System.EventArgs) Handles btnCheckIS.Click
        Try
            Dim mc As IntraSellConn = New IntraSellConn
            mc.OpenConn()
            Me.lblintraSellConn.BackColor = Color.YellowGreen
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblintraSellConn.BackColor = Color.Red
        End Try
    End Sub

#Region "Kunden"
    Public Sub Sync()
      
        trd = New Thread(AddressOf SyncThread)
        trd.IsBackground = True
        trd.Start()

    End Sub

    Private Sub SyncThread()
        Dim customerS As CustomerSync = New CustomerSync
        customerS.ImportNewMagentoCustomers()
    End Sub


    Private Sub ThreadTask()
        Dim stp As Integer = 1
        Dim newval As Integer

        Do
            stp = ProgressBar1.Step
            newval = ProgressBar1.Value + stp
            If newval > ProgressBar1.Maximum Then
                newval = ProgressBar1.Maximum
            ElseIf newval < ProgressBar1.Minimum Then
                newval = ProgressBar1.Minimum
            End If

            ProgressBar1.Value = newval

            Thread.Sleep(100)
        Loop
    End Sub

    Private Sub btnMagento2ISKunden_Click(sender As System.Object, e As System.EventArgs) Handles btnMagento2ISKunden.Click
        trd = New Thread(AddressOf ThreadTask_btnMagento2ISKunden_Click)
        trd.IsBackground = True
        trd.Start()
    End Sub

    Private Sub ThreadTask_btnMagento2ISKunden_Click()
        Dim customerS As CustomerSync = New CustomerSync
        customerS.ImportNewMagentoCustomers(Me.DateTimePickerOrdersSince.Value)
    End Sub

    Private Sub btnKunden_Click(sender As System.Object, e As System.EventArgs) Handles btnKunden.Click
        trd = New Thread(AddressOf ThreadTask_Kunden)
        trd.IsBackground = True
        trd.Start()
    End Sub

    Private Sub ThreadTask_Kunden()
        Dim exp As CustomerSync = New CustomerSync
        exp.InitialExportAllIntraSellCustomers(Me.txtIDNR.Text)
    End Sub

#End Region


#Region "Kategorien&Podukte"
    Private Sub btnExportKategorien_Click(sender As System.Object, e As System.EventArgs) Handles btnExportKategorien.Click
        trd = New Thread(AddressOf ThreadTask_btnExportKategorien_Click)
        trd.IsBackground = True
        trd.Start()
    End Sub
    Private Sub ThreadTask_btnExportKategorien_Click()
        Dim exp As CatalogSync = New CatalogSync
        exp.InitialExportAllCategories(Me.cbEnglish.Checked)
    End Sub

    Private Sub btnExportProducts_Click(sender As System.Object, e As System.EventArgs) Handles btnExportProducts.Click
        trd = New Thread(AddressOf ThreadTask_btnExportProducts_Click)
        trd.IsBackground = True
        trd.Start()
    End Sub
    Private Sub ThreadTask_btnExportProducts_Click()
        Dim exp As CatalogSync = New CatalogSync
        exp.InitialExportAllProducts(Me.txtEAN.Text, Me.cbEnglish.Checked, Me.cbPics.Checked, Me.cbPrices.Checked, Me.cbLinkCats.Checked)
    End Sub

    Private Sub btnExportLagerstand_Click(sender As System.Object, e As System.EventArgs) Handles btnExportLagerstand.Click
        trd = New Thread(AddressOf ThreadTask_btnExportLagerstand_Click)
        trd.IsBackground = True
        trd.Start()
    End Sub
    Private Sub ThreadTask_btnExportLagerstand_Click()
        Dim exp As CatalogSync = New CatalogSync
        exp.ExportProductLagerstand(Me.txtEAN.Text)
    End Sub

#End Region


#Region "Orders"


    Private Sub btnImportOrders_Click(sender As System.Object, e As System.EventArgs) Handles btnImportOrders.Click
    
        Dim trd = New Thread(AddressOf ThreadTask_btnImportOrders_Click)
        trd.IsBackground = True
        trd.Start()
        'Me.btnImportOrders.Enabled = False
    End Sub

    Sub ThreadTask_btnImportOrders_Click()
        Dim exp As OrderSync = New OrderSync
        exp.ImportNewOrders(Me.DateTimePickerOrdersSince.Value.AddHours(-2)) 'HACK: um die GMT umzugehen in magento 
        'btn.Enabled = True
    End Sub



    Private Sub Label3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label3.Click
        Me.txtIDNR.Text = ""
    End Sub

    Private Sub Label4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label4.Click
        Me.txtEAN.Text = ""
    End Sub

    


    Sub ThreadTask_ExportOrderStatus()
        Dim exp As OrderSync = New OrderSync
        exp.ExportOrderStatus(Me.DateTimePickerOrdersSince.Value)
        'btn.Enabled = True
    End Sub
#End Region

    Private Sub Timer1_Tick(sender As System.Object, e As System.EventArgs) Handles TimerInterface.Tick

        'update log 
        If Len(logBuffer) > 0 Then
            Me.txtLog.Text = logBuffer + Me.txtLog.Text
            logBuffer = ""
        End If


        ProgressBar1.Value = ProgressBar1.Maximum * progress
        'If ProgressBar1.Value < ProgressBar1.Maximum Then
        'ProgressBar1.Value = ProgressBar1.Value + ProgressBar1.Step
        'Else
        'ProgressBar1.Value = 0
        'End If
    End Sub

    Private Sub btnExportOrderStatus_Click(sender As System.Object, e As System.EventArgs) Handles btnExportOrderStatus.Click
        Dim trd = New Thread(AddressOf ThreadTask_ExportOrderStatus)
        trd.IsBackground = True
        trd.Start()
    End Sub

#Region "Timers"
    Private Sub TimerSync_Tick(sender As System.Object, e As System.EventArgs) Handles TimerSync.Tick
        'Orders
        btnImportOrders_Click(Nothing, Nothing)
        'Kunden
        btnMagento2ISKunden_Click(Nothing, Nothing)
    End Sub

    Private Sub TimerAuftragstatus2Magento_Tick(sender As System.Object, e As System.EventArgs) Handles TimerAuftragstatus2Magento.Tick
        'Order Status 
        btnExportOrderStatus_Click(Nothing, Nothing)
    End Sub

    Private Sub TimerLager_Tick(sender As System.Object, e As System.EventArgs) Handles TimerLager.Tick
        btnExportLagerstand_Click(Nothing, Nothing)
    End Sub

#End Region


    Private Sub cbPics_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles cbPics.CheckedChanged

    End Sub

    Private Sub Label6_Click(sender As System.Object, e As System.EventArgs) Handles Label6.Click

    End Sub

    Private Sub btnTest_Click(sender As System.Object, e As System.EventArgs) Handles btnTest.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.ProductInfo(Me.txtEAN.Text)
    End Sub

    Private Sub btnTest2_Click(sender As System.Object, e As System.EventArgs) Handles btnTest2.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.magento.OpenConn()
        ' exp.magento.client.salesOrderCreditmemoInfo(exp.magento.sessionid, Nothing, Nothing)
    End Sub
End Class
