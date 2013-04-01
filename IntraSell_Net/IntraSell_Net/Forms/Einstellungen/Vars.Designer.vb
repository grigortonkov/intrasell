<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Vars
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Vars))
        Me.DsEinstellungen = New IntraSell_Net.dsEinstellungen()
        Me.OfvarsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfvarsTableAdapter = New IntraSell_Net.dsEinstellungenTableAdapters.ofvarsTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsEinstellungenTableAdapters.TableAdapterManager()
        Me.OfvarsBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.OfvarsBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.OfvarsDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.IsBooleanValue = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.txtSuche = New System.Windows.Forms.TextBox()
        Me.Label1 = New System.Windows.Forms.Label()
        CType(Me.DsEinstellungen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfvarsBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfvarsBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.OfvarsBindingNavigator.SuspendLayout()
        CType(Me.OfvarsDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DsEinstellungen
        '
        Me.DsEinstellungen.DataSetName = "dsEinstellungen"
        Me.DsEinstellungen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'OfvarsBindingSource
        '
        Me.OfvarsBindingSource.DataMember = "ofvars"
        Me.OfvarsBindingSource.DataSource = Me.DsEinstellungen
        '
        'OfvarsTableAdapter
        '
        Me.OfvarsTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.ofvarsTableAdapter = Me.OfvarsTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsEinstellungenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'OfvarsBindingNavigator
        '
        Me.OfvarsBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.OfvarsBindingNavigator.BindingSource = Me.OfvarsBindingSource
        Me.OfvarsBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.OfvarsBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.OfvarsBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.OfvarsBindingNavigatorSaveItem})
        Me.OfvarsBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.OfvarsBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.OfvarsBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.OfvarsBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.OfvarsBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.OfvarsBindingNavigator.Name = "OfvarsBindingNavigator"
        Me.OfvarsBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.OfvarsBindingNavigator.Size = New System.Drawing.Size(606, 25)
        Me.OfvarsBindingNavigator.TabIndex = 0
        Me.OfvarsBindingNavigator.Text = "BindingNavigator1"
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
        'OfvarsBindingNavigatorSaveItem
        '
        Me.OfvarsBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.OfvarsBindingNavigatorSaveItem.Image = CType(resources.GetObject("OfvarsBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.OfvarsBindingNavigatorSaveItem.Name = "OfvarsBindingNavigatorSaveItem"
        Me.OfvarsBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.OfvarsBindingNavigatorSaveItem.Text = "Save Data"
        '
        'OfvarsDataGridView
        '
        Me.OfvarsDataGridView.AutoGenerateColumns = False
        Me.OfvarsDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.OfvarsDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.IsBooleanValue})
        Me.OfvarsDataGridView.DataSource = Me.OfvarsBindingSource
        Me.OfvarsDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfvarsDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.OfvarsDataGridView.Name = "OfvarsDataGridView"
        Me.OfvarsDataGridView.Size = New System.Drawing.Size(606, 589)
        Me.OfvarsDataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "Id"
        Me.DataGridViewTextBoxColumn1.HeaderText = "Id"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.Visible = False
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Name"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Name"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        Me.DataGridViewTextBoxColumn2.Width = 200
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Wert"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Wert"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.Width = 200
        '
        'IsBooleanValue
        '
        Me.IsBooleanValue.DataPropertyName = "IsBooleanValue"
        Me.IsBooleanValue.HeaderText = "IsBooleanValue"
        Me.IsBooleanValue.Name = "IsBooleanValue"
        Me.IsBooleanValue.ReadOnly = True
        '
        'txtSuche
        '
        Me.txtSuche.Location = New System.Drawing.Point(337, 2)
        Me.txtSuche.Name = "txtSuche"
        Me.txtSuche.Size = New System.Drawing.Size(100, 20)
        Me.txtSuche.TabIndex = 3
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(290, 5)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "Suche:"
        '
        'Vars
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(606, 614)
        Me.Controls.Add(Me.OfvarsDataGridView)
        Me.Controls.Add(Me.txtSuche)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.OfvarsBindingNavigator)
        Me.Name = "Vars"
        Me.Text = "Einstellungen"
        CType(Me.DsEinstellungen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfvarsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfvarsBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.OfvarsBindingNavigator.ResumeLayout(False)
        Me.OfvarsBindingNavigator.PerformLayout()
        CType(Me.OfvarsDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsEinstellungen As IntraSell_Net.dsEinstellungen
    Friend WithEvents OfvarsBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfvarsTableAdapter As IntraSell_Net.dsEinstellungenTableAdapters.ofvarsTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsEinstellungenTableAdapters.TableAdapterManager
    Friend WithEvents OfvarsBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents OfvarsBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents OfvarsDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents txtSuche As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents IsBooleanValue As System.Windows.Forms.DataGridViewCheckBoxColumn
End Class
