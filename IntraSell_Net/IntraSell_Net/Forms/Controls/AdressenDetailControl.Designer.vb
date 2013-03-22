<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdressenDetailControl
    Inherits System.Windows.Forms.UserControl

    'UserControl overrides dispose to clean up the component list.
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
        Dim GeburtstagLabel As System.Windows.Forms.Label
        Me.DataSetKunden = New IntraSell_Net.dsAdressen()
        Me.ofAdressenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsPLZ = New IntraSell_Net.dsPLZ()
        Me.GrLandPlzTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter()
        Me.GrLandPlzBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.ButtonPLZSelect = New System.Windows.Forms.Button()
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
        Me.OfAdressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        Me.GrlandTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter()
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
        GeburtstagLabel = New System.Windows.Forms.Label()
        CType(Me.DataSetKunden, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.ofAdressenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'IDNRLabel
        '
        IDNRLabel.AutoSize = True
        IDNRLabel.Location = New System.Drawing.Point(14, 14)
        IDNRLabel.Name = "IDNRLabel"
        IDNRLabel.Size = New System.Drawing.Size(37, 13)
        IDNRLabel.TabIndex = 76
        IDNRLabel.Text = "IDNR:"
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(14, 40)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 79
        StatusLabel.Text = "Status:"
        '
        'BrancheLabel
        '
        BrancheLabel.AutoSize = True
        BrancheLabel.Location = New System.Drawing.Point(14, 67)
        BrancheLabel.Name = "BrancheLabel"
        BrancheLabel.Size = New System.Drawing.Size(50, 13)
        BrancheLabel.TabIndex = 81
        BrancheLabel.Text = "Branche:"
        '
        'BriefanredeLabel
        '
        BriefanredeLabel.AutoSize = True
        BriefanredeLabel.Location = New System.Drawing.Point(14, 120)
        BriefanredeLabel.Name = "BriefanredeLabel"
        BriefanredeLabel.Size = New System.Drawing.Size(64, 13)
        BriefanredeLabel.TabIndex = 84
        BriefanredeLabel.Text = "Briefanrede:"
        '
        'TitelLabel
        '
        TitelLabel.AutoSize = True
        TitelLabel.Location = New System.Drawing.Point(14, 174)
        TitelLabel.Name = "TitelLabel"
        TitelLabel.Size = New System.Drawing.Size(30, 13)
        TitelLabel.TabIndex = 88
        TitelLabel.Text = "Titel:"
        '
        'AnredeLabel
        '
        AnredeLabel.AutoSize = True
        AnredeLabel.Location = New System.Drawing.Point(14, 146)
        AnredeLabel.Name = "AnredeLabel"
        AnredeLabel.Size = New System.Drawing.Size(44, 13)
        AnredeLabel.TabIndex = 90
        AnredeLabel.Text = "Anrede:"
        '
        'NameLabel
        '
        NameLabel.AutoSize = True
        NameLabel.Location = New System.Drawing.Point(14, 201)
        NameLabel.Name = "NameLabel"
        NameLabel.Size = New System.Drawing.Size(38, 13)
        NameLabel.TabIndex = 94
        NameLabel.Text = "Name:"
        '
        'VornameLabel
        '
        VornameLabel.AutoSize = True
        VornameLabel.Location = New System.Drawing.Point(14, 227)
        VornameLabel.Name = "VornameLabel"
        VornameLabel.Size = New System.Drawing.Size(52, 13)
        VornameLabel.TabIndex = 96
        VornameLabel.Text = "Vorname:"
        '
        'Name1Label
        '
        Name1Label.AutoSize = True
        Name1Label.Location = New System.Drawing.Point(14, 253)
        Name1Label.Name = "Name1Label"
        Name1Label.Size = New System.Drawing.Size(44, 13)
        Name1Label.TabIndex = 99
        Name1Label.Text = "Name1:"
        '
        'FirmaLabel
        '
        FirmaLabel.AutoSize = True
        FirmaLabel.Location = New System.Drawing.Point(14, 94)
        FirmaLabel.Name = "FirmaLabel"
        FirmaLabel.Size = New System.Drawing.Size(35, 13)
        FirmaLabel.TabIndex = 100
        FirmaLabel.Text = "Firma:"
        '
        'AdresseLabel
        '
        AdresseLabel.AutoSize = True
        AdresseLabel.Location = New System.Drawing.Point(324, 67)
        AdresseLabel.Name = "AdresseLabel"
        AdresseLabel.Size = New System.Drawing.Size(45, 13)
        AdresseLabel.TabIndex = 101
        AdresseLabel.Text = "Strasse:"
        '
        'LandLabel
        '
        LandLabel.AutoSize = True
        LandLabel.Location = New System.Drawing.Point(324, 14)
        LandLabel.Name = "LandLabel"
        LandLabel.Size = New System.Drawing.Size(34, 13)
        LandLabel.TabIndex = 102
        LandLabel.Text = "Land:"
        '
        'PLZLabel
        '
        PLZLabel.AutoSize = True
        PLZLabel.Location = New System.Drawing.Point(324, 45)
        PLZLabel.Name = "PLZLabel"
        PLZLabel.Size = New System.Drawing.Size(30, 13)
        PLZLabel.TabIndex = 103
        PLZLabel.Text = "PLZ:"
        '
        'OrtLabel
        '
        OrtLabel.AutoSize = True
        OrtLabel.Location = New System.Drawing.Point(440, 45)
        OrtLabel.Name = "OrtLabel"
        OrtLabel.Size = New System.Drawing.Size(24, 13)
        OrtLabel.TabIndex = 104
        OrtLabel.Text = "Ort:"
        '
        'TelLabel
        '
        TelLabel.AutoSize = True
        TelLabel.Location = New System.Drawing.Point(324, 120)
        TelLabel.Name = "TelLabel"
        TelLabel.Size = New System.Drawing.Size(25, 13)
        TelLabel.TabIndex = 105
        TelLabel.Text = "Tel:"
        '
        'Tel2Label
        '
        Tel2Label.AutoSize = True
        Tel2Label.Location = New System.Drawing.Point(324, 146)
        Tel2Label.Name = "Tel2Label"
        Tel2Label.Size = New System.Drawing.Size(31, 13)
        Tel2Label.TabIndex = 106
        Tel2Label.Text = "Tel2:"
        '
        'FaxLabel
        '
        FaxLabel.AutoSize = True
        FaxLabel.Location = New System.Drawing.Point(324, 172)
        FaxLabel.Name = "FaxLabel"
        FaxLabel.Size = New System.Drawing.Size(27, 13)
        FaxLabel.TabIndex = 107
        FaxLabel.Text = "Fax:"
        '
        'Fax2Label
        '
        Fax2Label.AutoSize = True
        Fax2Label.Location = New System.Drawing.Point(324, 198)
        Fax2Label.Name = "Fax2Label"
        Fax2Label.Size = New System.Drawing.Size(33, 13)
        Fax2Label.TabIndex = 108
        Fax2Label.Text = "Fax2:"
        '
        'MobilLabel
        '
        MobilLabel.AutoSize = True
        MobilLabel.Location = New System.Drawing.Point(324, 224)
        MobilLabel.Name = "MobilLabel"
        MobilLabel.Size = New System.Drawing.Size(35, 13)
        MobilLabel.TabIndex = 109
        MobilLabel.Text = "Mobil:"
        '
        'EmailLabel
        '
        EmailLabel.AutoSize = True
        EmailLabel.Location = New System.Drawing.Point(324, 250)
        EmailLabel.Name = "EmailLabel"
        EmailLabel.Size = New System.Drawing.Size(35, 13)
        EmailLabel.TabIndex = 110
        EmailLabel.Text = "Email:"
        '
        'WebLabel
        '
        WebLabel.AutoSize = True
        WebLabel.Location = New System.Drawing.Point(324, 276)
        WebLabel.Name = "WebLabel"
        WebLabel.Size = New System.Drawing.Size(33, 13)
        WebLabel.TabIndex = 111
        WebLabel.Text = "Web:"
        '
        'GeburtstagLabel
        '
        GeburtstagLabel.AutoSize = True
        GeburtstagLabel.Location = New System.Drawing.Point(14, 280)
        GeburtstagLabel.Name = "GeburtstagLabel"
        GeburtstagLabel.Size = New System.Drawing.Size(62, 13)
        GeburtstagLabel.TabIndex = 112
        GeburtstagLabel.Text = "Geburtstag:"
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
        'DsPLZ
        '
        Me.DsPLZ.DataSetName = "dsPLZ"
        Me.DsPLZ.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrLandPlzTableAdapter
        '
        Me.GrLandPlzTableAdapter.ClearBeforeFill = True
        '
        'GrLandPlzBindingSource
        '
        Me.GrLandPlzBindingSource.DataMember = "grLandPlz"
        Me.GrLandPlzBindingSource.DataSource = Me.DsPLZ
        '
        'ButtonPLZSelect
        '
        Me.ButtonPLZSelect.Location = New System.Drawing.Point(584, 39)
        Me.ButtonPLZSelect.Name = "ButtonPLZSelect"
        Me.ButtonPLZSelect.Size = New System.Drawing.Size(33, 23)
        Me.ButtonPLZSelect.TabIndex = 86
        Me.ButtonPLZSelect.Text = "..."
        Me.ButtonPLZSelect.UseVisualStyleBackColor = True
        '
        'IDNRTextBox
        '
        Me.IDNRTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "IDNR", True))
        Me.IDNRTextBox.Location = New System.Drawing.Point(82, 11)
        Me.IDNRTextBox.Name = "IDNRTextBox"
        Me.IDNRTextBox.Size = New System.Drawing.Size(200, 20)
        Me.IDNRTextBox.TabIndex = 68
        '
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(82, 37)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 69
        '
        'BrancheComboBox
        '
        Me.BrancheComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.ofAdressenBindingSource, "Branche", True))
        Me.BrancheComboBox.DisplayMember = "Bezeichnung"
        Me.BrancheComboBox.FormattingEnabled = True
        Me.BrancheComboBox.Location = New System.Drawing.Point(82, 64)
        Me.BrancheComboBox.Name = "BrancheComboBox"
        Me.BrancheComboBox.Size = New System.Drawing.Size(200, 21)
        Me.BrancheComboBox.TabIndex = 70
        Me.BrancheComboBox.ValueMember = "BrNR"
        '
        'BriefanredeComboBox
        '
        Me.BriefanredeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Briefanrede", True))
        Me.BriefanredeComboBox.FormattingEnabled = True
        Me.BriefanredeComboBox.Location = New System.Drawing.Point(82, 117)
        Me.BriefanredeComboBox.Name = "BriefanredeComboBox"
        Me.BriefanredeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.BriefanredeComboBox.TabIndex = 72
        '
        'TitelComboBox
        '
        Me.TitelComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Titel", True))
        Me.TitelComboBox.FormattingEnabled = True
        Me.TitelComboBox.Location = New System.Drawing.Point(82, 171)
        Me.TitelComboBox.Name = "TitelComboBox"
        Me.TitelComboBox.Size = New System.Drawing.Size(200, 21)
        Me.TitelComboBox.TabIndex = 74
        '
        'AnredeComboBox
        '
        Me.AnredeComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Anrede", True))
        Me.AnredeComboBox.FormattingEnabled = True
        Me.AnredeComboBox.Location = New System.Drawing.Point(82, 143)
        Me.AnredeComboBox.Name = "AnredeComboBox"
        Me.AnredeComboBox.Size = New System.Drawing.Size(200, 21)
        Me.AnredeComboBox.TabIndex = 73
        '
        'NameTextBox
        '
        Me.NameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Name", True))
        Me.NameTextBox.Location = New System.Drawing.Point(82, 198)
        Me.NameTextBox.Name = "NameTextBox"
        Me.NameTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NameTextBox.TabIndex = 75
        '
        'VornameTextBox
        '
        Me.VornameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Vorname", True))
        Me.VornameTextBox.Location = New System.Drawing.Point(82, 224)
        Me.VornameTextBox.Name = "VornameTextBox"
        Me.VornameTextBox.Size = New System.Drawing.Size(200, 20)
        Me.VornameTextBox.TabIndex = 77
        '
        'Name1TextBox
        '
        Me.Name1TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Name1", True))
        Me.Name1TextBox.Location = New System.Drawing.Point(82, 250)
        Me.Name1TextBox.Name = "Name1TextBox"
        Me.Name1TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Name1TextBox.TabIndex = 78
        '
        'FirmaTextBox
        '
        Me.FirmaTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Firma", True))
        Me.FirmaTextBox.Location = New System.Drawing.Point(82, 91)
        Me.FirmaTextBox.Name = "FirmaTextBox"
        Me.FirmaTextBox.Size = New System.Drawing.Size(200, 20)
        Me.FirmaTextBox.TabIndex = 71
        '
        'AdresseTextBox
        '
        Me.AdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Adresse", True))
        Me.AdresseTextBox.Location = New System.Drawing.Point(378, 67)
        Me.AdresseTextBox.Name = "AdresseTextBox"
        Me.AdresseTextBox.Size = New System.Drawing.Size(200, 20)
        Me.AdresseTextBox.TabIndex = 87
        '
        'LandComboBox
        '
        Me.LandComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.ofAdressenBindingSource, "Land", True))
        Me.LandComboBox.DisplayMember = "Name"
        Me.LandComboBox.Location = New System.Drawing.Point(378, 14)
        Me.LandComboBox.Name = "LandComboBox"
        Me.LandComboBox.Size = New System.Drawing.Size(200, 21)
        Me.LandComboBox.TabIndex = 82
        Me.LandComboBox.ValueMember = "IdNr"
        '
        'PLZComboBox
        '
        Me.PLZComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.ofAdressenBindingSource, "PLZ", True))
        Me.PLZComboBox.DataSource = Me.GrLandPlzBindingSource
        Me.PLZComboBox.DisplayMember = "PLZ"
        Me.PLZComboBox.FormattingEnabled = True
        Me.PLZComboBox.Location = New System.Drawing.Point(378, 41)
        Me.PLZComboBox.Name = "PLZComboBox"
        Me.PLZComboBox.Size = New System.Drawing.Size(54, 21)
        Me.PLZComboBox.TabIndex = 83
        Me.PLZComboBox.ValueMember = "IdNr"
        '
        'OrtComboBox
        '
        Me.OrtComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Ort", True))
        Me.OrtComboBox.DataSource = Me.GrLandPlzBindingSource
        Me.OrtComboBox.DisplayMember = "Ort"
        Me.OrtComboBox.FormattingEnabled = True
        Me.OrtComboBox.Location = New System.Drawing.Point(465, 41)
        Me.OrtComboBox.Name = "OrtComboBox"
        Me.OrtComboBox.Size = New System.Drawing.Size(113, 21)
        Me.OrtComboBox.TabIndex = 85
        Me.OrtComboBox.ValueMember = "Ort"
        '
        'TelTextBox
        '
        Me.TelTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Tel", True))
        Me.TelTextBox.Location = New System.Drawing.Point(378, 120)
        Me.TelTextBox.Name = "TelTextBox"
        Me.TelTextBox.Size = New System.Drawing.Size(200, 20)
        Me.TelTextBox.TabIndex = 89
        '
        'Tel2TextBox
        '
        Me.Tel2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Tel2", True))
        Me.Tel2TextBox.Location = New System.Drawing.Point(378, 146)
        Me.Tel2TextBox.Name = "Tel2TextBox"
        Me.Tel2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Tel2TextBox.TabIndex = 91
        '
        'FaxTextBox
        '
        Me.FaxTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Fax", True))
        Me.FaxTextBox.Location = New System.Drawing.Point(378, 172)
        Me.FaxTextBox.Name = "FaxTextBox"
        Me.FaxTextBox.Size = New System.Drawing.Size(200, 20)
        Me.FaxTextBox.TabIndex = 92
        '
        'Fax2TextBox
        '
        Me.Fax2TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Fax2", True))
        Me.Fax2TextBox.Location = New System.Drawing.Point(378, 198)
        Me.Fax2TextBox.Name = "Fax2TextBox"
        Me.Fax2TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Fax2TextBox.TabIndex = 93
        '
        'MobilTextBox
        '
        Me.MobilTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Mobil", True))
        Me.MobilTextBox.Location = New System.Drawing.Point(378, 224)
        Me.MobilTextBox.Name = "MobilTextBox"
        Me.MobilTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MobilTextBox.TabIndex = 95
        '
        'EmailTextBox
        '
        Me.EmailTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Email", True))
        Me.EmailTextBox.Location = New System.Drawing.Point(378, 250)
        Me.EmailTextBox.Name = "EmailTextBox"
        Me.EmailTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EmailTextBox.TabIndex = 97
        '
        'WebTextBox
        '
        Me.WebTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.ofAdressenBindingSource, "Web", True))
        Me.WebTextBox.Location = New System.Drawing.Point(378, 276)
        Me.WebTextBox.Name = "WebTextBox"
        Me.WebTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WebTextBox.TabIndex = 98
        '
        'GeburtstagDateTimePicker
        '
        Me.GeburtstagDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.ofAdressenBindingSource, "Geburtstag", True))
        Me.GeburtstagDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.GeburtstagDateTimePicker.Location = New System.Drawing.Point(82, 276)
        Me.GeburtstagDateTimePicker.Name = "GeburtstagDateTimePicker"
        Me.GeburtstagDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.GeburtstagDateTimePicker.TabIndex = 80
        '
        'OfAdressenTableAdapter
        '
        Me.OfAdressenTableAdapter.ClearBeforeFill = True
        '
        'GrlandTableAdapter
        '
        Me.GrlandTableAdapter.ClearBeforeFill = True
        '
        'AdressenDetailControl
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
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
        Me.Name = "AdressenDetailControl"
        Me.Size = New System.Drawing.Size(637, 316)
        CType(Me.DataSetKunden, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.ofAdressenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrLandPlzBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DataSetKunden As IntraSell_Net.dsAdressen
    Friend WithEvents ofAdressenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents DsPLZ As IntraSell_Net.dsPLZ
    Friend WithEvents GrLandPlzTableAdapter As IntraSell_Net.dsPLZTableAdapters.grLandPlzTableAdapter
    Friend WithEvents GrLandPlzBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents ButtonPLZSelect As System.Windows.Forms.Button
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
    Friend WithEvents GeburtstagDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents OfAdressenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter
    Friend WithEvents GrlandTableAdapter As IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter

End Class
