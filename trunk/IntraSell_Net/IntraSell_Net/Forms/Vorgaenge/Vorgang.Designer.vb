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
        Dim ZahlungsbedungungLabel1 As System.Windows.Forms.Label
        Dim TransportMethodeLabel1 As System.Windows.Forms.Label
        Dim ZahlungsMethodeLabel1 As System.Windows.Forms.Label
        Dim WaehrungLabel1 As System.Windows.Forms.Label
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
        Me.MitarbeiterNrComboBox = New System.Windows.Forms.ComboBox()
        Me.Buchvorgang_artikelBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Buchvorgang_artikelDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumnID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnNummer = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnTyp = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnStk = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ArtNrComboBox = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.GrArtikellisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
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
        Me.DataGridViewTextBoxColumn20 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ZahlungsbedungungComboBox = New System.Windows.Forms.ComboBox()
        Me.TransportMethodeComboBox = New System.Windows.Forms.ComboBox()
        Me.ZahlungsMethodeComboBox = New System.Windows.Forms.ComboBox()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.WaehrungComboBox = New System.Windows.Forms.ComboBox()
        Me.GrArtikellisteTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter()
        Me.KundNr2AdressenControl = New IntraSell_Net.AdressenControl()
        Me.KundNrAdressenControl = New IntraSell_Net.AdressenControl()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.VorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AbschliessenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StornoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExportierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KonvertierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorlagenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KassaBuchungToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SendeEmailToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
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
        ZahlungsbedungungLabel1 = New System.Windows.Forms.Label()
        TransportMethodeLabel1 = New System.Windows.Forms.Label()
        ZahlungsMethodeLabel1 = New System.Windows.Forms.Label()
        WaehrungLabel1 = New System.Windows.Forms.Label()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BuchvorgangBindingNavigator.SuspendLayout()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Location = New System.Drawing.Point(17, 95)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(49, 13)
        NummerLabel.TabIndex = 1
        NummerLabel.Text = "Nummer:"
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(17, 68)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 3
        TypLabel.Text = "Typ:"
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(17, 154)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(41, 13)
        KundNrLabel.TabIndex = 5
        KundNrLabel.Text = "Kunde:"
        '
        'DatumLabel
        '
        DatumLabel.AutoSize = True
        DatumLabel.Location = New System.Drawing.Point(17, 125)
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
        NotizInternLabel.Location = New System.Drawing.Point(6, 114)
        NotizInternLabel.Name = "NotizInternLabel"
        NotizInternLabel.Size = New System.Drawing.Size(64, 13)
        NotizInternLabel.TabIndex = 11
        NotizInternLabel.Text = "Notiz Intern:"
        '
        'NotizExternLabel
        '
        NotizExternLabel.AutoSize = True
        NotizExternLabel.Location = New System.Drawing.Point(6, 220)
        NotizExternLabel.Name = "NotizExternLabel"
        NotizExternLabel.Size = New System.Drawing.Size(67, 13)
        NotizExternLabel.TabIndex = 13
        NotizExternLabel.Text = "Notiz Extern:"
        '
        'SummeLabel
        '
        SummeLabel.AutoSize = True
        SummeLabel.Location = New System.Drawing.Point(17, 221)
        SummeLabel.Name = "SummeLabel"
        SummeLabel.Size = New System.Drawing.Size(45, 13)
        SummeLabel.TabIndex = 15
        SummeLabel.Text = "Summe:"
        '
        'WoherLabel
        '
        WoherLabel.AutoSize = True
        WoherLabel.Location = New System.Drawing.Point(13, 145)
        WoherLabel.Name = "WoherLabel"
        WoherLabel.Size = New System.Drawing.Size(42, 13)
        WoherLabel.TabIndex = 29
        WoherLabel.Text = "Woher:"
        '
        'WohinLabel
        '
        WohinLabel.AutoSize = True
        WohinLabel.Location = New System.Drawing.Point(13, 171)
        WohinLabel.Name = "WohinLabel"
        WohinLabel.Size = New System.Drawing.Size(41, 13)
        WohinLabel.TabIndex = 31
        WohinLabel.Text = "Wohin:"
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(13, 197)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 33
        StatusLabel.Text = "Status:"
        '
        'SummeMWSTLabel
        '
        SummeMWSTLabel.AutoSize = True
        SummeMWSTLabel.Location = New System.Drawing.Point(17, 247)
        SummeMWSTLabel.Name = "SummeMWSTLabel"
        SummeMWSTLabel.Size = New System.Drawing.Size(82, 13)
        SummeMWSTLabel.TabIndex = 35
        SummeMWSTLabel.Text = "Summe MWST:"
        '
        'SummeBruttoLabel
        '
        SummeBruttoLabel.AutoSize = True
        SummeBruttoLabel.Location = New System.Drawing.Point(17, 273)
        SummeBruttoLabel.Name = "SummeBruttoLabel"
        SummeBruttoLabel.Size = New System.Drawing.Size(76, 13)
        SummeBruttoLabel.TabIndex = 37
        SummeBruttoLabel.Text = "Summe Brutto:"
        '
        'LieferantNrLabel
        '
        LieferantNrLabel.AutoSize = True
        LieferantNrLabel.Location = New System.Drawing.Point(13, 224)
        LieferantNrLabel.Name = "LieferantNrLabel"
        LieferantNrLabel.Size = New System.Drawing.Size(65, 13)
        LieferantNrLabel.TabIndex = 39
        LieferantNrLabel.Text = "Lieferant Nr:"
        '
        'MitarbeiterNrLabel
        '
        MitarbeiterNrLabel.AutoSize = True
        MitarbeiterNrLabel.Location = New System.Drawing.Point(13, 251)
        MitarbeiterNrLabel.Name = "MitarbeiterNrLabel"
        MitarbeiterNrLabel.Size = New System.Drawing.Size(73, 13)
        MitarbeiterNrLabel.TabIndex = 41
        MitarbeiterNrLabel.Text = "Mitarbeiter Nr:"
        '
        'KundNr2Label
        '
        KundNr2Label.AutoSize = True
        KundNr2Label.Location = New System.Drawing.Point(17, 181)
        KundNr2Label.Name = "KundNr2Label"
        KundNr2Label.Size = New System.Drawing.Size(73, 13)
        KundNr2Label.TabIndex = 43
        KundNr2Label.Text = "Lieferadresse:"
        '
        'ZahlungsbedungungLabel1
        '
        ZahlungsbedungungLabel1.AutoSize = True
        ZahlungsbedungungLabel1.Location = New System.Drawing.Point(13, 60)
        ZahlungsbedungungLabel1.Name = "ZahlungsbedungungLabel1"
        ZahlungsbedungungLabel1.Size = New System.Drawing.Size(108, 13)
        ZahlungsbedungungLabel1.TabIndex = 49
        ZahlungsbedungungLabel1.Text = "Zahlungsbedungung:"
        '
        'TransportMethodeLabel1
        '
        TransportMethodeLabel1.AutoSize = True
        TransportMethodeLabel1.Location = New System.Drawing.Point(13, 86)
        TransportMethodeLabel1.Name = "TransportMethodeLabel1"
        TransportMethodeLabel1.Size = New System.Drawing.Size(100, 13)
        TransportMethodeLabel1.TabIndex = 50
        TransportMethodeLabel1.Text = "Transport Methode:"
        '
        'ZahlungsMethodeLabel1
        '
        ZahlungsMethodeLabel1.AutoSize = True
        ZahlungsMethodeLabel1.Location = New System.Drawing.Point(13, 113)
        ZahlungsMethodeLabel1.Name = "ZahlungsMethodeLabel1"
        ZahlungsMethodeLabel1.Size = New System.Drawing.Size(99, 13)
        ZahlungsMethodeLabel1.TabIndex = 51
        ZahlungsMethodeLabel1.Text = "Zahlungs Methode:"
        '
        'WaehrungLabel1
        '
        WaehrungLabel1.AutoSize = True
        WaehrungLabel1.Location = New System.Drawing.Point(17, 299)
        WaehrungLabel1.Name = "WaehrungLabel1"
        WaehrungLabel1.Size = New System.Drawing.Size(54, 13)
        WaehrungLabel1.TabIndex = 52
        WaehrungLabel1.Text = "Währung:"
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
        Me.BuchvorgangBindingNavigator.Location = New System.Drawing.Point(0, 24)
        Me.BuchvorgangBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.BuchvorgangBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.BuchvorgangBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.BuchvorgangBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.BuchvorgangBindingNavigator.Name = "BuchvorgangBindingNavigator"
        Me.BuchvorgangBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.BuchvorgangBindingNavigator.Size = New System.Drawing.Size(1042, 25)
        Me.BuchvorgangBindingNavigator.TabIndex = 0
        Me.BuchvorgangBindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorAddNewItem
        '
        Me.BindingNavigatorAddNewItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
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
        Me.NummerTextBox.Location = New System.Drawing.Point(131, 92)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(131, 20)
        Me.NummerTextBox.TabIndex = 2
        '
        'TypComboBox
        '
        Me.TypComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.BuchvorgangBindingSource, "Typ", True))
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(131, 65)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypComboBox.TabIndex = 1
        '
        'DatumDateTimePicker
        '
        Me.DatumDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.BuchvorgangBindingSource, "Datum", True))
        Me.DatumDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DatumDateTimePicker.Location = New System.Drawing.Point(131, 121)
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
        Me.NotizTextBox.Size = New System.Drawing.Size(541, 99)
        Me.NotizTextBox.TabIndex = 10
        '
        'NotizInternTextBox
        '
        Me.NotizInternTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "NotizIntern", True))
        Me.NotizInternTextBox.Location = New System.Drawing.Point(120, 111)
        Me.NotizInternTextBox.Multiline = True
        Me.NotizInternTextBox.Name = "NotizInternTextBox"
        Me.NotizInternTextBox.Size = New System.Drawing.Size(541, 99)
        Me.NotizInternTextBox.TabIndex = 12
        '
        'NotizExternTextBox
        '
        Me.NotizExternTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "NotizExtern", True))
        Me.NotizExternTextBox.Location = New System.Drawing.Point(120, 217)
        Me.NotizExternTextBox.Multiline = True
        Me.NotizExternTextBox.Name = "NotizExternTextBox"
        Me.NotizExternTextBox.Size = New System.Drawing.Size(541, 99)
        Me.NotizExternTextBox.TabIndex = 14
        '
        'SummeTextBox
        '
        Me.SummeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Summe", True))
        Me.SummeTextBox.Location = New System.Drawing.Point(131, 218)
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
        Me.BezahltCheckBox.Location = New System.Drawing.Point(16, 19)
        Me.BezahltCheckBox.Name = "BezahltCheckBox"
        Me.BezahltCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.BezahltCheckBox.TabIndex = 18
        Me.BezahltCheckBox.Text = "bezahlt"
        Me.BezahltCheckBox.UseVisualStyleBackColor = True
        '
        'AusgedrucktCheckBox
        '
        Me.AusgedrucktCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Ausgedruckt", True))
        Me.AusgedrucktCheckBox.Enabled = False
        Me.AusgedrucktCheckBox.Location = New System.Drawing.Point(121, 19)
        Me.AusgedrucktCheckBox.Name = "AusgedrucktCheckBox"
        Me.AusgedrucktCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AusgedrucktCheckBox.TabIndex = 20
        Me.AusgedrucktCheckBox.Text = "ausgedruckt"
        Me.AusgedrucktCheckBox.UseVisualStyleBackColor = True
        '
        'AbgeschlossenCheckBox
        '
        Me.AbgeschlossenCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Abgeschlossen", True))
        Me.AbgeschlossenCheckBox.Enabled = False
        Me.AbgeschlossenCheckBox.Location = New System.Drawing.Point(228, 19)
        Me.AbgeschlossenCheckBox.Name = "AbgeschlossenCheckBox"
        Me.AbgeschlossenCheckBox.Size = New System.Drawing.Size(101, 24)
        Me.AbgeschlossenCheckBox.TabIndex = 22
        Me.AbgeschlossenCheckBox.Text = "abgeschlosen"
        Me.AbgeschlossenCheckBox.UseVisualStyleBackColor = True
        '
        'WoherTextBox
        '
        Me.WoherTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Woher", True))
        Me.WoherTextBox.Enabled = False
        Me.WoherTextBox.Location = New System.Drawing.Point(127, 142)
        Me.WoherTextBox.Name = "WoherTextBox"
        Me.WoherTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WoherTextBox.TabIndex = 30
        '
        'WohinTextBox
        '
        Me.WohinTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Wohin", True))
        Me.WohinTextBox.Enabled = False
        Me.WohinTextBox.Location = New System.Drawing.Point(127, 168)
        Me.WohinTextBox.Name = "WohinTextBox"
        Me.WohinTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WohinTextBox.TabIndex = 32
        '
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(127, 194)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 34
        '
        'SummeMWSTTextBox
        '
        Me.SummeMWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeMWST", True))
        Me.SummeMWSTTextBox.Location = New System.Drawing.Point(131, 244)
        Me.SummeMWSTTextBox.Name = "SummeMWSTTextBox"
        Me.SummeMWSTTextBox.ReadOnly = True
        Me.SummeMWSTTextBox.Size = New System.Drawing.Size(131, 20)
        Me.SummeMWSTTextBox.TabIndex = 7
        Me.SummeMWSTTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'SummeBruttoTextBox
        '
        Me.SummeBruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeBrutto", True))
        Me.SummeBruttoTextBox.Location = New System.Drawing.Point(131, 270)
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
        Me.LieferantNrComboBox.Location = New System.Drawing.Point(127, 221)
        Me.LieferantNrComboBox.Name = "LieferantNrComboBox"
        Me.LieferantNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.LieferantNrComboBox.TabIndex = 40
        '
        'MitarbeiterNrComboBox
        '
        Me.MitarbeiterNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "MitarbeiterNr", True))
        Me.MitarbeiterNrComboBox.FormattingEnabled = True
        Me.MitarbeiterNrComboBox.Location = New System.Drawing.Point(127, 248)
        Me.MitarbeiterNrComboBox.Name = "MitarbeiterNrComboBox"
        Me.MitarbeiterNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.MitarbeiterNrComboBox.TabIndex = 42
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
        Me.Buchvorgang_artikelDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumnID, Me.DataGridViewTextBoxColumnNummer, Me.DataGridViewTextBoxColumnTyp, Me.DataGridViewTextBoxColumnStk, Me.ArtNrComboBox, Me.DataGridViewTextBoxColumnArtNr, Me.DataGridViewTextBoxColumnBezeichnung, Me.DataGridViewTextBoxColumnPreisNetto, Me.DataGridViewTextBoxColumnPreisBrutto, Me.DataGridViewTextBoxColumnMWST, Me.DataGridViewTextBoxColumnEKPreis, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn19, Me.DataGridViewTextBoxColumn20})
        Me.Buchvorgang_artikelDataGridView.DataSource = Me.Buchvorgang_artikelBindingSource
        Me.Buchvorgang_artikelDataGridView.Location = New System.Drawing.Point(12, 381)
        Me.Buchvorgang_artikelDataGridView.Name = "Buchvorgang_artikelDataGridView"
        Me.Buchvorgang_artikelDataGridView.Size = New System.Drawing.Size(1018, 295)
        Me.Buchvorgang_artikelDataGridView.TabIndex = 49
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
        Me.DataGridViewTextBoxColumnStk.HeaderText = "Stk"
        Me.DataGridViewTextBoxColumnStk.Name = "DataGridViewTextBoxColumnStk"
        '
        'ArtNrComboBox
        '
        Me.ArtNrComboBox.DataPropertyName = "ArtNr"
        Me.ArtNrComboBox.DataSource = Me.GrArtikellisteBindingSource
        Me.ArtNrComboBox.DisplayMember = "EAN"
        Me.ArtNrComboBox.HeaderText = "Artikel"
        Me.ArtNrComboBox.Name = "ArtNrComboBox"
        Me.ArtNrComboBox.ValueMember = "ArtNr"
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
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "ErstelltAm"
        Me.DataGridViewTextBoxColumn20.HeaderText = "ErstelltAm"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        Me.DataGridViewTextBoxColumn20.Visible = False
        '
        'ZahlungsbedungungComboBox
        '
        Me.ZahlungsbedungungComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Zahlungsbedungung", True))
        Me.ZahlungsbedungungComboBox.FormattingEnabled = True
        Me.ZahlungsbedungungComboBox.Location = New System.Drawing.Point(127, 57)
        Me.ZahlungsbedungungComboBox.Name = "ZahlungsbedungungComboBox"
        Me.ZahlungsbedungungComboBox.Size = New System.Drawing.Size(200, 21)
        Me.ZahlungsbedungungComboBox.TabIndex = 50
        '
        'TransportMethodeComboBox
        '
        Me.TransportMethodeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "TransportMethode", True))
        Me.TransportMethodeComboBox.FormattingEnabled = True
        Me.TransportMethodeComboBox.Location = New System.Drawing.Point(127, 83)
        Me.TransportMethodeComboBox.Name = "TransportMethodeComboBox"
        Me.TransportMethodeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.TransportMethodeComboBox.TabIndex = 51
        '
        'ZahlungsMethodeComboBox
        '
        Me.ZahlungsMethodeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "ZahlungsMethode", True))
        Me.ZahlungsMethodeComboBox.FormattingEnabled = True
        Me.ZahlungsMethodeComboBox.Location = New System.Drawing.Point(127, 110)
        Me.ZahlungsMethodeComboBox.Name = "ZahlungsMethodeComboBox"
        Me.ZahlungsMethodeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.ZahlungsMethodeComboBox.TabIndex = 52
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Location = New System.Drawing.Point(355, 52)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(675, 323)
        Me.TabControl1.TabIndex = 10
        '
        'TabPage1
        '
        Me.TabPage1.Controls.Add(Me.BezahltCheckBox)
        Me.TabPage1.Controls.Add(Me.MitarbeiterNrComboBox)
        Me.TabPage1.Controls.Add(ZahlungsMethodeLabel1)
        Me.TabPage1.Controls.Add(MitarbeiterNrLabel)
        Me.TabPage1.Controls.Add(Me.ZahlungsMethodeComboBox)
        Me.TabPage1.Controls.Add(Me.LieferantNrComboBox)
        Me.TabPage1.Controls.Add(TransportMethodeLabel1)
        Me.TabPage1.Controls.Add(LieferantNrLabel)
        Me.TabPage1.Controls.Add(Me.TransportMethodeComboBox)
        Me.TabPage1.Controls.Add(Me.StatusComboBox)
        Me.TabPage1.Controls.Add(ZahlungsbedungungLabel1)
        Me.TabPage1.Controls.Add(StatusLabel)
        Me.TabPage1.Controls.Add(Me.ZahlungsbedungungComboBox)
        Me.TabPage1.Controls.Add(Me.WohinTextBox)
        Me.TabPage1.Controls.Add(WohinLabel)
        Me.TabPage1.Controls.Add(Me.WoherTextBox)
        Me.TabPage1.Controls.Add(WoherLabel)
        Me.TabPage1.Controls.Add(Me.AbgeschlossenCheckBox)
        Me.TabPage1.Controls.Add(Me.AusgedrucktCheckBox)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(667, 297)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Status"
        Me.TabPage1.UseVisualStyleBackColor = True
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
        Me.TabPage2.Size = New System.Drawing.Size(667, 297)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Notizen"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'WaehrungComboBox
        '
        Me.WaehrungComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Waehrung", True))
        Me.WaehrungComboBox.FormattingEnabled = True
        Me.WaehrungComboBox.Location = New System.Drawing.Point(131, 296)
        Me.WaehrungComboBox.Name = "WaehrungComboBox"
        Me.WaehrungComboBox.Size = New System.Drawing.Size(131, 21)
        Me.WaehrungComboBox.TabIndex = 9
        '
        'GrArtikellisteTableAdapter
        '
        Me.GrArtikellisteTableAdapter.ClearBeforeFill = True
        '
        'KundNr2AdressenControl
        '
        Me.KundNr2AdressenControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "KundNr", True))
        Me.KundNr2AdressenControl.IDNR = 0
        Me.KundNr2AdressenControl.Location = New System.Drawing.Point(131, 178)
        Me.KundNr2AdressenControl.Name = "KundNr2AdressenControl"
        Me.KundNr2AdressenControl.Size = New System.Drawing.Size(131, 25)
        Me.KundNr2AdressenControl.TabIndex = 5
        '
        'KundNrAdressenControl
        '
        Me.KundNrAdressenControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "KundNr", True))
        Me.KundNrAdressenControl.IDNR = 0
        Me.KundNrAdressenControl.Location = New System.Drawing.Point(131, 147)
        Me.KundNrAdressenControl.Name = "KundNrAdressenControl"
        Me.KundNrAdressenControl.Size = New System.Drawing.Size(131, 25)
        Me.KundNrAdressenControl.TabIndex = 4
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VorgangToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(1042, 24)
        Me.MenuStrip1.TabIndex = 53
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'VorgangToolStripMenuItem
        '
        Me.VorgangToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AbschliessenToolStripMenuItem, Me.StornoToolStripMenuItem, Me.ExportierenToolStripMenuItem, Me.KonvertierenToolStripMenuItem, Me.VorlagenToolStripMenuItem, Me.KassaBuchungToolStripMenuItem, Me.SendeEmailToolStripMenuItem})
        Me.VorgangToolStripMenuItem.Name = "VorgangToolStripMenuItem"
        Me.VorgangToolStripMenuItem.Size = New System.Drawing.Size(64, 20)
        Me.VorgangToolStripMenuItem.Text = "&Vorgang"
        '
        'AbschliessenToolStripMenuItem
        '
        Me.AbschliessenToolStripMenuItem.Name = "AbschliessenToolStripMenuItem"
        Me.AbschliessenToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.AbschliessenToolStripMenuItem.Text = "&Abschliessen"
        '
        'StornoToolStripMenuItem
        '
        Me.StornoToolStripMenuItem.Name = "StornoToolStripMenuItem"
        Me.StornoToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.StornoToolStripMenuItem.Text = "&Storno"
        '
        'ExportierenToolStripMenuItem
        '
        Me.ExportierenToolStripMenuItem.Name = "ExportierenToolStripMenuItem"
        Me.ExportierenToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.ExportierenToolStripMenuItem.Text = "&Exportieren"
        '
        'KonvertierenToolStripMenuItem
        '
        Me.KonvertierenToolStripMenuItem.Name = "KonvertierenToolStripMenuItem"
        Me.KonvertierenToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.KonvertierenToolStripMenuItem.Text = "&Konvertieren"
        '
        'VorlagenToolStripMenuItem
        '
        Me.VorlagenToolStripMenuItem.Name = "VorlagenToolStripMenuItem"
        Me.VorlagenToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.VorlagenToolStripMenuItem.Text = "&Vorlagen"
        '
        'KassaBuchungToolStripMenuItem
        '
        Me.KassaBuchungToolStripMenuItem.Name = "KassaBuchungToolStripMenuItem"
        Me.KassaBuchungToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.KassaBuchungToolStripMenuItem.Text = "Kassa &Buchung"
        '
        'SendeEmailToolStripMenuItem
        '
        Me.SendeEmailToolStripMenuItem.Name = "SendeEmailToolStripMenuItem"
        Me.SendeEmailToolStripMenuItem.Size = New System.Drawing.Size(154, 22)
        Me.SendeEmailToolStripMenuItem.Text = "Sende &Email"
        '
        'Vorgang
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1042, 688)
        Me.Controls.Add(WaehrungLabel1)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.WaehrungComboBox)
        Me.Controls.Add(Me.KundNr2AdressenControl)
        Me.Controls.Add(KundNr2Label)
        Me.Controls.Add(Me.KundNrAdressenControl)
        Me.Controls.Add(Me.Buchvorgang_artikelDataGridView)
        Me.Controls.Add(NummerLabel)
        Me.Controls.Add(Me.NummerTextBox)
        Me.Controls.Add(TypLabel)
        Me.Controls.Add(Me.TypComboBox)
        Me.Controls.Add(KundNrLabel)
        Me.Controls.Add(DatumLabel)
        Me.Controls.Add(Me.DatumDateTimePicker)
        Me.Controls.Add(SummeLabel)
        Me.Controls.Add(Me.SummeTextBox)
        Me.Controls.Add(SummeMWSTLabel)
        Me.Controls.Add(Me.SummeMWSTTextBox)
        Me.Controls.Add(SummeBruttoLabel)
        Me.Controls.Add(Me.SummeBruttoTextBox)
        Me.Controls.Add(Me.BuchvorgangBindingNavigator)
        Me.Controls.Add(Me.MenuStrip1)
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
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
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
    Friend WithEvents MitarbeiterNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Buchvorgang_artikelBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Buchvorgang_artikelDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents ZahlungsbedungungComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents TransportMethodeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents ZahlungsMethodeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents KundNrAdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents KundNr2AdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents WaehrungComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents GrArtikellisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrArtikellisteTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter
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
End Class
