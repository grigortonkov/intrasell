<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MwSt
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(MwSt))
        Me.DsStammdaten = New IntraSell_Net.dsStammdaten()
        Me.GrmwstBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrmwstTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grmwstTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsStammdatenTableAdapters.TableAdapterManager()
        Me.GrmwstBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.GrmwstBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.GrmwstDataGridView = New System.Windows.Forms.DataGridView()
        Me.GrlandBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrlandTableAdapter = New IntraSell_Net.dsStammdatenTableAdapters.grlandTableAdapter()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Land = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.DsStammdaten, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrmwstBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrmwstBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GrmwstBindingNavigator.SuspendLayout()
        CType(Me.GrmwstDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DsStammdaten
        '
        Me.DsStammdaten.DataSetName = "dsStammdaten"
        Me.DsStammdaten.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrmwstBindingSource
        '
        Me.GrmwstBindingSource.DataMember = "grmwst"
        Me.GrmwstBindingSource.DataSource = Me.DsStammdaten
        '
        'GrmwstTableAdapter
        '
        Me.GrmwstTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grbankenTableAdapter = Nothing
        Me.TableAdapterManager.grlandTableAdapter = Nothing
        Me.TableAdapterManager.grmwstTableAdapter = Me.GrmwstTableAdapter
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Nothing
        Me.TableAdapterManager.grwaehrungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsStammdatenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'GrmwstBindingNavigator
        '
        Me.GrmwstBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.GrmwstBindingNavigator.BindingSource = Me.GrmwstBindingSource
        Me.GrmwstBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.GrmwstBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.GrmwstBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.GrmwstBindingNavigatorSaveItem})
        Me.GrmwstBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.GrmwstBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.GrmwstBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.GrmwstBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.GrmwstBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.GrmwstBindingNavigator.Name = "GrmwstBindingNavigator"
        Me.GrmwstBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.GrmwstBindingNavigator.Size = New System.Drawing.Size(540, 25)
        Me.GrmwstBindingNavigator.TabIndex = 0
        Me.GrmwstBindingNavigator.Text = "BindingNavigator1"
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
        'GrmwstBindingNavigatorSaveItem
        '
        Me.GrmwstBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.GrmwstBindingNavigatorSaveItem.Image = CType(resources.GetObject("GrmwstBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.GrmwstBindingNavigatorSaveItem.Name = "GrmwstBindingNavigatorSaveItem"
        Me.GrmwstBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.GrmwstBindingNavigatorSaveItem.Text = "Save Data"
        '
        'GrmwstDataGridView
        '
        Me.GrmwstDataGridView.AutoGenerateColumns = False
        Me.GrmwstDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GrmwstDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.Land, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn4})
        Me.GrmwstDataGridView.DataSource = Me.GrmwstBindingSource
        Me.GrmwstDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.GrmwstDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.GrmwstDataGridView.Name = "GrmwstDataGridView"
        Me.GrmwstDataGridView.Size = New System.Drawing.Size(540, 406)
        Me.GrmwstDataGridView.TabIndex = 1
        '
        'GrlandBindingSource
        '
        Me.GrlandBindingSource.DataMember = "grland"
        Me.GrlandBindingSource.DataSource = Me.DsStammdaten
        '
        'GrlandTableAdapter
        '
        Me.GrlandTableAdapter.ClearBeforeFill = True
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn1.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'Land
        '
        Me.Land.DataPropertyName = "Land"
        Me.Land.DataSource = Me.GrlandBindingSource
        Me.Land.DisplayMember = "Name"
        Me.Land.HeaderText = "Land"
        Me.Land.Name = "Land"
        Me.Land.ValueMember = "ISO2"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "MWSTGROUP"
        Me.DataGridViewTextBoxColumn2.HeaderText = "MWSTGROUP"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "Prozent"
        Me.DataGridViewTextBoxColumn4.HeaderText = "Prozent"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'MwSt
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(540, 431)
        Me.Controls.Add(Me.GrmwstDataGridView)
        Me.Controls.Add(Me.GrmwstBindingNavigator)
        Me.Name = "MwSt"
        Me.Text = "MwSt"
        CType(Me.DsStammdaten, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrmwstBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrmwstBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GrmwstBindingNavigator.ResumeLayout(False)
        Me.GrmwstBindingNavigator.PerformLayout()
        CType(Me.GrmwstDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsStammdaten As IntraSell_Net.dsStammdaten
    Friend WithEvents GrmwstBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrmwstTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grmwstTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsStammdatenTableAdapters.TableAdapterManager
    Friend WithEvents GrmwstBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents GrmwstBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents GrmwstDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents GrlandBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrlandTableAdapter As IntraSell_Net.dsStammdatenTableAdapters.grlandTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Land As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
