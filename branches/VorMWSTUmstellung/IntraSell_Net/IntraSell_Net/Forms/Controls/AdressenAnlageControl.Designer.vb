<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdressenAnlageControl
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
        Dim BrancheLabel As System.Windows.Forms.Label
        Me.AdresseTextBox = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        Me.BrancheComboBox = New System.Windows.Forms.ComboBox()
        Me.DsBranchen = New IntraSell_Net.dsBranchen()
        Me.GrbranchenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrbranchenTableAdapter = New IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter()
        BrancheLabel = New System.Windows.Forms.Label()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'AdresseTextBox
        '
        Me.AdresseTextBox.Dock = System.Windows.Forms.DockStyle.Fill
        Me.AdresseTextBox.Location = New System.Drawing.Point(0, 0)
        Me.AdresseTextBox.Multiline = True
        Me.AdresseTextBox.Name = "AdresseTextBox"
        Me.AdresseTextBox.Size = New System.Drawing.Size(288, 168)
        Me.AdresseTextBox.TabIndex = 0
        Me.AdresseTextBox.Text = "FIRMA" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "PLZ ORT " & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "STRASSE NR" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "TEL"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Cursor = System.Windows.Forms.Cursors.Hand
        Me.Label1.ForeColor = System.Drawing.Color.Blue
        Me.Label1.Location = New System.Drawing.Point(3, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(167, 13)
        Me.Label1.TabIndex = 1
        Me.Label1.Text = "Adresse von Herold hier kopieren:"
        '
        'SplitContainer1
        '
        Me.SplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1
        Me.SplitContainer1.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer1.Name = "SplitContainer1"
        Me.SplitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal
        '
        'SplitContainer1.Panel1
        '
        Me.SplitContainer1.Panel1.Controls.Add(BrancheLabel)
        Me.SplitContainer1.Panel1.Controls.Add(Me.BrancheComboBox)
        Me.SplitContainer1.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer1.Panel1MinSize = 40
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.AdresseTextBox)
        Me.SplitContainer1.Size = New System.Drawing.Size(288, 212)
        Me.SplitContainer1.SplitterDistance = 40
        Me.SplitContainer1.TabIndex = 2
        '
        'BrancheLabel
        '
        BrancheLabel.AutoSize = True
        BrancheLabel.Location = New System.Drawing.Point(3, 19)
        BrancheLabel.Name = "BrancheLabel"
        BrancheLabel.Size = New System.Drawing.Size(50, 13)
        BrancheLabel.TabIndex = 2
        BrancheLabel.Text = "Branche:"
        '
        'BrancheComboBox
        '
        Me.BrancheComboBox.DataSource = Me.GrbranchenBindingSource
        Me.BrancheComboBox.DisplayMember = "Bezeichnung"
        Me.BrancheComboBox.FormattingEnabled = True
        Me.BrancheComboBox.Location = New System.Drawing.Point(59, 16)
        Me.BrancheComboBox.Name = "BrancheComboBox"
        Me.BrancheComboBox.Size = New System.Drawing.Size(111, 21)
        Me.BrancheComboBox.TabIndex = 3
        Me.BrancheComboBox.ValueMember = "BrNR"
        '
        'DsBranchen
        '
        Me.DsBranchen.DataSetName = "dsBranchen"
        Me.DsBranchen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrbranchenBindingSource
        '
        Me.GrbranchenBindingSource.DataMember = "grbranchen"
        Me.GrbranchenBindingSource.DataSource = Me.DsBranchen
        '
        'GrbranchenTableAdapter
        '
        Me.GrbranchenTableAdapter.ClearBeforeFill = True
        '
        'AdressenAnlageControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.SplitContainer1)
        Me.Name = "AdressenAnlageControl"
        Me.Size = New System.Drawing.Size(288, 212)
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel1.PerformLayout()
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        Me.SplitContainer1.Panel2.PerformLayout()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.ResumeLayout(False)
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents AdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents SplitContainer1 As System.Windows.Forms.SplitContainer
    Friend WithEvents BrancheComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents GrbranchenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents DsBranchen As IntraSell_Net.dsBranchen
    Friend WithEvents GrbranchenTableAdapter As IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter

End Class
