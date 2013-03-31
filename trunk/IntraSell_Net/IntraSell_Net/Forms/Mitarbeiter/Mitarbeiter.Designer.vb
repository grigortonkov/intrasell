<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Mitarbeiter
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
        Dim IDNRLabel As System.Windows.Forms.Label
        Dim PositionLabel As System.Windows.Forms.Label
        Dim AnredeLabel As System.Windows.Forms.Label
        Dim NameLabel As System.Windows.Forms.Label
        Dim VornameLabel As System.Windows.Forms.Label
        Dim GeschlechtLabel As System.Windows.Forms.Label
        Dim AdresseLabel As System.Windows.Forms.Label
        Dim LandLabel As System.Windows.Forms.Label
        Dim PLZLabel As System.Windows.Forms.Label
        Dim OrtLabel As System.Windows.Forms.Label
        Dim TelPrivatLabel As System.Windows.Forms.Label
        Dim TelFirmaLabel As System.Windows.Forms.Label
        Dim FaxFirmaLabel As System.Windows.Forms.Label
        Dim MobilLabel As System.Windows.Forms.Label
        Dim EmailLabel As System.Windows.Forms.Label
        Dim SVNLabel As System.Windows.Forms.Label
        Dim BankNrLabel As System.Windows.Forms.Label
        Dim KontoNrLabel As System.Windows.Forms.Label
        Dim UsernameLabel As System.Windows.Forms.Label
        Dim PasswortLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Mitarbeiter))
        Me.DsMitarbeiter = New IntraSell_Net.dsMitarbeiter()
        Me.OfmitarbeiterBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfmitarbeiterTableAdapter = New IntraSell_Net.dsMitarbeiterTableAdapters.ofmitarbeiterTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsMitarbeiterTableAdapters.TableAdapterManager()
        Me.OfmitarbeiterBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.OfmitarbeiterBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.IDNRTextBox = New System.Windows.Forms.TextBox()
        Me.PositionTextBox = New System.Windows.Forms.TextBox()
        Me.AnredeTextBox = New System.Windows.Forms.TextBox()
        Me.NameTextBox = New System.Windows.Forms.TextBox()
        Me.VornameTextBox = New System.Windows.Forms.TextBox()
        Me.GeschlechtTextBox = New System.Windows.Forms.TextBox()
        Me.AdresseTextBox = New System.Windows.Forms.TextBox()
        Me.LandTextBox = New System.Windows.Forms.TextBox()
        Me.PLZTextBox = New System.Windows.Forms.TextBox()
        Me.OrtTextBox = New System.Windows.Forms.TextBox()
        Me.TelPrivatTextBox = New System.Windows.Forms.TextBox()
        Me.TelFirmaTextBox = New System.Windows.Forms.TextBox()
        Me.FaxFirmaTextBox = New System.Windows.Forms.TextBox()
        Me.MobilTextBox = New System.Windows.Forms.TextBox()
        Me.EmailTextBox = New System.Windows.Forms.TextBox()
        Me.SVNTextBox = New System.Windows.Forms.TextBox()
        Me.BankNrTextBox = New System.Windows.Forms.TextBox()
        Me.KontoNrTextBox = New System.Windows.Forms.TextBox()
        Me.UsernameTextBox = New System.Windows.Forms.TextBox()
        Me.PasswortTextBox = New System.Windows.Forms.TextBox()
        IDNRLabel = New System.Windows.Forms.Label()
        PositionLabel = New System.Windows.Forms.Label()
        AnredeLabel = New System.Windows.Forms.Label()
        NameLabel = New System.Windows.Forms.Label()
        VornameLabel = New System.Windows.Forms.Label()
        GeschlechtLabel = New System.Windows.Forms.Label()
        AdresseLabel = New System.Windows.Forms.Label()
        LandLabel = New System.Windows.Forms.Label()
        PLZLabel = New System.Windows.Forms.Label()
        OrtLabel = New System.Windows.Forms.Label()
        TelPrivatLabel = New System.Windows.Forms.Label()
        TelFirmaLabel = New System.Windows.Forms.Label()
        FaxFirmaLabel = New System.Windows.Forms.Label()
        MobilLabel = New System.Windows.Forms.Label()
        EmailLabel = New System.Windows.Forms.Label()
        SVNLabel = New System.Windows.Forms.Label()
        BankNrLabel = New System.Windows.Forms.Label()
        KontoNrLabel = New System.Windows.Forms.Label()
        UsernameLabel = New System.Windows.Forms.Label()
        PasswortLabel = New System.Windows.Forms.Label()
        CType(Me.DsMitarbeiter, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfmitarbeiterBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfmitarbeiterBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.OfmitarbeiterBindingNavigator.SuspendLayout()
        Me.SuspendLayout()
        '
        'IDNRLabel
        '
        IDNRLabel.AutoSize = True
        IDNRLabel.Location = New System.Drawing.Point(10, 31)
        IDNRLabel.Name = "IDNRLabel"
        IDNRLabel.Size = New System.Drawing.Size(37, 13)
        IDNRLabel.TabIndex = 1
        IDNRLabel.Text = "IDNR:"
        '
        'PositionLabel
        '
        PositionLabel.AutoSize = True
        PositionLabel.Location = New System.Drawing.Point(10, 57)
        PositionLabel.Name = "PositionLabel"
        PositionLabel.Size = New System.Drawing.Size(47, 13)
        PositionLabel.TabIndex = 3
        PositionLabel.Text = "Position:"
        '
        'AnredeLabel
        '
        AnredeLabel.AutoSize = True
        AnredeLabel.Location = New System.Drawing.Point(10, 83)
        AnredeLabel.Name = "AnredeLabel"
        AnredeLabel.Size = New System.Drawing.Size(44, 13)
        AnredeLabel.TabIndex = 5
        AnredeLabel.Text = "Anrede:"
        '
        'NameLabel
        '
        NameLabel.AutoSize = True
        NameLabel.Location = New System.Drawing.Point(10, 109)
        NameLabel.Name = "NameLabel"
        NameLabel.Size = New System.Drawing.Size(38, 13)
        NameLabel.TabIndex = 7
        NameLabel.Text = "Name:"
        '
        'VornameLabel
        '
        VornameLabel.AutoSize = True
        VornameLabel.Location = New System.Drawing.Point(10, 135)
        VornameLabel.Name = "VornameLabel"
        VornameLabel.Size = New System.Drawing.Size(52, 13)
        VornameLabel.TabIndex = 9
        VornameLabel.Text = "Vorname:"
        '
        'GeschlechtLabel
        '
        GeschlechtLabel.AutoSize = True
        GeschlechtLabel.Location = New System.Drawing.Point(10, 161)
        GeschlechtLabel.Name = "GeschlechtLabel"
        GeschlechtLabel.Size = New System.Drawing.Size(64, 13)
        GeschlechtLabel.TabIndex = 11
        GeschlechtLabel.Text = "Geschlecht:"
        '
        'AdresseLabel
        '
        AdresseLabel.AutoSize = True
        AdresseLabel.Location = New System.Drawing.Point(10, 187)
        AdresseLabel.Name = "AdresseLabel"
        AdresseLabel.Size = New System.Drawing.Size(48, 13)
        AdresseLabel.TabIndex = 13
        AdresseLabel.Text = "Adresse:"
        '
        'LandLabel
        '
        LandLabel.AutoSize = True
        LandLabel.Location = New System.Drawing.Point(10, 213)
        LandLabel.Name = "LandLabel"
        LandLabel.Size = New System.Drawing.Size(34, 13)
        LandLabel.TabIndex = 15
        LandLabel.Text = "Land:"
        '
        'PLZLabel
        '
        PLZLabel.AutoSize = True
        PLZLabel.Location = New System.Drawing.Point(10, 239)
        PLZLabel.Name = "PLZLabel"
        PLZLabel.Size = New System.Drawing.Size(30, 13)
        PLZLabel.TabIndex = 17
        PLZLabel.Text = "PLZ:"
        '
        'OrtLabel
        '
        OrtLabel.AutoSize = True
        OrtLabel.Location = New System.Drawing.Point(10, 265)
        OrtLabel.Name = "OrtLabel"
        OrtLabel.Size = New System.Drawing.Size(24, 13)
        OrtLabel.TabIndex = 19
        OrtLabel.Text = "Ort:"
        '
        'TelPrivatLabel
        '
        TelPrivatLabel.AutoSize = True
        TelPrivatLabel.Location = New System.Drawing.Point(306, 31)
        TelPrivatLabel.Name = "TelPrivatLabel"
        TelPrivatLabel.Size = New System.Drawing.Size(55, 13)
        TelPrivatLabel.TabIndex = 21
        TelPrivatLabel.Text = "Tel Privat:"
        '
        'TelFirmaLabel
        '
        TelFirmaLabel.AutoSize = True
        TelFirmaLabel.Location = New System.Drawing.Point(306, 57)
        TelFirmaLabel.Name = "TelFirmaLabel"
        TelFirmaLabel.Size = New System.Drawing.Size(53, 13)
        TelFirmaLabel.TabIndex = 23
        TelFirmaLabel.Text = "Tel Firma:"
        '
        'FaxFirmaLabel
        '
        FaxFirmaLabel.AutoSize = True
        FaxFirmaLabel.Location = New System.Drawing.Point(306, 83)
        FaxFirmaLabel.Name = "FaxFirmaLabel"
        FaxFirmaLabel.Size = New System.Drawing.Size(55, 13)
        FaxFirmaLabel.TabIndex = 25
        FaxFirmaLabel.Text = "Fax Firma:"
        '
        'MobilLabel
        '
        MobilLabel.AutoSize = True
        MobilLabel.Location = New System.Drawing.Point(306, 109)
        MobilLabel.Name = "MobilLabel"
        MobilLabel.Size = New System.Drawing.Size(35, 13)
        MobilLabel.TabIndex = 27
        MobilLabel.Text = "Mobil:"
        '
        'EmailLabel
        '
        EmailLabel.AutoSize = True
        EmailLabel.Location = New System.Drawing.Point(306, 135)
        EmailLabel.Name = "EmailLabel"
        EmailLabel.Size = New System.Drawing.Size(35, 13)
        EmailLabel.TabIndex = 29
        EmailLabel.Text = "Email:"
        '
        'SVNLabel
        '
        SVNLabel.AutoSize = True
        SVNLabel.Location = New System.Drawing.Point(306, 161)
        SVNLabel.Name = "SVNLabel"
        SVNLabel.Size = New System.Drawing.Size(32, 13)
        SVNLabel.TabIndex = 31
        SVNLabel.Text = "SVN:"
        '
        'BankNrLabel
        '
        BankNrLabel.AutoSize = True
        BankNrLabel.Location = New System.Drawing.Point(306, 187)
        BankNrLabel.Name = "BankNrLabel"
        BankNrLabel.Size = New System.Drawing.Size(49, 13)
        BankNrLabel.TabIndex = 33
        BankNrLabel.Text = "Bank Nr:"
        '
        'KontoNrLabel
        '
        KontoNrLabel.AutoSize = True
        KontoNrLabel.Location = New System.Drawing.Point(306, 213)
        KontoNrLabel.Name = "KontoNrLabel"
        KontoNrLabel.Size = New System.Drawing.Size(52, 13)
        KontoNrLabel.TabIndex = 35
        KontoNrLabel.Text = "Konto Nr:"
        '
        'UsernameLabel
        '
        UsernameLabel.AutoSize = True
        UsernameLabel.Location = New System.Drawing.Point(306, 239)
        UsernameLabel.Name = "UsernameLabel"
        UsernameLabel.Size = New System.Drawing.Size(58, 13)
        UsernameLabel.TabIndex = 37
        UsernameLabel.Text = "Username:"
        '
        'PasswortLabel
        '
        PasswortLabel.AutoSize = True
        PasswortLabel.Location = New System.Drawing.Point(306, 265)
        PasswortLabel.Name = "PasswortLabel"
        PasswortLabel.Size = New System.Drawing.Size(53, 13)
        PasswortLabel.TabIndex = 39
        PasswortLabel.Text = "Passwort:"
        '
        'DsMitarbeiter
        '
        Me.DsMitarbeiter.DataSetName = "dsMitarbeiter"
        Me.DsMitarbeiter.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'OfmitarbeiterBindingSource
        '
        Me.OfmitarbeiterBindingSource.DataMember = "ofmitarbeiter"
        Me.OfmitarbeiterBindingSource.DataSource = Me.DsMitarbeiter
        '
        'OfmitarbeiterTableAdapter
        '
        Me.OfmitarbeiterTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.ofmitarbeiterTableAdapter = Me.OfmitarbeiterTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsMitarbeiterTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'OfmitarbeiterBindingNavigator
        '
        Me.OfmitarbeiterBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.OfmitarbeiterBindingNavigator.BindingSource = Me.OfmitarbeiterBindingSource
        Me.OfmitarbeiterBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.OfmitarbeiterBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.OfmitarbeiterBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.OfmitarbeiterBindingNavigatorSaveItem})
        Me.OfmitarbeiterBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.OfmitarbeiterBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.OfmitarbeiterBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.OfmitarbeiterBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.OfmitarbeiterBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.OfmitarbeiterBindingNavigator.Name = "OfmitarbeiterBindingNavigator"
        Me.OfmitarbeiterBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.OfmitarbeiterBindingNavigator.Size = New System.Drawing.Size(629, 25)
        Me.OfmitarbeiterBindingNavigator.TabIndex = 0
        Me.OfmitarbeiterBindingNavigator.Text = "BindingNavigator1"
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
        'OfmitarbeiterBindingNavigatorSaveItem
        '
        Me.OfmitarbeiterBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.OfmitarbeiterBindingNavigatorSaveItem.Image = CType(resources.GetObject("OfmitarbeiterBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.OfmitarbeiterBindingNavigatorSaveItem.Name = "OfmitarbeiterBindingNavigatorSaveItem"
        Me.OfmitarbeiterBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.OfmitarbeiterBindingNavigatorSaveItem.Text = "Save Data"
        '
        'IDNRTextBox
        '
        Me.IDNRTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.IDNRTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "IDNR", True))
        Me.IDNRTextBox.Location = New System.Drawing.Point(80, 28)
        Me.IDNRTextBox.Name = "IDNRTextBox"
        Me.IDNRTextBox.Size = New System.Drawing.Size(173, 20)
        Me.IDNRTextBox.TabIndex = 2
        '
        'PositionTextBox
        '
        Me.PositionTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Position", True))
        Me.PositionTextBox.Location = New System.Drawing.Point(80, 54)
        Me.PositionTextBox.Name = "PositionTextBox"
        Me.PositionTextBox.Size = New System.Drawing.Size(173, 20)
        Me.PositionTextBox.TabIndex = 4
        '
        'AnredeTextBox
        '
        Me.AnredeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Anrede", True))
        Me.AnredeTextBox.Location = New System.Drawing.Point(80, 80)
        Me.AnredeTextBox.Name = "AnredeTextBox"
        Me.AnredeTextBox.Size = New System.Drawing.Size(173, 20)
        Me.AnredeTextBox.TabIndex = 6
        '
        'NameTextBox
        '
        Me.NameTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.NameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Name", True))
        Me.NameTextBox.Location = New System.Drawing.Point(80, 106)
        Me.NameTextBox.Name = "NameTextBox"
        Me.NameTextBox.Size = New System.Drawing.Size(173, 20)
        Me.NameTextBox.TabIndex = 8
        '
        'VornameTextBox
        '
        Me.VornameTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.VornameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Vorname", True))
        Me.VornameTextBox.Location = New System.Drawing.Point(80, 132)
        Me.VornameTextBox.Name = "VornameTextBox"
        Me.VornameTextBox.Size = New System.Drawing.Size(173, 20)
        Me.VornameTextBox.TabIndex = 10
        '
        'GeschlechtTextBox
        '
        Me.GeschlechtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Geschlecht", True))
        Me.GeschlechtTextBox.Location = New System.Drawing.Point(80, 158)
        Me.GeschlechtTextBox.Name = "GeschlechtTextBox"
        Me.GeschlechtTextBox.Size = New System.Drawing.Size(173, 20)
        Me.GeschlechtTextBox.TabIndex = 12
        '
        'AdresseTextBox
        '
        Me.AdresseTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Adresse", True))
        Me.AdresseTextBox.Location = New System.Drawing.Point(80, 184)
        Me.AdresseTextBox.Name = "AdresseTextBox"
        Me.AdresseTextBox.Size = New System.Drawing.Size(173, 20)
        Me.AdresseTextBox.TabIndex = 14
        '
        'LandTextBox
        '
        Me.LandTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Land", True))
        Me.LandTextBox.Location = New System.Drawing.Point(80, 210)
        Me.LandTextBox.Name = "LandTextBox"
        Me.LandTextBox.Size = New System.Drawing.Size(173, 20)
        Me.LandTextBox.TabIndex = 16
        '
        'PLZTextBox
        '
        Me.PLZTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "PLZ", True))
        Me.PLZTextBox.Location = New System.Drawing.Point(80, 236)
        Me.PLZTextBox.Name = "PLZTextBox"
        Me.PLZTextBox.Size = New System.Drawing.Size(173, 20)
        Me.PLZTextBox.TabIndex = 18
        '
        'OrtTextBox
        '
        Me.OrtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Ort", True))
        Me.OrtTextBox.Location = New System.Drawing.Point(80, 262)
        Me.OrtTextBox.Name = "OrtTextBox"
        Me.OrtTextBox.Size = New System.Drawing.Size(173, 20)
        Me.OrtTextBox.TabIndex = 20
        '
        'TelPrivatTextBox
        '
        Me.TelPrivatTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "TelPrivat", True))
        Me.TelPrivatTextBox.Location = New System.Drawing.Point(376, 28)
        Me.TelPrivatTextBox.Name = "TelPrivatTextBox"
        Me.TelPrivatTextBox.Size = New System.Drawing.Size(173, 20)
        Me.TelPrivatTextBox.TabIndex = 22
        '
        'TelFirmaTextBox
        '
        Me.TelFirmaTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "TelFirma", True))
        Me.TelFirmaTextBox.Location = New System.Drawing.Point(376, 54)
        Me.TelFirmaTextBox.Name = "TelFirmaTextBox"
        Me.TelFirmaTextBox.Size = New System.Drawing.Size(173, 20)
        Me.TelFirmaTextBox.TabIndex = 24
        '
        'FaxFirmaTextBox
        '
        Me.FaxFirmaTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "FaxFirma", True))
        Me.FaxFirmaTextBox.Location = New System.Drawing.Point(376, 80)
        Me.FaxFirmaTextBox.Name = "FaxFirmaTextBox"
        Me.FaxFirmaTextBox.Size = New System.Drawing.Size(173, 20)
        Me.FaxFirmaTextBox.TabIndex = 26
        '
        'MobilTextBox
        '
        Me.MobilTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Mobil", True))
        Me.MobilTextBox.Location = New System.Drawing.Point(376, 106)
        Me.MobilTextBox.Name = "MobilTextBox"
        Me.MobilTextBox.Size = New System.Drawing.Size(173, 20)
        Me.MobilTextBox.TabIndex = 28
        '
        'EmailTextBox
        '
        Me.EmailTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Email", True))
        Me.EmailTextBox.Location = New System.Drawing.Point(376, 132)
        Me.EmailTextBox.Name = "EmailTextBox"
        Me.EmailTextBox.Size = New System.Drawing.Size(173, 20)
        Me.EmailTextBox.TabIndex = 30
        '
        'SVNTextBox
        '
        Me.SVNTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "SVN", True))
        Me.SVNTextBox.Location = New System.Drawing.Point(376, 158)
        Me.SVNTextBox.Name = "SVNTextBox"
        Me.SVNTextBox.Size = New System.Drawing.Size(173, 20)
        Me.SVNTextBox.TabIndex = 32
        '
        'BankNrTextBox
        '
        Me.BankNrTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "BankNr", True))
        Me.BankNrTextBox.Location = New System.Drawing.Point(376, 184)
        Me.BankNrTextBox.Name = "BankNrTextBox"
        Me.BankNrTextBox.Size = New System.Drawing.Size(173, 20)
        Me.BankNrTextBox.TabIndex = 34
        '
        'KontoNrTextBox
        '
        Me.KontoNrTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "KontoNr", True))
        Me.KontoNrTextBox.Location = New System.Drawing.Point(376, 210)
        Me.KontoNrTextBox.Name = "KontoNrTextBox"
        Me.KontoNrTextBox.Size = New System.Drawing.Size(173, 20)
        Me.KontoNrTextBox.TabIndex = 36
        '
        'UsernameTextBox
        '
        Me.UsernameTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.UsernameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Username", True))
        Me.UsernameTextBox.Location = New System.Drawing.Point(376, 236)
        Me.UsernameTextBox.Name = "UsernameTextBox"
        Me.UsernameTextBox.Size = New System.Drawing.Size(173, 20)
        Me.UsernameTextBox.TabIndex = 38
        '
        'PasswortTextBox
        '
        Me.PasswortTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.PasswortTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.OfmitarbeiterBindingSource, "Passwort", True))
        Me.PasswortTextBox.Location = New System.Drawing.Point(376, 262)
        Me.PasswortTextBox.Name = "PasswortTextBox"
        Me.PasswortTextBox.PasswordChar = Global.Microsoft.VisualBasic.ChrW(42)
        Me.PasswortTextBox.Size = New System.Drawing.Size(173, 20)
        Me.PasswortTextBox.TabIndex = 40
        '
        'Mitarbeiter
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(629, 334)
        Me.Controls.Add(IDNRLabel)
        Me.Controls.Add(Me.IDNRTextBox)
        Me.Controls.Add(PositionLabel)
        Me.Controls.Add(Me.PositionTextBox)
        Me.Controls.Add(AnredeLabel)
        Me.Controls.Add(Me.AnredeTextBox)
        Me.Controls.Add(NameLabel)
        Me.Controls.Add(Me.NameTextBox)
        Me.Controls.Add(VornameLabel)
        Me.Controls.Add(Me.VornameTextBox)
        Me.Controls.Add(GeschlechtLabel)
        Me.Controls.Add(Me.GeschlechtTextBox)
        Me.Controls.Add(AdresseLabel)
        Me.Controls.Add(Me.AdresseTextBox)
        Me.Controls.Add(LandLabel)
        Me.Controls.Add(Me.LandTextBox)
        Me.Controls.Add(PLZLabel)
        Me.Controls.Add(Me.PLZTextBox)
        Me.Controls.Add(OrtLabel)
        Me.Controls.Add(Me.OrtTextBox)
        Me.Controls.Add(TelPrivatLabel)
        Me.Controls.Add(Me.TelPrivatTextBox)
        Me.Controls.Add(TelFirmaLabel)
        Me.Controls.Add(Me.TelFirmaTextBox)
        Me.Controls.Add(FaxFirmaLabel)
        Me.Controls.Add(Me.FaxFirmaTextBox)
        Me.Controls.Add(MobilLabel)
        Me.Controls.Add(Me.MobilTextBox)
        Me.Controls.Add(EmailLabel)
        Me.Controls.Add(Me.EmailTextBox)
        Me.Controls.Add(SVNLabel)
        Me.Controls.Add(Me.SVNTextBox)
        Me.Controls.Add(BankNrLabel)
        Me.Controls.Add(Me.BankNrTextBox)
        Me.Controls.Add(KontoNrLabel)
        Me.Controls.Add(Me.KontoNrTextBox)
        Me.Controls.Add(UsernameLabel)
        Me.Controls.Add(Me.UsernameTextBox)
        Me.Controls.Add(PasswortLabel)
        Me.Controls.Add(Me.PasswortTextBox)
        Me.Controls.Add(Me.OfmitarbeiterBindingNavigator)
        Me.Name = "Mitarbeiter"
        Me.Text = "Mitarbeiter"
        CType(Me.DsMitarbeiter, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfmitarbeiterBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfmitarbeiterBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.OfmitarbeiterBindingNavigator.ResumeLayout(False)
        Me.OfmitarbeiterBindingNavigator.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsMitarbeiter As IntraSell_Net.dsMitarbeiter
    Friend WithEvents OfmitarbeiterBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfmitarbeiterTableAdapter As IntraSell_Net.dsMitarbeiterTableAdapters.ofmitarbeiterTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsMitarbeiterTableAdapters.TableAdapterManager
    Friend WithEvents OfmitarbeiterBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents OfmitarbeiterBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents IDNRTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PositionTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AnredeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents VornameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GeschlechtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AdresseTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LandTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PLZTextBox As System.Windows.Forms.TextBox
    Friend WithEvents OrtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TelPrivatTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TelFirmaTextBox As System.Windows.Forms.TextBox
    Friend WithEvents FaxFirmaTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MobilTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EmailTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SVNTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BankNrTextBox As System.Windows.Forms.TextBox
    Friend WithEvents KontoNrTextBox As System.Windows.Forms.TextBox
    Friend WithEvents UsernameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PasswortTextBox As System.Windows.Forms.TextBox
End Class
