<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Session
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
        Dim BrancheLabel As System.Windows.Forms.Label
        Me.BrancheComboBox = New System.Windows.Forms.ComboBox()
        Me.AdressenControl1 = New IntraSell_Net.AdressenControl()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.MitarbeiterControl = New IntraSell_Net.MitarbeiterControl()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.DsBranchen = New IntraSell_Net.dsBranchen()
        Me.GrbranchenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrbranchenTableAdapter = New IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter()
        BrancheLabel = New System.Windows.Forms.Label()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'BrancheLabel
        '
        BrancheLabel.AutoSize = True
        BrancheLabel.Location = New System.Drawing.Point(20, 99)
        BrancheLabel.Name = "BrancheLabel"
        BrancheLabel.Size = New System.Drawing.Size(50, 13)
        BrancheLabel.TabIndex = 4
        BrancheLabel.Text = "Branche:"
        '
        'BrancheComboBox
        '
        Me.BrancheComboBox.DataSource = Me.GrbranchenBindingSource
        Me.BrancheComboBox.DisplayMember = "Bezeichnung"
        Me.BrancheComboBox.FormattingEnabled = True
        Me.BrancheComboBox.Location = New System.Drawing.Point(106, 91)
        Me.BrancheComboBox.Name = "BrancheComboBox"
        Me.BrancheComboBox.Size = New System.Drawing.Size(124, 21)
        Me.BrancheComboBox.TabIndex = 5
        Me.BrancheComboBox.ValueMember = "BrNR"
        '
        'AdressenControl1
        '
        Me.AdressenControl1.IDNR = 0
        Me.AdressenControl1.Location = New System.Drawing.Point(106, 60)
        Me.AdressenControl1.Name = "AdressenControl1"
        Me.AdressenControl1.Size = New System.Drawing.Size(136, 25)
        Me.AdressenControl1.TabIndex = 23
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(20, 65)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(38, 13)
        Me.Label9.TabIndex = 24
        Me.Label9.Text = "Kunde"
        '
        'MitarbeiterControl
        '
        Me.MitarbeiterControl.IDNR = 0
        Me.MitarbeiterControl.Location = New System.Drawing.Point(106, 29)
        Me.MitarbeiterControl.Name = "MitarbeiterControl"
        Me.MitarbeiterControl.Size = New System.Drawing.Size(136, 25)
        Me.MitarbeiterControl.TabIndex = 25
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(20, 35)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(59, 13)
        Me.Label8.TabIndex = 26
        Me.Label8.Text = "Mitarbeiter:"
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
        'Session
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(311, 188)
        Me.Controls.Add(Me.MitarbeiterControl)
        Me.Controls.Add(Me.Label8)
        Me.Controls.Add(Me.AdressenControl1)
        Me.Controls.Add(Me.Label9)
        Me.Controls.Add(BrancheLabel)
        Me.Controls.Add(Me.BrancheComboBox)
        Me.Name = "Session"
        Me.Text = "Session"
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents BrancheComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents AdressenControl1 As IntraSell_Net.AdressenControl
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents MitarbeiterControl As IntraSell_Net.MitarbeiterControl
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents DsBranchen As IntraSell_Net.dsBranchen
    Friend WithEvents GrbranchenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrbranchenTableAdapter As IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter
End Class
