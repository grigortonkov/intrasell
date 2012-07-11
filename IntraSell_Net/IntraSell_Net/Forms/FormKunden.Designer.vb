<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FormKunden
    Inherits AbstractForm

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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(FormKunden))
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
        Dim ExportLabel As System.Windows.Forms.Label
        Dim AngelegtAnLabel As System.Windows.Forms.Label
        Dim MAAusenLabel As System.Windows.Forms.Label
        Dim MAInnenLabel As System.Windows.Forms.Label
        Dim AbbuchungLabel As System.Windows.Forms.Label
        Dim HasMenuLabel As System.Windows.Forms.Label
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
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.OfAdressenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfadressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        '''Me.ParentBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.OfAdressenBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.IDNRTextBox = New System.Windows.Forms.TextBox()
        Me.StatusComboBox = New System.Windows.Forms.ComboBox()
        Me.BrancheComboBox = New System.Windows.Forms.ComboBox()
        Me.BriefanredeTextBox = New System.Windows.Forms.TextBox()
        Me.TitelTextBox = New System.Windows.Forms.TextBox()
        Me.AnredeTextBox = New System.Windows.Forms.TextBox()
        Me.NameTextBox = New System.Windows.Forms.TextBox()
        Me.VornameTextBox = New System.Windows.Forms.TextBox()
        Me.Name1TextBox = New System.Windows.Forms.TextBox()
        Me.FirmaTextBox = New System.Windows.Forms.TextBox()
        Me.AdresseTextBox = New System.Windows.Forms.TextBox()
        Me.LandTextBox = New System.Windows.Forms.TextBox()
        Me.PLZComboBox = New System.Windows.Forms.ComboBox()
        Me.OrtTextBox = New System.Windows.Forms.TextBox()
        Me.TelTextBox = New System.Windows.Forms.TextBox()
        Me.Tel2TextBox = New System.Windows.Forms.TextBox()
        Me.FaxTextBox = New System.Windows.Forms.TextBox()
        Me.Fax2TextBox = New System.Windows.Forms.TextBox()
        Me.MobilTextBox = New System.Windows.Forms.TextBox()
        Me.EmailTextBox = New System.Windows.Forms.TextBox()
        Me.WebTextBox = New System.Windows.Forms.TextBox()
        Me.ExportCheckBox = New System.Windows.Forms.CheckBox()
        Me.AngelegtAnDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.MAAusenTextBox = New System.Windows.Forms.TextBox()
        Me.MAInnenTextBox = New System.Windows.Forms.TextBox()
        Me.AbbuchungCheckBox = New System.Windows.Forms.CheckBox()
        Me.HasMenuCheckBox = New System.Windows.Forms.CheckBox()
        Me.PasswortTextBox = New System.Windows.Forms.TextBox()
        Me.NextIDNRTextBox = New System.Windows.Forms.TextBox()
        Me.MandantTextBox = New System.Windows.Forms.TextBox()
        Me.GeburtstagDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.UIDTextBox = New System.Windows.Forms.TextBox()
        Me.SkypeAdresseTextBox = New System.Windows.Forms.TextBox()
        Me.MessengerAdresseTextBox = New System.Windows.Forms.TextBox()
        Me.EUNummerTextBox = New System.Windows.Forms.TextBox()
        Me.EUNummer1TextBox = New System.Windows.Forms.TextBox()
        Me.EUNummer2TextBox = New System.Windows.Forms.TextBox()
        Me.BHReferenzTextBox = New System.Windows.Forms.TextBox()
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
        ExportLabel = New System.Windows.Forms.Label()
        AngelegtAnLabel = New System.Windows.Forms.Label()
        MAAusenLabel = New System.Windows.Forms.Label()
        MAInnenLabel = New System.Windows.Forms.Label()
        AbbuchungLabel = New System.Windows.Forms.Label()
        HasMenuLabel = New System.Windows.Forms.Label()
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
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ParentBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ParentBindingNavigator.SuspendLayout()
        Me.SuspendLayout()
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'OfAdressenBindingSource
        '
        Me.OfAdressenBindingSource.DataMember = "ofAdressen"
        Me.OfAdressenBindingSource.DataSource = Me.DsAdressen
        '
        'OfadressenTableAdapter
        '
        Me.OfadressenTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.ofadressen_settingsTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_transportmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_weitereTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsbedingungenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Me.OfadressenTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        
        '
        'IDNRLabel
        '
        IDNRLabel.AutoSize = True
        IDNRLabel.Location = New System.Drawing.Point(112, 79)
        IDNRLabel.Name = "IDNRLabel"
        IDNRLabel.Size = New System.Drawing.Size(37, 13)
        IDNRLabel.TabIndex = 1
        IDNRLabel.Text = "IDNR:"
        '
        'IDNRTextBox
        '
        Me.IDNRTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "IDNR", True))
        Me.IDNRTextBox.Location = New System.Drawing.Point(221, 76)
        Me.IDNRTextBox.Name = "IDNRTextBox"
        Me.IDNRTextBox.Size = New System.Drawing.Size(200, 20)
        Me.IDNRTextBox.TabIndex = 2
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(112, 105)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 3
        StatusLabel.Text = "Status:"
        '
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(221, 102)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 4
        '
        'BrancheLabel
        '
        BrancheLabel.AutoSize = True
        BrancheLabel.Location = New System.Drawing.Point(112, 132)
        BrancheLabel.Name = "BrancheLabel"
        BrancheLabel.Size = New System.Drawing.Size(50, 13)
        BrancheLabel.TabIndex = 5
        BrancheLabel.Text = "Branche:"
        '
        'BrancheComboBox
        '
        Me.BrancheComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Branche", True))
        Me.BrancheComboBox.FormattingEnabled = True
        Me.BrancheComboBox.Location = New System.Drawing.Point(221, 129)
        Me.BrancheComboBox.Name = "BrancheComboBox"
        Me.BrancheComboBox.Size = New System.Drawing.Size(200, 21)
        Me.BrancheComboBox.TabIndex = 6
        '
        'BriefanredeLabel
        '
        BriefanredeLabel.AutoSize = True
        BriefanredeLabel.Location = New System.Drawing.Point(112, 159)
        BriefanredeLabel.Name = "BriefanredeLabel"
        BriefanredeLabel.Size = New System.Drawing.Size(64, 13)
        BriefanredeLabel.TabIndex = 7
        BriefanredeLabel.Text = "Briefanrede:"
        '
        'BriefanredeTextBox
        '
        Me.BriefanredeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Briefanrede", True))
        Me.BriefanredeTextBox.Location = New System.Drawing.Point(221, 156)
        Me.BriefanredeTextBox.Name = "BriefanredeTextBox"
        Me.BriefanredeTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BriefanredeTextBox.TabIndex = 8
        '
        'TitelLabel
        '
        TitelLabel.AutoSize = True
        TitelLabel.Location = New System.Drawing.Point(112, 185)
        TitelLabel.Name = "TitelLabel"
        TitelLabel.Size = New System.Drawing.Size(30, 13)
        TitelLabel.TabIndex = 9
        TitelLabel.Text = "Titel:"
        '
        'TitelTextBox
        '
        Me.TitelTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Titel", True))
        Me.TitelTextBox.Location = New System.Drawing.Point(221, 182)
        Me.TitelTextBox.Name = "TitelTextBox"
        Me.TitelTextBox.Size = New System.Drawing.Size(200, 20)
        Me.TitelTextBox.TabIndex = 10
        '
        'AnredeLabel
        '
        AnredeLabel.AutoSize = True
        AnredeLabel.Location = New System.Drawing.Point(112, 211)
        AnredeLabel.Name = "AnredeLabel"
        AnredeLabel.Size = New System.Drawing.Size(44, 13)
        AnredeLabel.TabIndex = 11
        AnredeLabel.Text = "Anrede:"
        '
        'AnredeTextBox
        '
        Me.AnredeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Anrede", True))
        Me.AnredeTextBox.Location = New System.Drawing.Point(221, 208)
        Me.AnredeTextBox.Name = "AnredeTextBox"
        Me.AnredeTextBox.Size = New System.Drawing.Size(200, 20)
        Me.AnredeTextBox.TabIndex = 12
        '
        'NameLabel
        '
        NameLabel.AutoSize = True
        NameLabel.Location = New System.Drawing.Point(112, 237)
        NameLabel.Name = "NameLabel"
        NameLabel.Size = New System.Drawing.Size(38, 13)
        NameLabel.TabIndex = 13
        NameLabel.Text = "Name:"
        '
        'NameTextBox
        '
        Me.NameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Name", True))
        Me.NameTextBox.Location = New System.Drawing.Point(221, 234)
        Me.NameTextBox.Name = "NameTextBox"
        Me.NameTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NameTextBox.TabIndex = 14
        '
        'VornameLabel
        '
        VornameLabel.AutoSize = True
        VornameLabel.Location = New System.Drawing.Point(112, 263)
        VornameLabel.Name = "VornameLabel"
        VornameLabel.Size = New System.Drawing.Size(52, 13)
        VornameLabel.TabIndex = 15
        VornameLabel.Text = "Vorname:"
        '
        'VornameTextBox
        '
        Me.VornameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Vorname", True))
        Me.VornameTextBox.Location = New System.Drawing.Point(221, 260)
        Me.VornameTextBox.Name = "VornameTextBox"
        Me.VornameTextBox.Size = New System.Drawing.Size(200, 20)
        Me.VornameTextBox.TabIndex = 16
        '
        'Name1Label
        '
        Name1Label.AutoSize = True
        Name1Label.Location = New System.Drawing.Point(112, 289)
        Name1Label.Name = "Name1Label"
        Name1Label.Size = New System.Drawing.Size(44, 13)
        Name1Label.TabIndex = 17
        Name1Label.Text = "Name1:"
        '
        'Name1TextBox
        '
        Me.Name1TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Name1", True))
        Me.Name1TextBox.Location = New System.Drawing.Point(221, 286)
        Me.Name1TextBox.Name = "Name1TextBox"
        Me.Name1TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Name1TextBox.TabIndex = 18
        '
        'FirmaLabel
        '
        FirmaLabel.AutoSize = True
        FirmaLabel.Location = New System.Drawing.Point(112, 315)
        FirmaLabel.Name = "FirmaLabel"
        FirmaLabel.Size = New System.Drawing.Size(35, 13)
        FirmaLabel.TabIndex = 19
        FirmaLabel.Text = "Firma:"
        '
        'FirmaTextBox
        '
        Me.FirmaTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Firma", True))
        Me.FirmaTextBox.Location = New System.Drawing.Point(221, 312)
        Me.FirmaTextBox.Name = "FirmaTextBox"
        Me.FirmaTextBox.Size = New System.Drawing.Size(200, 20)
        Me.FirmaTextBox.TabIndex = 20
        '
        'AdresseLabel
        '
        AdresseLabel.AutoSize = True
        AdresseLabel.Location = New System.Drawing.Point(112, 341)
        AdresseLabel.Name = "AdresseLabel"
        AdresseLabel.Size = New System.Drawing.Size(48, 13)
        AdresseLabel.TabIndex = 21
        AdresseLabel.Text = "Adresse:"
        '
        'AdresseTextBox
        '
        Me.AdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Adresse", True))
        Me.AdresseTextBox.Location = New System.Drawing.Point(221, 338)
        Me.AdresseTextBox.Name = "AdresseTextBox"
        Me.AdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.AdresseTextBox.TabIndex = 22
        '
        'LandLabel
        '
        LandLabel.AutoSize = True
        LandLabel.Location = New System.Drawing.Point(112, 367)
        LandLabel.Name = "LandLabel"
        LandLabel.Size = New System.Drawing.Size(34, 13)
        LandLabel.TabIndex = 23
        LandLabel.Text = "Land:"
        '
        'LandTextBox
        '
        Me.LandTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Land", True))
        Me.LandTextBox.Location = New System.Drawing.Point(221, 364)
        Me.LandTextBox.Name = "LandTextBox"
        Me.LandTextBox.Size = New System.Drawing.Size(200, 20)
        Me.LandTextBox.TabIndex = 24
        '
        'PLZLabel
        '
        PLZLabel.AutoSize = True
        PLZLabel.Location = New System.Drawing.Point(112, 393)
        PLZLabel.Name = "PLZLabel"
        PLZLabel.Size = New System.Drawing.Size(30, 13)
        PLZLabel.TabIndex = 25
        PLZLabel.Text = "PLZ:"
        '
        'PLZComboBox
        '
        Me.PLZComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "PLZ", True))
        Me.PLZComboBox.FormattingEnabled = True
        Me.PLZComboBox.Location = New System.Drawing.Point(221, 390)
        Me.PLZComboBox.Name = "PLZComboBox"
        Me.PLZComboBox.Size = New System.Drawing.Size(200, 21)
        Me.PLZComboBox.TabIndex = 26
        '
        'OrtLabel
        '
        OrtLabel.AutoSize = True
        OrtLabel.Location = New System.Drawing.Point(112, 420)
        OrtLabel.Name = "OrtLabel"
        OrtLabel.Size = New System.Drawing.Size(24, 13)
        OrtLabel.TabIndex = 27
        OrtLabel.Text = "Ort:"
        '
        'OrtTextBox
        '
        Me.OrtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Ort", True))
        Me.OrtTextBox.Location = New System.Drawing.Point(221, 417)
        Me.OrtTextBox.Name = "OrtTextBox"
        Me.OrtTextBox.Size = New System.Drawing.Size(200, 20)
        Me.OrtTextBox.TabIndex = 28
        '
        'TelLabel
        '
        TelLabel.AutoSize = True
        TelLabel.Location = New System.Drawing.Point(112, 446)
        TelLabel.Name = "TelLabel"
        TelLabel.Size = New System.Drawing.Size(25, 13)
        TelLabel.TabIndex = 29
        TelLabel.Text = "Tel:"
        '
        'TelTextBox
        '
        Me.TelTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Tel", True))
        Me.TelTextBox.Location = New System.Drawing.Point(221, 443)
        Me.TelTextBox.Name = "TelTextBox"
        Me.TelTextBox.Size = New System.Drawing.Size(200, 20)
        Me.TelTextBox.TabIndex = 30
        '
        'Tel2Label
        '
        Tel2Label.AutoSize = True
        Tel2Label.Location = New System.Drawing.Point(112, 472)
        Tel2Label.Name = "Tel2Label"
        Tel2Label.Size = New System.Drawing.Size(31, 13)
        Tel2Label.TabIndex = 31
        Tel2Label.Text = "Tel2:"
        '
        'Tel2TextBox
        '
        Me.Tel2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Tel2", True))
        Me.Tel2TextBox.Location = New System.Drawing.Point(221, 469)
        Me.Tel2TextBox.Name = "Tel2TextBox"
        Me.Tel2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Tel2TextBox.TabIndex = 32
        '
        'FaxLabel
        '
        FaxLabel.AutoSize = True
        FaxLabel.Location = New System.Drawing.Point(112, 498)
        FaxLabel.Name = "FaxLabel"
        FaxLabel.Size = New System.Drawing.Size(27, 13)
        FaxLabel.TabIndex = 33
        FaxLabel.Text = "Fax:"
        '
        'FaxTextBox
        '
        Me.FaxTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Fax", True))
        Me.FaxTextBox.Location = New System.Drawing.Point(221, 495)
        Me.FaxTextBox.Name = "FaxTextBox"
        Me.FaxTextBox.Size = New System.Drawing.Size(200, 20)
        Me.FaxTextBox.TabIndex = 34
        '
        'Fax2Label
        '
        Fax2Label.AutoSize = True
        Fax2Label.Location = New System.Drawing.Point(112, 524)
        Fax2Label.Name = "Fax2Label"
        Fax2Label.Size = New System.Drawing.Size(33, 13)
        Fax2Label.TabIndex = 35
        Fax2Label.Text = "Fax2:"
        '
        'Fax2TextBox
        '
        Me.Fax2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Fax2", True))
        Me.Fax2TextBox.Location = New System.Drawing.Point(221, 521)
        Me.Fax2TextBox.Name = "Fax2TextBox"
        Me.Fax2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Fax2TextBox.TabIndex = 36
        '
        'MobilLabel
        '
        MobilLabel.AutoSize = True
        MobilLabel.Location = New System.Drawing.Point(112, 550)
        MobilLabel.Name = "MobilLabel"
        MobilLabel.Size = New System.Drawing.Size(35, 13)
        MobilLabel.TabIndex = 37
        MobilLabel.Text = "Mobil:"
        '
        'MobilTextBox
        '
        Me.MobilTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Mobil", True))
        Me.MobilTextBox.Location = New System.Drawing.Point(221, 547)
        Me.MobilTextBox.Name = "MobilTextBox"
        Me.MobilTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MobilTextBox.TabIndex = 38
        '
        'EmailLabel
        '
        EmailLabel.AutoSize = True
        EmailLabel.Location = New System.Drawing.Point(112, 576)
        EmailLabel.Name = "EmailLabel"
        EmailLabel.Size = New System.Drawing.Size(35, 13)
        EmailLabel.TabIndex = 39
        EmailLabel.Text = "Email:"
        '
        'EmailTextBox
        '
        Me.EmailTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Email", True))
        Me.EmailTextBox.Location = New System.Drawing.Point(221, 573)
        Me.EmailTextBox.Name = "EmailTextBox"
        Me.EmailTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EmailTextBox.TabIndex = 40
        '
        'WebLabel
        '
        WebLabel.AutoSize = True
        WebLabel.Location = New System.Drawing.Point(112, 602)
        WebLabel.Name = "WebLabel"
        WebLabel.Size = New System.Drawing.Size(33, 13)
        WebLabel.TabIndex = 41
        WebLabel.Text = "Web:"
        '
        'WebTextBox
        '
        Me.WebTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Web", True))
        Me.WebTextBox.Location = New System.Drawing.Point(221, 599)
        Me.WebTextBox.Name = "WebTextBox"
        Me.WebTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WebTextBox.TabIndex = 42
        '
        'ExportLabel
        '
        ExportLabel.AutoSize = True
        ExportLabel.Location = New System.Drawing.Point(112, 630)
        ExportLabel.Name = "ExportLabel"
        ExportLabel.Size = New System.Drawing.Size(40, 13)
        ExportLabel.TabIndex = 43
        ExportLabel.Text = "Export:"
        '
        'ExportCheckBox
        '
        Me.ExportCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.OfAdressenBindingSource, "Export", True))
        Me.ExportCheckBox.Location = New System.Drawing.Point(221, 625)
        Me.ExportCheckBox.Name = "ExportCheckBox"
        Me.ExportCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.ExportCheckBox.TabIndex = 44
        Me.ExportCheckBox.Text = "CheckBox1"
        Me.ExportCheckBox.UseVisualStyleBackColor = True
        '
        'AngelegtAnLabel
        '
        AngelegtAnLabel.AutoSize = True
        AngelegtAnLabel.Location = New System.Drawing.Point(112, 659)
        AngelegtAnLabel.Name = "AngelegtAnLabel"
        AngelegtAnLabel.Size = New System.Drawing.Size(68, 13)
        AngelegtAnLabel.TabIndex = 45
        AngelegtAnLabel.Text = "Angelegt An:"
        '
        'AngelegtAnDateTimePicker
        '
        Me.AngelegtAnDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.OfAdressenBindingSource, "AngelegtAn", True))
        Me.AngelegtAnDateTimePicker.Location = New System.Drawing.Point(221, 655)
        Me.AngelegtAnDateTimePicker.Name = "AngelegtAnDateTimePicker"
        Me.AngelegtAnDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.AngelegtAnDateTimePicker.TabIndex = 46
        '
        'MAAusenLabel
        '
        MAAusenLabel.AutoSize = True
        MAAusenLabel.Location = New System.Drawing.Point(112, 684)
        MAAusenLabel.Name = "MAAusenLabel"
        MAAusenLabel.Size = New System.Drawing.Size(56, 13)
        MAAusenLabel.TabIndex = 47
        MAAusenLabel.Text = "MAAusen:"
        '
        'MAAusenTextBox
        '
        Me.MAAusenTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "MAAusen", True))
        Me.MAAusenTextBox.Location = New System.Drawing.Point(221, 681)
        Me.MAAusenTextBox.Name = "MAAusenTextBox"
        Me.MAAusenTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MAAusenTextBox.TabIndex = 48
        '
        'MAInnenLabel
        '
        MAInnenLabel.AutoSize = True
        MAInnenLabel.Location = New System.Drawing.Point(112, 710)
        MAInnenLabel.Name = "MAInnenLabel"
        MAInnenLabel.Size = New System.Drawing.Size(53, 13)
        MAInnenLabel.TabIndex = 49
        MAInnenLabel.Text = "MAInnen:"
        '
        'MAInnenTextBox
        '
        Me.MAInnenTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "MAInnen", True))
        Me.MAInnenTextBox.Location = New System.Drawing.Point(221, 707)
        Me.MAInnenTextBox.Name = "MAInnenTextBox"
        Me.MAInnenTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MAInnenTextBox.TabIndex = 50
        '
        'AbbuchungLabel
        '
        AbbuchungLabel.AutoSize = True
        AbbuchungLabel.Location = New System.Drawing.Point(112, 738)
        AbbuchungLabel.Name = "AbbuchungLabel"
        AbbuchungLabel.Size = New System.Drawing.Size(65, 13)
        AbbuchungLabel.TabIndex = 51
        AbbuchungLabel.Text = "Abbuchung:"
        '
        'AbbuchungCheckBox
        '
        Me.AbbuchungCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.OfAdressenBindingSource, "Abbuchung", True))
        Me.AbbuchungCheckBox.Location = New System.Drawing.Point(221, 733)
        Me.AbbuchungCheckBox.Name = "AbbuchungCheckBox"
        Me.AbbuchungCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.AbbuchungCheckBox.TabIndex = 52
        Me.AbbuchungCheckBox.Text = "CheckBox1"
        Me.AbbuchungCheckBox.UseVisualStyleBackColor = True
        '
        'HasMenuLabel
        '
        HasMenuLabel.AutoSize = True
        HasMenuLabel.Location = New System.Drawing.Point(112, 768)
        HasMenuLabel.Name = "HasMenuLabel"
        HasMenuLabel.Size = New System.Drawing.Size(57, 13)
        HasMenuLabel.TabIndex = 53
        HasMenuLabel.Text = "has Menu:"
        '
        'HasMenuCheckBox
        '
        Me.HasMenuCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.OfAdressenBindingSource, "hasMenu", True))
        Me.HasMenuCheckBox.Location = New System.Drawing.Point(221, 763)
        Me.HasMenuCheckBox.Name = "HasMenuCheckBox"
        Me.HasMenuCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.HasMenuCheckBox.TabIndex = 54
        Me.HasMenuCheckBox.Text = "CheckBox1"
        Me.HasMenuCheckBox.UseVisualStyleBackColor = True
        '
        'PasswortLabel
        '
        PasswortLabel.AutoSize = True
        PasswortLabel.Location = New System.Drawing.Point(112, 796)
        PasswortLabel.Name = "PasswortLabel"
        PasswortLabel.Size = New System.Drawing.Size(53, 13)
        PasswortLabel.TabIndex = 55
        PasswortLabel.Text = "Passwort:"
        '
        'PasswortTextBox
        '
        Me.PasswortTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "Passwort", True))
        Me.PasswortTextBox.Location = New System.Drawing.Point(221, 793)
        Me.PasswortTextBox.Name = "PasswortTextBox"
        Me.PasswortTextBox.Size = New System.Drawing.Size(200, 20)
        Me.PasswortTextBox.TabIndex = 56
        '
        'NextIDNRLabel
        '
        NextIDNRLabel.AutoSize = True
        NextIDNRLabel.Location = New System.Drawing.Point(112, 822)
        NextIDNRLabel.Name = "NextIDNRLabel"
        NextIDNRLabel.Size = New System.Drawing.Size(60, 13)
        NextIDNRLabel.TabIndex = 57
        NextIDNRLabel.Text = "next IDNR:"
        '
        'NextIDNRTextBox
        '
        Me.NextIDNRTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "nextIDNR", True))
        Me.NextIDNRTextBox.Location = New System.Drawing.Point(221, 819)
        Me.NextIDNRTextBox.Name = "NextIDNRTextBox"
        Me.NextIDNRTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NextIDNRTextBox.TabIndex = 58
        '
        'MandantLabel
        '
        MandantLabel.AutoSize = True
        MandantLabel.Location = New System.Drawing.Point(112, 848)
        MandantLabel.Name = "MandantLabel"
        MandantLabel.Size = New System.Drawing.Size(51, 13)
        MandantLabel.TabIndex = 59
        MandantLabel.Text = "mandant:"
        '
        'MandantTextBox
        '
        Me.MandantTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "mandant", True))
        Me.MandantTextBox.Location = New System.Drawing.Point(221, 845)
        Me.MandantTextBox.Name = "MandantTextBox"
        Me.MandantTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MandantTextBox.TabIndex = 60
        '
        'GeburtstagLabel
        '
        GeburtstagLabel.AutoSize = True
        GeburtstagLabel.Location = New System.Drawing.Point(112, 875)
        GeburtstagLabel.Name = "GeburtstagLabel"
        GeburtstagLabel.Size = New System.Drawing.Size(62, 13)
        GeburtstagLabel.TabIndex = 61
        GeburtstagLabel.Text = "Geburtstag:"
        '
        'GeburtstagDateTimePicker
        '
        Me.GeburtstagDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.OfAdressenBindingSource, "Geburtstag", True))
        Me.GeburtstagDateTimePicker.Location = New System.Drawing.Point(221, 871)
        Me.GeburtstagDateTimePicker.Name = "GeburtstagDateTimePicker"
        Me.GeburtstagDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.GeburtstagDateTimePicker.TabIndex = 62
        '
        'UIDLabel
        '
        UIDLabel.AutoSize = True
        UIDLabel.Location = New System.Drawing.Point(112, 900)
        UIDLabel.Name = "UIDLabel"
        UIDLabel.Size = New System.Drawing.Size(29, 13)
        UIDLabel.TabIndex = 63
        UIDLabel.Text = "UID:"
        '
        'UIDTextBox
        '
        Me.UIDTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "UID", True))
        Me.UIDTextBox.Location = New System.Drawing.Point(221, 897)
        Me.UIDTextBox.Name = "UIDTextBox"
        Me.UIDTextBox.Size = New System.Drawing.Size(200, 20)
        Me.UIDTextBox.TabIndex = 64
        '
        'SkypeAdresseLabel
        '
        SkypeAdresseLabel.AutoSize = True
        SkypeAdresseLabel.Location = New System.Drawing.Point(112, 926)
        SkypeAdresseLabel.Name = "SkypeAdresseLabel"
        SkypeAdresseLabel.Size = New System.Drawing.Size(81, 13)
        SkypeAdresseLabel.TabIndex = 65
        SkypeAdresseLabel.Text = "Skype Adresse:"
        '
        'SkypeAdresseTextBox
        '
        Me.SkypeAdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "SkypeAdresse", True))
        Me.SkypeAdresseTextBox.Location = New System.Drawing.Point(221, 923)
        Me.SkypeAdresseTextBox.Name = "SkypeAdresseTextBox"
        Me.SkypeAdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.SkypeAdresseTextBox.TabIndex = 66
        '
        'MessengerAdresseLabel
        '
        MessengerAdresseLabel.AutoSize = True
        MessengerAdresseLabel.Location = New System.Drawing.Point(112, 952)
        MessengerAdresseLabel.Name = "MessengerAdresseLabel"
        MessengerAdresseLabel.Size = New System.Drawing.Size(103, 13)
        MessengerAdresseLabel.TabIndex = 67
        MessengerAdresseLabel.Text = "Messenger Adresse:"
        '
        'MessengerAdresseTextBox
        '
        Me.MessengerAdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "MessengerAdresse", True))
        Me.MessengerAdresseTextBox.Location = New System.Drawing.Point(221, 949)
        Me.MessengerAdresseTextBox.Name = "MessengerAdresseTextBox"
        Me.MessengerAdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MessengerAdresseTextBox.TabIndex = 68
        '
        'EUNummerLabel
        '
        EUNummerLabel.AutoSize = True
        EUNummerLabel.Location = New System.Drawing.Point(112, 978)
        EUNummerLabel.Name = "EUNummerLabel"
        EUNummerLabel.Size = New System.Drawing.Size(64, 13)
        EUNummerLabel.TabIndex = 69
        EUNummerLabel.Text = "EUNummer:"
        '
        'EUNummerTextBox
        '
        Me.EUNummerTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "EUNummer", True))
        Me.EUNummerTextBox.Location = New System.Drawing.Point(221, 975)
        Me.EUNummerTextBox.Name = "EUNummerTextBox"
        Me.EUNummerTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EUNummerTextBox.TabIndex = 70
        '
        'EUNummer1Label
        '
        EUNummer1Label.AutoSize = True
        EUNummer1Label.Location = New System.Drawing.Point(112, 1004)
        EUNummer1Label.Name = "EUNummer1Label"
        EUNummer1Label.Size = New System.Drawing.Size(70, 13)
        EUNummer1Label.TabIndex = 71
        EUNummer1Label.Text = "EUNummer1:"
        '
        'EUNummer1TextBox
        '
        Me.EUNummer1TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "EUNummer1", True))
        Me.EUNummer1TextBox.Location = New System.Drawing.Point(221, 1001)
        Me.EUNummer1TextBox.Name = "EUNummer1TextBox"
        Me.EUNummer1TextBox.Size = New System.Drawing.Size(200, 20)
        Me.EUNummer1TextBox.TabIndex = 72
        '
        'EUNummer2Label
        '
        EUNummer2Label.AutoSize = True
        EUNummer2Label.Location = New System.Drawing.Point(112, 1030)
        EUNummer2Label.Name = "EUNummer2Label"
        EUNummer2Label.Size = New System.Drawing.Size(70, 13)
        EUNummer2Label.TabIndex = 73
        EUNummer2Label.Text = "EUNummer2:"
        '
        'EUNummer2TextBox
        '
        Me.EUNummer2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "EUNummer2", True))
        Me.EUNummer2TextBox.Location = New System.Drawing.Point(221, 1027)
        Me.EUNummer2TextBox.Name = "EUNummer2TextBox"
        Me.EUNummer2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.EUNummer2TextBox.TabIndex = 74
        '
        'BHReferenzLabel
        '
        BHReferenzLabel.AutoSize = True
        BHReferenzLabel.Location = New System.Drawing.Point(112, 1056)
        BHReferenzLabel.Name = "BHReferenzLabel"
        BHReferenzLabel.Size = New System.Drawing.Size(68, 13)
        BHReferenzLabel.TabIndex = 75
        BHReferenzLabel.Text = "BHReferenz:"
        '
        'BHReferenzTextBox
        '
        Me.BHReferenzTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfAdressenBindingSource, "BHReferenz", True))
        Me.BHReferenzTextBox.Location = New System.Drawing.Point(221, 1053)
        Me.BHReferenzTextBox.Name = "BHReferenzTextBox"
        Me.BHReferenzTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BHReferenzTextBox.TabIndex = 76
        '
        'FormKunden
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.AutoScroll = True
        Me.ClientSize = New System.Drawing.Size(458, 1028)
        Me.Controls.Add(IDNRLabel)
        Me.Controls.Add(Me.IDNRTextBox)
        Me.Controls.Add(StatusLabel)
        Me.Controls.Add(Me.StatusComboBox)
        Me.Controls.Add(BrancheLabel)
        Me.Controls.Add(Me.BrancheComboBox)
        Me.Controls.Add(BriefanredeLabel)
        Me.Controls.Add(Me.BriefanredeTextBox)
        Me.Controls.Add(TitelLabel)
        Me.Controls.Add(Me.TitelTextBox)
        Me.Controls.Add(AnredeLabel)
        Me.Controls.Add(Me.AnredeTextBox)
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
        Me.Controls.Add(Me.LandTextBox)
        Me.Controls.Add(PLZLabel)
        Me.Controls.Add(Me.PLZComboBox)
        Me.Controls.Add(OrtLabel)
        Me.Controls.Add(Me.OrtTextBox)
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
        Me.Controls.Add(ExportLabel)
        Me.Controls.Add(Me.ExportCheckBox)
        Me.Controls.Add(AngelegtAnLabel)
        Me.Controls.Add(Me.AngelegtAnDateTimePicker)
        Me.Controls.Add(MAAusenLabel)
        Me.Controls.Add(Me.MAAusenTextBox)
        Me.Controls.Add(MAInnenLabel)
        Me.Controls.Add(Me.MAInnenTextBox)
        Me.Controls.Add(AbbuchungLabel)
        Me.Controls.Add(Me.AbbuchungCheckBox)
        Me.Controls.Add(HasMenuLabel)
        Me.Controls.Add(Me.HasMenuCheckBox)
        Me.Controls.Add(PasswortLabel)
        Me.Controls.Add(Me.PasswortTextBox)
        Me.Controls.Add(NextIDNRLabel)
        Me.Controls.Add(Me.NextIDNRTextBox)
        Me.Controls.Add(MandantLabel)
        Me.Controls.Add(Me.MandantTextBox)
        Me.Controls.Add(GeburtstagLabel)
        Me.Controls.Add(Me.GeburtstagDateTimePicker)
        Me.Controls.Add(UIDLabel)
        Me.Controls.Add(Me.UIDTextBox)
        Me.Controls.Add(SkypeAdresseLabel)
        Me.Controls.Add(Me.SkypeAdresseTextBox)
        Me.Controls.Add(MessengerAdresseLabel)
        Me.Controls.Add(Me.MessengerAdresseTextBox)
        Me.Controls.Add(EUNummerLabel)
        Me.Controls.Add(Me.EUNummerTextBox)
        Me.Controls.Add(EUNummer1Label)
        Me.Controls.Add(Me.EUNummer1TextBox)
        Me.Controls.Add(EUNummer2Label)
        Me.Controls.Add(Me.EUNummer2TextBox)
        Me.Controls.Add(BHReferenzLabel)
        Me.Controls.Add(Me.BHReferenzTextBox)
        Me.Controls.Add(Me.ParentBindingNavigator)
        Me.Name = "FormKunden"
        Me.Text = "FormKunden"
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ParentBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ParentBindingNavigator.ResumeLayout(False)
        Me.ParentBindingNavigator.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents OfAdressenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfadressenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents IDNRTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StatusComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents BrancheComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents BriefanredeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TitelTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AnredeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents VornameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Name1TextBox As System.Windows.Forms.TextBox
    Friend WithEvents FirmaTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LandTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PLZComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents OrtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TelTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Tel2TextBox As System.Windows.Forms.TextBox
    Friend WithEvents FaxTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Fax2TextBox As System.Windows.Forms.TextBox
    Friend WithEvents MobilTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EmailTextBox As System.Windows.Forms.TextBox
    Friend WithEvents WebTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ExportCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AngelegtAnDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents MAAusenTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MAInnenTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AbbuchungCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents HasMenuCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents PasswortTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NextIDNRTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MandantTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GeburtstagDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents UIDTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SkypeAdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MessengerAdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EUNummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EUNummer1TextBox As System.Windows.Forms.TextBox
    Friend WithEvents EUNummer2TextBox As System.Windows.Forms.TextBox
    Friend WithEvents BHReferenzTextBox As System.Windows.Forms.TextBox
End Class
