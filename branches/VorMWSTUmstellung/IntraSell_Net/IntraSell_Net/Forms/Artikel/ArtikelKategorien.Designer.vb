<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ArtikelKategorien
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
        Dim ArtKatNrLabel As System.Windows.Forms.Label
        Dim NameLabel As System.Windows.Forms.Label
        Dim ArtKatNrParentLabel As System.Windows.Forms.Label
        Dim DescLabel As System.Windows.Forms.Label
        Dim TemplateLabel As System.Windows.Forms.Label
        Dim AufschlagLabel As System.Windows.Forms.Label
        Dim GewinnReferenzLabel As System.Windows.Forms.Label
        Dim StylesheetLabel As System.Windows.Forms.Label
        Dim PictureLabel As System.Windows.Forms.Label
        Dim TemplateForProductLabel As System.Windows.Forms.Label
        Dim OrderLabel As System.Windows.Forms.Label
        Dim LandLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(ArtikelKategorien))
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.Grartikel_kategorienBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Grartikel_kategorienTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grartikel_kategorienTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager()
        Me.Grartikel_kategorienBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.Grartikel_kategorienBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.ArtKatNrTextBox = New System.Windows.Forms.TextBox()
        Me.NameTextBox = New System.Windows.Forms.TextBox()
        Me.ArtKatNrParentTextBox = New System.Windows.Forms.TextBox()
        Me.DescTextBox = New System.Windows.Forms.TextBox()
        Me.TemplateTextBox = New System.Windows.Forms.TextBox()
        Me.AufschlagTextBox = New System.Windows.Forms.TextBox()
        Me.GewinnReferenzTextBox = New System.Windows.Forms.TextBox()
        Me.StylesheetTextBox = New System.Windows.Forms.TextBox()
        Me.PictureTextBox = New System.Windows.Forms.TextBox()
        Me.TemplateForProductTextBox = New System.Windows.Forms.TextBox()
        Me.OrderTextBox = New System.Windows.Forms.TextBox()
        Me.LandTextBox = New System.Windows.Forms.TextBox()
        ArtKatNrLabel = New System.Windows.Forms.Label()
        NameLabel = New System.Windows.Forms.Label()
        ArtKatNrParentLabel = New System.Windows.Forms.Label()
        DescLabel = New System.Windows.Forms.Label()
        TemplateLabel = New System.Windows.Forms.Label()
        AufschlagLabel = New System.Windows.Forms.Label()
        GewinnReferenzLabel = New System.Windows.Forms.Label()
        StylesheetLabel = New System.Windows.Forms.Label()
        PictureLabel = New System.Windows.Forms.Label()
        TemplateForProductLabel = New System.Windows.Forms.Label()
        OrderLabel = New System.Windows.Forms.Label()
        LandLabel = New System.Windows.Forms.Label()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Grartikel_kategorienBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Grartikel_kategorienBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Grartikel_kategorienBindingNavigator.SuspendLayout()
        Me.SuspendLayout()
        '
        'ArtKatNrLabel
        '
        ArtKatNrLabel.AutoSize = True
        ArtKatNrLabel.Location = New System.Drawing.Point(2, 41)
        ArtKatNrLabel.Name = "ArtKatNrLabel"
        ArtKatNrLabel.Size = New System.Drawing.Size(56, 13)
        ArtKatNrLabel.TabIndex = 1
        ArtKatNrLabel.Text = "Art Kat Nr:"
        '
        'NameLabel
        '
        NameLabel.AutoSize = True
        NameLabel.Location = New System.Drawing.Point(2, 67)
        NameLabel.Name = "NameLabel"
        NameLabel.Size = New System.Drawing.Size(38, 13)
        NameLabel.TabIndex = 3
        NameLabel.Text = "Name:"
        '
        'ArtKatNrParentLabel
        '
        ArtKatNrParentLabel.AutoSize = True
        ArtKatNrParentLabel.Location = New System.Drawing.Point(2, 93)
        ArtKatNrParentLabel.Name = "ArtKatNrParentLabel"
        ArtKatNrParentLabel.Size = New System.Drawing.Size(90, 13)
        ArtKatNrParentLabel.TabIndex = 5
        ArtKatNrParentLabel.Text = "Art Kat Nr Parent:"
        '
        'DescLabel
        '
        DescLabel.AutoSize = True
        DescLabel.Location = New System.Drawing.Point(2, 119)
        DescLabel.Name = "DescLabel"
        DescLabel.Size = New System.Drawing.Size(35, 13)
        DescLabel.TabIndex = 7
        DescLabel.Text = "Desc:"
        '
        'TemplateLabel
        '
        TemplateLabel.AutoSize = True
        TemplateLabel.Location = New System.Drawing.Point(2, 145)
        TemplateLabel.Name = "TemplateLabel"
        TemplateLabel.Size = New System.Drawing.Size(54, 13)
        TemplateLabel.TabIndex = 9
        TemplateLabel.Text = "Template:"
        '
        'AufschlagLabel
        '
        AufschlagLabel.AutoSize = True
        AufschlagLabel.Location = New System.Drawing.Point(2, 171)
        AufschlagLabel.Name = "AufschlagLabel"
        AufschlagLabel.Size = New System.Drawing.Size(57, 13)
        AufschlagLabel.TabIndex = 11
        AufschlagLabel.Text = "Aufschlag:"
        '
        'GewinnReferenzLabel
        '
        GewinnReferenzLabel.AutoSize = True
        GewinnReferenzLabel.Location = New System.Drawing.Point(2, 197)
        GewinnReferenzLabel.Name = "GewinnReferenzLabel"
        GewinnReferenzLabel.Size = New System.Drawing.Size(92, 13)
        GewinnReferenzLabel.TabIndex = 13
        GewinnReferenzLabel.Text = "Gewinn Referenz:"
        '
        'StylesheetLabel
        '
        StylesheetLabel.AutoSize = True
        StylesheetLabel.Location = New System.Drawing.Point(2, 223)
        StylesheetLabel.Name = "StylesheetLabel"
        StylesheetLabel.Size = New System.Drawing.Size(59, 13)
        StylesheetLabel.TabIndex = 15
        StylesheetLabel.Text = "Stylesheet:"
        '
        'PictureLabel
        '
        PictureLabel.AutoSize = True
        PictureLabel.Location = New System.Drawing.Point(2, 249)
        PictureLabel.Name = "PictureLabel"
        PictureLabel.Size = New System.Drawing.Size(43, 13)
        PictureLabel.TabIndex = 17
        PictureLabel.Text = "Picture:"
        '
        'TemplateForProductLabel
        '
        TemplateForProductLabel.AutoSize = True
        TemplateForProductLabel.Location = New System.Drawing.Point(2, 275)
        TemplateForProductLabel.Name = "TemplateForProductLabel"
        TemplateForProductLabel.Size = New System.Drawing.Size(112, 13)
        TemplateForProductLabel.TabIndex = 19
        TemplateForProductLabel.Text = "Template For Product:"
        '
        'OrderLabel
        '
        OrderLabel.AutoSize = True
        OrderLabel.Location = New System.Drawing.Point(2, 301)
        OrderLabel.Name = "OrderLabel"
        OrderLabel.Size = New System.Drawing.Size(36, 13)
        OrderLabel.TabIndex = 21
        OrderLabel.Text = "Order:"
        '
        'LandLabel
        '
        LandLabel.AutoSize = True
        LandLabel.Location = New System.Drawing.Point(2, 327)
        LandLabel.Name = "LandLabel"
        LandLabel.Size = New System.Drawing.Size(34, 13)
        LandLabel.TabIndex = 23
        LandLabel.Text = "Land:"
        '
        'DsArtikel
        '
        Me.DsArtikel.DataSetName = "dsArtikel"
        Me.DsArtikel.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Grartikel_kategorienBindingSource
        '
        Me.Grartikel_kategorienBindingSource.DataMember = "grartikel-kategorien"
        Me.Grartikel_kategorienBindingSource.DataSource = Me.DsArtikel
        '
        'Grartikel_kategorienTableAdapter
        '
        Me.Grartikel_kategorienTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grartikel_einheitenTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_htmlinfoTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_itemtrackinghistoryTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_kategorien_verwandteTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_kategorienTableAdapter = Me.Grartikel_kategorienTableAdapter
        Me.TableAdapterManager.grartikel_keywordsTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_keywordstoproductsTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_staffelpreiseTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_vertriebskostenTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_verwandteartikelTableAdapter = Nothing
        Me.TableAdapterManager.grartikel_vkpreisperselectionTableAdapter = Nothing
        Me.TableAdapterManager.grartikelTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Grartikel_kategorienBindingNavigator
        '
        Me.Grartikel_kategorienBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Grartikel_kategorienBindingNavigator.BindingSource = Me.Grartikel_kategorienBindingSource
        Me.Grartikel_kategorienBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Grartikel_kategorienBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Grartikel_kategorienBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Grartikel_kategorienBindingNavigatorSaveItem})
        Me.Grartikel_kategorienBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Grartikel_kategorienBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Grartikel_kategorienBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Grartikel_kategorienBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Grartikel_kategorienBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Grartikel_kategorienBindingNavigator.Name = "Grartikel_kategorienBindingNavigator"
        Me.Grartikel_kategorienBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Grartikel_kategorienBindingNavigator.Size = New System.Drawing.Size(524, 25)
        Me.Grartikel_kategorienBindingNavigator.TabIndex = 0
        Me.Grartikel_kategorienBindingNavigator.Text = "BindingNavigator1"
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
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 21)
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
        'Grartikel_kategorienBindingNavigatorSaveItem
        '
        Me.Grartikel_kategorienBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Grartikel_kategorienBindingNavigatorSaveItem.Image = CType(resources.GetObject("Grartikel_kategorienBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Grartikel_kategorienBindingNavigatorSaveItem.Name = "Grartikel_kategorienBindingNavigatorSaveItem"
        Me.Grartikel_kategorienBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Grartikel_kategorienBindingNavigatorSaveItem.Text = "Save Data"
        '
        'ArtKatNrTextBox
        '
        Me.ArtKatNrTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "ArtKatNr", True))
        Me.ArtKatNrTextBox.Location = New System.Drawing.Point(120, 38)
        Me.ArtKatNrTextBox.Name = "ArtKatNrTextBox"
        Me.ArtKatNrTextBox.Size = New System.Drawing.Size(221, 20)
        Me.ArtKatNrTextBox.TabIndex = 2
        '
        'NameTextBox
        '
        Me.NameTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Name", True))
        Me.NameTextBox.Location = New System.Drawing.Point(120, 64)
        Me.NameTextBox.Name = "NameTextBox"
        Me.NameTextBox.Size = New System.Drawing.Size(221, 20)
        Me.NameTextBox.TabIndex = 4
        '
        'ArtKatNrParentTextBox
        '
        Me.ArtKatNrParentTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "ArtKatNrParent", True))
        Me.ArtKatNrParentTextBox.Location = New System.Drawing.Point(120, 90)
        Me.ArtKatNrParentTextBox.Name = "ArtKatNrParentTextBox"
        Me.ArtKatNrParentTextBox.Size = New System.Drawing.Size(221, 20)
        Me.ArtKatNrParentTextBox.TabIndex = 6
        '
        'DescTextBox
        '
        Me.DescTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Desc", True))
        Me.DescTextBox.Location = New System.Drawing.Point(120, 116)
        Me.DescTextBox.Name = "DescTextBox"
        Me.DescTextBox.Size = New System.Drawing.Size(221, 20)
        Me.DescTextBox.TabIndex = 8
        '
        'TemplateTextBox
        '
        Me.TemplateTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Template", True))
        Me.TemplateTextBox.Location = New System.Drawing.Point(120, 142)
        Me.TemplateTextBox.Multiline = True
        Me.TemplateTextBox.Name = "TemplateTextBox"
        Me.TemplateTextBox.Size = New System.Drawing.Size(221, 20)
        Me.TemplateTextBox.TabIndex = 10
        '
        'AufschlagTextBox
        '
        Me.AufschlagTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Aufschlag", True))
        Me.AufschlagTextBox.Location = New System.Drawing.Point(120, 168)
        Me.AufschlagTextBox.Name = "AufschlagTextBox"
        Me.AufschlagTextBox.Size = New System.Drawing.Size(221, 20)
        Me.AufschlagTextBox.TabIndex = 12
        '
        'GewinnReferenzTextBox
        '
        Me.GewinnReferenzTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "GewinnReferenz", True))
        Me.GewinnReferenzTextBox.Location = New System.Drawing.Point(120, 194)
        Me.GewinnReferenzTextBox.Name = "GewinnReferenzTextBox"
        Me.GewinnReferenzTextBox.Size = New System.Drawing.Size(221, 20)
        Me.GewinnReferenzTextBox.TabIndex = 14
        '
        'StylesheetTextBox
        '
        Me.StylesheetTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Stylesheet", True))
        Me.StylesheetTextBox.Location = New System.Drawing.Point(120, 220)
        Me.StylesheetTextBox.Name = "StylesheetTextBox"
        Me.StylesheetTextBox.Size = New System.Drawing.Size(221, 20)
        Me.StylesheetTextBox.TabIndex = 16
        '
        'PictureTextBox
        '
        Me.PictureTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Picture", True))
        Me.PictureTextBox.Location = New System.Drawing.Point(120, 246)
        Me.PictureTextBox.Name = "PictureTextBox"
        Me.PictureTextBox.Size = New System.Drawing.Size(221, 20)
        Me.PictureTextBox.TabIndex = 18
        '
        'TemplateForProductTextBox
        '
        Me.TemplateForProductTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "TemplateForProduct", True))
        Me.TemplateForProductTextBox.Location = New System.Drawing.Point(120, 272)
        Me.TemplateForProductTextBox.Multiline = True
        Me.TemplateForProductTextBox.Name = "TemplateForProductTextBox"
        Me.TemplateForProductTextBox.Size = New System.Drawing.Size(221, 20)
        Me.TemplateForProductTextBox.TabIndex = 20
        '
        'OrderTextBox
        '
        Me.OrderTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Order", True))
        Me.OrderTextBox.Location = New System.Drawing.Point(120, 298)
        Me.OrderTextBox.Name = "OrderTextBox"
        Me.OrderTextBox.Size = New System.Drawing.Size(221, 20)
        Me.OrderTextBox.TabIndex = 22
        '
        'LandTextBox
        '
        Me.LandTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Grartikel_kategorienBindingSource, "Land", True))
        Me.LandTextBox.Location = New System.Drawing.Point(120, 324)
        Me.LandTextBox.Name = "LandTextBox"
        Me.LandTextBox.Size = New System.Drawing.Size(221, 20)
        Me.LandTextBox.TabIndex = 24
        '
        'ArtikelKategorien
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(524, 373)
        Me.Controls.Add(ArtKatNrLabel)
        Me.Controls.Add(Me.ArtKatNrTextBox)
        Me.Controls.Add(NameLabel)
        Me.Controls.Add(Me.NameTextBox)
        Me.Controls.Add(ArtKatNrParentLabel)
        Me.Controls.Add(Me.ArtKatNrParentTextBox)
        Me.Controls.Add(DescLabel)
        Me.Controls.Add(Me.DescTextBox)
        Me.Controls.Add(TemplateLabel)
        Me.Controls.Add(Me.TemplateTextBox)
        Me.Controls.Add(AufschlagLabel)
        Me.Controls.Add(Me.AufschlagTextBox)
        Me.Controls.Add(GewinnReferenzLabel)
        Me.Controls.Add(Me.GewinnReferenzTextBox)
        Me.Controls.Add(StylesheetLabel)
        Me.Controls.Add(Me.StylesheetTextBox)
        Me.Controls.Add(PictureLabel)
        Me.Controls.Add(Me.PictureTextBox)
        Me.Controls.Add(TemplateForProductLabel)
        Me.Controls.Add(Me.TemplateForProductTextBox)
        Me.Controls.Add(OrderLabel)
        Me.Controls.Add(Me.OrderTextBox)
        Me.Controls.Add(LandLabel)
        Me.Controls.Add(Me.LandTextBox)
        Me.Controls.Add(Me.Grartikel_kategorienBindingNavigator)
        Me.Name = "ArtikelKategorien"
        Me.Text = "Artikel Kategorien"
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Grartikel_kategorienBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Grartikel_kategorienBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Grartikel_kategorienBindingNavigator.ResumeLayout(False)
        Me.Grartikel_kategorienBindingNavigator.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents Grartikel_kategorienBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Grartikel_kategorienTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grartikel_kategorienTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager
    Friend WithEvents Grartikel_kategorienBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents Grartikel_kategorienBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents ArtKatNrTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NameTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ArtKatNrParentTextBox As System.Windows.Forms.TextBox
    Friend WithEvents DescTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TemplateTextBox As System.Windows.Forms.TextBox
    Friend WithEvents AufschlagTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GewinnReferenzTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StylesheetTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PictureTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TemplateForProductTextBox As System.Windows.Forms.TextBox
    Friend WithEvents OrderTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LandTextBox As System.Windows.Forms.TextBox
End Class
