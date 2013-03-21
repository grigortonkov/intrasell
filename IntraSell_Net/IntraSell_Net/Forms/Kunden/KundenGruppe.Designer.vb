<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class KundenGruppe
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(KundenGruppe))
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.Ofadressen_kundengruppenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Ofadressen_kundengruppenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_kundengruppenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        Me.Ofadressen_kundengruppenBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.Ofadressen_kundengruppenBindingNavigatorSaveItem = New System.Windows.Forms.ToolStripButton()
        Me.Ofadressen_kundengruppenDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewCheckBoxColumn1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_kundengruppenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Ofadressen_kundengruppenBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Ofadressen_kundengruppenBindingNavigator.SuspendLayout()
        CType(Me.Ofadressen_kundengruppenDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Ofadressen_kundengruppenBindingSource
        '
        Me.Ofadressen_kundengruppenBindingSource.DataMember = "ofadressen-kundengruppen"
        Me.Ofadressen_kundengruppenBindingSource.DataSource = Me.DsAdressen
        '
        'Ofadressen_kundengruppenTableAdapter
        '
        Me.Ofadressen_kundengruppenTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_kundengruppenTableAdapter = Me.Ofadressen_kundengruppenTableAdapter
        Me.TableAdapterManager.ofadressen_settingsTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_transportmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_weitereTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsbedingungenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Ofadressen_kundengruppenBindingNavigator
        '
        Me.Ofadressen_kundengruppenBindingNavigator.AddNewItem = Me.BindingNavigatorAddNewItem
        Me.Ofadressen_kundengruppenBindingNavigator.BindingSource = Me.Ofadressen_kundengruppenBindingSource
        Me.Ofadressen_kundengruppenBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Ofadressen_kundengruppenBindingNavigator.DeleteItem = Me.BindingNavigatorDeleteItem
        Me.Ofadressen_kundengruppenBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.BindingNavigatorAddNewItem, Me.BindingNavigatorDeleteItem, Me.Ofadressen_kundengruppenBindingNavigatorSaveItem})
        Me.Ofadressen_kundengruppenBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Ofadressen_kundengruppenBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Ofadressen_kundengruppenBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Ofadressen_kundengruppenBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Ofadressen_kundengruppenBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Ofadressen_kundengruppenBindingNavigator.Name = "Ofadressen_kundengruppenBindingNavigator"
        Me.Ofadressen_kundengruppenBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Ofadressen_kundengruppenBindingNavigator.Size = New System.Drawing.Size(877, 25)
        Me.Ofadressen_kundengruppenBindingNavigator.TabIndex = 0
        Me.Ofadressen_kundengruppenBindingNavigator.Text = "BindingNavigator1"
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
        'Ofadressen_kundengruppenBindingNavigatorSaveItem
        '
        Me.Ofadressen_kundengruppenBindingNavigatorSaveItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.Ofadressen_kundengruppenBindingNavigatorSaveItem.Image = CType(resources.GetObject("Ofadressen_kundengruppenBindingNavigatorSaveItem.Image"), System.Drawing.Image)
        Me.Ofadressen_kundengruppenBindingNavigatorSaveItem.Name = "Ofadressen_kundengruppenBindingNavigatorSaveItem"
        Me.Ofadressen_kundengruppenBindingNavigatorSaveItem.Size = New System.Drawing.Size(23, 22)
        Me.Ofadressen_kundengruppenBindingNavigatorSaveItem.Text = "Save Data"
        '
        'Ofadressen_kundengruppenDataGridView
        '
        Me.Ofadressen_kundengruppenDataGridView.AutoGenerateColumns = False
        Me.Ofadressen_kundengruppenDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Ofadressen_kundengruppenDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewCheckBoxColumn1})
        Me.Ofadressen_kundengruppenDataGridView.DataSource = Me.Ofadressen_kundengruppenBindingSource
        Me.Ofadressen_kundengruppenDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Ofadressen_kundengruppenDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.Ofadressen_kundengruppenDataGridView.Name = "Ofadressen_kundengruppenDataGridView"
        Me.Ofadressen_kundengruppenDataGridView.Size = New System.Drawing.Size(877, 332)
        Me.Ofadressen_kundengruppenDataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "KGR"
        Me.DataGridViewTextBoxColumn1.HeaderText = "KGR"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Gruppe"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Gruppe"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "KundenNrKreisVon"
        Me.DataGridViewTextBoxColumn3.HeaderText = "KundenNr Von"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "KundenNrKreisBis"
        Me.DataGridViewTextBoxColumn4.HeaderText = "KundenNr Bis"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "VorgangNrKreisVon"
        Me.DataGridViewTextBoxColumn5.HeaderText = "VorgangNr Von"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "VorgangNrKreisBis"
        Me.DataGridViewTextBoxColumn6.HeaderText = "VorgangNr Bis"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewCheckBoxColumn1
        '
        Me.DataGridViewCheckBoxColumn1.DataPropertyName = "RechungenMitMWST"
        Me.DataGridViewCheckBoxColumn1.HeaderText = "Rechungen mit MWST"
        Me.DataGridViewCheckBoxColumn1.Name = "DataGridViewCheckBoxColumn1"
        '
        'KundenGruppe
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(877, 357)
        Me.Controls.Add(Me.Ofadressen_kundengruppenDataGridView)
        Me.Controls.Add(Me.Ofadressen_kundengruppenBindingNavigator)
        Me.Name = "KundenGruppe"
        Me.Text = "Kundengruppen"
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_kundengruppenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_kundengruppenBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Ofadressen_kundengruppenBindingNavigator.ResumeLayout(False)
        Me.Ofadressen_kundengruppenBindingNavigator.PerformLayout()
        CType(Me.Ofadressen_kundengruppenDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents Ofadressen_kundengruppenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_kundengruppenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_kundengruppenTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents Ofadressen_kundengruppenBindingNavigator As System.Windows.Forms.BindingNavigator
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
    Friend WithEvents Ofadressen_kundengruppenBindingNavigatorSaveItem As System.Windows.Forms.ToolStripButton
    Friend WithEvents Ofadressen_kundengruppenDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn1 As System.Windows.Forms.DataGridViewCheckBoxColumn
End Class
