<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ArtikelPreisregeln
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
        Dim SetArtikelLabel As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(ArtikelPreisregeln))
        Me.FilterButton = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.PreisVonTextBox = New System.Windows.Forms.TextBox()
        Me.PreisBisTextBox = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.KundengruppeComboBox = New System.Windows.Forms.ComboBox()
        Me.PreislisteComboBox = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.PreiseDataGridView = New System.Windows.Forms.DataGridView()
        Me.IdColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ArtNrColumn = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.ArtKatNrColumn = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.IDNRColumn = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.PreislisteNameColumn = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.StkAbColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.VKPreisColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AufschlagVKPreisColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AufschlagEKPreisColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DatumColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GrartikelvkpreisperselectionBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsPreise = New IntraSell_Net.dsPreise()
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.ArtikelControl = New IntraSell_Net.ArtikelControl()
        Me.AdressenControl1 = New IntraSell_Net.AdressenControl()
        Me.Label9 = New System.Windows.Forms.Label()
        Me.Label7 = New System.Windows.Forms.Label()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.LagerArtikelCheckBox = New System.Windows.Forms.CheckBox()
        Me.SeriennummerCheckBox = New System.Windows.Forms.CheckBox()
        Me.SetArtikelCheckBox = New System.Windows.Forms.CheckBox()
        Me.ProduktAktivCheckBox = New System.Windows.Forms.CheckBox()
        Me.NichtBestellbarCheckBox = New System.Windows.Forms.CheckBox()
        Me.ProduktAktivOnlineCheckBox = New System.Windows.Forms.CheckBox()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.ArtKatNrComboBox = New System.Windows.Forms.ComboBox()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.SplitContainer1 = New System.Windows.Forms.SplitContainer()
        Me.GrartikelBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.ToolStripButton1 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripLabel1 = New System.Windows.Forms.ToolStripLabel()
        Me.ToolStripButton2 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton3 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton4 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripTextBox1 = New System.Windows.Forms.ToolStripTextBox()
        Me.ToolStripSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.ToolStripButton5 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripButton6 = New System.Windows.Forms.ToolStripButton()
        Me.ToolStripSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Grartikel_vkpreisperselectionTableAdapter = New IntraSell_Net.dsPreiseTableAdapters.grartikel_vkpreisperselectionTableAdapter()
        SetArtikelLabel = New System.Windows.Forms.Label()
        CType(Me.PreiseDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrartikelvkpreisperselectionBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPreise, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer1.Panel1.SuspendLayout()
        Me.SplitContainer1.Panel2.SuspendLayout()
        Me.SplitContainer1.SuspendLayout()
        CType(Me.GrartikelBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GrartikelBindingNavigator.SuspendLayout()
        Me.SuspendLayout()
        '
        'SetArtikelLabel
        '
        SetArtikelLabel.AutoSize = True
        SetArtikelLabel.Location = New System.Drawing.Point(157, 172)
        SetArtikelLabel.Name = "SetArtikelLabel"
        SetArtikelLabel.Size = New System.Drawing.Size(0, 13)
        SetArtikelLabel.TabIndex = 70
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(25, 201)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 11
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 178)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(33, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Preis:"
        '
        'PreisVonTextBox
        '
        Me.PreisVonTextBox.Location = New System.Drawing.Point(98, 175)
        Me.PreisVonTextBox.Name = "PreisVonTextBox"
        Me.PreisVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PreisVonTextBox.TabIndex = 6
        '
        'PreisBisTextBox
        '
        Me.PreisBisTextBox.Location = New System.Drawing.Point(172, 175)
        Me.PreisBisTextBox.Name = "PreisBisTextBox"
        Me.PreisBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PreisBisTextBox.TabIndex = 7
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(156, 178)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 124)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(80, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Kundengruppe:"
        '
        'KundengruppeComboBox
        '
        Me.KundengruppeComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.KundengruppeComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.KundengruppeComboBox.FormattingEnabled = True
        Me.KundengruppeComboBox.Location = New System.Drawing.Point(98, 121)
        Me.KundengruppeComboBox.Name = "KundengruppeComboBox"
        Me.KundengruppeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.KundengruppeComboBox.TabIndex = 4
        '
        'PreislisteComboBox
        '
        Me.PreislisteComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.PreislisteComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.PreislisteComboBox.FormattingEnabled = True
        Me.PreislisteComboBox.Location = New System.Drawing.Point(98, 148)
        Me.PreislisteComboBox.Name = "PreislisteComboBox"
        Me.PreislisteComboBox.Size = New System.Drawing.Size(126, 21)
        Me.PreislisteComboBox.TabIndex = 5
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 151)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(51, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Preisliste:"
        '
        'PreiseDataGridView
        '
        Me.PreiseDataGridView.AllowUserToOrderColumns = True
        Me.PreiseDataGridView.AutoGenerateColumns = False
        Me.PreiseDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.PreiseDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.IdColumn, Me.ArtNrColumn, Me.ArtKatNrColumn, Me.IDNRColumn, Me.PreislisteNameColumn, Me.StkAbColumn, Me.VKPreisColumn, Me.AufschlagVKPreisColumn, Me.AufschlagEKPreisColumn, Me.DatumColumn})
        Me.PreiseDataGridView.DataSource = Me.GrartikelvkpreisperselectionBindingSource
        Me.PreiseDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.PreiseDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.PreiseDataGridView.Name = "PreiseDataGridView"
        Me.PreiseDataGridView.Size = New System.Drawing.Size(833, 728)
        Me.PreiseDataGridView.TabIndex = 6
        '
        'IdColumn
        '
        Me.IdColumn.DataPropertyName = "Id"
        Me.IdColumn.HeaderText = "Id"
        Me.IdColumn.Name = "IdColumn"
        Me.IdColumn.Visible = False
        '
        'ArtNrColumn
        '
        Me.ArtNrColumn.DataPropertyName = "ArtNr"
        Me.ArtNrColumn.HeaderText = "Artikel"
        Me.ArtNrColumn.Name = "ArtNrColumn"
        Me.ArtNrColumn.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.ArtNrColumn.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        '
        'ArtKatNrColumn
        '
        Me.ArtKatNrColumn.DataPropertyName = "ArtKatNr"
        Me.ArtKatNrColumn.HeaderText = "Kategorie"
        Me.ArtKatNrColumn.Name = "ArtKatNrColumn"
        Me.ArtKatNrColumn.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.ArtKatNrColumn.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        '
        'IDNRColumn
        '
        Me.IDNRColumn.DataPropertyName = "IDNR"
        Me.IDNRColumn.HeaderText = "Kunde"
        Me.IDNRColumn.Name = "IDNRColumn"
        Me.IDNRColumn.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.IDNRColumn.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        Me.IDNRColumn.Width = 150
        '
        'PreislisteNameColumn
        '
        Me.PreislisteNameColumn.DataPropertyName = "PreislisteName"
        Me.PreislisteNameColumn.HeaderText = "Preisliste"
        Me.PreislisteNameColumn.Name = "PreislisteNameColumn"
        Me.PreislisteNameColumn.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.PreislisteNameColumn.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        '
        'StkAbColumn
        '
        Me.StkAbColumn.DataPropertyName = "StkAb"
        Me.StkAbColumn.HeaderText = "Stk ab"
        Me.StkAbColumn.Name = "StkAbColumn"
        Me.StkAbColumn.Width = 75
        '
        'VKPreisColumn
        '
        Me.VKPreisColumn.DataPropertyName = "VKPreis"
        Me.VKPreisColumn.HeaderText = "VK Preis"
        Me.VKPreisColumn.Name = "VKPreisColumn"
        Me.VKPreisColumn.Width = 75
        '
        'AufschlagVKPreisColumn
        '
        Me.AufschlagVKPreisColumn.DataPropertyName = "AufschlagVKPreis"
        Me.AufschlagVKPreisColumn.HeaderText = "Aufschlag VK Preis"
        Me.AufschlagVKPreisColumn.Name = "AufschlagVKPreisColumn"
        Me.AufschlagVKPreisColumn.Width = 75
        '
        'AufschlagEKPreisColumn
        '
        Me.AufschlagEKPreisColumn.DataPropertyName = "AufschlagEKPreis"
        Me.AufschlagEKPreisColumn.HeaderText = "Aufschlag EK Preis"
        Me.AufschlagEKPreisColumn.Name = "AufschlagEKPreisColumn"
        Me.AufschlagEKPreisColumn.Width = 75
        '
        'DatumColumn
        '
        Me.DatumColumn.DataPropertyName = "Datum"
        Me.DatumColumn.HeaderText = "Datum"
        Me.DatumColumn.Name = "DatumColumn"
        '
        'GrartikelvkpreisperselectionBindingSource
        '
        Me.GrartikelvkpreisperselectionBindingSource.DataMember = "grartikel-vkpreisperselection"
        Me.GrartikelvkpreisperselectionBindingSource.DataSource = Me.DsPreise
        '
        'DsPreise
        '
        Me.DsPreise.DataSetName = "dsPreise"
        Me.DsPreise.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'SplitContainer
        '
        Me.SplitContainer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer.FixedPanel = System.Windows.Forms.FixedPanel.Panel1
        Me.SplitContainer.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.ArtikelControl)
        Me.SplitContainer.Panel1.Controls.Add(Me.AdressenControl1)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label9)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label7)
        Me.SplitContainer.Panel1.Controls.Add(Me.BezeichnungTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.LagerArtikelCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.SeriennummerCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(SetArtikelLabel)
        Me.SplitContainer.Panel1.Controls.Add(Me.SetArtikelCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.ProduktAktivCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.NichtBestellbarCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.ProduktAktivOnlineCheckBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label6)
        Me.SplitContainer.Panel1.Controls.Add(Me.ArtKatNrComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label5)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer.Panel1.Controls.Add(Me.FilterButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreislisteComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreisVonTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label4)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreisBisTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.KundengruppeComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label2)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label3)
        '
        'SplitContainer.Panel2
        '
        Me.SplitContainer.Panel2.Controls.Add(Me.SplitContainer1)
        Me.SplitContainer.Size = New System.Drawing.Size(1075, 762)
        Me.SplitContainer.SplitterDistance = 238
        Me.SplitContainer.TabIndex = 11
        '
        'ArtikelControl
        '
        Me.ArtikelControl.ArtNr = 0
        Me.ArtikelControl.Location = New System.Drawing.Point(98, 10)
        Me.ArtikelControl.Name = "ArtikelControl"
        Me.ArtikelControl.Size = New System.Drawing.Size(127, 26)
        Me.ArtikelControl.TabIndex = 0
        '
        'AdressenControl1
        '
        Me.AdressenControl1.IDNR = 0
        Me.AdressenControl1.Location = New System.Drawing.Point(98, 90)
        Me.AdressenControl1.Name = "AdressenControl1"
        Me.AdressenControl1.Size = New System.Drawing.Size(136, 25)
        Me.AdressenControl1.TabIndex = 3
        '
        'Label9
        '
        Me.Label9.AutoSize = True
        Me.Label9.Location = New System.Drawing.Point(12, 95)
        Me.Label9.Name = "Label9"
        Me.Label9.Size = New System.Drawing.Size(38, 13)
        Me.Label9.TabIndex = 77
        Me.Label9.Text = "Kunde"
        '
        'Label7
        '
        Me.Label7.AutoSize = True
        Me.Label7.Location = New System.Drawing.Point(12, 41)
        Me.Label7.Name = "Label7"
        Me.Label7.Size = New System.Drawing.Size(58, 13)
        Me.Label7.TabIndex = 76
        Me.Label7.Text = "EAN/Bez.:"
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(98, 38)
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(126, 20)
        Me.BezeichnungTextBox.TabIndex = 1
        '
        'LagerArtikelCheckBox
        '
        Me.LagerArtikelCheckBox.Checked = True
        Me.LagerArtikelCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.LagerArtikelCheckBox.Location = New System.Drawing.Point(89, 440)
        Me.LagerArtikelCheckBox.Name = "LagerArtikelCheckBox"
        Me.LagerArtikelCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.LagerArtikelCheckBox.TabIndex = 8
        Me.LagerArtikelCheckBox.Text = "Lager Artikel"
        Me.LagerArtikelCheckBox.UseVisualStyleBackColor = True
        Me.LagerArtikelCheckBox.Visible = False
        '
        'SeriennummerCheckBox
        '
        Me.SeriennummerCheckBox.Checked = True
        Me.SeriennummerCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.SeriennummerCheckBox.Location = New System.Drawing.Point(89, 468)
        Me.SeriennummerCheckBox.Name = "SeriennummerCheckBox"
        Me.SeriennummerCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.SeriennummerCheckBox.TabIndex = 9
        Me.SeriennummerCheckBox.Text = "Seriennummer erford."
        Me.SeriennummerCheckBox.UseVisualStyleBackColor = True
        Me.SeriennummerCheckBox.Visible = False
        '
        'SetArtikelCheckBox
        '
        Me.SetArtikelCheckBox.Checked = True
        Me.SetArtikelCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.SetArtikelCheckBox.Location = New System.Drawing.Point(89, 494)
        Me.SetArtikelCheckBox.Name = "SetArtikelCheckBox"
        Me.SetArtikelCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.SetArtikelCheckBox.TabIndex = 10
        Me.SetArtikelCheckBox.Text = "Set Artikel"
        Me.SetArtikelCheckBox.UseVisualStyleBackColor = True
        Me.SetArtikelCheckBox.Visible = False
        '
        'ProduktAktivCheckBox
        '
        Me.ProduktAktivCheckBox.Checked = True
        Me.ProduktAktivCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.ProduktAktivCheckBox.Location = New System.Drawing.Point(89, 521)
        Me.ProduktAktivCheckBox.Name = "ProduktAktivCheckBox"
        Me.ProduktAktivCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.ProduktAktivCheckBox.TabIndex = 11
        Me.ProduktAktivCheckBox.Text = "Produkt Aktiv"
        Me.ProduktAktivCheckBox.UseVisualStyleBackColor = True
        Me.ProduktAktivCheckBox.Visible = False
        '
        'NichtBestellbarCheckBox
        '
        Me.NichtBestellbarCheckBox.Checked = True
        Me.NichtBestellbarCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.NichtBestellbarCheckBox.Location = New System.Drawing.Point(89, 547)
        Me.NichtBestellbarCheckBox.Name = "NichtBestellbarCheckBox"
        Me.NichtBestellbarCheckBox.Size = New System.Drawing.Size(123, 24)
        Me.NichtBestellbarCheckBox.TabIndex = 12
        Me.NichtBestellbarCheckBox.Text = "Nicht Bestellbar"
        Me.NichtBestellbarCheckBox.UseVisualStyleBackColor = True
        Me.NichtBestellbarCheckBox.Visible = False
        '
        'ProduktAktivOnlineCheckBox
        '
        Me.ProduktAktivOnlineCheckBox.Checked = True
        Me.ProduktAktivOnlineCheckBox.CheckState = System.Windows.Forms.CheckState.Indeterminate
        Me.ProduktAktivOnlineCheckBox.Location = New System.Drawing.Point(89, 577)
        Me.ProduktAktivOnlineCheckBox.Name = "ProduktAktivOnlineCheckBox"
        Me.ProduktAktivOnlineCheckBox.Size = New System.Drawing.Size(123, 20)
        Me.ProduktAktivOnlineCheckBox.TabIndex = 13
        Me.ProduktAktivOnlineCheckBox.Text = "Produkt Aktiv Online"
        Me.ProduktAktivOnlineCheckBox.Visible = False
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(12, 15)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(34, 13)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "ArtNr:"
        '
        'ArtKatNrComboBox
        '
        Me.ArtKatNrComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.ArtKatNrComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.ArtKatNrComboBox.FormattingEnabled = True
        Me.ArtKatNrComboBox.Location = New System.Drawing.Point(98, 64)
        Me.ArtKatNrComboBox.Name = "ArtKatNrComboBox"
        Me.ArtKatNrComboBox.Size = New System.Drawing.Size(126, 21)
        Me.ArtKatNrComboBox.TabIndex = 2
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 67)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(55, 13)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Kategorie:"
        '
        'SplitContainer1
        '
        Me.SplitContainer1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer1.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer1.Name = "SplitContainer1"
        Me.SplitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal
        '
        'SplitContainer1.Panel1
        '
        Me.SplitContainer1.Panel1.Controls.Add(Me.GrartikelBindingNavigator)
        '
        'SplitContainer1.Panel2
        '
        Me.SplitContainer1.Panel2.Controls.Add(Me.PreiseDataGridView)
        Me.SplitContainer1.Size = New System.Drawing.Size(833, 762)
        Me.SplitContainer1.SplitterDistance = 30
        Me.SplitContainer1.TabIndex = 14
        '
        'GrartikelBindingNavigator
        '
        Me.GrartikelBindingNavigator.AddNewItem = Me.ToolStripButton1
        Me.GrartikelBindingNavigator.BindingSource = Me.GrartikelvkpreisperselectionBindingSource
        Me.GrartikelBindingNavigator.CountItem = Me.ToolStripLabel1
        Me.GrartikelBindingNavigator.DeleteItem = Me.ToolStripButton2
        Me.GrartikelBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ToolStripButton3, Me.ToolStripButton4, Me.ToolStripSeparator1, Me.ToolStripTextBox1, Me.ToolStripLabel1, Me.ToolStripSeparator2, Me.ToolStripButton5, Me.ToolStripButton6, Me.ToolStripSeparator3, Me.ToolStripButton1, Me.ToolStripButton2, Me.BindingNavigatorSaveItem})
        Me.GrartikelBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.GrartikelBindingNavigator.MoveFirstItem = Me.ToolStripButton3
        Me.GrartikelBindingNavigator.MoveLastItem = Me.ToolStripButton6
        Me.GrartikelBindingNavigator.MoveNextItem = Me.ToolStripButton5
        Me.GrartikelBindingNavigator.MovePreviousItem = Me.ToolStripButton4
        Me.GrartikelBindingNavigator.Name = "GrartikelBindingNavigator"
        Me.GrartikelBindingNavigator.PositionItem = Me.ToolStripTextBox1
        Me.GrartikelBindingNavigator.Size = New System.Drawing.Size(833, 25)
        Me.GrartikelBindingNavigator.TabIndex = 13
        Me.GrartikelBindingNavigator.Text = "BindingNavigator1"
        '
        'ToolStripButton1
        '
        Me.ToolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton1.Image = CType(resources.GetObject("ToolStripButton1.Image"), System.Drawing.Image)
        Me.ToolStripButton1.Name = "ToolStripButton1"
        Me.ToolStripButton1.RightToLeftAutoMirrorImage = True
        Me.ToolStripButton1.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton1.Text = "Add new"
        '
        'ToolStripLabel1
        '
        Me.ToolStripLabel1.Name = "ToolStripLabel1"
        Me.ToolStripLabel1.Size = New System.Drawing.Size(35, 22)
        Me.ToolStripLabel1.Text = "of {0}"
        Me.ToolStripLabel1.ToolTipText = "Total number of items"
        '
        'ToolStripButton2
        '
        Me.ToolStripButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton2.Image = CType(resources.GetObject("ToolStripButton2.Image"), System.Drawing.Image)
        Me.ToolStripButton2.Name = "ToolStripButton2"
        Me.ToolStripButton2.RightToLeftAutoMirrorImage = True
        Me.ToolStripButton2.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton2.Text = "Delete"
        '
        'ToolStripButton3
        '
        Me.ToolStripButton3.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton3.Image = CType(resources.GetObject("ToolStripButton3.Image"), System.Drawing.Image)
        Me.ToolStripButton3.Name = "ToolStripButton3"
        Me.ToolStripButton3.RightToLeftAutoMirrorImage = True
        Me.ToolStripButton3.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton3.Text = "Move first"
        '
        'ToolStripButton4
        '
        Me.ToolStripButton4.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton4.Image = CType(resources.GetObject("ToolStripButton4.Image"), System.Drawing.Image)
        Me.ToolStripButton4.Name = "ToolStripButton4"
        Me.ToolStripButton4.RightToLeftAutoMirrorImage = True
        Me.ToolStripButton4.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton4.Text = "Move previous"
        '
        'ToolStripSeparator1
        '
        Me.ToolStripSeparator1.Name = "ToolStripSeparator1"
        Me.ToolStripSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'ToolStripTextBox1
        '
        Me.ToolStripTextBox1.AccessibleName = "Position"
        Me.ToolStripTextBox1.AutoSize = False
        Me.ToolStripTextBox1.Name = "ToolStripTextBox1"
        Me.ToolStripTextBox1.Size = New System.Drawing.Size(50, 23)
        Me.ToolStripTextBox1.Text = "0"
        Me.ToolStripTextBox1.ToolTipText = "Current position"
        '
        'ToolStripSeparator2
        '
        Me.ToolStripSeparator2.Name = "ToolStripSeparator2"
        Me.ToolStripSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'ToolStripButton5
        '
        Me.ToolStripButton5.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton5.Image = CType(resources.GetObject("ToolStripButton5.Image"), System.Drawing.Image)
        Me.ToolStripButton5.Name = "ToolStripButton5"
        Me.ToolStripButton5.RightToLeftAutoMirrorImage = True
        Me.ToolStripButton5.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton5.Text = "Move next"
        '
        'ToolStripButton6
        '
        Me.ToolStripButton6.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ToolStripButton6.Image = CType(resources.GetObject("ToolStripButton6.Image"), System.Drawing.Image)
        Me.ToolStripButton6.Name = "ToolStripButton6"
        Me.ToolStripButton6.RightToLeftAutoMirrorImage = True
        Me.ToolStripButton6.Size = New System.Drawing.Size(23, 22)
        Me.ToolStripButton6.Text = "Move last"
        '
        'ToolStripSeparator3
        '
        Me.ToolStripSeparator3.Name = "ToolStripSeparator3"
        Me.ToolStripSeparator3.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorSaveItem
        '
        Me.BindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorSaveItem.Image = CType(resources.GetObject("BindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorSaveItem.Name = "BindingNavigatorSaveItem"
        Me.BindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorSaveItem.Text = "Save Data"
        '
        'Grartikel_vkpreisperselectionTableAdapter
        '
        Me.Grartikel_vkpreisperselectionTableAdapter.ClearBeforeFill = True
        '
        'ArtikelPreisregeln
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1075, 762)
        Me.Controls.Add(Me.SplitContainer)
        Me.Name = "ArtikelPreisregeln"
        Me.Text = "Preisregeln"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.PreiseDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrartikelvkpreisperselectionBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPreise, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.Panel1.ResumeLayout(False)
        Me.SplitContainer.Panel1.PerformLayout()
        Me.SplitContainer.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.ResumeLayout(False)
        Me.SplitContainer1.Panel1.ResumeLayout(False)
        Me.SplitContainer1.Panel1.PerformLayout()
        Me.SplitContainer1.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer1.ResumeLayout(False)
        CType(Me.GrartikelBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GrartikelBindingNavigator.ResumeLayout(False)
        Me.GrartikelBindingNavigator.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents FilterButton As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents PreisVonTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PreisBisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents KundengruppeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents PreislisteComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents PreiseDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
    Friend WithEvents ArtKatNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents LagerArtikelCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents SeriennummerCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents SetArtikelCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ProduktAktivCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents NichtBestellbarCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ProduktAktivOnlineCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents Label7 As System.Windows.Forms.Label
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents DsPreise As IntraSell_Net.dsPreise
    Friend WithEvents GrartikelvkpreisperselectionBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Grartikel_vkpreisperselectionTableAdapter As IntraSell_Net.dsPreiseTableAdapters.grartikel_vkpreisperselectionTableAdapter
    Friend WithEvents GrartikelBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents ToolStripButton1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripLabel1 As System.Windows.Forms.ToolStripLabel
    Friend WithEvents ToolStripButton2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton3 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton4 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ToolStripTextBox1 As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents ToolStripSeparator2 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents ToolStripButton5 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripButton6 As System.Windows.Forms.ToolStripButton
    Friend WithEvents ToolStripSeparator3 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents SplitContainer1 As System.Windows.Forms.SplitContainer
    Friend WithEvents AdressenControl1 As IntraSell_Net.AdressenControl
    Friend WithEvents Label9 As System.Windows.Forms.Label
    Friend WithEvents IdColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ArtNrColumn As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents ArtKatNrColumn As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents IDNRColumn As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents PreislisteNameColumn As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents StkAbColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents VKPreisColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AufschlagVKPreisColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AufschlagEKPreisColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DatumColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ArtikelControl As IntraSell_Net.ArtikelControl
End Class
