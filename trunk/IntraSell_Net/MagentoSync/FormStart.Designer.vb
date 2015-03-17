<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormStart
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FormStart))
        Me.btnCheckMagento = New System.Windows.Forms.Button()
        Me.btnCheckIS = New System.Windows.Forms.Button()
        Me.lblMagentoConn = New System.Windows.Forms.Label()
        Me.lblintraSellConn = New System.Windows.Forms.Label()
        Me.btnKunden = New System.Windows.Forms.Button()
        Me.btnExportKategorien = New System.Windows.Forms.Button()
        Me.btnExportProducts = New System.Windows.Forms.Button()
        Me.btnImportOrders = New System.Windows.Forms.Button()
        Me.txtLog = New System.Windows.Forms.TextBox()
        Me.TimerSync = New System.Windows.Forms.Timer(Me.components)
        Me.DateTimePickerOrdersSince = New System.Windows.Forms.DateTimePicker()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.txtIDNR = New System.Windows.Forms.TextBox()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.txtEAN = New System.Windows.Forms.TextBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.btnExportLagerstand = New System.Windows.Forms.Button()
        Me.btnExportOrderStatus = New System.Windows.Forms.Button()
        Me.btnMagento2ISKunden = New System.Windows.Forms.Button()
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar()
        Me.TimerInterface = New System.Windows.Forms.Timer(Me.components)
        Me.cbEnglish = New System.Windows.Forms.CheckBox()
        Me.TimerAuftragstatus2Magento = New System.Windows.Forms.Timer(Me.components)
        Me.TimerLager = New System.Windows.Forms.Timer(Me.components)
        Me.cbPics = New System.Windows.Forms.CheckBox()
        Me.cbPrices = New System.Windows.Forms.CheckBox()
        Me.cbLinkCats = New System.Windows.Forms.CheckBox()
        Me.btnTest = New System.Windows.Forms.Button()
        Me.btnTest2 = New System.Windows.Forms.Button()
        Me.btnExportISEvents = New System.Windows.Forms.Button()
        Me.TimerISEvents = New System.Windows.Forms.Timer(Me.components)
        Me.cbNextEAN = New System.Windows.Forms.CheckBox()
        Me.SuspendLayout()
        '
        'btnCheckMagento
        '
        Me.btnCheckMagento.Location = New System.Drawing.Point(908, 42)
        Me.btnCheckMagento.Name = "btnCheckMagento"
        Me.btnCheckMagento.Size = New System.Drawing.Size(133, 22)
        Me.btnCheckMagento.TabIndex = 0
        Me.btnCheckMagento.Text = "Connect to Magento"
        Me.btnCheckMagento.UseVisualStyleBackColor = True
        '
        'btnCheckIS
        '
        Me.btnCheckIS.Location = New System.Drawing.Point(908, 70)
        Me.btnCheckIS.Name = "btnCheckIS"
        Me.btnCheckIS.Size = New System.Drawing.Size(133, 23)
        Me.btnCheckIS.TabIndex = 1
        Me.btnCheckIS.Text = "Connect to IntraSell"
        Me.btnCheckIS.UseVisualStyleBackColor = True
        '
        'lblMagentoConn
        '
        Me.lblMagentoConn.AutoSize = True
        Me.lblMagentoConn.Location = New System.Drawing.Point(1057, 51)
        Me.lblMagentoConn.Name = "lblMagentoConn"
        Me.lblMagentoConn.Size = New System.Drawing.Size(16, 13)
        Me.lblMagentoConn.TabIndex = 2
        Me.lblMagentoConn.Text = "..."
        '
        'lblintraSellConn
        '
        Me.lblintraSellConn.AutoSize = True
        Me.lblintraSellConn.Location = New System.Drawing.Point(1057, 75)
        Me.lblintraSellConn.Name = "lblintraSellConn"
        Me.lblintraSellConn.Size = New System.Drawing.Size(16, 13)
        Me.lblintraSellConn.TabIndex = 3
        Me.lblintraSellConn.Text = "..."
        '
        'btnKunden
        '
        Me.btnKunden.Location = New System.Drawing.Point(12, 12)
        Me.btnKunden.Name = "btnKunden"
        Me.btnKunden.Size = New System.Drawing.Size(152, 23)
        Me.btnKunden.TabIndex = 4
        Me.btnKunden.Text = "IS Kunden 2 Magento"
        Me.btnKunden.UseVisualStyleBackColor = True
        '
        'btnExportKategorien
        '
        Me.btnExportKategorien.Location = New System.Drawing.Point(12, 41)
        Me.btnExportKategorien.Name = "btnExportKategorien"
        Me.btnExportKategorien.Size = New System.Drawing.Size(152, 23)
        Me.btnExportKategorien.TabIndex = 5
        Me.btnExportKategorien.Text = "IS Kategorien 2 Magento"
        Me.btnExportKategorien.UseVisualStyleBackColor = True
        '
        'btnExportProducts
        '
        Me.btnExportProducts.Location = New System.Drawing.Point(12, 70)
        Me.btnExportProducts.Name = "btnExportProducts"
        Me.btnExportProducts.Size = New System.Drawing.Size(152, 23)
        Me.btnExportProducts.TabIndex = 6
        Me.btnExportProducts.Text = "IS Produkte 2 Magento"
        Me.btnExportProducts.UseVisualStyleBackColor = True
        '
        'btnImportOrders
        '
        Me.btnImportOrders.BackColor = System.Drawing.Color.LightBlue
        Me.btnImportOrders.Location = New System.Drawing.Point(12, 194)
        Me.btnImportOrders.Name = "btnImportOrders"
        Me.btnImportOrders.Size = New System.Drawing.Size(152, 23)
        Me.btnImportOrders.TabIndex = 7
        Me.btnImportOrders.Text = "Magento 2 IS Orders"
        Me.btnImportOrders.UseVisualStyleBackColor = False
        '
        'txtLog
        '
        Me.txtLog.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.txtLog.Location = New System.Drawing.Point(0, 310)
        Me.txtLog.Multiline = True
        Me.txtLog.Name = "txtLog"
        Me.txtLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtLog.Size = New System.Drawing.Size(1088, 225)
        Me.txtLog.TabIndex = 8
        '
        'TimerSync
        '
        Me.TimerSync.Enabled = True
        Me.TimerSync.Interval = 300000
        '
        'DateTimePickerOrdersSince
        '
        Me.DateTimePickerOrdersSince.CustomFormat = "dd.MM.yyyy HH.mm"
        Me.DateTimePickerOrdersSince.Format = System.Windows.Forms.DateTimePickerFormat.Custom
        Me.DateTimePickerOrdersSince.Location = New System.Drawing.Point(224, 197)
        Me.DateTimePickerOrdersSince.Name = "DateTimePickerOrdersSince"
        Me.DateTimePickerOrdersSince.Size = New System.Drawing.Size(187, 20)
        Me.DateTimePickerOrdersSince.TabIndex = 9
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(176, 199)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(32, 13)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "since"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(176, 18)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(34, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "IDNR"
        '
        'txtIDNR
        '
        Me.txtIDNR.Location = New System.Drawing.Point(224, 15)
        Me.txtIDNR.Name = "txtIDNR"
        Me.txtIDNR.Size = New System.Drawing.Size(101, 20)
        Me.txtIDNR.TabIndex = 12
        Me.txtIDNR.Text = "1"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(341, 19)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(70, 13)
        Me.Label3.TabIndex = 13
        Me.Label3.Text = "remove for all"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(298, 74)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(70, 13)
        Me.Label4.TabIndex = 16
        Me.Label4.Text = "remove for all"
        '
        'txtEAN
        '
        Me.txtEAN.Location = New System.Drawing.Point(247, 70)
        Me.txtEAN.Name = "txtEAN"
        Me.txtEAN.Size = New System.Drawing.Size(45, 20)
        Me.txtEAN.TabIndex = 15
        Me.txtEAN.Text = "D026"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(212, 74)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(29, 13)
        Me.Label5.TabIndex = 14
        Me.Label5.Text = "EAN"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(958, 9)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(118, 13)
        Me.Label6.TabIndex = 17
        Me.Label6.Text = "Vers. 1.0.4. 13.03.2015"
        '
        'btnExportLagerstand
        '
        Me.btnExportLagerstand.BackColor = System.Drawing.Color.LightBlue
        Me.btnExportLagerstand.Location = New System.Drawing.Point(12, 99)
        Me.btnExportLagerstand.Name = "btnExportLagerstand"
        Me.btnExportLagerstand.Size = New System.Drawing.Size(152, 23)
        Me.btnExportLagerstand.TabIndex = 18
        Me.btnExportLagerstand.Text = "IS Lagerstd. 2 Magento"
        Me.btnExportLagerstand.UseVisualStyleBackColor = False
        '
        'btnExportOrderStatus
        '
        Me.btnExportOrderStatus.BackColor = System.Drawing.Color.LightBlue
        Me.btnExportOrderStatus.Location = New System.Drawing.Point(12, 128)
        Me.btnExportOrderStatus.Name = "btnExportOrderStatus"
        Me.btnExportOrderStatus.Size = New System.Drawing.Size(152, 23)
        Me.btnExportOrderStatus.TabIndex = 19
        Me.btnExportOrderStatus.Text = "IS Auftragstatus 2 Magento"
        Me.btnExportOrderStatus.UseVisualStyleBackColor = False
        '
        'btnMagento2ISKunden
        '
        Me.btnMagento2ISKunden.BackColor = System.Drawing.Color.LightBlue
        Me.btnMagento2ISKunden.Location = New System.Drawing.Point(12, 223)
        Me.btnMagento2ISKunden.Name = "btnMagento2ISKunden"
        Me.btnMagento2ISKunden.Size = New System.Drawing.Size(152, 23)
        Me.btnMagento2ISKunden.TabIndex = 20
        Me.btnMagento2ISKunden.Text = "Magento 2 IS Kunden"
        Me.btnMagento2ISKunden.UseVisualStyleBackColor = False
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Location = New System.Drawing.Point(12, 281)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(1064, 23)
        Me.ProgressBar1.TabIndex = 21
        '
        'TimerInterface
        '
        Me.TimerInterface.Enabled = True
        Me.TimerInterface.Interval = 1000
        '
        'cbEnglish
        '
        Me.cbEnglish.AutoSize = True
        Me.cbEnglish.Location = New System.Drawing.Point(428, 72)
        Me.cbEnglish.Name = "cbEnglish"
        Me.cbEnglish.Size = New System.Drawing.Size(91, 17)
        Me.cbEnglish.TabIndex = 22
        Me.cbEnglish.Text = "export english"
        Me.cbEnglish.UseVisualStyleBackColor = True
        '
        'TimerAuftragstatus2Magento
        '
        Me.TimerAuftragstatus2Magento.Interval = 3600000
        '
        'TimerLager
        '
        Me.TimerLager.Enabled = True
        Me.TimerLager.Interval = 7200000
        '
        'cbPics
        '
        Me.cbPics.AutoSize = True
        Me.cbPics.Location = New System.Drawing.Point(733, 72)
        Me.cbPics.Name = "cbPics"
        Me.cbPics.Size = New System.Drawing.Size(77, 17)
        Me.cbPics.TabIndex = 23
        Me.cbPics.Text = "export pics"
        Me.cbPics.UseVisualStyleBackColor = True
        '
        'cbPrices
        '
        Me.cbPrices.AutoSize = True
        Me.cbPrices.Checked = True
        Me.cbPrices.CheckState = System.Windows.Forms.CheckState.Checked
        Me.cbPrices.Location = New System.Drawing.Point(538, 73)
        Me.cbPrices.Name = "cbPrices"
        Me.cbPrices.Size = New System.Drawing.Size(86, 17)
        Me.cbPrices.TabIndex = 24
        Me.cbPrices.Text = "export prices"
        Me.cbPrices.UseVisualStyleBackColor = True
        '
        'cbLinkCats
        '
        Me.cbLinkCats.AutoSize = True
        Me.cbLinkCats.Location = New System.Drawing.Point(641, 72)
        Me.cbLinkCats.Name = "cbLinkCats"
        Me.cbLinkCats.Size = New System.Drawing.Size(86, 17)
        Me.cbLinkCats.TabIndex = 25
        Me.cbLinkCats.Text = "link category"
        Me.cbLinkCats.UseVisualStyleBackColor = True
        '
        'btnTest
        '
        Me.btnTest.Location = New System.Drawing.Point(908, 127)
        Me.btnTest.Name = "btnTest"
        Me.btnTest.Size = New System.Drawing.Size(133, 23)
        Me.btnTest.TabIndex = 26
        Me.btnTest.Text = "ProductPrice"
        Me.btnTest.UseVisualStyleBackColor = True
        '
        'btnTest2
        '
        Me.btnTest2.Location = New System.Drawing.Point(908, 99)
        Me.btnTest2.Name = "btnTest2"
        Me.btnTest2.Size = New System.Drawing.Size(133, 23)
        Me.btnTest2.TabIndex = 27
        Me.btnTest2.Text = "Payment"
        Me.btnTest2.UseVisualStyleBackColor = True
        '
        'btnExportISEvents
        '
        Me.btnExportISEvents.BackColor = System.Drawing.Color.LightBlue
        Me.btnExportISEvents.Location = New System.Drawing.Point(12, 157)
        Me.btnExportISEvents.Name = "btnExportISEvents"
        Me.btnExportISEvents.Size = New System.Drawing.Size(152, 23)
        Me.btnExportISEvents.TabIndex = 28
        Me.btnExportISEvents.Text = "IS Events (Rech.,Kunde)"
        Me.btnExportISEvents.UseVisualStyleBackColor = False
        '
        'TimerISEvents
        '
        Me.TimerISEvents.Enabled = True
        Me.TimerISEvents.Interval = 90000
        '
        'cbNextEAN
        '
        Me.cbNextEAN.AutoSize = True
        Me.cbNextEAN.Location = New System.Drawing.Point(170, 71)
        Me.cbNextEAN.Name = "cbNextEAN"
        Me.cbNextEAN.Size = New System.Drawing.Size(32, 17)
        Me.cbNextEAN.TabIndex = 29
        Me.cbNextEAN.Text = ">"
        Me.cbNextEAN.UseVisualStyleBackColor = True
        '
        'FormStart
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.Gray
        Me.ClientSize = New System.Drawing.Size(1088, 535)
        Me.Controls.Add(Me.cbNextEAN)
        Me.Controls.Add(Me.btnExportISEvents)
        Me.Controls.Add(Me.btnTest2)
        Me.Controls.Add(Me.btnTest)
        Me.Controls.Add(Me.cbLinkCats)
        Me.Controls.Add(Me.cbPrices)
        Me.Controls.Add(Me.cbPics)
        Me.Controls.Add(Me.cbEnglish)
        Me.Controls.Add(Me.ProgressBar1)
        Me.Controls.Add(Me.btnMagento2ISKunden)
        Me.Controls.Add(Me.btnExportOrderStatus)
        Me.Controls.Add(Me.btnExportLagerstand)
        Me.Controls.Add(Me.Label6)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.txtEAN)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.txtIDNR)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.DateTimePickerOrdersSince)
        Me.Controls.Add(Me.txtLog)
        Me.Controls.Add(Me.btnImportOrders)
        Me.Controls.Add(Me.btnExportProducts)
        Me.Controls.Add(Me.btnExportKategorien)
        Me.Controls.Add(Me.btnKunden)
        Me.Controls.Add(Me.lblintraSellConn)
        Me.Controls.Add(Me.lblMagentoConn)
        Me.Controls.Add(Me.btnCheckIS)
        Me.Controls.Add(Me.btnCheckMagento)
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "FormStart"
        Me.Text = "IntraSell 2 Magento"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnCheckMagento As System.Windows.Forms.Button
    Friend WithEvents btnCheckIS As System.Windows.Forms.Button
    Friend WithEvents lblMagentoConn As System.Windows.Forms.Label
    Friend WithEvents lblintraSellConn As System.Windows.Forms.Label
    Friend WithEvents btnKunden As System.Windows.Forms.Button
    Friend WithEvents btnExportKategorien As System.Windows.Forms.Button
    Friend WithEvents btnExportProducts As System.Windows.Forms.Button
    Friend WithEvents btnImportOrders As System.Windows.Forms.Button
    Friend WithEvents txtLog As System.Windows.Forms.TextBox
    Friend WithEvents TimerSync As System.Windows.Forms.Timer
    Friend WithEvents DateTimePickerOrdersSince As System.Windows.Forms.DateTimePicker
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents txtIDNR As System.Windows.Forms.TextBox
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents txtEAN As System.Windows.Forms.TextBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents btnExportLagerstand As System.Windows.Forms.Button
    Friend WithEvents btnExportOrderStatus As System.Windows.Forms.Button
    Friend WithEvents btnMagento2ISKunden As System.Windows.Forms.Button
    Friend WithEvents ProgressBar1 As System.Windows.Forms.ProgressBar
    Friend WithEvents TimerInterface As System.Windows.Forms.Timer
    Friend WithEvents cbEnglish As System.Windows.Forms.CheckBox
    Friend WithEvents TimerAuftragstatus2Magento As System.Windows.Forms.Timer
    Friend WithEvents TimerLager As System.Windows.Forms.Timer
    Friend WithEvents cbPics As System.Windows.Forms.CheckBox
    Friend WithEvents cbPrices As System.Windows.Forms.CheckBox
    Friend WithEvents cbLinkCats As System.Windows.Forms.CheckBox
    Friend WithEvents btnTest As System.Windows.Forms.Button
    Friend WithEvents btnTest2 As System.Windows.Forms.Button
    Friend WithEvents btnExportISEvents As System.Windows.Forms.Button
    Friend WithEvents TimerISEvents As System.Windows.Forms.Timer
    Friend WithEvents cbNextEAN As System.Windows.Forms.CheckBox

End Class
