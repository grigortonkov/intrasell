<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdresseWeitere
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(AdresseWeitere))
        Me.AdressenDetailControl1 = New IntraSell_Net.AdressenDetailControl()
        Me.Ofadressen_weitereBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.Ofadressen_weitereTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        Me.Ofadressen_weitereBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.Ofadressen_weitereBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Ofadressen_weitereDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
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
        Me.OfAdressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_weitereBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Ofadressen_weitereBindingNavigator.SuspendLayout()
        CType(Me.Ofadressen_weitereDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'AdressenDetailControl1
        '
        Me.AdressenDetailControl1.Anrede = "Herr"
        Me.AdressenDetailControl1.Branche = ""
        Me.AdressenDetailControl1.Briefanrede = "Lieber Herr"
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Anrede", Me.Ofadressen_weitereBindingSource, "Anrede", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Branche", Me.Ofadressen_weitereBindingSource, "Branche", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Firma", Me.Ofadressen_weitereBindingSource, "Firma", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.Ofadressen_weitereBindingSource, "IDNR", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Name1", Me.Ofadressen_weitereBindingSource, "Name1", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("NameFamilie", Me.Ofadressen_weitereBindingSource, "Name", True))
        Me.AdressenDetailControl1.DataBindings.Add(New System.Windows.Forms.Binding("Vorname", Me.Ofadressen_weitereBindingSource, "Vorname", True))
        Me.AdressenDetailControl1.Firma = "GRITON"
        Me.AdressenDetailControl1.IDNR = "100"
        Me.AdressenDetailControl1.Location = New System.Drawing.Point(0, 28)
        Me.AdressenDetailControl1.Name = "AdressenDetailControl1"
        Me.AdressenDetailControl1.Name1 = ""
        Me.AdressenDetailControl1.NameFamilie = "TONKOV"
        Me.AdressenDetailControl1.Size = New System.Drawing.Size(619, 303)
        Me.AdressenDetailControl1.Status = "Kunde"
        Me.AdressenDetailControl1.TabIndex = 0
        Me.AdressenDetailControl1.Titel = "Prof. Dr."
        Me.AdressenDetailControl1.Vorname = "Grigor"
        '
        'Ofadressen_weitereBindingSource
        '
        Me.Ofadressen_weitereBindingSource.DataMember = "ofadressen-weitere"
        Me.Ofadressen_weitereBindingSource.DataSource = Me.DsAdressen
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Ofadressen_weitereTableAdapter
        '
        Me.Ofadressen_weitereTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_kundengruppenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_settingsTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_transportmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_weitereTableAdapter = Me.Ofadressen_weitereTableAdapter
        Me.TableAdapterManager.ofadressen_zahlungsbedingungenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Ofadressen_weitereBindingNavigator
        '
        Me.Ofadressen_weitereBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Ofadressen_weitereBindingNavigator.BindingSource = Me.Ofadressen_weitereBindingSource
        Me.Ofadressen_weitereBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Ofadressen_weitereBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Ofadressen_weitereBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Ofadressen_weitereBindingNavigatorSaveItem})
        Me.Ofadressen_weitereBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Ofadressen_weitereBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Ofadressen_weitereBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Ofadressen_weitereBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Ofadressen_weitereBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Ofadressen_weitereBindingNavigator.Name = "Ofadressen_weitereBindingNavigator"
        Me.Ofadressen_weitereBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Ofadressen_weitereBindingNavigator.Size = New System.Drawing.Size(853, 25)
        Me.Ofadressen_weitereBindingNavigator.TabIndex = 1
        Me.Ofadressen_weitereBindingNavigator.Text = "BindingNavigator1"
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
        'Ofadressen_weitereBindingNavigatorSaveItem
        '
        Me.Ofadressen_weitereBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Image = CType(resources.GetObject("Ofadressen_weitereBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Name = "Ofadressen_weitereBindingNavigatorSaveItem"
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Ofadressen_weitereBindingNavigatorSaveItem.Text = "Save Data"
        '
        'Ofadressen_weitereDataGridView
        '
        Me.Ofadressen_weitereDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_weitereDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_weitereDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn19, Me.DataGridViewTextBoxColumn20, Me.DataGridViewTextBoxColumn21, Me.DataGridViewTextBoxColumn22, Me.DataGridViewTextBoxColumn23, Me.DataGridViewTextBoxColumn24, Me.DataGridViewTextBoxColumn25, Me.DataGridViewTextBoxColumn26, Me.DataGridViewTextBoxColumn27})
        Me.Ofadressen_weitereDataGridView.DataSource = Me.Ofadressen_weitereBindingSource
        Me.Ofadressen_weitereDataGridView.Location = New System.Drawing.Point(12, 337)
        Me.Ofadressen_weitereDataGridView.Name = "Ofadressen_weitereDataGridView"
        Me.Ofadressen_weitereDataGridView.Size = New System.Drawing.Size(829, 204)
        Me.Ofadressen_weitereDataGridView.TabIndex = 2
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn1.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Anrede"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Anrede"
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
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "Branche"
        Me.DataGridViewTextBoxColumn4.HeaderText = "Branche"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "IDNR"
        Me.DataGridViewTextBoxColumn5.HeaderText = "IDNR"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "Land"
        Me.DataGridViewTextBoxColumn6.HeaderText = "Land"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "Name"
        Me.DataGridViewTextBoxColumn7.HeaderText = "Name"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "Vorname"
        Me.DataGridViewTextBoxColumn8.HeaderText = "Vorname"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "Name1"
        Me.DataGridViewTextBoxColumn9.HeaderText = "Name1"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        '
        'DataGridViewTextBoxColumn10
        '
        Me.DataGridViewTextBoxColumn10.DataPropertyName = "Firma"
        Me.DataGridViewTextBoxColumn10.HeaderText = "Firma"
        Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "Adresse"
        Me.DataGridViewTextBoxColumn11.HeaderText = "Adresse"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "PLZ"
        Me.DataGridViewTextBoxColumn12.HeaderText = "PLZ"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "Ort"
        Me.DataGridViewTextBoxColumn13.HeaderText = "Ort"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "Tel"
        Me.DataGridViewTextBoxColumn14.HeaderText = "Tel"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "Tel2"
        Me.DataGridViewTextBoxColumn15.HeaderText = "Tel2"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        '
        'DataGridViewTextBoxColumn16
        '
        Me.DataGridViewTextBoxColumn16.DataPropertyName = "Fax"
        Me.DataGridViewTextBoxColumn16.HeaderText = "Fax"
        Me.DataGridViewTextBoxColumn16.Name = "DataGridViewTextBoxColumn16"
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "Mobil"
        Me.DataGridViewTextBoxColumn17.HeaderText = "Mobil"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "Email"
        Me.DataGridViewTextBoxColumn18.HeaderText = "Email"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        '
        'DataGridViewTextBoxColumn19
        '
        Me.DataGridViewTextBoxColumn19.DataPropertyName = "Web"
        Me.DataGridViewTextBoxColumn19.HeaderText = "Web"
        Me.DataGridViewTextBoxColumn19.Name = "DataGridViewTextBoxColumn19"
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "AngelegtAn"
        Me.DataGridViewTextBoxColumn20.HeaderText = "AngelegtAn"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        '
        'DataGridViewTextBoxColumn21
        '
        Me.DataGridViewTextBoxColumn21.DataPropertyName = "Passwort"
        Me.DataGridViewTextBoxColumn21.HeaderText = "Passwort"
        Me.DataGridViewTextBoxColumn21.Name = "DataGridViewTextBoxColumn21"
        '
        'DataGridViewTextBoxColumn22
        '
        Me.DataGridViewTextBoxColumn22.DataPropertyName = "Geburtstag"
        Me.DataGridViewTextBoxColumn22.HeaderText = "Geburtstag"
        Me.DataGridViewTextBoxColumn22.Name = "DataGridViewTextBoxColumn22"
        '
        'DataGridViewTextBoxColumn23
        '
        Me.DataGridViewTextBoxColumn23.DataPropertyName = "UID"
        Me.DataGridViewTextBoxColumn23.HeaderText = "UID"
        Me.DataGridViewTextBoxColumn23.Name = "DataGridViewTextBoxColumn23"
        '
        'DataGridViewTextBoxColumn24
        '
        Me.DataGridViewTextBoxColumn24.DataPropertyName = "EUNummer"
        Me.DataGridViewTextBoxColumn24.HeaderText = "EUNummer"
        Me.DataGridViewTextBoxColumn24.Name = "DataGridViewTextBoxColumn24"
        '
        'DataGridViewTextBoxColumn25
        '
        Me.DataGridViewTextBoxColumn25.DataPropertyName = "EUNummer1"
        Me.DataGridViewTextBoxColumn25.HeaderText = "EUNummer1"
        Me.DataGridViewTextBoxColumn25.Name = "DataGridViewTextBoxColumn25"
        '
        'DataGridViewTextBoxColumn26
        '
        Me.DataGridViewTextBoxColumn26.DataPropertyName = "EUNummer2"
        Me.DataGridViewTextBoxColumn26.HeaderText = "EUNummer2"
        Me.DataGridViewTextBoxColumn26.Name = "DataGridViewTextBoxColumn26"
        '
        'DataGridViewTextBoxColumn27
        '
        Me.DataGridViewTextBoxColumn27.DataPropertyName = "Titel"
        Me.DataGridViewTextBoxColumn27.HeaderText = "Titel"
        Me.DataGridViewTextBoxColumn27.Name = "DataGridViewTextBoxColumn27"
        '
        'OfAdressenTableAdapter
        '
        Me.OfAdressenTableAdapter.ClearBeforeFill = True
        '
        'AdresseWeitere
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(853, 563)
        Me.Controls.Add(Me.Ofadressen_weitereDataGridView)
        Me.Controls.Add(Me.Ofadressen_weitereBindingNavigator)
        Me.Controls.Add(Me.AdressenDetailControl1)
        Me.Name = "AdresseWeitere"
        Me.Text = "Adresse"
        CType(Me.Ofadressen_weitereBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_weitereBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Ofadressen_weitereBindingNavigator.ResumeLayout(False)
        Me.Ofadressen_weitereBindingNavigator.PerformLayout()
        CType(Me.Ofadressen_weitereDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents AdressenDetailControl1 As IntraSell_Net.AdressenDetailControl
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents Ofadressen_weitereBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_weitereTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_weitereTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents Ofadressen_weitereBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents Ofadressen_weitereBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents Ofadressen_weitereDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As System.Windows.Forms.DataGridViewTextBoxColumn
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
    Friend WithEvents OfAdressenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter
End Class
