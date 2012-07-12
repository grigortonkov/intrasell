<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Rechnung
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Rechnung))
        Dim NummerLabel As System.Windows.Forms.Label
        Dim TypLabel As System.Windows.Forms.Label
        Dim KundNrLabel As System.Windows.Forms.Label
        Dim DatumLabel As System.Windows.Forms.Label
        Dim NotizLabel As System.Windows.Forms.Label
        Dim NotizInternLabel As System.Windows.Forms.Label
        Dim NotizExternLabel As System.Windows.Forms.Label
        Dim SummeLabel As System.Windows.Forms.Label
        Dim BezahltLabel As System.Windows.Forms.Label
        Dim AusgedrucktLabel As System.Windows.Forms.Label
        Dim AbgeschlossenLabel As System.Windows.Forms.Label
        Dim ZahlungsbedungungLabel As System.Windows.Forms.Label
        Dim TransportMethodeLabel As System.Windows.Forms.Label
        Dim ZahlungsMethodeLabel As System.Windows.Forms.Label
        Dim WoherLabel As System.Windows.Forms.Label
        Dim WohinLabel As System.Windows.Forms.Label
        Dim StatusLabel As System.Windows.Forms.Label
        Dim SummeMWSTLabel As System.Windows.Forms.Label
        Dim SummeBruttoLabel As System.Windows.Forms.Label
        Dim LieferantNrLabel As System.Windows.Forms.Label
        Dim MitarbeiterNrLabel As System.Windows.Forms.Label
        Dim KundNr2Label As System.Windows.Forms.Label
        Dim WaehrungLabel As System.Windows.Forms.Label
        Dim ErstelltAmLabel As System.Windows.Forms.Label
        Me.DsVorgaenge = New IntraSell_Net.dsVorgaenge()
        Me.BuchvorgangBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.BuchvorgangTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager()
        Me.BuchvorgangBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.BuchvorgangBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.KundNrComboBox = New System.Windows.Forms.ComboBox()
        Me.DatumDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.NotizTextBox = New System.Windows.Forms.TextBox()
        Me.NotizInternTextBox = New System.Windows.Forms.TextBox()
        Me.NotizExternTextBox = New System.Windows.Forms.TextBox()
        Me.SummeTextBox = New System.Windows.Forms.TextBox()
        Me.BezahltCheckBox = New System.Windows.Forms.CheckBox()
        Me.AusgedrucktCheckBox = New System.Windows.Forms.CheckBox()
        Me.AbgeschlossenCheckBox = New System.Windows.Forms.CheckBox()
        Me.ZahlungsbedungungTextBox = New System.Windows.Forms.TextBox()
        Me.TransportMethodeTextBox = New System.Windows.Forms.TextBox()
        Me.ZahlungsMethodeTextBox = New System.Windows.Forms.TextBox()
        Me.WoherTextBox = New System.Windows.Forms.TextBox()
        Me.WohinTextBox = New System.Windows.Forms.TextBox()
        Me.StatusComboBox = New System.Windows.Forms.ComboBox()
        Me.SummeMWSTTextBox = New System.Windows.Forms.TextBox()
        Me.SummeBruttoTextBox = New System.Windows.Forms.TextBox()
        Me.LieferantNrComboBox = New System.Windows.Forms.ComboBox()
        Me.MitarbeiterNrComboBox = New System.Windows.Forms.ComboBox()
        Me.KundNr2ComboBox = New System.Windows.Forms.ComboBox()
        Me.WaehrungTextBox = New System.Windows.Forms.TextBox()
        Me.Buchvorgang_artikelBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Buchvorgang_artikelTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgang_artikelTableAdapter()
        Me.Buchvorgang_artikelDataGridView = New System.Windows.Forms.DataGridView()
        Me.ErstelltAmDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
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
        NummerLabel = New System.Windows.Forms.Label()
        TypLabel = New System.Windows.Forms.Label()
        KundNrLabel = New System.Windows.Forms.Label()
        DatumLabel = New System.Windows.Forms.Label()
        NotizLabel = New System.Windows.Forms.Label()
        NotizInternLabel = New System.Windows.Forms.Label()
        NotizExternLabel = New System.Windows.Forms.Label()
        SummeLabel = New System.Windows.Forms.Label()
        BezahltLabel = New System.Windows.Forms.Label()
        AusgedrucktLabel = New System.Windows.Forms.Label()
        AbgeschlossenLabel = New System.Windows.Forms.Label()
        ZahlungsbedungungLabel = New System.Windows.Forms.Label()
        TransportMethodeLabel = New System.Windows.Forms.Label()
        ZahlungsMethodeLabel = New System.Windows.Forms.Label()
        WoherLabel = New System.Windows.Forms.Label()
        WohinLabel = New System.Windows.Forms.Label()
        StatusLabel = New System.Windows.Forms.Label()
        SummeMWSTLabel = New System.Windows.Forms.Label()
        SummeBruttoLabel = New System.Windows.Forms.Label()
        LieferantNrLabel = New System.Windows.Forms.Label()
        MitarbeiterNrLabel = New System.Windows.Forms.Label()
        KundNr2Label = New System.Windows.Forms.Label()
        WaehrungLabel = New System.Windows.Forms.Label()
        ErstelltAmLabel = New System.Windows.Forms.Label()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BuchvorgangBindingNavigator.SuspendLayout()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
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
        Me.TableAdapterManager.buchrech_artikelTableAdapter = Nothing
        Me.TableAdapterManager.buchrechnungTableAdapter = Nothing
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
        'BuchvorgangBindingNavigator
        '
        Me.BuchvorgangBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.BuchvorgangBindingNavigator.BindingSource = Me.BuchvorgangBindingSource
        Me.BuchvorgangBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.BuchvorgangBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.BuchvorgangBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.BuchvorgangBindingNavigatorSaveItem})
        Me.BuchvorgangBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.BuchvorgangBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.BuchvorgangBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.BuchvorgangBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.BuchvorgangBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.BuchvorgangBindingNavigator.Name = "BuchvorgangBindingNavigator"
        Me.BuchvorgangBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.BuchvorgangBindingNavigator.Size = New System.Drawing.Size(1036, 25)
        Me.BuchvorgangBindingNavigator.TabIndex = 0
        Me.BuchvorgangBindingNavigator.Text = "BindingNavigator1"
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
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(35, 15)
        Me.BindingNavigatorCountItem.Text = "of {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 6)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 20)
        Me.BindingNavigatorMoveNextItem.Text = "Move next"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 20)
        Me.BindingNavigatorMoveLastItem.Text = "Move last"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 6)
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
        'BindingNavigatorDeleteItem
        '
        Me.BindingNavigatorDeleteItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem.Image = CType(resources.GetObject("BindingNavigatorDeleteItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 20)
        Me.BindingNavigatorDeleteItem.Text = "Delete"
        '
        'BuchvorgangBindingNavigatorSaveItem
        '
        Me.BuchvorgangBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BuchvorgangBindingNavigatorSaveItem.Image = CType(resources.GetObject("BuchvorgangBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.BuchvorgangBindingNavigatorSaveItem.Name = "BuchvorgangBindingNavigatorSaveItem"
        Me.BuchvorgangBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 23)
        Me.BuchvorgangBindingNavigatorSaveItem.Text = "Save Data"
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Location = New System.Drawing.Point(35, 27)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(49, 13)
        NummerLabel.TabIndex = 1
        NummerLabel.Text = "Nummer:"
        '
        'NummerTextBox
        '
        Me.NummerTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Nummer", True))
        Me.NummerTextBox.Location = New System.Drawing.Point(149, 24)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NummerTextBox.TabIndex = 2
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(35, 53)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 3
        TypLabel.Text = "Typ:"
        '
        'TypComboBox
        '
        Me.TypComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Typ", True))
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(149, 50)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(200, 21)
        Me.TypComboBox.TabIndex = 4
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(35, 80)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(49, 13)
        KundNrLabel.TabIndex = 5
        KundNrLabel.Text = "Kund Nr:"
        '
        'KundNrComboBox
        '
        Me.KundNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "KundNr", True))
        Me.KundNrComboBox.FormattingEnabled = True
        Me.KundNrComboBox.Location = New System.Drawing.Point(149, 77)
        Me.KundNrComboBox.Name = "KundNrComboBox"
        Me.KundNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.KundNrComboBox.TabIndex = 6
        '
        'DatumLabel
        '
        DatumLabel.AutoSize = True
        DatumLabel.Location = New System.Drawing.Point(35, 108)
        DatumLabel.Name = "DatumLabel"
        DatumLabel.Size = New System.Drawing.Size(41, 13)
        DatumLabel.TabIndex = 7
        DatumLabel.Text = "Datum:"
        '
        'DatumDateTimePicker
        '
        Me.DatumDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.BuchvorgangBindingSource, "Datum", True))
        Me.DatumDateTimePicker.Location = New System.Drawing.Point(149, 104)
        Me.DatumDateTimePicker.Name = "DatumDateTimePicker"
        Me.DatumDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.DatumDateTimePicker.TabIndex = 8
        '
        'NotizLabel
        '
        NotizLabel.AutoSize = True
        NotizLabel.Location = New System.Drawing.Point(35, 133)
        NotizLabel.Name = "NotizLabel"
        NotizLabel.Size = New System.Drawing.Size(34, 13)
        NotizLabel.TabIndex = 9
        NotizLabel.Text = "Notiz:"
        '
        'NotizTextBox
        '
        Me.NotizTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Notiz", True))
        Me.NotizTextBox.Location = New System.Drawing.Point(149, 130)
        Me.NotizTextBox.Multiline = True
        Me.NotizTextBox.Name = "NotizTextBox"
        Me.NotizTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NotizTextBox.TabIndex = 10
        '
        'NotizInternLabel
        '
        NotizInternLabel.AutoSize = True
        NotizInternLabel.Location = New System.Drawing.Point(35, 159)
        NotizInternLabel.Name = "NotizInternLabel"
        NotizInternLabel.Size = New System.Drawing.Size(64, 13)
        NotizInternLabel.TabIndex = 11
        NotizInternLabel.Text = "Notiz Intern:"
        '
        'NotizInternTextBox
        '
        Me.NotizInternTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "NotizIntern", True))
        Me.NotizInternTextBox.Location = New System.Drawing.Point(149, 156)
        Me.NotizInternTextBox.Multiline = True
        Me.NotizInternTextBox.Name = "NotizInternTextBox"
        Me.NotizInternTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NotizInternTextBox.TabIndex = 12
        '
        'NotizExternLabel
        '
        NotizExternLabel.AutoSize = True
        NotizExternLabel.Location = New System.Drawing.Point(35, 185)
        NotizExternLabel.Name = "NotizExternLabel"
        NotizExternLabel.Size = New System.Drawing.Size(67, 13)
        NotizExternLabel.TabIndex = 13
        NotizExternLabel.Text = "Notiz Extern:"
        '
        'NotizExternTextBox
        '
        Me.NotizExternTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "NotizExtern", True))
        Me.NotizExternTextBox.Location = New System.Drawing.Point(149, 182)
        Me.NotizExternTextBox.Multiline = True
        Me.NotizExternTextBox.Name = "NotizExternTextBox"
        Me.NotizExternTextBox.Size = New System.Drawing.Size(200, 20)
        Me.NotizExternTextBox.TabIndex = 14
        '
        'SummeLabel
        '
        SummeLabel.AutoSize = True
        SummeLabel.Location = New System.Drawing.Point(35, 211)
        SummeLabel.Name = "SummeLabel"
        SummeLabel.Size = New System.Drawing.Size(45, 13)
        SummeLabel.TabIndex = 15
        SummeLabel.Text = "Summe:"
        '
        'SummeTextBox
        '
        Me.SummeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Summe", True))
        Me.SummeTextBox.Location = New System.Drawing.Point(149, 208)
        Me.SummeTextBox.Name = "SummeTextBox"
        Me.SummeTextBox.Size = New System.Drawing.Size(200, 20)
        Me.SummeTextBox.TabIndex = 16
        '
        'BezahltLabel
        '
        BezahltLabel.AutoSize = True
        BezahltLabel.Location = New System.Drawing.Point(428, 27)
        BezahltLabel.Name = "BezahltLabel"
        BezahltLabel.Size = New System.Drawing.Size(45, 13)
        BezahltLabel.TabIndex = 17
        BezahltLabel.Text = "Bezahlt:"
        '
        'BezahltCheckBox
        '
        Me.BezahltCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Bezahlt", True))
        Me.BezahltCheckBox.Location = New System.Drawing.Point(542, 22)
        Me.BezahltCheckBox.Name = "BezahltCheckBox"
        Me.BezahltCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.BezahltCheckBox.TabIndex = 18
        Me.BezahltCheckBox.Text = "CheckBox1"
        Me.BezahltCheckBox.UseVisualStyleBackColor = True
        '
        'AusgedrucktLabel
        '
        AusgedrucktLabel.AutoSize = True
        AusgedrucktLabel.Location = New System.Drawing.Point(428, 57)
        AusgedrucktLabel.Name = "AusgedrucktLabel"
        AusgedrucktLabel.Size = New System.Drawing.Size(70, 13)
        AusgedrucktLabel.TabIndex = 19
        AusgedrucktLabel.Text = "Ausgedruckt:"
        '
        'AusgedrucktCheckBox
        '
        Me.AusgedrucktCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Ausgedruckt", True))
        Me.AusgedrucktCheckBox.Location = New System.Drawing.Point(542, 52)
        Me.AusgedrucktCheckBox.Name = "AusgedrucktCheckBox"
        Me.AusgedrucktCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.AusgedrucktCheckBox.TabIndex = 20
        Me.AusgedrucktCheckBox.Text = "CheckBox1"
        Me.AusgedrucktCheckBox.UseVisualStyleBackColor = True
        '
        'AbgeschlossenLabel
        '
        AbgeschlossenLabel.AutoSize = True
        AbgeschlossenLabel.Location = New System.Drawing.Point(428, 87)
        AbgeschlossenLabel.Name = "AbgeschlossenLabel"
        AbgeschlossenLabel.Size = New System.Drawing.Size(82, 13)
        AbgeschlossenLabel.TabIndex = 21
        AbgeschlossenLabel.Text = "Abgeschlossen:"
        '
        'AbgeschlossenCheckBox
        '
        Me.AbgeschlossenCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Abgeschlossen", True))
        Me.AbgeschlossenCheckBox.Location = New System.Drawing.Point(542, 82)
        Me.AbgeschlossenCheckBox.Name = "AbgeschlossenCheckBox"
        Me.AbgeschlossenCheckBox.Size = New System.Drawing.Size(200, 24)
        Me.AbgeschlossenCheckBox.TabIndex = 22
        Me.AbgeschlossenCheckBox.Text = "CheckBox1"
        Me.AbgeschlossenCheckBox.UseVisualStyleBackColor = True
        '
        'ZahlungsbedungungLabel
        '
        ZahlungsbedungungLabel.AutoSize = True
        ZahlungsbedungungLabel.Location = New System.Drawing.Point(708, 22)
        ZahlungsbedungungLabel.Name = "ZahlungsbedungungLabel"
        ZahlungsbedungungLabel.Size = New System.Drawing.Size(108, 13)
        ZahlungsbedungungLabel.TabIndex = 23
        ZahlungsbedungungLabel.Text = "Zahlungsbedungung:"
        '
        'ZahlungsbedungungTextBox
        '
        Me.ZahlungsbedungungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Zahlungsbedungung", True))
        Me.ZahlungsbedungungTextBox.Location = New System.Drawing.Point(822, 19)
        Me.ZahlungsbedungungTextBox.Name = "ZahlungsbedungungTextBox"
        Me.ZahlungsbedungungTextBox.Size = New System.Drawing.Size(200, 20)
        Me.ZahlungsbedungungTextBox.TabIndex = 24
        '
        'TransportMethodeLabel
        '
        TransportMethodeLabel.AutoSize = True
        TransportMethodeLabel.Location = New System.Drawing.Point(708, 48)
        TransportMethodeLabel.Name = "TransportMethodeLabel"
        TransportMethodeLabel.Size = New System.Drawing.Size(100, 13)
        TransportMethodeLabel.TabIndex = 25
        TransportMethodeLabel.Text = "Transport Methode:"
        '
        'TransportMethodeTextBox
        '
        Me.TransportMethodeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "TransportMethode", True))
        Me.TransportMethodeTextBox.Location = New System.Drawing.Point(822, 45)
        Me.TransportMethodeTextBox.Name = "TransportMethodeTextBox"
        Me.TransportMethodeTextBox.Size = New System.Drawing.Size(200, 20)
        Me.TransportMethodeTextBox.TabIndex = 26
        '
        'ZahlungsMethodeLabel
        '
        ZahlungsMethodeLabel.AutoSize = True
        ZahlungsMethodeLabel.Location = New System.Drawing.Point(708, 74)
        ZahlungsMethodeLabel.Name = "ZahlungsMethodeLabel"
        ZahlungsMethodeLabel.Size = New System.Drawing.Size(99, 13)
        ZahlungsMethodeLabel.TabIndex = 27
        ZahlungsMethodeLabel.Text = "Zahlungs Methode:"
        '
        'ZahlungsMethodeTextBox
        '
        Me.ZahlungsMethodeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "ZahlungsMethode", True))
        Me.ZahlungsMethodeTextBox.Location = New System.Drawing.Point(822, 71)
        Me.ZahlungsMethodeTextBox.Name = "ZahlungsMethodeTextBox"
        Me.ZahlungsMethodeTextBox.Size = New System.Drawing.Size(200, 20)
        Me.ZahlungsMethodeTextBox.TabIndex = 28
        '
        'WoherLabel
        '
        WoherLabel.AutoSize = True
        WoherLabel.Location = New System.Drawing.Point(708, 100)
        WoherLabel.Name = "WoherLabel"
        WoherLabel.Size = New System.Drawing.Size(42, 13)
        WoherLabel.TabIndex = 29
        WoherLabel.Text = "Woher:"
        '
        'WoherTextBox
        '
        Me.WoherTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Woher", True))
        Me.WoherTextBox.Location = New System.Drawing.Point(822, 97)
        Me.WoherTextBox.Name = "WoherTextBox"
        Me.WoherTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WoherTextBox.TabIndex = 30
        '
        'WohinLabel
        '
        WohinLabel.AutoSize = True
        WohinLabel.Location = New System.Drawing.Point(708, 126)
        WohinLabel.Name = "WohinLabel"
        WohinLabel.Size = New System.Drawing.Size(41, 13)
        WohinLabel.TabIndex = 31
        WohinLabel.Text = "Wohin:"
        '
        'WohinTextBox
        '
        Me.WohinTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Wohin", True))
        Me.WohinTextBox.Location = New System.Drawing.Point(822, 123)
        Me.WohinTextBox.Name = "WohinTextBox"
        Me.WohinTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WohinTextBox.TabIndex = 32
        '
        'StatusLabel
        '
        StatusLabel.AutoSize = True
        StatusLabel.Location = New System.Drawing.Point(708, 152)
        StatusLabel.Name = "StatusLabel"
        StatusLabel.Size = New System.Drawing.Size(40, 13)
        StatusLabel.TabIndex = 33
        StatusLabel.Text = "Status:"
        '
        'StatusComboBox
        '
        Me.StatusComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Status", True))
        Me.StatusComboBox.FormattingEnabled = True
        Me.StatusComboBox.Location = New System.Drawing.Point(822, 149)
        Me.StatusComboBox.Name = "StatusComboBox"
        Me.StatusComboBox.Size = New System.Drawing.Size(200, 21)
        Me.StatusComboBox.TabIndex = 34
        '
        'SummeMWSTLabel
        '
        SummeMWSTLabel.AutoSize = True
        SummeMWSTLabel.Location = New System.Drawing.Point(708, 179)
        SummeMWSTLabel.Name = "SummeMWSTLabel"
        SummeMWSTLabel.Size = New System.Drawing.Size(82, 13)
        SummeMWSTLabel.TabIndex = 35
        SummeMWSTLabel.Text = "Summe MWST:"
        '
        'SummeMWSTTextBox
        '
        Me.SummeMWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeMWST", True))
        Me.SummeMWSTTextBox.Location = New System.Drawing.Point(822, 176)
        Me.SummeMWSTTextBox.Name = "SummeMWSTTextBox"
        Me.SummeMWSTTextBox.Size = New System.Drawing.Size(200, 20)
        Me.SummeMWSTTextBox.TabIndex = 36
        '
        'SummeBruttoLabel
        '
        SummeBruttoLabel.AutoSize = True
        SummeBruttoLabel.Location = New System.Drawing.Point(708, 205)
        SummeBruttoLabel.Name = "SummeBruttoLabel"
        SummeBruttoLabel.Size = New System.Drawing.Size(76, 13)
        SummeBruttoLabel.TabIndex = 37
        SummeBruttoLabel.Text = "Summe Brutto:"
        '
        'SummeBruttoTextBox
        '
        Me.SummeBruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeBrutto", True))
        Me.SummeBruttoTextBox.Location = New System.Drawing.Point(822, 202)
        Me.SummeBruttoTextBox.Name = "SummeBruttoTextBox"
        Me.SummeBruttoTextBox.Size = New System.Drawing.Size(200, 20)
        Me.SummeBruttoTextBox.TabIndex = 38
        '
        'LieferantNrLabel
        '
        LieferantNrLabel.AutoSize = True
        LieferantNrLabel.Location = New System.Drawing.Point(708, 231)
        LieferantNrLabel.Name = "LieferantNrLabel"
        LieferantNrLabel.Size = New System.Drawing.Size(65, 13)
        LieferantNrLabel.TabIndex = 39
        LieferantNrLabel.Text = "Lieferant Nr:"
        '
        'LieferantNrComboBox
        '
        Me.LieferantNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "LieferantNr", True))
        Me.LieferantNrComboBox.FormattingEnabled = True
        Me.LieferantNrComboBox.Location = New System.Drawing.Point(822, 228)
        Me.LieferantNrComboBox.Name = "LieferantNrComboBox"
        Me.LieferantNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.LieferantNrComboBox.TabIndex = 40
        '
        'MitarbeiterNrLabel
        '
        MitarbeiterNrLabel.AutoSize = True
        MitarbeiterNrLabel.Location = New System.Drawing.Point(708, 258)
        MitarbeiterNrLabel.Name = "MitarbeiterNrLabel"
        MitarbeiterNrLabel.Size = New System.Drawing.Size(73, 13)
        MitarbeiterNrLabel.TabIndex = 41
        MitarbeiterNrLabel.Text = "Mitarbeiter Nr:"
        '
        'MitarbeiterNrComboBox
        '
        Me.MitarbeiterNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "MitarbeiterNr", True))
        Me.MitarbeiterNrComboBox.FormattingEnabled = True
        Me.MitarbeiterNrComboBox.Location = New System.Drawing.Point(822, 255)
        Me.MitarbeiterNrComboBox.Name = "MitarbeiterNrComboBox"
        Me.MitarbeiterNrComboBox.Size = New System.Drawing.Size(200, 21)
        Me.MitarbeiterNrComboBox.TabIndex = 42
        '
        'KundNr2Label
        '
        KundNr2Label.AutoSize = True
        KundNr2Label.Location = New System.Drawing.Point(708, 285)
        KundNr2Label.Name = "KundNr2Label"
        KundNr2Label.Size = New System.Drawing.Size(55, 13)
        KundNr2Label.TabIndex = 43
        KundNr2Label.Text = "Kund Nr2:"
        '
        'KundNr2ComboBox
        '
        Me.KundNr2ComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "KundNr2", True))
        Me.KundNr2ComboBox.FormattingEnabled = True
        Me.KundNr2ComboBox.Location = New System.Drawing.Point(822, 282)
        Me.KundNr2ComboBox.Name = "KundNr2ComboBox"
        Me.KundNr2ComboBox.Size = New System.Drawing.Size(200, 21)
        Me.KundNr2ComboBox.TabIndex = 44
        '
        'WaehrungLabel
        '
        WaehrungLabel.AutoSize = True
        WaehrungLabel.Location = New System.Drawing.Point(708, 312)
        WaehrungLabel.Name = "WaehrungLabel"
        WaehrungLabel.Size = New System.Drawing.Size(60, 13)
        WaehrungLabel.TabIndex = 45
        WaehrungLabel.Text = "Waehrung:"
        '
        'WaehrungTextBox
        '
        Me.WaehrungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Waehrung", True))
        Me.WaehrungTextBox.Location = New System.Drawing.Point(822, 309)
        Me.WaehrungTextBox.Name = "WaehrungTextBox"
        Me.WaehrungTextBox.Size = New System.Drawing.Size(200, 20)
        Me.WaehrungTextBox.TabIndex = 46
        '
        'Buchvorgang_artikelBindingSource
        '
        Me.Buchvorgang_artikelBindingSource.DataMember = "buchVorgang-artikel_ibfk_1"
        Me.Buchvorgang_artikelBindingSource.DataSource = Me.BuchvorgangBindingSource
        '
        'Buchvorgang_artikelTableAdapter
        '
        Me.Buchvorgang_artikelTableAdapter.ClearBeforeFill = True
        '
        'Buchvorgang_artikelDataGridView
        '
        Me.Buchvorgang_artikelDataGridView.AutoGenerateColumns = False
        Me.Buchvorgang_artikelDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Buchvorgang_artikelDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn19, Me.DataGridViewTextBoxColumn20})
        Me.Buchvorgang_artikelDataGridView.DataSource = Me.Buchvorgang_artikelBindingSource
        Me.Buchvorgang_artikelDataGridView.Location = New System.Drawing.Point(12, 448)
        Me.Buchvorgang_artikelDataGridView.Name = "Buchvorgang_artikelDataGridView"
        Me.Buchvorgang_artikelDataGridView.Size = New System.Drawing.Size(978, 220)
        Me.Buchvorgang_artikelDataGridView.TabIndex = 49
        '
        'ErstelltAmDateTimePicker
        '
        Me.ErstelltAmDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.BuchvorgangBindingSource, "ErstelltAm", True))
        Me.ErstelltAmDateTimePicker.Location = New System.Drawing.Point(822, 335)
        Me.ErstelltAmDateTimePicker.Name = "ErstelltAmDateTimePicker"
        Me.ErstelltAmDateTimePicker.Size = New System.Drawing.Size(200, 20)
        Me.ErstelltAmDateTimePicker.TabIndex = 48
        '
        'ErstelltAmLabel
        '
        ErstelltAmLabel.AutoSize = True
        ErstelltAmLabel.Location = New System.Drawing.Point(708, 339)
        ErstelltAmLabel.Name = "ErstelltAmLabel"
        ErstelltAmLabel.Size = New System.Drawing.Size(59, 13)
        ErstelltAmLabel.TabIndex = 47
        ErstelltAmLabel.Text = "Erstellt Am:"
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn1.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Nummer"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Nummer"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Typ"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Typ"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "ArtNr"
        Me.DataGridViewTextBoxColumn4.HeaderText = "ArtNr"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "Stk"
        Me.DataGridViewTextBoxColumn5.HeaderText = "Stk"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "Preis_Netto"
        Me.DataGridViewTextBoxColumn7.HeaderText = "Preis_Netto"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "Preis_Brutto"
        Me.DataGridViewTextBoxColumn8.HeaderText = "Preis_Brutto"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "MWST"
        Me.DataGridViewTextBoxColumn9.HeaderText = "MWST"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "EKPreis"
        Me.DataGridViewTextBoxColumn6.HeaderText = "EKPreis"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "Bezeichnung"
        Me.DataGridViewTextBoxColumn11.HeaderText = "Bezeichnung"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
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
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "Status"
        Me.DataGridViewTextBoxColumn13.HeaderText = "Status"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "Referenz"
        Me.DataGridViewTextBoxColumn14.HeaderText = "Referenz"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "Packung"
        Me.DataGridViewTextBoxColumn15.HeaderText = "Packung"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        '
        'DataGridViewTextBoxColumn16
        '
        Me.DataGridViewTextBoxColumn16.DataPropertyName = "Herkunft"
        Me.DataGridViewTextBoxColumn16.HeaderText = "Herkunft"
        Me.DataGridViewTextBoxColumn16.Name = "DataGridViewTextBoxColumn16"
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "Incoterm"
        Me.DataGridViewTextBoxColumn17.HeaderText = "Incoterm"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "Spezifikation"
        Me.DataGridViewTextBoxColumn18.HeaderText = "Spezifikation"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        '
        'DataGridViewTextBoxColumn19
        '
        Me.DataGridViewTextBoxColumn19.DataPropertyName = "Zeitpunkt"
        Me.DataGridViewTextBoxColumn19.HeaderText = "Zeitpunkt"
        Me.DataGridViewTextBoxColumn19.Name = "DataGridViewTextBoxColumn19"
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "ErstelltAm"
        Me.DataGridViewTextBoxColumn20.HeaderText = "ErstelltAm"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        Me.DataGridViewTextBoxColumn20.Visible = False
        '
        'Rechnung
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1036, 680)
        Me.Controls.Add(Me.Buchvorgang_artikelDataGridView)
        Me.Controls.Add(NummerLabel)
        Me.Controls.Add(Me.NummerTextBox)
        Me.Controls.Add(TypLabel)
        Me.Controls.Add(Me.TypComboBox)
        Me.Controls.Add(KundNrLabel)
        Me.Controls.Add(Me.KundNrComboBox)
        Me.Controls.Add(DatumLabel)
        Me.Controls.Add(Me.DatumDateTimePicker)
        Me.Controls.Add(NotizLabel)
        Me.Controls.Add(Me.NotizTextBox)
        Me.Controls.Add(NotizInternLabel)
        Me.Controls.Add(Me.NotizInternTextBox)
        Me.Controls.Add(NotizExternLabel)
        Me.Controls.Add(Me.NotizExternTextBox)
        Me.Controls.Add(SummeLabel)
        Me.Controls.Add(Me.SummeTextBox)
        Me.Controls.Add(BezahltLabel)
        Me.Controls.Add(Me.BezahltCheckBox)
        Me.Controls.Add(AusgedrucktLabel)
        Me.Controls.Add(Me.AusgedrucktCheckBox)
        Me.Controls.Add(AbgeschlossenLabel)
        Me.Controls.Add(Me.AbgeschlossenCheckBox)
        Me.Controls.Add(ZahlungsbedungungLabel)
        Me.Controls.Add(Me.ZahlungsbedungungTextBox)
        Me.Controls.Add(TransportMethodeLabel)
        Me.Controls.Add(Me.TransportMethodeTextBox)
        Me.Controls.Add(ZahlungsMethodeLabel)
        Me.Controls.Add(Me.ZahlungsMethodeTextBox)
        Me.Controls.Add(WoherLabel)
        Me.Controls.Add(Me.WoherTextBox)
        Me.Controls.Add(WohinLabel)
        Me.Controls.Add(Me.WohinTextBox)
        Me.Controls.Add(StatusLabel)
        Me.Controls.Add(Me.StatusComboBox)
        Me.Controls.Add(SummeMWSTLabel)
        Me.Controls.Add(Me.SummeMWSTTextBox)
        Me.Controls.Add(SummeBruttoLabel)
        Me.Controls.Add(Me.SummeBruttoTextBox)
        Me.Controls.Add(LieferantNrLabel)
        Me.Controls.Add(Me.LieferantNrComboBox)
        Me.Controls.Add(MitarbeiterNrLabel)
        Me.Controls.Add(Me.MitarbeiterNrComboBox)
        Me.Controls.Add(KundNr2Label)
        Me.Controls.Add(Me.KundNr2ComboBox)
        Me.Controls.Add(WaehrungLabel)
        Me.Controls.Add(Me.WaehrungTextBox)
        Me.Controls.Add(ErstelltAmLabel)
        Me.Controls.Add(Me.ErstelltAmDateTimePicker)
        Me.Controls.Add(Me.BuchvorgangBindingNavigator)
        Me.Name = "Rechnung"
        Me.Text = "Rechnung"
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.BuchvorgangBindingNavigator.ResumeLayout(False)
        Me.BuchvorgangBindingNavigator.PerformLayout()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
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
    Friend WithEvents KundNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents DatumDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents NotizTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NotizInternTextBox As System.Windows.Forms.TextBox
    Friend WithEvents NotizExternTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezahltCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AusgedrucktCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AbgeschlossenCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents ZahlungsbedungungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TransportMethodeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ZahlungsMethodeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents WoherTextBox As System.Windows.Forms.TextBox
    Friend WithEvents WohinTextBox As System.Windows.Forms.TextBox
    Friend WithEvents StatusComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents SummeMWSTTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeBruttoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents LieferantNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents MitarbeiterNrComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents KundNr2ComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents WaehrungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Buchvorgang_artikelBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Buchvorgang_artikelDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As System.Windows.Forms.DataGridViewTextBoxColumn
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
    Friend WithEvents ErstelltAmDateTimePicker As System.Windows.Forms.DateTimePicker
End Class
