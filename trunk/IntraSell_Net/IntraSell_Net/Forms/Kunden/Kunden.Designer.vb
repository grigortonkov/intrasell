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
        Dim StatusLabel As System.Windows.Forms.Label
        Dim MAAusenLabel As System.Windows.Forms.Label
        Dim MAInnenLabel As System.Windows.Forms.Label
        Dim PasswortLabel As System.Windows.Forms.Label
        Dim NextIDNRLabel As System.Windows.Forms.Label
        Dim MandantLabel As System.Windows.Forms.Label
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
        Me.MAInnenMitarbeiterControl = New IntraSell_Net.MitarbeiterControl()
        Me.MAAusenMitarbeiterControl = New IntraSell_Net.MitarbeiterControl()
        Me.MandantTextBox = New System.Windows.Forms.TextBox()
        Me.NextIDNRComboBox = New System.Windows.Forms.ComboBox()
        Me.HasMenuCheckBox = New System.Windows.Forms.CheckBox()
        Me.AbbuchungCheckBox = New System.Windows.Forms.CheckBox()
        Me.ExportCheckBox = New System.Windows.Forms.CheckBox()
        Me.BHReferenzTextBox = New System.Windows.Forms.TextBox()
        Me.EUNummer2TextBox = New System.Windows.Forms.TextBox()
        Me.EUNummer1TextBox = New System.Windows.Forms.TextBox()
        Me.EUNummerTextBox = New System.Windows.Forms.TextBox()
        Me.MessengerAdresseTextBox = New System.Windows.Forms.TextBox()
        Me.SkypeAdresseTextBox = New System.Windows.Forms.TextBox()
        Me.UIDTextBox = New System.Windows.Forms.TextBox()
        Me.TabPage4 = New System.Windows.Forms.TabPage()
        Me.AdresseWeitereButton = New System.Windows.Forms.Button()
        Me.Ofadressen_weitereDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Typ = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn34 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn14 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn15 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn16 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.GrlandBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsPLZ = New IntraSell_Net.dsPLZ()
        Me.DataGridViewTextBoxColumn19 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.GrLandPlzBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataGridViewTextBoxColumn20 = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.DataGridViewTextBoxColumn21 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn22 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn23 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn24 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn25 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn26 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn28 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn29 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn30 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn31 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn32 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn33 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn27 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Ofadressen_weitereBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.AdressenProfil1 = New IntraSell_Net.AdressenProfil()
        Me.Ofadressen_profilBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BuchvorgangtypBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsVorgaenge = New IntraSell_Net.dsVorgaenge()
        Me.Ofadressen_settingsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfAdressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        Me.PreislistenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.PreislistenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        Me.Ofadressen_settingsTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_settingsTableAdapter()
        Me.KundengruppenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.KundengruppenTableAdapter()
        Me.GrLandPlzTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter()
        Me.TableAdapterManager1 = New IntraSell_Net.dsPLZTableAdapters.TableAdapterManager()
        Me.StatusComboBox = New System.Windows.Forms.ComboBox()
        Me.GrbranchenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsBranchen = New IntraSell_Net.dsBranchen()
        Me.Ofadressen_zahlungsmethodenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_zahlungsmethodenTableAdapter()
        Me.Ofadressen_zahlungsbedingungenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_zahlungsbedingungenTableAdapter()
        Me.Ofadressen_transportmethodenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_transportmethodenTableAdapter()
        Me.Ofadressen_weitereTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter()
        Me.GrlandTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter()
        Me.GrzahlungsmethodeTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grzahlungsmethodeTableAdapter()
        Me.GrzahlungsbedingungTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grzahlungsbedingungTableAdapter()
        Me.GrtransportmethodeTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grtransportmethodeTableAdapter()
        Me.BuchvorgangtypTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangtypTableAdapter()
        Me.GrbranchenTableAdapter = New IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.NeuerVorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NeuerVorgangToolStripMenuItem1 = New System.Windows.Forms.ToolStripMenuItem()
        Me.AlteVorgängeToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AdressenDetailControl1 = New IntraSell_Net.AdressenDetailControl()
        StatusLabel = New System.Windows.Forms.Label()
        MAAusenLabel = New System.Windows.Forms.Label()
        MAInnenLabel = New System.Windows.Forms.Label()
        PasswortLabel = New System.Windows.Forms.Label()
        NextIDNRLabel = New System.Windows.Forms.Label()
        MandantLabel = New System.Windows.Forms.Label()
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
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        Me.AdressenProfil1.SuspendLayout()
        CType(Me.Ofadressen_profilBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangtypBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_settingsBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(650, 44)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 9
        StatusLabel.Text = "Status:"
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
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.TabControl1.Location = New System.Drawing.Point(0, 345)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(953, 318)
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
        Me.TabPage1.Size = New System.Drawing.Size(945, 292)
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
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(3, 87)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 2
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.18519!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 89.81481!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(939, 202)
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
        Me.Ofadressen_zahlungsmethodenDataGridView.Size = New System.Drawing.Size(307, 176)
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
        Me.Ofadressen_zahlungsbedingungenDataGridView.Location = New System.Drawing.Point(316, 23)
        Me.Ofadressen_zahlungsbedingungenDataGridView.Name = "Ofadressen_zahlungsbedingungenDataGridView"
        Me.Ofadressen_zahlungsbedingungenDataGridView.Size = New System.Drawing.Size(307, 176)
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
        Me.Label2.Location = New System.Drawing.Point(316, 0)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(116, 13)
        Me.Label2.TabIndex = 11
        Me.Label2.Text = "Zahlungsbedingungen:"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(629, 0)
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
        Me.Ofadressen_transportmethodenDataGridView.Location = New System.Drawing.Point(629, 23)
        Me.Ofadressen_transportmethodenDataGridView.Name = "Ofadressen_transportmethodenDataGridView"
        Me.Ofadressen_transportmethodenDataGridView.Size = New System.Drawing.Size(307, 176)
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
        Me.cbPreisliste.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.FKofAdressenofadressensettingsBindingSource, "Preisliste", True))
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
        Me.TabPage2.Controls.Add(Me.MAInnenMitarbeiterControl)
        Me.TabPage2.Controls.Add(Me.MAAusenMitarbeiterControl)
        Me.TabPage2.Controls.Add(Me.MandantTextBox)
        Me.TabPage2.Controls.Add(MandantLabel)
        Me.TabPage2.Controls.Add(Me.NextIDNRComboBox)
        Me.TabPage2.Controls.Add(NextIDNRLabel)
        Me.TabPage2.Controls.Add(Me.HasMenuCheckBox)
        Me.TabPage2.Controls.Add(Me.AbbuchungCheckBox)
        Me.TabPage2.Controls.Add(MAInnenLabel)
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
        Me.TabPage2.Size = New System.Drawing.Size(945, 292)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Weitere Stammdaten"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'MAInnenMitarbeiterControl
        '
        Me.MAInnenMitarbeiterControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.ofAdressenBindingSource, "MAInnen", True))
        Me.MAInnenMitarbeiterControl.IDNR = 0
        Me.MAInnenMitarbeiterControl.Location = New System.Drawing.Point(115, 78)
        Me.MAInnenMitarbeiterControl.Name = "MAInnenMitarbeiterControl"
        Me.MAInnenMitarbeiterControl.Size = New System.Drawing.Size(155, 25)
        Me.MAInnenMitarbeiterControl.TabIndex = 56
        '
        'MAAusenMitarbeiterControl
        '
        Me.MAAusenMitarbeiterControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.ofAdressenBindingSource, "MAAusen", True))
        Me.MAAusenMitarbeiterControl.IDNR = 0
        Me.MAAusenMitarbeiterControl.Location = New System.Drawing.Point(115, 50)
        Me.MAAusenMitarbeiterControl.Name = "MAAusenMitarbeiterControl"
        Me.MAAusenMitarbeiterControl.Size = New System.Drawing.Size(155, 25)
        Me.MAAusenMitarbeiterControl.TabIndex = 54
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
        Me.TabPage4.Controls.Add(Me.AdresseWeitereButton)
        Me.TabPage4.Controls.Add(Me.Ofadressen_weitereDataGridView)
        Me.TabPage4.Location = New System.Drawing.Point(4, 22)
        Me.TabPage4.Name = "TabPage4"
        Me.TabPage4.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage4.Size = New System.Drawing.Size(945, 292)
        Me.TabPage4.TabIndex = 3
        Me.TabPage4.Text = "Weitere Adressdaten"
        Me.TabPage4.UseVisualStyleBackColor = True
        '
        'AdresseWeitereButton
        '
        Me.AdresseWeitereButton.Location = New System.Drawing.Point(3, 3)
        Me.AdresseWeitereButton.Name = "AdresseWeitereButton"
        Me.AdresseWeitereButton.Size = New System.Drawing.Size(109, 23)
        Me.AdresseWeitereButton.TabIndex = 72
        Me.AdresseWeitereButton.Text = "neue Adresse"
        Me.AdresseWeitereButton.UseVisualStyleBackColor = True
        '
        'Ofadressen_weitereDataGridView
        '
        Me.Ofadressen_weitereDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_weitereDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_weitereDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn12, Me.Typ, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn34, Me.DataGridViewTextBoxColumn9, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn19, Me.DataGridViewTextBoxColumn20, Me.DataGridViewTextBoxColumn21, Me.DataGridViewTextBoxColumn22, Me.DataGridViewTextBoxColumn23, Me.DataGridViewTextBoxColumn24, Me.DataGridViewTextBoxColumn25, Me.DataGridViewTextBoxColumn26, Me.DataGridViewTextBoxColumn28, Me.DataGridViewTextBoxColumn29, Me.DataGridViewTextBoxColumn30, Me.DataGridViewTextBoxColumn31, Me.DataGridViewTextBoxColumn32, Me.DataGridViewTextBoxColumn33, Me.DataGridViewTextBoxColumn27})
        Me.Ofadressen_weitereDataGridView.DataSource = Me.Ofadressen_weitereBindingSource
        Me.Ofadressen_weitereDataGridView.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.Ofadressen_weitereDataGridView.Location = New System.Drawing.Point(3, 23)
        Me.Ofadressen_weitereDataGridView.Name = "Ofadressen_weitereDataGridView"
        Me.Ofadressen_weitereDataGridView.Size = New System.Drawing.Size(922, 300)
        Me.Ofadressen_weitereDataGridView.TabIndex = 0
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn8.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        Me.DataGridViewTextBoxColumn8.Visible = False
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "IDNR"
        Me.DataGridViewTextBoxColumn12.HeaderText = "IDNR"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        Me.DataGridViewTextBoxColumn12.Visible = False
        '
        'Typ
        '
        Me.Typ.DataPropertyName = "Typ"
        Me.Typ.HeaderText = "Zweck"
        Me.Typ.Name = "Typ"
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "Branche"
        Me.DataGridViewTextBoxColumn11.HeaderText = "Branche"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "Firma"
        Me.DataGridViewTextBoxColumn17.HeaderText = "Firma"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        '
        'DataGridViewTextBoxColumn34
        '
        Me.DataGridViewTextBoxColumn34.DataPropertyName = "Titel"
        Me.DataGridViewTextBoxColumn34.HeaderText = "Titel"
        Me.DataGridViewTextBoxColumn34.Name = "DataGridViewTextBoxColumn34"
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "Anrede"
        Me.DataGridViewTextBoxColumn9.HeaderText = "Anrede"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
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
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "Adresse"
        Me.DataGridViewTextBoxColumn18.HeaderText = "Adresse"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "Land"
        Me.DataGridViewTextBoxColumn13.DataSource = Me.GrlandBindingSource
        Me.DataGridViewTextBoxColumn13.DisplayMember = "Name"
        Me.DataGridViewTextBoxColumn13.HeaderText = "Land"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        Me.DataGridViewTextBoxColumn13.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn13.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn13.ValueMember = "IdNr"
        '
        'GrlandBindingSource
        '
        Me.GrlandBindingSource.DataMember = "grland"
        Me.GrlandBindingSource.DataSource = Me.DsPLZ
        '
        'DsPLZ
        '
        Me.DsPLZ.DataSetName = "dsPLZ"
        Me.DsPLZ.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'DataGridViewTextBoxColumn19
        '
        Me.DataGridViewTextBoxColumn19.DataPropertyName = "PLZ"
        Me.DataGridViewTextBoxColumn19.DataSource = Me.GrLandPlzBindingSource
        Me.DataGridViewTextBoxColumn19.DisplayMember = "PLZ"
        Me.DataGridViewTextBoxColumn19.HeaderText = "PLZ"
        Me.DataGridViewTextBoxColumn19.Name = "DataGridViewTextBoxColumn19"
        Me.DataGridViewTextBoxColumn19.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn19.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn19.ValueMember = "IdNr"
        '
        'GrLandPlzBindingSource
        '
        Me.GrLandPlzBindingSource.DataMember = "grLandPlz"
        Me.GrLandPlzBindingSource.DataSource = Me.DsPLZ
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "Ort"
        Me.DataGridViewTextBoxColumn20.DataSource = Me.GrLandPlzBindingSource
        Me.DataGridViewTextBoxColumn20.DisplayMember = "Ort"
        Me.DataGridViewTextBoxColumn20.HeaderText = "Ort"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        Me.DataGridViewTextBoxColumn20.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.DataGridViewTextBoxColumn20.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.DataGridViewTextBoxColumn20.ValueMember = "Ort"
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
        'DataGridViewTextBoxColumn27
        '
        Me.DataGridViewTextBoxColumn27.DataPropertyName = "AngelegtAn"
        Me.DataGridViewTextBoxColumn27.HeaderText = "AngelegtAn"
        Me.DataGridViewTextBoxColumn27.Name = "DataGridViewTextBoxColumn27"
        '
        'Ofadressen_weitereBindingSource
        '
        Me.Ofadressen_weitereBindingSource.DataMember = "FK_ofAdressen_ofadressen-weitere"
        Me.Ofadressen_weitereBindingSource.DataSource = Me.ofAdressenBindingSource
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.AdressenProfil1)
        Me.TabPage3.Location = New System.Drawing.Point(4, 22)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage3.Size = New System.Drawing.Size(945, 292)
        Me.TabPage3.TabIndex = 4
        Me.TabPage3.Text = "Profil"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'AdressenProfil1
        '
        Me.AdressenProfil1.Controls.Add(Me.Ofadressen_profilBindingNavigator)
        Me.AdressenProfil1.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.ofAdressenBindingSource, "IDNR", True))
        Me.AdressenProfil1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.AdressenProfil1.IDNR = 0
        Me.AdressenProfil1.Location = New System.Drawing.Point(3, 3)
        Me.AdressenProfil1.Name = "AdressenProfil1"
        Me.AdressenProfil1.Size = New System.Drawing.Size(939, 286)
        Me.AdressenProfil1.TabIndex = 47
        '
        'Ofadressen_profilBindingNavigator
        '
        Me.Ofadressen_profilBindingNavigator.AddNewItem = Nothing
        Me.Ofadressen_profilBindingNavigator.CountItem = Nothing
        Me.Ofadressen_profilBindingNavigator.DeleteItem = Nothing
        Me.Ofadressen_profilBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Ofadressen_profilBindingNavigator.MoveFirstItem = Nothing
        Me.Ofadressen_profilBindingNavigator.MoveLastItem = Nothing
        Me.Ofadressen_profilBindingNavigator.MoveNextItem = Nothing
        Me.Ofadressen_profilBindingNavigator.MovePreviousItem = Nothing
        Me.Ofadressen_profilBindingNavigator.Name = "Ofadressen_profilBindingNavigator"
        Me.Ofadressen_profilBindingNavigator.PositionItem = Nothing
        Me.Ofadressen_profilBindingNavigator.Size = New System.Drawing.Size(1101, 25)
        Me.Ofadressen_profilBindingNavigator.TabIndex = 0
        Me.Ofadressen_profilBindingNavigator.Text = "BindingNavigator1"
        Me.Ofadressen_profilBindingNavigator.Visible = False
        '
        'BuchvorgangtypBindingSource
        '
        Me.BuchvorgangtypBindingSource.DataMember = "buchvorgangtyp"
        Me.BuchvorgangtypBindingSource.DataSource = Me.DsVorgaenge
        '
        'DsVorgaenge
        '
        Me.DsVorgaenge.DataSetName = "dsVorgaenge"
        Me.DsVorgaenge.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
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
        Me.TableAdapterManager.ofadressen_kundengruppenTableAdapter = Nothing
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
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(718, 41)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 1
        '
        'GrbranchenBindingSource
        '
        Me.GrbranchenBindingSource.DataMember = "grbranchen"
        Me.GrbranchenBindingSource.DataSource = Me.DsBranchen
        '
        'DsBranchen
        '
        Me.DsBranchen.DataSetName = "dsBranchen"
        Me.DsBranchen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
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
        'GrlandTableAdapter
        '
        Me.GrlandTableAdapter.ClearBeforeFill = True
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
        'BuchvorgangtypTableAdapter
        '
        Me.BuchvorgangtypTableAdapter.ClearBeforeFill = True
        '
        'GrbranchenTableAdapter
        '
        Me.GrbranchenTableAdapter.ClearBeforeFill = True
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Dock = System.Windows.Forms.DockStyle.None
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NeuerVorgangToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(718, 65)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(67, 24)
        Me.MenuStrip1.TabIndex = 71
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'NeuerVorgangToolStripMenuItem
        '
        Me.NeuerVorgangToolStripMenuItem.BackColor = System.Drawing.Color.CornflowerBlue
        Me.NeuerVorgangToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NeuerVorgangToolStripMenuItem1, Me.AlteVorgängeToolStripMenuItem})
        Me.NeuerVorgangToolStripMenuItem.Name = "NeuerVorgangToolStripMenuItem"
        Me.NeuerVorgangToolStripMenuItem.Size = New System.Drawing.Size(59, 20)
        Me.NeuerVorgangToolStripMenuItem.Text = "&Vorgang"
        '
        'NeuerVorgangToolStripMenuItem1
        '
        Me.NeuerVorgangToolStripMenuItem1.Name = "NeuerVorgangToolStripMenuItem1"
        Me.NeuerVorgangToolStripMenuItem1.Size = New System.Drawing.Size(146, 22)
        Me.NeuerVorgangToolStripMenuItem1.Text = "&Neuer Vorgang"
        '
        'AlteVorgängeToolStripMenuItem
        '
        Me.AlteVorgängeToolStripMenuItem.Name = "AlteVorgängeToolStripMenuItem"
        Me.AlteVorgängeToolStripMenuItem.Size = New System.Drawing.Size(146, 22)
        Me.AlteVorgängeToolStripMenuItem.Text = "&Alte Vorgänge"
        '
        'AdressenDetailControl1
        '
        Me.AdressenDetailControl1.Adresse = ""
        Me.AdressenDetailControl1.Anrede = Nothing
        Me.AdressenDetailControl1.Branche = Nothing
        Me.AdressenDetailControl1.Briefanrede = Nothing
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Adresse", Me.ofAdressenBindingSource, "Adresse", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Anrede", Me.ofAdressenBindingSource, "Anrede", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Branche", Me.ofAdressenBindingSource, "Branche", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Briefanrede", Me.ofAdressenBindingSource, "Briefanrede", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Email", Me.ofAdressenBindingSource, "Email", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Fax", Me.ofAdressenBindingSource, "Fax", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Fax2", Me.ofAdressenBindingSource, "Fax2", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Firma", Me.ofAdressenBindingSource, "Firma", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Geburtstag", Me.ofAdressenBindingSource, "Geburtstag", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.ofAdressenBindingSource, "IDNR", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Land", Me.ofAdressenBindingSource, "Land", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Mobil", Me.ofAdressenBindingSource, "Mobil", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Name1", Me.ofAdressenBindingSource, "Name1", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("NameFamilie", Me.ofAdressenBindingSource, "Name", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Ort", Me.ofAdressenBindingSource, "Ort", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("PLZ", Me.ofAdressenBindingSource, "PLZ", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Tel", Me.ofAdressenBindingSource, "Tel", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Tel2", Me.ofAdressenBindingSource, "Tel2", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Titel", Me.ofAdressenBindingSource, "Titel", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Vorname", Me.ofAdressenBindingSource, "Vorname", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Web", Me.ofAdressenBindingSource, "Web", True))
        Me.AdressenDetailControl1.Email = ""
        Me.AdressenDetailControl1.Fax = ""
        Me.AdressenDetailControl1.Fax2 = ""
        Me.AdressenDetailControl1.Firma = ""
        Me.AdressenDetailControl1.Geburtstag = New Date(2013, 3, 22, 21, 58, 7, 234)
        Me.AdressenDetailControl1.IDNR = ""
        Me.AdressenDetailControl1.Land = Nothing
        Me.AdressenDetailControl1.Location = New System.Drawing.Point(4, 28)
        Me.AdressenDetailControl1.Mobil = ""
        Me.AdressenDetailControl1.Name = "AdressenDetailControl1"
        Me.AdressenDetailControl1.Name1 = ""
        Me.AdressenDetailControl1.NameFamilie = ""
        Me.AdressenDetailControl1.Ort = ""
        Me.AdressenDetailControl1.PLZ = Nothing
        Me.AdressenDetailControl1.Size = New System.Drawing.Size(637, 316)
        Me.AdressenDetailControl1.TabIndex = 0
        Me.AdressenDetailControl1.Tel = ""
        Me.AdressenDetailControl1.Tel2 = ""
        Me.AdressenDetailControl1.Titel = Nothing
        Me.AdressenDetailControl1.Vorname = ""
        Me.AdressenDetailControl1.Web = ""
        '
        'Kunden
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(953, 663)
        Me.Controls.Add(Me.AdressenDetailControl1)
        Me.Controls.Add(StatusLabel)
        Me.Controls.Add(Me.StatusComboBox)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Kunden"
        Me.Text = "Kunden"
        Me.Controls.SetChildIndex(Me.MenuStrip1, 0)
        Me.Controls.SetChildIndex(Me.TabControl1, 0)
        Me.Controls.SetChildIndex(Me.StatusComboBox, 0)
        Me.Controls.SetChildIndex(StatusLabel, 0)
        Me.Controls.SetChildIndex(Me.AdressenDetailControl1, 0)
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
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.AdressenProfil1.ResumeLayout(False)
        Me.AdressenProfil1.PerformLayout()
        CType(Me.Ofadressen_profilBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangtypBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_settingsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).EndInit()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
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
    Friend WithEvents StatusComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents ExportCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AbbuchungCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents HasMenuCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents PasswortTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NextIDNRComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents MandantTextBox As System.Windows.Forms.TextBox
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
    Friend WithEvents GrlandTableAdapter As IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter
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
    Friend WithEvents DsVorgaenge As IntraSell_Net.dsVorgaenge
    Friend WithEvents BuchvorgangtypBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangtypTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangtypTableAdapter
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents AdressenProfil1 As IntraSell_Net.AdressenProfil
    Friend WithEvents Ofadressen_profilBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents DsBranchen As IntraSell_Net.dsBranchen
    Friend WithEvents GrbranchenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrbranchenTableAdapter As IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents NeuerVorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AlteVorgängeToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NeuerVorgangToolStripMenuItem1 As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents MAInnenMitarbeiterControl As IntraSell_Net.MitarbeiterControl
    Friend WithEvents MAAusenMitarbeiterControl As IntraSell_Net.MitarbeiterControl
    Friend WithEvents DataGridViewTextBoxColumn10 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents AdresseWeitereButton As System.Windows.Forms.Button
    Friend WithEvents DataGridViewTextBoxColumn8 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Typ As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn17 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn34 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn19 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn20 As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn21 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn22 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn23 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn24 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn25 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn26 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn28 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn29 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn30 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn31 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn32 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn33 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn27 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AdressenDetailControl1 As IntraSell_Net.AdressenDetailControl
End Class
