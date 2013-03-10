<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Kundenliste
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
        Me.FilterButton = New System.Windows.Forms.Button()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.PLZVonTextBox = New System.Windows.Forms.TextBox()
        Me.PLZBisTextBox = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.KundengruppeComboBox = New System.Windows.Forms.ComboBox()
        Me.KundengruppenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
        Me.PreislisteComboBox = New System.Windows.Forms.ComboBox()
        Me.PreislistenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Label4 = New System.Windows.Forms.Label()
        Me.OfAdressenlisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.OfAdressenlisteTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofAdressenlisteTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager()
        Me.OfAdressenlisteDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Land = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.Label6 = New System.Windows.Forms.Label()
        Me.txtFirmaName = New System.Windows.Forms.TextBox()
        Me.LandComboBox = New System.Windows.Forms.ComboBox()
        Me.GrlandBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsPLZ = New IntraSell_Net.dsPLZ()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.KundengruppenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.KundengruppenTableAdapter()
        Me.PreislistenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.PreislistenTableAdapter()
        Me.GrlandTableAdapter = New IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.AnrufenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AnrufprotokollToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NeuerAnrufToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        CType(Me.KundengruppenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.PreislistenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenlisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.MenuStrip1.SuspendLayout()
        Me.SuspendLayout()
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(15, 136)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 5
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 59)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(30, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "PLZ:"
        '
        'PLZVonTextBox
        '
        Me.PLZVonTextBox.Location = New System.Drawing.Point(98, 56)
        Me.PLZVonTextBox.Name = "PLZVonTextBox"
        Me.PLZVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZVonTextBox.TabIndex = 1
        '
        'PLZBisTextBox
        '
        Me.PLZBisTextBox.Location = New System.Drawing.Point(172, 56)
        Me.PLZBisTextBox.Name = "PLZBisTextBox"
        Me.PLZBisTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZBisTextBox.TabIndex = 2
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(156, 59)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(12, 85)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(80, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Kundengruppe:"
        '
        'KundengruppeComboBox
        '
        Me.KundengruppeComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.KundengruppeComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.KundengruppeComboBox.DataSource = Me.KundengruppenBindingSource
        Me.KundengruppeComboBox.DisplayMember = "Gruppe"
        Me.KundengruppeComboBox.FormattingEnabled = True
        Me.KundengruppeComboBox.Location = New System.Drawing.Point(98, 82)
        Me.KundengruppeComboBox.Name = "KundengruppeComboBox"
        Me.KundengruppeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.KundengruppeComboBox.TabIndex = 3
        '
        'KundengruppenBindingSource
        '
        Me.KundengruppenBindingSource.DataMember = "Kundengruppen"
        Me.KundengruppenBindingSource.DataSource = Me.DsAdressen
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'PreislisteComboBox
        '
        Me.PreislisteComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.PreislisteComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.PreislisteComboBox.DataSource = Me.PreislistenBindingSource
        Me.PreislisteComboBox.DisplayMember = "PreislisteName"
        Me.PreislisteComboBox.FormattingEnabled = True
        Me.PreislisteComboBox.Location = New System.Drawing.Point(98, 109)
        Me.PreislisteComboBox.Name = "PreislisteComboBox"
        Me.PreislisteComboBox.Size = New System.Drawing.Size(126, 21)
        Me.PreislisteComboBox.TabIndex = 4
        '
        'PreislistenBindingSource
        '
        Me.PreislistenBindingSource.DataMember = "Preislisten"
        Me.PreislistenBindingSource.DataSource = Me.DsAdressen
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(12, 112)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(51, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Preisliste:"
        '
        'OfAdressenlisteBindingSource
        '
        Me.OfAdressenlisteBindingSource.DataMember = "ofAdressenliste"
        Me.OfAdressenlisteBindingSource.DataSource = Me.DsAdressen
        '
        'OfAdressenlisteTableAdapter
        '
        Me.OfAdressenlisteTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Connection = Nothing
        Me.TableAdapterManager.grtransportmethodeTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsbedingungTableAdapter = Nothing
        Me.TableAdapterManager.grzahlungsmethodeTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_settingsTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_transportmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_weitereTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsbedingungenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressen_zahlungsmethodenTableAdapter = Nothing
        Me.TableAdapterManager.ofadressenTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'OfAdressenlisteDataGridView
        '
        Me.OfAdressenlisteDataGridView.AllowUserToAddRows = False
        Me.OfAdressenlisteDataGridView.AllowUserToDeleteRows = False
        Me.OfAdressenlisteDataGridView.AllowUserToOrderColumns = True
        Me.OfAdressenlisteDataGridView.AutoGenerateColumns = False
        Me.OfAdressenlisteDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.OfAdressenlisteDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.Land, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9})
        Me.OfAdressenlisteDataGridView.DataSource = Me.OfAdressenlisteBindingSource
        Me.OfAdressenlisteDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfAdressenlisteDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.OfAdressenlisteDataGridView.Name = "OfAdressenlisteDataGridView"
        Me.OfAdressenlisteDataGridView.ReadOnly = True
        Me.OfAdressenlisteDataGridView.Size = New System.Drawing.Size(990, 738)
        Me.OfAdressenlisteDataGridView.TabIndex = 6
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "IDNR"
        Me.DataGridViewTextBoxColumn1.HeaderText = "IDNR"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.ReadOnly = True
        Me.DataGridViewTextBoxColumn1.Width = 75
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "Name"
        Me.DataGridViewTextBoxColumn2.HeaderText = "Name"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        Me.DataGridViewTextBoxColumn2.ReadOnly = True
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "Vorname"
        Me.DataGridViewTextBoxColumn3.HeaderText = "Vorname"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.ReadOnly = True
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "Firma"
        Me.DataGridViewTextBoxColumn4.HeaderText = "Firma"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.ReadOnly = True
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "Adresse"
        Me.DataGridViewTextBoxColumn5.HeaderText = "Adresse"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        Me.DataGridViewTextBoxColumn5.ReadOnly = True
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "PLZ"
        Me.DataGridViewTextBoxColumn6.HeaderText = "PLZ"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        Me.DataGridViewTextBoxColumn6.ReadOnly = True
        Me.DataGridViewTextBoxColumn6.Width = 50
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "Ort"
        Me.DataGridViewTextBoxColumn7.HeaderText = "Ort"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        Me.DataGridViewTextBoxColumn7.ReadOnly = True
        '
        'Land
        '
        Me.Land.DataPropertyName = "Land"
        Me.Land.HeaderText = "Land"
        Me.Land.Name = "Land"
        Me.Land.ReadOnly = True
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "Kundengruppe"
        Me.DataGridViewTextBoxColumn8.HeaderText = "Kundengruppe"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        Me.DataGridViewTextBoxColumn8.ReadOnly = True
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "Preisliste"
        Me.DataGridViewTextBoxColumn9.HeaderText = "Preisliste"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        Me.DataGridViewTextBoxColumn9.ReadOnly = True
        '
        'SplitContainer
        '
        Me.SplitContainer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer.FixedPanel = System.Windows.Forms.FixedPanel.Panel1
        Me.SplitContainer.Location = New System.Drawing.Point(0, 24)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.Label6)
        Me.SplitContainer.Panel1.Controls.Add(Me.txtFirmaName)
        Me.SplitContainer.Panel1.Controls.Add(Me.LandComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label5)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer.Panel1.Controls.Add(Me.FilterButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.PreislisteComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.PLZVonTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label4)
        Me.SplitContainer.Panel1.Controls.Add(Me.PLZBisTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.KundengruppeComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label2)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label3)
        '
        'SplitContainer.Panel2
        '
        Me.SplitContainer.Panel2.Controls.Add(Me.OfAdressenlisteDataGridView)
        Me.SplitContainer.Size = New System.Drawing.Size(1232, 738)
        Me.SplitContainer.SplitterDistance = 238
        Me.SplitContainer.TabIndex = 11
        '
        'Label6
        '
        Me.Label6.AutoSize = True
        Me.Label6.Location = New System.Drawing.Point(12, 6)
        Me.Label6.Name = "Label6"
        Me.Label6.Size = New System.Drawing.Size(68, 13)
        Me.Label6.TabIndex = 12
        Me.Label6.Text = "Firma/Name:"
        '
        'txtFirmaName
        '
        Me.txtFirmaName.Location = New System.Drawing.Point(98, 3)
        Me.txtFirmaName.Name = "txtFirmaName"
        Me.txtFirmaName.Size = New System.Drawing.Size(126, 20)
        Me.txtFirmaName.TabIndex = 0
        '
        'LandComboBox
        '
        Me.LandComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.LandComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.LandComboBox.DataSource = Me.GrlandBindingSource
        Me.LandComboBox.DisplayMember = "Name"
        Me.LandComboBox.FormattingEnabled = True
        Me.LandComboBox.Location = New System.Drawing.Point(98, 29)
        Me.LandComboBox.Name = "LandComboBox"
        Me.LandComboBox.Size = New System.Drawing.Size(126, 21)
        Me.LandComboBox.TabIndex = 0
        '
        'GrlandBindingSource
        '
        Me.GrlandBindingSource.DataMember = "grland"
        Me.GrlandBindingSource.DataSource = Me.DsPLZ
        '
        'DsPLZ
        '
        Me.DsPLZ.DataSetName = "dsPLZ"
        Me.DsPLZ.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Label5
        '
        Me.Label5.AutoSize = True
        Me.Label5.Location = New System.Drawing.Point(12, 32)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(34, 13)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "Land:"
        '
        'KundengruppenTableAdapter
        '
        Me.KundengruppenTableAdapter.ClearBeforeFill = True
        '
        'PreislistenTableAdapter
        '
        Me.PreislistenTableAdapter.ClearBeforeFill = True
        '
        'GrlandTableAdapter
        '
        Me.GrlandTableAdapter.ClearBeforeFill = True
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AnrufenToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(0, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(1232, 24)
        Me.MenuStrip1.TabIndex = 12
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'AnrufenToolStripMenuItem
        '
        Me.AnrufenToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.AnrufprotokollToolStripMenuItem, Me.NeuerAnrufToolStripMenuItem})
        Me.AnrufenToolStripMenuItem.Name = "AnrufenToolStripMenuItem"
        Me.AnrufenToolStripMenuItem.Size = New System.Drawing.Size(99, 20)
        Me.AnrufenToolStripMenuItem.Text = "Kunde &Anrufen"
        '
        'AnrufprotokollToolStripMenuItem
        '
        Me.AnrufprotokollToolStripMenuItem.Name = "AnrufprotokollToolStripMenuItem"
        Me.AnrufprotokollToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.AnrufprotokollToolStripMenuItem.Text = "Anruf&liste"
        '
        'NeuerAnrufToolStripMenuItem
        '
        Me.NeuerAnrufToolStripMenuItem.Name = "NeuerAnrufToolStripMenuItem"
        Me.NeuerAnrufToolStripMenuItem.Size = New System.Drawing.Size(152, 22)
        Me.NeuerAnrufToolStripMenuItem.Text = "&Neuer Anruf"
        '
        'Kundenliste
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1232, 762)
        Me.Controls.Add(Me.SplitContainer)
        Me.Controls.Add(Me.MenuStrip1)
        Me.MainMenuStrip = Me.MenuStrip1
        Me.Name = "Kundenliste"
        Me.Text = "Kundenliste"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.KundengruppenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.PreislistenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenlisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.Panel1.ResumeLayout(False)
        Me.SplitContainer.Panel1.PerformLayout()
        Me.SplitContainer.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.ResumeLayout(False)
        CType(Me.GrlandBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsPLZ, System.ComponentModel.ISupportInitialize).EndInit()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents FilterButton As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents PLZVonTextBox As System.Windows.Forms.TextBox
    Friend WithEvents PLZBisTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents KundengruppeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents PreislisteComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents OfAdressenlisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfAdressenlisteTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofAdressenlisteTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents OfAdressenlisteDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
    Friend WithEvents KundengruppenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents KundengruppenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.KundengruppenTableAdapter
    Friend WithEvents PreislistenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents PreislistenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.PreislistenTableAdapter
    Friend WithEvents LandComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents DsPLZ As IntraSell_Net.dsPLZ
    Friend WithEvents GrlandBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrlandTableAdapter As IntraSell_Net.dsPLZTableAdapters.grlandTableAdapter
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents AnrufenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AnrufprotokollToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NeuerAnrufToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Land As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Label6 As System.Windows.Forms.Label
    Friend WithEvents txtFirmaName As System.Windows.Forms.TextBox
End Class
