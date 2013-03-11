<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Branche
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
        Dim BrNRLabel As System.Windows.Forms.Label
        Dim BezeichnungLabel As System.Windows.Forms.Label
        Dim GruppeLabel As System.Windows.Forms.Label
        Dim IntegriertLabel As System.Windows.Forms.Label
        Dim Label1 As System.Windows.Forms.Label
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Branche))
        Me.DsBranchen = New IntraSell_Net.dsBranchen()
        Me.GrbranchenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrbranchenTableAdapter = New IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsBranchenTableAdapters.TableAdapterManager()
        Me.GrbranchenkeywordsTableAdapter = New IntraSell_Net.dsBranchenTableAdapters.grbranchenkeywordsTableAdapter()
        Me.GrbranchenBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.GrbranchenBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.BrNRTextBox = New System.Windows.Forms.TextBox()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.GruppeTextBox = New System.Windows.Forms.TextBox()
        Me.IntegriertCheckBox = New System.Windows.Forms.CheckBox()
        Me.GrbranchenkeywordsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrbranchenkeywordsDataGridView = New System.Windows.Forms.DataGridView()
        Me.IdDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BrNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.KeywordDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DefaultValueDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        BrNRLabel = New System.Windows.Forms.Label()
        BezeichnungLabel = New System.Windows.Forms.Label()
        GruppeLabel = New System.Windows.Forms.Label()
        IntegriertLabel = New System.Windows.Forms.Label()
        Label1 = New System.Windows.Forms.Label()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.GrbranchenBindingNavigator.SuspendLayout()
        CType(Me.GrbranchenkeywordsBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenkeywordsDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'BrNRLabel
        '
        BrNRLabel.AutoSize = True
        BrNRLabel.Location = New System.Drawing.Point(12, 40)
        BrNRLabel.Name = "BrNRLabel"
        BrNRLabel.Size = New System.Drawing.Size(39, 13)
        BrNRLabel.TabIndex = 1
        BrNRLabel.Text = "Br NR:"
        '
        'BezeichnungLabel
        '
        BezeichnungLabel.AutoSize = True
        BezeichnungLabel.Location = New System.Drawing.Point(12, 66)
        BezeichnungLabel.Name = "BezeichnungLabel"
        BezeichnungLabel.Size = New System.Drawing.Size(72, 13)
        BezeichnungLabel.TabIndex = 3
        BezeichnungLabel.Text = "Bezeichnung:"
        '
        'GruppeLabel
        '
        GruppeLabel.AutoSize = True
        GruppeLabel.Location = New System.Drawing.Point(12, 92)
        GruppeLabel.Name = "GruppeLabel"
        GruppeLabel.Size = New System.Drawing.Size(45, 13)
        GruppeLabel.TabIndex = 5
        GruppeLabel.Text = "Gruppe:"
        '
        'IntegriertLabel
        '
        IntegriertLabel.AutoSize = True
        IntegriertLabel.Location = New System.Drawing.Point(12, 120)
        IntegriertLabel.Name = "IntegriertLabel"
        IntegriertLabel.Size = New System.Drawing.Size(51, 13)
        IntegriertLabel.TabIndex = 7
        IntegriertLabel.Text = "Integriert:"
        '
        'Label1
        '
        Label1.AutoSize = True
        Label1.Location = New System.Drawing.Point(12, 159)
        Label1.Name = "Label1"
        Label1.Size = New System.Drawing.Size(56, 13)
        Label1.TabIndex = 10
        Label1.Text = "Keywords:"
        '
        'DsBranchen
        '
        Me.DsBranchen.DataSetName = "dsBranchen"
        Me.DsBranchen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrbranchenBindingSource
        '
        Me.GrbranchenBindingSource.DataMember = "grbranchen"
        Me.GrbranchenBindingSource.DataSource = Me.DsBranchen
        '
        'GrbranchenTableAdapter
        '
        Me.GrbranchenTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grbranchenkeywordsTableAdapter = Me.GrbranchenkeywordsTableAdapter
        Me.TableAdapterManager.grbranchenTableAdapter = Me.GrbranchenTableAdapter
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsBranchenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'GrbranchenkeywordsTableAdapter
        '
        Me.GrbranchenkeywordsTableAdapter.ClearBeforeFill = True
        '
        'GrbranchenBindingNavigator
        '
        Me.GrbranchenBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.GrbranchenBindingNavigator.BindingSource = Me.GrbranchenBindingSource
        Me.GrbranchenBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.GrbranchenBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.GrbranchenBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.GrbranchenBindingNavigatorSaveItem})
        Me.GrbranchenBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.GrbranchenBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.GrbranchenBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.GrbranchenBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.GrbranchenBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.GrbranchenBindingNavigator.Name = "GrbranchenBindingNavigator"
        Me.GrbranchenBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.GrbranchenBindingNavigator.Size = New System.Drawing.Size(584, 25)
        Me.GrbranchenBindingNavigator.TabIndex = 0
        Me.GrbranchenBindingNavigator.Text = "BindingNavigator1"
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
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(36, 22)
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
        'GrbranchenBindingNavigatorSaveItem
        '
        Me.GrbranchenBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.GrbranchenBindingNavigatorSaveItem.Image = CType(resources.GetObject("GrbranchenBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.GrbranchenBindingNavigatorSaveItem.Name = "GrbranchenBindingNavigatorSaveItem"
        Me.GrbranchenBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.GrbranchenBindingNavigatorSaveItem.Text = "Save Data"
        '
        'BrNRTextBox
        '
        Me.BrNRTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrbranchenBindingSource, "BrNR", True))
        Me.BrNRTextBox.Location = New System.Drawing.Point(90, 37)
        Me.BrNRTextBox.Name = "BrNRTextBox"
        Me.BrNRTextBox.Size = New System.Drawing.Size(50, 20)
        Me.BrNRTextBox.TabIndex = 2
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrbranchenBindingSource, "Bezeichnung", True))
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(90, 63)
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(242, 20)
        Me.BezeichnungTextBox.TabIndex = 4
        '
        'GruppeTextBox
        '
        Me.GruppeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.GrbranchenBindingSource, "Gruppe", True))
        Me.GruppeTextBox.Location = New System.Drawing.Point(90, 89)
        Me.GruppeTextBox.Name = "GruppeTextBox"
        Me.GruppeTextBox.Size = New System.Drawing.Size(242, 20)
        Me.GruppeTextBox.TabIndex = 6
        '
        'IntegriertCheckBox
        '
        Me.IntegriertCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.GrbranchenBindingSource, "Integriert", True))
        Me.IntegriertCheckBox.Location = New System.Drawing.Point(90, 115)
        Me.IntegriertCheckBox.Name = "IntegriertCheckBox"
        Me.IntegriertCheckBox.Size = New System.Drawing.Size(104, 24)
        Me.IntegriertCheckBox.TabIndex = 8
        Me.IntegriertCheckBox.UseVisualStyleBackColor = True
        '
        'GrbranchenkeywordsBindingSource
        '
        Me.GrbranchenkeywordsBindingSource.DataMember = "grbranchen_grbranchenkeywords"
        Me.GrbranchenkeywordsBindingSource.DataSource = Me.GrbranchenBindingSource
        '
        'GrbranchenkeywordsDataGridView
        '
        Me.GrbranchenkeywordsDataGridView.AutoGenerateColumns = False
        Me.GrbranchenkeywordsDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.GrbranchenkeywordsDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.IdDataGridViewTextBoxColumn, Me.BrNrDataGridViewTextBoxColumn, Me.KeywordDataGridViewTextBoxColumn, Me.DefaultValueDataGridViewTextBoxColumn})
        Me.GrbranchenkeywordsDataGridView.DataSource = Me.GrbranchenkeywordsBindingSource
        Me.GrbranchenkeywordsDataGridView.Location = New System.Drawing.Point(90, 159)
        Me.GrbranchenkeywordsDataGridView.Name = "GrbranchenkeywordsDataGridView"
        Me.GrbranchenkeywordsDataGridView.Size = New System.Drawing.Size(482, 277)
        Me.GrbranchenkeywordsDataGridView.TabIndex = 9
        '
        'IdDataGridViewTextBoxColumn
        '
        Me.IdDataGridViewTextBoxColumn.DataPropertyName = "Id"
        Me.IdDataGridViewTextBoxColumn.HeaderText = "Id"
        Me.IdDataGridViewTextBoxColumn.Name = "IdDataGridViewTextBoxColumn"
        Me.IdDataGridViewTextBoxColumn.Visible = False
        '
        'BrNrDataGridViewTextBoxColumn
        '
        Me.BrNrDataGridViewTextBoxColumn.DataPropertyName = "BrNr"
        Me.BrNrDataGridViewTextBoxColumn.HeaderText = "BrNr"
        Me.BrNrDataGridViewTextBoxColumn.Name = "BrNrDataGridViewTextBoxColumn"
        Me.BrNrDataGridViewTextBoxColumn.Visible = False
        '
        'KeywordDataGridViewTextBoxColumn
        '
        Me.KeywordDataGridViewTextBoxColumn.DataPropertyName = "Keyword"
        Me.KeywordDataGridViewTextBoxColumn.HeaderText = "Keyword"
        Me.KeywordDataGridViewTextBoxColumn.Name = "KeywordDataGridViewTextBoxColumn"
        '
        'DefaultValueDataGridViewTextBoxColumn
        '
        Me.DefaultValueDataGridViewTextBoxColumn.DataPropertyName = "DefaultValue"
        Me.DefaultValueDataGridViewTextBoxColumn.HeaderText = "DefaultValue"
        Me.DefaultValueDataGridViewTextBoxColumn.Name = "DefaultValueDataGridViewTextBoxColumn"
        '
        'Branche
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(584, 448)
        Me.Controls.Add(Label1)
        Me.Controls.Add(Me.GrbranchenkeywordsDataGridView)
        Me.Controls.Add(BrNRLabel)
        Me.Controls.Add(Me.BrNRTextBox)
        Me.Controls.Add(BezeichnungLabel)
        Me.Controls.Add(Me.BezeichnungTextBox)
        Me.Controls.Add(GruppeLabel)
        Me.Controls.Add(Me.GruppeTextBox)
        Me.Controls.Add(IntegriertLabel)
        Me.Controls.Add(Me.IntegriertCheckBox)
        Me.Controls.Add(Me.GrbranchenBindingNavigator)
        Me.Name = "Branche"
        Me.Text = "Branche"
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.GrbranchenBindingNavigator.ResumeLayout(False)
        Me.GrbranchenBindingNavigator.PerformLayout()
        CType(Me.GrbranchenkeywordsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenkeywordsDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsBranchen As IntraSell_Net.dsBranchen
    Friend WithEvents GrbranchenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrbranchenTableAdapter As IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsBranchenTableAdapters.TableAdapterManager
    Friend WithEvents GrbranchenBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents GrbranchenBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BrNRTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents GruppeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents IntegriertCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents GrbranchenkeywordsTableAdapter As IntraSell_Net.dsBranchenTableAdapters.grbranchenkeywordsTableAdapter
    Friend WithEvents GrbranchenkeywordsBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrbranchenkeywordsDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents IdDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BrNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents KeywordDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DefaultValueDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
