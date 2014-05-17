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
        Me.components = New System.ComponentModel.Container()
        Me.SelectorButton = New System.Windows.Forms.Button()
        Me.AdressenComboBox = New System.Windows.Forms.ComboBox()
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.FlowLayoutPanel1 = New System.Windows.Forms.FlowLayoutPanel()
        Me.AddNewButton = New System.Windows.Forms.Button()
        Me.ResizeCheckBox = New System.Windows.Forms.CheckBox()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.FlowLayoutPanel1.SuspendLayout()
        Me.SuspendLayout()
        '
        'SelectorButton
        '
        Me.SelectorButton.Anchor = System.Windows.Forms.AnchorStyles.Right
        Me.SelectorButton.Location = New System.Drawing.Point(128, 3)
        Me.SelectorButton.Margin = New System.Windows.Forms.Padding(1)
        Me.SelectorButton.Name = "SelectorButton"
        Me.SelectorButton.Size = New System.Drawing.Size(20, 23)
        Me.SelectorButton.TabIndex = 39
        Me.SelectorButton.Text = "?"
        Me.SelectorButton.UseVisualStyleBackColor = True
        '
        'AdressenComboBox
        '
        Me.AdressenComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.AdressenComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.AdressenComboBox.ContextMenuStrip = Me.ContextMenuStrip1
        Me.AdressenComboBox.DropDownHeight = 100
        Me.AdressenComboBox.DropDownWidth = 400
        Me.AdressenComboBox.FormattingEnabled = True
        Me.AdressenComboBox.IntegralHeight = False
        Me.AdressenComboBox.Location = New System.Drawing.Point(0, 1)
        Me.AdressenComboBox.Margin = New System.Windows.Forms.Padding(0, 1, 1, 1)
        Me.AdressenComboBox.Name = "AdressenComboBox"
        Me.AdressenComboBox.Size = New System.Drawing.Size(126, 21)
        Me.AdressenComboBox.TabIndex = 38
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripMenuItem1})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(135, 26)
        '
        'ToolStripMenuItem1
        '
        Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
        Me.ToolStripMenuItem1.Size = New System.Drawing.Size(134, 22)
        Me.ToolStripMenuItem1.Text = "Stammdaten"
        '
        'FlowLayoutPanel1
        '
        Me.FlowLayoutPanel1.Controls.Add(Me.AdressenComboBox)
        Me.FlowLayoutPanel1.Controls.Add(Me.SelectorButton)
        Me.FlowLayoutPanel1.Controls.Add(Me.AddNewButton)
        Me.FlowLayoutPanel1.Controls.Add(Me.ResizeCheckBox)
        Me.FlowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FlowLayoutPanel1.Location = New System.Drawing.Point(0, 0)
        Me.FlowLayoutPanel1.Name = "FlowLayoutPanel1"
        Me.FlowLayoutPanel1.Size = New System.Drawing.Size(231, 25)
        Me.FlowLayoutPanel1.TabIndex = 40
        '
        'AddNewButton
        '
        Me.AddNewButton.Anchor = System.Windows.Forms.AnchorStyles.Right
        Me.AddNewButton.Location = New System.Drawing.Point(150, 3)
        Me.AddNewButton.Margin = New System.Windows.Forms.Padding(1)
        Me.AddNewButton.Name = "AddNewButton"
        Me.AddNewButton.Size = New System.Drawing.Size(20, 23)
        Me.AddNewButton.TabIndex = 40
        Me.AddNewButton.Text = "+"
        Me.AddNewButton.UseVisualStyleBackColor = True
        Me.AddNewButton.Visible = False
        '
        'ResizeCheckBox
        '
        Me.ResizeCheckBox.Appearance = System.Windows.Forms.Appearance.Button
        Me.ResizeCheckBox.AutoSize = True
        Me.ResizeCheckBox.Location = New System.Drawing.Point(174, 3)
        Me.ResizeCheckBox.Name = "ResizeCheckBox"
        Me.ResizeCheckBox.Size = New System.Drawing.Size(20, 23)
        Me.ResizeCheckBox.TabIndex = 41
        Me.ResizeCheckBox.Text = "."
        Me.ResizeCheckBox.UseVisualStyleBackColor = True
        '
        'AdressenControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.FlowLayoutPanel1)
        Me.Name = "AdressenControl"
        Me.Size = New System.Drawing.Size(231, 25)
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.FlowLayoutPanel1.ResumeLayout(False)
        Me.FlowLayoutPanel1.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents SelectorButton As System.Windows.Forms.Button
    Friend WithEvents AdressenComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents FlowLayoutPanel1 As System.Windows.Forms.FlowLayoutPanel
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AddNewButton As System.Windows.Forms.Button
    Friend WithEvents ResizeCheckBox As System.Windows.Forms.CheckBox

End Class
