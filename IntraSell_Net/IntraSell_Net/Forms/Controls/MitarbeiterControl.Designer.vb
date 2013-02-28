<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MitarbeiterControl
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
        Me.MitarbeiterSelectorButton = New System.Windows.Forms.Button()
        Me.MitarbeiterComboBox = New System.Windows.Forms.ComboBox()
        Me.FlowLayoutPanel1 = New System.Windows.Forms.FlowLayoutPanel()
        Me.FlowLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'MitarbeiterSelectorButton
        '
        Me.MitarbeiterSelectorButton.Enabled = False
        Me.MitarbeiterSelectorButton.Location = New System.Drawing.Point(133, 1)
        Me.MitarbeiterSelectorButton.Margin = New System.Windows.Forms.Padding(1)
        Me.MitarbeiterSelectorButton.Name = "MitarbeiterSelectorButton"
        Me.MitarbeiterSelectorButton.Size = New System.Drawing.Size(20, 23)
        Me.MitarbeiterSelectorButton.TabIndex = 39
        Me.MitarbeiterSelectorButton.Text = "?"
        Me.MitarbeiterSelectorButton.UseVisualStyleBackColor = True
        '
        'MitarbeiterComboBox
        '
        Me.MitarbeiterComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.MitarbeiterComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.MitarbeiterComboBox.DropDownHeight = 100
        Me.MitarbeiterComboBox.DropDownWidth = 400
        Me.MitarbeiterComboBox.FormattingEnabled = True
        Me.MitarbeiterComboBox.IntegralHeight = False
        Me.MitarbeiterComboBox.Location = New System.Drawing.Point(0, 1)
        Me.MitarbeiterComboBox.Margin = New System.Windows.Forms.Padding(0, 1, 1, 1)
        Me.MitarbeiterComboBox.Name = "MitarbeiterComboBox"
        Me.MitarbeiterComboBox.Size = New System.Drawing.Size(131, 21)
        Me.MitarbeiterComboBox.TabIndex = 38
        '
        'FlowLayoutPanel1
        '
        Me.FlowLayoutPanel1.Controls.Add(Me.MitarbeiterComboBox)
        Me.FlowLayoutPanel1.Controls.Add(Me.MitarbeiterSelectorButton)
        Me.FlowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FlowLayoutPanel1.Location = New System.Drawing.Point(0, 0)
        Me.FlowLayoutPanel1.Name = "FlowLayoutPanel1"
        Me.FlowLayoutPanel1.Size = New System.Drawing.Size(155, 25)
        Me.FlowLayoutPanel1.TabIndex = 40
        '
        'MitarbeiterControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.FlowLayoutPanel1)
        Me.Name = "MitarbeiterControl"
        Me.Size = New System.Drawing.Size(155, 25)
        Me.FlowLayoutPanel1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents MitarbeiterSelectorButton As System.Windows.Forms.Button
    Friend WithEvents MitarbeiterComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents FlowLayoutPanel1 As System.Windows.Forms.FlowLayoutPanel

End Class
