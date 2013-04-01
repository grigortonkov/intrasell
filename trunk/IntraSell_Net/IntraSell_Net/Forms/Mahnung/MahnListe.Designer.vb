<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MahnListe
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
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Me.FilterButton = New System.Windows.Forms.Button()
        Me.VorgangListeDataGridView = New System.Windows.Forms.DataGridView()
        Me.MahnstufeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MahnstufeSoll = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NummerDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.KundNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DatumDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SummeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SummeMWSTDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SummeBruttoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BezahltDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.AbgeschlossenDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ZahlungsbedingungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ZahlungsMethodeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.StatusDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MitarbeiterNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.WaehrungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ErstelltAmDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BuchvorgangBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsMahnungen = New IntraSell_Net.dsMahnungen()
        Me.SplitContainer = New System.Windows.Forms.SplitContainer()
        Me.MahnbriefButton = New System.Windows.Forms.Button()
        Me.MahnstufeSetzenButton = New System.Windows.Forms.Button()
        Me.MahnstufeComboBox = New System.Windows.Forms.ComboBox()
        Me.Label11 = New System.Windows.Forms.Label()
        Me.BuchvorgangTableAdapter = New IntraSell_Net.dsMahnungenTableAdapters.buchvorgangTableAdapter()
        Me.KassaButton = New System.Windows.Forms.Button()
        CType(Me.VorgangListeDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsMahnungen, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SplitContainer.Panel1.SuspendLayout()
        Me.SplitContainer.Panel2.SuspendLayout()
        Me.SplitContainer.SuspendLayout()
        Me.SuspendLayout()
        '
        'FilterButton
        '
        Me.FilterButton.Enabled = False
        Me.FilterButton.Location = New System.Drawing.Point(12, 55)
        Me.FilterButton.Name = "FilterButton"
        Me.FilterButton.Size = New System.Drawing.Size(209, 44)
        Me.FilterButton.TabIndex = 19
        Me.FilterButton.Text = "Filter anwenden"
        Me.FilterButton.UseVisualStyleBackColor = True
        '
        'VorgangListeDataGridView
        '
        Me.VorgangListeDataGridView.AllowUserToAddRows = False
        Me.VorgangListeDataGridView.AllowUserToDeleteRows = False
        Me.VorgangListeDataGridView.AllowUserToOrderColumns = True
        Me.VorgangListeDataGridView.AutoGenerateColumns = False
        DataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle1.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.VorgangListeDataGridView.ColumnHeadersDefaultCellStyle = DataGridViewCellStyle1
        Me.VorgangListeDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.MahnstufeDataGridViewTextBoxColumn, Me.MahnstufeSoll, Me.NummerDataGridViewTextBoxColumn, Me.KundNrDataGridViewTextBoxColumn, Me.DatumDataGridViewTextBoxColumn, Me.SummeDataGridViewTextBoxColumn, Me.SummeMWSTDataGridViewTextBoxColumn, Me.SummeBruttoDataGridViewTextBoxColumn, Me.BezahltDataGridViewCheckBoxColumn, Me.AbgeschlossenDataGridViewCheckBoxColumn, Me.ZahlungsbedingungDataGridViewTextBoxColumn, Me.ZahlungsMethodeDataGridViewTextBoxColumn, Me.StatusDataGridViewTextBoxColumn, Me.MitarbeiterNrDataGridViewTextBoxColumn, Me.WaehrungDataGridViewTextBoxColumn, Me.ErstelltAmDataGridViewTextBoxColumn})
        Me.VorgangListeDataGridView.DataSource = Me.BuchvorgangBindingSource
        DataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window
        DataGridViewCellStyle2.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText
        DataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.[False]
        Me.VorgangListeDataGridView.DefaultCellStyle = DataGridViewCellStyle2
        Me.VorgangListeDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.VorgangListeDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.VorgangListeDataGridView.Name = "VorgangListeDataGridView"
        Me.VorgangListeDataGridView.ReadOnly = True
        DataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft
        DataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control
        DataGridViewCellStyle3.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        DataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText
        DataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight
        DataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText
        DataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.[True]
        Me.VorgangListeDataGridView.RowHeadersDefaultCellStyle = DataGridViewCellStyle3
        Me.VorgangListeDataGridView.Size = New System.Drawing.Size(766, 762)
        Me.VorgangListeDataGridView.TabIndex = 20
        '
        'MahnstufeDataGridViewTextBoxColumn
        '
        Me.MahnstufeDataGridViewTextBoxColumn.DataPropertyName = "Mahnstufe"
        Me.MahnstufeDataGridViewTextBoxColumn.HeaderText = "Mahnstufe"
        Me.MahnstufeDataGridViewTextBoxColumn.Name = "MahnstufeDataGridViewTextBoxColumn"
        Me.MahnstufeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'MahnstufeSoll
        '
        Me.MahnstufeSoll.HeaderText = "MahnstufeSoll"
        Me.MahnstufeSoll.Name = "MahnstufeSoll"
        Me.MahnstufeSoll.ReadOnly = True
        '
        'NummerDataGridViewTextBoxColumn
        '
        Me.NummerDataGridViewTextBoxColumn.DataPropertyName = "Nummer"
        Me.NummerDataGridViewTextBoxColumn.HeaderText = "Nummer"
        Me.NummerDataGridViewTextBoxColumn.Name = "NummerDataGridViewTextBoxColumn"
        Me.NummerDataGridViewTextBoxColumn.ReadOnly = True
        '
        'KundNrDataGridViewTextBoxColumn
        '
        Me.KundNrDataGridViewTextBoxColumn.DataPropertyName = "KundNr"
        Me.KundNrDataGridViewTextBoxColumn.HeaderText = "KundNr"
        Me.KundNrDataGridViewTextBoxColumn.Name = "KundNrDataGridViewTextBoxColumn"
        Me.KundNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'DatumDataGridViewTextBoxColumn
        '
        Me.DatumDataGridViewTextBoxColumn.DataPropertyName = "Datum"
        Me.DatumDataGridViewTextBoxColumn.HeaderText = "Datum"
        Me.DatumDataGridViewTextBoxColumn.Name = "DatumDataGridViewTextBoxColumn"
        Me.DatumDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SummeDataGridViewTextBoxColumn
        '
        Me.SummeDataGridViewTextBoxColumn.DataPropertyName = "Summe"
        Me.SummeDataGridViewTextBoxColumn.HeaderText = "Summe"
        Me.SummeDataGridViewTextBoxColumn.Name = "SummeDataGridViewTextBoxColumn"
        Me.SummeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SummeMWSTDataGridViewTextBoxColumn
        '
        Me.SummeMWSTDataGridViewTextBoxColumn.DataPropertyName = "SummeMWST"
        Me.SummeMWSTDataGridViewTextBoxColumn.HeaderText = "SummeMWST"
        Me.SummeMWSTDataGridViewTextBoxColumn.Name = "SummeMWSTDataGridViewTextBoxColumn"
        Me.SummeMWSTDataGridViewTextBoxColumn.ReadOnly = True
        '
        'SummeBruttoDataGridViewTextBoxColumn
        '
        Me.SummeBruttoDataGridViewTextBoxColumn.DataPropertyName = "SummeBrutto"
        Me.SummeBruttoDataGridViewTextBoxColumn.HeaderText = "SummeBrutto"
        Me.SummeBruttoDataGridViewTextBoxColumn.Name = "SummeBruttoDataGridViewTextBoxColumn"
        Me.SummeBruttoDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BezahltDataGridViewCheckBoxColumn
        '
        Me.BezahltDataGridViewCheckBoxColumn.DataPropertyName = "Bezahlt"
        Me.BezahltDataGridViewCheckBoxColumn.HeaderText = "Bezahlt"
        Me.BezahltDataGridViewCheckBoxColumn.Name = "BezahltDataGridViewCheckBoxColumn"
        Me.BezahltDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'AbgeschlossenDataGridViewCheckBoxColumn
        '
        Me.AbgeschlossenDataGridViewCheckBoxColumn.DataPropertyName = "Abgeschlossen"
        Me.AbgeschlossenDataGridViewCheckBoxColumn.HeaderText = "Abgeschlossen"
        Me.AbgeschlossenDataGridViewCheckBoxColumn.Name = "AbgeschlossenDataGridViewCheckBoxColumn"
        Me.AbgeschlossenDataGridViewCheckBoxColumn.ReadOnly = True
        '
        'ZahlungsbedingungDataGridViewTextBoxColumn
        '
        Me.ZahlungsbedingungDataGridViewTextBoxColumn.DataPropertyName = "Zahlungsbedingung"
        Me.ZahlungsbedingungDataGridViewTextBoxColumn.HeaderText = "Zahlungsbedingung"
        Me.ZahlungsbedingungDataGridViewTextBoxColumn.Name = "ZahlungsbedingungDataGridViewTextBoxColumn"
        Me.ZahlungsbedingungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ZahlungsMethodeDataGridViewTextBoxColumn
        '
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.DataPropertyName = "ZahlungsMethode"
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.HeaderText = "ZahlungsMethode"
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.Name = "ZahlungsMethodeDataGridViewTextBoxColumn"
        Me.ZahlungsMethodeDataGridViewTextBoxColumn.ReadOnly = True
        '
        'StatusDataGridViewTextBoxColumn
        '
        Me.StatusDataGridViewTextBoxColumn.DataPropertyName = "Status"
        Me.StatusDataGridViewTextBoxColumn.HeaderText = "Status"
        Me.StatusDataGridViewTextBoxColumn.Name = "StatusDataGridViewTextBoxColumn"
        Me.StatusDataGridViewTextBoxColumn.ReadOnly = True
        '
        'MitarbeiterNrDataGridViewTextBoxColumn
        '
        Me.MitarbeiterNrDataGridViewTextBoxColumn.DataPropertyName = "MitarbeiterNr"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.HeaderText = "MitarbeiterNr"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.Name = "MitarbeiterNrDataGridViewTextBoxColumn"
        Me.MitarbeiterNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'WaehrungDataGridViewTextBoxColumn
        '
        Me.WaehrungDataGridViewTextBoxColumn.DataPropertyName = "Waehrung"
        Me.WaehrungDataGridViewTextBoxColumn.HeaderText = "Waehrung"
        Me.WaehrungDataGridViewTextBoxColumn.Name = "WaehrungDataGridViewTextBoxColumn"
        Me.WaehrungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'ErstelltAmDataGridViewTextBoxColumn
        '
        Me.ErstelltAmDataGridViewTextBoxColumn.DataPropertyName = "ErstelltAm"
        Me.ErstelltAmDataGridViewTextBoxColumn.HeaderText = "ErstelltAm"
        Me.ErstelltAmDataGridViewTextBoxColumn.Name = "ErstelltAmDataGridViewTextBoxColumn"
        Me.ErstelltAmDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BuchvorgangBindingSource
        '
        Me.BuchvorgangBindingSource.DataMember = "buchvorgang"
        Me.BuchvorgangBindingSource.DataSource = Me.DsMahnungen
        '
        'DsMahnungen
        '
        Me.DsMahnungen.DataSetName = "dsMahnungen"
        Me.DsMahnungen.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'SplitContainer
        '
        Me.SplitContainer.Dock = System.Windows.Forms.DockStyle.Fill
        Me.SplitContainer.FixedPanel = System.Windows.Forms.FixedPanel.Panel1
        Me.SplitContainer.Location = New System.Drawing.Point(0, 0)
        Me.SplitContainer.Name = "SplitContainer"
        '
        'SplitContainer.Panel1
        '
        Me.SplitContainer.Panel1.Controls.Add(Me.KassaButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.MahnbriefButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.MahnstufeSetzenButton)
        Me.SplitContainer.Panel1.Controls.Add(Me.MahnstufeComboBox)
        Me.SplitContainer.Panel1.Controls.Add(Me.Label11)
        Me.SplitContainer.Panel1.Controls.Add(Me.FilterButton)
        '
        'SplitContainer.Panel2
        '
        Me.SplitContainer.Panel2.Controls.Add(Me.VorgangListeDataGridView)
        Me.SplitContainer.Size = New System.Drawing.Size(1008, 762)
        Me.SplitContainer.SplitterDistance = 238
        Me.SplitContainer.TabIndex = 11
        '
        'MahnbriefButton
        '
        Me.MahnbriefButton.Enabled = False
        Me.MahnbriefButton.Location = New System.Drawing.Point(12, 155)
        Me.MahnbriefButton.Name = "MahnbriefButton"
        Me.MahnbriefButton.Size = New System.Drawing.Size(209, 44)
        Me.MahnbriefButton.TabIndex = 26
        Me.MahnbriefButton.Text = "Mahnbrief drucken"
        Me.MahnbriefButton.UseVisualStyleBackColor = True
        '
        'MahnstufeSetzenButton
        '
        Me.MahnstufeSetzenButton.Enabled = False
        Me.MahnstufeSetzenButton.Location = New System.Drawing.Point(12, 105)
        Me.MahnstufeSetzenButton.Name = "MahnstufeSetzenButton"
        Me.MahnstufeSetzenButton.Size = New System.Drawing.Size(209, 44)
        Me.MahnstufeSetzenButton.TabIndex = 25
        Me.MahnstufeSetzenButton.Text = "Mahnstufe setzen"
        Me.MahnstufeSetzenButton.UseVisualStyleBackColor = True
        '
        'MahnstufeComboBox
        '
        Me.MahnstufeComboBox.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend
        Me.MahnstufeComboBox.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems
        Me.MahnstufeComboBox.FormattingEnabled = True
        Me.MahnstufeComboBox.Items.AddRange(New Object() {"MAHNSTUFE_1", "MAHNSTUFE_2", "MAHNSTUFE_3"})
        Me.MahnstufeComboBox.Location = New System.Drawing.Point(95, 12)
        Me.MahnstufeComboBox.Name = "MahnstufeComboBox"
        Me.MahnstufeComboBox.Size = New System.Drawing.Size(126, 21)
        Me.MahnstufeComboBox.TabIndex = 0
        '
        'Label11
        '
        Me.Label11.AutoSize = True
        Me.Label11.Location = New System.Drawing.Point(9, 15)
        Me.Label11.Name = "Label11"
        Me.Label11.Size = New System.Drawing.Size(60, 13)
        Me.Label11.TabIndex = 24
        Me.Label11.Text = "Mahnstufe:"
        '
        'BuchvorgangTableAdapter
        '
        Me.BuchvorgangTableAdapter.ClearBeforeFill = True
        '
        'KassaButton
        '
        Me.KassaButton.Enabled = False
        Me.KassaButton.Location = New System.Drawing.Point(12, 205)
        Me.KassaButton.Name = "KassaButton"
        Me.KassaButton.Size = New System.Drawing.Size(209, 44)
        Me.KassaButton.TabIndex = 27
        Me.KassaButton.Text = "Betrag eingehoben"
        Me.KassaButton.UseVisualStyleBackColor = True
        '
        'MahnListe
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1008, 762)
        Me.Controls.Add(Me.SplitContainer)
        Me.Name = "MahnListe"
        Me.Text = "Vorgangliste"
        CType(Me.VorgangListeDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsMahnungen, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.Panel1.ResumeLayout(False)
        Me.SplitContainer.Panel1.PerformLayout()
        Me.SplitContainer.Panel2.ResumeLayout(False)
        CType(Me.SplitContainer, System.ComponentModel.ISupportInitialize).EndInit()
        Me.SplitContainer.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents FilterButton As System.Windows.Forms.Button
    Friend WithEvents VorgangListeDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents SplitContainer As System.Windows.Forms.SplitContainer
    Friend WithEvents MahnstufeComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents Label11 As System.Windows.Forms.Label
    Friend WithEvents DsMahnungen As IntraSell_Net.dsMahnungen
    Friend WithEvents BuchvorgangBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangTableAdapter As IntraSell_Net.dsMahnungenTableAdapters.buchvorgangTableAdapter
    Friend WithEvents MahnstufeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MahnstufeSoll As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NummerDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents KundNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DatumDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SummeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SummeMWSTDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SummeBruttoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BezahltDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents AbgeschlossenDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ZahlungsbedingungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ZahlungsMethodeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents StatusDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MitarbeiterNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WaehrungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ErstelltAmDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MandantNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MahnstufeSetzenButton As System.Windows.Forms.Button
    Friend WithEvents MahnbriefButton As System.Windows.Forms.Button
    Friend WithEvents KassaButton As System.Windows.Forms.Button
End Class
