<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangListe
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
        Dim DatumLabel As System.Windows.Forms.Label
        Dim Label10 As System.Windows.Forms.Label
        Dim StatusLabel As System.Windows.Forms.Label
        Me.FilterButton = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.PLZVonTextBox = New System.Windows.Forms.TextBox()
        Me.PLZBisTextBox = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.KundengruppeComboBox = New System.Windows.Forms.ComboBox()
        Me.PreislisteComboBox = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.VorgangListeDataGridView = New System.Windows.Forms.DataGridView()
        Me.NummerDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TypDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.KundNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DatumDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NotizDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NotizInternDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NotizExternDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SummeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BezahltDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.AusgedrucktDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.AbgeschlossenDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ZahlungsbedungungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TransportMethodeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ZahlungsMethodeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.WoherDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.WohinDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.StatusDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SummeMWSTDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SummeBruttoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LieferantNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MitarbeiterNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.KundNr2DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.WaehrungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ErstelltAmDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FirmaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.VornameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Land = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BuchVorgangListeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsVorgaenge = New IntraSell_Net.dsVorgaenge()
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.AdressenControl1 = New IntraSell_Net.AdressenControl()
        Me.ArtikelControl1 = New IntraSell_Net.ArtikelControl()
        Me.StatusComboBox = New System.Windows.Forms.ComboBox()
        Me.BezahltCheckBox = New System.Windows.Forms.CheckBox()
        Me.AusgedrucktCheckBox = New System.Windows.Forms.CheckBox()
        Me.AbgeschlossenCheckBox = New System.Windows.Forms.CheckBox()
        Me.Label12 = New System.Windows.Forms.Label()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.DatumUntil = New System.Windows.Forms.DateTimePicker()
        Me.DatumVon = New System.Windows.Forms.DateTimePicker()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.MitarbeiterComboBox = New System.Windows.Forms.ComboBox()
        Me.Label8 = New System.Windows.Forms.Label()
        Me.LieferantComboBox = New System.Windows.Forms.ComboBox()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.LandComboBox = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.BuchVorgangListeTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchVorgangListeTableAdapter()
        Me.Label13 = New System.Windows.Forms.Label()
        Me.SummeVonTextBox = New System.Windows.Forms.TextBox()
        Me.SummeBisTextBox = New System.Windows.Forms.TextBox()
        Me.Label14 = New System.Windows.Forms.Label()
        DatumLabel = New System.Windows.Forms.Label()
        Label10 = New System.Windows.Forms.Label()
        StatusLabel = New System.Windows.Forms.Label()
        CType(Me.VorgangListeDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchVorgangListeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        Me.SuspendLayout()
        '
        'DatumLabel
        '
        DatumLabel.AutoSize = True
        DatumLabel.Location = New System.Drawing.Point(8, 92)
        DatumLabel.Name = "DatumLabel"
        DatumLabel.Size = New System.Drawing.Size(62, 13)
        DatumLabel.TabIndex = 19
        DatumLabel.Text = "Datum von:"
        '
        'Label10
        '
        Label10.AutoSize = True
        Label10.Location = New System.Drawing.Point(9, 118)
        Label10.Name = "Label10"
        Label10.Size = New System.Drawing.Size(57, 13)
        Label10.TabIndex = 21
        Label10.Text = "Datum bis:"
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(8, 68)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 35
        StatusLabel.Text = "Status:"
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(14, 490)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 5
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(9, 316)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(30, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "PLZ:"
        '
        'PLZVonTextBox
        '
        Me.PLZVonTextBox.Location = New System.Drawing.Point(95, 313)
        Me.PLZVonTextBox.Name = "PLZVonTextBox"
        Me.PLZVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZVonTextBox.TabIndex = 1
        '
        'PLZBisTextBox
        '
        Me.PLZBisTextBox.Location = New System.Drawing.Point(169, 313)
        Me.PLZBisTextBox.Name = "PLZBisTextBox"
        Me.PLZBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZBisTextBox.TabIndex = 2
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(153, 316)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(9, 342)
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
        Me.KundengruppeComboBox.Location = New System.Drawing.Point(95, 339)
        Me.KundengruppeComboBox.Name = "KundengruppeComboBox"
        Me.KundengruppeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.KundengruppeComboBox.TabIndex = 3
        '
        'PreislisteComboBox
        '
        Me.PreislisteComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.PreislisteComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.PreislisteComboBox.FormattingEnabled = True
        Me.PreislisteComboBox.Location = New System.Drawing.Point(95, 366)
        Me.PreislisteComboBox.Name = "PreislisteComboBox"
        Me.PreislisteComboBox.Size = New System.Drawing.Size(126, 21)
        Me.PreislisteComboBox.TabIndex = 4
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(9, 369)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(51, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Preisliste:"
        '
        'VorgangListeDataGridView
        '
        Me.VorgangListeDataGridView.AllowUserToAddRows = False
        Me.VorgangListeDataGridView.AllowUserToDeleteRows = False
        Me.VorgangListeDataGridView.AllowUserToOrderColumns = True
        Me.VorgangListeDataGridView.AutoGenerateColumns = False
        Me.VorgangListeDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.VorgangListeDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.NummerDataGridViewTextBoxColumn, Me.TypDataGridViewTextBoxColumn, Me.KundNrDataGridViewTextBoxColumn, Me.DatumDataGridViewTextBoxColumn, Me.NotizDataGridViewTextBoxColumn, Me.NotizInternDataGridViewTextBoxColumn, Me.NotizExternDataGridViewTextBoxColumn, Me.SummeDataGridViewTextBoxColumn, Me.BezahltDataGridViewCheckBoxColumn, Me.AusgedrucktDataGridViewCheckBoxColumn, Me.AbgeschlossenDataGridViewCheckBoxColumn, Me.ZahlungsbedungungDataGridViewTextBoxColumn, Me.TransportMethodeDataGridViewTextBoxColumn, Me.ZahlungsMethodeDataGridViewTextBoxColumn, Me.WoherDataGridViewTextBoxColumn, Me.WohinDataGridViewTextBoxColumn, Me.StatusDataGridViewTextBoxColumn, Me.SummeMWSTDataGridViewTextBoxColumn, Me.SummeBruttoDataGridViewTextBoxColumn, Me.LieferantNrDataGridViewTextBoxColumn, Me.MitarbeiterNrDataGridViewTextBoxColumn, Me.KundNr2DataGridViewTextBoxColumn, Me.WaehrungDataGridViewTextBoxColumn, Me.ErstelltAmDataGridViewTextBoxColumn, Me.FirmaDataGridViewTextBoxColumn, Me.NameDataGridViewTextBoxColumn, Me.VornameDataGridViewTextBoxColumn, Me.Land})
        Me.VorgangListeDataGridView.DataSource = Me.BuchVorgangListeBindingSource
        Me.VorgangListeDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.VorgangListeDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.VorgangListeDataGridView.Name = "VorgangListeDataGridView"
        Me.VorgangListeDataGridView.ReadOnly = True
        Me.VorgangListeDataGridView.Size = New System.Drawing.Size(766, 762)
        Me.VorgangListeDataGridView.TabIndex = 6
        '
        'NummerDataGridViewTextBoxColumn
        '
        Me.NummerDataGridViewTextBoxColumn.DataPropertyName = "Nummer"
        Me.NummerDataGridViewTextBoxColumn.HeaderText = "Nummer"
        Me.NummerDataGridViewTextBoxColumn.Name = "NummerDataGridViewTextBoxColumn"
        Me.NummerDataGridViewTextBoxColumn.ReadOnly = True
        '
        'TypDataGridViewTextBoxColumn
        '
        Me.TypDataGridViewTextBoxColumn.DataPropertyName = "Typ"
        Me.TypDataGridViewTextBoxColumn.HeaderText = "Typ"
        Me.TypDataGridViewTextBoxColumn.Name = "TypDataGridViewTextBoxColumn"
        Me.TypDataGridViewTextBoxColumn.ReadOnly = True
        '
        'KundNrDataGridViewTextBoxColumn
        '
        Me.KundNrDataGridViewTextBoxColumn.DataPropertyName = "KundNr"
        Me.KundNrDataGridViewTextBoxColumn.HeaderText = "KundNr"
        Me.KundNrDataGridViewTextBoxColumn.Name = "KundNrDataGridViewTextBoxColumn"
        Me.KundNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'DatumDataGridViewTextBoxColumn
        '
        Me.DatumDataGridViewTextBoxColumn.DataPropertyName = "Datum"
        Me.DatumDataGridViewTextBoxColumn.HeaderText = "Datum"
        Me.DatumDataGridViewTextBoxColumn.Name = "DatumDataGridViewTextBoxColumn"
        Me.DatumDataGridViewTextBoxColumn.ReadOnly = True
        '
        'NotizDataGridViewTextBoxColumn
        '
        Me.NotizDataGridViewTextBoxColumn.DataPropertyName = "Notiz"
        Me.NotizDataGridViewTextBoxColumn.HeaderText = "Notiz"
        Me.NotizDataGridViewTextBoxColumn.Name = "NotizDataGridViewTextBoxColumn"
        Me.NotizDataGridViewTextBoxColumn.ReadOnly = True
        '
        'NotizInternDataGridViewTextBoxColumn
        '
        Me.NotizInternDataGridViewTextBoxColumn.DataPropertyName = "NotizIntern"
        Me.NotizInternDataGridViewTextBoxColumn.HeaderText = "NotizIntern"
        Me.NotizInternDataGridViewTextBoxColumn.Name = "NotizInternDataGridViewTextBoxColumn"
        Me.NotizInternDataGridViewTextBoxColumn.ReadOnly = True
        '
        'NotizExternDataGridViewTextBoxColumn
        '
        Me.NotizExternDataGridViewTextBoxColumn.DataPropertyName = "NotizExtern"
        Me.NotizExternDataGridViewTextBoxColumn.HeaderText = "NotizExtern"
        Me.NotizExternDataGridViewTextBoxColumn.Name = "NotizExternDataGridViewTextBoxColumn"
        Me.NotizExternDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SummeDataGridViewTextBoxColumn
        '
        Me.SummeDataGridViewTextBoxColumn.DataPropertyName = "Summe"
        Me.SummeDataGridViewTextBoxColumn.HeaderText = "Summe"
        Me.SummeDataGridViewTextBoxColumn.Name = "SummeDataGridViewTextBoxColumn"
        Me.SummeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BezahltDataGridViewCheckBoxColumn
        '
        Me.BezahltDataGridViewCheckBoxColumn.DataPropertyName = "Bezahlt"
        Me.BezahltDataGridViewCheckBoxColumn.HeaderText = "Bezahlt"
        Me.BezahltDataGridViewCheckBoxColumn.Name = "BezahltDataGridViewCheckBoxColumn"
        Me.BezahltDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'AusgedrucktDataGridViewCheckBoxColumn
        '
        Me.AusgedrucktDataGridViewCheckBoxColumn.DataPropertyName = "Ausgedruckt"
        Me.AusgedrucktDataGridViewCheckBoxColumn.HeaderText = "Ausgedruckt"
        Me.AusgedrucktDataGridViewCheckBoxColumn.Name = "AusgedrucktDataGridViewCheckBoxColumn"
        Me.AusgedrucktDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'AbgeschlossenDataGridViewCheckBoxColumn
        '
        Me.AbgeschlossenDataGridViewCheckBoxColumn.DataPropertyName = "Abgeschlossen"
        Me.AbgeschlossenDataGridViewCheckBoxColumn.HeaderText = "Abgeschlossen"
        Me.AbgeschlossenDataGridViewCheckBoxColumn.Name = "AbgeschlossenDataGridViewCheckBoxColumn"
        Me.AbgeschlossenDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'ZahlungsbedungungDataGridViewTextBoxColumn
        '
        Me.ZahlungsbedungungDataGridViewTextBoxColumn.DataPropertyName = "Zahlungsbedungung"
        Me.ZahlungsbedungungDataGridViewTextBoxColumn.HeaderText = "Zahlungsbedungung"
        Me.ZahlungsbedungungDataGridViewTextBoxColumn.Name = "ZahlungsbedungungDataGridViewTextBoxColumn"
        Me.ZahlungsbedungungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'TransportMethodeDataGridViewTextBoxColumn
        '
        Me.TransportMethodeDataGridViewTextBoxColumn.DataPropertyName = "TransportMethode"
        Me.TransportMethodeDataGridViewTextBoxColumn.HeaderText = "TransportMethode"
        Me.TransportMethodeDataGridViewTextBoxColumn.Name = "TransportMethodeDataGridViewTextBoxColumn"
        Me.TransportMethodeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ZahlungsMethodeDataGridViewTextBoxColumn
        '
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.DataPropertyName = "ZahlungsMethode"
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.HeaderText = "ZahlungsMethode"
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.Name = "ZahlungsMethodeDataGridViewTextBoxColumn"
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'WoherDataGridViewTextBoxColumn
        '
        Me.WoherDataGridViewTextBoxColumn.DataPropertyName = "Woher"
        Me.WoherDataGridViewTextBoxColumn.HeaderText = "Woher"
        Me.WoherDataGridViewTextBoxColumn.Name = "WoherDataGridViewTextBoxColumn"
        Me.WoherDataGridViewTextBoxColumn.ReadOnly = True
        '
        'WohinDataGridViewTextBoxColumn
        '
        Me.WohinDataGridViewTextBoxColumn.DataPropertyName = "Wohin"
        Me.WohinDataGridViewTextBoxColumn.HeaderText = "Wohin"
        Me.WohinDataGridViewTextBoxColumn.Name = "WohinDataGridViewTextBoxColumn"
        Me.WohinDataGridViewTextBoxColumn.ReadOnly = True
        '
        'StatusDataGridViewTextBoxColumn
        '
        Me.StatusDataGridViewTextBoxColumn.DataPropertyName = "Status"
        Me.StatusDataGridViewTextBoxColumn.HeaderText = "Status"
        Me.StatusDataGridViewTextBoxColumn.Name = "StatusDataGridViewTextBoxColumn"
        Me.StatusDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SummeMWSTDataGridViewTextBoxColumn
        '
        Me.SummeMWSTDataGridViewTextBoxColumn.DataPropertyName = "SummeMWST"
        Me.SummeMWSTDataGridViewTextBoxColumn.HeaderText = "SummeMWST"
        Me.SummeMWSTDataGridViewTextBoxColumn.Name = "SummeMWSTDataGridViewTextBoxColumn"
        Me.SummeMWSTDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SummeBruttoDataGridViewTextBoxColumn
        '
        Me.SummeBruttoDataGridViewTextBoxColumn.DataPropertyName = "SummeBrutto"
        Me.SummeBruttoDataGridViewTextBoxColumn.HeaderText = "SummeBrutto"
        Me.SummeBruttoDataGridViewTextBoxColumn.Name = "SummeBruttoDataGridViewTextBoxColumn"
        Me.SummeBruttoDataGridViewTextBoxColumn.ReadOnly = True
        '
        'LieferantNrDataGridViewTextBoxColumn
        '
        Me.LieferantNrDataGridViewTextBoxColumn.DataPropertyName = "LieferantNr"
        Me.LieferantNrDataGridViewTextBoxColumn.HeaderText = "LieferantNr"
        Me.LieferantNrDataGridViewTextBoxColumn.Name = "LieferantNrDataGridViewTextBoxColumn"
        Me.LieferantNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'MitarbeiterNrDataGridViewTextBoxColumn
        '
        Me.MitarbeiterNrDataGridViewTextBoxColumn.DataPropertyName = "MitarbeiterNr"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.HeaderText = "MitarbeiterNr"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.Name = "MitarbeiterNrDataGridViewTextBoxColumn"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'KundNr2DataGridViewTextBoxColumn
        '
        Me.KundNr2DataGridViewTextBoxColumn.DataPropertyName = "KundNr2"
        Me.KundNr2DataGridViewTextBoxColumn.HeaderText = "KundNr2"
        Me.KundNr2DataGridViewTextBoxColumn.Name = "KundNr2DataGridViewTextBoxColumn"
        Me.KundNr2DataGridViewTextBoxColumn.ReadOnly = True
        '
        'WaehrungDataGridViewTextBoxColumn
        '
        Me.WaehrungDataGridViewTextBoxColumn.DataPropertyName = "Waehrung"
        Me.WaehrungDataGridViewTextBoxColumn.HeaderText = "Waehrung"
        Me.WaehrungDataGridViewTextBoxColumn.Name = "WaehrungDataGridViewTextBoxColumn"
        Me.WaehrungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ErstelltAmDataGridViewTextBoxColumn
        '
        Me.ErstelltAmDataGridViewTextBoxColumn.DataPropertyName = "ErstelltAm"
        Me.ErstelltAmDataGridViewTextBoxColumn.HeaderText = "ErstelltAm"
        Me.ErstelltAmDataGridViewTextBoxColumn.Name = "ErstelltAmDataGridViewTextBoxColumn"
        Me.ErstelltAmDataGridViewTextBoxColumn.ReadOnly = True
        '
        'FirmaDataGridViewTextBoxColumn
        '
        Me.FirmaDataGridViewTextBoxColumn.DataPropertyName = "Firma"
        Me.FirmaDataGridViewTextBoxColumn.HeaderText = "Firma"
        Me.FirmaDataGridViewTextBoxColumn.Name = "FirmaDataGridViewTextBoxColumn"
        Me.FirmaDataGridViewTextBoxColumn.ReadOnly = True
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
        'Land
        '
        Me.Land.DataPropertyName = "Land"
        Me.Land.HeaderText = "Land"
        Me.Land.Name = "Land"
        Me.Land.ReadOnly = True
        '
        'BuchVorgangListeBindingSource
        '
        Me.BuchVorgangListeBindingSource.DataMember = "buchVorgangListe"
        Me.BuchVorgangListeBindingSource.DataSource = Me.DsVorgaenge
        '
        'DsVorgaenge
        '
        Me.DsVorgaenge.DataSetName = "dsVorgaenge"
        Me.DsVorgaenge.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'SplitContainer
        '
        Me.SplitContainer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.Label13)
        Me.SplitContainer.Panel1.Controls.Add(Me.SummeVonTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.SummeBisTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label14)
        Me.SplitContainer.Panel1.Controls.Add(Me.AdressenControl1)
        Me.SplitContainer.Panel1.Controls.Add(Me.ArtikelControl1)
        Me.SplitContainer.Panel1.Controls.Add(StatusLabel)
        Me.SplitContainer.Panel1.Controls.Add(Me.StatusComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.BezahltCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.AusgedrucktCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.AbgeschlossenCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label12)
        Me.SplitContainer.Panel1.Controls.Add(Me.NummerTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.TypComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label11)
        Me.SplitContainer.Panel1.Controls.Add(Label10)
        Me.SplitContainer.Panel1.Controls.Add(Me.DatumUntil)
        Me.SplitContainer.Panel1.Controls.Add(DatumLabel)
        Me.SplitContainer.Panel1.Controls.Add(Me.DatumVon)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label9)
        Me.SplitContainer.Panel1.Controls.Add(Me.MitarbeiterComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label8)
        Me.SplitContainer.Panel1.Controls.Add(Me.LieferantComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label7)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label6)
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
        Me.SplitContainer.Panel2.Controls.Add(Me.VorgangListeDataGridView)
        Me.SplitContainer.Size = New System.Drawing.Size(1008, 762)
        Me.SplitContainer.SplitterDistance = 238
        Me.SplitContainer.TabIndex = 11
        '
        'AdressenControl1
        '
        Me.AdressenControl1.Location = New System.Drawing.Point(95, 228)
        Me.AdressenControl1.Name = "AdressenControl1"
        Me.AdressenControl1.Size = New System.Drawing.Size(136, 25)
        Me.AdressenControl1.TabIndex = 39
        '
        'ArtikelControl1
        '
        Me.ArtikelControl1.Location = New System.Drawing.Point(96, 144)
        Me.ArtikelControl1.Name = "ArtikelControl1"
        Me.ArtikelControl1.Size = New System.Drawing.Size(127, 26)
        Me.ArtikelControl1.TabIndex = 38
        '
        'StatusComboBox
        '
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(96, 65)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(124, 21)
        Me.StatusComboBox.TabIndex = 36
        '
        'BezahltCheckBox
        '
        Me.BezahltCheckBox.Location = New System.Drawing.Point(95, 400)
        Me.BezahltCheckBox.Name = "BezahltCheckBox"
        Me.BezahltCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.BezahltCheckBox.TabIndex = 27
        Me.BezahltCheckBox.Text = "bezahlt"
        Me.BezahltCheckBox.UseVisualStyleBackColor = True
        '
        'AusgedrucktCheckBox
        '
        Me.AusgedrucktCheckBox.Location = New System.Drawing.Point(95, 430)
        Me.AusgedrucktCheckBox.Name = "AusgedrucktCheckBox"
        Me.AusgedrucktCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AusgedrucktCheckBox.TabIndex = 28
        Me.AusgedrucktCheckBox.Text = "ausgedruckt"
        Me.AusgedrucktCheckBox.UseVisualStyleBackColor = True
        '
        'AbgeschlossenCheckBox
        '
        Me.AbgeschlossenCheckBox.Location = New System.Drawing.Point(95, 460)
        Me.AbgeschlossenCheckBox.Name = "AbgeschlossenCheckBox"
        Me.AbgeschlossenCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AbgeschlossenCheckBox.TabIndex = 29
        Me.AbgeschlossenCheckBox.Text = "abgeschlosen"
        Me.AbgeschlossenCheckBox.UseVisualStyleBackColor = True
        '
        'Label12
        '
        Me.Label12.AutoSize = True
        Me.Label12.Location = New System.Drawing.Point(9, 42)
        Me.Label12.Name = "Label12"
        Me.Label12.Size = New System.Drawing.Size(49, 13)
        Me.Label12.TabIndex = 26
        Me.Label12.Text = "Nummer:"
        '
        'NummerTextBox
        '
        Me.NummerTextBox.Location = New System.Drawing.Point(95, 39)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(126, 20)
        Me.NummerTextBox.TabIndex = 25
        '
        'TypComboBox
        '
        Me.TypComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.TypComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(95, 12)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(126, 21)
        Me.TypComboBox.TabIndex = 23
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(9, 15)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(28, 13)
        Me.Label11.TabIndex = 24
        Me.Label11.Text = "Typ:"
        '
        'DatumUntil
        '
        Me.DatumUntil.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DatumUntil.Location = New System.Drawing.Point(96, 118)
        Me.DatumUntil.Name = "DatumUntil"
        Me.DatumUntil.Size = New System.Drawing.Size(125, 20)
        Me.DatumUntil.TabIndex = 22
        '
        'DatumVon
        '
        Me.DatumVon.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DatumVon.Location = New System.Drawing.Point(95, 92)
        Me.DatumVon.Name = "DatumVon"
        Me.DatumVon.Size = New System.Drawing.Size(125, 20)
        Me.DatumVon.TabIndex = 20
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(9, 233)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(38, 13)
        Me.Label9.TabIndex = 18
        Me.Label9.Text = "Kunde"
        '
        'MitarbeiterComboBox
        '
        Me.MitarbeiterComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.MitarbeiterComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.MitarbeiterComboBox.FormattingEnabled = True
        Me.MitarbeiterComboBox.Location = New System.Drawing.Point(95, 203)
        Me.MitarbeiterComboBox.Name = "MitarbeiterComboBox"
        Me.MitarbeiterComboBox.Size = New System.Drawing.Size(126, 21)
        Me.MitarbeiterComboBox.TabIndex = 15
        '
        'Label8
        '
        Me.Label8.AutoSize = True
        Me.Label8.Location = New System.Drawing.Point(9, 206)
        Me.Label8.Name = "Label8"
        Me.Label8.Size = New System.Drawing.Size(59, 13)
        Me.Label8.TabIndex = 16
        Me.Label8.Text = "Mitarbeiter:"
        '
        'LieferantComboBox
        '
        Me.LieferantComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.LieferantComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.LieferantComboBox.FormattingEnabled = True
        Me.LieferantComboBox.Location = New System.Drawing.Point(95, 259)
        Me.LieferantComboBox.Name = "LieferantComboBox"
        Me.LieferantComboBox.Size = New System.Drawing.Size(126, 21)
        Me.LieferantComboBox.TabIndex = 13
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(9, 262)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(51, 13)
        Me.Label7.TabIndex = 14
        Me.Label7.Text = "Lieferant:"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(9, 146)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(39, 13)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "Artikel:"
        '
        'LandComboBox
        '
        Me.LandComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.LandComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.LandComboBox.FormattingEnabled = True
        Me.LandComboBox.Location = New System.Drawing.Point(95, 286)
        Me.LandComboBox.Name = "LandComboBox"
        Me.LandComboBox.Size = New System.Drawing.Size(126, 21)
        Me.LandComboBox.TabIndex = 0
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(9, 289)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(34, 13)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Land:"
        '
        'BuchVorgangListeTableAdapter
        '
        Me.BuchVorgangListeTableAdapter.ClearBeforeFill = True
        '
        'Label13
        '
        Me.Label13.AutoSize = True
        Me.Label13.Location = New System.Drawing.Point(8, 179)
        Me.Label13.Name = "Label13"
        Me.Label13.Size = New System.Drawing.Size(45, 13)
        Me.Label13.TabIndex = 42
        Me.Label13.Text = "Umsatz:"
        '
        'SummeVonTextBox
        '
        Me.SummeVonTextBox.Location = New System.Drawing.Point(94, 176)
        Me.SummeVonTextBox.Name = "SummeVonTextBox"
        Me.SummeVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.SummeVonTextBox.TabIndex = 40
        '
        'SummeBisTextBox
        '
        Me.SummeBisTextBox.Location = New System.Drawing.Point(168, 176)
        Me.SummeBisTextBox.Name = "SummeBisTextBox"
        Me.SummeBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.SummeBisTextBox.TabIndex = 41
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(152, 179)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(10, 13)
        Me.Label14.TabIndex = 43
        Me.Label14.Text = "-"
        '
        'VorgangListe
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1008, 762)
        Me.Controls.Add(Me.SplitContainer)
        Me.Name = "VorgangListe"
        Me.Text = "Kundenliste"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.VorgangListeDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchVorgangListeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).EndInit()
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
    Friend WithEvents VorgangListeDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
    Friend WithEvents LandComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents DsVorgaenge As IntraSell_Net.dsVorgaenge
    Friend WithEvents BuchVorgangListeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchVorgangListeTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchVorgangListeTableAdapter
    Friend WithEvents NummerDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TypDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents KundNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DatumDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NotizDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NotizInternDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NotizExternDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SummeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BezahltDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents AusgedrucktDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents AbgeschlossenDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ZahlungsbedungungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TransportMethodeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ZahlungsMethodeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WoherDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WohinDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents StatusDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SummeMWSTDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SummeBruttoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LieferantNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MitarbeiterNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents KundNr2DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WaehrungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ErstelltAmDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FirmaDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents VornameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Land As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents MitarbeiterComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label8 As System.Windows.Forms.Label
    Friend WithEvents LieferantComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents DatumUntil As System.Windows.Forms.DateTimePicker
    Friend WithEvents DatumVon As System.Windows.Forms.DateTimePicker
    Friend WithEvents Label12 As System.Windows.Forms.Label
    Friend WithEvents NummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TypComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents BezahltCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AusgedrucktCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AbgeschlossenCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents StatusComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents ArtikelControl1 As IntraSell_Net.ArtikelControl
    Friend WithEvents AdressenControl1 As IntraSell_Net.AdressenControl
    Friend WithEvents Label13 As System.Windows.Forms.Label
    Friend WithEvents SummeVonTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeBisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label14 As System.Windows.Forms.Label
End Class
