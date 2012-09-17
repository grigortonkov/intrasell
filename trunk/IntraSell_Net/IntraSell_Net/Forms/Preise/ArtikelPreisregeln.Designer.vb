<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ArtikelPreisregeln
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
        Dim SetArtikelLabel As System.Windows.Forms.Label
        Me.FilterButton = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.PreisVonTextBox = New System.Windows.Forms.TextBox()
        Me.PreisBisTextBox = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.KundengruppeComboBox = New System.Windows.Forms.ComboBox()
        Me.PreislisteComboBox = New System.Windows.Forms.ComboBox()
        Me.PreislistenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Label4 = New System.Windows.Forms.Label()
        Me.OfAdressenlisteDataGridView = New System.Windows.Forms.DataGridView()
        Me.ArtNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EANDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.KategorieDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BarcodeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BezeichnungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Bezeichnung1DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BeschreibungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EinheitDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PreisATSDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MWSTDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PreisATSBruttoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EKPreisDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LEKPreisDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LieferantNRDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ArtKatNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PictureDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ShopURLDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerURLDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ModifikationenDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerRabattDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerRabattTextDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AngelegtAnDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BruttoGewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NettoGewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TaraGewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SeriennummerDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.SetArtikelDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.LagerArtikelDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.NichtBestellbarDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ProduktAktivDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.AngelegtAmDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GrArtikellisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.LagerArtikelCheckBox = New System.Windows.Forms.CheckBox()
        Me.SeriennummerCheckBox = New System.Windows.Forms.CheckBox()
        Me.SetArtikelCheckBox = New System.Windows.Forms.CheckBox()
        Me.ProduktAktivCheckBox = New System.Windows.Forms.CheckBox()
        Me.NichtBestellbarCheckBox = New System.Windows.Forms.CheckBox()
        Me.ProduktAktivOnlineCheckBox = New System.Windows.Forms.CheckBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.ArtNrTextBox = New System.Windows.Forms.TextBox()
        Me.ArtKatNrComboBox = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.GrArtikellisteTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter()
        SetArtikelLabel = New System.Windows.Forms.Label()
        CType(Me.PreislistenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        Me.SuspendLayout()
        '
        'SetArtikelLabel
        '
        SetArtikelLabel.AutoSize = True
        SetArtikelLabel.Location = New System.Drawing.Point(157, 145)
        SetArtikelLabel.Name = "SetArtikelLabel"
        SetArtikelLabel.Size = New System.Drawing.Size(0, 13)
        SetArtikelLabel.TabIndex = 70
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(15, 364)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 11
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 151)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(33, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Preis:"
        '
        'PreisVonTextBox
        '
        Me.PreisVonTextBox.Location = New System.Drawing.Point(98, 148)
        Me.PreisVonTextBox.Name = "PreisVonTextBox"
        Me.PreisVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PreisVonTextBox.TabIndex = 3
        '
        'PreisBisTextBox
        '
        Me.PreisBisTextBox.Location = New System.Drawing.Point(172, 148)
        Me.PreisBisTextBox.Name = "PreisBisTextBox"
        Me.PreisBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PreisBisTextBox.TabIndex = 4
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(156, 151)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 97)
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
        Me.KundengruppeComboBox.Location = New System.Drawing.Point(98, 94)
        Me.KundengruppeComboBox.Name = "KundengruppeComboBox"
        Me.KundengruppeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.KundengruppeComboBox.TabIndex = 3
        '
        'PreislisteComboBox
        '
        Me.PreislisteComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.PreislisteComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.PreislisteComboBox.DataSource = Me.PreislistenBindingSource
        Me.PreislisteComboBox.DisplayMember = "PreislisteName"
        Me.PreislisteComboBox.FormattingEnabled = True
        Me.PreislisteComboBox.Location = New System.Drawing.Point(98, 121)
        Me.PreislisteComboBox.Name = "PreislisteComboBox"
        Me.PreislisteComboBox.Size = New System.Drawing.Size(126, 21)
        Me.PreislisteComboBox.TabIndex = 4
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 124)
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
        Me.OfAdressenlisteDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.ArtNrDataGridViewTextBoxColumn, Me.EANDataGridViewTextBoxColumn, Me.KategorieDataGridViewTextBoxColumn, Me.BarcodeDataGridViewTextBoxColumn, Me.BezeichnungDataGridViewTextBoxColumn, Me.Bezeichnung1DataGridViewTextBoxColumn, Me.BeschreibungDataGridViewTextBoxColumn, Me.EinheitDataGridViewTextBoxColumn, Me.PreisATSDataGridViewTextBoxColumn, Me.MWSTDataGridViewTextBoxColumn, Me.PreisATSBruttoDataGridViewTextBoxColumn, Me.EKPreisDataGridViewTextBoxColumn, Me.LEKPreisDataGridViewTextBoxColumn, Me.LieferantNRDataGridViewTextBoxColumn, Me.ArtKatNrDataGridViewTextBoxColumn, Me.PictureDataGridViewTextBoxColumn, Me.HerstellerNrDataGridViewTextBoxColumn, Me.ShopURLDataGridViewTextBoxColumn, Me.HerstellerURLDataGridViewTextBoxColumn, Me.ModifikationenDataGridViewTextBoxColumn, Me.HerstellerRabattDataGridViewTextBoxColumn, Me.HerstellerRabattTextDataGridViewTextBoxColumn, Me.AngelegtAnDataGridViewTextBoxColumn, Me.GewichtDataGridViewTextBoxColumn, Me.BruttoGewichtDataGridViewTextBoxColumn, Me.NettoGewichtDataGridViewTextBoxColumn, Me.TaraGewichtDataGridViewTextBoxColumn, Me.SeriennummerDataGridViewCheckBoxColumn, Me.SetArtikelDataGridViewCheckBoxColumn, Me.LagerArtikelDataGridViewCheckBoxColumn, Me.NichtBestellbarDataGridViewCheckBoxColumn, Me.ProduktAktivDataGridViewCheckBoxColumn, Me.ProduktAktivOnlineDataGridViewTextBoxColumn, Me.AngelegtAmDataGridViewTextBoxColumn})
        Me.OfAdressenlisteDataGridView.DataSource = Me.GrArtikellisteBindingSource
        Me.OfAdressenlisteDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfAdressenlisteDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.OfAdressenlisteDataGridView.Name = "OfAdressenlisteDataGridView"
        Me.OfAdressenlisteDataGridView.ReadOnly = True
        Me.OfAdressenlisteDataGridView.Size = New System.Drawing.Size(766, 762)
        Me.OfAdressenlisteDataGridView.TabIndex = 6
        '
        'ArtNrDataGridViewTextBoxColumn
        '
        Me.ArtNrDataGridViewTextBoxColumn.DataPropertyName = "ArtNr"
        Me.ArtNrDataGridViewTextBoxColumn.HeaderText = "ArtNr"
        Me.ArtNrDataGridViewTextBoxColumn.Name = "ArtNrDataGridViewTextBoxColumn"
        Me.ArtNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'EANDataGridViewTextBoxColumn
        '
        Me.EANDataGridViewTextBoxColumn.DataPropertyName = "EAN"
        Me.EANDataGridViewTextBoxColumn.HeaderText = "EAN"
        Me.EANDataGridViewTextBoxColumn.Name = "EANDataGridViewTextBoxColumn"
        Me.EANDataGridViewTextBoxColumn.ReadOnly = True
        '
        'KategorieDataGridViewTextBoxColumn
        '
        Me.KategorieDataGridViewTextBoxColumn.DataPropertyName = "Kategorie"
        Me.KategorieDataGridViewTextBoxColumn.HeaderText = "Kategorie"
        Me.KategorieDataGridViewTextBoxColumn.Name = "KategorieDataGridViewTextBoxColumn"
        Me.KategorieDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BarcodeDataGridViewTextBoxColumn
        '
        Me.BarcodeDataGridViewTextBoxColumn.DataPropertyName = "Barcode"
        Me.BarcodeDataGridViewTextBoxColumn.HeaderText = "Barcode"
        Me.BarcodeDataGridViewTextBoxColumn.Name = "BarcodeDataGridViewTextBoxColumn"
        Me.BarcodeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BezeichnungDataGridViewTextBoxColumn
        '
        Me.BezeichnungDataGridViewTextBoxColumn.DataPropertyName = "Bezeichnung"
        Me.BezeichnungDataGridViewTextBoxColumn.HeaderText = "Bezeichnung"
        Me.BezeichnungDataGridViewTextBoxColumn.Name = "BezeichnungDataGridViewTextBoxColumn"
        Me.BezeichnungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'Bezeichnung1DataGridViewTextBoxColumn
        '
        Me.Bezeichnung1DataGridViewTextBoxColumn.DataPropertyName = "Bezeichnung1"
        Me.Bezeichnung1DataGridViewTextBoxColumn.HeaderText = "Bezeichnung1"
        Me.Bezeichnung1DataGridViewTextBoxColumn.Name = "Bezeichnung1DataGridViewTextBoxColumn"
        Me.Bezeichnung1DataGridViewTextBoxColumn.ReadOnly = True
        '
        'BeschreibungDataGridViewTextBoxColumn
        '
        Me.BeschreibungDataGridViewTextBoxColumn.DataPropertyName = "Beschreibung"
        Me.BeschreibungDataGridViewTextBoxColumn.HeaderText = "Beschreibung"
        Me.BeschreibungDataGridViewTextBoxColumn.Name = "BeschreibungDataGridViewTextBoxColumn"
        Me.BeschreibungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'EinheitDataGridViewTextBoxColumn
        '
        Me.EinheitDataGridViewTextBoxColumn.DataPropertyName = "Einheit"
        Me.EinheitDataGridViewTextBoxColumn.HeaderText = "Einheit"
        Me.EinheitDataGridViewTextBoxColumn.Name = "EinheitDataGridViewTextBoxColumn"
        Me.EinheitDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PreisATSDataGridViewTextBoxColumn
        '
        Me.PreisATSDataGridViewTextBoxColumn.DataPropertyName = "PreisATS"
        Me.PreisATSDataGridViewTextBoxColumn.HeaderText = "Preis"
        Me.PreisATSDataGridViewTextBoxColumn.Name = "PreisATSDataGridViewTextBoxColumn"
        Me.PreisATSDataGridViewTextBoxColumn.ReadOnly = True
        '
        'MWSTDataGridViewTextBoxColumn
        '
        Me.MWSTDataGridViewTextBoxColumn.DataPropertyName = "MWST"
        Me.MWSTDataGridViewTextBoxColumn.HeaderText = "MWST"
        Me.MWSTDataGridViewTextBoxColumn.Name = "MWSTDataGridViewTextBoxColumn"
        Me.MWSTDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PreisATSBruttoDataGridViewTextBoxColumn
        '
        Me.PreisATSBruttoDataGridViewTextBoxColumn.DataPropertyName = "PreisATS_Brutto"
        Me.PreisATSBruttoDataGridViewTextBoxColumn.HeaderText = "Preis_Brutto"
        Me.PreisATSBruttoDataGridViewTextBoxColumn.Name = "PreisATSBruttoDataGridViewTextBoxColumn"
        Me.PreisATSBruttoDataGridViewTextBoxColumn.ReadOnly = True
        '
        'EKPreisDataGridViewTextBoxColumn
        '
        Me.EKPreisDataGridViewTextBoxColumn.DataPropertyName = "EKPreis"
        Me.EKPreisDataGridViewTextBoxColumn.HeaderText = "EKPreis"
        Me.EKPreisDataGridViewTextBoxColumn.Name = "EKPreisDataGridViewTextBoxColumn"
        Me.EKPreisDataGridViewTextBoxColumn.ReadOnly = True
        '
        'LEKPreisDataGridViewTextBoxColumn
        '
        Me.LEKPreisDataGridViewTextBoxColumn.DataPropertyName = "LEKPreis"
        Me.LEKPreisDataGridViewTextBoxColumn.HeaderText = "LEKPreis"
        Me.LEKPreisDataGridViewTextBoxColumn.Name = "LEKPreisDataGridViewTextBoxColumn"
        Me.LEKPreisDataGridViewTextBoxColumn.ReadOnly = True
        '
        'LieferantNRDataGridViewTextBoxColumn
        '
        Me.LieferantNRDataGridViewTextBoxColumn.DataPropertyName = "LieferantNR"
        Me.LieferantNRDataGridViewTextBoxColumn.HeaderText = "LieferantNR"
        Me.LieferantNRDataGridViewTextBoxColumn.Name = "LieferantNRDataGridViewTextBoxColumn"
        Me.LieferantNRDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ArtKatNrDataGridViewTextBoxColumn
        '
        Me.ArtKatNrDataGridViewTextBoxColumn.DataPropertyName = "ArtKatNr"
        Me.ArtKatNrDataGridViewTextBoxColumn.HeaderText = "ArtKatNr"
        Me.ArtKatNrDataGridViewTextBoxColumn.Name = "ArtKatNrDataGridViewTextBoxColumn"
        Me.ArtKatNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.ArtKatNrDataGridViewTextBoxColumn.Visible = False
        '
        'PictureDataGridViewTextBoxColumn
        '
        Me.PictureDataGridViewTextBoxColumn.DataPropertyName = "Picture"
        Me.PictureDataGridViewTextBoxColumn.HeaderText = "Picture"
        Me.PictureDataGridViewTextBoxColumn.Name = "PictureDataGridViewTextBoxColumn"
        Me.PictureDataGridViewTextBoxColumn.ReadOnly = True
        '
        'HerstellerNrDataGridViewTextBoxColumn
        '
        Me.HerstellerNrDataGridViewTextBoxColumn.DataPropertyName = "HerstellerNr"
        Me.HerstellerNrDataGridViewTextBoxColumn.HeaderText = "HerstellerNr"
        Me.HerstellerNrDataGridViewTextBoxColumn.Name = "HerstellerNrDataGridViewTextBoxColumn"
        Me.HerstellerNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ShopURLDataGridViewTextBoxColumn
        '
        Me.ShopURLDataGridViewTextBoxColumn.DataPropertyName = "ShopURL"
        Me.ShopURLDataGridViewTextBoxColumn.HeaderText = "ShopURL"
        Me.ShopURLDataGridViewTextBoxColumn.Name = "ShopURLDataGridViewTextBoxColumn"
        Me.ShopURLDataGridViewTextBoxColumn.ReadOnly = True
        '
        'HerstellerURLDataGridViewTextBoxColumn
        '
        Me.HerstellerURLDataGridViewTextBoxColumn.DataPropertyName = "HerstellerURL"
        Me.HerstellerURLDataGridViewTextBoxColumn.HeaderText = "HerstellerURL"
        Me.HerstellerURLDataGridViewTextBoxColumn.Name = "HerstellerURLDataGridViewTextBoxColumn"
        Me.HerstellerURLDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ModifikationenDataGridViewTextBoxColumn
        '
        Me.ModifikationenDataGridViewTextBoxColumn.DataPropertyName = "Modifikationen"
        Me.ModifikationenDataGridViewTextBoxColumn.HeaderText = "Modifikationen"
        Me.ModifikationenDataGridViewTextBoxColumn.Name = "ModifikationenDataGridViewTextBoxColumn"
        Me.ModifikationenDataGridViewTextBoxColumn.ReadOnly = True
        '
        'HerstellerRabattDataGridViewTextBoxColumn
        '
        Me.HerstellerRabattDataGridViewTextBoxColumn.DataPropertyName = "HerstellerRabatt"
        Me.HerstellerRabattDataGridViewTextBoxColumn.HeaderText = "HerstellerRabatt"
        Me.HerstellerRabattDataGridViewTextBoxColumn.Name = "HerstellerRabattDataGridViewTextBoxColumn"
        Me.HerstellerRabattDataGridViewTextBoxColumn.ReadOnly = True
        '
        'HerstellerRabattTextDataGridViewTextBoxColumn
        '
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.DataPropertyName = "HerstellerRabattText"
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.HeaderText = "HerstellerRabattText"
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.Name = "HerstellerRabattTextDataGridViewTextBoxColumn"
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.ReadOnly = True
        '
        'AngelegtAnDataGridViewTextBoxColumn
        '
        Me.AngelegtAnDataGridViewTextBoxColumn.DataPropertyName = "AngelegtAn"
        Me.AngelegtAnDataGridViewTextBoxColumn.HeaderText = "AngelegtAn"
        Me.AngelegtAnDataGridViewTextBoxColumn.Name = "AngelegtAnDataGridViewTextBoxColumn"
        Me.AngelegtAnDataGridViewTextBoxColumn.ReadOnly = True
        Me.AngelegtAnDataGridViewTextBoxColumn.Visible = False
        '
        'GewichtDataGridViewTextBoxColumn
        '
        Me.GewichtDataGridViewTextBoxColumn.DataPropertyName = "Gewicht"
        Me.GewichtDataGridViewTextBoxColumn.HeaderText = "Gewicht"
        Me.GewichtDataGridViewTextBoxColumn.Name = "GewichtDataGridViewTextBoxColumn"
        Me.GewichtDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BruttoGewichtDataGridViewTextBoxColumn
        '
        Me.BruttoGewichtDataGridViewTextBoxColumn.DataPropertyName = "BruttoGewicht"
        Me.BruttoGewichtDataGridViewTextBoxColumn.HeaderText = "BruttoGewicht"
        Me.BruttoGewichtDataGridViewTextBoxColumn.Name = "BruttoGewichtDataGridViewTextBoxColumn"
        Me.BruttoGewichtDataGridViewTextBoxColumn.ReadOnly = True
        '
        'NettoGewichtDataGridViewTextBoxColumn
        '
        Me.NettoGewichtDataGridViewTextBoxColumn.DataPropertyName = "NettoGewicht"
        Me.NettoGewichtDataGridViewTextBoxColumn.HeaderText = "NettoGewicht"
        Me.NettoGewichtDataGridViewTextBoxColumn.Name = "NettoGewichtDataGridViewTextBoxColumn"
        Me.NettoGewichtDataGridViewTextBoxColumn.ReadOnly = True
        '
        'TaraGewichtDataGridViewTextBoxColumn
        '
        Me.TaraGewichtDataGridViewTextBoxColumn.DataPropertyName = "TaraGewicht"
        Me.TaraGewichtDataGridViewTextBoxColumn.HeaderText = "TaraGewicht"
        Me.TaraGewichtDataGridViewTextBoxColumn.Name = "TaraGewichtDataGridViewTextBoxColumn"
        Me.TaraGewichtDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SeriennummerDataGridViewCheckBoxColumn
        '
        Me.SeriennummerDataGridViewCheckBoxColumn.DataPropertyName = "Seriennummer"
        Me.SeriennummerDataGridViewCheckBoxColumn.HeaderText = "Seriennummer"
        Me.SeriennummerDataGridViewCheckBoxColumn.Name = "SeriennummerDataGridViewCheckBoxColumn"
        Me.SeriennummerDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'SetArtikelDataGridViewCheckBoxColumn
        '
        Me.SetArtikelDataGridViewCheckBoxColumn.DataPropertyName = "SetArtikel"
        Me.SetArtikelDataGridViewCheckBoxColumn.HeaderText = "SetArtikel"
        Me.SetArtikelDataGridViewCheckBoxColumn.Name = "SetArtikelDataGridViewCheckBoxColumn"
        Me.SetArtikelDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'LagerArtikelDataGridViewCheckBoxColumn
        '
        Me.LagerArtikelDataGridViewCheckBoxColumn.DataPropertyName = "LagerArtikel"
        Me.LagerArtikelDataGridViewCheckBoxColumn.HeaderText = "LagerArtikel"
        Me.LagerArtikelDataGridViewCheckBoxColumn.Name = "LagerArtikelDataGridViewCheckBoxColumn"
        Me.LagerArtikelDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'NichtBestellbarDataGridViewCheckBoxColumn
        '
        Me.NichtBestellbarDataGridViewCheckBoxColumn.DataPropertyName = "NichtBestellbar"
        Me.NichtBestellbarDataGridViewCheckBoxColumn.HeaderText = "NichtBestellbar"
        Me.NichtBestellbarDataGridViewCheckBoxColumn.Name = "NichtBestellbarDataGridViewCheckBoxColumn"
        Me.NichtBestellbarDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'ProduktAktivDataGridViewCheckBoxColumn
        '
        Me.ProduktAktivDataGridViewCheckBoxColumn.DataPropertyName = "ProduktAktiv"
        Me.ProduktAktivDataGridViewCheckBoxColumn.HeaderText = "ProduktAktiv"
        Me.ProduktAktivDataGridViewCheckBoxColumn.Name = "ProduktAktivDataGridViewCheckBoxColumn"
        Me.ProduktAktivDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'ProduktAktivOnlineDataGridViewTextBoxColumn
        '
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.DataPropertyName = "ProduktAktivOnline"
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.HeaderText = "ProduktAktivOnline"
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.Name = "ProduktAktivOnlineDataGridViewTextBoxColumn"
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.ReadOnly = True
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        '
        'AngelegtAmDataGridViewTextBoxColumn
        '
        Me.AngelegtAmDataGridViewTextBoxColumn.DataPropertyName = "AngelegtAm"
        Me.AngelegtAmDataGridViewTextBoxColumn.HeaderText = "AngelegtAm"
        Me.AngelegtAmDataGridViewTextBoxColumn.Name = "AngelegtAmDataGridViewTextBoxColumn"
        Me.AngelegtAmDataGridViewTextBoxColumn.ReadOnly = True
        '
        'GrArtikellisteBindingSource
        '
        Me.GrArtikellisteBindingSource.DataMember = "grArtikelliste"
        Me.GrArtikellisteBindingSource.DataSource = Me.DsArtikel
        '
        'DsArtikel
        '
        Me.DsArtikel.DataSetName = "dsArtikel"
        Me.DsArtikel.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'SplitContainer
        '
        Me.SplitContainer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.Label7)
        Me.SplitContainer.Panel1.Controls.Add(Me.BezeichnungTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.LagerArtikelCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.SeriennummerCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(SetArtikelLabel)
        Me.SplitContainer.Panel1.Controls.Add(Me.SetArtikelCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.ProduktAktivCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.NichtBestellbarCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.ProduktAktivOnlineCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label6)
        Me.SplitContainer.Panel1.Controls.Add(Me.ArtNrTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.ArtKatNrComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label5)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer.Panel1.Controls.Add(Me.FilterButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreislisteComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreisVonTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label4)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreisBisTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.KundengruppeComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label2)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label3)
        '
        'SplitContainer.Panel2
        '
        Me.SplitContainer.Panel2.Controls.Add(Me.OfAdressenlisteDataGridView)
        Me.SplitContainer.Size = New System.Drawing.Size(1008, 762)
        Me.SplitContainer.SplitterDistance = 238
        Me.SplitContainer.TabIndex = 11
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(12, 41)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(58, 13)
        Me.Label7.TabIndex = 76
        Me.Label7.Text = "EAN/Bez.:"
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(98, 38)
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(126, 20)
        Me.BezeichnungTextBox.TabIndex = 1
        '
        'LagerArtikelCheckBox
        '
        Me.LagerArtikelCheckBox.Checked = True
        Me.LagerArtikelCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.LagerArtikelCheckBox.Location = New System.Drawing.Point(98, 205)
        Me.LagerArtikelCheckBox.Name = "LagerArtikelCheckBox"
        Me.LagerArtikelCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.LagerArtikelCheckBox.TabIndex = 5
        Me.LagerArtikelCheckBox.Text = "Lager Artikel"
        Me.LagerArtikelCheckBox.UseVisualStyleBackColor = True
        '
        'SeriennummerCheckBox
        '
        Me.SeriennummerCheckBox.Checked = True
        Me.SeriennummerCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.SeriennummerCheckBox.Location = New System.Drawing.Point(98, 233)
        Me.SeriennummerCheckBox.Name = "SeriennummerCheckBox"
        Me.SeriennummerCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.SeriennummerCheckBox.TabIndex = 6
        Me.SeriennummerCheckBox.Text = "Seriennummer erford."
        Me.SeriennummerCheckBox.UseVisualStyleBackColor = True
        '
        'SetArtikelCheckBox
        '
        Me.SetArtikelCheckBox.Checked = True
        Me.SetArtikelCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.SetArtikelCheckBox.Location = New System.Drawing.Point(98, 259)
        Me.SetArtikelCheckBox.Name = "SetArtikelCheckBox"
        Me.SetArtikelCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.SetArtikelCheckBox.TabIndex = 7
        Me.SetArtikelCheckBox.Text = "Set Artikel"
        Me.SetArtikelCheckBox.UseVisualStyleBackColor = True
        '
        'ProduktAktivCheckBox
        '
        Me.ProduktAktivCheckBox.Checked = True
        Me.ProduktAktivCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.ProduktAktivCheckBox.Location = New System.Drawing.Point(98, 286)
        Me.ProduktAktivCheckBox.Name = "ProduktAktivCheckBox"
        Me.ProduktAktivCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.ProduktAktivCheckBox.TabIndex = 8
        Me.ProduktAktivCheckBox.Text = "Produkt Aktiv"
        Me.ProduktAktivCheckBox.UseVisualStyleBackColor = True
        '
        'NichtBestellbarCheckBox
        '
        Me.NichtBestellbarCheckBox.Checked = True
        Me.NichtBestellbarCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.NichtBestellbarCheckBox.Location = New System.Drawing.Point(98, 312)
        Me.NichtBestellbarCheckBox.Name = "NichtBestellbarCheckBox"
        Me.NichtBestellbarCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.NichtBestellbarCheckBox.TabIndex = 9
        Me.NichtBestellbarCheckBox.Text = "Nicht Bestellbar"
        Me.NichtBestellbarCheckBox.UseVisualStyleBackColor = True
        '
        'ProduktAktivOnlineCheckBox
        '
        Me.ProduktAktivOnlineCheckBox.Checked = True
        Me.ProduktAktivOnlineCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.ProduktAktivOnlineCheckBox.Location = New System.Drawing.Point(98, 342)
        Me.ProduktAktivOnlineCheckBox.Name = "ProduktAktivOnlineCheckBox"
        Me.ProduktAktivOnlineCheckBox.Size = New System.Drawing.Size(123, 20)
        Me.ProduktAktivOnlineCheckBox.TabIndex = 10
        Me.ProduktAktivOnlineCheckBox.Text = "Produkt Aktiv Online"
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(12, 15)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(34, 13)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "ArtNr:"
        '
        'ArtNrTextBox
        '
        Me.ArtNrTextBox.Location = New System.Drawing.Point(98, 12)
        Me.ArtNrTextBox.Name = "ArtNrTextBox"
        Me.ArtNrTextBox.Size = New System.Drawing.Size(126, 20)
        Me.ArtNrTextBox.TabIndex = 0
        '
        'ArtKatNrComboBox
        '
        Me.ArtKatNrComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.ArtKatNrComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.ArtKatNrComboBox.FormattingEnabled = True
        Me.ArtKatNrComboBox.Location = New System.Drawing.Point(98, 64)
        Me.ArtKatNrComboBox.Name = "ArtKatNrComboBox"
        Me.ArtKatNrComboBox.Size = New System.Drawing.Size(126, 21)
        Me.ArtKatNrComboBox.TabIndex = 2
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 67)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(55, 13)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Kategorie:"
        '
        'GrArtikellisteTableAdapter
        '
        Me.GrArtikellisteTableAdapter.ClearBeforeFill = True
        '
        'ArtikelPreise
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1008, 762)
        Me.Controls.Add(Me.SplitContainer)
        Me.Name = "ArtikelPreise"
        Me.Text = "Preisregeln"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.PreislistenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.Panel1.ResumeLayout(False)
        Me.SplitContainer.Panel1.PerformLayout()
        Me.SplitContainer.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents FilterButton As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents PreisVonTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PreisBisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents KundengruppeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents PreislisteComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents OfAdressenlisteDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
    Friend WithEvents PreislistenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ArtKatNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents GrArtikellisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrArtikellisteTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents ArtNrTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LagerArtikelCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents SeriennummerCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents SetArtikelCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ProduktAktivCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents NichtBestellbarCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ProduktAktivOnlineCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ArtNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EANDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents KategorieDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BarcodeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BezeichnungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Bezeichnung1DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BeschreibungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EinheitDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PreisATSDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MWSTDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PreisATSBruttoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EKPreisDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LEKPreisDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LieferantNRDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ArtKatNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PictureDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ShopURLDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerURLDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ModifikationenDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerRabattDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerRabattTextDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AngelegtAnDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents GewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BruttoGewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NettoGewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TaraGewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SeriennummerDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents SetArtikelDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents LagerArtikelDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents NichtBestellbarDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ProduktAktivDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ProduktAktivOnlineDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents AngelegtAmDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
