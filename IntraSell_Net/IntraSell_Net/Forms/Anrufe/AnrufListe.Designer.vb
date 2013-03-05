<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Anrufliste
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
        Me.FilterButton = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.PLZVonTextBox = New System.Windows.Forms.TextBox()
        Me.PLZBisTextBox = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.KundengruppeComboBox = New System.Windows.Forms.ComboBox()
        Me.PreislisteComboBox = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.OfAdressenlisteDataGridView = New System.Windows.Forms.DataGridView()
        Me.AnruflisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsAnrufe = New IntraSell_Net.dsAnrufe()
        Me.OfanrufeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.MitarbeiterControl = New IntraSell_Net.MitarbeiterControl()
        Me.AdressenControl1 = New IntraSell_Net.AdressenControl()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.LandComboBox = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.OfanrufeTableAdapter = New IntraSell_Net.dsAnrufeTableAdapters.ofanrufeTableAdapter()
        Me.AnruflisteTableAdapter = New IntraSell_Net.dsAnrufeTableAdapters.AnruflisteTableAdapter()
        Me.AnrufNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Firma = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NotizenDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NAnrufDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BeginZeitDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EndeZeitDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MitarbeiterNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Adresse = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PLZ = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Ort = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AdrNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LAenderungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LKontaktDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Tel = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Mobil = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Email = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.AnruflisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsAnrufe, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfanrufeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        Me.SuspendLayout()
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(15, 213)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 10
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 98)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(30, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "PLZ:"
        '
        'PLZVonTextBox
        '
        Me.PLZVonTextBox.Location = New System.Drawing.Point(98, 95)
        Me.PLZVonTextBox.Name = "PLZVonTextBox"
        Me.PLZVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZVonTextBox.TabIndex = 2
        '
        'PLZBisTextBox
        '
        Me.PLZBisTextBox.Location = New System.Drawing.Point(172, 95)
        Me.PLZBisTextBox.Name = "PLZBisTextBox"
        Me.PLZBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZBisTextBox.TabIndex = 3
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(156, 98)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 124)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(80, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Kundengruppe:"
        '
        'KundengruppeComboBox
        '
        Me.KundengruppeComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.KundengruppeComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.KundengruppeComboBox.FormattingEnabled = True
        Me.KundengruppeComboBox.Location = New System.Drawing.Point(98, 121)
        Me.KundengruppeComboBox.Name = "KundengruppeComboBox"
        Me.KundengruppeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.KundengruppeComboBox.TabIndex = 4
        '
        'PreislisteComboBox
        '
        Me.PreislisteComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.PreislisteComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.PreislisteComboBox.FormattingEnabled = True
        Me.PreislisteComboBox.Location = New System.Drawing.Point(98, 148)
        Me.PreislisteComboBox.Name = "PreislisteComboBox"
        Me.PreislisteComboBox.Size = New System.Drawing.Size(126, 21)
        Me.PreislisteComboBox.TabIndex = 5
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 151)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(51, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Preisliste:"
        '
        'OfAdressenlisteDataGridView
        '
        Me.OfAdressenlisteDataGridView.AllowUserToAddRows = False
        Me.OfAdressenlisteDataGridView.AllowUserToDeleteRows = False
        Me.OfAdressenlisteDataGridView.AllowUserToOrderColumns = True
        Me.OfAdressenlisteDataGridView.AutoGenerateColumns = False
        Me.OfAdressenlisteDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.OfAdressenlisteDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.AnrufNrDataGridViewTextBoxColumn, Me.Firma, Me.NotizenDataGridViewTextBoxColumn, Me.NAnrufDataGridViewTextBoxColumn, Me.BeginZeitDataGridViewTextBoxColumn, Me.EndeZeitDataGridViewTextBoxColumn, Me.MitarbeiterNrDataGridViewTextBoxColumn, Me.Adresse, Me.PLZ, Me.Ort, Me.AdrNrDataGridViewTextBoxColumn, Me.LAenderungDataGridViewTextBoxColumn, Me.LKontaktDataGridViewTextBoxColumn, Me.Tel, Me.Mobil, Me.Email})
        Me.OfAdressenlisteDataGridView.DataSource = Me.AnruflisteBindingSource
        Me.OfAdressenlisteDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfAdressenlisteDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.OfAdressenlisteDataGridView.Name = "OfAdressenlisteDataGridView"
        Me.OfAdressenlisteDataGridView.ReadOnly = True
        Me.OfAdressenlisteDataGridView.Size = New System.Drawing.Size(770, 794)
        Me.OfAdressenlisteDataGridView.TabIndex = 6
        '
        'AnruflisteBindingSource
        '
        Me.AnruflisteBindingSource.DataMember = "Anrufliste"
        Me.AnruflisteBindingSource.DataSource = Me.DsAnrufe
        '
        'DsAnrufe
        '
        Me.DsAnrufe.DataSetName = "dsAnrufe"
        Me.DsAnrufe.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'OfanrufeBindingSource
        '
        Me.OfanrufeBindingSource.DataMember = "ofanrufe"
        Me.OfanrufeBindingSource.DataSource = Me.DsAnrufe
        '
        'SplitContainer
        '
        Me.SplitContainer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer.FixedPanel = System.Windows.Forms.FixedPanel.Panel1
        Me.SplitContainer.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.MitarbeiterControl)
        Me.SplitContainer.Panel1.Controls.Add(Me.AdressenControl1)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label9)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label8)
        Me.SplitContainer.Panel1.Controls.Add(Me.LandComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label5)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer.Panel1.Controls.Add(Me.FilterButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreislisteComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.PLZVonTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label4)
        Me.SplitContainer.Panel1.Controls.Add(Me.PLZBisTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.KundengruppeComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label2)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label3)
        '
        'SplitContainer.Panel2
        '
        Me.SplitContainer.Panel2.Controls.Add(Me.OfAdressenlisteDataGridView)
        Me.SplitContainer.Size = New System.Drawing.Size(1012, 794)
        Me.SplitContainer.SplitterDistance = 238
        Me.SplitContainer.TabIndex = 11
        '
        'MitarbeiterControl
        '
        Me.MitarbeiterControl.IDNR = 0
        Me.MitarbeiterControl.Location = New System.Drawing.Point(98, 175)
        Me.MitarbeiterControl.Name = "MitarbeiterControl"
        Me.MitarbeiterControl.Size = New System.Drawing.Size(136, 25)
        Me.MitarbeiterControl.TabIndex = 6
        '
        'AdressenControl1
        '
        Me.AdressenControl1.IDNR = 0
        Me.AdressenControl1.Location = New System.Drawing.Point(98, 40)
        Me.AdressenControl1.Name = "AdressenControl1"
        Me.AdressenControl1.Size = New System.Drawing.Size(136, 25)
        Me.AdressenControl1.TabIndex = 0
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(12, 45)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(38, 13)
        Me.Label9.TabIndex = 22
        Me.Label9.Text = "Kunde"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(12, 181)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(59, 13)
        Me.Label8.TabIndex = 21
        Me.Label8.Text = "Mitarbeiter:"
        '
        'LandComboBox
        '
        Me.LandComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.LandComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.LandComboBox.FormattingEnabled = True
        Me.LandComboBox.Location = New System.Drawing.Point(98, 68)
        Me.LandComboBox.Name = "LandComboBox"
        Me.LandComboBox.Size = New System.Drawing.Size(126, 21)
        Me.LandComboBox.TabIndex = 1
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 71)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(34, 13)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Land:"
        '
        'OfanrufeTableAdapter
        '
        Me.OfanrufeTableAdapter.ClearBeforeFill = True
        '
        'AnruflisteTableAdapter
        '
        Me.AnruflisteTableAdapter.ClearBeforeFill = True
        '
        'AnrufNrDataGridViewTextBoxColumn
        '
        Me.AnrufNrDataGridViewTextBoxColumn.DataPropertyName = "AnrufNr"
        Me.AnrufNrDataGridViewTextBoxColumn.HeaderText = "AnrufNr"
        Me.AnrufNrDataGridViewTextBoxColumn.Name = "AnrufNrDataGridViewTextBoxColumn"
        Me.AnrufNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.AnrufNrDataGridViewTextBoxColumn.Visible = False
        '
        'Firma
        '
        Me.Firma.DataPropertyName = "Firma"
        Me.Firma.HeaderText = "Firma"
        Me.Firma.Name = "Firma"
        Me.Firma.ReadOnly = True
        '
        'NotizenDataGridViewTextBoxColumn
        '
        Me.NotizenDataGridViewTextBoxColumn.DataPropertyName = "Notizen"
        Me.NotizenDataGridViewTextBoxColumn.FillWeight = 300.0!
        Me.NotizenDataGridViewTextBoxColumn.HeaderText = "Notizen"
        Me.NotizenDataGridViewTextBoxColumn.Name = "NotizenDataGridViewTextBoxColumn"
        Me.NotizenDataGridViewTextBoxColumn.ReadOnly = True
        Me.NotizenDataGridViewTextBoxColumn.Width = 300
        '
        'NAnrufDataGridViewTextBoxColumn
        '
        Me.NAnrufDataGridViewTextBoxColumn.DataPropertyName = "NAnruf"
        Me.NAnrufDataGridViewTextBoxColumn.HeaderText = "NAnruf"
        Me.NAnrufDataGridViewTextBoxColumn.Name = "NAnrufDataGridViewTextBoxColumn"
        Me.NAnrufDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BeginZeitDataGridViewTextBoxColumn
        '
        Me.BeginZeitDataGridViewTextBoxColumn.DataPropertyName = "BeginZeit"
        Me.BeginZeitDataGridViewTextBoxColumn.HeaderText = "BeginZeit"
        Me.BeginZeitDataGridViewTextBoxColumn.Name = "BeginZeitDataGridViewTextBoxColumn"
        Me.BeginZeitDataGridViewTextBoxColumn.ReadOnly = True
        '
        'EndeZeitDataGridViewTextBoxColumn
        '
        Me.EndeZeitDataGridViewTextBoxColumn.DataPropertyName = "EndeZeit"
        Me.EndeZeitDataGridViewTextBoxColumn.HeaderText = "EndeZeit"
        Me.EndeZeitDataGridViewTextBoxColumn.Name = "EndeZeitDataGridViewTextBoxColumn"
        Me.EndeZeitDataGridViewTextBoxColumn.ReadOnly = True
        '
        'MitarbeiterNrDataGridViewTextBoxColumn
        '
        Me.MitarbeiterNrDataGridViewTextBoxColumn.DataPropertyName = "MitarbeiterName"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.HeaderText = "Mitarbeiter"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.Name = "MitarbeiterNrDataGridViewTextBoxColumn"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'Adresse
        '
        Me.Adresse.DataPropertyName = "Adresse"
        Me.Adresse.HeaderText = "Adresse"
        Me.Adresse.Name = "Adresse"
        Me.Adresse.ReadOnly = True
        '
        'PLZ
        '
        Me.PLZ.DataPropertyName = "PLZ"
        Me.PLZ.HeaderText = "PLZ"
        Me.PLZ.Name = "PLZ"
        Me.PLZ.ReadOnly = True
        '
        'Ort
        '
        Me.Ort.DataPropertyName = "Ort"
        Me.Ort.HeaderText = "Ort"
        Me.Ort.Name = "Ort"
        Me.Ort.ReadOnly = True
        '
        'AdrNrDataGridViewTextBoxColumn
        '
        Me.AdrNrDataGridViewTextBoxColumn.DataPropertyName = "AdrNr"
        Me.AdrNrDataGridViewTextBoxColumn.HeaderText = "AdrNr"
        Me.AdrNrDataGridViewTextBoxColumn.Name = "AdrNrDataGridViewTextBoxColumn"
        Me.AdrNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.AdrNrDataGridViewTextBoxColumn.Visible = False
        '
        'LAenderungDataGridViewTextBoxColumn
        '
        Me.LAenderungDataGridViewTextBoxColumn.DataPropertyName = "LAenderung"
        Me.LAenderungDataGridViewTextBoxColumn.HeaderText = "LAenderung"
        Me.LAenderungDataGridViewTextBoxColumn.Name = "LAenderungDataGridViewTextBoxColumn"
        Me.LAenderungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'LKontaktDataGridViewTextBoxColumn
        '
        Me.LKontaktDataGridViewTextBoxColumn.DataPropertyName = "LKontakt"
        Me.LKontaktDataGridViewTextBoxColumn.HeaderText = "LKontakt"
        Me.LKontaktDataGridViewTextBoxColumn.Name = "LKontaktDataGridViewTextBoxColumn"
        Me.LKontaktDataGridViewTextBoxColumn.ReadOnly = True
        '
        'Tel
        '
        Me.Tel.DataPropertyName = "Tel"
        Me.Tel.HeaderText = "Tel"
        Me.Tel.Name = "Tel"
        Me.Tel.ReadOnly = True
        '
        'Mobil
        '
        Me.Mobil.DataPropertyName = "Mobil"
        Me.Mobil.HeaderText = "Mobil"
        Me.Mobil.Name = "Mobil"
        Me.Mobil.ReadOnly = True
        '
        'Email
        '
        Me.Email.DataPropertyName = "Email"
        Me.Email.HeaderText = "Email"
        Me.Email.Name = "Email"
        Me.Email.ReadOnly = True
        '
        'Anrufliste
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1012, 794)
        Me.Controls.Add(Me.SplitContainer)
        Me.Name = "Anrufliste"
        Me.Text = "Anrufliste"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.AnruflisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsAnrufe, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfanrufeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.Panel1.ResumeLayout(False)
        Me.SplitContainer.Panel1.PerformLayout()
        Me.SplitContainer.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents FilterButton As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents PLZVonTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PLZBisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents KundengruppeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents PreislisteComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents OfAdressenlisteDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
    Friend WithEvents LandComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents DsAnrufe As IntraSell_Net.dsAnrufe
    Friend WithEvents OfanrufeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfanrufeTableAdapter As IntraSell_Net.dsAnrufeTableAdapters.ofanrufeTableAdapter
    Friend WithEvents AnruflisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents AnruflisteTableAdapter As IntraSell_Net.dsAnrufeTableAdapters.AnruflisteTableAdapter
    Friend WithEvents AdressenControl1 As IntraSell_Net.AdressenControl
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents MitarbeiterControl As IntraSell_Net.MitarbeiterControl
    Friend WithEvents AnrufNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Firma As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NotizenDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NAnrufDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BeginZeitDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EndeZeitDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MitarbeiterNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Adresse As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PLZ As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Ort As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AdrNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LAenderungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LKontaktDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Tel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Mobil As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Email As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
