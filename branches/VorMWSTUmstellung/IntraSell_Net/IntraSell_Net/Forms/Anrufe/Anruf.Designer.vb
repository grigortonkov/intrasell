<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Anruf
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
        Dim AdrNrLabel As System.Windows.Forms.Label
        Dim LAenderungLabel As System.Windows.Forms.Label
        Dim LKontaktLabel As System.Windows.Forms.Label
        Dim NAnrufLabel As System.Windows.Forms.Label
        Dim NotizenLabel As System.Windows.Forms.Label
        Dim MitarbeiterNrLabel As System.Windows.Forms.Label
        Dim BeginZeitLabel As System.Windows.Forms.Label
        Dim EndeZeitLabel As System.Windows.Forms.Label
        Dim FirmaLabel As System.Windows.Forms.Label
        Dim AdresseLabel As System.Windows.Forms.Label
        Dim PLZLabel As System.Windows.Forms.Label
        Dim OrtLabel As System.Windows.Forms.Label
        Dim LandLabel As System.Windows.Forms.Label
        Dim Label1 As System.Windows.Forms.Label
        Dim Label2 As System.Windows.Forms.Label
        Dim Label3 As System.Windows.Forms.Label
        Dim ErgebnisLabel As System.Windows.Forms.Label
        Dim AngebotLabel As System.Windows.Forms.Label
        Dim WettbewerbLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Anruf))
        Me.DsAnrufe = New IntraSell_Net.dsAnrufe()
        Me.AnruflisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.AnruflisteTableAdapter = New IntraSell_Net.dsAnrufeTableAdapters.AnruflisteTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAnrufeTableAdapters.TableAdapterManager()
        Me.AnruflisteBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.AnruflisteBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.ArchivierenToolStripButton = New System.Windows.Forms.ToolStripButton()
        Me.LAenderungDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.LKontaktDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.NotizenTextBox = New System.Windows.Forms.TextBox()
        Me.BeginZeitDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.EndeZeitDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.VerrechnungCheckBox = New System.Windows.Forms.CheckBox()
        Me.FirmaTextBox = New System.Windows.Forms.TextBox()
        Me.AdresseTextBox = New System.Windows.Forms.TextBox()
        Me.PLZTextBox = New System.Windows.Forms.TextBox()
        Me.OrtTextBox = New System.Windows.Forms.TextBox()
        Me.LandTextBox = New System.Windows.Forms.TextBox()
        Me.NAnrufDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.TelTextBox = New System.Windows.Forms.TextBox()
        Me.mobilTextBox = New System.Windows.Forms.TextBox()
        Me.EmailTextBox = New System.Windows.Forms.TextBox()
        Me.StartStopButton = New System.Windows.Forms.Button()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.AngebotToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AngebotCheckBox = New System.Windows.Forms.CheckBox()
        Me.WeitereInformationenCheckBox = New System.Windows.Forms.CheckBox()
        Me.InformationPerComboBox = New System.Windows.Forms.ComboBox()
        Me.WettbewerbTextBox = New System.Windows.Forms.TextBox()
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.AdressenAnlageControl1 = New IntraSell_Net.AdressenAnlageControl()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.AdressenProfil1 = New IntraSell_Net.AdressenProfil()
        Me.MitarbeiterControl = New IntraSell_Net.MitarbeiterControl()
        Me.AdressenControl1 = New IntraSell_Net.AdressenControl()
        Me.ArchiviertCheckBox = New System.Windows.Forms.CheckBox()
        Me.AnrufNrTextBox = New System.Windows.Forms.TextBox()
        AdrNrLabel = New System.Windows.Forms.Label()
        LAenderungLabel = New System.Windows.Forms.Label()
        LKontaktLabel = New System.Windows.Forms.Label()
        NAnrufLabel = New System.Windows.Forms.Label()
        NotizenLabel = New System.Windows.Forms.Label()
        MitarbeiterNrLabel = New System.Windows.Forms.Label()
        BeginZeitLabel = New System.Windows.Forms.Label()
        EndeZeitLabel = New System.Windows.Forms.Label()
        FirmaLabel = New System.Windows.Forms.Label()
        AdresseLabel = New System.Windows.Forms.Label()
        PLZLabel = New System.Windows.Forms.Label()
        OrtLabel = New System.Windows.Forms.Label()
        LandLabel = New System.Windows.Forms.Label()
        Label1 = New System.Windows.Forms.Label()
        Label2 = New System.Windows.Forms.Label()
        Label3 = New System.Windows.Forms.Label()
        ErgebnisLabel = New System.Windows.Forms.Label()
        AngebotLabel = New System.Windows.Forms.Label()
        WettbewerbLabel = New System.Windows.Forms.Label()
        CType(Me.DsAnrufe, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.AnruflisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.AnruflisteBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.AnruflisteBindingNavigator.SuspendLayout()
        Me.MenuStrip1.SuspendLayout()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        Me.SuspendLayout()
        '
        'AdrNrLabel
        '
        AdrNrLabel.AutoSize = True
        AdrNrLabel.Location = New System.Drawing.Point(12, 42)
        AdrNrLabel.Name = "AdrNrLabel"
        AdrNrLabel.Size = New System.Drawing.Size(47, 13)
        AdrNrLabel.TabIndex = 3
        AdrNrLabel.Text = "Kontakt:"
        '
        'LAenderungLabel
        '
        LAenderungLabel.AutoSize = True
        LAenderungLabel.Location = New System.Drawing.Point(12, 482)
        LAenderungLabel.Name = "LAenderungLabel"
        LAenderungLabel.Size = New System.Drawing.Size(88, 13)
        LAenderungLabel.TabIndex = 5
        LAenderungLabel.Text = "Letzte Änderung:"
        '
        'LKontaktLabel
        '
        LKontaktLabel.AutoSize = True
        LKontaktLabel.Location = New System.Drawing.Point(12, 508)
        LKontaktLabel.Name = "LKontaktLabel"
        LKontaktLabel.Size = New System.Drawing.Size(82, 13)
        LKontaktLabel.TabIndex = 7
        LKontaktLabel.Text = "Letzter Kontakt:"
        '
        'NAnrufLabel
        '
        NAnrufLabel.AutoSize = True
        NAnrufLabel.Location = New System.Drawing.Point(12, 127)
        NAnrufLabel.Name = "NAnrufLabel"
        NAnrufLabel.Size = New System.Drawing.Size(81, 13)
        NAnrufLabel.TabIndex = 9
        NAnrufLabel.Text = "Nächster Anruf:"
        '
        'NotizenLabel
        '
        NotizenLabel.AutoSize = True
        NotizenLabel.Location = New System.Drawing.Point(12, 251)
        NotizenLabel.Name = "NotizenLabel"
        NotizenLabel.Size = New System.Drawing.Size(46, 13)
        NotizenLabel.TabIndex = 11
        NotizenLabel.Text = "Notizen:"
        '
        'MitarbeiterNrLabel
        '
        MitarbeiterNrLabel.AutoSize = True
        MitarbeiterNrLabel.Location = New System.Drawing.Point(11, 443)
        MitarbeiterNrLabel.Name = "MitarbeiterNrLabel"
        MitarbeiterNrLabel.Size = New System.Drawing.Size(73, 13)
        MitarbeiterNrLabel.TabIndex = 13
        MitarbeiterNrLabel.Text = "Mitarbeiter Nr:"
        '
        'BeginZeitLabel
        '
        BeginZeitLabel.AutoSize = True
        BeginZeitLabel.Location = New System.Drawing.Point(12, 75)
        BeginZeitLabel.Name = "BeginZeitLabel"
        BeginZeitLabel.Size = New System.Drawing.Size(58, 13)
        BeginZeitLabel.TabIndex = 15
        BeginZeitLabel.Text = "Begin Zeit:"
        '
        'EndeZeitLabel
        '
        EndeZeitLabel.AutoSize = True
        EndeZeitLabel.Location = New System.Drawing.Point(12, 101)
        EndeZeitLabel.Name = "EndeZeitLabel"
        EndeZeitLabel.Size = New System.Drawing.Size(56, 13)
        EndeZeitLabel.TabIndex = 17
        EndeZeitLabel.Text = "Ende Zeit:"
        '
        'FirmaLabel
        '
        FirmaLabel.AutoSize = True
        FirmaLabel.Location = New System.Drawing.Point(11, 135)
        FirmaLabel.Name = "FirmaLabel"
        FirmaLabel.Size = New System.Drawing.Size(35, 13)
        FirmaLabel.TabIndex = 21
        FirmaLabel.Text = "Firma:"
        '
        'AdresseLabel
        '
        AdresseLabel.AutoSize = True
        AdresseLabel.Location = New System.Drawing.Point(11, 161)
        AdresseLabel.Name = "AdresseLabel"
        AdresseLabel.Size = New System.Drawing.Size(48, 13)
        AdresseLabel.TabIndex = 23
        AdresseLabel.Text = "Adresse:"
        '
        'PLZLabel
        '
        PLZLabel.AutoSize = True
        PLZLabel.Location = New System.Drawing.Point(11, 187)
        PLZLabel.Name = "PLZLabel"
        PLZLabel.Size = New System.Drawing.Size(30, 13)
        PLZLabel.TabIndex = 25
        PLZLabel.Text = "PLZ:"
        '
        'OrtLabel
        '
        OrtLabel.AutoSize = True
        OrtLabel.Location = New System.Drawing.Point(11, 213)
        OrtLabel.Name = "OrtLabel"
        OrtLabel.Size = New System.Drawing.Size(24, 13)
        OrtLabel.TabIndex = 27
        OrtLabel.Text = "Ort:"
        '
        'LandLabel
        '
        LandLabel.AutoSize = True
        LandLabel.Location = New System.Drawing.Point(11, 239)
        LandLabel.Name = "LandLabel"
        LandLabel.Size = New System.Drawing.Size(34, 13)
        LandLabel.TabIndex = 29
        LandLabel.Text = "Land:"
        '
        'Label1
        '
        Label1.AutoSize = True
        Label1.Location = New System.Drawing.Point(11, 265)
        Label1.Name = "Label1"
        Label1.Size = New System.Drawing.Size(25, 13)
        Label1.TabIndex = 31
        Label1.Text = "Tel:"
        '
        'Label2
        '
        Label2.AutoSize = True
        Label2.Location = New System.Drawing.Point(11, 291)
        Label2.Name = "Label2"
        Label2.Size = New System.Drawing.Size(35, 13)
        Label2.TabIndex = 33
        Label2.Text = "Mobil:"
        '
        'Label3
        '
        Label3.AutoSize = True
        Label3.Location = New System.Drawing.Point(11, 317)
        Label3.Name = "Label3"
        Label3.Size = New System.Drawing.Size(35, 13)
        Label3.TabIndex = 35
        Label3.Text = "Email:"
        '
        'ErgebnisLabel
        '
        ErgebnisLabel.AutoSize = True
        ErgebnisLabel.Location = New System.Drawing.Point(11, 181)
        ErgebnisLabel.Name = "ErgebnisLabel"
        ErgebnisLabel.Size = New System.Drawing.Size(51, 13)
        ErgebnisLabel.TabIndex = 40
        ErgebnisLabel.Text = "Ergebnis:"
        '
        'AngebotLabel
        '
        AngebotLabel.AutoSize = True
        AngebotLabel.Location = New System.Drawing.Point(17, 386)
        AngebotLabel.Name = "AngebotLabel"
        AngebotLabel.Size = New System.Drawing.Size(0, 13)
        AngebotLabel.TabIndex = 40
        '
        'WettbewerbLabel
        '
        WettbewerbLabel.AutoSize = True
        WettbewerbLabel.Location = New System.Drawing.Point(11, 222)
        WettbewerbLabel.Name = "WettbewerbLabel"
        WettbewerbLabel.Size = New System.Drawing.Size(68, 13)
        WettbewerbLabel.TabIndex = 44
        WettbewerbLabel.Text = "Wettbewerb:"
        '
        'DsAnrufe
        '
        Me.DsAnrufe.DataSetName = "dsAnrufe"
        Me.DsAnrufe.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'AnruflisteBindingSource
        '
        Me.AnruflisteBindingSource.DataMember = "Anrufliste"
        Me.AnruflisteBindingSource.DataSource = Me.DsAnrufe
        '
        'AnruflisteTableAdapter
        '
        Me.AnruflisteTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.AnruflisteTableAdapter = Nothing
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Connection = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Nothing
        Me.TableAdapterManager.ofanrufeTableAdapter = Nothing
        Me.TableAdapterManager.ofmitarbeiterTableAdapter = Nothing
        Me.TableAdapterManager.oftermineTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAnrufeTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'AnruflisteBindingNavigator
        '
        Me.AnruflisteBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.AnruflisteBindingNavigator.BindingSource = Me.AnruflisteBindingSource
        Me.AnruflisteBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.AnruflisteBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.AnruflisteBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.AnruflisteBindingNavigatorSaveItem, Me.ArchivierenToolStripButton})
        Me.AnruflisteBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.AnruflisteBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.AnruflisteBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.AnruflisteBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.AnruflisteBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.AnruflisteBindingNavigator.Name = "AnruflisteBindingNavigator"
        Me.AnruflisteBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.AnruflisteBindingNavigator.Size = New System.Drawing.Size(888, 25)
        Me.AnruflisteBindingNavigator.TabIndex = 0
        Me.AnruflisteBindingNavigator.Text = "BindingNavigator1"
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
        'AnruflisteBindingNavigatorSaveItem
        '
        Me.AnruflisteBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.AnruflisteBindingNavigatorSaveItem.Image = CType(resources.GetObject("AnruflisteBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.AnruflisteBindingNavigatorSaveItem.Name = "AnruflisteBindingNavigatorSaveItem"
        Me.AnruflisteBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.AnruflisteBindingNavigatorSaveItem.Text = "Save Data"
        '
        'ArchivierenToolStripButton
        '
        Me.ArchivierenToolStripButton.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Text
        Me.ArchivierenToolStripButton.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ArchivierenToolStripButton.Name = "ArchivierenToolStripButton"
        Me.ArchivierenToolStripButton.Size = New System.Drawing.Size(71, 22)
        Me.ArchivierenToolStripButton.Text = "Archivieren"
        '
        'LAenderungDateTimePicker
        '
        Me.LAenderungDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.AnruflisteBindingSource, "LAenderung", True))
        Me.LAenderungDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.LAenderungDateTimePicker.Location = New System.Drawing.Point(100, 482)
        Me.LAenderungDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.LAenderungDateTimePicker.Name = "LAenderungDateTimePicker"
        Me.LAenderungDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.LAenderungDateTimePicker.TabIndex = 12
        '
        'LKontaktDateTimePicker
        '
        Me.LKontaktDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.AnruflisteBindingSource, "LKontakt", True))
        Me.LKontaktDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.LKontaktDateTimePicker.Location = New System.Drawing.Point(100, 508)
        Me.LKontaktDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.LKontaktDateTimePicker.Name = "LKontaktDateTimePicker"
        Me.LKontaktDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.LKontaktDateTimePicker.TabIndex = 13
        '
        'NotizenTextBox
        '
        Me.NotizenTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Notizen", True))
        Me.NotizenTextBox.Location = New System.Drawing.Point(100, 248)
        Me.NotizenTextBox.Multiline = True
        Me.NotizenTextBox.Name = "NotizenTextBox"
        Me.NotizenTextBox.Size = New System.Drawing.Size(384, 187)
        Me.NotizenTextBox.TabIndex = 10
        '
        'BeginZeitDateTimePicker
        '
        Me.BeginZeitDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.AnruflisteBindingSource, "BeginZeit", True))
        Me.BeginZeitDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.Time
        Me.BeginZeitDateTimePicker.Location = New System.Drawing.Point(100, 69)
        Me.BeginZeitDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.BeginZeitDateTimePicker.Name = "BeginZeitDateTimePicker"
        Me.BeginZeitDateTimePicker.ShowUpDown = True
        Me.BeginZeitDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.BeginZeitDateTimePicker.TabIndex = 1
        '
        'EndeZeitDateTimePicker
        '
        Me.EndeZeitDateTimePicker.CustomFormat = " "
        Me.EndeZeitDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.AnruflisteBindingSource, "EndeZeit", True))
        Me.EndeZeitDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.Time
        Me.EndeZeitDateTimePicker.Location = New System.Drawing.Point(100, 95)
        Me.EndeZeitDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.EndeZeitDateTimePicker.Name = "EndeZeitDateTimePicker"
        Me.EndeZeitDateTimePicker.ShowUpDown = True
        Me.EndeZeitDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.EndeZeitDateTimePicker.TabIndex = 3
        '
        'VerrechnungCheckBox
        '
        Me.VerrechnungCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.AnruflisteBindingSource, "Verrechnung", True))
        Me.VerrechnungCheckBox.Location = New System.Drawing.Point(100, 149)
        Me.VerrechnungCheckBox.Name = "VerrechnungCheckBox"
        Me.VerrechnungCheckBox.Size = New System.Drawing.Size(155, 24)
        Me.VerrechnungCheckBox.TabIndex = 5
        Me.VerrechnungCheckBox.Text = "Verrechnung"
        Me.VerrechnungCheckBox.UseVisualStyleBackColor = True
        '
        'FirmaTextBox
        '
        Me.FirmaTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.FirmaTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Firma", True))
        Me.FirmaTextBox.Location = New System.Drawing.Point(62, 132)
        Me.FirmaTextBox.Name = "FirmaTextBox"
        Me.FirmaTextBox.Size = New System.Drawing.Size(232, 20)
        Me.FirmaTextBox.TabIndex = 22
        Me.FirmaTextBox.TabStop = False
        '
        'AdresseTextBox
        '
        Me.AdresseTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.AdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Adresse", True))
        Me.AdresseTextBox.Location = New System.Drawing.Point(62, 158)
        Me.AdresseTextBox.Name = "AdresseTextBox"
        Me.AdresseTextBox.Size = New System.Drawing.Size(232, 20)
        Me.AdresseTextBox.TabIndex = 24
        Me.AdresseTextBox.TabStop = False
        '
        'PLZTextBox
        '
        Me.PLZTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.PLZTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "PLZ", True))
        Me.PLZTextBox.Location = New System.Drawing.Point(62, 184)
        Me.PLZTextBox.Name = "PLZTextBox"
        Me.PLZTextBox.Size = New System.Drawing.Size(232, 20)
        Me.PLZTextBox.TabIndex = 26
        Me.PLZTextBox.TabStop = False
        '
        'OrtTextBox
        '
        Me.OrtTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.OrtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Ort", True))
        Me.OrtTextBox.Location = New System.Drawing.Point(62, 210)
        Me.OrtTextBox.Name = "OrtTextBox"
        Me.OrtTextBox.Size = New System.Drawing.Size(232, 20)
        Me.OrtTextBox.TabIndex = 28
        Me.OrtTextBox.TabStop = False
        '
        'LandTextBox
        '
        Me.LandTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.LandTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Land", True))
        Me.LandTextBox.Location = New System.Drawing.Point(62, 236)
        Me.LandTextBox.Name = "LandTextBox"
        Me.LandTextBox.Size = New System.Drawing.Size(232, 20)
        Me.LandTextBox.TabIndex = 30
        Me.LandTextBox.TabStop = False
        '
        'NAnrufDateTimePicker
        '
        Me.NAnrufDateTimePicker.CustomFormat = " "
        Me.NAnrufDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.AnruflisteBindingSource, "NAnruf", True))
        Me.NAnrufDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.NAnrufDateTimePicker.Location = New System.Drawing.Point(100, 121)
        Me.NAnrufDateTimePicker.MinDate = New Date(2000, 1, 1, 0, 0, 0, 0)
        Me.NAnrufDateTimePicker.Name = "NAnrufDateTimePicker"
        Me.NAnrufDateTimePicker.Size = New System.Drawing.Size(126, 20)
        Me.NAnrufDateTimePicker.TabIndex = 4
        '
        'TelTextBox
        '
        Me.TelTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.TelTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Tel", True))
        Me.TelTextBox.Location = New System.Drawing.Point(62, 262)
        Me.TelTextBox.Name = "TelTextBox"
        Me.TelTextBox.Size = New System.Drawing.Size(232, 20)
        Me.TelTextBox.TabIndex = 32
        Me.TelTextBox.TabStop = False
        '
        'mobilTextBox
        '
        Me.mobilTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.mobilTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Mobil", True))
        Me.mobilTextBox.Location = New System.Drawing.Point(62, 288)
        Me.mobilTextBox.Name = "mobilTextBox"
        Me.mobilTextBox.Size = New System.Drawing.Size(232, 20)
        Me.mobilTextBox.TabIndex = 34
        Me.mobilTextBox.TabStop = False
        '
        'EmailTextBox
        '
        Me.EmailTextBox.BackColor = System.Drawing.SystemColors.InactiveBorder
        Me.EmailTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Email", True))
        Me.EmailTextBox.Location = New System.Drawing.Point(62, 314)
        Me.EmailTextBox.Name = "EmailTextBox"
        Me.EmailTextBox.Size = New System.Drawing.Size(232, 20)
        Me.EmailTextBox.TabIndex = 36
        Me.EmailTextBox.TabStop = False
        '
        'StartStopButton
        '
        Me.StartStopButton.Location = New System.Drawing.Point(232, 69)
        Me.StartStopButton.Name = "StartStopButton"
        Me.StartStopButton.Size = New System.Drawing.Size(51, 44)
        Me.StartStopButton.TabIndex = 2
        Me.StartStopButton.Text = "Start"
        Me.StartStopButton.UseVisualStyleBackColor = True
        '
        'Timer1
        '
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Dock = System.Windows.Forms.DockStyle.None
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AngebotToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(337, 445)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(73, 24)
        Me.MenuStrip1.TabIndex = 39
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'AngebotToolStripMenuItem
        '
        Me.AngebotToolStripMenuItem.Name = "AngebotToolStripMenuItem"
        Me.AngebotToolStripMenuItem.Size = New System.Drawing.Size(65, 20)
        Me.AngebotToolStripMenuItem.Text = "&Angebot"
        '
        'AngebotCheckBox
        '
        Me.AngebotCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.AnruflisteBindingSource, "Angebot", True))
        Me.AngebotCheckBox.Location = New System.Drawing.Point(100, 172)
        Me.AngebotCheckBox.Name = "AngebotCheckBox"
        Me.AngebotCheckBox.Size = New System.Drawing.Size(104, 24)
        Me.AngebotCheckBox.TabIndex = 6
        Me.AngebotCheckBox.Text = "will Angebot"
        Me.AngebotCheckBox.UseVisualStyleBackColor = True
        '
        'WeitereInformationenCheckBox
        '
        Me.WeitereInformationenCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.AnruflisteBindingSource, "WeitereInformationen", True))
        Me.WeitereInformationenCheckBox.Location = New System.Drawing.Point(100, 196)
        Me.WeitereInformationenCheckBox.Name = "WeitereInformationenCheckBox"
        Me.WeitereInformationenCheckBox.Size = New System.Drawing.Size(174, 24)
        Me.WeitereInformationenCheckBox.TabIndex = 7
        Me.WeitereInformationenCheckBox.Text = "will weitere Informationen per"
        Me.WeitereInformationenCheckBox.UseVisualStyleBackColor = True
        '
        'InformationPerComboBox
        '
        Me.InformationPerComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "InformationPer", True))
        Me.InformationPerComboBox.FormattingEnabled = True
        Me.InformationPerComboBox.Items.AddRange(New Object() {"Keine", "Email", "Fax", "Post"})
        Me.InformationPerComboBox.Location = New System.Drawing.Point(261, 196)
        Me.InformationPerComboBox.Name = "InformationPerComboBox"
        Me.InformationPerComboBox.Size = New System.Drawing.Size(51, 21)
        Me.InformationPerComboBox.TabIndex = 8
        '
        'WettbewerbTextBox
        '
        Me.WettbewerbTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "Wettbewerb", True))
        Me.WettbewerbTextBox.Location = New System.Drawing.Point(100, 222)
        Me.WettbewerbTextBox.Name = "WettbewerbTextBox"
        Me.WettbewerbTextBox.Size = New System.Drawing.Size(126, 20)
        Me.WettbewerbTextBox.TabIndex = 9
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Location = New System.Drawing.Point(505, 34)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(373, 511)
        Me.TabControl1.TabIndex = 14
        '
        'TabPage1
        '
        Me.TabPage1.BackColor = System.Drawing.SystemColors.Control
        Me.TabPage1.Controls.Add(Me.AdressenAnlageControl1)
        Me.TabPage1.Controls.Add(Me.LandTextBox)
        Me.TabPage1.Controls.Add(LandLabel)
        Me.TabPage1.Controls.Add(Me.OrtTextBox)
        Me.TabPage1.Controls.Add(OrtLabel)
        Me.TabPage1.Controls.Add(Me.PLZTextBox)
        Me.TabPage1.Controls.Add(PLZLabel)
        Me.TabPage1.Controls.Add(Me.AdresseTextBox)
        Me.TabPage1.Controls.Add(AdresseLabel)
        Me.TabPage1.Controls.Add(Me.FirmaTextBox)
        Me.TabPage1.Controls.Add(FirmaLabel)
        Me.TabPage1.Controls.Add(Label1)
        Me.TabPage1.Controls.Add(Me.EmailTextBox)
        Me.TabPage1.Controls.Add(Me.TelTextBox)
        Me.TabPage1.Controls.Add(Label3)
        Me.TabPage1.Controls.Add(Label2)
        Me.TabPage1.Controls.Add(Me.mobilTextBox)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(365, 485)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Firma"
        '
        'AdressenAnlageControl1
        '
        Me.AdressenAnlageControl1.Location = New System.Drawing.Point(62, 6)
        Me.AdressenAnlageControl1.Name = "AdressenAnlageControl1"
        Me.AdressenAnlageControl1.Size = New System.Drawing.Size(232, 114)
        Me.AdressenAnlageControl1.TabIndex = 38
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.AdressenProfil1)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(365, 485)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Profil"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'AdressenProfil1
        '
        Me.AdressenProfil1.DataBindings.Add(New System.Windows.Forms.Binding("Tag", Me.AnruflisteBindingSource, "AdrNr", True))
        Me.AdressenProfil1.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.AnruflisteBindingSource, "AdrNr", True))
        Me.AdressenProfil1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.AdressenProfil1.IDNR = 0
        Me.AdressenProfil1.Location = New System.Drawing.Point(3, 3)
        Me.AdressenProfil1.Name = "AdressenProfil1"
        Me.AdressenProfil1.Size = New System.Drawing.Size(359, 479)
        Me.AdressenProfil1.TabIndex = 46
        '
        'MitarbeiterControl
        '
        Me.MitarbeiterControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.AnruflisteBindingSource, "MitarbeiterNr", True))
        Me.MitarbeiterControl.IDNR = 0
        Me.MitarbeiterControl.Location = New System.Drawing.Point(100, 441)
        Me.MitarbeiterControl.Name = "MitarbeiterControl"
        Me.MitarbeiterControl.Size = New System.Drawing.Size(155, 25)
        Me.MitarbeiterControl.TabIndex = 11
        '
        'AdressenControl1
        '
        Me.AdressenControl1.BackColor = System.Drawing.Color.LemonChiffon
        Me.AdressenControl1.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.AnruflisteBindingSource, "AdrNr", True))
        Me.AdressenControl1.IDNR = 0
        Me.AdressenControl1.Location = New System.Drawing.Point(100, 42)
        Me.AdressenControl1.Name = "AdressenControl1"
        Me.AdressenControl1.ShowAddNew = False
        Me.AdressenControl1.Size = New System.Drawing.Size(155, 25)
        Me.AdressenControl1.TabIndex = 0
        '
        'ArchiviertCheckBox
        '
        Me.ArchiviertCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.AnruflisteBindingSource, "Archiviert", True))
        Me.ArchiviertCheckBox.Enabled = False
        Me.ArchiviertCheckBox.Location = New System.Drawing.Point(100, 534)
        Me.ArchiviertCheckBox.Name = "ArchiviertCheckBox"
        Me.ArchiviertCheckBox.Size = New System.Drawing.Size(174, 24)
        Me.ArchiviertCheckBox.TabIndex = 14
        Me.ArchiviertCheckBox.Text = "archiviert"
        Me.ArchiviertCheckBox.UseVisualStyleBackColor = True
        '
        'AnrufNrTextBox
        '
        Me.AnrufNrTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.AnruflisteBindingSource, "AnrufNr", True))
        Me.AnrufNrTextBox.Enabled = False
        Me.AnrufNrTextBox.Location = New System.Drawing.Point(173, 534)
        Me.AnrufNrTextBox.Name = "AnrufNrTextBox"
        Me.AnrufNrTextBox.Size = New System.Drawing.Size(82, 20)
        Me.AnrufNrTextBox.TabIndex = 45
        '
        'Anruf
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(888, 560)
        Me.Controls.Add(Me.AnrufNrTextBox)
        Me.Controls.Add(Me.ArchiviertCheckBox)
        Me.Controls.Add(Me.TabControl1)
        Me.Controls.Add(WettbewerbLabel)
        Me.Controls.Add(Me.WettbewerbTextBox)
        Me.Controls.Add(Me.InformationPerComboBox)
        Me.Controls.Add(Me.WeitereInformationenCheckBox)
        Me.Controls.Add(AngebotLabel)
        Me.Controls.Add(Me.AngebotCheckBox)
        Me.Controls.Add(ErgebnisLabel)
        Me.Controls.Add(Me.StartStopButton)
        Me.Controls.Add(Me.MitarbeiterControl)
        Me.Controls.Add(Me.NAnrufDateTimePicker)
        Me.Controls.Add(Me.AdressenControl1)
        Me.Controls.Add(AdrNrLabel)
        Me.Controls.Add(LAenderungLabel)
        Me.Controls.Add(Me.LAenderungDateTimePicker)
        Me.Controls.Add(LKontaktLabel)
        Me.Controls.Add(Me.LKontaktDateTimePicker)
        Me.Controls.Add(NAnrufLabel)
        Me.Controls.Add(NotizenLabel)
        Me.Controls.Add(Me.NotizenTextBox)
        Me.Controls.Add(MitarbeiterNrLabel)
        Me.Controls.Add(BeginZeitLabel)
        Me.Controls.Add(Me.BeginZeitDateTimePicker)
        Me.Controls.Add(EndeZeitLabel)
        Me.Controls.Add(Me.EndeZeitDateTimePicker)
        Me.Controls.Add(Me.VerrechnungCheckBox)
        Me.Controls.Add(Me.AnruflisteBindingNavigator)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Anruf"
        Me.Text = "Anruf"
        CType(Me.DsAnrufe, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.AnruflisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.AnruflisteBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.AnruflisteBindingNavigator.ResumeLayout(False)
        Me.AnruflisteBindingNavigator.PerformLayout()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsAnrufe As IntraSell_Net.dsAnrufe
    Friend WithEvents AnruflisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents AnruflisteTableAdapter As IntraSell_Net.dsAnrufeTableAdapters.AnruflisteTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAnrufeTableAdapters.TableAdapterManager
    Friend WithEvents AnruflisteBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents AnruflisteBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents LAenderungDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents LKontaktDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents NotizenTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BeginZeitDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents EndeZeitDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents VerrechnungCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents FirmaTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PLZTextBox As System.Windows.Forms.TextBox
    Friend WithEvents OrtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LandTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AdressenControl1 As IntraSell_Net.AdressenControl
    Friend WithEvents NAnrufDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents MitarbeiterControl As IntraSell_Net.MitarbeiterControl
    Friend WithEvents TelTextBox As System.Windows.Forms.TextBox
    Friend WithEvents mobilTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EmailTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StartStopButton As System.Windows.Forms.Button
    Friend WithEvents AdressenAnlageControl1 As IntraSell_Net.AdressenAnlageControl
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents AngebotToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AngebotCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents WeitereInformationenCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents InformationPerComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents WettbewerbTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AdressenProfil1 As IntraSell_Net.AdressenProfil
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents NAnruf1DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ArchivierenToolStripButton As System.Windows.Forms.ToolStripButton
    Friend WithEvents ArchiviertCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AnrufNrTextBox As System.Windows.Forms.TextBox
End Class
