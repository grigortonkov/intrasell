<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class KundenGruppe
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
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.Ofadressen_kundengruppenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Ofadressen_kundengruppenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressen_kundengruppenTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
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
        Me.Name = "KundenGruppe"
        Me.Text = "Kundengruppen"
        Me.Controls.SetChildIndex(Me.Ofadressen_kundengruppenDataGridView, 0)
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_kundengruppenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Ofadressen_kundengruppenDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents Ofadressen_kundengruppenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Ofadressen_kundengruppenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressen_kundengruppenTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents Ofadressen_kundengruppenDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn1 As System.Windows.Forms.DataGridViewCheckBoxColumn
End Class
