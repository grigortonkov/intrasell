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
        Me.IdNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PLZDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OrtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.grLandIDNR = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GrLandPlzBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsPLZ = New IntraSell_Net.dsPLZ()
        Me.GrLandPlzTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        CType(Me.dgPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(3, 6)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Suche:"
        '
        'txtSuche
        '
        Me.txtSuche.Location = New System.Drawing.Point(48, 3)
        Me.txtSuche.Name = "txtSuche"
        Me.txtSuche.Size = New System.Drawing.Size(100, 20)
        Me.txtSuche.TabIndex = 1
        '
        'btnUebernehmen
        '
        Me.btnUebernehmen.Location = New System.Drawing.Point(408, 1)
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
        Me.dgPLZ.Dock = System.Windows.Forms.DockStyle.Fill
        Me.dgPLZ.Location = New System.Drawing.Point(0, 0)
        Me.dgPLZ.Name = "dgPLZ"
        Me.dgPLZ.ReadOnly = True
        Me.dgPLZ.Size = New System.Drawing.Size(544, 263)
        Me.dgPLZ.TabIndex = 3
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
        Me.NameDataGridViewTextBoxColumn.HeaderText = "Land"
        Me.NameDataGridViewTextBoxColumn.Name = "NameDataGridViewTextBoxColumn"
        Me.NameDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PLZDataGridViewTextBoxColumn
        '
        Me.PLZDataGridViewTextBoxColumn.DataPropertyName = "PLZ"
        Me.PLZDataGridViewTextBoxColumn.HeaderText = "PLZ"
        Me.PLZDataGridViewTextBoxColumn.Name = "PLZDataGridViewTextBoxColumn"
        Me.PLZDataGridViewTextBoxColumn.ReadOnly = True
        Me.PLZDataGridViewTextBoxColumn.Width = 75
        '
        'OrtDataGridViewTextBoxColumn
        '
        Me.OrtDataGridViewTextBoxColumn.DataPropertyName = "Ort"
        Me.OrtDataGridViewTextBoxColumn.HeaderText = "Ort"
        Me.OrtDataGridViewTextBoxColumn.Name = "OrtDataGridViewTextBoxColumn"
        Me.OrtDataGridViewTextBoxColumn.ReadOnly = True
        Me.OrtDataGridViewTextBoxColumn.Width = 200
        '
        'grLandIDNR
        '
        Me.grLandIDNR.DataPropertyName = "grLandIDNR"
        Me.grLandIDNR.HeaderText = "grLandIDNR"
        Me.grLandIDNR.Name = "grLandIDNR"
        Me.grLandIDNR.ReadOnly = True
        Me.grLandIDNR.Visible = False
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
        Me.SplitContainer1.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer1.Panel1.Controls.Add(Me.txtSuche)
        Me.SplitContainer1.Panel1.Controls.Add(Me.btnUebernehmen)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.dgPLZ)
        Me.SplitContainer1.Size = New System.Drawing.Size(544, 292)
        Me.SplitContainer1.SplitterDistance = 25
        Me.SplitContainer1.TabIndex = 4
        '
        'PLZSelector
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(544, 292)
        Me.Controls.Add(Me.SplitContainer1)
        Me.Name = "PLZSelector"
        Me.Text = "PLZ Selector"
        CType(Me.dgPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel1.PerformLayout()
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.ResumeLayout(False)
        Me.ResumeLayout(False)

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
    Friend WithEvents SplitContainer1 As System.Windows.Forms.SplitContainer
End Class
