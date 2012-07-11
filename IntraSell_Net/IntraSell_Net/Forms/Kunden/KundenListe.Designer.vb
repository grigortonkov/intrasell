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
        Me.TextBox1 = New System.Windows.Forms.TextBox()
        Me.Label2 = New System.Windows.Forms.Label()
        Me.Label3 = New System.Windows.Forms.Label()
        Me.ComboBox1 = New System.Windows.Forms.ComboBox()
        Me.ComboBox2 = New System.Windows.Forms.ComboBox()
        Me.Label4 = New System.Windows.Forms.Label()
        Me.DsAdressen = New IntraSell_Net.dsAdressen()
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
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenlisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        Me.SuspendLayout()
        '
        'FilterButton
        '
        Me.FilterButton.Location = New System.Drawing.Point(12, 93)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 1
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(9, 16)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(30, 13)
        Me.Label1.TabIndex = 2
        Me.Label1.Text = "PLZ:"
        '
        'PLZVonTextBox
        '
        Me.PLZVonTextBox.Location = New System.Drawing.Point(95, 13)
        Me.PLZVonTextBox.Name = "PLZVonTextBox"
        Me.PLZVonTextBox.Size = New System.Drawing.Size(52, 20)
        Me.PLZVonTextBox.TabIndex = 3
        '
        'TextBox1
        '
        Me.TextBox1.Location = New System.Drawing.Point(169, 13)
        Me.TextBox1.Name = "TextBox1"
        Me.TextBox1.Size = New System.Drawing.Size(52, 20)
        Me.TextBox1.TabIndex = 4
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(153, 16)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(10, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "-"
        '
        'Label3
        '
        Me.Label3.AutoSize = True
        Me.Label3.Location = New System.Drawing.Point(9, 42)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(80, 13)
        Me.Label3.TabIndex = 6
        Me.Label3.Text = "Kundengruppe:"
        '
        'ComboBox1
        '
        Me.ComboBox1.FormattingEnabled = True
        Me.ComboBox1.Location = New System.Drawing.Point(95, 39)
        Me.ComboBox1.Name = "ComboBox1"
        Me.ComboBox1.Size = New System.Drawing.Size(126, 21)
        Me.ComboBox1.TabIndex = 7
        '
        'ComboBox2
        '
        Me.ComboBox2.FormattingEnabled = True
        Me.ComboBox2.Location = New System.Drawing.Point(95, 66)
        Me.ComboBox2.Name = "ComboBox2"
        Me.ComboBox2.Size = New System.Drawing.Size(126, 21)
        Me.ComboBox2.TabIndex = 9
        '
        'Label4
        '
        Me.Label4.AutoSize = True
        Me.Label4.Location = New System.Drawing.Point(9, 69)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(51, 13)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "Preisliste:"
        '
        'DsAdressen
        '
        Me.DsAdressen.DataSetName = "dsAdressen"
        Me.DsAdressen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
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
        Me.OfAdressenlisteDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9})
        Me.OfAdressenlisteDataGridView.DataSource = Me.OfAdressenlisteBindingSource
        Me.OfAdressenlisteDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.OfAdressenlisteDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.OfAdressenlisteDataGridView.Name = "OfAdressenlisteDataGridView"
        Me.OfAdressenlisteDataGridView.ReadOnly = True
        Me.OfAdressenlisteDataGridView.Size = New System.Drawing.Size(765, 762)
        Me.OfAdressenlisteDataGridView.TabIndex = 10
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "IDNR"
        Me.DataGridViewTextBoxColumn1.HeaderText = "IDNR"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.ReadOnly = True
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
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "Ort"
        Me.DataGridViewTextBoxColumn7.HeaderText = "Ort"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        Me.DataGridViewTextBoxColumn7.ReadOnly = True
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
        Me.SplitContainer.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.Label1)
        Me.SplitContainer.Panel1.Controls.Add(Me.FilterButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.ComboBox2)
        Me.SplitContainer.Panel1.Controls.Add(Me.PLZVonTextBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label4)
        Me.SplitContainer.Panel1.Controls.Add(Me.TextBox1)
        Me.SplitContainer.Panel1.Controls.Add(Me.ComboBox1)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label2)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label3)
        '
        'SplitContainer.Panel2
        '
        Me.SplitContainer.Panel2.Controls.Add(Me.OfAdressenlisteDataGridView)
        Me.SplitContainer.Size = New System.Drawing.Size(1008, 762)
        Me.SplitContainer.SplitterDistance = 239
        Me.SplitContainer.TabIndex = 11
        '
        'Kundenliste
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1008, 762)
        Me.Controls.Add(Me.SplitContainer)
        Me.Name = "Kundenliste"
        Me.Text = "Kundenliste"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.DsAdressen, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenlisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenlisteDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.Panel1.ResumeLayout(False)
        Me.SplitContainer.Panel1.PerformLayout()
        Me.SplitContainer.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents FilterButton As System.Windows.Forms.Button
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents PLZVonTextBox As System.Windows.Forms.TextBox
    Friend WithEvents TextBox1 As System.Windows.Forms.TextBox
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents ComboBox1 As System.Windows.Forms.ComboBox
    Friend WithEvents ComboBox2 As System.Windows.Forms.ComboBox
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents DsAdressen As IntraSell_Net.dsAdressen
    Friend WithEvents OfAdressenlisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfAdressenlisteTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofAdressenlisteTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsAdressenTableAdapters.TableAdapterManager
    Friend WithEvents OfAdressenlisteDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumn1 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
End Class
