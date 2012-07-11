<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class PLZSelector
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtSuche = New System.Windows.Forms.TextBox()
        Me.btnUebernehmen = New System.Windows.Forms.Button()
        Me.dgPLZ = New System.Windows.Forms.DataGridView()
        Me.GrLandPlzBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsPLZ = New IntraSell_Net.dsPLZ()
        Me.GrLandPlzTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter()
        Me.IdNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PLZDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OrtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.grLandIDNR = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.dgPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 12)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Suche:"
        '
        'txtSuche
        '
        Me.txtSuche.Location = New System.Drawing.Point(57, 9)
        Me.txtSuche.Name = "txtSuche"
        Me.txtSuche.Size = New System.Drawing.Size(100, 20)
        Me.txtSuche.TabIndex = 1
        '
        'btnUebernehmen
        '
        Me.btnUebernehmen.Location = New System.Drawing.Point(417, 7)
        Me.btnUebernehmen.Name = "btnUebernehmen"
        Me.btnUebernehmen.Size = New System.Drawing.Size(132, 23)
        Me.btnUebernehmen.TabIndex = 2
        Me.btnUebernehmen.Text = "Auswahl übernehmen"
        Me.btnUebernehmen.UseVisualStyleBackColor = True
        '
        'dgPLZ
        '
        Me.dgPLZ.AllowUserToAddRows = False
        Me.dgPLZ.AllowUserToDeleteRows = False
        Me.dgPLZ.AutoGenerateColumns = False
        Me.dgPLZ.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgPLZ.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.IdNrDataGridViewTextBoxColumn, Me.NameDataGridViewTextBoxColumn, Me.PLZDataGridViewTextBoxColumn, Me.OrtDataGridViewTextBoxColumn, Me.grLandIDNR})
        Me.dgPLZ.DataSource = Me.GrLandPlzBindingSource
        Me.dgPLZ.Location = New System.Drawing.Point(12, 36)
        Me.dgPLZ.Name = "dgPLZ"
        Me.dgPLZ.ReadOnly = True
        Me.dgPLZ.Size = New System.Drawing.Size(537, 214)
        Me.dgPLZ.TabIndex = 3
        '
        'GrLandPlzBindingSource
        '
        Me.GrLandPlzBindingSource.DataMember = "grLandPlz"
        Me.GrLandPlzBindingSource.DataSource = Me.DsPLZ
        '
        'DsPLZ
        '
        Me.DsPLZ.DataSetName = "dsPLZ"
        Me.DsPLZ.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrLandPlzTableAdapter
        '
        Me.GrLandPlzTableAdapter.ClearBeforeFill = True
        '
        'IdNrDataGridViewTextBoxColumn
        '
        Me.IdNrDataGridViewTextBoxColumn.DataPropertyName = "IdNr"
        Me.IdNrDataGridViewTextBoxColumn.HeaderText = "IdNr"
        Me.IdNrDataGridViewTextBoxColumn.Name = "IdNrDataGridViewTextBoxColumn"
        Me.IdNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.IdNrDataGridViewTextBoxColumn.Visible = False
        Me.IdNrDataGridViewTextBoxColumn.Width = 5
        '
        'NameDataGridViewTextBoxColumn
        '
        Me.NameDataGridViewTextBoxColumn.DataPropertyName = "Name"
        Me.NameDataGridViewTextBoxColumn.HeaderText = "Name"
        Me.NameDataGridViewTextBoxColumn.Name = "NameDataGridViewTextBoxColumn"
        Me.NameDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PLZDataGridViewTextBoxColumn
        '
        Me.PLZDataGridViewTextBoxColumn.DataPropertyName = "PLZ"
        Me.PLZDataGridViewTextBoxColumn.HeaderText = "PLZ"
        Me.PLZDataGridViewTextBoxColumn.Name = "PLZDataGridViewTextBoxColumn"
        Me.PLZDataGridViewTextBoxColumn.ReadOnly = True
        '
        'OrtDataGridViewTextBoxColumn
        '
        Me.OrtDataGridViewTextBoxColumn.DataPropertyName = "Ort"
        Me.OrtDataGridViewTextBoxColumn.HeaderText = "Ort"
        Me.OrtDataGridViewTextBoxColumn.Name = "OrtDataGridViewTextBoxColumn"
        Me.OrtDataGridViewTextBoxColumn.ReadOnly = True
        '
        'grLandIDNR
        '
        Me.grLandIDNR.DataPropertyName = "grLandIDNR"
        Me.grLandIDNR.HeaderText = "grLandIDNR"
        Me.grLandIDNR.Name = "grLandIDNR"
        Me.grLandIDNR.ReadOnly = True
        Me.grLandIDNR.Visible = False
        '
        'PLZSelector
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(561, 262)
        Me.Controls.Add(Me.dgPLZ)
        Me.Controls.Add(Me.btnUebernehmen)
        Me.Controls.Add(Me.txtSuche)
        Me.Controls.Add(Me.Label1)
        Me.Name = "PLZSelector"
        Me.Text = "PLZ Selector"
        CType(Me.dgPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txtSuche As System.Windows.Forms.TextBox
    Friend WithEvents btnUebernehmen As System.Windows.Forms.Button
    Friend WithEvents dgPLZ As System.Windows.Forms.DataGridView
    Friend WithEvents DsPLZ As IntraSell_Net.dsPLZ
    Friend WithEvents GrLandPlzBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrLandPlzTableAdapter As IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter
    Friend WithEvents IdNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PLZDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents OrtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents grLandIDNR As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
