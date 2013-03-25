<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Vorgang
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
        Dim NummerLabel As System.Windows.Forms.Label
        Dim TypLabel As System.Windows.Forms.Label
        Dim KundNrLabel As System.Windows.Forms.Label
        Dim DatumLabel As System.Windows.Forms.Label
        Dim NotizLabel As System.Windows.Forms.Label
        Dim NotizInternLabel As System.Windows.Forms.Label
        Dim NotizExternLabel As System.Windows.Forms.Label
        Dim SummeLabel As System.Windows.Forms.Label
        Dim WoherLabel As System.Windows.Forms.Label
        Dim WohinLabel As System.Windows.Forms.Label
        Dim StatusLabel As System.Windows.Forms.Label
        Dim SummeMWSTLabel As System.Windows.Forms.Label
        Dim SummeBruttoLabel As System.Windows.Forms.Label
        Dim LieferantNrLabel As System.Windows.Forms.Label
        Dim MitarbeiterNrLabel As System.Windows.Forms.Label
        Dim KundNr2Label As System.Windows.Forms.Label
        Dim ZahlungsbedingungLabel1 As System.Windows.Forms.Label
        Dim TransportMethodeLabel1 As System.Windows.Forms.Label
        Dim ZahlungsMethodeLabel1 As System.Windows.Forms.Label
        Dim WaehrungLabel1 As System.Windows.Forms.Label
        Dim ArtNrLabel As System.Windows.Forms.Label
        Dim StkLabel As System.Windows.Forms.Label
        Dim Preis_NettoLabel As System.Windows.Forms.Label
        Dim Preis_BruttoLabel As System.Windows.Forms.Label
        Dim MWSTLabel As System.Windows.Forms.Label
        Dim ArtikelIdentifikationLabel As System.Windows.Forms.Label
        Dim BezeichnungLabel As System.Windows.Forms.Label
        Dim LieferantNrLabel1 As System.Windows.Forms.Label
        Dim StatusLabel1 As System.Windows.Forms.Label
        Dim ReferenzLabel As System.Windows.Forms.Label
        Dim PackungLabel As System.Windows.Forms.Label
        Dim HerkunftLabel As System.Windows.Forms.Label
        Dim IncotermLabel As System.Windows.Forms.Label
        Dim SpezifikationLabel As System.Windows.Forms.Label
        Dim ZeitpunktLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Vorgang))
        Me.DsVorgaenge = New IntraSell_Net.dsVorgaenge()
        Me.BuchvorgangBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.BuchvorgangTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager()
        Me.Buchvorgang_artikelTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgang_artikelTableAdapter()
        Me.BuchvorgangBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.BuchvorgangBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.DatumDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.NotizTextBox = New System.Windows.Forms.TextBox()
        Me.NotizInternTextBox = New System.Windows.Forms.TextBox()
        Me.NotizExternTextBox = New System.Windows.Forms.TextBox()
        Me.SummeTextBox = New System.Windows.Forms.TextBox()
        Me.BezahltCheckBox = New System.Windows.Forms.CheckBox()
        Me.AusgedrucktCheckBox = New System.Windows.Forms.CheckBox()
        Me.AbgeschlossenCheckBox = New System.Windows.Forms.CheckBox()
        Me.WoherTextBox = New System.Windows.Forms.TextBox()
        Me.WohinTextBox = New System.Windows.Forms.TextBox()
        Me.StatusComboBox = New System.Windows.Forms.ComboBox()
        Me.SummeMWSTTextBox = New System.Windows.Forms.TextBox()
        Me.SummeBruttoTextBox = New System.Windows.Forms.TextBox()
        Me.LieferantNrComboBox = New System.Windows.Forms.ComboBox()
        Me.MitarbeiterNrComboBox = New IntraSell_Net.MitarbeiterControl()
        Me.Buchvorgang_artikelBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Buchvorgang_artikelDataGridView = New System.Windows.Forms.DataGridView()
        Me.ArtikelContextMenuStrip = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ArtikelstammToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.GrArtikellisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.ZahlungsbedingungComboBox = New System.Windows.Forms.ComboBox()
        Me.TransportMethodeComboBox = New System.Windows.Forms.ComboBox()
        Me.ZahlungsMethodeComboBox = New System.Windows.Forms.ComboBox()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.AddNewButton = New System.Windows.Forms.Button()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.VorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NeuerVorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AusdruckenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AbschliessenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StornoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExportierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KonvertierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorlagenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KassaBuchungToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SendeEmailToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorlageeditierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.WaehrungComboBox = New System.Windows.Forms.ComboBox()
        Me.KundNr2AdressenControl = New IntraSell_Net.AdressenWeitereControl()
        Me.KundNrAdressenControl = New IntraSell_Net.AdressenControl()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.TextBox2 = New System.Windows.Forms.TextBox()
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.NeuePositionButton = New System.Windows.Forms.Button()
        Me.ArtikelControl1 = New IntraSell_Net.ArtikelControl()
        Me.StkTextBox = New System.Windows.Forms.TextBox()
        Me.Preis_NettoTextBox = New System.Windows.Forms.TextBox()
        Me.Preis_BruttoTextBox = New System.Windows.Forms.TextBox()
        Me.MWSTTextBox = New System.Windows.Forms.TextBox()
        Me.ArtikelIdentifikationTextBox = New System.Windows.Forms.TextBox()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.LieferantNrTextBox = New System.Windows.Forms.TextBox()
        Me.StatusTextBox = New System.Windows.Forms.TextBox()
        Me.ReferenzTextBox = New System.Windows.Forms.TextBox()
        Me.PackungTextBox = New System.Windows.Forms.TextBox()
        Me.HerkunftTextBox = New System.Windows.Forms.TextBox()
        Me.IncotermTextBox = New System.Windows.Forms.TextBox()
        Me.SpezifikationTextBox = New System.Windows.Forms.TextBox()
        Me.ZeitpunktDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.GrArtikellisteTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        Me.DataGridViewTextBoxColumnID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnNummer = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnTyp = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnStk = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ArtNrComboBox = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.DataGridViewTextBoxColumnArtNr = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnBezeichnung = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnPreisNetto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnPreisBrutto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnMWST = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnEKPreis = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn10 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn14 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn15 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn16 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn19 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        NummerLabel = New System.Windows.Forms.Label()
        TypLabel = New System.Windows.Forms.Label()
        KundNrLabel = New System.Windows.Forms.Label()
        DatumLabel = New System.Windows.Forms.Label()
        NotizLabel = New System.Windows.Forms.Label()
        NotizInternLabel = New System.Windows.Forms.Label()
        NotizExternLabel = New System.Windows.Forms.Label()
        SummeLabel = New System.Windows.Forms.Label()
        WoherLabel = New System.Windows.Forms.Label()
        WohinLabel = New System.Windows.Forms.Label()
        StatusLabel = New System.Windows.Forms.Label()
        SummeMWSTLabel = New System.Windows.Forms.Label()
        SummeBruttoLabel = New System.Windows.Forms.Label()
        LieferantNrLabel = New System.Windows.Forms.Label()
        MitarbeiterNrLabel = New System.Windows.Forms.Label()
        KundNr2Label = New System.Windows.Forms.Label()
        ZahlungsbedingungLabel1 = New System.Windows.Forms.Label()
        TransportMethodeLabel1 = New System.Windows.Forms.Label()
        ZahlungsMethodeLabel1 = New System.Windows.Forms.Label()
        WaehrungLabel1 = New System.Windows.Forms.Label()
        ArtNrLabel = New System.Windows.Forms.Label()
        StkLabel = New System.Windows.Forms.Label()
        Preis_NettoLabel = New System.Windows.Forms.Label()
        Preis_BruttoLabel = New System.Windows.Forms.Label()
        MWSTLabel = New System.Windows.Forms.Label()
        ArtikelIdentifikationLabel = New System.Windows.Forms.Label()
        BezeichnungLabel = New System.Windows.Forms.Label()
        LieferantNrLabel1 = New System.Windows.Forms.Label()
        StatusLabel1 = New System.Windows.Forms.Label()
        ReferenzLabel = New System.Windows.Forms.Label()
        PackungLabel = New System.Windows.Forms.Label()
        HerkunftLabel = New System.Windows.Forms.Label()
        IncotermLabel = New System.Windows.Forms.Label()
        SpezifikationLabel = New System.Windows.Forms.Label()
        ZeitpunktLabel = New System.Windows.Forms.Label()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BuchvorgangBindingNavigator.SuspendLayout()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ArtikelContextMenuStrip.SuspendLayout()
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.MenuStrip1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.TabPage3.SuspendLayout()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        Me.SuspendLayout()
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Location = New System.Drawing.Point(6, 48)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(49, 13)
        NummerLabel.TabIndex = 1
        NummerLabel.Text = "Nummer:"
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(6, 21)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 3
        TypLabel.Text = "Typ:"
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(6, 107)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(41, 13)
        KundNrLabel.TabIndex = 5
        KundNrLabel.Text = "Kunde:"
        '
        'DatumLabel
        '
        DatumLabel.AutoSize = True
        DatumLabel.Location = New System.Drawing.Point(6, 78)
        DatumLabel.Name = "DatumLabel"
        DatumLabel.Size = New System.Drawing.Size(41, 13)
        DatumLabel.TabIndex = 7
        DatumLabel.Text = "Datum:"
        '
        'NotizLabel
        '
        NotizLabel.AutoSize = True
        NotizLabel.Location = New System.Drawing.Point(6, 9)
        NotizLabel.Name = "NotizLabel"
        NotizLabel.Size = New System.Drawing.Size(34, 13)
        NotizLabel.TabIndex = 9
        NotizLabel.Text = "Notiz:"
        '
        'NotizInternLabel
        '
        NotizInternLabel.AutoSize = True
        NotizInternLabel.Location = New System.Drawing.Point(6, 98)
        NotizInternLabel.Name = "NotizInternLabel"
        NotizInternLabel.Size = New System.Drawing.Size(64, 13)
        NotizInternLabel.TabIndex = 11
        NotizInternLabel.Text = "Notiz Intern:"
        '
        'NotizExternLabel
        '
        NotizExternLabel.AutoSize = True
        NotizExternLabel.Location = New System.Drawing.Point(6, 186)
        NotizExternLabel.Name = "NotizExternLabel"
        NotizExternLabel.Size = New System.Drawing.Size(67, 13)
        NotizExternLabel.TabIndex = 13
        NotizExternLabel.Text = "Notiz Extern:"
        '
        'SummeLabel
        '
        SummeLabel.AutoSize = True
        SummeLabel.Location = New System.Drawing.Point(6, 174)
        SummeLabel.Name = "SummeLabel"
        SummeLabel.Size = New System.Drawing.Size(45, 13)
        SummeLabel.TabIndex = 15
        SummeLabel.Text = "Summe:"
        '
        'WoherLabel
        '
        WoherLabel.AutoSize = True
        WoherLabel.Location = New System.Drawing.Point(338, 127)
        WoherLabel.Name = "WoherLabel"
        WoherLabel.Size = New System.Drawing.Size(42, 13)
        WoherLabel.TabIndex = 29
        WoherLabel.Text = "Woher:"
        '
        'WohinLabel
        '
        WohinLabel.AutoSize = True
        WohinLabel.Location = New System.Drawing.Point(338, 153)
        WohinLabel.Name = "WohinLabel"
        WohinLabel.Size = New System.Drawing.Size(41, 13)
        WohinLabel.TabIndex = 31
        WohinLabel.Text = "Wohin:"
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(338, 179)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 33
        StatusLabel.Text = "Status:"
        '
        'SummeMWSTLabel
        '
        SummeMWSTLabel.AutoSize = True
        SummeMWSTLabel.Location = New System.Drawing.Point(6, 200)
        SummeMWSTLabel.Name = "SummeMWSTLabel"
        SummeMWSTLabel.Size = New System.Drawing.Size(82, 13)
        SummeMWSTLabel.TabIndex = 35
        SummeMWSTLabel.Text = "Summe MWST:"
        '
        'SummeBruttoLabel
        '
        SummeBruttoLabel.AutoSize = True
        SummeBruttoLabel.Location = New System.Drawing.Point(6, 226)
        SummeBruttoLabel.Name = "SummeBruttoLabel"
        SummeBruttoLabel.Size = New System.Drawing.Size(76, 13)
        SummeBruttoLabel.TabIndex = 37
        SummeBruttoLabel.Text = "Summe Brutto:"
        '
        'LieferantNrLabel
        '
        LieferantNrLabel.AutoSize = True
        LieferantNrLabel.Location = New System.Drawing.Point(338, 206)
        LieferantNrLabel.Name = "LieferantNrLabel"
        LieferantNrLabel.Size = New System.Drawing.Size(65, 13)
        LieferantNrLabel.TabIndex = 39
        LieferantNrLabel.Text = "Lieferant Nr:"
        '
        'MitarbeiterNrLabel
        '
        MitarbeiterNrLabel.AutoSize = True
        MitarbeiterNrLabel.Location = New System.Drawing.Point(338, 233)
        MitarbeiterNrLabel.Name = "MitarbeiterNrLabel"
        MitarbeiterNrLabel.Size = New System.Drawing.Size(73, 13)
        MitarbeiterNrLabel.TabIndex = 41
        MitarbeiterNrLabel.Text = "Mitarbeiter Nr:"
        '
        'KundNr2Label
        '
        KundNr2Label.AutoSize = True
        KundNr2Label.Location = New System.Drawing.Point(6, 134)
        KundNr2Label.Name = "KundNr2Label"
        KundNr2Label.Size = New System.Drawing.Size(73, 13)
        KundNr2Label.TabIndex = 43
        KundNr2Label.Text = "Lieferadresse:"
        '
        'ZahlungsbedingungLabel1
        '
        ZahlungsbedingungLabel1.AutoSize = True
        ZahlungsbedingungLabel1.Location = New System.Drawing.Point(338, 74)
        ZahlungsbedingungLabel1.Name = "ZahlungsbedingungLabel1"
        ZahlungsbedingungLabel1.Size = New System.Drawing.Size(104, 13)
        ZahlungsbedingungLabel1.TabIndex = 49
        ZahlungsbedingungLabel1.Text = "Zahlungsbedingung:"
        '
        'TransportMethodeLabel1
        '
        TransportMethodeLabel1.AutoSize = True
        TransportMethodeLabel1.Location = New System.Drawing.Point(338, 100)
        TransportMethodeLabel1.Name = "TransportMethodeLabel1"
        TransportMethodeLabel1.Size = New System.Drawing.Size(55, 13)
        TransportMethodeLabel1.TabIndex = 50
        TransportMethodeLabel1.Text = "Transport:"
        '
        'ZahlungsMethodeLabel1
        '
        ZahlungsMethodeLabel1.AutoSize = True
        ZahlungsMethodeLabel1.Location = New System.Drawing.Point(338, 47)
        ZahlungsMethodeLabel1.Name = "ZahlungsMethodeLabel1"
        ZahlungsMethodeLabel1.Size = New System.Drawing.Size(95, 13)
        ZahlungsMethodeLabel1.TabIndex = 51
        ZahlungsMethodeLabel1.Text = "Zahlungsmethode:"
        '
        'WaehrungLabel1
        '
        WaehrungLabel1.AutoSize = True
        WaehrungLabel1.Location = New System.Drawing.Point(6, 252)
        WaehrungLabel1.Name = "WaehrungLabel1"
        WaehrungLabel1.Size = New System.Drawing.Size(54, 13)
        WaehrungLabel1.TabIndex = 52
        WaehrungLabel1.Text = "Währung:"
        '
        'ArtNrLabel
        '
        ArtNrLabel.AutoSize = True
        ArtNrLabel.Location = New System.Drawing.Point(8, 21)
        ArtNrLabel.Name = "ArtNrLabel"
        ArtNrLabel.Size = New System.Drawing.Size(37, 13)
        ArtNrLabel.TabIndex = 6
        ArtNrLabel.Text = "Art Nr:"
        '
        'StkLabel
        '
        StkLabel.AutoSize = True
        StkLabel.Location = New System.Drawing.Point(10, 77)
        StkLabel.Name = "StkLabel"
        StkLabel.Size = New System.Drawing.Size(43, 13)
        StkLabel.TabIndex = 8
        StkLabel.Text = "Menge:"
        '
        'Preis_NettoLabel
        '
        Preis_NettoLabel.AutoSize = True
        Preis_NettoLabel.Location = New System.Drawing.Point(8, 103)
        Preis_NettoLabel.Name = "Preis_NettoLabel"
        Preis_NettoLabel.Size = New System.Drawing.Size(62, 13)
        Preis_NettoLabel.TabIndex = 12
        Preis_NettoLabel.Text = "Preis Netto:"
        '
        'Preis_BruttoLabel
        '
        Preis_BruttoLabel.AutoSize = True
        Preis_BruttoLabel.Location = New System.Drawing.Point(8, 129)
        Preis_BruttoLabel.Name = "Preis_BruttoLabel"
        Preis_BruttoLabel.Size = New System.Drawing.Size(64, 13)
        Preis_BruttoLabel.TabIndex = 14
        Preis_BruttoLabel.Text = "Preis Brutto:"
        '
        'MWSTLabel
        '
        MWSTLabel.AutoSize = True
        MWSTLabel.Location = New System.Drawing.Point(8, 155)
        MWSTLabel.Name = "MWSTLabel"
        MWSTLabel.Size = New System.Drawing.Size(44, 13)
        MWSTLabel.TabIndex = 16
        MWSTLabel.Text = "MWST:"
        '
        'ArtikelIdentifikationLabel
        '
        ArtikelIdentifikationLabel.AutoSize = True
        ArtikelIdentifikationLabel.Location = New System.Drawing.Point(8, 181)
        ArtikelIdentifikationLabel.Name = "ArtikelIdentifikationLabel"
        ArtikelIdentifikationLabel.Size = New System.Drawing.Size(102, 13)
        ArtikelIdentifikationLabel.TabIndex = 18
        ArtikelIdentifikationLabel.Text = "Artikel Identifikation:"
        '
        'BezeichnungLabel
        '
        BezeichnungLabel.AutoSize = True
        BezeichnungLabel.Location = New System.Drawing.Point(8, 51)
        BezeichnungLabel.Name = "BezeichnungLabel"
        BezeichnungLabel.Size = New System.Drawing.Size(72, 13)
        BezeichnungLabel.TabIndex = 20
        BezeichnungLabel.Text = "Bezeichnung:"
        '
        'LieferantNrLabel1
        '
        LieferantNrLabel1.AutoSize = True
        LieferantNrLabel1.Location = New System.Drawing.Point(386, 23)
        LieferantNrLabel1.Name = "LieferantNrLabel1"
        LieferantNrLabel1.Size = New System.Drawing.Size(65, 13)
        LieferantNrLabel1.TabIndex = 22
        LieferantNrLabel1.Text = "Lieferant Nr:"
        '
        'StatusLabel1
        '
        StatusLabel1.AutoSize = True
        StatusLabel1.Location = New System.Drawing.Point(386, 49)
        StatusLabel1.Name = "StatusLabel1"
        StatusLabel1.Size = New System.Drawing.Size(40, 13)
        StatusLabel1.TabIndex = 24
        StatusLabel1.Text = "Status:"
        '
        'ReferenzLabel
        '
        ReferenzLabel.AutoSize = True
        ReferenzLabel.Location = New System.Drawing.Point(386, 75)
        ReferenzLabel.Name = "ReferenzLabel"
        ReferenzLabel.Size = New System.Drawing.Size(53, 13)
        ReferenzLabel.TabIndex = 26
        ReferenzLabel.Text = "Referenz:"
        '
        'PackungLabel
        '
        PackungLabel.AutoSize = True
        PackungLabel.Location = New System.Drawing.Point(386, 101)
        PackungLabel.Name = "PackungLabel"
        PackungLabel.Size = New System.Drawing.Size(53, 13)
        PackungLabel.TabIndex = 28
        PackungLabel.Text = "Packung:"
        '
        'HerkunftLabel
        '
        HerkunftLabel.AutoSize = True
        HerkunftLabel.Location = New System.Drawing.Point(386, 127)
        HerkunftLabel.Name = "HerkunftLabel"
        HerkunftLabel.Size = New System.Drawing.Size(51, 13)
        HerkunftLabel.TabIndex = 30
        HerkunftLabel.Text = "Herkunft:"
        '
        'IncotermLabel
        '
        IncotermLabel.AutoSize = True
        IncotermLabel.Location = New System.Drawing.Point(386, 153)
        IncotermLabel.Name = "IncotermLabel"
        IncotermLabel.Size = New System.Drawing.Size(51, 13)
        IncotermLabel.TabIndex = 32
        IncotermLabel.Text = "Incoterm:"
        '
        'SpezifikationLabel
        '
        SpezifikationLabel.AutoSize = True
        SpezifikationLabel.Location = New System.Drawing.Point(386, 179)
        SpezifikationLabel.Name = "SpezifikationLabel"
        SpezifikationLabel.Size = New System.Drawing.Size(70, 13)
        SpezifikationLabel.TabIndex = 34
        SpezifikationLabel.Text = "Spezifikation:"
        '
        'ZeitpunktLabel
        '
        ZeitpunktLabel.AutoSize = True
        ZeitpunktLabel.Location = New System.Drawing.Point(386, 206)
        ZeitpunktLabel.Name = "ZeitpunktLabel"
        ZeitpunktLabel.Size = New System.Drawing.Size(55, 13)
        ZeitpunktLabel.TabIndex = 36
        ZeitpunktLabel.Text = "Zeitpunkt:"
        '
        'DsVorgaenge
        '
        Me.DsVorgaenge.DataSetName = "dsVorgaenge"
        Me.DsVorgaenge.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BuchvorgangBindingSource
        '
        Me.BuchvorgangBindingSource.DataMember = "buchvorgang"
        Me.BuchvorgangBindingSource.DataSource = Me.DsVorgaenge
        '
        'BuchvorgangTableAdapter
        '
        Me.BuchvorgangTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.buchvorgaengeausdruckeTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengeeigenschaftenTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengestatusTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengeTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgang_artikeldetaillagerTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgang_artikelTableAdapter = Me.Buchvorgang_artikelTableAdapter
        Me.TableAdapterManager.buchvorgangeigenschaftTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgangTableAdapter = Me.BuchvorgangTableAdapter
        Me.TableAdapterManager.buchvorgangtypTableAdapter = Nothing
        Me.TableAdapterManager.grartikelTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Buchvorgang_artikelTableAdapter
        '
        Me.Buchvorgang_artikelTableAdapter.ClearBeforeFill = True
        '
        'BuchvorgangBindingNavigator
        '
        Me.BuchvorgangBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.BuchvorgangBindingNavigator.BindingSource = Me.BuchvorgangBindingSource
        Me.BuchvorgangBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.BuchvorgangBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.BuchvorgangBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.BuchvorgangBindingNavigatorSaveItem})
        Me.BuchvorgangBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.BuchvorgangBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.BuchvorgangBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.BuchvorgangBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.BuchvorgangBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.BuchvorgangBindingNavigator.Name = "BuchvorgangBindingNavigator"
        Me.BuchvorgangBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.BuchvorgangBindingNavigator.Size = New System.Drawing.Size(871, 25)
        Me.BuchvorgangBindingNavigator.TabIndex = 0
        Me.BuchvorgangBindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem.Enabled = False
        Me.BindingNavigatorAddNewItem.Image = CType(resources.GetObject("BindingNavigatorAddNewItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem.Text = "Add new"
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(35, 22)
        Me.BindingNavigatorCountItem.Text = "of {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem.Text = "Delete"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem.Text = "Move first"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem.Text = "Move previous"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Position"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Current position"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator1"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem.Text = "Move next"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem.Text = "Move last"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator2"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'BuchvorgangBindingNavigatorSaveItem
        '
        Me.BuchvorgangBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BuchvorgangBindingNavigatorSaveItem.Image = CType(resources.GetObject("BuchvorgangBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.BuchvorgangBindingNavigatorSaveItem.Name = "BuchvorgangBindingNavigatorSaveItem"
        Me.BuchvorgangBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.BuchvorgangBindingNavigatorSaveItem.Text = "Save Data"
        '
        'NummerTextBox
        '
        Me.NummerTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Nummer", True))
        Me.NummerTextBox.Enabled = False
        Me.NummerTextBox.Location = New System.Drawing.Point(120, 45)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(131, 20)
        Me.NummerTextBox.TabIndex = 2
        '
        'TypComboBox
        '
        Me.TypComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.BuchvorgangBindingSource, "Typ", True))
        Me.TypComboBox.Enabled = False
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(120, 18)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypComboBox.TabIndex = 1
        '
        'DatumDateTimePicker
        '
        Me.DatumDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.BuchvorgangBindingSource, "Datum", True))
        Me.DatumDateTimePicker.Enabled = False
        Me.DatumDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DatumDateTimePicker.Location = New System.Drawing.Point(120, 74)
        Me.DatumDateTimePicker.Name = "DatumDateTimePicker"
        Me.DatumDateTimePicker.Size = New System.Drawing.Size(131, 20)
        Me.DatumDateTimePicker.TabIndex = 3
        '
        'NotizTextBox
        '
        Me.NotizTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Notiz", True))
        Me.NotizTextBox.Location = New System.Drawing.Point(120, 6)
        Me.NotizTextBox.Multiline = True
        Me.NotizTextBox.Name = "NotizTextBox"
        Me.NotizTextBox.Size = New System.Drawing.Size(541, 83)
        Me.NotizTextBox.TabIndex = 10
        '
        'NotizInternTextBox
        '
        Me.NotizInternTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "NotizIntern", True))
        Me.NotizInternTextBox.Location = New System.Drawing.Point(120, 95)
        Me.NotizInternTextBox.Multiline = True
        Me.NotizInternTextBox.Name = "NotizInternTextBox"
        Me.NotizInternTextBox.Size = New System.Drawing.Size(541, 83)
        Me.NotizInternTextBox.TabIndex = 12
        '
        'NotizExternTextBox
        '
        Me.NotizExternTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "NotizExtern", True))
        Me.NotizExternTextBox.Location = New System.Drawing.Point(120, 183)
        Me.NotizExternTextBox.Multiline = True
        Me.NotizExternTextBox.Name = "NotizExternTextBox"
        Me.NotizExternTextBox.Size = New System.Drawing.Size(541, 83)
        Me.NotizExternTextBox.TabIndex = 14
        '
        'SummeTextBox
        '
        Me.SummeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Summe", True))
        Me.SummeTextBox.Location = New System.Drawing.Point(120, 171)
        Me.SummeTextBox.Name = "SummeTextBox"
        Me.SummeTextBox.ReadOnly = True
        Me.SummeTextBox.Size = New System.Drawing.Size(131, 20)
        Me.SummeTextBox.TabIndex = 6
        Me.SummeTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'BezahltCheckBox
        '
        Me.BezahltCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Bezahlt", True))
        Me.BezahltCheckBox.Enabled = False
        Me.BezahltCheckBox.Location = New System.Drawing.Point(347, 16)
        Me.BezahltCheckBox.Name = "BezahltCheckBox"
        Me.BezahltCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.BezahltCheckBox.TabIndex = 10
        Me.BezahltCheckBox.Text = "bezahlt"
        Me.BezahltCheckBox.UseVisualStyleBackColor = True
        '
        'AusgedrucktCheckBox
        '
        Me.AusgedrucktCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Ausgedruckt", True))
        Me.AusgedrucktCheckBox.Enabled = False
        Me.AusgedrucktCheckBox.Location = New System.Drawing.Point(452, 16)
        Me.AusgedrucktCheckBox.Name = "AusgedrucktCheckBox"
        Me.AusgedrucktCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AusgedrucktCheckBox.TabIndex = 11
        Me.AusgedrucktCheckBox.Text = "ausgedruckt"
        Me.AusgedrucktCheckBox.UseVisualStyleBackColor = True
        '
        'AbgeschlossenCheckBox
        '
        Me.AbgeschlossenCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Abgeschlossen", True))
        Me.AbgeschlossenCheckBox.Enabled = False
        Me.AbgeschlossenCheckBox.Location = New System.Drawing.Point(559, 16)
        Me.AbgeschlossenCheckBox.Name = "AbgeschlossenCheckBox"
        Me.AbgeschlossenCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AbgeschlossenCheckBox.TabIndex = 12
        Me.AbgeschlossenCheckBox.Text = "abgeschlosen"
        Me.AbgeschlossenCheckBox.UseVisualStyleBackColor = True
        '
        'WoherTextBox
        '
        Me.WoherTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Woher", True))
        Me.WoherTextBox.Enabled = False
        Me.WoherTextBox.Location = New System.Drawing.Point(452, 124)
        Me.WoherTextBox.Name = "WoherTextBox"
        Me.WoherTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WoherTextBox.TabIndex = 17
        '
        'WohinTextBox
        '
        Me.WohinTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Wohin", True))
        Me.WohinTextBox.Enabled = False
        Me.WohinTextBox.Location = New System.Drawing.Point(452, 150)
        Me.WohinTextBox.Name = "WohinTextBox"
        Me.WohinTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WohinTextBox.TabIndex = 18
        '
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(452, 176)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 19
        '
        'SummeMWSTTextBox
        '
        Me.SummeMWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeMWST", True))
        Me.SummeMWSTTextBox.Location = New System.Drawing.Point(120, 197)
        Me.SummeMWSTTextBox.Name = "SummeMWSTTextBox"
        Me.SummeMWSTTextBox.ReadOnly = True
        Me.SummeMWSTTextBox.Size = New System.Drawing.Size(131, 20)
        Me.SummeMWSTTextBox.TabIndex = 7
        Me.SummeMWSTTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'SummeBruttoTextBox
        '
        Me.SummeBruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeBrutto", True))
        Me.SummeBruttoTextBox.Location = New System.Drawing.Point(120, 223)
        Me.SummeBruttoTextBox.Name = "SummeBruttoTextBox"
        Me.SummeBruttoTextBox.ReadOnly = True
        Me.SummeBruttoTextBox.Size = New System.Drawing.Size(131, 20)
        Me.SummeBruttoTextBox.TabIndex = 8
        Me.SummeBruttoTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'LieferantNrComboBox
        '
        Me.LieferantNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "LieferantNr", True))
        Me.LieferantNrComboBox.FormattingEnabled = True
        Me.LieferantNrComboBox.Location = New System.Drawing.Point(452, 203)
        Me.LieferantNrComboBox.Name = "LieferantNrComboBox"
        Me.LieferantNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.LieferantNrComboBox.TabIndex = 20
        '
        'MitarbeiterNrComboBox
        '
        Me.MitarbeiterNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "MitarbeiterNr", True))
        Me.MitarbeiterNrComboBox.IDNR = 0
        Me.MitarbeiterNrComboBox.Location = New System.Drawing.Point(452, 230)
        Me.MitarbeiterNrComboBox.Name = "MitarbeiterNrComboBox"
        Me.MitarbeiterNrComboBox.Size = New System.Drawing.Size(155, 25)
        Me.MitarbeiterNrComboBox.TabIndex = 21
        '
        'Buchvorgang_artikelBindingSource
        '
        Me.Buchvorgang_artikelBindingSource.DataMember = "buchVorgang-artikel_ibfk_1"
        Me.Buchvorgang_artikelBindingSource.DataSource = Me.BuchvorgangBindingSource
        '
        'Buchvorgang_artikelDataGridView
        '
        Me.Buchvorgang_artikelDataGridView.AutoGenerateColumns = False
        Me.Buchvorgang_artikelDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Buchvorgang_artikelDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumnID, Me.DataGridViewTextBoxColumnNummer, Me.DataGridViewTextBoxColumnTyp, Me.DataGridViewTextBoxColumnStk, Me.ArtNrComboBox, Me.DataGridViewTextBoxColumnArtNr, Me.DataGridViewTextBoxColumnBezeichnung, Me.DataGridViewTextBoxColumnPreisNetto, Me.DataGridViewTextBoxColumnPreisBrutto, Me.DataGridViewTextBoxColumnMWST, Me.DataGridViewTextBoxColumnEKPreis, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn19})
        Me.Buchvorgang_artikelDataGridView.DataSource = Me.Buchvorgang_artikelBindingSource
        Me.Buchvorgang_artikelDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Buchvorgang_artikelDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.Buchvorgang_artikelDataGridView.Name = "Buchvorgang_artikelDataGridView"
        Me.Buchvorgang_artikelDataGridView.Size = New System.Drawing.Size(871, 352)
        Me.Buchvorgang_artikelDataGridView.TabIndex = 49
        '
        'ArtikelContextMenuStrip
        '
        Me.ArtikelContextMenuStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ArtikelstammToolStripMenuItem})
        Me.ArtikelContextMenuStrip.Name = "ArtikelContextMenuStrip"
        Me.ArtikelContextMenuStrip.Size = New System.Drawing.Size(143, 26)
        '
        'ArtikelstammToolStripMenuItem
        '
        Me.ArtikelstammToolStripMenuItem.Name = "ArtikelstammToolStripMenuItem"
        Me.ArtikelstammToolStripMenuItem.Size = New System.Drawing.Size(142, 22)
        Me.ArtikelstammToolStripMenuItem.Text = "Stammdaten"
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
        'ZahlungsbedingungComboBox
        '
        Me.ZahlungsbedingungComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Zahlungsbedingung", True))
        Me.ZahlungsbedingungComboBox.FormattingEnabled = True
        Me.ZahlungsbedingungComboBox.Location = New System.Drawing.Point(452, 71)
        Me.ZahlungsbedingungComboBox.Name = "ZahlungsbedingungComboBox"
        Me.ZahlungsbedingungComboBox.Size = New System.Drawing.Size(200, 21)
        Me.ZahlungsbedingungComboBox.TabIndex = 14
        '
        'TransportMethodeComboBox
        '
        Me.TransportMethodeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "TransportMethode", True))
        Me.TransportMethodeComboBox.FormattingEnabled = True
        Me.TransportMethodeComboBox.Location = New System.Drawing.Point(452, 97)
        Me.TransportMethodeComboBox.Name = "TransportMethodeComboBox"
        Me.TransportMethodeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.TransportMethodeComboBox.TabIndex = 15
        '
        'ZahlungsMethodeComboBox
        '
        Me.ZahlungsMethodeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "ZahlungsMethode", True))
        Me.ZahlungsMethodeComboBox.FormattingEnabled = True
        Me.ZahlungsMethodeComboBox.Location = New System.Drawing.Point(452, 44)
        Me.ZahlungsMethodeComboBox.Name = "ZahlungsMethodeComboBox"
        Me.ZahlungsMethodeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.ZahlungsMethodeComboBox.TabIndex = 13
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl1.Location = New System.Drawing.Point(0, 0)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(871, 300)
        Me.TabControl1.TabIndex = 10
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.AddNewButton)
        Me.TabPage1.Controls.Add(Me.BezahltCheckBox)
        Me.TabPage1.Controls.Add(Me.MitarbeiterNrComboBox)
        Me.TabPage1.Controls.Add(WaehrungLabel1)
        Me.TabPage1.Controls.Add(ZahlungsMethodeLabel1)
        Me.TabPage1.Controls.Add(Me.MenuStrip1)
        Me.TabPage1.Controls.Add(MitarbeiterNrLabel)
        Me.TabPage1.Controls.Add(Me.WaehrungComboBox)
        Me.TabPage1.Controls.Add(Me.ZahlungsMethodeComboBox)
        Me.TabPage1.Controls.Add(Me.KundNr2AdressenControl)
        Me.TabPage1.Controls.Add(Me.LieferantNrComboBox)
        Me.TabPage1.Controls.Add(KundNr2Label)
        Me.TabPage1.Controls.Add(TransportMethodeLabel1)
        Me.TabPage1.Controls.Add(Me.KundNrAdressenControl)
        Me.TabPage1.Controls.Add(LieferantNrLabel)
        Me.TabPage1.Controls.Add(NummerLabel)
        Me.TabPage1.Controls.Add(Me.TransportMethodeComboBox)
        Me.TabPage1.Controls.Add(Me.NummerTextBox)
        Me.TabPage1.Controls.Add(Me.StatusComboBox)
        Me.TabPage1.Controls.Add(TypLabel)
        Me.TabPage1.Controls.Add(Me.TypComboBox)
        Me.TabPage1.Controls.Add(ZahlungsbedingungLabel1)
        Me.TabPage1.Controls.Add(KundNrLabel)
        Me.TabPage1.Controls.Add(StatusLabel)
        Me.TabPage1.Controls.Add(DatumLabel)
        Me.TabPage1.Controls.Add(Me.ZahlungsbedingungComboBox)
        Me.TabPage1.Controls.Add(Me.DatumDateTimePicker)
        Me.TabPage1.Controls.Add(Me.WohinTextBox)
        Me.TabPage1.Controls.Add(SummeLabel)
        Me.TabPage1.Controls.Add(WohinLabel)
        Me.TabPage1.Controls.Add(Me.SummeTextBox)
        Me.TabPage1.Controls.Add(Me.WoherTextBox)
        Me.TabPage1.Controls.Add(SummeMWSTLabel)
        Me.TabPage1.Controls.Add(WoherLabel)
        Me.TabPage1.Controls.Add(Me.SummeMWSTTextBox)
        Me.TabPage1.Controls.Add(Me.AbgeschlossenCheckBox)
        Me.TabPage1.Controls.Add(SummeBruttoLabel)
        Me.TabPage1.Controls.Add(Me.AusgedrucktCheckBox)
        Me.TabPage1.Controls.Add(Me.SummeBruttoTextBox)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(863, 274)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Status"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'AddNewButton
        '
        Me.AddNewButton.Anchor = System.Windows.Forms.AnchorStyles.Right
        Me.AddNewButton.Location = New System.Drawing.Point(656, 15)
        Me.AddNewButton.Margin = New System.Windows.Forms.Padding(1)
        Me.AddNewButton.Name = "AddNewButton"
        Me.AddNewButton.Size = New System.Drawing.Size(20, 77)
        Me.AddNewButton.TabIndex = 16
        Me.AddNewButton.Text = "+"
        Me.AddNewButton.UseVisualStyleBackColor = True
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Dock = System.Windows.Forms.DockStyle.None
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VorgangToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(610, 233)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(127, 24)
        Me.MenuStrip1.TabIndex = 53
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'VorgangToolStripMenuItem
        '
        Me.VorgangToolStripMenuItem.BackColor = System.Drawing.Color.CornflowerBlue
        Me.VorgangToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NeuerVorgangToolStripMenuItem, Me.AusdruckenToolStripMenuItem, Me.AbschliessenToolStripMenuItem, Me.StornoToolStripMenuItem, Me.ExportierenToolStripMenuItem, Me.KonvertierenToolStripMenuItem, Me.VorlagenToolStripMenuItem, Me.KassaBuchungToolStripMenuItem, Me.SendeEmailToolStripMenuItem, Me.VorlageeditierenToolStripMenuItem})
        Me.VorgangToolStripMenuItem.Name = "VorgangToolStripMenuItem"
        Me.VorgangToolStripMenuItem.Size = New System.Drawing.Size(119, 20)
        Me.VorgangToolStripMenuItem.Text = "&Vorgang Aufgaben"
        '
        'NeuerVorgangToolStripMenuItem
        '
        Me.NeuerVorgangToolStripMenuItem.Name = "NeuerVorgangToolStripMenuItem"
        Me.NeuerVorgangToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.NeuerVorgangToolStripMenuItem.Text = "&Neuer Vorgang"
        '
        'AusdruckenToolStripMenuItem
        '
        Me.AusdruckenToolStripMenuItem.Name = "AusdruckenToolStripMenuItem"
        Me.AusdruckenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.AusdruckenToolStripMenuItem.Text = "Ausdrucken"
        '
        'AbschliessenToolStripMenuItem
        '
        Me.AbschliessenToolStripMenuItem.Name = "AbschliessenToolStripMenuItem"
        Me.AbschliessenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.AbschliessenToolStripMenuItem.Text = "&Abschliessen"
        '
        'StornoToolStripMenuItem
        '
        Me.StornoToolStripMenuItem.Name = "StornoToolStripMenuItem"
        Me.StornoToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.StornoToolStripMenuItem.Text = "&Storno"
        '
        'ExportierenToolStripMenuItem
        '
        Me.ExportierenToolStripMenuItem.Name = "ExportierenToolStripMenuItem"
        Me.ExportierenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.ExportierenToolStripMenuItem.Text = "&Exportieren"
        '
        'KonvertierenToolStripMenuItem
        '
        Me.KonvertierenToolStripMenuItem.Name = "KonvertierenToolStripMenuItem"
        Me.KonvertierenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.KonvertierenToolStripMenuItem.Text = "&Konvertieren"
        '
        'VorlagenToolStripMenuItem
        '
        Me.VorlagenToolStripMenuItem.Name = "VorlagenToolStripMenuItem"
        Me.VorlagenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.VorlagenToolStripMenuItem.Text = "&Vorlagen"
        '
        'KassaBuchungToolStripMenuItem
        '
        Me.KassaBuchungToolStripMenuItem.Name = "KassaBuchungToolStripMenuItem"
        Me.KassaBuchungToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.KassaBuchungToolStripMenuItem.Text = "Kassa &Buchung"
        '
        'SendeEmailToolStripMenuItem
        '
        Me.SendeEmailToolStripMenuItem.Name = "SendeEmailToolStripMenuItem"
        Me.SendeEmailToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.SendeEmailToolStripMenuItem.Text = "Sende &Email"
        '
        'VorlageeditierenToolStripMenuItem
        '
        Me.VorlageeditierenToolStripMenuItem.Name = "VorlageeditierenToolStripMenuItem"
        Me.VorlageeditierenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.VorlageeditierenToolStripMenuItem.Text = "Vorlage &editieren"
        '
        'WaehrungComboBox
        '
        Me.WaehrungComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Waehrung", True))
        Me.WaehrungComboBox.FormattingEnabled = True
        Me.WaehrungComboBox.Location = New System.Drawing.Point(120, 249)
        Me.WaehrungComboBox.Name = "WaehrungComboBox"
        Me.WaehrungComboBox.Size = New System.Drawing.Size(131, 21)
        Me.WaehrungComboBox.TabIndex = 9
        '
        'KundNr2AdressenControl
        '
        Me.KundNr2AdressenControl.DataBindings.Add(New System.Windows.Forms.Binding("ID", Me.BuchvorgangBindingSource, "KundNr2", True))
        Me.KundNr2AdressenControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "KundNr", True))
        Me.KundNr2AdressenControl.ID = 0
        Me.KundNr2AdressenControl.IDNR = 0
        Me.KundNr2AdressenControl.Location = New System.Drawing.Point(120, 131)
        Me.KundNr2AdressenControl.Name = "KundNr2AdressenControl"
        Me.KundNr2AdressenControl.ShowAddNew = False
        Me.KundNr2AdressenControl.Size = New System.Drawing.Size(172, 25)
        Me.KundNr2AdressenControl.TabIndex = 5
        '
        'KundNrAdressenControl
        '
        Me.KundNrAdressenControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "KundNr", True))
        Me.KundNrAdressenControl.IDNR = 0
        Me.KundNrAdressenControl.Location = New System.Drawing.Point(120, 100)
        Me.KundNrAdressenControl.Name = "KundNrAdressenControl"
        Me.KundNrAdressenControl.ShowAddNew = False
        Me.KundNrAdressenControl.Size = New System.Drawing.Size(172, 25)
        Me.KundNrAdressenControl.TabIndex = 4
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.NotizTextBox)
        Me.TabPage2.Controls.Add(Me.NotizExternTextBox)
        Me.TabPage2.Controls.Add(NotizExternLabel)
        Me.TabPage2.Controls.Add(Me.NotizInternTextBox)
        Me.TabPage2.Controls.Add(NotizInternLabel)
        Me.TabPage2.Controls.Add(NotizLabel)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(863, 274)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Notizen"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'TabPage3
        '
        Me.TabPage3.AutoScroll = True
        Me.TabPage3.Controls.Add(Me.TextBox2)
        Me.TabPage3.Controls.Add(Me.TextBox1)
        Me.TabPage3.Controls.Add(Me.NeuePositionButton)
        Me.TabPage3.Controls.Add(Me.ArtikelControl1)
        Me.TabPage3.Controls.Add(ArtNrLabel)
        Me.TabPage3.Controls.Add(StkLabel)
        Me.TabPage3.Controls.Add(Me.StkTextBox)
        Me.TabPage3.Controls.Add(Preis_NettoLabel)
        Me.TabPage3.Controls.Add(Me.Preis_NettoTextBox)
        Me.TabPage3.Controls.Add(Preis_BruttoLabel)
        Me.TabPage3.Controls.Add(Me.Preis_BruttoTextBox)
        Me.TabPage3.Controls.Add(MWSTLabel)
        Me.TabPage3.Controls.Add(Me.MWSTTextBox)
        Me.TabPage3.Controls.Add(ArtikelIdentifikationLabel)
        Me.TabPage3.Controls.Add(Me.ArtikelIdentifikationTextBox)
        Me.TabPage3.Controls.Add(BezeichnungLabel)
        Me.TabPage3.Controls.Add(Me.BezeichnungTextBox)
        Me.TabPage3.Controls.Add(LieferantNrLabel1)
        Me.TabPage3.Controls.Add(Me.LieferantNrTextBox)
        Me.TabPage3.Controls.Add(StatusLabel1)
        Me.TabPage3.Controls.Add(Me.StatusTextBox)
        Me.TabPage3.Controls.Add(ReferenzLabel)
        Me.TabPage3.Controls.Add(Me.ReferenzTextBox)
        Me.TabPage3.Controls.Add(PackungLabel)
        Me.TabPage3.Controls.Add(Me.PackungTextBox)
        Me.TabPage3.Controls.Add(HerkunftLabel)
        Me.TabPage3.Controls.Add(Me.HerkunftTextBox)
        Me.TabPage3.Controls.Add(IncotermLabel)
        Me.TabPage3.Controls.Add(Me.IncotermTextBox)
        Me.TabPage3.Controls.Add(SpezifikationLabel)
        Me.TabPage3.Controls.Add(Me.SpezifikationTextBox)
        Me.TabPage3.Controls.Add(ZeitpunktLabel)
        Me.TabPage3.Controls.Add(Me.ZeitpunktDateTimePicker)
        Me.TabPage3.Location = New System.Drawing.Point(4, 22)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage3.Size = New System.Drawing.Size(863, 274)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Position"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'TextBox2
        '
        Me.TextBox2.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Typ", True))
        Me.TextBox2.Location = New System.Drawing.Point(76, 220)
        Me.TextBox2.Name = "TextBox2"
        Me.TextBox2.Size = New System.Drawing.Size(34, 20)
        Me.TextBox2.TabIndex = 40
        '
        'TextBox1
        '
        Me.TextBox1.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Nummer", True))
        Me.TextBox1.Location = New System.Drawing.Point(116, 220)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(104, 20)
        Me.TextBox1.TabIndex = 39
        '
        'NeuePositionButton
        '
        Me.NeuePositionButton.Location = New System.Drawing.Point(724, 18)
        Me.NeuePositionButton.Name = "NeuePositionButton"
        Me.NeuePositionButton.Size = New System.Drawing.Size(105, 24)
        Me.NeuePositionButton.TabIndex = 38
        Me.NeuePositionButton.Text = "Neue Position"
        Me.NeuePositionButton.UseVisualStyleBackColor = True
        '
        'ArtikelControl1
        '
        Me.ArtikelControl1.ArtNr = 0
        Me.ArtikelControl1.DataBindings.Add(New System.Windows.Forms.Binding("ArtNr", Me.Buchvorgang_artikelBindingSource, "ArtNr", True))
        Me.ArtikelControl1.Location = New System.Drawing.Point(116, 17)
        Me.ArtikelControl1.Name = "ArtikelControl1"
        Me.ArtikelControl1.Size = New System.Drawing.Size(200, 25)
        Me.ArtikelControl1.TabIndex = 16
        '
        'StkTextBox
        '
        Me.StkTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Stk", True))
        Me.StkTextBox.Location = New System.Drawing.Point(116, 74)
        Me.StkTextBox.Name = "StkTextBox"
        Me.StkTextBox.Size = New System.Drawing.Size(104, 20)
        Me.StkTextBox.TabIndex = 18
        '
        'Preis_NettoTextBox
        '
        Me.Preis_NettoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Preis_Netto", True))
        Me.Preis_NettoTextBox.Location = New System.Drawing.Point(116, 100)
        Me.Preis_NettoTextBox.Name = "Preis_NettoTextBox"
        Me.Preis_NettoTextBox.Size = New System.Drawing.Size(104, 20)
        Me.Preis_NettoTextBox.TabIndex = 19
        '
        'Preis_BruttoTextBox
        '
        Me.Preis_BruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Preis_Brutto", True))
        Me.Preis_BruttoTextBox.Location = New System.Drawing.Point(116, 126)
        Me.Preis_BruttoTextBox.Name = "Preis_BruttoTextBox"
        Me.Preis_BruttoTextBox.Size = New System.Drawing.Size(104, 20)
        Me.Preis_BruttoTextBox.TabIndex = 20
        '
        'MWSTTextBox
        '
        Me.MWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "MWST", True))
        Me.MWSTTextBox.Enabled = False
        Me.MWSTTextBox.Location = New System.Drawing.Point(116, 152)
        Me.MWSTTextBox.Name = "MWSTTextBox"
        Me.MWSTTextBox.Size = New System.Drawing.Size(104, 20)
        Me.MWSTTextBox.TabIndex = 21
        '
        'ArtikelIdentifikationTextBox
        '
        Me.ArtikelIdentifikationTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "ArtikelIdentifikation", True))
        Me.ArtikelIdentifikationTextBox.Location = New System.Drawing.Point(116, 178)
        Me.ArtikelIdentifikationTextBox.Name = "ArtikelIdentifikationTextBox"
        Me.ArtikelIdentifikationTextBox.Size = New System.Drawing.Size(104, 20)
        Me.ArtikelIdentifikationTextBox.TabIndex = 22
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Bezeichnung", True))
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(116, 48)
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BezeichnungTextBox.TabIndex = 17
        '
        'LieferantNrTextBox
        '
        Me.LieferantNrTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "LieferantNr", True))
        Me.LieferantNrTextBox.Location = New System.Drawing.Point(494, 20)
        Me.LieferantNrTextBox.Name = "LieferantNrTextBox"
        Me.LieferantNrTextBox.Size = New System.Drawing.Size(200, 20)
        Me.LieferantNrTextBox.TabIndex = 23
        '
        'StatusTextBox
        '
        Me.StatusTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Status", True))
        Me.StatusTextBox.Location = New System.Drawing.Point(494, 46)
        Me.StatusTextBox.Name = "StatusTextBox"
        Me.StatusTextBox.Size = New System.Drawing.Size(200, 20)
        Me.StatusTextBox.TabIndex = 25
        '
        'ReferenzTextBox
        '
        Me.ReferenzTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Referenz", True))
        Me.ReferenzTextBox.Location = New System.Drawing.Point(494, 72)
        Me.ReferenzTextBox.Name = "ReferenzTextBox"
        Me.ReferenzTextBox.Size = New System.Drawing.Size(200, 20)
        Me.ReferenzTextBox.TabIndex = 27
        '
        'PackungTextBox
        '
        Me.PackungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Packung", True))
        Me.PackungTextBox.Location = New System.Drawing.Point(494, 98)
        Me.PackungTextBox.Name = "PackungTextBox"
        Me.PackungTextBox.Size = New System.Drawing.Size(200, 20)
        Me.PackungTextBox.TabIndex = 29
        '
        'HerkunftTextBox
        '
        Me.HerkunftTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Herkunft", True))
        Me.HerkunftTextBox.Location = New System.Drawing.Point(494, 124)
        Me.HerkunftTextBox.Name = "HerkunftTextBox"
        Me.HerkunftTextBox.Size = New System.Drawing.Size(200, 20)
        Me.HerkunftTextBox.TabIndex = 31
        '
        'IncotermTextBox
        '
        Me.IncotermTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Incoterm", True))
        Me.IncotermTextBox.Location = New System.Drawing.Point(494, 150)
        Me.IncotermTextBox.Name = "IncotermTextBox"
        Me.IncotermTextBox.Size = New System.Drawing.Size(200, 20)
        Me.IncotermTextBox.TabIndex = 33
        '
        'SpezifikationTextBox
        '
        Me.SpezifikationTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Spezifikation", True))
        Me.SpezifikationTextBox.Location = New System.Drawing.Point(494, 176)
        Me.SpezifikationTextBox.Name = "SpezifikationTextBox"
        Me.SpezifikationTextBox.Size = New System.Drawing.Size(200, 20)
        Me.SpezifikationTextBox.TabIndex = 35
        '
        'ZeitpunktDateTimePicker
        '
        Me.ZeitpunktDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.Buchvorgang_artikelBindingSource, "Zeitpunkt", True))
        Me.ZeitpunktDateTimePicker.Location = New System.Drawing.Point(494, 202)
        Me.ZeitpunktDateTimePicker.Name = "ZeitpunktDateTimePicker"
        Me.ZeitpunktDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.ZeitpunktDateTimePicker.TabIndex = 37
        '
        'GrArtikellisteTableAdapter
        '
        Me.GrArtikellisteTableAdapter.ClearBeforeFill = True
        '
        'SplitContainer1
        '
        Me.SplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1
        Me.SplitContainer1.Location = New System.Drawing.Point(0, 25)
        Me.SplitContainer1.Name = "SplitContainer1"
        Me.SplitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal
        '
        'SplitContainer1.Panel1
        '
        Me.SplitContainer1.Panel1.Controls.Add(Me.TabControl1)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.Buchvorgang_artikelDataGridView)
        Me.SplitContainer1.Size = New System.Drawing.Size(871, 656)
        Me.SplitContainer1.SplitterDistance = 300
        Me.SplitContainer1.TabIndex = 54
        '
        'DataGridViewTextBoxColumnID
        '
        Me.DataGridViewTextBoxColumnID.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumnID.HeaderText = "ID"
        Me.DataGridViewTextBoxColumnID.Name = "DataGridViewTextBoxColumnID"
        '
        'DataGridViewTextBoxColumnNummer
        '
        Me.DataGridViewTextBoxColumnNummer.DataPropertyName = "Nummer"
        Me.DataGridViewTextBoxColumnNummer.HeaderText = "Nummer"
        Me.DataGridViewTextBoxColumnNummer.Name = "DataGridViewTextBoxColumnNummer"
        Me.DataGridViewTextBoxColumnNummer.Visible = False
        '
        'DataGridViewTextBoxColumnTyp
        '
        Me.DataGridViewTextBoxColumnTyp.DataPropertyName = "Typ"
        Me.DataGridViewTextBoxColumnTyp.HeaderText = "Typ"
        Me.DataGridViewTextBoxColumnTyp.Name = "DataGridViewTextBoxColumnTyp"
        Me.DataGridViewTextBoxColumnTyp.Visible = False
        '
        'DataGridViewTextBoxColumnStk
        '
        Me.DataGridViewTextBoxColumnStk.DataPropertyName = "Stk"
        Me.DataGridViewTextBoxColumnStk.HeaderText = "Menge"
        Me.DataGridViewTextBoxColumnStk.Name = "DataGridViewTextBoxColumnStk"
        '
        'ArtNrComboBox
        '
        Me.ArtNrComboBox.ContextMenuStrip = Me.ArtikelContextMenuStrip
        Me.ArtNrComboBox.DataPropertyName = "ArtNr"
        Me.ArtNrComboBox.DataSource = Me.GrArtikellisteBindingSource
        Me.ArtNrComboBox.DisplayMember = "EANBezeichung"
        Me.ArtNrComboBox.DropDownWidth = 200
        Me.ArtNrComboBox.HeaderText = "Artikel"
        Me.ArtNrComboBox.MaxDropDownItems = 20
        Me.ArtNrComboBox.Name = "ArtNrComboBox"
        Me.ArtNrComboBox.ValueMember = "ArtNr"
        '
        'DataGridViewTextBoxColumnArtNr
        '
        Me.DataGridViewTextBoxColumnArtNr.DataPropertyName = "ArtNr"
        Me.DataGridViewTextBoxColumnArtNr.HeaderText = "ArtNr"
        Me.DataGridViewTextBoxColumnArtNr.Name = "DataGridViewTextBoxColumnArtNr"
        Me.DataGridViewTextBoxColumnArtNr.Visible = False
        '
        'DataGridViewTextBoxColumnBezeichnung
        '
        Me.DataGridViewTextBoxColumnBezeichnung.DataPropertyName = "Bezeichnung"
        Me.DataGridViewTextBoxColumnBezeichnung.HeaderText = "Bezeichnung"
        Me.DataGridViewTextBoxColumnBezeichnung.Name = "DataGridViewTextBoxColumnBezeichnung"
        '
        'DataGridViewTextBoxColumnPreisNetto
        '
        Me.DataGridViewTextBoxColumnPreisNetto.DataPropertyName = "Preis_Netto"
        Me.DataGridViewTextBoxColumnPreisNetto.HeaderText = "Preis_Netto"
        Me.DataGridViewTextBoxColumnPreisNetto.Name = "DataGridViewTextBoxColumnPreisNetto"
        '
        'DataGridViewTextBoxColumnPreisBrutto
        '
        Me.DataGridViewTextBoxColumnPreisBrutto.DataPropertyName = "Preis_Brutto"
        Me.DataGridViewTextBoxColumnPreisBrutto.HeaderText = "Preis_Brutto"
        Me.DataGridViewTextBoxColumnPreisBrutto.Name = "DataGridViewTextBoxColumnPreisBrutto"
        '
        'DataGridViewTextBoxColumnMWST
        '
        Me.DataGridViewTextBoxColumnMWST.DataPropertyName = "MWST"
        Me.DataGridViewTextBoxColumnMWST.HeaderText = "MWST"
        Me.DataGridViewTextBoxColumnMWST.Name = "DataGridViewTextBoxColumnMWST"
        Me.DataGridViewTextBoxColumnMWST.ReadOnly = True
        '
        'DataGridViewTextBoxColumnEKPreis
        '
        Me.DataGridViewTextBoxColumnEKPreis.DataPropertyName = "EKPreis"
        Me.DataGridViewTextBoxColumnEKPreis.HeaderText = "EKPreis"
        Me.DataGridViewTextBoxColumnEKPreis.Name = "DataGridViewTextBoxColumnEKPreis"
        Me.DataGridViewTextBoxColumnEKPreis.Visible = False
        '
        'DataGridViewTextBoxColumn10
        '
        Me.DataGridViewTextBoxColumn10.DataPropertyName = "ArtikelIdentifikation"
        Me.DataGridViewTextBoxColumn10.HeaderText = "ArtikelIdentifikation"
        Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "LieferantNr"
        Me.DataGridViewTextBoxColumn12.HeaderText = "LieferantNr"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        Me.DataGridViewTextBoxColumn12.Visible = False
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "Status"
        Me.DataGridViewTextBoxColumn13.HeaderText = "Status"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        Me.DataGridViewTextBoxColumn13.Visible = False
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "Referenz"
        Me.DataGridViewTextBoxColumn14.HeaderText = "Referenz"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        Me.DataGridViewTextBoxColumn14.Visible = False
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "Packung"
        Me.DataGridViewTextBoxColumn15.HeaderText = "Packung"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        Me.DataGridViewTextBoxColumn15.Visible = False
        '
        'DataGridViewTextBoxColumn16
        '
        Me.DataGridViewTextBoxColumn16.DataPropertyName = "Herkunft"
        Me.DataGridViewTextBoxColumn16.HeaderText = "Herkunft"
        Me.DataGridViewTextBoxColumn16.Name = "DataGridViewTextBoxColumn16"
        Me.DataGridViewTextBoxColumn16.Visible = False
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "Incoterm"
        Me.DataGridViewTextBoxColumn17.HeaderText = "Incoterm"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        Me.DataGridViewTextBoxColumn17.Visible = False
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "Spezifikation"
        Me.DataGridViewTextBoxColumn18.HeaderText = "Spezifikation"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        Me.DataGridViewTextBoxColumn18.Visible = False
        '
        'DataGridViewTextBoxColumn19
        '
        Me.DataGridViewTextBoxColumn19.DataPropertyName = "Zeitpunkt"
        Me.DataGridViewTextBoxColumn19.HeaderText = "Zeitpunkt"
        Me.DataGridViewTextBoxColumn19.Name = "DataGridViewTextBoxColumn19"
        Me.DataGridViewTextBoxColumn19.Visible = False
        '
        'Vorgang
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(871, 681)
        Me.Controls.Add(Me.SplitContainer1)
        Me.Controls.Add(Me.BuchvorgangBindingNavigator)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Vorgang"
        Me.Text = "Vorgang"
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.BuchvorgangBindingNavigator.ResumeLayout(False)
        Me.BuchvorgangBindingNavigator.PerformLayout()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ArtikelContextMenuStrip.ResumeLayout(False)
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage3.PerformLayout()
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsVorgaenge As IntraSell_Net.dsVorgaenge
    Friend WithEvents BuchvorgangBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager
    Friend WithEvents BuchvorgangBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BuchvorgangBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents Buchvorgang_artikelTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgang_artikelTableAdapter
    Friend WithEvents NummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TypComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents DatumDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents NotizTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NotizInternTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NotizExternTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezahltCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AusgedrucktCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AbgeschlossenCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents WoherTextBox As System.Windows.Forms.TextBox
    Friend WithEvents WohinTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StatusComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents SummeMWSTTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeBruttoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LieferantNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents MitarbeiterNrComboBox As MitarbeiterControl
    Friend WithEvents Buchvorgang_artikelBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Buchvorgang_artikelDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents ZahlungsbedingungComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents TransportMethodeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents ZahlungsMethodeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents KundNrAdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents KundNr2AdressenControl As IntraSell_Net.AdressenWeitereControl
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents WaehrungComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents GrArtikellisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrArtikellisteTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn20 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents VorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AbschliessenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StornoToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExportierenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KonvertierenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorlagenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KassaBuchungToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SendeEmailToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NeuerVorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AusdruckenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorlageeditierenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ArtikelContextMenuStrip As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ArtikelstammToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SplitContainer1 As System.Windows.Forms.SplitContainer
    Friend WithEvents AddNewButton As System.Windows.Forms.Button
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents StkTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Preis_NettoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Preis_BruttoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MWSTTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ArtikelIdentifikationTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LieferantNrTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StatusTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ReferenzTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PackungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents HerkunftTextBox As System.Windows.Forms.TextBox
    Friend WithEvents IncotermTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SpezifikationTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ZeitpunktDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents ArtikelControl1 As IntraSell_Net.ArtikelControl
    Friend WithEvents NeuePositionButton As System.Windows.Forms.Button
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents TextBox2 As System.Windows.Forms.TextBox
    Friend WithEvents DataGridViewTextBoxColumnID As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnNummer As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnTyp As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnStk As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ArtNrComboBox As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnArtNr As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnBezeichnung As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnPreisNetto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnPreisBrutto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnMWST As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnEKPreis As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn17 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn19 As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
