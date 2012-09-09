<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Kunden
    Inherits IntraSell_Net.AbstractForm

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
        Dim IDNRLabel As System.Windows.Forms.Label
        Dim StatusLabel As System.Windows.Forms.Label
        Dim BrancheLabel As System.Windows.Forms.Label
        Dim BriefanredeLabel As System.Windows.Forms.Label
        Dim TitelLabel As System.Windows.Forms.Label
        Dim AnredeLabel As System.Windows.Forms.Label
        Dim NameLabel As System.Windows.Forms.Label
        Dim VornameLabel As System.Windows.Forms.Label
        Dim Name1Label As System.Windows.Forms.Label
        Dim FirmaLabel As System.Windows.Forms.Label
        Dim AdresseLabel As System.Windows.Forms.Label
        Dim LandLabel As System.Windows.Forms.Label
        Dim PLZLabel As System.Windows.Forms.Label
        Dim OrtLabel As System.Windows.Forms.Label
        Dim TelLabel As System.Windows.Forms.Label
        Dim Tel2Label As System.Windows.Forms.Label
        Dim FaxLabel As System.Windows.Forms.Label
        Dim Fax2Label As System.Windows.Forms.Label
        Dim MobilLabel As System.Windows.Forms.Label
        Dim EmailLabel As System.Windows.Forms.Label
        Dim WebLabel As System.Windows.Forms.Label
        Dim MAAusenLabel As System.Windows.Forms.Label
        Dim MAInnenLabel As System.Windows.Forms.Label
        Dim PasswortLabel As System.Windows.Forms.Label
        Dim NextIDNRLabel As System.Windows.Forms.Label
        Dim MandantLabel As System.Windows.Forms.Label
        Dim GeburtstagLabel As System.Windows.Forms.Label
        Dim UIDLabel As System.Windows.Forms.Label
        Dim SkypeAdresseLabel As System.Windows.Forms.Label
        Dim MessengerAdresseLabel As System.Windows.Forms.Label
        Dim EUNummerLabel As System.Windows.Forms.Label
        Dim EUNummer1Label As System.Windows.Forms.Label
        Dim EUNummer2Label As System.Windows.Forms.Label
        Dim BHReferenzLabel As System.Windows.Forms.Label
        Dim Language_codeLabel As System.Windows.Forms.Label
        Dim FirmenKontoIdLabel As System.Windows.Forms.Label
        Me.DataSetKunden = New IntraSell_Net.dsAdressen()
        Me.ofAdressenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Ofadressen_zahlungsmethodenDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.GrzahlungsmethodeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsStammdaten = New IntraSell_Net.dsStammdaten()
        Me.DataGridViewCheckBoxColumn1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.Ofadressen_zahlungsmethodenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Ofadressen_zahlungsbedingungenDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.GrzahlungsbedingungBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataGridViewCheckBoxColumn2 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.Ofadressen_zahlungsbedingungenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.Ofadressen_transportmethodenDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.GrtransportmethodeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.Ofadressen_transportmethodenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.FirmenKontoIdTextBox = New System.Windows.Forms.TextBox()
        Me.FKofAdressenofadressensettingsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Language_codeComboBox = New System.Windows.Forms.ComboBox()
        Me.PasswortTextBox = New System.Windows.Forms.TextBox()
        Me.Label15 = New System.Windows.Forms.Label()
        Me.Label14 = New System.Windows.Forms.Label()
        Me.cbKundengruppe = New System.Windows.Forms.ComboBox()
        Me.KundengruppenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.cbPreisliste = New System.Windows.Forms.ComboBox()
        Me.PreislistenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.MandantTextBox = New System.Windows.Forms.TextBox()
        Me.NextIDNRComboBox = New System.Windows.Forms.ComboBox()
        Me.HasMenuCheckBox = New System.Windows.Forms.CheckBox()
        Me.AbbuchungCheckBox = New System.Windows.Forms.CheckBox()
        Me.MAInnenComboBox = New System.Windows.Forms.ComboBox()
        Me.MAAusenComboBox = New System.Windows.Forms.ComboBox()
        Me.ExportCheckBox = New System.Windows.Forms.CheckBox()
        Me.BHReferenzTextBox = New System.Windows.Forms.TextBox()
        Me.EUNummer2TextBox = New System.Windows.Forms.TextBox()
        Me.EUNummer1TextBox = New System.Windows.Forms.TextBox()
        Me.EUNummerTextBox = New System.Windows.Forms.TextBox()
        Me.MessengerAdresseTextBox = New System.Windows.Forms.TextBox()
        Me.SkypeAdresseTextBox = New System.Windows.Forms.TextBox()
        Me.UIDTextBox = New System.Windows.Forms.TextBox()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.Ofadressen_weitereDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn10 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn14 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn15 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn16 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn19 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn20 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn21 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn22 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn23 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn24 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn25 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn26 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn27 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn28 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn29 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn30 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn31 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn32 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn33 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn34 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Ofadressen_weitereBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Ofadressen_settingsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfAdressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        Me.PreislistenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.PreislistenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        Me.Ofadressen_settingsTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_settingsTableAdapter()
        Me.KundengruppenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.KundengruppenTableAdapter()
        Me.DsPLZ = New IntraSell_Net.dsPLZ()
        Me.GrLandPlzTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter()
        Me.TableAdapterManager1 = New IntraSell_Net.dsPLZTableAdapters.TableAdapterManager()
        Me.GrLandPlzBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.IDNRTextBox = New System.Windows.Forms.TextBox()
        Me.StatusComboBox = New System.Windows.Forms.ComboBox()
        Me.BrancheComboBox = New System.Windows.Forms.ComboBox()
        Me.BriefanredeComboBox = New System.Windows.Forms.ComboBox()
        Me.TitelComboBox = New System.Windows.Forms.ComboBox()
        Me.AnredeComboBox = New System.Windows.Forms.ComboBox()
        Me.NameTextBox = New System.Windows.Forms.TextBox()
        Me.VornameTextBox = New System.Windows.Forms.TextBox()
        Me.Name1TextBox = New System.Windows.Forms.TextBox()
        Me.FirmaTextBox = New System.Windows.Forms.TextBox()
        Me.AdresseTextBox = New System.Windows.Forms.TextBox()
        Me.LandComboBox = New System.Windows.Forms.ComboBox()
        Me.GrlandBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.PLZComboBox = New System.Windows.Forms.ComboBox()
        Me.OrtComboBox = New System.Windows.Forms.ComboBox()
        Me.TelTextBox = New System.Windows.Forms.TextBox()
        Me.Tel2TextBox = New System.Windows.Forms.TextBox()
        Me.FaxTextBox = New System.Windows.Forms.TextBox()
        Me.Fax2TextBox = New System.Windows.Forms.TextBox()
        Me.MobilTextBox = New System.Windows.Forms.TextBox()
        Me.EmailTextBox = New System.Windows.Forms.TextBox()
        Me.WebTextBox = New System.Windows.Forms.TextBox()
        Me.GeburtstagDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.Ofadressen_zahlungsmethodenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_zahlungsmethodenTableAdapter()
        Me.Ofadressen_zahlungsbedingungenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_zahlungsbedingungenTableAdapter()
        Me.Ofadressen_transportmethodenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_transportmethodenTableAdapter()
        Me.Ofadressen_weitereTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter()
        Me.ButtonPLZSelect = New System.Windows.Forms.Button()
        Me.GrlandTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter()
        Me.FillByToolStrip = New System.Windows.Forms.ToolStrip()
        Me.FillByToolStripButton = New System.Windows.Forms.ToolStripButton()
        Me.GrzahlungsmethodeTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grzahlungsmethodeTableAdapter()
        Me.GrzahlungsbedingungTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grzahlungsbedingungTableAdapter()
        Me.GrtransportmethodeTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grtransportmethodeTableAdapter()
        IDNRLabel = New System.Windows.Forms.Label()
        StatusLabel = New System.Windows.Forms.Label()
        BrancheLabel = New System.Windows.Forms.Label()
        BriefanredeLabel = New System.Windows.Forms.Label()
        TitelLabel = New System.Windows.Forms.Label()
        AnredeLabel = New System.Windows.Forms.Label()
        NameLabel = New System.Windows.Forms.Label()
        VornameLabel = New System.Windows.Forms.Label()
        Name1Label = New System.Windows.Forms.Label()
        FirmaLabel = New System.Windows.Forms.Label()
        AdresseLabel = New System.Windows.Forms.Label()
        LandLabel = New System.Windows.Forms.Label()
        PLZLabel = New System.Windows.Forms.Label()
        OrtLabel = New System.Windows.Forms.Label()
        TelLabel = New System.Windows.Forms.Label()
        Tel2Label = New System.Windows.Forms.Label()
        FaxLabel = New System.Windows.Forms.Label()
        Fax2Label = New System.Windows.Forms.Label()
        MobilLabel = New System.Windows.Forms.Label()
        EmailLabel = New System.Windows.Forms.Label()
        WebLabel = New System.Windows.Forms.Label()
        MAAusenLabel = New System.Windows.Forms.Label()
        MAInnenLabel = New System.Windows.Forms.Label()
        PasswortLabel = New System.Windows.Forms.Label()
        NextIDNRLabel = New System.Windows.Forms.Label()
        MandantLabel = New System.Windows.Forms.Label()
        GeburtstagLabel = New System.Windows.Forms.Label()
        UIDLabel = New System.Windows.Forms.Label()
        SkypeAdresseLabel = New System.Windows.Forms.Label()
        MessengerAdresseLabel = New System.Windows.Forms.Label()
        EUNummerLabel = New System.Windows.Forms.Label()
        EUNummer1Label = New System.Windows.Forms.Label()
        EUNummer2Label = New System.Windows.Forms.Label()
        BHReferenzLabel = New System.Windows.Forms.Label()
        Language_codeLabel = New System.Windows.Forms.Label()
        FirmenKontoIdLabel = New System.Windows.Forms.Label()
        CType(Me.DataSetKunden, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ofAdressenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TableLayoutPanel1.SuspendLayout()
        CType(Me.Ofadressen_zahlungsmethodenDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrzahlungsmethodeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsStammdaten, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_zahlungsmethodenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_zahlungsbedingungenDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrzahlungsbedingungBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_zahlungsbedingungenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_transportmethodenDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrtransportmethodeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_transportmethodenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.FKofAdressenofadressensettingsBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.KundengruppenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PreislistenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage2.SuspendLayout()
        Me.TabPage4.SuspendLayout()
        CType(Me.Ofadressen_weitereDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_settingsBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.FillByToolStrip.SuspendLayout()
        Me.SuspendLayout()
        '
        'IDNRLabel
        '
        IDNRLabel.AutoSize = True
        IDNRLabel.Location = New System.Drawing.Point(15, 56)
        IDNRLabel.Name = "IDNRLabel"
        IDNRLabel.Size = New System.Drawing.Size(37, 13)
        IDNRLabel.TabIndex = 7
        IDNRLabel.Text = "IDNR:"
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(15, 82)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 9
        StatusLabel.Text = "Status:"
        '
        'BrancheLabel
        '
        BrancheLabel.AutoSize = True
        BrancheLabel.Location = New System.Drawing.Point(15, 109)
        BrancheLabel.Name = "BrancheLabel"
        BrancheLabel.Size = New System.Drawing.Size(50, 13)
        BrancheLabel.TabIndex = 11
        BrancheLabel.Text = "Branche:"
        '
        'BriefanredeLabel
        '
        BriefanredeLabel.AutoSize = True
        BriefanredeLabel.Location = New System.Drawing.Point(15, 162)
        BriefanredeLabel.Name = "BriefanredeLabel"
        BriefanredeLabel.Size = New System.Drawing.Size(64, 13)
        BriefanredeLabel.TabIndex = 13
        BriefanredeLabel.Text = "Briefanrede:"
        '
        'TitelLabel
        '
        TitelLabel.AutoSize = True
        TitelLabel.Location = New System.Drawing.Point(15, 216)
        TitelLabel.Name = "TitelLabel"
        TitelLabel.Size = New System.Drawing.Size(30, 13)
        TitelLabel.TabIndex = 15
        TitelLabel.Text = "Titel:"
        '
        'AnredeLabel
        '
        AnredeLabel.AutoSize = True
        AnredeLabel.Location = New System.Drawing.Point(15, 188)
        AnredeLabel.Name = "AnredeLabel"
        AnredeLabel.Size = New System.Drawing.Size(44, 13)
        AnredeLabel.TabIndex = 17
        AnredeLabel.Text = "Anrede:"
        '
        'NameLabel
        '
        NameLabel.AutoSize = True
        NameLabel.Location = New System.Drawing.Point(15, 243)
        NameLabel.Name = "NameLabel"
        NameLabel.Size = New System.Drawing.Size(38, 13)
        NameLabel.TabIndex = 19
        NameLabel.Text = "Name:"
        '
        'VornameLabel
        '
        VornameLabel.AutoSize = True
        VornameLabel.Location = New System.Drawing.Point(15, 269)
        VornameLabel.Name = "VornameLabel"
        VornameLabel.Size = New System.Drawing.Size(52, 13)
        VornameLabel.TabIndex = 21
        VornameLabel.Text = "Vorname:"
        '
        'Name1Label
        '
        Name1Label.AutoSize = True
        Name1Label.Location = New System.Drawing.Point(15, 295)
        Name1Label.Name = "Name1Label"
        Name1Label.Size = New System.Drawing.Size(44, 13)
        Name1Label.TabIndex = 23
        Name1Label.Text = "Name1:"
        '
        'FirmaLabel
        '
        FirmaLabel.AutoSize = True
        FirmaLabel.Location = New System.Drawing.Point(15, 136)
        FirmaLabel.Name = "FirmaLabel"
        FirmaLabel.Size = New System.Drawing.Size(35, 13)
        FirmaLabel.TabIndex = 25
        FirmaLabel.Text = "Firma:"
        '
        'AdresseLabel
        '
        AdresseLabel.AutoSize = True
        AdresseLabel.Location = New System.Drawing.Point(325, 109)
        AdresseLabel.Name = "AdresseLabel"
        AdresseLabel.Size = New System.Drawing.Size(45, 13)
        AdresseLabel.TabIndex = 27
        AdresseLabel.Text = "Strasse:"
        '
        'LandLabel
        '
        LandLabel.AutoSize = True
        LandLabel.Location = New System.Drawing.Point(325, 56)
        LandLabel.Name = "LandLabel"
        LandLabel.Size = New System.Drawing.Size(34, 13)
        LandLabel.TabIndex = 29
        LandLabel.Text = "Land:"
        '
        'PLZLabel
        '
        PLZLabel.AutoSize = True
        PLZLabel.Location = New System.Drawing.Point(325, 82)
        PLZLabel.Name = "PLZLabel"
        PLZLabel.Size = New System.Drawing.Size(30, 13)
        PLZLabel.TabIndex = 31
        PLZLabel.Text = "PLZ:"
        '
        'OrtLabel
        '
        OrtLabel.AutoSize = True
        OrtLabel.Location = New System.Drawing.Point(441, 83)
        OrtLabel.Name = "OrtLabel"
        OrtLabel.Size = New System.Drawing.Size(24, 13)
        OrtLabel.TabIndex = 33
        OrtLabel.Text = "Ort:"
        '
        'TelLabel
        '
        TelLabel.AutoSize = True
        TelLabel.Location = New System.Drawing.Point(325, 162)
        TelLabel.Name = "TelLabel"
        TelLabel.Size = New System.Drawing.Size(25, 13)
        TelLabel.TabIndex = 35
        TelLabel.Text = "Tel:"
        '
        'Tel2Label
        '
        Tel2Label.AutoSize = True
        Tel2Label.Location = New System.Drawing.Point(325, 188)
        Tel2Label.Name = "Tel2Label"
        Tel2Label.Size = New System.Drawing.Size(31, 13)
        Tel2Label.TabIndex = 37
        Tel2Label.Text = "Tel2:"
        '
        'FaxLabel
        '
        FaxLabel.AutoSize = True
        FaxLabel.Location = New System.Drawing.Point(325, 214)
        FaxLabel.Name = "FaxLabel"
        FaxLabel.Size = New System.Drawing.Size(27, 13)
        FaxLabel.TabIndex = 39
        FaxLabel.Text = "Fax:"
        '
        'Fax2Label
        '
        Fax2Label.AutoSize = True
        Fax2Label.Location = New System.Drawing.Point(325, 240)
        Fax2Label.Name = "Fax2Label"
        Fax2Label.Size = New System.Drawing.Size(33, 13)
        Fax2Label.TabIndex = 41
        Fax2Label.Text = "Fax2:"
        '
        'MobilLabel
        '
        MobilLabel.AutoSize = True
        MobilLabel.Location = New System.Drawing.Point(325, 266)
        MobilLabel.Name = "MobilLabel"
        MobilLabel.Size = New System.Drawing.Size(35, 13)
        MobilLabel.TabIndex = 43
        MobilLabel.Text = "Mobil:"
        '
        'EmailLabel
        '
        EmailLabel.AutoSize = True
        EmailLabel.Location = New System.Drawing.Point(325, 292)
        EmailLabel.Name = "EmailLabel"
        EmailLabel.Size = New System.Drawing.Size(35, 13)
        EmailLabel.TabIndex = 45
        EmailLabel.Text = "Email:"
        '
        'WebLabel
        '
        WebLabel.AutoSize = True
        WebLabel.Location = New System.Drawing.Point(325, 318)
        WebLabel.Name = "WebLabel"
        WebLabel.Size = New System.Drawing.Size(33, 13)
        WebLabel.TabIndex = 47
        WebLabel.Text = "Web:"
        '
        'MAAusenLabel
        '
        MAAusenLabel.AutoSize = True
        MAAusenLabel.Location = New System.Drawing.Point(6, 55)
        MAAusenLabel.Name = "MAAusenLabel"
        MAAusenLabel.Size = New System.Drawing.Size(61, 13)
        MAAusenLabel.TabIndex = 53
        MAAusenLabel.Text = "MAAussen:"
        '
        'MAInnenLabel
        '
        MAInnenLabel.AutoSize = True
        MAInnenLabel.Location = New System.Drawing.Point(6, 82)
        MAInnenLabel.Name = "MAInnenLabel"
        MAInnenLabel.Size = New System.Drawing.Size(53, 13)
        MAInnenLabel.TabIndex = 55
        MAInnenLabel.Text = "MAInnen:"
        '
        'PasswortLabel
        '
        PasswortLabel.AutoSize = True
        PasswortLabel.Location = New System.Drawing.Point(530, 22)
        PasswortLabel.Name = "PasswortLabel"
        PasswortLabel.Size = New System.Drawing.Size(53, 13)
        PasswortLabel.TabIndex = 61
        PasswortLabel.Text = "Passwort:"
        '
        'NextIDNRLabel
        '
        NextIDNRLabel.AutoSize = True
        NextIDNRLabel.Location = New System.Drawing.Point(6, 109)
        NextIDNRLabel.Name = "NextIDNRLabel"
        NextIDNRLabel.Size = New System.Drawing.Size(60, 13)
        NextIDNRLabel.TabIndex = 63
        NextIDNRLabel.Text = "next IDNR:"
        '
        'MandantLabel
        '
        MandantLabel.AutoSize = True
        MandantLabel.Location = New System.Drawing.Point(6, 136)
        MandantLabel.Name = "MandantLabel"
        MandantLabel.Size = New System.Drawing.Size(52, 13)
        MandantLabel.TabIndex = 65
        MandantLabel.Text = "Mandant:"
        '
        'GeburtstagLabel
        '
        GeburtstagLabel.AutoSize = True
        GeburtstagLabel.Location = New System.Drawing.Point(15, 322)
        GeburtstagLabel.Name = "GeburtstagLabel"
        GeburtstagLabel.Size = New System.Drawing.Size(62, 13)
        GeburtstagLabel.TabIndex = 67
        GeburtstagLabel.Text = "Geburtstag:"
        '
        'UIDLabel
        '
        UIDLabel.AutoSize = True
        UIDLabel.Location = New System.Drawing.Point(354, 52)
        UIDLabel.Name = "UIDLabel"
        UIDLabel.Size = New System.Drawing.Size(29, 13)
        UIDLabel.TabIndex = 69
        UIDLabel.Text = "UID:"
        '
        'SkypeAdresseLabel
        '
        SkypeAdresseLabel.AutoSize = True
        SkypeAdresseLabel.Location = New System.Drawing.Point(354, 78)
        SkypeAdresseLabel.Name = "SkypeAdresseLabel"
        SkypeAdresseLabel.Size = New System.Drawing.Size(81, 13)
        SkypeAdresseLabel.TabIndex = 71
        SkypeAdresseLabel.Text = "Skype Adresse:"
        '
        'MessengerAdresseLabel
        '
        MessengerAdresseLabel.AutoSize = True
        MessengerAdresseLabel.Location = New System.Drawing.Point(354, 104)
        MessengerAdresseLabel.Name = "MessengerAdresseLabel"
        MessengerAdresseLabel.Size = New System.Drawing.Size(103, 13)
        MessengerAdresseLabel.TabIndex = 73
        MessengerAdresseLabel.Text = "Messenger Adresse:"
        '
        'EUNummerLabel
        '
        EUNummerLabel.AutoSize = True
        EUNummerLabel.Location = New System.Drawing.Point(354, 130)
        EUNummerLabel.Name = "EUNummerLabel"
        EUNummerLabel.Size = New System.Drawing.Size(64, 13)
        EUNummerLabel.TabIndex = 75
        EUNummerLabel.Text = "EUNummer:"
        '
        'EUNummer1Label
        '
        EUNummer1Label.AutoSize = True
        EUNummer1Label.Location = New System.Drawing.Point(354, 156)
        EUNummer1Label.Name = "EUNummer1Label"
        EUNummer1Label.Size = New System.Drawing.Size(70, 13)
        EUNummer1Label.TabIndex = 77
        EUNummer1Label.Text = "EUNummer1:"
        '
        'EUNummer2Label
        '
        EUNummer2Label.AutoSize = True
        EUNummer2Label.Location = New System.Drawing.Point(354, 182)
        EUNummer2Label.Name = "EUNummer2Label"
        EUNummer2Label.Size = New System.Drawing.Size(70, 13)
        EUNummer2Label.TabIndex = 79
        EUNummer2Label.Text = "EUNummer2:"
        '
        'BHReferenzLabel
        '
        BHReferenzLabel.AutoSize = True
        BHReferenzLabel.Location = New System.Drawing.Point(354, 208)
        BHReferenzLabel.Name = "BHReferenzLabel"
        BHReferenzLabel.Size = New System.Drawing.Size(68, 13)
        BHReferenzLabel.TabIndex = 81
        BHReferenzLabel.Text = "BHReferenz:"
        '
        'Language_codeLabel
        '
        Language_codeLabel.AutoSize = True
        Language_codeLabel.Location = New System.Drawing.Point(275, 22)
        Language_codeLabel.Name = "Language_codeLabel"
        Language_codeLabel.Size = New System.Drawing.Size(50, 13)
        Language_codeLabel.TabIndex = 13
        Language_codeLabel.Text = "Sprache:"
        '
        'FirmenKontoIdLabel
        '
        FirmenKontoIdLabel.AutoSize = True
        FirmenKontoIdLabel.Location = New System.Drawing.Point(275, 49)
        FirmenKontoIdLabel.Name = "FirmenKontoIdLabel"
        FirmenKontoIdLabel.Size = New System.Drawing.Size(84, 13)
        FirmenKontoIdLabel.TabIndex = 14
        FirmenKontoIdLabel.Text = "Firmen Konto Id:"
        '
        'DataSetKunden
        '
        Me.DataSetKunden.DataSetName = "DataSetKunden"
        Me.DataSetKunden.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'ofAdressenBindingSource
        '
        Me.ofAdressenBindingSource.DataMember = "ofAdressen"
        Me.ofAdressenBindingSource.DataSource = Me.DataSetKunden
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage4)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.TabControl1.Location = New System.Drawing.Point(0, 358)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(794, 317)
        Me.TabControl1.TabIndex = 23
        '
        'TabPage1
        '
        Me.TabPage1.AutoScroll = True
        Me.TabPage1.Controls.Add(Me.TableLayoutPanel1)
        Me.TabPage1.Controls.Add(FirmenKontoIdLabel)
        Me.TabPage1.Controls.Add(Me.FirmenKontoIdTextBox)
        Me.TabPage1.Controls.Add(Language_codeLabel)
        Me.TabPage1.Controls.Add(Me.Language_codeComboBox)
        Me.TabPage1.Controls.Add(Me.PasswortTextBox)
        Me.TabPage1.Controls.Add(PasswortLabel)
        Me.TabPage1.Controls.Add(Me.Label15)
        Me.TabPage1.Controls.Add(Me.Label14)
        Me.TabPage1.Controls.Add(Me.cbKundengruppe)
        Me.TabPage1.Controls.Add(Me.cbPreisliste)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(786, 291)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Einstellungen"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 3
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333!))
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33.33333!))
        Me.TableLayoutPanel1.Controls.Add(Me.Label1, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.Ofadressen_zahlungsmethodenDataGridView, 0, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.Ofadressen_zahlungsbedingungenDataGridView, 1, 1)
        Me.TableLayoutPanel1.Controls.Add(Me.Label2, 1, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.Label3, 2, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.Ofadressen_transportmethodenDataGridView, 2, 1)
        Me.TableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(3, 86)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 2
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.18519!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 89.81481!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(780, 202)
        Me.TableLayoutPanel1.TabIndex = 16
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(3, 0)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(101, 13)
        Me.Label1.TabIndex = 10
        Me.Label1.Text = "Zahlungsmethoden:"
        '
        'Ofadressen_zahlungsmethodenDataGridView
        '
        Me.Ofadressen_zahlungsmethodenDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_zahlungsmethodenDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_zahlungsmethodenDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewCheckBoxColumn1})
        Me.Ofadressen_zahlungsmethodenDataGridView.DataSource = Me.Ofadressen_zahlungsmethodenBindingSource
        Me.Ofadressen_zahlungsmethodenDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Ofadressen_zahlungsmethodenDataGridView.Location = New System.Drawing.Point(3, 23)
        Me.Ofadressen_zahlungsmethodenDataGridView.Name = "Ofadressen_zahlungsmethodenDataGridView"
        Me.Ofadressen_zahlungsmethodenDataGridView.Size = New System.Drawing.Size(254, 176)
        Me.Ofadressen_zahlungsmethodenDataGridView.TabIndex = 9
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "IdNr"
        Me.DataGridViewTextBoxColumn1.HeaderText = "IdNr"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.Visible = False
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Methode"
        Me.DataGridViewTextBoxColumn2.DataSource = Me.GrzahlungsmethodeBindingSource
        Me.DataGridViewTextBoxColumn2.DisplayMember = "Methode"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Methode"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        Me.DataGridViewTextBoxColumn2.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn2.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn2.ValueMember = "Methode"
        '
        'GrzahlungsmethodeBindingSource
        '
        Me.GrzahlungsmethodeBindingSource.DataMember = "grzahlungsmethode"
        Me.GrzahlungsmethodeBindingSource.DataSource = Me.DsStammdaten
        '
        'DsStammdaten
        '
        Me.DsStammdaten.DataSetName = "dsStammdaten"
        Me.DsStammdaten.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'DataGridViewCheckBoxColumn1
        '
        Me.DataGridViewCheckBoxColumn1.DataPropertyName = "Standart"
        Me.DataGridViewCheckBoxColumn1.HeaderText = "Standart"
        Me.DataGridViewCheckBoxColumn1.Name = "DataGridViewCheckBoxColumn1"
        '
        'Ofadressen_zahlungsmethodenBindingSource
        '
        Me.Ofadressen_zahlungsmethodenBindingSource.DataMember = "ofAdressen_ofadressen-zahlungsmethoden"
        Me.Ofadressen_zahlungsmethodenBindingSource.DataSource = Me.ofAdressenBindingSource
        '
        'Ofadressen_zahlungsbedingungenDataGridView
        '
        Me.Ofadressen_zahlungsbedingungenDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_zahlungsbedingungenDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_zahlungsbedingungenDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewCheckBoxColumn2})
        Me.Ofadressen_zahlungsbedingungenDataGridView.DataSource = Me.Ofadressen_zahlungsbedingungenBindingSource
        Me.Ofadressen_zahlungsbedingungenDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Ofadressen_zahlungsbedingungenDataGridView.Location = New System.Drawing.Point(263, 23)
        Me.Ofadressen_zahlungsbedingungenDataGridView.Name = "Ofadressen_zahlungsbedingungenDataGridView"
        Me.Ofadressen_zahlungsbedingungenDataGridView.Size = New System.Drawing.Size(254, 176)
        Me.Ofadressen_zahlungsbedingungenDataGridView.TabIndex = 10
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "IdNr"
        Me.DataGridViewTextBoxColumn3.HeaderText = "IdNr"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.Visible = False
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "Bedingung"
        Me.DataGridViewTextBoxColumn4.DataSource = Me.GrzahlungsbedingungBindingSource
        Me.DataGridViewTextBoxColumn4.DisplayMember = "Methode"
        Me.DataGridViewTextBoxColumn4.HeaderText = "Bedingung"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn4.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn4.ValueMember = "Nr"
        '
        'GrzahlungsbedingungBindingSource
        '
        Me.GrzahlungsbedingungBindingSource.DataMember = "grzahlungsbedingung"
        Me.GrzahlungsbedingungBindingSource.DataSource = Me.DsStammdaten
        '
        'DataGridViewCheckBoxColumn2
        '
        Me.DataGridViewCheckBoxColumn2.DataPropertyName = "Standart"
        Me.DataGridViewCheckBoxColumn2.HeaderText = "Standart"
        Me.DataGridViewCheckBoxColumn2.Name = "DataGridViewCheckBoxColumn2"
        '
        'Ofadressen_zahlungsbedingungenBindingSource
        '
        Me.Ofadressen_zahlungsbedingungenBindingSource.DataMember = "FK_ofAdressen_ofadressen-zahlungsbedingungen"
        Me.Ofadressen_zahlungsbedingungenBindingSource.DataSource = Me.ofAdressenBindingSource
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(263, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(116, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Zahlungsbedingungen:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(523, 0)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(55, 13)
        Me.Label3.TabIndex = 13
        Me.Label3.Text = "Transport:"
        '
        'Ofadressen_transportmethodenDataGridView
        '
        Me.Ofadressen_transportmethodenDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_transportmethodenDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_transportmethodenDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7})
        Me.Ofadressen_transportmethodenDataGridView.DataSource = Me.Ofadressen_transportmethodenBindingSource
        Me.Ofadressen_transportmethodenDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Ofadressen_transportmethodenDataGridView.Location = New System.Drawing.Point(523, 23)
        Me.Ofadressen_transportmethodenDataGridView.Name = "Ofadressen_transportmethodenDataGridView"
        Me.Ofadressen_transportmethodenDataGridView.Size = New System.Drawing.Size(254, 176)
        Me.Ofadressen_transportmethodenDataGridView.TabIndex = 12
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "IdNr"
        Me.DataGridViewTextBoxColumn5.HeaderText = "IdNr"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        Me.DataGridViewTextBoxColumn5.Visible = False
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "Methode"
        Me.DataGridViewTextBoxColumn6.DataSource = Me.GrtransportmethodeBindingSource
        Me.DataGridViewTextBoxColumn6.DisplayMember = "Methode"
        Me.DataGridViewTextBoxColumn6.HeaderText = "Methode"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        Me.DataGridViewTextBoxColumn6.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn6.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn6.ValueMember = "Methode"
        '
        'GrtransportmethodeBindingSource
        '
        Me.GrtransportmethodeBindingSource.DataMember = "grtransportmethode"
        Me.GrtransportmethodeBindingSource.DataSource = Me.DsStammdaten
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "Standart"
        Me.DataGridViewTextBoxColumn7.HeaderText = "Standart"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        Me.DataGridViewTextBoxColumn7.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn7.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        '
        'Ofadressen_transportmethodenBindingSource
        '
        Me.Ofadressen_transportmethodenBindingSource.DataMember = "FK_ofAdressen_ofadressen-transportmethoden"
        Me.Ofadressen_transportmethodenBindingSource.DataSource = Me.ofAdressenBindingSource
        '
        'FirmenKontoIdTextBox
        '
        Me.FirmenKontoIdTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.FKofAdressenofadressensettingsBindingSource, "FirmenKontoId", True))
        Me.FirmenKontoIdTextBox.Location = New System.Drawing.Point(365, 46)
        Me.FirmenKontoIdTextBox.Name = "FirmenKontoIdTextBox"
        Me.FirmenKontoIdTextBox.Size = New System.Drawing.Size(121, 20)
        Me.FirmenKontoIdTextBox.TabIndex = 26
        '
        'FKofAdressenofadressensettingsBindingSource
        '
        Me.FKofAdressenofadressensettingsBindingSource.DataMember = "FK_ofAdressen_ofadressen-settings"
        Me.FKofAdressenofadressensettingsBindingSource.DataSource = Me.ofAdressenBindingSource
        '
        'Language_codeComboBox
        '
        Me.Language_codeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.FKofAdressenofadressensettingsBindingSource, "language_code", True))
        Me.Language_codeComboBox.FormattingEnabled = True
        Me.Language_codeComboBox.Location = New System.Drawing.Point(365, 18)
        Me.Language_codeComboBox.Name = "Language_codeComboBox"
        Me.Language_codeComboBox.Size = New System.Drawing.Size(121, 21)
        Me.Language_codeComboBox.TabIndex = 25
        '
        'PasswortTextBox
        '
        Me.PasswortTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Passwort", True))
        Me.PasswortTextBox.Location = New System.Drawing.Point(603, 18)
        Me.PasswortTextBox.Name = "PasswortTextBox"
        Me.PasswortTextBox.Size = New System.Drawing.Size(134, 20)
        Me.PasswortTextBox.TabIndex = 27
        '
        'Label15
        '
        Me.Label15.AutoSize = True
        Me.Label15.Location = New System.Drawing.Point(17, 48)
        Me.Label15.Name = "Label15"
        Me.Label15.Size = New System.Drawing.Size(80, 13)
        Me.Label15.TabIndex = 9
        Me.Label15.Text = "Kundengruppe:"
        '
        'Label14
        '
        Me.Label14.AutoSize = True
        Me.Label14.Location = New System.Drawing.Point(17, 22)
        Me.Label14.Name = "Label14"
        Me.Label14.Size = New System.Drawing.Size(51, 13)
        Me.Label14.TabIndex = 8
        Me.Label14.Text = "Preisliste:"
        '
        'cbKundengruppe
        '
        Me.cbKundengruppe.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.FKofAdressenofadressensettingsBindingSource, "Kundengruppe", True))
        Me.cbKundengruppe.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.KundengruppenBindingSource, "Gruppe", True))
        Me.cbKundengruppe.DataSource = Me.KundengruppenBindingSource
        Me.cbKundengruppe.DisplayMember = "Gruppe"
        Me.cbKundengruppe.FormattingEnabled = True
        Me.cbKundengruppe.Location = New System.Drawing.Point(115, 45)
        Me.cbKundengruppe.Name = "cbKundengruppe"
        Me.cbKundengruppe.Size = New System.Drawing.Size(121, 21)
        Me.cbKundengruppe.TabIndex = 24
        Me.cbKundengruppe.ValueMember = "Gruppe"
        '
        'KundengruppenBindingSource
        '
        Me.KundengruppenBindingSource.DataMember = "Kundengruppen"
        Me.KundengruppenBindingSource.DataSource = Me.DataSetKunden
        '
        'cbPreisliste
        '
        Me.cbPreisliste.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.PreislistenBindingSource, "PreislisteName", True))
        Me.cbPreisliste.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.FKofAdressenofadressensettingsBindingSource, "Preisliste", True))
        Me.cbPreisliste.DataSource = Me.PreislistenBindingSource
        Me.cbPreisliste.DisplayMember = "PreislisteName"
        Me.cbPreisliste.FormattingEnabled = True
        Me.cbPreisliste.Location = New System.Drawing.Point(115, 18)
        Me.cbPreisliste.Name = "cbPreisliste"
        Me.cbPreisliste.Size = New System.Drawing.Size(121, 21)
        Me.cbPreisliste.TabIndex = 23
        Me.cbPreisliste.ValueMember = "PreislisteName"
        '
        'PreislistenBindingSource
        '
        Me.PreislistenBindingSource.DataMember = "Preislisten"
        Me.PreislistenBindingSource.DataSource = Me.DataSetKunden
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.MandantTextBox)
        Me.TabPage2.Controls.Add(MandantLabel)
        Me.TabPage2.Controls.Add(Me.NextIDNRComboBox)
        Me.TabPage2.Controls.Add(NextIDNRLabel)
        Me.TabPage2.Controls.Add(Me.HasMenuCheckBox)
        Me.TabPage2.Controls.Add(Me.AbbuchungCheckBox)
        Me.TabPage2.Controls.Add(Me.MAInnenComboBox)
        Me.TabPage2.Controls.Add(MAInnenLabel)
        Me.TabPage2.Controls.Add(Me.MAAusenComboBox)
        Me.TabPage2.Controls.Add(MAAusenLabel)
        Me.TabPage2.Controls.Add(Me.ExportCheckBox)
        Me.TabPage2.Controls.Add(UIDLabel)
        Me.TabPage2.Controls.Add(Me.BHReferenzTextBox)
        Me.TabPage2.Controls.Add(BHReferenzLabel)
        Me.TabPage2.Controls.Add(Me.EUNummer2TextBox)
        Me.TabPage2.Controls.Add(EUNummer2Label)
        Me.TabPage2.Controls.Add(Me.EUNummer1TextBox)
        Me.TabPage2.Controls.Add(EUNummer1Label)
        Me.TabPage2.Controls.Add(Me.EUNummerTextBox)
        Me.TabPage2.Controls.Add(EUNummerLabel)
        Me.TabPage2.Controls.Add(Me.MessengerAdresseTextBox)
        Me.TabPage2.Controls.Add(MessengerAdresseLabel)
        Me.TabPage2.Controls.Add(Me.SkypeAdresseTextBox)
        Me.TabPage2.Controls.Add(SkypeAdresseLabel)
        Me.TabPage2.Controls.Add(Me.UIDTextBox)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(786, 291)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Weitere Stammdaten"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'MandantTextBox
        '
        Me.MandantTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "mandant", True))
        Me.MandantTextBox.Location = New System.Drawing.Point(115, 133)
        Me.MandantTextBox.Name = "MandantTextBox"
        Me.MandantTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MandantTextBox.TabIndex = 66
        '
        'NextIDNRComboBox
        '
        Me.NextIDNRComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "nextIDNR", True))
        Me.NextIDNRComboBox.FormattingEnabled = True
        Me.NextIDNRComboBox.Location = New System.Drawing.Point(115, 106)
        Me.NextIDNRComboBox.Name = "NextIDNRComboBox"
        Me.NextIDNRComboBox.Size = New System.Drawing.Size(200, 21)
        Me.NextIDNRComboBox.TabIndex = 64
        '
        'HasMenuCheckBox
        '
        Me.HasMenuCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.ofAdressenBindingSource, "hasMenu", True))
        Me.HasMenuCheckBox.Location = New System.Drawing.Point(193, 20)
        Me.HasMenuCheckBox.Name = "HasMenuCheckBox"
        Me.HasMenuCheckBox.Size = New System.Drawing.Size(73, 24)
        Me.HasMenuCheckBox.TabIndex = 60
        Me.HasMenuCheckBox.Text = "Menü"
        Me.HasMenuCheckBox.UseVisualStyleBackColor = True
        '
        'AbbuchungCheckBox
        '
        Me.AbbuchungCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.ofAdressenBindingSource, "Abbuchung", True))
        Me.AbbuchungCheckBox.Location = New System.Drawing.Point(115, 20)
        Me.AbbuchungCheckBox.Name = "AbbuchungCheckBox"
        Me.AbbuchungCheckBox.Size = New System.Drawing.Size(102, 24)
        Me.AbbuchungCheckBox.TabIndex = 58
        Me.AbbuchungCheckBox.Text = "Abbuchung"
        Me.AbbuchungCheckBox.UseVisualStyleBackColor = True
        '
        'MAInnenComboBox
        '
        Me.MAInnenComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "MAInnen", True))
        Me.MAInnenComboBox.FormattingEnabled = True
        Me.MAInnenComboBox.Location = New System.Drawing.Point(115, 79)
        Me.MAInnenComboBox.Name = "MAInnenComboBox"
        Me.MAInnenComboBox.Size = New System.Drawing.Size(200, 21)
        Me.MAInnenComboBox.TabIndex = 56
        '
        'MAAusenComboBox
        '
        Me.MAAusenComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "MAAusen", True))
        Me.MAAusenComboBox.FormattingEnabled = True
        Me.MAAusenComboBox.Location = New System.Drawing.Point(115, 52)
        Me.MAAusenComboBox.Name = "MAAusenComboBox"
        Me.MAAusenComboBox.Size = New System.Drawing.Size(200, 21)
        Me.MAAusenComboBox.TabIndex = 54
        '
        'ExportCheckBox
        '
        Me.ExportCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.ofAdressenBindingSource, "Export", True))
        Me.ExportCheckBox.Location = New System.Drawing.Point(36, 20)
        Me.ExportCheckBox.Name = "ExportCheckBox"
        Me.ExportCheckBox.Size = New System.Drawing.Size(73, 24)
        Me.ExportCheckBox.TabIndex = 50
        Me.ExportCheckBox.Text = " Export"
        Me.ExportCheckBox.UseVisualStyleBackColor = True
        '
        'BHReferenzTextBox
        '
        Me.BHReferenzTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "BHReferenz", True))
        Me.BHReferenzTextBox.Location = New System.Drawing.Point(463, 205)
        Me.BHReferenzTextBox.Name = "BHReferenzTextBox"
        Me.BHReferenzTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BHReferenzTextBox.TabIndex = 82
        '
        'EUNummer2TextBox
        '
        Me.EUNummer2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "EUNummer2", True))
        Me.EUNummer2TextBox.Location = New System.Drawing.Point(463, 179)
        Me.EUNummer2TextBox.Name = "EUNummer2TextBox"
        Me.EUNummer2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.EUNummer2TextBox.TabIndex = 80
        '
        'EUNummer1TextBox
        '
        Me.EUNummer1TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "EUNummer1", True))
        Me.EUNummer1TextBox.Location = New System.Drawing.Point(463, 153)
        Me.EUNummer1TextBox.Name = "EUNummer1TextBox"
        Me.EUNummer1TextBox.Size = New System.Drawing.Size(200, 20)
        Me.EUNummer1TextBox.TabIndex = 78
        '
        'EUNummerTextBox
        '
        Me.EUNummerTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "EUNummer", True))
        Me.EUNummerTextBox.Location = New System.Drawing.Point(463, 127)
        Me.EUNummerTextBox.Name = "EUNummerTextBox"
        Me.EUNummerTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EUNummerTextBox.TabIndex = 76
        '
        'MessengerAdresseTextBox
        '
        Me.MessengerAdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "MessengerAdresse", True))
        Me.MessengerAdresseTextBox.Location = New System.Drawing.Point(463, 101)
        Me.MessengerAdresseTextBox.Name = "MessengerAdresseTextBox"
        Me.MessengerAdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MessengerAdresseTextBox.TabIndex = 74
        '
        'SkypeAdresseTextBox
        '
        Me.SkypeAdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "SkypeAdresse", True))
        Me.SkypeAdresseTextBox.Location = New System.Drawing.Point(463, 75)
        Me.SkypeAdresseTextBox.Name = "SkypeAdresseTextBox"
        Me.SkypeAdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.SkypeAdresseTextBox.TabIndex = 72
        '
        'UIDTextBox
        '
        Me.UIDTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "UID", True))
        Me.UIDTextBox.Location = New System.Drawing.Point(463, 49)
        Me.UIDTextBox.Name = "UIDTextBox"
        Me.UIDTextBox.Size = New System.Drawing.Size(200, 20)
        Me.UIDTextBox.TabIndex = 70
        '
        'TabPage4
        '
        Me.TabPage4.AutoScroll = True
        Me.TabPage4.Controls.Add(Me.Ofadressen_weitereDataGridView)
        Me.TabPage4.Location = New System.Drawing.Point(4, 22)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage4.Size = New System.Drawing.Size(786, 291)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "Weitere Adressdaten"
        Me.TabPage4.UseVisualStyleBackColor = True
        '
        'Ofadressen_weitereDataGridView
        '
        Me.Ofadressen_weitereDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_weitereDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_weitereDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn19, Me.DataGridViewTextBoxColumn20, Me.DataGridViewTextBoxColumn21, Me.DataGridViewTextBoxColumn22, Me.DataGridViewTextBoxColumn23, Me.DataGridViewTextBoxColumn24, Me.DataGridViewTextBoxColumn25, Me.DataGridViewTextBoxColumn26, Me.DataGridViewTextBoxColumn27, Me.DataGridViewTextBoxColumn28, Me.DataGridViewTextBoxColumn29, Me.DataGridViewTextBoxColumn30, Me.DataGridViewTextBoxColumn31, Me.DataGridViewTextBoxColumn32, Me.DataGridViewTextBoxColumn33, Me.DataGridViewTextBoxColumn34})
        Me.Ofadressen_weitereDataGridView.DataSource = Me.Ofadressen_weitereBindingSource
        Me.Ofadressen_weitereDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Ofadressen_weitereDataGridView.Location = New System.Drawing.Point(3, 3)
        Me.Ofadressen_weitereDataGridView.Name = "Ofadressen_weitereDataGridView"
        Me.Ofadressen_weitereDataGridView.Size = New System.Drawing.Size(780, 285)
        Me.Ofadressen_weitereDataGridView.TabIndex = 0
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn8.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        Me.DataGridViewTextBoxColumn8.Visible = False
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "Anrede"
        Me.DataGridViewTextBoxColumn9.HeaderText = "Anrede"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        '
        'DataGridViewTextBoxColumn10
        '
        Me.DataGridViewTextBoxColumn10.DataPropertyName = "Typ"
        Me.DataGridViewTextBoxColumn10.HeaderText = "Typ"
        Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "Branche"
        Me.DataGridViewTextBoxColumn11.HeaderText = "Branche"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "IDNR"
        Me.DataGridViewTextBoxColumn12.HeaderText = "IDNR"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        Me.DataGridViewTextBoxColumn12.Visible = False
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "Land"
        Me.DataGridViewTextBoxColumn13.HeaderText = "Land"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "Name"
        Me.DataGridViewTextBoxColumn14.HeaderText = "Name"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "Vorname"
        Me.DataGridViewTextBoxColumn15.HeaderText = "Vorname"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        '
        'DataGridViewTextBoxColumn16
        '
        Me.DataGridViewTextBoxColumn16.DataPropertyName = "Name1"
        Me.DataGridViewTextBoxColumn16.HeaderText = "Name1"
        Me.DataGridViewTextBoxColumn16.Name = "DataGridViewTextBoxColumn16"
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "Firma"
        Me.DataGridViewTextBoxColumn17.HeaderText = "Firma"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "Adresse"
        Me.DataGridViewTextBoxColumn18.HeaderText = "Adresse"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        '
        'DataGridViewTextBoxColumn19
        '
        Me.DataGridViewTextBoxColumn19.DataPropertyName = "PLZ"
        Me.DataGridViewTextBoxColumn19.HeaderText = "PLZ"
        Me.DataGridViewTextBoxColumn19.Name = "DataGridViewTextBoxColumn19"
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "Ort"
        Me.DataGridViewTextBoxColumn20.HeaderText = "Ort"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        '
        'DataGridViewTextBoxColumn21
        '
        Me.DataGridViewTextBoxColumn21.DataPropertyName = "Tel"
        Me.DataGridViewTextBoxColumn21.HeaderText = "Tel"
        Me.DataGridViewTextBoxColumn21.Name = "DataGridViewTextBoxColumn21"
        '
        'DataGridViewTextBoxColumn22
        '
        Me.DataGridViewTextBoxColumn22.DataPropertyName = "Tel2"
        Me.DataGridViewTextBoxColumn22.HeaderText = "Tel2"
        Me.DataGridViewTextBoxColumn22.Name = "DataGridViewTextBoxColumn22"
        '
        'DataGridViewTextBoxColumn23
        '
        Me.DataGridViewTextBoxColumn23.DataPropertyName = "Fax"
        Me.DataGridViewTextBoxColumn23.HeaderText = "Fax"
        Me.DataGridViewTextBoxColumn23.Name = "DataGridViewTextBoxColumn23"
        '
        'DataGridViewTextBoxColumn24
        '
        Me.DataGridViewTextBoxColumn24.DataPropertyName = "Mobil"
        Me.DataGridViewTextBoxColumn24.HeaderText = "Mobil"
        Me.DataGridViewTextBoxColumn24.Name = "DataGridViewTextBoxColumn24"
        '
        'DataGridViewTextBoxColumn25
        '
        Me.DataGridViewTextBoxColumn25.DataPropertyName = "Email"
        Me.DataGridViewTextBoxColumn25.HeaderText = "Email"
        Me.DataGridViewTextBoxColumn25.Name = "DataGridViewTextBoxColumn25"
        '
        'DataGridViewTextBoxColumn26
        '
        Me.DataGridViewTextBoxColumn26.DataPropertyName = "Web"
        Me.DataGridViewTextBoxColumn26.HeaderText = "Web"
        Me.DataGridViewTextBoxColumn26.Name = "DataGridViewTextBoxColumn26"
        '
        'DataGridViewTextBoxColumn27
        '
        Me.DataGridViewTextBoxColumn27.DataPropertyName = "AngelegtAn"
        Me.DataGridViewTextBoxColumn27.HeaderText = "AngelegtAn"
        Me.DataGridViewTextBoxColumn27.Name = "DataGridViewTextBoxColumn27"
        '
        'DataGridViewTextBoxColumn28
        '
        Me.DataGridViewTextBoxColumn28.DataPropertyName = "Passwort"
        Me.DataGridViewTextBoxColumn28.HeaderText = "Passwort"
        Me.DataGridViewTextBoxColumn28.Name = "DataGridViewTextBoxColumn28"
        '
        'DataGridViewTextBoxColumn29
        '
        Me.DataGridViewTextBoxColumn29.DataPropertyName = "Geburtstag"
        Me.DataGridViewTextBoxColumn29.HeaderText = "Geburtstag"
        Me.DataGridViewTextBoxColumn29.Name = "DataGridViewTextBoxColumn29"
        '
        'DataGridViewTextBoxColumn30
        '
        Me.DataGridViewTextBoxColumn30.DataPropertyName = "UID"
        Me.DataGridViewTextBoxColumn30.HeaderText = "UID"
        Me.DataGridViewTextBoxColumn30.Name = "DataGridViewTextBoxColumn30"
        '
        'DataGridViewTextBoxColumn31
        '
        Me.DataGridViewTextBoxColumn31.DataPropertyName = "EUNummer"
        Me.DataGridViewTextBoxColumn31.HeaderText = "EUNummer"
        Me.DataGridViewTextBoxColumn31.Name = "DataGridViewTextBoxColumn31"
        '
        'DataGridViewTextBoxColumn32
        '
        Me.DataGridViewTextBoxColumn32.DataPropertyName = "EUNummer1"
        Me.DataGridViewTextBoxColumn32.HeaderText = "EUNummer1"
        Me.DataGridViewTextBoxColumn32.Name = "DataGridViewTextBoxColumn32"
        '
        'DataGridViewTextBoxColumn33
        '
        Me.DataGridViewTextBoxColumn33.DataPropertyName = "EUNummer2"
        Me.DataGridViewTextBoxColumn33.HeaderText = "EUNummer2"
        Me.DataGridViewTextBoxColumn33.Name = "DataGridViewTextBoxColumn33"
        '
        'DataGridViewTextBoxColumn34
        '
        Me.DataGridViewTextBoxColumn34.DataPropertyName = "Titel"
        Me.DataGridViewTextBoxColumn34.HeaderText = "Titel"
        Me.DataGridViewTextBoxColumn34.Name = "DataGridViewTextBoxColumn34"
        '
        'Ofadressen_weitereBindingSource
        '
        Me.Ofadressen_weitereBindingSource.DataMember = "FK_ofAdressen_ofadressen-weitere"
        Me.Ofadressen_weitereBindingSource.DataSource = Me.ofAdressenBindingSource
        '
        'Ofadressen_settingsBindingSource
        '
        Me.Ofadressen_settingsBindingSource.DataMember = "ofadressen-settings"
        Me.Ofadressen_settingsBindingSource.DataSource = Me.DataSetKunden
        '
        'OfAdressenTableAdapter
        '
        Me.OfAdressenTableAdapter.ClearBeforeFill = True
        '
        'PreislistenTableAdapter
        '
        Me.PreislistenTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_settingsTableAdapter = Me.Ofadressen_settingsTableAdapter
        Me.TableAdapterManager.ofadressen_transportmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_weitereTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsbedingungenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Me.OfAdressenTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Ofadressen_settingsTableAdapter
        '
        Me.Ofadressen_settingsTableAdapter.ClearBeforeFill = True
        '
        'KundengruppenTableAdapter
        '
        Me.KundengruppenTableAdapter.ClearBeforeFill = True
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
        'TableAdapterManager1
        '
        Me.TableAdapterManager1.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager1.Connection = Nothing
        Me.TableAdapterManager1.grlandTableAdapter = Nothing
        Me.TableAdapterManager1.grplzTableAdapter = Nothing
        Me.TableAdapterManager1.UpdateOrder = IntraSell_Net.dsPLZTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'GrLandPlzBindingSource
        '
        Me.GrLandPlzBindingSource.DataMember = "grLandPlz"
        Me.GrLandPlzBindingSource.DataSource = Me.DsPLZ
        '
        'IDNRTextBox
        '
        Me.IDNRTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "IDNR", True))
        Me.IDNRTextBox.Location = New System.Drawing.Point(83, 53)
        Me.IDNRTextBox.Name = "IDNRTextBox"
        Me.IDNRTextBox.Size = New System.Drawing.Size(200, 20)
        Me.IDNRTextBox.TabIndex = 0
        '
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(83, 79)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 1
        '
        'BrancheComboBox
        '
        Me.BrancheComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Branche", True))
        Me.BrancheComboBox.Enabled = False
        Me.BrancheComboBox.FormattingEnabled = True
        Me.BrancheComboBox.Location = New System.Drawing.Point(83, 106)
        Me.BrancheComboBox.Name = "BrancheComboBox"
        Me.BrancheComboBox.Size = New System.Drawing.Size(200, 21)
        Me.BrancheComboBox.TabIndex = 2
        '
        'BriefanredeComboBox
        '
        Me.BriefanredeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Briefanrede", True))
        Me.BriefanredeComboBox.FormattingEnabled = True
        Me.BriefanredeComboBox.Location = New System.Drawing.Point(83, 159)
        Me.BriefanredeComboBox.Name = "BriefanredeComboBox"
        Me.BriefanredeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.BriefanredeComboBox.TabIndex = 4
        '
        'TitelComboBox
        '
        Me.TitelComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Titel", True))
        Me.TitelComboBox.FormattingEnabled = True
        Me.TitelComboBox.Location = New System.Drawing.Point(83, 213)
        Me.TitelComboBox.Name = "TitelComboBox"
        Me.TitelComboBox.Size = New System.Drawing.Size(200, 21)
        Me.TitelComboBox.TabIndex = 6
        '
        'AnredeComboBox
        '
        Me.AnredeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Anrede", True))
        Me.AnredeComboBox.FormattingEnabled = True
        Me.AnredeComboBox.Location = New System.Drawing.Point(83, 185)
        Me.AnredeComboBox.Name = "AnredeComboBox"
        Me.AnredeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.AnredeComboBox.TabIndex = 5
        '
        'NameTextBox
        '
        Me.NameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Name", True))
        Me.NameTextBox.Location = New System.Drawing.Point(83, 240)
        Me.NameTextBox.Name = "NameTextBox"
        Me.NameTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NameTextBox.TabIndex = 7
        '
        'VornameTextBox
        '
        Me.VornameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Vorname", True))
        Me.VornameTextBox.Location = New System.Drawing.Point(83, 266)
        Me.VornameTextBox.Name = "VornameTextBox"
        Me.VornameTextBox.Size = New System.Drawing.Size(200, 20)
        Me.VornameTextBox.TabIndex = 8
        '
        'Name1TextBox
        '
        Me.Name1TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Name1", True))
        Me.Name1TextBox.Location = New System.Drawing.Point(83, 292)
        Me.Name1TextBox.Name = "Name1TextBox"
        Me.Name1TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Name1TextBox.TabIndex = 9
        '
        'FirmaTextBox
        '
        Me.FirmaTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Firma", True))
        Me.FirmaTextBox.Location = New System.Drawing.Point(83, 133)
        Me.FirmaTextBox.Name = "FirmaTextBox"
        Me.FirmaTextBox.Size = New System.Drawing.Size(200, 20)
        Me.FirmaTextBox.TabIndex = 3
        '
        'AdresseTextBox
        '
        Me.AdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Adresse", True))
        Me.AdresseTextBox.Location = New System.Drawing.Point(379, 109)
        Me.AdresseTextBox.Name = "AdresseTextBox"
        Me.AdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.AdresseTextBox.TabIndex = 14
        '
        'LandComboBox
        '
        Me.LandComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.ofAdressenBindingSource, "Land", True))
        Me.LandComboBox.DataSource = Me.GrlandBindingSource
        Me.LandComboBox.DisplayMember = "Name"
        Me.LandComboBox.Location = New System.Drawing.Point(379, 56)
        Me.LandComboBox.Name = "LandComboBox"
        Me.LandComboBox.Size = New System.Drawing.Size(200, 21)
        Me.LandComboBox.TabIndex = 11
        Me.LandComboBox.ValueMember = "IdNr"
        '
        'GrlandBindingSource
        '
        Me.GrlandBindingSource.DataMember = "grland"
        Me.GrlandBindingSource.DataSource = Me.DsPLZ
        '
        'PLZComboBox
        '
        Me.PLZComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.ofAdressenBindingSource, "PLZ", True))
        Me.PLZComboBox.DataSource = Me.GrLandPlzBindingSource
        Me.PLZComboBox.DisplayMember = "PLZ"
        Me.PLZComboBox.FormattingEnabled = True
        Me.PLZComboBox.Location = New System.Drawing.Point(379, 82)
        Me.PLZComboBox.Name = "PLZComboBox"
        Me.PLZComboBox.Size = New System.Drawing.Size(54, 21)
        Me.PLZComboBox.TabIndex = 12
        Me.PLZComboBox.ValueMember = "IdNr"
        '
        'OrtComboBox
        '
        Me.OrtComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Ort", True))
        Me.OrtComboBox.DataSource = Me.GrLandPlzBindingSource
        Me.OrtComboBox.DisplayMember = "Ort"
        Me.OrtComboBox.FormattingEnabled = True
        Me.OrtComboBox.Location = New System.Drawing.Point(466, 83)
        Me.OrtComboBox.Name = "OrtComboBox"
        Me.OrtComboBox.Size = New System.Drawing.Size(113, 21)
        Me.OrtComboBox.TabIndex = 13
        Me.OrtComboBox.ValueMember = "Ort"
        '
        'TelTextBox
        '
        Me.TelTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Tel", True))
        Me.TelTextBox.Location = New System.Drawing.Point(379, 162)
        Me.TelTextBox.Name = "TelTextBox"
        Me.TelTextBox.Size = New System.Drawing.Size(200, 20)
        Me.TelTextBox.TabIndex = 16
        '
        'Tel2TextBox
        '
        Me.Tel2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Tel2", True))
        Me.Tel2TextBox.Location = New System.Drawing.Point(379, 188)
        Me.Tel2TextBox.Name = "Tel2TextBox"
        Me.Tel2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Tel2TextBox.TabIndex = 17
        '
        'FaxTextBox
        '
        Me.FaxTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Fax", True))
        Me.FaxTextBox.Location = New System.Drawing.Point(379, 214)
        Me.FaxTextBox.Name = "FaxTextBox"
        Me.FaxTextBox.Size = New System.Drawing.Size(200, 20)
        Me.FaxTextBox.TabIndex = 18
        '
        'Fax2TextBox
        '
        Me.Fax2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Fax2", True))
        Me.Fax2TextBox.Location = New System.Drawing.Point(379, 240)
        Me.Fax2TextBox.Name = "Fax2TextBox"
        Me.Fax2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Fax2TextBox.TabIndex = 19
        '
        'MobilTextBox
        '
        Me.MobilTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Mobil", True))
        Me.MobilTextBox.Location = New System.Drawing.Point(379, 266)
        Me.MobilTextBox.Name = "MobilTextBox"
        Me.MobilTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MobilTextBox.TabIndex = 20
        '
        'EmailTextBox
        '
        Me.EmailTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Email", True))
        Me.EmailTextBox.Location = New System.Drawing.Point(379, 292)
        Me.EmailTextBox.Name = "EmailTextBox"
        Me.EmailTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EmailTextBox.TabIndex = 21
        '
        'WebTextBox
        '
        Me.WebTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Web", True))
        Me.WebTextBox.Location = New System.Drawing.Point(379, 318)
        Me.WebTextBox.Name = "WebTextBox"
        Me.WebTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WebTextBox.TabIndex = 22
        '
        'GeburtstagDateTimePicker
        '
        Me.GeburtstagDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.ofAdressenBindingSource, "Geburtstag", True))
        Me.GeburtstagDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.GeburtstagDateTimePicker.Location = New System.Drawing.Point(83, 318)
        Me.GeburtstagDateTimePicker.Name = "GeburtstagDateTimePicker"
        Me.GeburtstagDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.GeburtstagDateTimePicker.TabIndex = 10
        '
        'Ofadressen_zahlungsmethodenTableAdapter
        '
        Me.Ofadressen_zahlungsmethodenTableAdapter.ClearBeforeFill = True
        '
        'Ofadressen_zahlungsbedingungenTableAdapter
        '
        Me.Ofadressen_zahlungsbedingungenTableAdapter.ClearBeforeFill = True
        '
        'Ofadressen_transportmethodenTableAdapter
        '
        Me.Ofadressen_transportmethodenTableAdapter.ClearBeforeFill = True
        '
        'Ofadressen_weitereTableAdapter
        '
        Me.Ofadressen_weitereTableAdapter.ClearBeforeFill = True
        '
        'ButtonPLZSelect
        '
        Me.ButtonPLZSelect.Location = New System.Drawing.Point(585, 81)
        Me.ButtonPLZSelect.Name = "ButtonPLZSelect"
        Me.ButtonPLZSelect.Size = New System.Drawing.Size(33, 23)
        Me.ButtonPLZSelect.TabIndex = 14
        Me.ButtonPLZSelect.Text = "..."
        Me.ButtonPLZSelect.UseVisualStyleBackColor = True
        '
        'GrlandTableAdapter
        '
        Me.GrlandTableAdapter.ClearBeforeFill = True
        '
        'FillByToolStrip
        '
        Me.FillByToolStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.FillByToolStripButton})
        Me.FillByToolStrip.Location = New System.Drawing.Point(0, 25)
        Me.FillByToolStrip.Name = "FillByToolStrip"
        Me.FillByToolStrip.Size = New System.Drawing.Size(794, 25)
        Me.FillByToolStrip.TabIndex = 70
        Me.FillByToolStrip.Text = "FillByToolStrip"
        '
        'FillByToolStripButton
        '
        Me.FillByToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text
        Me.FillByToolStripButton.Name = "FillByToolStripButton"
        Me.FillByToolStripButton.Size = New System.Drawing.Size(39, 22)
        Me.FillByToolStripButton.Text = "FillBy"
        '
        'GrzahlungsmethodeTableAdapter
        '
        Me.GrzahlungsmethodeTableAdapter.ClearBeforeFill = True
        '
        'GrzahlungsbedingungTableAdapter
        '
        Me.GrzahlungsbedingungTableAdapter.ClearBeforeFill = True
        '
        'GrtransportmethodeTableAdapter
        '
        Me.GrtransportmethodeTableAdapter.ClearBeforeFill = True
        '
        'Kunden
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(794, 675)
        Me.Controls.Add(Me.FillByToolStrip)
        Me.Controls.Add(Me.ButtonPLZSelect)
        Me.Controls.Add(IDNRLabel)
        Me.Controls.Add(Me.IDNRTextBox)
        Me.Controls.Add(StatusLabel)
        Me.Controls.Add(Me.StatusComboBox)
        Me.Controls.Add(BrancheLabel)
        Me.Controls.Add(Me.BrancheComboBox)
        Me.Controls.Add(BriefanredeLabel)
        Me.Controls.Add(Me.BriefanredeComboBox)
        Me.Controls.Add(TitelLabel)
        Me.Controls.Add(Me.TitelComboBox)
        Me.Controls.Add(AnredeLabel)
        Me.Controls.Add(Me.AnredeComboBox)
        Me.Controls.Add(NameLabel)
        Me.Controls.Add(Me.NameTextBox)
        Me.Controls.Add(VornameLabel)
        Me.Controls.Add(Me.VornameTextBox)
        Me.Controls.Add(Name1Label)
        Me.Controls.Add(Me.Name1TextBox)
        Me.Controls.Add(FirmaLabel)
        Me.Controls.Add(Me.FirmaTextBox)
        Me.Controls.Add(AdresseLabel)
        Me.Controls.Add(Me.AdresseTextBox)
        Me.Controls.Add(LandLabel)
        Me.Controls.Add(Me.LandComboBox)
        Me.Controls.Add(PLZLabel)
        Me.Controls.Add(Me.PLZComboBox)
        Me.Controls.Add(OrtLabel)
        Me.Controls.Add(Me.OrtComboBox)
        Me.Controls.Add(TelLabel)
        Me.Controls.Add(Me.TelTextBox)
        Me.Controls.Add(Tel2Label)
        Me.Controls.Add(Me.Tel2TextBox)
        Me.Controls.Add(FaxLabel)
        Me.Controls.Add(Me.FaxTextBox)
        Me.Controls.Add(Fax2Label)
        Me.Controls.Add(Me.Fax2TextBox)
        Me.Controls.Add(MobilLabel)
        Me.Controls.Add(Me.MobilTextBox)
        Me.Controls.Add(EmailLabel)
        Me.Controls.Add(Me.EmailTextBox)
        Me.Controls.Add(WebLabel)
        Me.Controls.Add(Me.WebTextBox)
        Me.Controls.Add(GeburtstagLabel)
        Me.Controls.Add(Me.GeburtstagDateTimePicker)
        Me.Controls.Add(Me.TabControl1)
        Me.Name = "Kunden"
        Me.Text = "Kunden"
        Me.Controls.SetChildIndex(Me.TabControl1, 0)
        Me.Controls.SetChildIndex(Me.GeburtstagDateTimePicker, 0)
        Me.Controls.SetChildIndex(GeburtstagLabel, 0)
        Me.Controls.SetChildIndex(Me.WebTextBox, 0)
        Me.Controls.SetChildIndex(WebLabel, 0)
        Me.Controls.SetChildIndex(Me.EmailTextBox, 0)
        Me.Controls.SetChildIndex(EmailLabel, 0)
        Me.Controls.SetChildIndex(Me.MobilTextBox, 0)
        Me.Controls.SetChildIndex(MobilLabel, 0)
        Me.Controls.SetChildIndex(Me.Fax2TextBox, 0)
        Me.Controls.SetChildIndex(Fax2Label, 0)
        Me.Controls.SetChildIndex(Me.FaxTextBox, 0)
        Me.Controls.SetChildIndex(FaxLabel, 0)
        Me.Controls.SetChildIndex(Me.Tel2TextBox, 0)
        Me.Controls.SetChildIndex(Tel2Label, 0)
        Me.Controls.SetChildIndex(Me.TelTextBox, 0)
        Me.Controls.SetChildIndex(TelLabel, 0)
        Me.Controls.SetChildIndex(Me.OrtComboBox, 0)
        Me.Controls.SetChildIndex(OrtLabel, 0)
        Me.Controls.SetChildIndex(Me.PLZComboBox, 0)
        Me.Controls.SetChildIndex(PLZLabel, 0)
        Me.Controls.SetChildIndex(Me.LandComboBox, 0)
        Me.Controls.SetChildIndex(LandLabel, 0)
        Me.Controls.SetChildIndex(Me.AdresseTextBox, 0)
        Me.Controls.SetChildIndex(AdresseLabel, 0)
        Me.Controls.SetChildIndex(Me.FirmaTextBox, 0)
        Me.Controls.SetChildIndex(FirmaLabel, 0)
        Me.Controls.SetChildIndex(Me.Name1TextBox, 0)
        Me.Controls.SetChildIndex(Name1Label, 0)
        Me.Controls.SetChildIndex(Me.VornameTextBox, 0)
        Me.Controls.SetChildIndex(VornameLabel, 0)
        Me.Controls.SetChildIndex(Me.NameTextBox, 0)
        Me.Controls.SetChildIndex(NameLabel, 0)
        Me.Controls.SetChildIndex(Me.AnredeComboBox, 0)
        Me.Controls.SetChildIndex(AnredeLabel, 0)
        Me.Controls.SetChildIndex(Me.TitelComboBox, 0)
        Me.Controls.SetChildIndex(TitelLabel, 0)
        Me.Controls.SetChildIndex(Me.BriefanredeComboBox, 0)
        Me.Controls.SetChildIndex(BriefanredeLabel, 0)
        Me.Controls.SetChildIndex(Me.BrancheComboBox, 0)
        Me.Controls.SetChildIndex(BrancheLabel, 0)
        Me.Controls.SetChildIndex(Me.StatusComboBox, 0)
        Me.Controls.SetChildIndex(StatusLabel, 0)
        Me.Controls.SetChildIndex(Me.IDNRTextBox, 0)
        Me.Controls.SetChildIndex(IDNRLabel, 0)
        Me.Controls.SetChildIndex(Me.ButtonPLZSelect, 0)
        Me.Controls.SetChildIndex(Me.FillByToolStrip, 0)
        CType(Me.DataSetKunden, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ofAdressenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.TableLayoutPanel1.PerformLayout()
        CType(Me.Ofadressen_zahlungsmethodenDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrzahlungsmethodeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsStammdaten, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_zahlungsmethodenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_zahlungsbedingungenDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrzahlungsbedingungBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_zahlungsbedingungenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_transportmethodenDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrtransportmethodeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_transportmethodenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.FKofAdressenofadressensettingsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.KundengruppenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PreislistenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        Me.TabPage4.ResumeLayout(False)
        CType(Me.Ofadressen_weitereDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_settingsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.FillByToolStrip.ResumeLayout(False)
        Me.FillByToolStrip.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DataSetKunden As IntraSell_Net.dsAdressen
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage

    Friend WithEvents ofAdressenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfAdressenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter
    Friend WithEvents BindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents cbPreisliste As System.Windows.Forms.ComboBox
    Friend WithEvents PreislistenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents PreislistenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.PreislistenTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents Ofadressen_settingsTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_settingsTableAdapter
    Friend WithEvents Ofadressen_settingsBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents FKofAdressenofadressensettingsBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Label15 As System.Windows.Forms.Label
    Friend WithEvents Label14 As System.Windows.Forms.Label
    Friend WithEvents cbKundengruppe As System.Windows.Forms.ComboBox
    Friend WithEvents KundengruppenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents KundengruppenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.KundengruppenTableAdapter
    Friend WithEvents DsPLZ As IntraSell_Net.dsPLZ
    Friend WithEvents GrLandPlzTableAdapter As IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter
    Friend WithEvents TableAdapterManager1 As IntraSell_Net.dsPLZTableAdapters.TableAdapterManager
    Friend WithEvents GrLandPlzBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents IDNRTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StatusComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents BrancheComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents BriefanredeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents TitelComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents AnredeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents NameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents VornameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Name1TextBox As System.Windows.Forms.TextBox
    Friend WithEvents FirmaTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LandComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents PLZComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents OrtComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents TelTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Tel2TextBox As System.Windows.Forms.TextBox
    Friend WithEvents FaxTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Fax2TextBox As System.Windows.Forms.TextBox
    Friend WithEvents MobilTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EmailTextBox As System.Windows.Forms.TextBox
    Friend WithEvents WebTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ExportCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents MAAusenComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents MAInnenComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents AbbuchungCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents HasMenuCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents PasswortTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NextIDNRComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents MandantTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GeburtstagDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents UIDTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SkypeAdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MessengerAdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EUNummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EUNummer1TextBox As System.Windows.Forms.TextBox
    Friend WithEvents EUNummer2TextBox As System.Windows.Forms.TextBox
    Friend WithEvents BHReferenzTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Ofadressen_zahlungsmethodenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_zahlungsmethodenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_zahlungsmethodenTableAdapter
    Friend WithEvents Ofadressen_zahlungsmethodenDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Ofadressen_zahlungsbedingungenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_zahlungsbedingungenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_zahlungsbedingungenTableAdapter
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Ofadressen_zahlungsbedingungenDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents TabPage4 As System.Windows.Forms.TabPage
    Friend WithEvents Ofadressen_transportmethodenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_transportmethodenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_transportmethodenTableAdapter
    Friend WithEvents Ofadressen_weitereBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_weitereTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Ofadressen_transportmethodenDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents Ofadressen_weitereDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents FirmenKontoIdTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Language_codeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents DataGridViewTextBoxColumn8 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn17 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn19 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn20 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn21 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn22 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn23 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn24 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn25 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn26 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn27 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn28 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn29 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn30 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn31 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn32 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn33 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn34 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ButtonPLZSelect As System.Windows.Forms.Button
    Friend WithEvents GrlandTableAdapter As IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter
    Friend WithEvents FillByToolStrip As System.Windows.Forms.ToolStrip
    Friend WithEvents FillByToolStripButton As System.Windows.Forms.ToolStripButton
    Friend WithEvents GrlandBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents DsStammdaten As IntraSell_Net.dsStammdaten
    Friend WithEvents GrzahlungsmethodeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrzahlungsmethodeTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grzahlungsmethodeTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn1 As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents GrzahlungsbedingungBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrzahlungsbedingungTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grzahlungsbedingungTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn2 As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents GrtransportmethodeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrtransportmethodeTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grtransportmethodeTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As System.Windows.Forms.DataGridViewCheckBoxColumn
End Class
