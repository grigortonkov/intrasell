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
        Me.btnCheckMagento = New System.Windows.Forms.Button()
        Me.btnCheckIS = New System.Windows.Forms.Button()
        Me.lblMagentoConn = New System.Windows.Forms.Label()
        Me.lblintraSellConn = New System.Windows.Forms.Label()
        Me.btnKunden = New System.Windows.Forms.Button()
        Me.btnExportKategorien = New System.Windows.Forms.Button()
        Me.btnExportProducts = New System.Windows.Forms.Button()
        Me.btnImportOrders = New System.Windows.Forms.Button()
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
        Me.btnKunden.Location = New System.Drawing.Point(231, 22)
        Me.btnKunden.Name = "btnKunden"
        Me.btnKunden.Size = New System.Drawing.Size(133, 23)
        Me.btnKunden.TabIndex = 4
        Me.btnKunden.Text = "IS Kunden 2 Magento"
        Me.btnKunden.UseVisualStyleBackColor = True
        '
        'btnExportKategorien
        '
        Me.btnExportKategorien.Location = New System.Drawing.Point(231, 51)
        Me.btnExportKategorien.Name = "btnExportKategorien"
        Me.btnExportKategorien.Size = New System.Drawing.Size(133, 23)
        Me.btnExportKategorien.TabIndex = 5
        Me.btnExportKategorien.Text = "IS Kategorien 2 Magento"
        Me.btnExportKategorien.UseVisualStyleBackColor = True
        '
        'btnExportProducts
        '
        Me.btnExportProducts.Location = New System.Drawing.Point(231, 80)
        Me.btnExportProducts.Name = "btnExportProducts"
        Me.btnExportProducts.Size = New System.Drawing.Size(133, 23)
        Me.btnExportProducts.TabIndex = 6
        Me.btnExportProducts.Text = "IS Produkte 2 Magento"
        Me.btnExportProducts.UseVisualStyleBackColor = True
        '
        'btnImportOrders
        '
        Me.btnImportOrders.Location = New System.Drawing.Point(462, 22)
        Me.btnImportOrders.Name = "btnImportOrders"
        Me.btnImportOrders.Size = New System.Drawing.Size(133, 23)
        Me.btnImportOrders.TabIndex = 7
        Me.btnImportOrders.Text = "Magento 2 IS Orders"
        Me.btnImportOrders.UseVisualStyleBackColor = True
        '
        'FormStart
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(757, 193)
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

End Class
