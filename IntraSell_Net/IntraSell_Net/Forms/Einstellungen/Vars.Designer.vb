<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Vars
    Inherits IntraSell_Net.AbstractForm

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
        Me.DsEinstellungen = New IntraSell_Net.dsEinstellungen()
        Me.OfvarsBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfvarsTableAdapter = New IntraSell_Net.dsEinstellungenTableAdapters.ofvarsTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsEinstellungenTableAdapters.TableAdapterManager()
        Me.OfvarsBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
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
        Me.OfvarsBindingNavigator.AddNewItem = Nothing
        Me.OfvarsBindingNavigator.BindingSource = Me.OfvarsBindingSource
        Me.OfvarsBindingNavigator.CountItem = Nothing
        Me.OfvarsBindingNavigator.DeleteItem = Nothing
        Me.OfvarsBindingNavigator.Location = New System.Drawing.Point(0, 25)
        Me.OfvarsBindingNavigator.MoveFirstItem = Nothing
        Me.OfvarsBindingNavigator.MoveLastItem = Nothing
        Me.OfvarsBindingNavigator.MoveNextItem = Nothing
        Me.OfvarsBindingNavigator.MovePreviousItem = Nothing
        Me.OfvarsBindingNavigator.Name = "OfvarsBindingNavigator"
        Me.OfvarsBindingNavigator.PositionItem = Nothing
        Me.OfvarsBindingNavigator.Size = New System.Drawing.Size(606, 25)
        Me.OfvarsBindingNavigator.TabIndex = 0
        Me.OfvarsBindingNavigator.Text = "BindingNavigator1"
        '
        'OfvarsDataGridView
        '
        Me.OfvarsDataGridView.AutoGenerateColumns = False
        Me.OfvarsDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.OfvarsDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.IsBooleanValue})
        Me.OfvarsDataGridView.DataSource = Me.OfvarsBindingSource
        Me.OfvarsDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfvarsDataGridView.Location = New System.Drawing.Point(0, 50)
        Me.OfvarsDataGridView.Name = "OfvarsDataGridView"
        Me.OfvarsDataGridView.Size = New System.Drawing.Size(606, 564)
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
        Me.Label1.Location = New System.Drawing.Point(288, 5)
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
        Me.Controls.SetChildIndex(Me.OfvarsBindingNavigator, 0)
        Me.Controls.SetChildIndex(Me.Label1, 0)
        Me.Controls.SetChildIndex(Me.txtSuche, 0)
        Me.Controls.SetChildIndex(Me.OfvarsDataGridView, 0)
        CType(Me.DsEinstellungen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfvarsBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfvarsBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfvarsDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsEinstellungen As IntraSell_Net.dsEinstellungen
    Friend WithEvents OfvarsBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfvarsTableAdapter As IntraSell_Net.dsEinstellungenTableAdapters.ofvarsTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsEinstellungenTableAdapters.TableAdapterManager
    Friend WithEvents OfvarsBindingNavigator As System.Windows.Forms.BindingNavigator
    Friend WithEvents OfvarsDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents txtSuche As System.Windows.Forms.TextBox
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents IsBooleanValue As System.Windows.Forms.DataGridViewCheckBoxColumn
End Class
