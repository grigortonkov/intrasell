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
    Sub pushLog(ByVal logline As String)
        Try

            logBuffer = logline & vbNewLine & logBuffer
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub
    Sub setProgress(ByVal newValue As Decimal)
        Try

            progress = newValue
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub FormStart_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try

            ModuleLog.Init()
            ModuleLog.Log("Start")

            Me.DateTimePickerOrdersSince.Value = Today

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
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
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
        Try
            trd = New Thread(AddressOf SyncThread)
            trd.Name = "Sync"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
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

    Private Sub btnMagento2ISKunden_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnMagento2ISKunden.Click
        Try

            trd = New Thread(AddressOf ThreadTask_btnMagento2ISKunden_Click)
            trd.Name = "Magento2ISKunden"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub ThreadTask_btnMagento2ISKunden_Click()
        Try
            Dim customerS As CustomerSync = New CustomerSync
            customerS.ImportNewMagentoCustomers(Me.DateTimePickerOrdersSince.Value)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub btnKunden_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnKunden.Click
        Try

            trd = New Thread(AddressOf ThreadTask_Kunden)
            trd.Name = "ExportKunden"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub ThreadTask_Kunden()
        Try
            Dim exp As CustomerSync = New CustomerSync
            exp.InitialExportAllIntraSellCustomers(Me.txtIDNR.Text)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

#End Region

#Region "Kategorien&Podukte"
    Private Sub btnExportKategorien_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportKategorien.Click
        Try

            trd = New Thread(AddressOf ThreadTask_btnExportKategorien_Click)
            trd.Name = "ExportKategorien"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub
    Private Sub ThreadTask_btnExportKategorien_Click()
        Try
            Dim exp As CatalogSync = New CatalogSync
            exp.InitialExportAllCategories(Me.cbEnglish.Checked)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub btnExportProducts_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportProducts.Click
        Try
            trd = New Thread(AddressOf ThreadTask_btnExportProducts_Click)
            trd.Name = "ExportProducts"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub
    Private Sub ThreadTask_btnExportProducts_Click()
        Try
            Dim exp As CatalogSync = New CatalogSync
            exp.InitialExportAllProducts(Me.txtEAN.Text, Me.cbEnglish.Checked, Me.cbPics.Checked, Me.cbPrices.Checked, Me.cbLinkCats.Checked, Me.cbNextEAN.Checked)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub btnExportLagerstand_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportLagerstand.Click
        Try
            trd = New Thread(AddressOf ThreadTask_btnExportLagerstand_Click)
            trd.Name = "ExportLagerstand"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub
    Private Sub ThreadTask_btnExportLagerstand_Click()
        Try
            Dim exp As CatalogSync = New CatalogSync
            exp.ExportProductLagerstand(Me.txtEAN.Text)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

#End Region

#Region "Orders"

    Private Sub btnExportOrderStatus_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportOrderStatus.Click
        Try
            Dim trd = New Thread(AddressOf ThreadTask_ExportOrderStatus)
            trd.Name = "ExportOrderStatus"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub btnImportOrders_Click(sender As System.Object, e As System.EventArgs) Handles btnImportOrders.Click
    
        Dim trd = New Thread(AddressOf ThreadTask_btnImportOrders_Click)
        trd.Name = "ImportOrders"
        trd.IsBackground = True
        trd.Start()
        'Me.btnImportOrders.Enabled = False
    End Sub

    Sub ThreadTask_btnImportOrders_Click()
        Try
            Dim exp As OrderSync = New OrderSync
            exp.ImportNewOrders(Me.DateTimePickerOrdersSince.Value.AddHours(-2)) 'HACK: um die GMT umzugehen in magento 
            'btn.Enabled = True
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub



    Private Sub Label3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label3.Click
        Me.txtIDNR.Text = ""
    End Sub

    Private Sub Label4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Label4.Click
        Me.txtEAN.Text = ""
    End Sub

    


    Sub ThreadTask_ExportOrderStatus()
        Try
            Dim exp As OrderSync = New OrderSync
            exp.ExportOrderStatus(Me.DateTimePickerOrdersSince.Value)
            'btn.Enabled = True
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub
#End Region

#Region "Timers"
    Private Sub TimerSync_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TimerSync.Tick
        Try
            Me.DateTimePickerOrdersSince.Value = Today

            'Magento Orders
            btnImportOrders_Click(Nothing, Nothing)
            'Magento Kunden
            btnMagento2ISKunden_Click(Nothing, Nothing)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub TimerAuftragstatus2Magento_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TimerAuftragstatus2Magento.Tick
        Try
            'Order Status 
            btnExportOrderStatus_Click(Nothing, Nothing)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub TimerLager_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TimerLager.Tick
        Try
            btnExportLagerstand_Click(Nothing, Nothing)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    ''' <summary>
    ''' Time to refresh the interface of this form
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TimerInterface.Tick
        Try
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

        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

#End Region

#Region "Events"
    Private Sub TimerISEvents_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TimerISEvents.Tick
        Try
            btnExportISEvents_Click(Nothing, Nothing)
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    Private Sub btnExportISEvents_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportISEvents.Click
        Try
            Dim trd = New Thread(AddressOf ThreadTask_ExportISEvents)
            trd.Name = "ExportISEvents"
            trd.IsBackground = True
            trd.Start()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub

    ''' <summary>
    ''' Export all IntraSell Events from Table magento_export
    ''' </summary>
    ''' <remarks></remarks>
    Sub ThreadTask_ExportISEvents()
        Try
            Dim exporter = New ISEventSync
            exporter.ExportAllEvents()
        Catch ex As Exception
            ModuleLog.Log(ex)
            Me.lblMagentoConn.BackColor = Color.Red
        End Try
    End Sub
#End Region

#Region "test"

    Private Sub btnTest_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTest.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.ProductInfo(Me.txtEAN.Text)
    End Sub

    Private Sub btnTest2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnTest2.Click
        Dim exp As CatalogSync = New CatalogSync
        exp.magento.OpenConn()
        ' exp.magento.client.salesOrderCreditmemoInfo(exp.magento.sessionid, Nothing, Nothing)
    End Sub
#End Region

End Class
