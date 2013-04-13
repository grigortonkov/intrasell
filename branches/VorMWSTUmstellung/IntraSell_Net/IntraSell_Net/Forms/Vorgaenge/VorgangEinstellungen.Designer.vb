<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangEinstellungen
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
        Dim TypLabel As System.Windows.Forms.Label
        Dim BezeichnungLabel As System.Windows.Forms.Label
        Dim DruckbezeichnungLabel As System.Windows.Forms.Label
        Me.DsVorgaenge = New IntraSell_Net.dsVorgaenge()
        Me.BuchvorgangtypBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.BuchvorgangtypTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangtypTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager()
        Me.BuchvorgaengeausdruckeTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgaengeausdruckeTableAdapter()
        Me.BuchvorgaengestatusTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgaengestatusTableAdapter()
        Me.BuchvorgangeigenschaftTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangeigenschaftTableAdapter()
        Me.TypTextBox = New System.Windows.Forms.TextBox()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.DruckbezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.BuchvorgaengestatusBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.BuchvorgaengestatusDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BuchvorgangeigenschaftBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.BuchvorgangeigenschaftDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BuchvorgaengeausdruckeBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.BuchvorgaengeausdruckeDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TabControl = New System.Windows.Forms.TabControl()
        Me.StatusTabPage = New System.Windows.Forms.TabPage()
        Me.EigenschaftenTabPage = New System.Windows.Forms.TabPage()
        Me.DruckvorlagenTabPage = New System.Windows.Forms.TabPage()
        TypLabel = New System.Windows.Forms.Label()
        BezeichnungLabel = New System.Windows.Forms.Label()
        DruckbezeichnungLabel = New System.Windows.Forms.Label()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangtypBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgaengestatusBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgaengestatusDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangeigenschaftBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangeigenschaftDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgaengeausdruckeBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgaengeausdruckeDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.TabControl.SuspendLayout()
        Me.StatusTabPage.SuspendLayout()
        Me.EigenschaftenTabPage.SuspendLayout()
        Me.DruckvorlagenTabPage.SuspendLayout()
        Me.SuspendLayout()
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(10, 31)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 1
        TypLabel.Text = "Typ:"
        '
        'BezeichnungLabel
        '
        BezeichnungLabel.AutoSize = True
        BezeichnungLabel.Location = New System.Drawing.Point(10, 57)
        BezeichnungLabel.Name = "BezeichnungLabel"
        BezeichnungLabel.Size = New System.Drawing.Size(72, 13)
        BezeichnungLabel.TabIndex = 3
        BezeichnungLabel.Text = "Bezeichnung:"
        '
        'DruckbezeichnungLabel
        '
        DruckbezeichnungLabel.AutoSize = True
        DruckbezeichnungLabel.Location = New System.Drawing.Point(10, 83)
        DruckbezeichnungLabel.Name = "DruckbezeichnungLabel"
        DruckbezeichnungLabel.Size = New System.Drawing.Size(100, 13)
        DruckbezeichnungLabel.TabIndex = 5
        DruckbezeichnungLabel.Text = "Druckbezeichnung:"
        '
        'DsVorgaenge
        '
        Me.DsVorgaenge.DataSetName = "dsVorgaenge"
        Me.DsVorgaenge.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BuchvorgangtypBindingSource
        '
        Me.BuchvorgangtypBindingSource.DataMember = "buchvorgangtyp"
        Me.BuchvorgangtypBindingSource.DataSource = Me.DsVorgaenge
        '
        'BuchvorgangtypTableAdapter
        '
        Me.BuchvorgangtypTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.buchvorgaengeausdruckeTableAdapter = Me.BuchvorgaengeausdruckeTableAdapter
        Me.TableAdapterManager.buchvorgaengeeigenschaftenTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengestatusTableAdapter = Me.BuchvorgaengestatusTableAdapter
        Me.TableAdapterManager.buchvorgaengeTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgang_artikeldetaillagerTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgang_artikelTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgangeigenschaftTableAdapter = Me.BuchvorgangeigenschaftTableAdapter
        Me.TableAdapterManager.buchvorgangTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgangtypTableAdapter = Me.BuchvorgangtypTableAdapter
        Me.TableAdapterManager.grartikelTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'BuchvorgaengeausdruckeTableAdapter
        '
        Me.BuchvorgaengeausdruckeTableAdapter.ClearBeforeFill = True
        '
        'BuchvorgaengestatusTableAdapter
        '
        Me.BuchvorgaengestatusTableAdapter.ClearBeforeFill = True
        '
        'BuchvorgangeigenschaftTableAdapter
        '
        Me.BuchvorgangeigenschaftTableAdapter.ClearBeforeFill = True
        '
        'TypTextBox
        '
        Me.TypTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangtypBindingSource, "Typ", True))
        Me.TypTextBox.Location = New System.Drawing.Point(116, 28)
        Me.TypTextBox.Name = "TypTextBox"
        Me.TypTextBox.Size = New System.Drawing.Size(33, 20)
        Me.TypTextBox.TabIndex = 2
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangtypBindingSource, "Bezeichnung", True))
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(116, 54)
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(100, 20)
        Me.BezeichnungTextBox.TabIndex = 4
        '
        'DruckbezeichnungTextBox
        '
        Me.DruckbezeichnungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangtypBindingSource, "Druckbezeichnung", True))
        Me.DruckbezeichnungTextBox.Location = New System.Drawing.Point(116, 80)
        Me.DruckbezeichnungTextBox.Name = "DruckbezeichnungTextBox"
        Me.DruckbezeichnungTextBox.Size = New System.Drawing.Size(100, 20)
        Me.DruckbezeichnungTextBox.TabIndex = 6
        '
        'BuchvorgaengestatusBindingSource
        '
        Me.BuchvorgaengestatusBindingSource.DataMember = "buchvorgangtyp_buchvorgaengestatus"
        Me.BuchvorgaengestatusBindingSource.DataSource = Me.BuchvorgangtypBindingSource
        '
        'BuchvorgaengestatusDataGridView
        '
        Me.BuchvorgaengestatusDataGridView.AutoGenerateColumns = False
        Me.BuchvorgaengestatusDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.BuchvorgaengestatusDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3})
        Me.BuchvorgaengestatusDataGridView.DataSource = Me.BuchvorgaengestatusBindingSource
        Me.BuchvorgaengestatusDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.BuchvorgaengestatusDataGridView.Location = New System.Drawing.Point(3, 3)
        Me.BuchvorgaengestatusDataGridView.Name = "BuchvorgaengestatusDataGridView"
        Me.BuchvorgaengestatusDataGridView.Size = New System.Drawing.Size(681, 287)
        Me.BuchvorgaengestatusDataGridView.TabIndex = 7
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn1.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "VorgangTyp"
        Me.DataGridViewTextBoxColumn2.HeaderText = "VorgangTyp"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Status"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Status"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'BuchvorgangeigenschaftBindingSource
        '
        Me.BuchvorgangeigenschaftBindingSource.DataMember = "buchvorgangtyp_buchvorgangeigenschaft"
        Me.BuchvorgangeigenschaftBindingSource.DataSource = Me.BuchvorgangtypBindingSource
        '
        'BuchvorgangeigenschaftDataGridView
        '
        Me.BuchvorgangeigenschaftDataGridView.AutoGenerateColumns = False
        Me.BuchvorgangeigenschaftDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.BuchvorgangeigenschaftDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5})
        Me.BuchvorgangeigenschaftDataGridView.DataSource = Me.BuchvorgangeigenschaftBindingSource
        Me.BuchvorgangeigenschaftDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.BuchvorgangeigenschaftDataGridView.Location = New System.Drawing.Point(3, 3)
        Me.BuchvorgangeigenschaftDataGridView.Name = "BuchvorgangeigenschaftDataGridView"
        Me.BuchvorgangeigenschaftDataGridView.Size = New System.Drawing.Size(681, 287)
        Me.BuchvorgangeigenschaftDataGridView.TabIndex = 8
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "VorgangTyp"
        Me.DataGridViewTextBoxColumn4.HeaderText = "VorgangTyp"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "Eigenschaft"
        Me.DataGridViewTextBoxColumn5.HeaderText = "Eigenschaft"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'BuchvorgaengeausdruckeBindingSource
        '
        Me.BuchvorgaengeausdruckeBindingSource.DataMember = "buchvorgaengeausdrucke"
        Me.BuchvorgaengeausdruckeBindingSource.DataSource = Me.DsVorgaenge
        '
        'BuchvorgaengeausdruckeDataGridView
        '
        Me.BuchvorgaengeausdruckeDataGridView.AutoGenerateColumns = False
        Me.BuchvorgaengeausdruckeDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.BuchvorgaengeausdruckeDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9})
        Me.BuchvorgaengeausdruckeDataGridView.DataSource = Me.BuchvorgaengeausdruckeBindingSource
        Me.BuchvorgaengeausdruckeDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.BuchvorgaengeausdruckeDataGridView.Location = New System.Drawing.Point(3, 3)
        Me.BuchvorgaengeausdruckeDataGridView.Name = "BuchvorgaengeausdruckeDataGridView"
        Me.BuchvorgaengeausdruckeDataGridView.Size = New System.Drawing.Size(681, 287)
        Me.BuchvorgaengeausdruckeDataGridView.TabIndex = 9
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumn6.HeaderText = "ID"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "Dateiname"
        Me.DataGridViewTextBoxColumn7.HeaderText = "Dateiname"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "Engine"
        Me.DataGridViewTextBoxColumn8.HeaderText = "Engine"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "Bereich"
        Me.DataGridViewTextBoxColumn9.HeaderText = "Bereich"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        '
        'TabControl
        '
        Me.TabControl.Controls.Add(Me.StatusTabPage)
        Me.TabControl.Controls.Add(Me.EigenschaftenTabPage)
        Me.TabControl.Controls.Add(Me.DruckvorlagenTabPage)
        Me.TabControl.Location = New System.Drawing.Point(13, 106)
        Me.TabControl.Name = "TabControl"
        Me.TabControl.SelectedIndex = 0
        Me.TabControl.Size = New System.Drawing.Size(695, 319)
        Me.TabControl.TabIndex = 10
        '
        'StatusTabPage
        '
        Me.StatusTabPage.Controls.Add(Me.BuchvorgaengestatusDataGridView)
        Me.StatusTabPage.Location = New System.Drawing.Point(4, 22)
        Me.StatusTabPage.Name = "StatusTabPage"
        Me.StatusTabPage.Padding = New System.Windows.Forms.Padding(3)
        Me.StatusTabPage.Size = New System.Drawing.Size(687, 293)
        Me.StatusTabPage.TabIndex = 0
        Me.StatusTabPage.Text = "Status"
        Me.StatusTabPage.UseVisualStyleBackColor = True
        '
        'EigenschaftenTabPage
        '
        Me.EigenschaftenTabPage.Controls.Add(Me.BuchvorgangeigenschaftDataGridView)
        Me.EigenschaftenTabPage.Location = New System.Drawing.Point(4, 22)
        Me.EigenschaftenTabPage.Name = "EigenschaftenTabPage"
        Me.EigenschaftenTabPage.Padding = New System.Windows.Forms.Padding(3)
        Me.EigenschaftenTabPage.Size = New System.Drawing.Size(687, 293)
        Me.EigenschaftenTabPage.TabIndex = 1
        Me.EigenschaftenTabPage.Text = "Eigenschaften"
        Me.EigenschaftenTabPage.UseVisualStyleBackColor = True
        '
        'DruckvorlagenTabPage
        '
        Me.DruckvorlagenTabPage.Controls.Add(Me.BuchvorgaengeausdruckeDataGridView)
        Me.DruckvorlagenTabPage.Location = New System.Drawing.Point(4, 22)
        Me.DruckvorlagenTabPage.Name = "DruckvorlagenTabPage"
        Me.DruckvorlagenTabPage.Padding = New System.Windows.Forms.Padding(3)
        Me.DruckvorlagenTabPage.Size = New System.Drawing.Size(687, 293)
        Me.DruckvorlagenTabPage.TabIndex = 2
        Me.DruckvorlagenTabPage.Text = "Druckvorlagen"
        Me.DruckvorlagenTabPage.UseVisualStyleBackColor = True
        '
        'VorgangEinstellungen
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(720, 437)
        Me.Controls.Add(Me.TabControl)
        Me.Controls.Add(TypLabel)
        Me.Controls.Add(Me.TypTextBox)
        Me.Controls.Add(BezeichnungLabel)
        Me.Controls.Add(Me.BezeichnungTextBox)
        Me.Controls.Add(DruckbezeichnungLabel)
        Me.Controls.Add(Me.DruckbezeichnungTextBox)
        Me.Name = "VorgangEinstellungen"
        Me.Text = "Vorgang Einstellungen"
        Me.Controls.SetChildIndex(Me.DruckbezeichnungTextBox, 0)
        Me.Controls.SetChildIndex(DruckbezeichnungLabel, 0)
        Me.Controls.SetChildIndex(Me.BezeichnungTextBox, 0)
        Me.Controls.SetChildIndex(BezeichnungLabel, 0)
        Me.Controls.SetChildIndex(Me.TypTextBox, 0)
        Me.Controls.SetChildIndex(TypLabel, 0)
        Me.Controls.SetChildIndex(Me.TabControl, 0)
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangtypBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgaengestatusBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgaengestatusDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangeigenschaftBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangeigenschaftDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgaengeausdruckeBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgaengeausdruckeDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.TabControl.ResumeLayout(False)
        Me.StatusTabPage.ResumeLayout(False)
        Me.EigenschaftenTabPage.ResumeLayout(False)
        Me.DruckvorlagenTabPage.ResumeLayout(False)
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents DsVorgaenge As IntraSell_Net.dsVorgaenge
    Friend WithEvents BuchvorgangtypBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangtypTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangtypTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager
    Friend WithEvents TypTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents DruckbezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BuchvorgaengestatusTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgaengestatusTableAdapter
    Friend WithEvents BuchvorgaengestatusBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangeigenschaftTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangeigenschaftTableAdapter
    Friend WithEvents BuchvorgaengestatusDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BuchvorgangeigenschaftBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangeigenschaftDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BuchvorgaengeausdruckeTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgaengeausdruckeTableAdapter
    Friend WithEvents BuchvorgaengeausdruckeBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgaengeausdruckeDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TabControl As System.Windows.Forms.TabControl
    Friend WithEvents StatusTabPage As System.Windows.Forms.TabPage
    Friend WithEvents EigenschaftenTabPage As System.Windows.Forms.TabPage
    Friend WithEvents DruckvorlagenTabPage As System.Windows.Forms.TabPage
End Class
