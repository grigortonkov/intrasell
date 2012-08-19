<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Artikel
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
        Dim ArtNrLabel As System.Windows.Forms.Label
        Dim EANLabel As System.Windows.Forms.Label
        Dim BarcodeLabel As System.Windows.Forms.Label
        Dim BezeichnungLabel As System.Windows.Forms.Label
        Dim Bezeichnung1Label As System.Windows.Forms.Label
        Dim BeschreibungLabel As System.Windows.Forms.Label
        Dim EinheitLabel As System.Windows.Forms.Label
        Dim PreisATSLabel As System.Windows.Forms.Label
        Dim PreisATS_BruttoLabel As System.Windows.Forms.Label
        Dim EKPreisLabel As System.Windows.Forms.Label
        Dim LEKPreisLabel As System.Windows.Forms.Label
        Dim LieferantNRLabel As System.Windows.Forms.Label
        Dim SetArtikelLabel As System.Windows.Forms.Label
        Dim ArtKatNrLabel As System.Windows.Forms.Label
        Dim MWSTLabel As System.Windows.Forms.Label
        Dim GewichtLabel As System.Windows.Forms.Label
        Dim PictureLabel As System.Windows.Forms.Label
        Dim HerstellerNrLabel As System.Windows.Forms.Label
        Dim ShopURLLabel As System.Windows.Forms.Label
        Dim HerstellerURLLabel As System.Windows.Forms.Label
        Dim ModifikationenLabel As System.Windows.Forms.Label
        Dim HerstellerRabattLabel As System.Windows.Forms.Label
        Dim HerstellerRabattTextLabel As System.Windows.Forms.Label
        Dim BruttoGewichtLabel As System.Windows.Forms.Label
        Dim NettoGewichtLabel As System.Windows.Forms.Label
        Dim TaraGewichtLabel As System.Windows.Forms.Label
        Dim AngelegtAmLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Artikel))
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.GrartikelBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrartikelTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grartikelTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager()
        Me.GrartikelBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.GrartikelBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.ArtNrTextBox = New System.Windows.Forms.TextBox()
        Me.EANTextBox = New System.Windows.Forms.TextBox()
        Me.BarcodeTextBox = New System.Windows.Forms.TextBox()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.Bezeichnung1TextBox = New System.Windows.Forms.TextBox()
        Me.BeschreibungTextBox = New System.Windows.Forms.TextBox()
        Me.EinheitComboBox = New System.Windows.Forms.ComboBox()
        Me.PreisATSTextBox = New System.Windows.Forms.TextBox()
        Me.PreisATS_BruttoTextBox = New System.Windows.Forms.TextBox()
        Me.LagerArtikelCheckBox = New System.Windows.Forms.CheckBox()
        Me.EKPreisTextBox = New System.Windows.Forms.TextBox()
        Me.LEKPreisTextBox = New System.Windows.Forms.TextBox()
        Me.SeriennummerCheckBox = New System.Windows.Forms.CheckBox()
        Me.LieferantNRComboBox = New System.Windows.Forms.ComboBox()
        Me.SetArtikelCheckBox = New System.Windows.Forms.CheckBox()
        Me.ArtKatNrComboBox = New System.Windows.Forms.ComboBox()
        Me.MWSTTextBox = New System.Windows.Forms.TextBox()
        Me.GewichtTextBox = New System.Windows.Forms.TextBox()
        Me.PictureTextBox = New System.Windows.Forms.TextBox()
        Me.HerstellerNrComboBox = New System.Windows.Forms.ComboBox()
        Me.ProduktAktivCheckBox = New System.Windows.Forms.CheckBox()
        Me.ShopURLTextBox = New System.Windows.Forms.TextBox()
        Me.HerstellerURLTextBox = New System.Windows.Forms.TextBox()
        Me.ModifikationenTextBox = New System.Windows.Forms.TextBox()
        Me.HerstellerRabattTextBox = New System.Windows.Forms.TextBox()
        Me.HerstellerRabattTextTextBox = New System.Windows.Forms.TextBox()
        Me.BruttoGewichtTextBox = New System.Windows.Forms.TextBox()
        Me.NettoGewichtTextBox = New System.Windows.Forms.TextBox()
        Me.TaraGewichtTextBox = New System.Windows.Forms.TextBox()
        Me.AngelegtAmDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.NichtBestellbarCheckBox = New System.Windows.Forms.CheckBox()
        Me.ProduktAktivOnlineCheckBox = New System.Windows.Forms.CheckBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.Grartikel_kategorienTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grartikel_kategorienTableAdapter()
        Me.Grartikel_kategorienBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        ArtNrLabel = New System.Windows.Forms.Label()
        EANLabel = New System.Windows.Forms.Label()
        BarcodeLabel = New System.Windows.Forms.Label()
        BezeichnungLabel = New System.Windows.Forms.Label()
        Bezeichnung1Label = New System.Windows.Forms.Label()
        BeschreibungLabel = New System.Windows.Forms.Label()
        EinheitLabel = New System.Windows.Forms.Label()
        PreisATSLabel = New System.Windows.Forms.Label()
        PreisATS_BruttoLabel = New System.Windows.Forms.Label()
        EKPreisLabel = New System.Windows.Forms.Label()
        LEKPreisLabel = New System.Windows.Forms.Label()
        LieferantNRLabel = New System.Windows.Forms.Label()
        SetArtikelLabel = New System.Windows.Forms.Label()
        ArtKatNrLabel = New System.Windows.Forms.Label()
        MWSTLabel = New System.Windows.Forms.Label()
        GewichtLabel = New System.Windows.Forms.Label()
        PictureLabel = New System.Windows.Forms.Label()
        HerstellerNrLabel = New System.Windows.Forms.Label()
        ShopURLLabel = New System.Windows.Forms.Label()
        HerstellerURLLabel = New System.Windows.Forms.Label()
        ModifikationenLabel = New System.Windows.Forms.Label()
        HerstellerRabattLabel = New System.Windows.Forms.Label()
        HerstellerRabattTextLabel = New System.Windows.Forms.Label()
        BruttoGewichtLabel = New System.Windows.Forms.Label()
        NettoGewichtLabel = New System.Windows.Forms.Label()
        TaraGewichtLabel = New System.Windows.Forms.Label()
        AngelegtAmLabel = New System.Windows.Forms.Label()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrartikelBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrartikelBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GrartikelBindingNavigator.SuspendLayout()
        CType(Me.Grartikel_kategorienBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'ArtNrLabel
        '
        ArtNrLabel.AutoSize = True
        ArtNrLabel.Location = New System.Drawing.Point(11, 41)
        ArtNrLabel.Name = "ArtNrLabel"
        ArtNrLabel.Size = New System.Drawing.Size(34, 13)
        ArtNrLabel.TabIndex = 1
        ArtNrLabel.Text = "ArtNr:"
        '
        'EANLabel
        '
        EANLabel.AutoSize = True
        EANLabel.Location = New System.Drawing.Point(11, 67)
        EANLabel.Name = "EANLabel"
        EANLabel.Size = New System.Drawing.Size(32, 13)
        EANLabel.TabIndex = 3
        EANLabel.Text = "EAN:"
        '
        'BarcodeLabel
        '
        BarcodeLabel.AutoSize = True
        BarcodeLabel.Location = New System.Drawing.Point(11, 93)
        BarcodeLabel.Name = "BarcodeLabel"
        BarcodeLabel.Size = New System.Drawing.Size(50, 13)
        BarcodeLabel.TabIndex = 5
        BarcodeLabel.Text = "Barcode:"
        '
        'BezeichnungLabel
        '
        BezeichnungLabel.AutoSize = True
        BezeichnungLabel.Location = New System.Drawing.Point(11, 119)
        BezeichnungLabel.Name = "BezeichnungLabel"
        BezeichnungLabel.Size = New System.Drawing.Size(72, 13)
        BezeichnungLabel.TabIndex = 7
        BezeichnungLabel.Text = "Bezeichnung:"
        '
        'Bezeichnung1Label
        '
        Bezeichnung1Label.AutoSize = True
        Bezeichnung1Label.Location = New System.Drawing.Point(11, 145)
        Bezeichnung1Label.Name = "Bezeichnung1Label"
        Bezeichnung1Label.Size = New System.Drawing.Size(78, 13)
        Bezeichnung1Label.TabIndex = 9
        Bezeichnung1Label.Text = "Bezeichnung1:"
        '
        'BeschreibungLabel
        '
        BeschreibungLabel.AutoSize = True
        BeschreibungLabel.Location = New System.Drawing.Point(11, 171)
        BeschreibungLabel.Name = "BeschreibungLabel"
        BeschreibungLabel.Size = New System.Drawing.Size(75, 13)
        BeschreibungLabel.TabIndex = 11
        BeschreibungLabel.Text = "Beschreibung:"
        '
        'EinheitLabel
        '
        EinheitLabel.AutoSize = True
        EinheitLabel.Location = New System.Drawing.Point(11, 285)
        EinheitLabel.Name = "EinheitLabel"
        EinheitLabel.Size = New System.Drawing.Size(42, 13)
        EinheitLabel.TabIndex = 13
        EinheitLabel.Text = "Einheit:"
        '
        'PreisATSLabel
        '
        PreisATSLabel.AutoSize = True
        PreisATSLabel.Location = New System.Drawing.Point(11, 312)
        PreisATSLabel.Name = "PreisATSLabel"
        PreisATSLabel.Size = New System.Drawing.Size(50, 13)
        PreisATSLabel.TabIndex = 15
        PreisATSLabel.Text = "VK Preis:"
        '
        'PreisATS_BruttoLabel
        '
        PreisATS_BruttoLabel.AutoSize = True
        PreisATS_BruttoLabel.Location = New System.Drawing.Point(11, 364)
        PreisATS_BruttoLabel.Name = "PreisATS_BruttoLabel"
        PreisATS_BruttoLabel.Size = New System.Drawing.Size(64, 13)
        PreisATS_BruttoLabel.TabIndex = 19
        PreisATS_BruttoLabel.Text = "Preis Brutto:"
        '
        'EKPreisLabel
        '
        EKPreisLabel.AutoSize = True
        EKPreisLabel.Location = New System.Drawing.Point(11, 389)
        EKPreisLabel.Name = "EKPreisLabel"
        EKPreisLabel.Size = New System.Drawing.Size(50, 13)
        EKPreisLabel.TabIndex = 23
        EKPreisLabel.Text = "EK Preis:"
        '
        'LEKPreisLabel
        '
        LEKPreisLabel.AutoSize = True
        LEKPreisLabel.Location = New System.Drawing.Point(11, 415)
        LEKPreisLabel.Name = "LEKPreisLabel"
        LEKPreisLabel.Size = New System.Drawing.Size(56, 13)
        LEKPreisLabel.TabIndex = 25
        LEKPreisLabel.Text = "LEK Preis:"
        '
        'LieferantNRLabel
        '
        LieferantNRLabel.AutoSize = True
        LieferantNRLabel.Location = New System.Drawing.Point(367, 65)
        LieferantNRLabel.Name = "LieferantNRLabel"
        LieferantNRLabel.Size = New System.Drawing.Size(51, 13)
        LieferantNRLabel.TabIndex = 29
        LieferantNRLabel.Text = "Lieferant:"
        '
        'SetArtikelLabel
        '
        SetArtikelLabel.AutoSize = True
        SetArtikelLabel.Location = New System.Drawing.Point(780, 88)
        SetArtikelLabel.Name = "SetArtikelLabel"
        SetArtikelLabel.Size = New System.Drawing.Size(0, 13)
        SetArtikelLabel.TabIndex = 31
        '
        'ArtKatNrLabel
        '
        ArtKatNrLabel.AutoSize = True
        ArtKatNrLabel.Location = New System.Drawing.Point(367, 38)
        ArtKatNrLabel.Name = "ArtKatNrLabel"
        ArtKatNrLabel.Size = New System.Drawing.Size(56, 13)
        ArtKatNrLabel.TabIndex = 33
        ArtKatNrLabel.Text = "Art Kat Nr:"
        '
        'MWSTLabel
        '
        MWSTLabel.AutoSize = True
        MWSTLabel.Location = New System.Drawing.Point(11, 338)
        MWSTLabel.Name = "MWSTLabel"
        MWSTLabel.Size = New System.Drawing.Size(51, 13)
        MWSTLabel.TabIndex = 35
        MWSTLabel.Text = "MwSt(%):"
        '
        'GewichtLabel
        '
        GewichtLabel.AutoSize = True
        GewichtLabel.Location = New System.Drawing.Point(367, 308)
        GewichtLabel.Name = "GewichtLabel"
        GewichtLabel.Size = New System.Drawing.Size(49, 13)
        GewichtLabel.TabIndex = 37
        GewichtLabel.Text = "Gewicht:"
        '
        'PictureLabel
        '
        PictureLabel.AutoSize = True
        PictureLabel.Location = New System.Drawing.Point(367, 141)
        PictureLabel.Name = "PictureLabel"
        PictureLabel.Size = New System.Drawing.Size(43, 13)
        PictureLabel.TabIndex = 39
        PictureLabel.Text = "Picture:"
        '
        'HerstellerNrLabel
        '
        HerstellerNrLabel.AutoSize = True
        HerstellerNrLabel.Location = New System.Drawing.Point(367, 93)
        HerstellerNrLabel.Name = "HerstellerNrLabel"
        HerstellerNrLabel.Size = New System.Drawing.Size(54, 13)
        HerstellerNrLabel.TabIndex = 41
        HerstellerNrLabel.Text = "Hersteller:"
        '
        'ShopURLLabel
        '
        ShopURLLabel.AutoSize = True
        ShopURLLabel.Location = New System.Drawing.Point(367, 169)
        ShopURLLabel.Name = "ShopURLLabel"
        ShopURLLabel.Size = New System.Drawing.Size(60, 13)
        ShopURLLabel.TabIndex = 45
        ShopURLLabel.Text = "Shop URL:"
        '
        'HerstellerURLLabel
        '
        HerstellerURLLabel.AutoSize = True
        HerstellerURLLabel.Location = New System.Drawing.Point(367, 195)
        HerstellerURLLabel.Name = "HerstellerURLLabel"
        HerstellerURLLabel.Size = New System.Drawing.Size(79, 13)
        HerstellerURLLabel.TabIndex = 47
        HerstellerURLLabel.Text = "Hersteller URL:"
        '
        'ModifikationenLabel
        '
        ModifikationenLabel.AutoSize = True
        ModifikationenLabel.Location = New System.Drawing.Point(367, 221)
        ModifikationenLabel.Name = "ModifikationenLabel"
        ModifikationenLabel.Size = New System.Drawing.Size(79, 13)
        ModifikationenLabel.TabIndex = 49
        ModifikationenLabel.Text = "Modifikationen:"
        '
        'HerstellerRabattLabel
        '
        HerstellerRabattLabel.AutoSize = True
        HerstellerRabattLabel.Location = New System.Drawing.Point(367, 247)
        HerstellerRabattLabel.Name = "HerstellerRabattLabel"
        HerstellerRabattLabel.Size = New System.Drawing.Size(89, 13)
        HerstellerRabattLabel.TabIndex = 51
        HerstellerRabattLabel.Text = "Hersteller Rabatt:"
        '
        'HerstellerRabattTextLabel
        '
        HerstellerRabattTextLabel.AutoSize = True
        HerstellerRabattTextLabel.Location = New System.Drawing.Point(367, 273)
        HerstellerRabattTextLabel.Name = "HerstellerRabattTextLabel"
        HerstellerRabattTextLabel.Size = New System.Drawing.Size(113, 13)
        HerstellerRabattTextLabel.TabIndex = 53
        HerstellerRabattTextLabel.Text = "Hersteller Rabatt Text:"
        '
        'BruttoGewichtLabel
        '
        BruttoGewichtLabel.AutoSize = True
        BruttoGewichtLabel.Location = New System.Drawing.Point(367, 334)
        BruttoGewichtLabel.Name = "BruttoGewichtLabel"
        BruttoGewichtLabel.Size = New System.Drawing.Size(80, 13)
        BruttoGewichtLabel.TabIndex = 55
        BruttoGewichtLabel.Text = "Brutto Gewicht:"
        '
        'NettoGewichtLabel
        '
        NettoGewichtLabel.AutoSize = True
        NettoGewichtLabel.Location = New System.Drawing.Point(367, 360)
        NettoGewichtLabel.Name = "NettoGewichtLabel"
        NettoGewichtLabel.Size = New System.Drawing.Size(78, 13)
        NettoGewichtLabel.TabIndex = 57
        NettoGewichtLabel.Text = "Netto Gewicht:"
        '
        'TaraGewichtLabel
        '
        TaraGewichtLabel.AutoSize = True
        TaraGewichtLabel.Location = New System.Drawing.Point(367, 386)
        TaraGewichtLabel.Name = "TaraGewichtLabel"
        TaraGewichtLabel.Size = New System.Drawing.Size(74, 13)
        TaraGewichtLabel.TabIndex = 59
        TaraGewichtLabel.Text = "Tara Gewicht:"
        '
        'AngelegtAmLabel
        '
        AngelegtAmLabel.AutoSize = True
        AngelegtAmLabel.Location = New System.Drawing.Point(367, 413)
        AngelegtAmLabel.Name = "AngelegtAmLabel"
        AngelegtAmLabel.Size = New System.Drawing.Size(70, 13)
        AngelegtAmLabel.TabIndex = 61
        AngelegtAmLabel.Text = "Angelegt Am:"
        '
        'DsArtikel
        '
        Me.DsArtikel.DataSetName = "dsArtikel"
        Me.DsArtikel.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrartikelBindingSource
        '
        Me.GrartikelBindingSource.DataMember = "grartikel"
        Me.GrartikelBindingSource.DataSource = Me.DsArtikel
        '
        'GrartikelTableAdapter
        '
        Me.GrartikelTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grartikel_einheitenTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_htmlinfoTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_itemtrackinghistoryTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_kategorien_verwandteTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_kategorienTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_keywordsTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_keywordstoproductsTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_staffelpreiseTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_vertriebskostenTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_verwandteartikelTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_vkpreisperselectionTableAdapter = Nothing
        Me.TableAdapterManager.grartikelTableAdapter = Me.GrartikelTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'GrartikelBindingNavigator
        '
        Me.GrartikelBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.GrartikelBindingNavigator.BindingSource = Me.GrartikelBindingSource
        Me.GrartikelBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.GrartikelBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.GrartikelBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.GrartikelBindingNavigatorSaveItem})
        Me.GrartikelBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.GrartikelBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.GrartikelBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.GrartikelBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.GrartikelBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.GrartikelBindingNavigator.Name = "GrartikelBindingNavigator"
        Me.GrartikelBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.GrartikelBindingNavigator.Size = New System.Drawing.Size(875, 25)
        Me.GrartikelBindingNavigator.TabIndex = 0
        Me.GrartikelBindingNavigator.Text = "BindingNavigator1"
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
        'GrartikelBindingNavigatorSaveItem
        '
        Me.GrartikelBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.GrartikelBindingNavigatorSaveItem.Image = CType(resources.GetObject("GrartikelBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.GrartikelBindingNavigatorSaveItem.Name = "GrartikelBindingNavigatorSaveItem"
        Me.GrartikelBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.GrartikelBindingNavigatorSaveItem.Text = "Save Data"
        '
        'ArtNrTextBox
        '
        Me.ArtNrTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "ArtNr", True))
        Me.ArtNrTextBox.Location = New System.Drawing.Point(130, 38)
        Me.ArtNrTextBox.Name = "ArtNrTextBox"
        Me.ArtNrTextBox.Size = New System.Drawing.Size(200, 20)
        Me.ArtNrTextBox.TabIndex = 2
        '
        'EANTextBox
        '
        Me.EANTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "EAN", True))
        Me.EANTextBox.Location = New System.Drawing.Point(130, 64)
        Me.EANTextBox.Name = "EANTextBox"
        Me.EANTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EANTextBox.TabIndex = 3
        '
        'BarcodeTextBox
        '
        Me.BarcodeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Barcode", True))
        Me.BarcodeTextBox.Location = New System.Drawing.Point(130, 90)
        Me.BarcodeTextBox.Name = "BarcodeTextBox"
        Me.BarcodeTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BarcodeTextBox.TabIndex = 4
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Bezeichnung", True))
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(130, 116)
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BezeichnungTextBox.TabIndex = 5
        '
        'Bezeichnung1TextBox
        '
        Me.Bezeichnung1TextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Bezeichnung1", True))
        Me.Bezeichnung1TextBox.Location = New System.Drawing.Point(130, 142)
        Me.Bezeichnung1TextBox.Name = "Bezeichnung1TextBox"
        Me.Bezeichnung1TextBox.Size = New System.Drawing.Size(200, 20)
        Me.Bezeichnung1TextBox.TabIndex = 6
        '
        'BeschreibungTextBox
        '
        Me.BeschreibungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Beschreibung", True))
        Me.BeschreibungTextBox.Location = New System.Drawing.Point(130, 168)
        Me.BeschreibungTextBox.Multiline = True
        Me.BeschreibungTextBox.Name = "BeschreibungTextBox"
        Me.BeschreibungTextBox.Size = New System.Drawing.Size(200, 108)
        Me.BeschreibungTextBox.TabIndex = 7
        '
        'EinheitComboBox
        '
        Me.EinheitComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Einheit", True))
        Me.EinheitComboBox.FormattingEnabled = True
        Me.EinheitComboBox.Location = New System.Drawing.Point(130, 282)
        Me.EinheitComboBox.Name = "EinheitComboBox"
        Me.EinheitComboBox.Size = New System.Drawing.Size(200, 21)
        Me.EinheitComboBox.TabIndex = 8
        '
        'PreisATSTextBox
        '
        Me.PreisATSTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "PreisATS", True))
        Me.PreisATSTextBox.Location = New System.Drawing.Point(130, 309)
        Me.PreisATSTextBox.Name = "PreisATSTextBox"
        Me.PreisATSTextBox.Size = New System.Drawing.Size(200, 20)
        Me.PreisATSTextBox.TabIndex = 9
        '
        'PreisATS_BruttoTextBox
        '
        Me.PreisATS_BruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "PreisATS_Brutto", True))
        Me.PreisATS_BruttoTextBox.Location = New System.Drawing.Point(130, 361)
        Me.PreisATS_BruttoTextBox.Name = "PreisATS_BruttoTextBox"
        Me.PreisATS_BruttoTextBox.Size = New System.Drawing.Size(200, 20)
        Me.PreisATS_BruttoTextBox.TabIndex = 11
        '
        'LagerArtikelCheckBox
        '
        Me.LagerArtikelCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrartikelBindingSource, "LagerArtikel", True))
        Me.LagerArtikelCheckBox.Location = New System.Drawing.Point(721, 36)
        Me.LagerArtikelCheckBox.Name = "LagerArtikelCheckBox"
        Me.LagerArtikelCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.LagerArtikelCheckBox.TabIndex = 28
        Me.LagerArtikelCheckBox.Text = "Lager Artikel"
        Me.LagerArtikelCheckBox.UseVisualStyleBackColor = True
        '
        'EKPreisTextBox
        '
        Me.EKPreisTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "EKPreis", True))
        Me.EKPreisTextBox.Location = New System.Drawing.Point(130, 386)
        Me.EKPreisTextBox.Name = "EKPreisTextBox"
        Me.EKPreisTextBox.Size = New System.Drawing.Size(200, 20)
        Me.EKPreisTextBox.TabIndex = 12
        '
        'LEKPreisTextBox
        '
        Me.LEKPreisTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "LEKPreis", True))
        Me.LEKPreisTextBox.Location = New System.Drawing.Point(130, 412)
        Me.LEKPreisTextBox.Name = "LEKPreisTextBox"
        Me.LEKPreisTextBox.Size = New System.Drawing.Size(200, 20)
        Me.LEKPreisTextBox.TabIndex = 13
        '
        'SeriennummerCheckBox
        '
        Me.SeriennummerCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrartikelBindingSource, "Seriennummer", True))
        Me.SeriennummerCheckBox.Location = New System.Drawing.Point(721, 64)
        Me.SeriennummerCheckBox.Name = "SeriennummerCheckBox"
        Me.SeriennummerCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.SeriennummerCheckBox.TabIndex = 29
        Me.SeriennummerCheckBox.Text = "Seriennummer erford."
        Me.SeriennummerCheckBox.UseVisualStyleBackColor = True
        '
        'LieferantNRComboBox
        '
        Me.LieferantNRComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "LieferantNR", True))
        Me.LieferantNRComboBox.FormattingEnabled = True
        Me.LieferantNRComboBox.Location = New System.Drawing.Point(486, 62)
        Me.LieferantNRComboBox.Name = "LieferantNRComboBox"
        Me.LieferantNRComboBox.Size = New System.Drawing.Size(200, 21)
        Me.LieferantNRComboBox.TabIndex = 15
        '
        'SetArtikelCheckBox
        '
        Me.SetArtikelCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrartikelBindingSource, "SetArtikel", True))
        Me.SetArtikelCheckBox.Location = New System.Drawing.Point(721, 90)
        Me.SetArtikelCheckBox.Name = "SetArtikelCheckBox"
        Me.SetArtikelCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.SetArtikelCheckBox.TabIndex = 30
        Me.SetArtikelCheckBox.Text = "Set Artikel"
        Me.SetArtikelCheckBox.UseVisualStyleBackColor = True
        '
        'ArtKatNrComboBox
        '
        Me.ArtKatNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "ArtKatNr", True))
        Me.ArtKatNrComboBox.FormattingEnabled = True
        Me.ArtKatNrComboBox.Location = New System.Drawing.Point(486, 35)
        Me.ArtKatNrComboBox.Name = "ArtKatNrComboBox"
        Me.ArtKatNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.ArtKatNrComboBox.TabIndex = 14
        '
        'MWSTTextBox
        '
        Me.MWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "MWST", True))
        Me.MWSTTextBox.Location = New System.Drawing.Point(130, 335)
        Me.MWSTTextBox.Name = "MWSTTextBox"
        Me.MWSTTextBox.Size = New System.Drawing.Size(200, 20)
        Me.MWSTTextBox.TabIndex = 10
        '
        'GewichtTextBox
        '
        Me.GewichtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Gewicht", True))
        Me.GewichtTextBox.Location = New System.Drawing.Point(486, 305)
        Me.GewichtTextBox.Name = "GewichtTextBox"
        Me.GewichtTextBox.Size = New System.Drawing.Size(200, 20)
        Me.GewichtTextBox.TabIndex = 23
        '
        'PictureTextBox
        '
        Me.PictureTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Picture", True))
        Me.PictureTextBox.Location = New System.Drawing.Point(486, 138)
        Me.PictureTextBox.Name = "PictureTextBox"
        Me.PictureTextBox.Size = New System.Drawing.Size(200, 20)
        Me.PictureTextBox.TabIndex = 17
        '
        'HerstellerNrComboBox
        '
        Me.HerstellerNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "HerstellerNr", True))
        Me.HerstellerNrComboBox.FormattingEnabled = True
        Me.HerstellerNrComboBox.Location = New System.Drawing.Point(486, 90)
        Me.HerstellerNrComboBox.Name = "HerstellerNrComboBox"
        Me.HerstellerNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.HerstellerNrComboBox.TabIndex = 16
        '
        'ProduktAktivCheckBox
        '
        Me.ProduktAktivCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrartikelBindingSource, "ProduktAktiv", True))
        Me.ProduktAktivCheckBox.Location = New System.Drawing.Point(721, 117)
        Me.ProduktAktivCheckBox.Name = "ProduktAktivCheckBox"
        Me.ProduktAktivCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.ProduktAktivCheckBox.TabIndex = 31
        Me.ProduktAktivCheckBox.Text = "Produkt Aktiv"
        Me.ProduktAktivCheckBox.UseVisualStyleBackColor = True
        '
        'ShopURLTextBox
        '
        Me.ShopURLTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "ShopURL", True))
        Me.ShopURLTextBox.Location = New System.Drawing.Point(486, 166)
        Me.ShopURLTextBox.Name = "ShopURLTextBox"
        Me.ShopURLTextBox.Size = New System.Drawing.Size(200, 20)
        Me.ShopURLTextBox.TabIndex = 18
        '
        'HerstellerURLTextBox
        '
        Me.HerstellerURLTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "HerstellerURL", True))
        Me.HerstellerURLTextBox.Location = New System.Drawing.Point(486, 192)
        Me.HerstellerURLTextBox.Name = "HerstellerURLTextBox"
        Me.HerstellerURLTextBox.Size = New System.Drawing.Size(200, 20)
        Me.HerstellerURLTextBox.TabIndex = 19
        '
        'ModifikationenTextBox
        '
        Me.ModifikationenTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "Modifikationen", True))
        Me.ModifikationenTextBox.Location = New System.Drawing.Point(486, 218)
        Me.ModifikationenTextBox.Name = "ModifikationenTextBox"
        Me.ModifikationenTextBox.Size = New System.Drawing.Size(200, 20)
        Me.ModifikationenTextBox.TabIndex = 20
        '
        'HerstellerRabattTextBox
        '
        Me.HerstellerRabattTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "HerstellerRabatt", True))
        Me.HerstellerRabattTextBox.Location = New System.Drawing.Point(486, 244)
        Me.HerstellerRabattTextBox.Name = "HerstellerRabattTextBox"
        Me.HerstellerRabattTextBox.Size = New System.Drawing.Size(200, 20)
        Me.HerstellerRabattTextBox.TabIndex = 21
        '
        'HerstellerRabattTextTextBox
        '
        Me.HerstellerRabattTextTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "HerstellerRabattText", True))
        Me.HerstellerRabattTextTextBox.Location = New System.Drawing.Point(486, 270)
        Me.HerstellerRabattTextTextBox.Name = "HerstellerRabattTextTextBox"
        Me.HerstellerRabattTextTextBox.Size = New System.Drawing.Size(200, 20)
        Me.HerstellerRabattTextTextBox.TabIndex = 22
        '
        'BruttoGewichtTextBox
        '
        Me.BruttoGewichtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "BruttoGewicht", True))
        Me.BruttoGewichtTextBox.Location = New System.Drawing.Point(486, 331)
        Me.BruttoGewichtTextBox.Name = "BruttoGewichtTextBox"
        Me.BruttoGewichtTextBox.Size = New System.Drawing.Size(200, 20)
        Me.BruttoGewichtTextBox.TabIndex = 24
        '
        'NettoGewichtTextBox
        '
        Me.NettoGewichtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "NettoGewicht", True))
        Me.NettoGewichtTextBox.Location = New System.Drawing.Point(486, 357)
        Me.NettoGewichtTextBox.Name = "NettoGewichtTextBox"
        Me.NettoGewichtTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NettoGewichtTextBox.TabIndex = 25
        '
        'TaraGewichtTextBox
        '
        Me.TaraGewichtTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrartikelBindingSource, "TaraGewicht", True))
        Me.TaraGewichtTextBox.Location = New System.Drawing.Point(486, 383)
        Me.TaraGewichtTextBox.Name = "TaraGewichtTextBox"
        Me.TaraGewichtTextBox.Size = New System.Drawing.Size(200, 20)
        Me.TaraGewichtTextBox.TabIndex = 26
        '
        'AngelegtAmDateTimePicker
        '
        Me.AngelegtAmDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.GrartikelBindingSource, "AngelegtAm", True))
        Me.AngelegtAmDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.AngelegtAmDateTimePicker.Location = New System.Drawing.Point(486, 409)
        Me.AngelegtAmDateTimePicker.Name = "AngelegtAmDateTimePicker"
        Me.AngelegtAmDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.AngelegtAmDateTimePicker.TabIndex = 27
        '
        'NichtBestellbarCheckBox
        '
        Me.NichtBestellbarCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrartikelBindingSource, "NichtBestellbar", True))
        Me.NichtBestellbarCheckBox.Location = New System.Drawing.Point(721, 143)
        Me.NichtBestellbarCheckBox.Name = "NichtBestellbarCheckBox"
        Me.NichtBestellbarCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.NichtBestellbarCheckBox.TabIndex = 32
        Me.NichtBestellbarCheckBox.Text = "Nicht Bestellbar"
        Me.NichtBestellbarCheckBox.UseVisualStyleBackColor = True
        '
        'ProduktAktivOnlineCheckBox
        '
        Me.ProduktAktivOnlineCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrartikelBindingSource, "ProduktAktivOnline", True))
        Me.ProduktAktivOnlineCheckBox.Location = New System.Drawing.Point(721, 173)
        Me.ProduktAktivOnlineCheckBox.Name = "ProduktAktivOnlineCheckBox"
        Me.ProduktAktivOnlineCheckBox.Size = New System.Drawing.Size(123, 20)
        Me.ProduktAktivOnlineCheckBox.TabIndex = 33
        Me.ProduktAktivOnlineCheckBox.Text = "Produkt Aktiv Online"
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 448)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(451, 13)
        Me.Label1.TabIndex = 67
        Me.Label1.Text = "alle Preise excl. MWSt.  Keine EK und VK definieren  wenn diese nach Preisliste k" & _
    "alk. werden!"
        '
        'Grartikel_kategorienTableAdapter
        '
        Me.Grartikel_kategorienTableAdapter.ClearBeforeFill = True
        '
        'Grartikel_kategorienBindingSource
        '
        Me.Grartikel_kategorienBindingSource.DataMember = "grartikel-kategorien"
        Me.Grartikel_kategorienBindingSource.DataSource = Me.DsArtikel
        '
        'Artikel
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(875, 494)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(ArtNrLabel)
        Me.Controls.Add(Me.ArtNrTextBox)
        Me.Controls.Add(EANLabel)
        Me.Controls.Add(Me.EANTextBox)
        Me.Controls.Add(BarcodeLabel)
        Me.Controls.Add(Me.BarcodeTextBox)
        Me.Controls.Add(BezeichnungLabel)
        Me.Controls.Add(Me.BezeichnungTextBox)
        Me.Controls.Add(Bezeichnung1Label)
        Me.Controls.Add(Me.Bezeichnung1TextBox)
        Me.Controls.Add(BeschreibungLabel)
        Me.Controls.Add(Me.BeschreibungTextBox)
        Me.Controls.Add(EinheitLabel)
        Me.Controls.Add(Me.EinheitComboBox)
        Me.Controls.Add(PreisATSLabel)
        Me.Controls.Add(Me.PreisATSTextBox)
        Me.Controls.Add(PreisATS_BruttoLabel)
        Me.Controls.Add(Me.PreisATS_BruttoTextBox)
        Me.Controls.Add(Me.LagerArtikelCheckBox)
        Me.Controls.Add(EKPreisLabel)
        Me.Controls.Add(Me.EKPreisTextBox)
        Me.Controls.Add(LEKPreisLabel)
        Me.Controls.Add(Me.LEKPreisTextBox)
        Me.Controls.Add(Me.SeriennummerCheckBox)
        Me.Controls.Add(LieferantNRLabel)
        Me.Controls.Add(Me.LieferantNRComboBox)
        Me.Controls.Add(SetArtikelLabel)
        Me.Controls.Add(Me.SetArtikelCheckBox)
        Me.Controls.Add(ArtKatNrLabel)
        Me.Controls.Add(Me.ArtKatNrComboBox)
        Me.Controls.Add(MWSTLabel)
        Me.Controls.Add(Me.MWSTTextBox)
        Me.Controls.Add(GewichtLabel)
        Me.Controls.Add(Me.GewichtTextBox)
        Me.Controls.Add(PictureLabel)
        Me.Controls.Add(Me.PictureTextBox)
        Me.Controls.Add(HerstellerNrLabel)
        Me.Controls.Add(Me.HerstellerNrComboBox)
        Me.Controls.Add(Me.ProduktAktivCheckBox)
        Me.Controls.Add(ShopURLLabel)
        Me.Controls.Add(Me.ShopURLTextBox)
        Me.Controls.Add(HerstellerURLLabel)
        Me.Controls.Add(Me.HerstellerURLTextBox)
        Me.Controls.Add(ModifikationenLabel)
        Me.Controls.Add(Me.ModifikationenTextBox)
        Me.Controls.Add(HerstellerRabattLabel)
        Me.Controls.Add(Me.HerstellerRabattTextBox)
        Me.Controls.Add(HerstellerRabattTextLabel)
        Me.Controls.Add(Me.HerstellerRabattTextTextBox)
        Me.Controls.Add(BruttoGewichtLabel)
        Me.Controls.Add(Me.BruttoGewichtTextBox)
        Me.Controls.Add(NettoGewichtLabel)
        Me.Controls.Add(Me.NettoGewichtTextBox)
        Me.Controls.Add(TaraGewichtLabel)
        Me.Controls.Add(Me.TaraGewichtTextBox)
        Me.Controls.Add(AngelegtAmLabel)
        Me.Controls.Add(Me.AngelegtAmDateTimePicker)
        Me.Controls.Add(Me.NichtBestellbarCheckBox)
        Me.Controls.Add(Me.ProduktAktivOnlineCheckBox)
        Me.Controls.Add(Me.GrartikelBindingNavigator)
        Me.Name = "Artikel"
        Me.Text = "Artikel"
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrartikelBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrartikelBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GrartikelBindingNavigator.ResumeLayout(False)
        Me.GrartikelBindingNavigator.PerformLayout()
        CType(Me.Grartikel_kategorienBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents GrartikelBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrartikelTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grartikelTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager
    Friend WithEvents GrartikelBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents GrartikelBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents ArtNrTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EANTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BarcodeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Bezeichnung1TextBox As System.Windows.Forms.TextBox
    Friend WithEvents BeschreibungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents EinheitComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents PreisATSTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PreisATS_BruttoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LagerArtikelCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents EKPreisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LEKPreisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SeriennummerCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents LieferantNRComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents SetArtikelCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ArtKatNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents MWSTTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GewichtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PictureTextBox As System.Windows.Forms.TextBox
    Friend WithEvents HerstellerNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents ProduktAktivCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ShopURLTextBox As System.Windows.Forms.TextBox
    Friend WithEvents HerstellerURLTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ModifikationenTextBox As System.Windows.Forms.TextBox
    Friend WithEvents HerstellerRabattTextBox As System.Windows.Forms.TextBox
    Friend WithEvents HerstellerRabattTextTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BruttoGewichtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NettoGewichtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TaraGewichtTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AngelegtAmDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents NichtBestellbarCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ProduktAktivOnlineCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Grartikel_kategorienTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grartikel_kategorienTableAdapter
    Friend WithEvents Grartikel_kategorienBindingSource As System.Windows.Forms.BindingSource
End Class
