<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdressenSelector
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
        Me.dgAdressen = New System.Windows.Forms.DataGridView()
        Me.IDNRDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.VornameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FirmaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AdresseDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PLZDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OrtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.KundengruppeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PreislisteDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LandDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OfAdressenlisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.OfAdressenlisteTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofAdressenlisteTableAdapter()
        Me.btnDetails = New System.Windows.Forms.Button()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        CType(Me.dgAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenlisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(4, 6)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Suche:"
        '
        'txtSuche
        '
        Me.txtSuche.Location = New System.Drawing.Point(49, 3)
        Me.txtSuche.Name = "txtSuche"
        Me.txtSuche.Size = New System.Drawing.Size(100, 20)
        Me.txtSuche.TabIndex = 1
        '
        'btnUebernehmen
        '
        Me.btnUebernehmen.Location = New System.Drawing.Point(271, 0)
        Me.btnUebernehmen.Name = "btnUebernehmen"
        Me.btnUebernehmen.Size = New System.Drawing.Size(132, 23)
        Me.btnUebernehmen.TabIndex = 2
        Me.btnUebernehmen.Text = "Auswahl übernehmen"
        Me.btnUebernehmen.UseVisualStyleBackColor = True
        '
        'dgAdressen
        '
        Me.dgAdressen.AllowUserToAddRows = False
        Me.dgAdressen.AllowUserToDeleteRows = False
        Me.dgAdressen.AutoGenerateColumns = False
        Me.dgAdressen.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgAdressen.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.IDNRDataGridViewTextBoxColumn, Me.NameDataGridViewTextBoxColumn, Me.VornameDataGridViewTextBoxColumn, Me.FirmaDataGridViewTextBoxColumn, Me.AdresseDataGridViewTextBoxColumn, Me.PLZDataGridViewTextBoxColumn, Me.OrtDataGridViewTextBoxColumn, Me.KundengruppeDataGridViewTextBoxColumn, Me.PreislisteDataGridViewTextBoxColumn, Me.LandDataGridViewTextBoxColumn})
        Me.dgAdressen.DataSource = Me.OfAdressenlisteBindingSource
        Me.dgAdressen.Dock = System.Windows.Forms.DockStyle.Fill
        Me.dgAdressen.Location = New System.Drawing.Point(0, 0)
        Me.dgAdressen.Name = "dgAdressen"
        Me.dgAdressen.ReadOnly = True
        Me.dgAdressen.Size = New System.Drawing.Size(544, 263)
        Me.dgAdressen.TabIndex = 3
        '
        'IDNRDataGridViewTextBoxColumn
        '
        Me.IDNRDataGridViewTextBoxColumn.DataPropertyName = "IDNR"
        Me.IDNRDataGridViewTextBoxColumn.HeaderText = "IDNR"
        Me.IDNRDataGridViewTextBoxColumn.Name = "IDNRDataGridViewTextBoxColumn"
        Me.IDNRDataGridViewTextBoxColumn.ReadOnly = True
        '
        'NameDataGridViewTextBoxColumn
        '
        Me.NameDataGridViewTextBoxColumn.DataPropertyName = "Name"
        Me.NameDataGridViewTextBoxColumn.HeaderText = "Name"
        Me.NameDataGridViewTextBoxColumn.Name = "NameDataGridViewTextBoxColumn"
        Me.NameDataGridViewTextBoxColumn.ReadOnly = True
        '
        'VornameDataGridViewTextBoxColumn
        '
        Me.VornameDataGridViewTextBoxColumn.DataPropertyName = "Vorname"
        Me.VornameDataGridViewTextBoxColumn.HeaderText = "Vorname"
        Me.VornameDataGridViewTextBoxColumn.Name = "VornameDataGridViewTextBoxColumn"
        Me.VornameDataGridViewTextBoxColumn.ReadOnly = True
        '
        'FirmaDataGridViewTextBoxColumn
        '
        Me.FirmaDataGridViewTextBoxColumn.DataPropertyName = "Firma"
        Me.FirmaDataGridViewTextBoxColumn.HeaderText = "Firma"
        Me.FirmaDataGridViewTextBoxColumn.Name = "FirmaDataGridViewTextBoxColumn"
        Me.FirmaDataGridViewTextBoxColumn.ReadOnly = True
        '
        'AdresseDataGridViewTextBoxColumn
        '
        Me.AdresseDataGridViewTextBoxColumn.DataPropertyName = "Adresse"
        Me.AdresseDataGridViewTextBoxColumn.HeaderText = "Adresse"
        Me.AdresseDataGridViewTextBoxColumn.Name = "AdresseDataGridViewTextBoxColumn"
        Me.AdresseDataGridViewTextBoxColumn.ReadOnly = True
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
        'KundengruppeDataGridViewTextBoxColumn
        '
        Me.KundengruppeDataGridViewTextBoxColumn.DataPropertyName = "Kundengruppe"
        Me.KundengruppeDataGridViewTextBoxColumn.HeaderText = "Kundengruppe"
        Me.KundengruppeDataGridViewTextBoxColumn.Name = "KundengruppeDataGridViewTextBoxColumn"
        Me.KundengruppeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PreislisteDataGridViewTextBoxColumn
        '
        Me.PreislisteDataGridViewTextBoxColumn.DataPropertyName = "Preisliste"
        Me.PreislisteDataGridViewTextBoxColumn.HeaderText = "Preisliste"
        Me.PreislisteDataGridViewTextBoxColumn.Name = "PreislisteDataGridViewTextBoxColumn"
        Me.PreislisteDataGridViewTextBoxColumn.ReadOnly = True
        '
        'LandDataGridViewTextBoxColumn
        '
        Me.LandDataGridViewTextBoxColumn.DataPropertyName = "Land"
        Me.LandDataGridViewTextBoxColumn.HeaderText = "Land"
        Me.LandDataGridViewTextBoxColumn.Name = "LandDataGridViewTextBoxColumn"
        Me.LandDataGridViewTextBoxColumn.ReadOnly = True
        '
        'OfAdressenlisteBindingSource
        '
        Me.OfAdressenlisteBindingSource.DataMember = "ofAdressenliste"
        Me.OfAdressenlisteBindingSource.DataSource = Me.DsAdressen
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'OfAdressenlisteTableAdapter
        '
        Me.OfAdressenlisteTableAdapter.ClearBeforeFill = True
        '
        'btnDetails
        '
        Me.btnDetails.Location = New System.Drawing.Point(409, 0)
        Me.btnDetails.Name = "btnDetails"
        Me.btnDetails.Size = New System.Drawing.Size(132, 23)
        Me.btnDetails.TabIndex = 3
        Me.btnDetails.Text = "Details"
        Me.btnDetails.UseVisualStyleBackColor = True
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
        Me.SplitContainer1.Panel1.Controls.Add(Me.txtSuche)
        Me.SplitContainer1.Panel1.Controls.Add(Me.btnDetails)
        Me.SplitContainer1.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer1.Panel1.Controls.Add(Me.btnUebernehmen)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.dgAdressen)
        Me.SplitContainer1.Size = New System.Drawing.Size(544, 292)
        Me.SplitContainer1.SplitterDistance = 25
        Me.SplitContainer1.TabIndex = 4
        '
        'AdressenSelector
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(544, 292)
        Me.Controls.Add(Me.SplitContainer1)
        Me.Name = "AdressenSelector"
        Me.Text = "Adressen Selector"
        CType(Me.dgAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenlisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
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
    Friend WithEvents dgAdressen As System.Windows.Forms.DataGridView
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents OfAdressenlisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfAdressenlisteTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofAdressenlisteTableAdapter
    Friend WithEvents IDNRDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents VornameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FirmaDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AdresseDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PLZDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents OrtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents KundengruppeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PreislisteDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LandDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents btnDetails As System.Windows.Forms.Button
    Friend WithEvents SplitContainer1 As System.Windows.Forms.SplitContainer
End Class
