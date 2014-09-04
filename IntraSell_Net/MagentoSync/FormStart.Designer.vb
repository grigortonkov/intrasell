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
        Me.SuspendLayout()
        '
        'btnCheckMagento
        '
        Me.btnCheckMagento.Location = New System.Drawing.Point(12, 23)
        Me.btnCheckMagento.Name = "btnCheckMagento"
        Me.btnCheckMagento.Size = New System.Drawing.Size(133, 22)
        Me.btnCheckMagento.TabIndex = 0
        Me.btnCheckMagento.Text = "Connect to Magento"
        Me.btnCheckMagento.UseVisualStyleBackColor = True
        '
        'btnCheckIS
        '
        Me.btnCheckIS.Location = New System.Drawing.Point(12, 51)
        Me.btnCheckIS.Name = "btnCheckIS"
        Me.btnCheckIS.Size = New System.Drawing.Size(133, 23)
        Me.btnCheckIS.TabIndex = 1
        Me.btnCheckIS.Text = "Connect to IntraSell"
        Me.btnCheckIS.UseVisualStyleBackColor = True
        '
        'lblMagentoConn
        '
        Me.lblMagentoConn.AutoSize = True
        Me.lblMagentoConn.Location = New System.Drawing.Point(161, 32)
        Me.lblMagentoConn.Name = "lblMagentoConn"
        Me.lblMagentoConn.Size = New System.Drawing.Size(16, 13)
        Me.lblMagentoConn.TabIndex = 2
        Me.lblMagentoConn.Text = "..."
        '
        'lblintraSellConn
        '
        Me.lblintraSellConn.AutoSize = True
        Me.lblintraSellConn.Location = New System.Drawing.Point(161, 56)
        Me.lblintraSellConn.Name = "lblintraSellConn"
        Me.lblintraSellConn.Size = New System.Drawing.Size(16, 13)
        Me.lblintraSellConn.TabIndex = 3
        Me.lblintraSellConn.Text = "..."
        '
        'btnKunden
        '
        Me.btnKunden.Location = New System.Drawing.Point(212, 22)
        Me.btnKunden.Name = "btnKunden"
        Me.btnKunden.Size = New System.Drawing.Size(152, 23)
        Me.btnKunden.TabIndex = 4
        Me.btnKunden.Text = "IS Kunden 2 Magento"
        Me.btnKunden.UseVisualStyleBackColor = True
        '
        'btnExportKategorien
        '
        Me.btnExportKategorien.Location = New System.Drawing.Point(212, 51)
        Me.btnExportKategorien.Name = "btnExportKategorien"
        Me.btnExportKategorien.Size = New System.Drawing.Size(152, 23)
        Me.btnExportKategorien.TabIndex = 5
        Me.btnExportKategorien.Text = "IS Kategorien 2 Magento"
        Me.btnExportKategorien.UseVisualStyleBackColor = True
        '
        'btnExportProducts
        '
        Me.btnExportProducts.Location = New System.Drawing.Point(212, 80)
        Me.btnExportProducts.Name = "btnExportProducts"
        Me.btnExportProducts.Size = New System.Drawing.Size(152, 23)
        Me.btnExportProducts.TabIndex = 6
        Me.btnExportProducts.Text = "IS Produkte 2 Magento"
        Me.btnExportProducts.UseVisualStyleBackColor = True
        '
        'btnImportOrders
        '
        Me.btnImportOrders.Location = New System.Drawing.Point(212, 181)
        Me.btnImportOrders.Name = "btnImportOrders"
        Me.btnImportOrders.Size = New System.Drawing.Size(152, 23)
        Me.btnImportOrders.TabIndex = 7
        Me.btnImportOrders.Text = "Magento 2 IS Orders"
        Me.btnImportOrders.UseVisualStyleBackColor = True
        '
        'txtLog
        '
        Me.txtLog.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.txtLog.Location = New System.Drawing.Point(0, 285)
        Me.txtLog.Multiline = True
        Me.txtLog.Name = "txtLog"
        Me.txtLog.ScrollBars = System.Windows.Forms.ScrollBars.Vertical
        Me.txtLog.Size = New System.Drawing.Size(875, 166)
        Me.txtLog.TabIndex = 8
        '
        'TimerSync
        '
        Me.TimerSync.Enabled = True
        Me.TimerSync.Interval = 60000
        '
        'DateTimePickerOrdersSince
        '
        Me.DateTimePickerOrdersSince.Format = System.Windows.Forms.DateTimePickerFormat.Time
        Me.DateTimePickerOrdersSince.Location = New System.Drawing.Point(424, 184)
        Me.DateTimePickerOrdersSince.Name = "DateTimePickerOrdersSince"
        Me.DateTimePickerOrdersSince.Size = New System.Drawing.Size(101, 20)
        Me.DateTimePickerOrdersSince.TabIndex = 9
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(376, 186)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(32, 13)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "since"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(376, 28)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(34, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "IDNR"
        '
        'txtIDNR
        '
        Me.txtIDNR.Location = New System.Drawing.Point(424, 25)
        Me.txtIDNR.Name = "txtIDNR"
        Me.txtIDNR.Size = New System.Drawing.Size(101, 20)
        Me.txtIDNR.TabIndex = 12
        Me.txtIDNR.Text = "1"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(541, 29)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(70, 13)
        Me.Label3.TabIndex = 13
        Me.Label3.Text = "remove for all"
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(541, 84)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(70, 13)
        Me.Label4.TabIndex = 16
        Me.Label4.Text = "remove for all"
        '
        'txtEAN
        '
        Me.txtEAN.Location = New System.Drawing.Point(424, 80)
        Me.txtEAN.Name = "txtEAN"
        Me.txtEAN.Size = New System.Drawing.Size(101, 20)
        Me.txtEAN.TabIndex = 15
        Me.txtEAN.Text = "D026"
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(376, 83)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(29, 13)
        Me.Label5.TabIndex = 14
        Me.Label5.Text = "EAN"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(748, 9)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(115, 13)
        Me.Label6.TabIndex = 17
        Me.Label6.Text = "Vers. 1.00, 24.05.2014"
        '
        'btnExportLagerstand
        '
        Me.btnExportLagerstand.Location = New System.Drawing.Point(212, 109)
        Me.btnExportLagerstand.Name = "btnExportLagerstand"
        Me.btnExportLagerstand.Size = New System.Drawing.Size(152, 23)
        Me.btnExportLagerstand.TabIndex = 18
        Me.btnExportLagerstand.Text = "IS Lagerstd. 2 Magento"
        Me.btnExportLagerstand.UseVisualStyleBackColor = True
        '
        'btnExportOrderStatus
        '
        Me.btnExportOrderStatus.Location = New System.Drawing.Point(212, 138)
        Me.btnExportOrderStatus.Name = "btnExportOrderStatus"
        Me.btnExportOrderStatus.Size = New System.Drawing.Size(152, 23)
        Me.btnExportOrderStatus.TabIndex = 19
        Me.btnExportOrderStatus.Text = "IS Auftragstatus 2 Magento"
        Me.btnExportOrderStatus.UseVisualStyleBackColor = True
        '
        'FormStart
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(875, 451)
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
        Me.Name = "FormStart"
        Me.Text = "IntraSell <> Magento"
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

End Class
