<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Einheiten
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Einheiten))
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.Grartikel_einheitenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Grartikel_einheitenTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grartikel_einheitenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager()
        Me.Grartikel_einheitenBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.Grartikel_einheitenBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Grartikel_einheitenDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Grartikel_einheitenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Grartikel_einheitenBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Grartikel_einheitenBindingNavigator.SuspendLayout()
        CType(Me.Grartikel_einheitenDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DsArtikel
        '
        Me.DsArtikel.DataSetName = "dsArtikel"
        Me.DsArtikel.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Grartikel_einheitenBindingSource
        '
        Me.Grartikel_einheitenBindingSource.DataMember = "grartikel-einheiten"
        Me.Grartikel_einheitenBindingSource.DataSource = Me.DsArtikel
        '
        'Grartikel_einheitenTableAdapter
        '
        Me.Grartikel_einheitenTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grartikel_einheitenTableAdapter = Me.Grartikel_einheitenTableAdapter
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
        Me.TableAdapterManager.grartikelTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Grartikel_einheitenBindingNavigator
        '
        Me.Grartikel_einheitenBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Grartikel_einheitenBindingNavigator.BindingSource = Me.Grartikel_einheitenBindingSource
        Me.Grartikel_einheitenBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Grartikel_einheitenBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Grartikel_einheitenBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Grartikel_einheitenBindingNavigatorSaveItem})
        Me.Grartikel_einheitenBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Grartikel_einheitenBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Grartikel_einheitenBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Grartikel_einheitenBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Grartikel_einheitenBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Grartikel_einheitenBindingNavigator.Name = "Grartikel_einheitenBindingNavigator"
        Me.Grartikel_einheitenBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Grartikel_einheitenBindingNavigator.Size = New System.Drawing.Size(375, 25)
        Me.Grartikel_einheitenBindingNavigator.TabIndex = 0
        Me.Grartikel_einheitenBindingNavigator.Text = "BindingNavigator1"
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
        'Grartikel_einheitenBindingNavigatorSaveItem
        '
        Me.Grartikel_einheitenBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Grartikel_einheitenBindingNavigatorSaveItem.Image = CType(resources.GetObject("Grartikel_einheitenBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Grartikel_einheitenBindingNavigatorSaveItem.Name = "Grartikel_einheitenBindingNavigatorSaveItem"
        Me.Grartikel_einheitenBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 23)
        Me.Grartikel_einheitenBindingNavigatorSaveItem.Text = "Save Data"
        '
        'Grartikel_einheitenDataGridView
        '
        Me.Grartikel_einheitenDataGridView.AutoGenerateColumns = False
        Me.Grartikel_einheitenDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Grartikel_einheitenDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1})
        Me.Grartikel_einheitenDataGridView.DataSource = Me.Grartikel_einheitenBindingSource
        Me.Grartikel_einheitenDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Grartikel_einheitenDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.Grartikel_einheitenDataGridView.Name = "Grartikel_einheitenDataGridView"
        Me.Grartikel_einheitenDataGridView.Size = New System.Drawing.Size(375, 360)
        Me.Grartikel_einheitenDataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "Einheit"
        Me.DataGridViewTextBoxColumn1.HeaderText = "Einheit"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'Einheiten
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(375, 385)
        Me.Controls.Add(Me.Grartikel_einheitenDataGridView)
        Me.Controls.Add(Me.Grartikel_einheitenBindingNavigator)
        Me.Name = "Einheiten"
        Me.Text = "Einheiten"
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Grartikel_einheitenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Grartikel_einheitenBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Grartikel_einheitenBindingNavigator.ResumeLayout(False)
        Me.Grartikel_einheitenBindingNavigator.PerformLayout()
        CType(Me.Grartikel_einheitenDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents Grartikel_einheitenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Grartikel_einheitenTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grartikel_einheitenTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsArtikelTableAdapters.TableAdapterManager
    Friend WithEvents Grartikel_einheitenBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents Grartikel_einheitenBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents Grartikel_einheitenDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
