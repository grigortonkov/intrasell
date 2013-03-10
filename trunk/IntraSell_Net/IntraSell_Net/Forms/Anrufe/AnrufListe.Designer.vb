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
        Me.AnrufNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AdrNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Firma = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NotizenDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NAnrufDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BeginZeitDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EndeZeitDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MitarbeiterNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Angebot = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.WeitereInformationen = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.Wettbewerb = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Adresse = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PLZ = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Ort = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LAenderungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LKontaktDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Tel = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Mobil = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Email = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AnruflisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsAnrufe = New IntraSell_Net.dsAnrufe()
        Me.OfanrufeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.WettberwerbCheckBox = New System.Windows.Forms.CheckBox()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.AngebotToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.InfoCheckBox = New System.Windows.Forms.CheckBox()
        Me.AngebotCheckBox = New System.Windows.Forms.CheckBox()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.NotizTextBox = New System.Windows.Forms.TextBox()
        Me.BeginZeitBisDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.BeginZeitVonDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.MitarbeiterControl = New IntraSell_Net.MitarbeiterControl()
        Me.AdressenControl1 = New IntraSell_Net.AdressenControl()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.LandComboBox = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.OfanrufeTableAdapter = New IntraSell_Net.dsAnrufeTableAdapters.ofanrufeTableAdapter()
        Me.AnruflisteTableAdapter = New IntraSell_Net.dsAnrufeTableAdapters.AnruflisteTableAdapter()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.AnruflisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsAnrufe, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfanrufeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(16, 362)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 12
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 122)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(30, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "PLZ:"
        '
        'PLZVonTextBox
        '
        Me.PLZVonTextBox.Location = New System.Drawing.Point(98, 119)
        Me.PLZVonTextBox.Name = "PLZVonTextBox"
        Me.PLZVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZVonTextBox.TabIndex = 4
        '
        'PLZBisTextBox
        '
        Me.PLZBisTextBox.Location = New System.Drawing.Point(172, 119)
        Me.PLZBisTextBox.Name = "PLZBisTextBox"
        Me.PLZBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZBisTextBox.TabIndex = 5
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(156, 122)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 148)
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
        Me.KundengruppeComboBox.Location = New System.Drawing.Point(98, 145)
        Me.KundengruppeComboBox.Name = "KundengruppeComboBox"
        Me.KundengruppeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.KundengruppeComboBox.TabIndex = 6
        '
        'PreislisteComboBox
        '
        Me.PreislisteComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.PreislisteComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.PreislisteComboBox.FormattingEnabled = True
        Me.PreislisteComboBox.Location = New System.Drawing.Point(98, 172)
        Me.PreislisteComboBox.Name = "PreislisteComboBox"
        Me.PreislisteComboBox.Size = New System.Drawing.Size(126, 21)
        Me.PreislisteComboBox.TabIndex = 7
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 175)
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
        Me.OfAdressenlisteDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.AnrufNrDataGridViewTextBoxColumn, Me.AdrNrDataGridViewTextBoxColumn, Me.Firma, Me.NotizenDataGridViewTextBoxColumn, Me.NAnrufDataGridViewTextBoxColumn, Me.BeginZeitDataGridViewTextBoxColumn, Me.EndeZeitDataGridViewTextBoxColumn, Me.MitarbeiterNrDataGridViewTextBoxColumn, Me.Angebot, Me.WeitereInformationen, Me.Wettbewerb, Me.Adresse, Me.PLZ, Me.Ort, Me.LAenderungDataGridViewTextBoxColumn, Me.LKontaktDataGridViewTextBoxColumn, Me.Tel, Me.Mobil, Me.Email})
        Me.OfAdressenlisteDataGridView.DataSource = Me.AnruflisteBindingSource
        Me.OfAdressenlisteDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfAdressenlisteDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.OfAdressenlisteDataGridView.Name = "OfAdressenlisteDataGridView"
        Me.OfAdressenlisteDataGridView.ReadOnly = True
        Me.OfAdressenlisteDataGridView.Size = New System.Drawing.Size(770, 794)
        Me.OfAdressenlisteDataGridView.TabIndex = 6
        '
        'AnrufNrDataGridViewTextBoxColumn
        '
        Me.AnrufNrDataGridViewTextBoxColumn.DataPropertyName = "AnrufNr"
        Me.AnrufNrDataGridViewTextBoxColumn.HeaderText = "AnrufNr"
        Me.AnrufNrDataGridViewTextBoxColumn.Name = "AnrufNrDataGridViewTextBoxColumn"
        Me.AnrufNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.AnrufNrDataGridViewTextBoxColumn.Visible = False
        '
        'AdrNrDataGridViewTextBoxColumn
        '
        Me.AdrNrDataGridViewTextBoxColumn.DataPropertyName = "AdrNr"
        Me.AdrNrDataGridViewTextBoxColumn.HeaderText = "AdrNr"
        Me.AdrNrDataGridViewTextBoxColumn.Name = "AdrNrDataGridViewTextBoxColumn"
        Me.AdrNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.AdrNrDataGridViewTextBoxColumn.Visible = False
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
        'Angebot
        '
        Me.Angebot.DataPropertyName = "Angebot"
        Me.Angebot.HeaderText = "Angebot"
        Me.Angebot.Name = "Angebot"
        Me.Angebot.ReadOnly = True
        '
        'WeitereInformationen
        '
        Me.WeitereInformationen.DataPropertyName = "WeitereInformationen"
        Me.WeitereInformationen.HeaderText = "WeitereInformationen"
        Me.WeitereInformationen.Name = "WeitereInformationen"
        Me.WeitereInformationen.ReadOnly = True
        '
        'Wettbewerb
        '
        Me.Wettbewerb.DataPropertyName = "Wettbewerb"
        Me.Wettbewerb.HeaderText = "Wettbewerb"
        Me.Wettbewerb.Name = "Wettbewerb"
        Me.Wettbewerb.ReadOnly = True
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
        Me.SplitContainer.Panel1.Controls.Add(Me.WettberwerbCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.MenuStrip1)
        Me.SplitContainer.Panel1.Controls.Add(Me.InfoCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.AngebotCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label15)
        Me.SplitContainer.Panel1.Controls.Add(Me.NotizTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.BeginZeitBisDateTimePicker)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label7)
        Me.SplitContainer.Panel1.Controls.Add(Me.BeginZeitVonDateTimePicker)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label6)
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
        'WettberwerbCheckBox
        '
        Me.WettberwerbCheckBox.Checked = True
        Me.WettberwerbCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.WettberwerbCheckBox.Location = New System.Drawing.Point(98, 316)
        Me.WettberwerbCheckBox.Name = "WettberwerbCheckBox"
        Me.WettberwerbCheckBox.Size = New System.Drawing.Size(126, 24)
        Me.WettberwerbCheckBox.TabIndex = 48
        Me.WettberwerbCheckBox.Text = "hat anderen Anbieter"
        Me.WettberwerbCheckBox.UseVisualStyleBackColor = True
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Dock = System.Windows.Forms.DockStyle.None
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AngebotToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(34, 420)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(73, 24)
        Me.MenuStrip1.TabIndex = 12
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'AngebotToolStripMenuItem
        '
        Me.AngebotToolStripMenuItem.Enabled = False
        Me.AngebotToolStripMenuItem.Name = "AngebotToolStripMenuItem"
        Me.AngebotToolStripMenuItem.Size = New System.Drawing.Size(65, 20)
        Me.AngebotToolStripMenuItem.Text = "Angebot"
        '
        'InfoCheckBox
        '
        Me.InfoCheckBox.AutoEllipsis = True
        Me.InfoCheckBox.Checked = True
        Me.InfoCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.InfoCheckBox.Location = New System.Drawing.Point(98, 286)
        Me.InfoCheckBox.Name = "InfoCheckBox"
        Me.InfoCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.InfoCheckBox.TabIndex = 11
        Me.InfoCheckBox.Text = "will Information"
        Me.InfoCheckBox.ThreeState = True
        Me.InfoCheckBox.UseVisualStyleBackColor = True
        '
        'AngebotCheckBox
        '
        Me.AngebotCheckBox.Checked = True
        Me.AngebotCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.AngebotCheckBox.Location = New System.Drawing.Point(98, 256)
        Me.AngebotCheckBox.Name = "AngebotCheckBox"
        Me.AngebotCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AngebotCheckBox.TabIndex = 10
        Me.AngebotCheckBox.Text = "will Angebot"
        Me.AngebotCheckBox.ThreeState = True
        Me.AngebotCheckBox.UseVisualStyleBackColor = True
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(12, 233)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(34, 13)
        Me.Label15.TabIndex = 47
        Me.Label15.Text = "Notiz:"
        '
        'NotizTextBox
        '
        Me.NotizTextBox.Location = New System.Drawing.Point(98, 230)
        Me.NotizTextBox.Name = "NotizTextBox"
        Me.NotizTextBox.Size = New System.Drawing.Size(126, 20)
        Me.NotizTextBox.TabIndex = 9
        '
        'BeginZeitBisDateTimePicker
        '
        Me.BeginZeitBisDateTimePicker.CustomFormat = " "
        Me.BeginZeitBisDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.BeginZeitBisDateTimePicker.Location = New System.Drawing.Point(98, 38)
        Me.BeginZeitBisDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.BeginZeitBisDateTimePicker.Name = "BeginZeitBisDateTimePicker"
        Me.BeginZeitBisDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.BeginZeitBisDateTimePicker.TabIndex = 1
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(13, 38)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(48, 13)
        Me.Label7.TabIndex = 28
        Me.Label7.Text = "Anruf bis"
        '
        'BeginZeitVonDateTimePicker
        '
        Me.BeginZeitVonDateTimePicker.CustomFormat = " "
        Me.BeginZeitVonDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.BeginZeitVonDateTimePicker.Location = New System.Drawing.Point(98, 12)
        Me.BeginZeitVonDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.BeginZeitVonDateTimePicker.Name = "BeginZeitVonDateTimePicker"
        Me.BeginZeitVonDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.BeginZeitVonDateTimePicker.TabIndex = 0
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(13, 12)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(53, 13)
        Me.Label6.TabIndex = 24
        Me.Label6.Text = "Anruf von"
        '
        'MitarbeiterControl
        '
        Me.MitarbeiterControl.IDNR = 0
        Me.MitarbeiterControl.Location = New System.Drawing.Point(98, 199)
        Me.MitarbeiterControl.Name = "MitarbeiterControl"
        Me.MitarbeiterControl.Size = New System.Drawing.Size(136, 25)
        Me.MitarbeiterControl.TabIndex = 8
        '
        'AdressenControl1
        '
        Me.AdressenControl1.IDNR = 0
        Me.AdressenControl1.Location = New System.Drawing.Point(98, 64)
        Me.AdressenControl1.Name = "AdressenControl1"
        Me.AdressenControl1.Size = New System.Drawing.Size(136, 25)
        Me.AdressenControl1.TabIndex = 2
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(12, 69)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(38, 13)
        Me.Label9.TabIndex = 22
        Me.Label9.Text = "Kunde"
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(12, 205)
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
        Me.LandComboBox.Location = New System.Drawing.Point(98, 92)
        Me.LandComboBox.Name = "LandComboBox"
        Me.LandComboBox.Size = New System.Drawing.Size(126, 21)
        Me.LandComboBox.TabIndex = 3
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 95)
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
        'Anrufliste
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1012, 794)
        Me.Controls.Add(Me.SplitContainer)
        Me.MainMenuStrip = Me.MenuStrip1
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
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
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
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents BeginZeitVonDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents BeginZeitBisDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents NotizTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents AngebotToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents InfoCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AngebotCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AnrufNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AdrNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Firma As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NotizenDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NAnrufDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BeginZeitDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EndeZeitDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MitarbeiterNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Angebot As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents WeitereInformationen As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents Wettbewerb As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Adresse As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PLZ As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Ort As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LAenderungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LKontaktDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Tel As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Mobil As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Email As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WettberwerbCheckBox As System.Windows.Forms.CheckBox
End Class
