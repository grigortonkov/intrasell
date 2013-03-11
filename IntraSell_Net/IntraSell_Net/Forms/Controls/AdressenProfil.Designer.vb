<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class AdressenProfil
    Inherits System.Windows.Forms.UserControl

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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(AdressenProfil))
        Me.DsAdressenProfil = New IntraSell_Net.dsAdressenProfil()
        Me.Ofadressen_profilBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Ofadressen_profilTableAdapter = New IntraSell_Net.dsAdressenProfilTableAdapters.ofadressen_profilTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenProfilTableAdapters.TableAdapterManager()
        Me.Ofadressen_profilBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorAddNewItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorDeleteItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.Ofadressen_profilBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Ofadressen_profilDataGridView = New System.Windows.Forms.DataGridView()
        Me.ComboBox1 = New System.Windows.Forms.ComboBox()
        Me.GrbranchenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsBranchen = New IntraSell_Net.dsBranchen()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.GrbranchenTableAdapter = New IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.DsAdressenProfil, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_profilBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_profilBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Ofadressen_profilBindingNavigator.SuspendLayout()
        CType(Me.Ofadressen_profilDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DsAdressenProfil
        '
        Me.DsAdressenProfil.DataSetName = "dsAdressenProfil"
        Me.DsAdressenProfil.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Ofadressen_profilBindingSource
        '
        Me.Ofadressen_profilBindingSource.DataMember = "ofadressen-profil"
        Me.Ofadressen_profilBindingSource.DataSource = Me.DsAdressenProfil
        '
        'Ofadressen_profilTableAdapter
        '
        Me.Ofadressen_profilTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.ofadressen_profilTableAdapter = Me.Ofadressen_profilTableAdapter
        Me.TableAdapterManager.ofadressenTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenProfilTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Ofadressen_profilBindingNavigator
        '
        Me.Ofadressen_profilBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Ofadressen_profilBindingNavigator.BindingSource = Me.Ofadressen_profilBindingSource
        Me.Ofadressen_profilBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Ofadressen_profilBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Ofadressen_profilBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Ofadressen_profilBindingNavigatorSaveItem})
        Me.Ofadressen_profilBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Ofadressen_profilBindingNavigator.MoveFirstItem = Nothing
        Me.Ofadressen_profilBindingNavigator.MoveLastItem = Nothing
        Me.Ofadressen_profilBindingNavigator.MoveNextItem = Nothing
        Me.Ofadressen_profilBindingNavigator.MovePreviousItem = Nothing
        Me.Ofadressen_profilBindingNavigator.Name = "Ofadressen_profilBindingNavigator"
        Me.Ofadressen_profilBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Ofadressen_profilBindingNavigator.Size = New System.Drawing.Size(465, 25)
        Me.Ofadressen_profilBindingNavigator.TabIndex = 0
        Me.Ofadressen_profilBindingNavigator.Text = "BindingNavigator1"
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
        'Ofadressen_profilBindingNavigatorSaveItem
        '
        Me.Ofadressen_profilBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Ofadressen_profilBindingNavigatorSaveItem.Image = CType(resources.GetObject("Ofadressen_profilBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Ofadressen_profilBindingNavigatorSaveItem.Name = "Ofadressen_profilBindingNavigatorSaveItem"
        Me.Ofadressen_profilBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Ofadressen_profilBindingNavigatorSaveItem.Text = "Save Data"
        '
        'Ofadressen_profilDataGridView
        '
        Me.Ofadressen_profilDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_profilDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_profilDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5})
        Me.Ofadressen_profilDataGridView.DataSource = Me.Ofadressen_profilBindingSource
        Me.Ofadressen_profilDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Ofadressen_profilDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.Ofadressen_profilDataGridView.Name = "Ofadressen_profilDataGridView"
        Me.Ofadressen_profilDataGridView.Size = New System.Drawing.Size(465, 585)
        Me.Ofadressen_profilDataGridView.TabIndex = 1
        '
        'ComboBox1
        '
        Me.ComboBox1.DataSource = Me.GrbranchenBindingSource
        Me.ComboBox1.DisplayMember = "Bezeichnung"
        Me.ComboBox1.FormattingEnabled = True
        Me.ComboBox1.Location = New System.Drawing.Point(223, 1)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(85, 21)
        Me.ComboBox1.TabIndex = 2
        Me.ComboBox1.ValueMember = "BrNR"
        '
        'GrbranchenBindingSource
        '
        Me.GrbranchenBindingSource.DataMember = "grbranchen"
        Me.GrbranchenBindingSource.DataSource = Me.DsBranchen
        '
        'DsBranchen
        '
        Me.DsBranchen.DataSetName = "dsBranchen"
        Me.DsBranchen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(184, 4)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(33, 13)
        Me.Label1.TabIndex = 3
        Me.Label1.Text = "Profil:"
        '
        'GrbranchenTableAdapter
        '
        Me.GrbranchenTableAdapter.ClearBeforeFill = True
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Name"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Name"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "Wert"
        Me.DataGridViewTextBoxColumn4.HeaderText = "Wert"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.Width = 200
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "AngelegtAm"
        Me.DataGridViewTextBoxColumn5.HeaderText = "AngelegtAm"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        Me.DataGridViewTextBoxColumn5.Visible = False
        '
        'AdressenProfil
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.ComboBox1)
        Me.Controls.Add(Me.Ofadressen_profilDataGridView)
        Me.Controls.Add(Me.Ofadressen_profilBindingNavigator)
        Me.Name = "AdressenProfil"
        Me.Size = New System.Drawing.Size(465, 610)
        CType(Me.DsAdressenProfil, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_profilBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_profilBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Ofadressen_profilBindingNavigator.ResumeLayout(False)
        Me.Ofadressen_profilBindingNavigator.PerformLayout()
        CType(Me.Ofadressen_profilDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrbranchenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsBranchen, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsAdressenProfil As IntraSell_Net.dsAdressenProfil
    Friend WithEvents Ofadressen_profilBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_profilTableAdapter As IntraSell_Net.dsAdressenProfilTableAdapters.ofadressen_profilTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenProfilTableAdapters.TableAdapterManager
    Friend WithEvents Ofadressen_profilBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents BindingNavigatorAddNewItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorCountItem As System.Windows.Forms.ToolStripLabel
    Friend WithEvents BindingNavigatorDeleteItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As System.Windows.Forms.ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As System.Windows.Forms.ToolStripSeparator
    Friend WithEvents Ofadressen_profilBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents Ofadressen_profilDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents GrbranchenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents DsBranchen As IntraSell_Net.dsBranchen
    Friend WithEvents GrbranchenTableAdapter As IntraSell_Net.dsBranchenTableAdapters.grbranchenTableAdapter
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
