<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdressenControl
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
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
        Me.ArtikelSelectorButton = New System.Windows.Forms.Button()
        Me.AdressenComboBox = New System.Windows.Forms.ComboBox()
        Me.FlowLayoutPanel1 = New System.Windows.Forms.FlowLayoutPanel()
        Me.FlowLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'ArtikelSelectorButton
        '
        Me.ArtikelSelectorButton.Anchor = System.Windows.Forms.AnchorStyles.Right
        Me.ArtikelSelectorButton.Location = New System.Drawing.Point(133, 1)
        Me.ArtikelSelectorButton.Margin = New System.Windows.Forms.Padding(1)
        Me.ArtikelSelectorButton.Name = "ArtikelSelectorButton"
        Me.ArtikelSelectorButton.Size = New System.Drawing.Size(20, 23)
        Me.ArtikelSelectorButton.TabIndex = 39
        Me.ArtikelSelectorButton.Text = "?"
        Me.ArtikelSelectorButton.UseVisualStyleBackColor = True
        '
        'AdressenComboBox
        '
        Me.AdressenComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.AdressenComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.AdressenComboBox.DropDownHeight = 100
        Me.AdressenComboBox.DropDownWidth = 400
        Me.AdressenComboBox.FormattingEnabled = True
        Me.AdressenComboBox.IntegralHeight = False
        Me.AdressenComboBox.Location = New System.Drawing.Point(0, 1)
        Me.AdressenComboBox.Margin = New System.Windows.Forms.Padding(0, 1, 1, 1)
        Me.AdressenComboBox.Name = "AdressenComboBox"
        Me.AdressenComboBox.Size = New System.Drawing.Size(131, 21)
        Me.AdressenComboBox.TabIndex = 38
        '
        'FlowLayoutPanel1
        '
        Me.FlowLayoutPanel1.Controls.Add(Me.AdressenComboBox)
        Me.FlowLayoutPanel1.Controls.Add(Me.ArtikelSelectorButton)
        Me.FlowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FlowLayoutPanel1.Location = New System.Drawing.Point(0, 0)
        Me.FlowLayoutPanel1.Name = "FlowLayoutPanel1"
        Me.FlowLayoutPanel1.Size = New System.Drawing.Size(155, 25)
        Me.FlowLayoutPanel1.TabIndex = 40
        '
        'AdressenControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.FlowLayoutPanel1)
        Me.Name = "AdressenControl"
        Me.Size = New System.Drawing.Size(155, 25)
        Me.FlowLayoutPanel1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ArtikelSelectorButton As System.Windows.Forms.Button
    Friend WithEvents AdressenComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents FlowLayoutPanel1 As System.Windows.Forms.FlowLayoutPanel

End Class
