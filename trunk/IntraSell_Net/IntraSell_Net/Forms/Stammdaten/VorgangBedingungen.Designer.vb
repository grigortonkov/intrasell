<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangBedingungen
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(VorgangBedingungen))
        Me.TabControl1 = New System.Windows.Forms.TabControl()
        Me.TabPage1 = New System.Windows.Forms.TabPage()
        Me.TabPage2 = New System.Windows.Forms.TabPage()
        Me.DsStammdaten = New IntraSell_Net.dsStammdaten()
        Me.GrzahlungsbedingungBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrzahlungsbedingungTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grzahlungsbedingungTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsStammdatenTableAdapters.TableAdapterManager()
        Me.GrzahlungsbedingungBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.GrzahlungsbedingungBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.GrzahlungsbedingungDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GrzahlungsmethodeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrzahlungsmethodeTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grzahlungsmethodeTableAdapter()
        Me.GrzahlungsmethodeDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TabPage3 = New System.Windows.Forms.TabPage()
        Me.GrtransportmethodeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrtransportmethodeTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grtransportmethodeTableAdapter()
        Me.GrtransportmethodeDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BindingNavigator1 = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorMoveFirstItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator3 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem1 = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorCountItem1 = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorSeparator4 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator5 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorAddNewItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorDeleteItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigator2 = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorMoveFirstItem2 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem2 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator6 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem2 = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorCountItem2 = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorSeparator7 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem2 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem2 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator8 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorAddNewItem2 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorDeleteItem2 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSaveItem1 = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSaveItem2 = New System.Windows.Forms.ToolStripButton()
        Me.TabControl1.SuspendLayout()
        Me.TabPage1.SuspendLayout()
        Me.TabPage2.SuspendLayout()
        CType(Me.DsStammdaten, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrzahlungsbedingungBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrzahlungsbedingungBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GrzahlungsbedingungBindingNavigator.SuspendLayout()
        CType(Me.GrzahlungsbedingungDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrzahlungsmethodeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrzahlungsmethodeDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabPage3.SuspendLayout()
        CType(Me.GrtransportmethodeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrtransportmethodeDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BindingNavigator1, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BindingNavigator1.SuspendLayout()
        CType(Me.BindingNavigator2, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.BindingNavigator2.SuspendLayout()
        Me.SuspendLayout()
        '
        'TabControl1
        '
        Me.TabControl1.Controls.Add(Me.TabPage1)
        Me.TabControl1.Controls.Add(Me.TabPage2)
        Me.TabControl1.Controls.Add(Me.TabPage3)
        Me.TabControl1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TabControl1.Location = New System.Drawing.Point(0, 0)
        Me.TabControl1.Name = "TabControl1"
        Me.TabControl1.SelectedIndex = 0
        Me.TabControl1.Size = New System.Drawing.Size(467, 614)
        Me.TabControl1.TabIndex = 0
        '
        'TabPage1
        '
        Me.TabPage1.AutoScroll = True
        Me.TabPage1.Controls.Add(Me.GrzahlungsbedingungBindingNavigator)
        Me.TabPage1.Controls.Add(Me.GrzahlungsbedingungDataGridView)
        Me.TabPage1.Location = New System.Drawing.Point(4, 22)
        Me.TabPage1.Name = "TabPage1"
        Me.TabPage1.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage1.Size = New System.Drawing.Size(459, 588)
        Me.TabPage1.TabIndex = 0
        Me.TabPage1.Text = "Zahlungsbedingung"
        Me.TabPage1.UseVisualStyleBackColor = True
        '
        'TabPage2
        '
        Me.TabPage2.Controls.Add(Me.BindingNavigator1)
        Me.TabPage2.Controls.Add(Me.GrzahlungsmethodeDataGridView)
        Me.TabPage2.Location = New System.Drawing.Point(4, 22)
        Me.TabPage2.Name = "TabPage2"
        Me.TabPage2.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage2.Size = New System.Drawing.Size(459, 588)
        Me.TabPage2.TabIndex = 1
        Me.TabPage2.Text = "Zahlungsmethode"
        Me.TabPage2.UseVisualStyleBackColor = True
        '
        'DsStammdaten
        '
        Me.DsStammdaten.DataSetName = "dsStammdaten"
        Me.DsStammdaten.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrzahlungsbedingungBindingSource
        '
        Me.GrzahlungsbedingungBindingSource.DataMember = "grzahlungsbedingung"
        Me.GrzahlungsbedingungBindingSource.DataSource = Me.DsStammdaten
        '
        'GrzahlungsbedingungTableAdapter
        '
        Me.GrzahlungsbedingungTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grbankenTableAdapter = Nothing
        Me.TableAdapterManager.grlandTableAdapter = Nothing
        Me.TableAdapterManager.grmwstTableAdapter = Nothing
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Me.GrtransportmethodeTableAdapter
        Me.TableAdapterManager.grwaehrungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Me.GrzahlungsbedingungTableAdapter
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Me.GrzahlungsmethodeTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsStammdatenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'GrzahlungsbedingungBindingNavigator
        '
        Me.GrzahlungsbedingungBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.GrzahlungsbedingungBindingNavigator.BindingSource = Me.GrzahlungsbedingungBindingSource
        Me.GrzahlungsbedingungBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.GrzahlungsbedingungBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.GrzahlungsbedingungBindingNavigator.Dock = System.Windows.Forms.DockStyle.None
        Me.GrzahlungsbedingungBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.GrzahlungsbedingungBindingNavigatorSaveItem})
        Me.GrzahlungsbedingungBindingNavigator.Location = New System.Drawing.Point(5, 3)
        Me.GrzahlungsbedingungBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.GrzahlungsbedingungBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.GrzahlungsbedingungBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.GrzahlungsbedingungBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.GrzahlungsbedingungBindingNavigator.Name = "GrzahlungsbedingungBindingNavigator"
        Me.GrzahlungsbedingungBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.GrzahlungsbedingungBindingNavigator.Size = New System.Drawing.Size(278, 25)
        Me.GrzahlungsbedingungBindingNavigator.TabIndex = 1
        Me.GrzahlungsbedingungBindingNavigator.Text = "BindingNavigator1"
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
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(35, 22)
        Me.BindingNavigatorCountItem.Text = "of {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Total number of items"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator"
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
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
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
        Me.BindingNavigatorDeleteItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem.Text = "Delete"
        '
        'GrzahlungsbedingungBindingNavigatorSaveItem
        '
        Me.GrzahlungsbedingungBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.GrzahlungsbedingungBindingNavigatorSaveItem.Image = CType(resources.GetObject("GrzahlungsbedingungBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.GrzahlungsbedingungBindingNavigatorSaveItem.Name = "GrzahlungsbedingungBindingNavigatorSaveItem"
        Me.GrzahlungsbedingungBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.GrzahlungsbedingungBindingNavigatorSaveItem.Text = "Save Data"
        '
        'GrzahlungsbedingungDataGridView
        '
        Me.GrzahlungsbedingungDataGridView.AutoGenerateColumns = False
        Me.GrzahlungsbedingungDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GrzahlungsbedingungDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2})
        Me.GrzahlungsbedingungDataGridView.DataSource = Me.GrzahlungsbedingungBindingSource
        Me.GrzahlungsbedingungDataGridView.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GrzahlungsbedingungDataGridView.Location = New System.Drawing.Point(3, 31)
        Me.GrzahlungsbedingungDataGridView.Name = "GrzahlungsbedingungDataGridView"
        Me.GrzahlungsbedingungDataGridView.Size = New System.Drawing.Size(453, 554)
        Me.GrzahlungsbedingungDataGridView.TabIndex = 0
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "Nr"
        Me.DataGridViewTextBoxColumn1.HeaderText = "Nr"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Methode"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Methode"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'GrzahlungsmethodeBindingSource
        '
        Me.GrzahlungsmethodeBindingSource.DataMember = "grzahlungsmethode"
        Me.GrzahlungsmethodeBindingSource.DataSource = Me.DsStammdaten
        '
        'GrzahlungsmethodeTableAdapter
        '
        Me.GrzahlungsmethodeTableAdapter.ClearBeforeFill = True
        '
        'GrzahlungsmethodeDataGridView
        '
        Me.GrzahlungsmethodeDataGridView.AutoGenerateColumns = False
        Me.GrzahlungsmethodeDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GrzahlungsmethodeDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn3})
        Me.GrzahlungsmethodeDataGridView.DataSource = Me.GrzahlungsmethodeBindingSource
        Me.GrzahlungsmethodeDataGridView.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GrzahlungsmethodeDataGridView.Location = New System.Drawing.Point(3, 31)
        Me.GrzahlungsmethodeDataGridView.Name = "GrzahlungsmethodeDataGridView"
        Me.GrzahlungsmethodeDataGridView.Size = New System.Drawing.Size(453, 554)
        Me.GrzahlungsmethodeDataGridView.TabIndex = 0
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Methode"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Methode"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'TabPage3
        '
        Me.TabPage3.Controls.Add(Me.BindingNavigator2)
        Me.TabPage3.Controls.Add(Me.GrtransportmethodeDataGridView)
        Me.TabPage3.Location = New System.Drawing.Point(4, 22)
        Me.TabPage3.Name = "TabPage3"
        Me.TabPage3.Padding = New System.Windows.Forms.Padding(3)
        Me.TabPage3.Size = New System.Drawing.Size(459, 588)
        Me.TabPage3.TabIndex = 2
        Me.TabPage3.Text = "Liefermethode"
        Me.TabPage3.UseVisualStyleBackColor = True
        '
        'GrtransportmethodeBindingSource
        '
        Me.GrtransportmethodeBindingSource.DataMember = "grtransportmethode"
        Me.GrtransportmethodeBindingSource.DataSource = Me.DsStammdaten
        '
        'GrtransportmethodeTableAdapter
        '
        Me.GrtransportmethodeTableAdapter.ClearBeforeFill = True
        '
        'GrtransportmethodeDataGridView
        '
        Me.GrtransportmethodeDataGridView.AutoGenerateColumns = False
        Me.GrtransportmethodeDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GrtransportmethodeDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn4})
        Me.GrtransportmethodeDataGridView.DataSource = Me.GrtransportmethodeBindingSource
        Me.GrtransportmethodeDataGridView.Dock = System.Windows.Forms.DockStyle.Bottom
        Me.GrtransportmethodeDataGridView.Location = New System.Drawing.Point(3, 31)
        Me.GrtransportmethodeDataGridView.Name = "GrtransportmethodeDataGridView"
        Me.GrtransportmethodeDataGridView.Size = New System.Drawing.Size(453, 554)
        Me.GrtransportmethodeDataGridView.TabIndex = 0
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "Methode"
        Me.DataGridViewTextBoxColumn4.HeaderText = "Methode"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'BindingNavigator1
        '
        Me.BindingNavigator1.AddNewItem = Me.BindingNavigatorAddNewItem1
        Me.BindingNavigator1.BindingSource = Me.GrzahlungsmethodeBindingSource
        Me.BindingNavigator1.CountItem = Me.BindingNavigatorCountItem1
        Me.BindingNavigator1.DeleteItem = Me.BindingNavigatorDeleteItem1
        Me.BindingNavigator1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem1, Me.BindingNavigatorMovePreviousItem1, Me.BindingNavigatorSeparator3, Me.BindingNavigatorPositionItem1, Me.BindingNavigatorCountItem1, Me.BindingNavigatorSeparator4, Me.BindingNavigatorMoveNextItem1, Me.BindingNavigatorMoveLastItem1, Me.BindingNavigatorSeparator5, Me.BindingNavigatorAddNewItem1, Me.BindingNavigatorDeleteItem1, Me.BindingNavigatorSaveItem1})
        Me.BindingNavigator1.Location = New System.Drawing.Point(3, 3)
        Me.BindingNavigator1.MoveFirstItem = Me.BindingNavigatorMoveFirstItem1
        Me.BindingNavigator1.MoveLastItem = Me.BindingNavigatorMoveLastItem1
        Me.BindingNavigator1.MoveNextItem = Me.BindingNavigatorMoveNextItem1
        Me.BindingNavigator1.MovePreviousItem = Me.BindingNavigatorMovePreviousItem1
        Me.BindingNavigator1.Name = "BindingNavigator1"
        Me.BindingNavigator1.PositionItem = Me.BindingNavigatorPositionItem1
        Me.BindingNavigator1.Size = New System.Drawing.Size(453, 25)
        Me.BindingNavigator1.TabIndex = 1
        Me.BindingNavigator1.Text = "BindingNavigator1"
        '
        'BindingNavigatorMoveFirstItem1
        '
        Me.BindingNavigatorMoveFirstItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem1.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem1.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem1.Text = "Move first"
        '
        'BindingNavigatorMovePreviousItem1
        '
        Me.BindingNavigatorMovePreviousItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem1.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem1.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem1.Text = "Move previous"
        '
        'BindingNavigatorSeparator3
        '
        Me.BindingNavigatorSeparator3.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator3.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem1
        '
        Me.BindingNavigatorPositionItem1.AccessibleName = "Position"
        Me.BindingNavigatorPositionItem1.AutoSize = False
        Me.BindingNavigatorPositionItem1.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem1.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem1.Text = "0"
        Me.BindingNavigatorPositionItem1.ToolTipText = "Current position"
        '
        'BindingNavigatorCountItem1
        '
        Me.BindingNavigatorCountItem1.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem1.Size = New System.Drawing.Size(35, 22)
        Me.BindingNavigatorCountItem1.Text = "of {0}"
        Me.BindingNavigatorCountItem1.ToolTipText = "Total number of items"
        '
        'BindingNavigatorSeparator4
        '
        Me.BindingNavigatorSeparator4.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator4.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem1
        '
        Me.BindingNavigatorMoveNextItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem1.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem1.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem1.Text = "Move next"
        '
        'BindingNavigatorMoveLastItem1
        '
        Me.BindingNavigatorMoveLastItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem1.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem1.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem1.Text = "Move last"
        '
        'BindingNavigatorSeparator5
        '
        Me.BindingNavigatorSeparator5.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator5.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorAddNewItem1
        '
        Me.BindingNavigatorAddNewItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem1.Image = CType(resources.GetObject("BindingNavigatorAddNewItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem1.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem1.Text = "Add new"
        '
        'BindingNavigatorDeleteItem1
        '
        Me.BindingNavigatorDeleteItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem1.Image = CType(resources.GetObject("BindingNavigatorDeleteItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem1.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem1.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem1.Text = "Delete"
        '
        'BindingNavigator2
        '
        Me.BindingNavigator2.AddNewItem = Me.BindingNavigatorAddNewItem2
        Me.BindingNavigator2.BindingSource = Me.GrtransportmethodeBindingSource
        Me.BindingNavigator2.CountItem = Me.BindingNavigatorCountItem2
        Me.BindingNavigator2.DeleteItem = Me.BindingNavigatorDeleteItem2
        Me.BindingNavigator2.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem2, Me.BindingNavigatorMovePreviousItem2, Me.BindingNavigatorSeparator6, Me.BindingNavigatorPositionItem2, Me.BindingNavigatorCountItem2, Me.BindingNavigatorSeparator7, Me.BindingNavigatorMoveNextItem2, Me.BindingNavigatorMoveLastItem2, Me.BindingNavigatorSeparator8, Me.BindingNavigatorAddNewItem2, Me.BindingNavigatorDeleteItem2, Me.BindingNavigatorSaveItem2})
        Me.BindingNavigator2.Location = New System.Drawing.Point(3, 3)
        Me.BindingNavigator2.MoveFirstItem = Me.BindingNavigatorMoveFirstItem2
        Me.BindingNavigator2.MoveLastItem = Me.BindingNavigatorMoveLastItem2
        Me.BindingNavigator2.MoveNextItem = Me.BindingNavigatorMoveNextItem2
        Me.BindingNavigator2.MovePreviousItem = Me.BindingNavigatorMovePreviousItem2
        Me.BindingNavigator2.Name = "BindingNavigator2"
        Me.BindingNavigator2.PositionItem = Me.BindingNavigatorPositionItem2
        Me.BindingNavigator2.Size = New System.Drawing.Size(453, 25)
        Me.BindingNavigator2.TabIndex = 1
        Me.BindingNavigator2.Text = "BindingNavigator2"
        '
        'BindingNavigatorMoveFirstItem2
        '
        Me.BindingNavigatorMoveFirstItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem2.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem2.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem2.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem2.Text = "Move first"
        '
        'BindingNavigatorMovePreviousItem2
        '
        Me.BindingNavigatorMovePreviousItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem2.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem2.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem2.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem2.Text = "Move previous"
        '
        'BindingNavigatorSeparator6
        '
        Me.BindingNavigatorSeparator6.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator6.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem2
        '
        Me.BindingNavigatorPositionItem2.AccessibleName = "Position"
        Me.BindingNavigatorPositionItem2.AutoSize = False
        Me.BindingNavigatorPositionItem2.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem2.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem2.Text = "0"
        Me.BindingNavigatorPositionItem2.ToolTipText = "Current position"
        '
        'BindingNavigatorCountItem2
        '
        Me.BindingNavigatorCountItem2.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem2.Size = New System.Drawing.Size(35, 22)
        Me.BindingNavigatorCountItem2.Text = "of {0}"
        Me.BindingNavigatorCountItem2.ToolTipText = "Total number of items"
        '
        'BindingNavigatorSeparator7
        '
        Me.BindingNavigatorSeparator7.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator7.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem2
        '
        Me.BindingNavigatorMoveNextItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem2.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem2.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem2.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem2.Text = "Move next"
        '
        'BindingNavigatorMoveLastItem2
        '
        Me.BindingNavigatorMoveLastItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem2.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem2.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem2.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem2.Text = "Move last"
        '
        'BindingNavigatorSeparator8
        '
        Me.BindingNavigatorSeparator8.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator8.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorAddNewItem2
        '
        Me.BindingNavigatorAddNewItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorAddNewItem2.Image = CType(resources.GetObject("BindingNavigatorAddNewItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorAddNewItem2.Name = "BindingNavigatorAddNewItem"
        Me.BindingNavigatorAddNewItem2.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorAddNewItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorAddNewItem2.Text = "Add new"
        '
        'BindingNavigatorDeleteItem2
        '
        Me.BindingNavigatorDeleteItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorDeleteItem2.Image = CType(resources.GetObject("BindingNavigatorDeleteItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorDeleteItem2.Name = "BindingNavigatorDeleteItem"
        Me.BindingNavigatorDeleteItem2.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorDeleteItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorDeleteItem2.Text = "Delete"
        '
        'BindingNavigatorSaveItem1
        '
        Me.BindingNavigatorSaveItem1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorSaveItem1.Image = CType(resources.GetObject("BindingNavigatorSaveItem1.Image"), System.Drawing.Image)
        Me.BindingNavigatorSaveItem1.Name = "BindingNavigatorSaveItem1"
        Me.BindingNavigatorSaveItem1.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorSaveItem1.Text = "Save Data"
        '
        'BindingNavigatorSaveItem2
        '
        Me.BindingNavigatorSaveItem2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorSaveItem2.Image = CType(resources.GetObject("BindingNavigatorSaveItem2.Image"), System.Drawing.Image)
        Me.BindingNavigatorSaveItem2.Name = "BindingNavigatorSaveItem2"
        Me.BindingNavigatorSaveItem2.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorSaveItem2.Text = "Save Data"
        '
        'VorgangBedingungen
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(467, 614)
        Me.Controls.Add(Me.TabControl1)
        Me.Name = "VorgangBedingungen"
        Me.Text = "Vorgang Bedingungen"
        Me.TabControl1.ResumeLayout(False)
        Me.TabPage1.ResumeLayout(False)
        Me.TabPage1.PerformLayout()
        Me.TabPage2.ResumeLayout(False)
        Me.TabPage2.PerformLayout()
        CType(Me.DsStammdaten, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrzahlungsbedingungBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrzahlungsbedingungBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GrzahlungsbedingungBindingNavigator.ResumeLayout(False)
        Me.GrzahlungsbedingungBindingNavigator.PerformLayout()
        CType(Me.GrzahlungsbedingungDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrzahlungsmethodeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrzahlungsmethodeDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabPage3.ResumeLayout(False)
        Me.TabPage3.PerformLayout()
        CType(Me.GrtransportmethodeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrtransportmethodeDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BindingNavigator1, System.ComponentModel.ISupportInitialize).EndInit()
        Me.BindingNavigator1.ResumeLayout(False)
        Me.BindingNavigator1.PerformLayout()
        CType(Me.BindingNavigator2, System.ComponentModel.ISupportInitialize).EndInit()
        Me.BindingNavigator2.ResumeLayout(False)
        Me.BindingNavigator2.PerformLayout()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents TabControl1 As System.Windows.Forms.TabControl
    Friend WithEvents TabPage1 As System.Windows.Forms.TabPage
    Friend WithEvents TabPage2 As System.Windows.Forms.TabPage
    Friend WithEvents DsStammdaten As IntraSell_Net.dsStammdaten
    Friend WithEvents GrzahlungsbedingungBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrzahlungsbedingungTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grzahlungsbedingungTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsStammdatenTableAdapters.TableAdapterManager
    Friend WithEvents GrzahlungsbedingungBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents GrzahlungsbedingungBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents GrzahlungsbedingungDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents GrzahlungsmethodeTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grzahlungsmethodeTableAdapter
    Friend WithEvents GrzahlungsmethodeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrzahlungsmethodeDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TabPage3 As System.Windows.Forms.TabPage
    Friend WithEvents GrtransportmethodeTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grtransportmethodeTableAdapter
    Friend WithEvents GrtransportmethodeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrtransportmethodeDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BindingNavigator1 As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem1 As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator3 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem1 As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator4 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator5 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigator2 As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem2 As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveFirstItem2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator6 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem2 As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator7 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem2 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator8 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorSaveItem1 As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSaveItem2 As System.Windows.Forms.ToolStripButton
End Class
