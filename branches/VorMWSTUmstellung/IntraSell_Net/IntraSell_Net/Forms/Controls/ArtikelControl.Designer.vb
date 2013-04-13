<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ArtikelControl
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
        Me.ArtikelSelectorButton = New System.Windows.Forms.Button()
        Me.ArtikelComboBox = New System.Windows.Forms.ComboBox()
        Me.FlowLayoutPanel1 = New System.Windows.Forms.FlowLayoutPanel()
        Me.ContextMenuStrip1 = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.StammdatenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AddNewButton = New System.Windows.Forms.Button()
        Me.FlowLayoutPanel1.SuspendLayout()
        Me.ContextMenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'ArtikelSelectorButton
        '
        Me.ArtikelSelectorButton.Location = New System.Drawing.Point(128, 1)
        Me.ArtikelSelectorButton.Margin = New System.Windows.Forms.Padding(1)
        Me.ArtikelSelectorButton.Name = "ArtikelSelectorButton"
        Me.ArtikelSelectorButton.Size = New System.Drawing.Size(20, 23)
        Me.ArtikelSelectorButton.TabIndex = 39
        Me.ArtikelSelectorButton.Text = "?"
        Me.ArtikelSelectorButton.UseVisualStyleBackColor = True
        '
        'ArtikelComboBox
        '
        Me.ArtikelComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.ArtikelComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.ArtikelComboBox.DropDownHeight = 100
        Me.ArtikelComboBox.DropDownWidth = 400
        Me.ArtikelComboBox.FormattingEnabled = True
        Me.ArtikelComboBox.IntegralHeight = False
        Me.ArtikelComboBox.Location = New System.Drawing.Point(0, 1)
        Me.ArtikelComboBox.Margin = New System.Windows.Forms.Padding(0, 1, 1, 1)
        Me.ArtikelComboBox.Name = "ArtikelComboBox"
        Me.ArtikelComboBox.Size = New System.Drawing.Size(126, 21)
        Me.ArtikelComboBox.TabIndex = 38
        '
        'FlowLayoutPanel1
        '
        Me.FlowLayoutPanel1.Controls.Add(Me.ArtikelComboBox)
        Me.FlowLayoutPanel1.Controls.Add(Me.ArtikelSelectorButton)
        Me.FlowLayoutPanel1.Controls.Add(Me.AddNewButton)
        Me.FlowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FlowLayoutPanel1.Location = New System.Drawing.Point(0, 0)
        Me.FlowLayoutPanel1.Name = "FlowLayoutPanel1"
        Me.FlowLayoutPanel1.Size = New System.Drawing.Size(171, 25)
        Me.FlowLayoutPanel1.TabIndex = 40
        '
        'ContextMenuStrip1
        '
        Me.ContextMenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.StammdatenToolStripMenuItem})
        Me.ContextMenuStrip1.Name = "ContextMenuStrip1"
        Me.ContextMenuStrip1.Size = New System.Drawing.Size(143, 26)
        '
        'StammdatenToolStripMenuItem
        '
        Me.StammdatenToolStripMenuItem.Name = "StammdatenToolStripMenuItem"
        Me.StammdatenToolStripMenuItem.Size = New System.Drawing.Size(142, 22)
        Me.StammdatenToolStripMenuItem.Text = "&Stammdaten"
        '
        'AddNewButton
        '
        Me.AddNewButton.Anchor = System.Windows.Forms.AnchorStyles.Right
        Me.AddNewButton.Location = New System.Drawing.Point(150, 1)
        Me.AddNewButton.Margin = New System.Windows.Forms.Padding(1)
        Me.AddNewButton.Name = "AddNewButton"
        Me.AddNewButton.Size = New System.Drawing.Size(20, 23)
        Me.AddNewButton.TabIndex = 41
        Me.AddNewButton.Text = "+"
        Me.AddNewButton.UseVisualStyleBackColor = True
        Me.AddNewButton.Visible = False
        '
        'ArtikelControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.FlowLayoutPanel1)
        Me.Name = "ArtikelControl"
        Me.Size = New System.Drawing.Size(171, 25)
        Me.FlowLayoutPanel1.ResumeLayout(False)
        Me.ContextMenuStrip1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ArtikelSelectorButton As System.Windows.Forms.Button
    Friend WithEvents ArtikelComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents FlowLayoutPanel1 As System.Windows.Forms.FlowLayoutPanel
    Friend WithEvents ContextMenuStrip1 As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents StammdatenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AddNewButton As System.Windows.Forms.Button

End Class
