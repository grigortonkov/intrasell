<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class VorgangBar
    Inherits AbstractVorgangForm

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
        Dim NummerLabel As System.Windows.Forms.Label
        Dim WaehrungLabel1 As System.Windows.Forms.Label
        Dim SummeLabel As System.Windows.Forms.Label
        Dim SummeMWSTLabel As System.Windows.Forms.Label
        Dim SummeBruttoLabel As System.Windows.Forms.Label
        Dim MitarbeiterNrLabel As System.Windows.Forms.Label
        Dim DatumLabel As System.Windows.Forms.Label
        Dim ArtNrLabel As System.Windows.Forms.Label
        Dim StkLabel As System.Windows.Forms.Label
        Dim Preis_NettoLabel As System.Windows.Forms.Label
        Dim Label1 As System.Windows.Forms.Label
        Dim TypLabel As System.Windows.Forms.Label
        Dim KundNrLabel As System.Windows.Forms.Label
        Dim Label2 As System.Windows.Forms.Label
        Dim Label3 As System.Windows.Forms.Label
        Dim DataGridViewCellStyle1 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle2 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Dim DataGridViewCellStyle3 As System.Windows.Forms.DataGridViewCellStyle = New System.Windows.Forms.DataGridViewCellStyle()
        Me.NummerTextBox = New System.Windows.Forms.TextBox()
        Me.BuchvorgangBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsVorgaenge = New IntraSell_Net.dsVorgaenge()
        Me.BezahltCheckBox = New System.Windows.Forms.CheckBox()
        Me.AbgeschlossenCheckBox = New System.Windows.Forms.CheckBox()
        Me.AusgedrucktCheckBox = New System.Windows.Forms.CheckBox()
        Me.btnAbschliessen = New System.Windows.Forms.Button()
        Me.btnNeu = New System.Windows.Forms.Button()
        Me.btnZweiterAusdruck = New System.Windows.Forms.Button()
        Me.btnStorno = New System.Windows.Forms.Button()
        Me.WaehrungComboBox = New System.Windows.Forms.ComboBox()
        Me.SummeTextBox = New System.Windows.Forms.TextBox()
        Me.SummeMWSTTextBox = New System.Windows.Forms.TextBox()
        Me.SummeBruttoTextBox = New System.Windows.Forms.TextBox()
        Me.Panel1 = New System.Windows.Forms.Panel()
        Me.Buchvorgang_artikelDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumnID = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnNummer = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnTyp = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnStk = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ArtNrComboBox = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.ArtikelContextMenuStrip = New System.Windows.Forms.ContextMenuStrip(Me.components)
        Me.ArtikelstammToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.GrArtikellisteBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.DataGridViewTextBoxColumnArtNr = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnBezeichnung = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnPreisNetto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnPreisBrutto = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnMWST = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumnEKPreis = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn10 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn14 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn15 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn16 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn19 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Buchvorgang_artikelBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.GrArtikellisteTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter()
        Me.MenuStrip1 = New System.Windows.Forms.MenuStrip()
        Me.VorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.NeuerVorgangToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AusdruckenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.AbschliessenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.StornoToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.ExportierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KonvertierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorlagenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.KassaBuchungToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.SendeEmailToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.VorlageeditierenToolStripMenuItem = New System.Windows.Forms.ToolStripMenuItem()
        Me.BuchvorgangTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangTableAdapter()
        Me.Buchvorgang_artikelTableAdapter = New IntraSell_Net.dsVorgaengeTableAdapters.buchvorgang_artikelTableAdapter()
        Me.TableAdapterManager = New IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.Button1 = New System.Windows.Forms.Button()
        Me.Button4 = New System.Windows.Forms.Button()
        Me.Button5 = New System.Windows.Forms.Button()
        Me.MitarbeiterNrComboBox = New IntraSell_Net.MitarbeiterControl()
        Me.DatumDateTimePicker = New System.Windows.Forms.DateTimePicker()
        Me.PanelPosition = New System.Windows.Forms.Panel()
        Me.StkTextBox = New System.Windows.Forms.TextBox()
        Me.Preis_NettoTextBox = New System.Windows.Forms.TextBox()
        Me.Preis_BruttoTextBox = New System.Windows.Forms.TextBox()
        Me.MWSTTextBox = New System.Windows.Forms.TextBox()
        Me.ArtikelIdentifikationTextBox = New System.Windows.Forms.TextBox()
        Me.BezeichnungTextBox = New System.Windows.Forms.TextBox()
        Me.btnNeuePosition = New System.Windows.Forms.Button()
        Me.ArtikelControl1 = New IntraSell_Net.ArtikelControl()
        Me.KundNrAdressenControl = New IntraSell_Net.AdressenControl()
        Me.TypComboBox = New System.Windows.Forms.ComboBox()
        Me.GegebenBarTextbox = New System.Windows.Forms.TextBox()
        Me.RestgeldTextbox = New System.Windows.Forms.TextBox()
        NummerLabel = New System.Windows.Forms.Label()
        WaehrungLabel1 = New System.Windows.Forms.Label()
        SummeLabel = New System.Windows.Forms.Label()
        SummeMWSTLabel = New System.Windows.Forms.Label()
        SummeBruttoLabel = New System.Windows.Forms.Label()
        MitarbeiterNrLabel = New System.Windows.Forms.Label()
        DatumLabel = New System.Windows.Forms.Label()
        ArtNrLabel = New System.Windows.Forms.Label()
        StkLabel = New System.Windows.Forms.Label()
        Preis_NettoLabel = New System.Windows.Forms.Label()
        Label1 = New System.Windows.Forms.Label()
        TypLabel = New System.Windows.Forms.Label()
        KundNrLabel = New System.Windows.Forms.Label()
        Label2 = New System.Windows.Forms.Label()
        Label3 = New System.Windows.Forms.Label()
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Panel1.SuspendLayout()
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.ArtikelContextMenuStrip.SuspendLayout()
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.MenuStrip1.SuspendLayout()
        Me.PanelPosition.SuspendLayout()
        Me.SuspendLayout()
        '
        'NummerLabel
        '
        NummerLabel.AutoSize = True
        NummerLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        NummerLabel.Location = New System.Drawing.Point(9, 40)
        NummerLabel.Name = "NummerLabel"
        NummerLabel.Size = New System.Drawing.Size(73, 20)
        NummerLabel.TabIndex = 3
        NummerLabel.Text = "Nummer:"
        '
        'WaehrungLabel1
        '
        WaehrungLabel1.AutoSize = True
        WaehrungLabel1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        WaehrungLabel1.Location = New System.Drawing.Point(15, 638)
        WaehrungLabel1.Name = "WaehrungLabel1"
        WaehrungLabel1.Size = New System.Drawing.Size(78, 20)
        WaehrungLabel1.TabIndex = 60
        WaehrungLabel1.Text = "Währung:"
        '
        'SummeLabel
        '
        SummeLabel.AutoSize = True
        SummeLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        SummeLabel.Location = New System.Drawing.Point(15, 560)
        SummeLabel.Name = "SummeLabel"
        SummeLabel.Size = New System.Drawing.Size(68, 20)
        SummeLabel.TabIndex = 57
        SummeLabel.Text = "Summe:"
        '
        'SummeMWSTLabel
        '
        SummeMWSTLabel.AutoSize = True
        SummeMWSTLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        SummeMWSTLabel.Location = New System.Drawing.Point(15, 586)
        SummeMWSTLabel.Name = "SummeMWSTLabel"
        SummeMWSTLabel.Size = New System.Drawing.Size(53, 20)
        SummeMWSTLabel.TabIndex = 58
        SummeMWSTLabel.Text = "MwSt:"
        '
        'SummeBruttoLabel
        '
        SummeBruttoLabel.AutoSize = True
        SummeBruttoLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        SummeBruttoLabel.Location = New System.Drawing.Point(15, 612)
        SummeBruttoLabel.Name = "SummeBruttoLabel"
        SummeBruttoLabel.Size = New System.Drawing.Size(57, 20)
        SummeBruttoLabel.TabIndex = 59
        SummeBruttoLabel.Text = "Brutto:"
        '
        'MitarbeiterNrLabel
        '
        MitarbeiterNrLabel.AutoSize = True
        MitarbeiterNrLabel.Location = New System.Drawing.Point(9, 124)
        MitarbeiterNrLabel.Name = "MitarbeiterNrLabel"
        MitarbeiterNrLabel.Size = New System.Drawing.Size(73, 13)
        MitarbeiterNrLabel.TabIndex = 74
        MitarbeiterNrLabel.Text = "Mitarbeiter Nr:"
        '
        'DatumLabel
        '
        DatumLabel.AutoSize = True
        DatumLabel.Location = New System.Drawing.Point(9, 74)
        DatumLabel.Name = "DatumLabel"
        DatumLabel.Size = New System.Drawing.Size(41, 13)
        DatumLabel.TabIndex = 72
        DatumLabel.Text = "Datum:"
        '
        'ArtNrLabel
        '
        ArtNrLabel.AutoSize = True
        ArtNrLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        ArtNrLabel.Location = New System.Drawing.Point(15, 7)
        ArtNrLabel.Name = "ArtNrLabel"
        ArtNrLabel.Size = New System.Drawing.Size(54, 20)
        ArtNrLabel.TabIndex = 71
        ArtNrLabel.Text = "Art Nr:"
        '
        'StkLabel
        '
        StkLabel.AutoSize = True
        StkLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        StkLabel.Location = New System.Drawing.Point(316, 7)
        StkLabel.Name = "StkLabel"
        StkLabel.Size = New System.Drawing.Size(62, 20)
        StkLabel.TabIndex = 74
        StkLabel.Text = "Menge:"
        '
        'Preis_NettoLabel
        '
        Preis_NettoLabel.AutoSize = True
        Preis_NettoLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Preis_NettoLabel.Location = New System.Drawing.Point(387, 7)
        Preis_NettoLabel.Name = "Preis_NettoLabel"
        Preis_NettoLabel.Size = New System.Drawing.Size(91, 20)
        Preis_NettoLabel.TabIndex = 76
        Preis_NettoLabel.Text = "Preis Netto:"
        '
        'Label1
        '
        Label1.AutoSize = True
        Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Label1.Location = New System.Drawing.Point(485, 7)
        Label1.Name = "Label1"
        Label1.Size = New System.Drawing.Size(96, 20)
        Label1.TabIndex = 79
        Label1.Text = "Preis Brutto:"
        '
        'TypLabel
        '
        TypLabel.AutoSize = True
        TypLabel.Location = New System.Drawing.Point(9, 97)
        TypLabel.Name = "TypLabel"
        TypLabel.Size = New System.Drawing.Size(28, 13)
        TypLabel.TabIndex = 77
        TypLabel.Text = "Typ:"
        '
        'KundNrLabel
        '
        KundNrLabel.AutoSize = True
        KundNrLabel.Location = New System.Drawing.Point(9, 155)
        KundNrLabel.Name = "KundNrLabel"
        KundNrLabel.Size = New System.Drawing.Size(41, 13)
        KundNrLabel.TabIndex = 79
        KundNrLabel.Text = "Kunde:"
        '
        'Label2
        '
        Label2.AutoSize = True
        Label2.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Label2.Location = New System.Drawing.Point(15, 672)
        Label2.Name = "Label2"
        Label2.Size = New System.Drawing.Size(109, 20)
        Label2.TabIndex = 81
        Label2.Text = "Gegeben Bar:"
        '
        'Label3
        '
        Label3.AutoSize = True
        Label3.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Label3.Location = New System.Drawing.Point(15, 704)
        Label3.Name = "Label3"
        Label3.Size = New System.Drawing.Size(77, 20)
        Label3.TabIndex = 83
        Label3.Text = "Restgeld:"
        '
        'NummerTextBox
        '
        Me.NummerTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.NummerTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Nummer", True))
        Me.NummerTextBox.Enabled = False
        Me.NummerTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.NummerTextBox.Location = New System.Drawing.Point(123, 37)
        Me.NummerTextBox.Name = "NummerTextBox"
        Me.NummerTextBox.Size = New System.Drawing.Size(131, 26)
        Me.NummerTextBox.TabIndex = 4
        Me.NummerTextBox.TabStop = False
        '
        'BuchvorgangBindingSource
        '
        Me.BuchvorgangBindingSource.DataMember = "buchvorgang"
        Me.BuchvorgangBindingSource.DataSource = Me.DsVorgaenge
        '
        'DsVorgaenge
        '
        Me.DsVorgaenge.DataSetName = "dsVorgaenge"
        Me.DsVorgaenge.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'BezahltCheckBox
        '
        Me.BezahltCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Bezahlt", True))
        Me.BezahltCheckBox.Enabled = False
        Me.BezahltCheckBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.BezahltCheckBox.Location = New System.Drawing.Point(332, 36)
        Me.BezahltCheckBox.Name = "BezahltCheckBox"
        Me.BezahltCheckBox.Size = New System.Drawing.Size(87, 24)
        Me.BezahltCheckBox.TabIndex = 13
        Me.BezahltCheckBox.Text = "bezahlt"
        Me.BezahltCheckBox.UseVisualStyleBackColor = True
        '
        'AbgeschlossenCheckBox
        '
        Me.AbgeschlossenCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Abgeschlossen", True))
        Me.AbgeschlossenCheckBox.Enabled = False
        Me.AbgeschlossenCheckBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.AbgeschlossenCheckBox.Location = New System.Drawing.Point(549, 36)
        Me.AbgeschlossenCheckBox.Name = "AbgeschlossenCheckBox"
        Me.AbgeschlossenCheckBox.Size = New System.Drawing.Size(131, 24)
        Me.AbgeschlossenCheckBox.TabIndex = 15
        Me.AbgeschlossenCheckBox.Text = "abgeschlosen"
        Me.AbgeschlossenCheckBox.UseVisualStyleBackColor = True
        '
        'AusgedrucktCheckBox
        '
        Me.AusgedrucktCheckBox.DataBindings.Add(New System.Windows.Forms.Binding("CheckState", Me.BuchvorgangBindingSource, "Ausgedruckt", True))
        Me.AusgedrucktCheckBox.Enabled = False
        Me.AusgedrucktCheckBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.AusgedrucktCheckBox.Location = New System.Drawing.Point(425, 36)
        Me.AusgedrucktCheckBox.Name = "AusgedrucktCheckBox"
        Me.AusgedrucktCheckBox.Size = New System.Drawing.Size(131, 24)
        Me.AusgedrucktCheckBox.TabIndex = 14
        Me.AusgedrucktCheckBox.Text = "ausgedruckt"
        Me.AusgedrucktCheckBox.UseVisualStyleBackColor = True
        '
        'btnAbschliessen
        '
        Me.btnAbschliessen.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAbschliessen.Location = New System.Drawing.Point(416, 551)
        Me.btnAbschliessen.Name = "btnAbschliessen"
        Me.btnAbschliessen.Size = New System.Drawing.Size(140, 55)
        Me.btnAbschliessen.TabIndex = 7
        Me.btnAbschliessen.Text = "Abschliessen"
        Me.btnAbschliessen.UseVisualStyleBackColor = True
        '
        'btnNeu
        '
        Me.btnNeu.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnNeu.ForeColor = System.Drawing.Color.DarkGreen
        Me.btnNeu.Location = New System.Drawing.Point(416, 612)
        Me.btnNeu.Name = "btnNeu"
        Me.btnNeu.Size = New System.Drawing.Size(140, 55)
        Me.btnNeu.TabIndex = 1
        Me.btnNeu.Text = "Neuer Bonn"
        Me.btnNeu.UseVisualStyleBackColor = True
        '
        'btnZweiterAusdruck
        '
        Me.btnZweiterAusdruck.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnZweiterAusdruck.Location = New System.Drawing.Point(562, 551)
        Me.btnZweiterAusdruck.Name = "btnZweiterAusdruck"
        Me.btnZweiterAusdruck.Size = New System.Drawing.Size(140, 55)
        Me.btnZweiterAusdruck.TabIndex = 18
        Me.btnZweiterAusdruck.TabStop = False
        Me.btnZweiterAusdruck.Text = "2. Ausdruck"
        Me.btnZweiterAusdruck.UseVisualStyleBackColor = True
        '
        'btnStorno
        '
        Me.btnStorno.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnStorno.ForeColor = System.Drawing.Color.Red
        Me.btnStorno.Location = New System.Drawing.Point(562, 612)
        Me.btnStorno.Name = "btnStorno"
        Me.btnStorno.Size = New System.Drawing.Size(140, 55)
        Me.btnStorno.TabIndex = 19
        Me.btnStorno.TabStop = False
        Me.btnStorno.Text = "Storno"
        Me.btnStorno.UseVisualStyleBackColor = True
        '
        'WaehrungComboBox
        '
        Me.WaehrungComboBox.BackColor = System.Drawing.SystemColors.Control
        Me.WaehrungComboBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Waehrung", True))
        Me.WaehrungComboBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.WaehrungComboBox.FormattingEnabled = True
        Me.WaehrungComboBox.Location = New System.Drawing.Point(129, 635)
        Me.WaehrungComboBox.Name = "WaehrungComboBox"
        Me.WaehrungComboBox.Size = New System.Drawing.Size(131, 28)
        Me.WaehrungComboBox.TabIndex = 56
        Me.WaehrungComboBox.TabStop = False
        '
        'SummeTextBox
        '
        Me.SummeTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "Summe", True))
        Me.SummeTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.SummeTextBox.Location = New System.Drawing.Point(129, 557)
        Me.SummeTextBox.Name = "SummeTextBox"
        Me.SummeTextBox.ReadOnly = True
        Me.SummeTextBox.Size = New System.Drawing.Size(131, 26)
        Me.SummeTextBox.TabIndex = 53
        Me.SummeTextBox.TabStop = False
        Me.SummeTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'SummeMWSTTextBox
        '
        Me.SummeMWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeMWST", True))
        Me.SummeMWSTTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.SummeMWSTTextBox.Location = New System.Drawing.Point(129, 583)
        Me.SummeMWSTTextBox.Name = "SummeMWSTTextBox"
        Me.SummeMWSTTextBox.ReadOnly = True
        Me.SummeMWSTTextBox.Size = New System.Drawing.Size(131, 26)
        Me.SummeMWSTTextBox.TabIndex = 54
        Me.SummeMWSTTextBox.TabStop = False
        Me.SummeMWSTTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'SummeBruttoTextBox
        '
        Me.SummeBruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.BuchvorgangBindingSource, "SummeBrutto", True))
        Me.SummeBruttoTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.SummeBruttoTextBox.Location = New System.Drawing.Point(129, 609)
        Me.SummeBruttoTextBox.Name = "SummeBruttoTextBox"
        Me.SummeBruttoTextBox.ReadOnly = True
        Me.SummeBruttoTextBox.Size = New System.Drawing.Size(131, 26)
        Me.SummeBruttoTextBox.TabIndex = 55
        Me.SummeBruttoTextBox.TabStop = False
        Me.SummeBruttoTextBox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'Panel1
        '
        Me.Panel1.Controls.Add(Me.Buchvorgang_artikelDataGridView)
        Me.Panel1.Location = New System.Drawing.Point(12, 278)
        Me.Panel1.Name = "Panel1"
        Me.Panel1.Size = New System.Drawing.Size(686, 256)
        Me.Panel1.TabIndex = 61
        '
        'Buchvorgang_artikelDataGridView
        '
        Me.Buchvorgang_artikelDataGridView.AllowUserToAddRows = False
        Me.Buchvorgang_artikelDataGridView.AutoGenerateColumns = False
        Me.Buchvorgang_artikelDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Buchvorgang_artikelDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumnID, Me.DataGridViewTextBoxColumnNummer, Me.DataGridViewTextBoxColumnTyp, Me.DataGridViewTextBoxColumnStk, Me.ArtNrComboBox, Me.DataGridViewTextBoxColumnArtNr, Me.DataGridViewTextBoxColumnBezeichnung, Me.DataGridViewTextBoxColumnPreisNetto, Me.DataGridViewTextBoxColumnPreisBrutto, Me.DataGridViewTextBoxColumnMWST, Me.DataGridViewTextBoxColumnEKPreis, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16, Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn19})
        Me.Buchvorgang_artikelDataGridView.DataSource = Me.Buchvorgang_artikelBindingSource
        Me.Buchvorgang_artikelDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.Buchvorgang_artikelDataGridView.Enabled = False
        Me.Buchvorgang_artikelDataGridView.Location = New System.Drawing.Point(0, 0)
        Me.Buchvorgang_artikelDataGridView.Name = "Buchvorgang_artikelDataGridView"
        Me.Buchvorgang_artikelDataGridView.Size = New System.Drawing.Size(686, 256)
        Me.Buchvorgang_artikelDataGridView.TabIndex = 50
        Me.Buchvorgang_artikelDataGridView.TabStop = False
        '
        'DataGridViewTextBoxColumnID
        '
        Me.DataGridViewTextBoxColumnID.DataPropertyName = "ID"
        Me.DataGridViewTextBoxColumnID.HeaderText = "ID"
        Me.DataGridViewTextBoxColumnID.Name = "DataGridViewTextBoxColumnID"
        Me.DataGridViewTextBoxColumnID.Visible = False
        '
        'DataGridViewTextBoxColumnNummer
        '
        Me.DataGridViewTextBoxColumnNummer.DataPropertyName = "Nummer"
        Me.DataGridViewTextBoxColumnNummer.HeaderText = "Nummer"
        Me.DataGridViewTextBoxColumnNummer.Name = "DataGridViewTextBoxColumnNummer"
        Me.DataGridViewTextBoxColumnNummer.Visible = False
        '
        'DataGridViewTextBoxColumnTyp
        '
        Me.DataGridViewTextBoxColumnTyp.DataPropertyName = "Typ"
        Me.DataGridViewTextBoxColumnTyp.HeaderText = "Typ"
        Me.DataGridViewTextBoxColumnTyp.Name = "DataGridViewTextBoxColumnTyp"
        Me.DataGridViewTextBoxColumnTyp.Visible = False
        '
        'DataGridViewTextBoxColumnStk
        '
        Me.DataGridViewTextBoxColumnStk.DataPropertyName = "Stk"
        Me.DataGridViewTextBoxColumnStk.FillWeight = 75.0!
        Me.DataGridViewTextBoxColumnStk.HeaderText = "Menge"
        Me.DataGridViewTextBoxColumnStk.Name = "DataGridViewTextBoxColumnStk"
        Me.DataGridViewTextBoxColumnStk.Width = 75
        '
        'ArtNrComboBox
        '
        Me.ArtNrComboBox.ContextMenuStrip = Me.ArtikelContextMenuStrip
        Me.ArtNrComboBox.DataPropertyName = "ArtNr"
        Me.ArtNrComboBox.DataSource = Me.GrArtikellisteBindingSource
        Me.ArtNrComboBox.DisplayMember = "EANBezeichung"
        Me.ArtNrComboBox.DropDownWidth = 200
        Me.ArtNrComboBox.HeaderText = "Artikel"
        Me.ArtNrComboBox.MaxDropDownItems = 20
        Me.ArtNrComboBox.Name = "ArtNrComboBox"
        Me.ArtNrComboBox.ValueMember = "ArtNr"
        '
        'ArtikelContextMenuStrip
        '
        Me.ArtikelContextMenuStrip.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.ArtikelstammToolStripMenuItem})
        Me.ArtikelContextMenuStrip.Name = "ArtikelContextMenuStrip"
        Me.ArtikelContextMenuStrip.Size = New System.Drawing.Size(143, 26)
        '
        'ArtikelstammToolStripMenuItem
        '
        Me.ArtikelstammToolStripMenuItem.Name = "ArtikelstammToolStripMenuItem"
        Me.ArtikelstammToolStripMenuItem.Size = New System.Drawing.Size(142, 22)
        Me.ArtikelstammToolStripMenuItem.Text = "Stammdaten"
        '
        'GrArtikellisteBindingSource
        '
        Me.GrArtikellisteBindingSource.DataMember = "grArtikelliste"
        Me.GrArtikellisteBindingSource.DataSource = Me.DsArtikel
        '
        'DsArtikel
        '
        Me.DsArtikel.DataSetName = "dsArtikel"
        Me.DsArtikel.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'DataGridViewTextBoxColumnArtNr
        '
        Me.DataGridViewTextBoxColumnArtNr.DataPropertyName = "ArtNr"
        Me.DataGridViewTextBoxColumnArtNr.HeaderText = "ArtNr"
        Me.DataGridViewTextBoxColumnArtNr.Name = "DataGridViewTextBoxColumnArtNr"
        Me.DataGridViewTextBoxColumnArtNr.Visible = False
        '
        'DataGridViewTextBoxColumnBezeichnung
        '
        Me.DataGridViewTextBoxColumnBezeichnung.DataPropertyName = "Bezeichnung"
        Me.DataGridViewTextBoxColumnBezeichnung.FillWeight = 200.0!
        Me.DataGridViewTextBoxColumnBezeichnung.HeaderText = "Bezeichnung"
        Me.DataGridViewTextBoxColumnBezeichnung.Name = "DataGridViewTextBoxColumnBezeichnung"
        Me.DataGridViewTextBoxColumnBezeichnung.Width = 200
        '
        'DataGridViewTextBoxColumnPreisNetto
        '
        Me.DataGridViewTextBoxColumnPreisNetto.DataPropertyName = "Preis_Netto"
        DataGridViewCellStyle1.Format = "C2"
        DataGridViewCellStyle1.NullValue = "n.a."
        Me.DataGridViewTextBoxColumnPreisNetto.DefaultCellStyle = DataGridViewCellStyle1
        Me.DataGridViewTextBoxColumnPreisNetto.HeaderText = "Preis_Netto"
        Me.DataGridViewTextBoxColumnPreisNetto.Name = "DataGridViewTextBoxColumnPreisNetto"
        '
        'DataGridViewTextBoxColumnPreisBrutto
        '
        Me.DataGridViewTextBoxColumnPreisBrutto.DataPropertyName = "Preis_Brutto"
        DataGridViewCellStyle2.Format = "C2"
        DataGridViewCellStyle2.NullValue = "n.a."
        Me.DataGridViewTextBoxColumnPreisBrutto.DefaultCellStyle = DataGridViewCellStyle2
        Me.DataGridViewTextBoxColumnPreisBrutto.HeaderText = "Preis_Brutto"
        Me.DataGridViewTextBoxColumnPreisBrutto.Name = "DataGridViewTextBoxColumnPreisBrutto"
        '
        'DataGridViewTextBoxColumnMWST
        '
        Me.DataGridViewTextBoxColumnMWST.DataPropertyName = "MWST"
        DataGridViewCellStyle3.Format = "C2"
        DataGridViewCellStyle3.NullValue = "n.a."
        Me.DataGridViewTextBoxColumnMWST.DefaultCellStyle = DataGridViewCellStyle3
        Me.DataGridViewTextBoxColumnMWST.HeaderText = "MWST"
        Me.DataGridViewTextBoxColumnMWST.Name = "DataGridViewTextBoxColumnMWST"
        Me.DataGridViewTextBoxColumnMWST.ReadOnly = True
        '
        'DataGridViewTextBoxColumnEKPreis
        '
        Me.DataGridViewTextBoxColumnEKPreis.DataPropertyName = "EKPreis"
        Me.DataGridViewTextBoxColumnEKPreis.HeaderText = "EKPreis"
        Me.DataGridViewTextBoxColumnEKPreis.Name = "DataGridViewTextBoxColumnEKPreis"
        Me.DataGridViewTextBoxColumnEKPreis.Visible = False
        '
        'DataGridViewTextBoxColumn10
        '
        Me.DataGridViewTextBoxColumn10.DataPropertyName = "ArtikelIdentifikation"
        Me.DataGridViewTextBoxColumn10.HeaderText = "ArtikelIdentifikation"
        Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "LieferantNr"
        Me.DataGridViewTextBoxColumn12.HeaderText = "LieferantNr"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        Me.DataGridViewTextBoxColumn12.Visible = False
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "Status"
        Me.DataGridViewTextBoxColumn13.HeaderText = "Status"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        Me.DataGridViewTextBoxColumn13.Visible = False
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "Referenz"
        Me.DataGridViewTextBoxColumn14.HeaderText = "Referenz"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        Me.DataGridViewTextBoxColumn14.Visible = False
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "Packung"
        Me.DataGridViewTextBoxColumn15.HeaderText = "Packung"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        Me.DataGridViewTextBoxColumn15.Visible = False
        '
        'DataGridViewTextBoxColumn16
        '
        Me.DataGridViewTextBoxColumn16.DataPropertyName = "Herkunft"
        Me.DataGridViewTextBoxColumn16.HeaderText = "Herkunft"
        Me.DataGridViewTextBoxColumn16.Name = "DataGridViewTextBoxColumn16"
        Me.DataGridViewTextBoxColumn16.Visible = False
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "Incoterm"
        Me.DataGridViewTextBoxColumn17.HeaderText = "Incoterm"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        Me.DataGridViewTextBoxColumn17.Visible = False
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "Spezifikation"
        Me.DataGridViewTextBoxColumn18.HeaderText = "Spezifikation"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        Me.DataGridViewTextBoxColumn18.Visible = False
        '
        'DataGridViewTextBoxColumn19
        '
        Me.DataGridViewTextBoxColumn19.DataPropertyName = "Zeitpunkt"
        Me.DataGridViewTextBoxColumn19.HeaderText = "Zeitpunkt"
        Me.DataGridViewTextBoxColumn19.Name = "DataGridViewTextBoxColumn19"
        Me.DataGridViewTextBoxColumn19.Visible = False
        '
        'Buchvorgang_artikelBindingSource
        '
        Me.Buchvorgang_artikelBindingSource.DataMember = "buchVorgang-artikel_ibfk_1"
        Me.Buchvorgang_artikelBindingSource.DataSource = Me.BuchvorgangBindingSource
        '
        'GrArtikellisteTableAdapter
        '
        Me.GrArtikellisteTableAdapter.ClearBeforeFill = True
        '
        'MenuStrip1
        '
        Me.MenuStrip1.Dock = System.Windows.Forms.DockStyle.None
        Me.MenuStrip1.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.VorgangToolStripMenuItem})
        Me.MenuStrip1.Location = New System.Drawing.Point(292, 0)
        Me.MenuStrip1.Name = "MenuStrip1"
        Me.MenuStrip1.Size = New System.Drawing.Size(127, 24)
        Me.MenuStrip1.TabIndex = 63
        Me.MenuStrip1.Text = "MenuStrip1"
        '
        'VorgangToolStripMenuItem
        '
        Me.VorgangToolStripMenuItem.BackColor = System.Drawing.Color.CornflowerBlue
        Me.VorgangToolStripMenuItem.DropDownItems.AddRange(New System.Windows.Forms.ToolStripItem() {Me.NeuerVorgangToolStripMenuItem, Me.AusdruckenToolStripMenuItem, Me.AbschliessenToolStripMenuItem, Me.StornoToolStripMenuItem, Me.ExportierenToolStripMenuItem, Me.KonvertierenToolStripMenuItem, Me.VorlagenToolStripMenuItem, Me.KassaBuchungToolStripMenuItem, Me.SendeEmailToolStripMenuItem, Me.VorlageeditierenToolStripMenuItem})
        Me.VorgangToolStripMenuItem.Name = "VorgangToolStripMenuItem"
        Me.VorgangToolStripMenuItem.Size = New System.Drawing.Size(119, 20)
        Me.VorgangToolStripMenuItem.Text = "&Vorgang Aufgaben"
        '
        'NeuerVorgangToolStripMenuItem
        '
        Me.NeuerVorgangToolStripMenuItem.Name = "NeuerVorgangToolStripMenuItem"
        Me.NeuerVorgangToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.NeuerVorgangToolStripMenuItem.Text = "&Neuer Vorgang"
        '
        'AusdruckenToolStripMenuItem
        '
        Me.AusdruckenToolStripMenuItem.Name = "AusdruckenToolStripMenuItem"
        Me.AusdruckenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.AusdruckenToolStripMenuItem.Text = "Ausdrucken"
        '
        'AbschliessenToolStripMenuItem
        '
        Me.AbschliessenToolStripMenuItem.Name = "AbschliessenToolStripMenuItem"
        Me.AbschliessenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.AbschliessenToolStripMenuItem.Text = "&Abschliessen"
        '
        'StornoToolStripMenuItem
        '
        Me.StornoToolStripMenuItem.Name = "StornoToolStripMenuItem"
        Me.StornoToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.StornoToolStripMenuItem.Text = "&Storno"
        '
        'ExportierenToolStripMenuItem
        '
        Me.ExportierenToolStripMenuItem.Name = "ExportierenToolStripMenuItem"
        Me.ExportierenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.ExportierenToolStripMenuItem.Text = "&Exportieren"
        '
        'KonvertierenToolStripMenuItem
        '
        Me.KonvertierenToolStripMenuItem.Name = "KonvertierenToolStripMenuItem"
        Me.KonvertierenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.KonvertierenToolStripMenuItem.Text = "&Konvertieren"
        '
        'VorlagenToolStripMenuItem
        '
        Me.VorlagenToolStripMenuItem.Name = "VorlagenToolStripMenuItem"
        Me.VorlagenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.VorlagenToolStripMenuItem.Text = "&Vorlagen"
        '
        'KassaBuchungToolStripMenuItem
        '
        Me.KassaBuchungToolStripMenuItem.Name = "KassaBuchungToolStripMenuItem"
        Me.KassaBuchungToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.KassaBuchungToolStripMenuItem.Text = "Kassa &Buchung"
        '
        'SendeEmailToolStripMenuItem
        '
        Me.SendeEmailToolStripMenuItem.Name = "SendeEmailToolStripMenuItem"
        Me.SendeEmailToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.SendeEmailToolStripMenuItem.Text = "Sende &Email"
        '
        'VorlageeditierenToolStripMenuItem
        '
        Me.VorlageeditierenToolStripMenuItem.Name = "VorlageeditierenToolStripMenuItem"
        Me.VorlageeditierenToolStripMenuItem.Size = New System.Drawing.Size(163, 22)
        Me.VorlageeditierenToolStripMenuItem.Text = "Vorlage &editieren"
        '
        'BuchvorgangTableAdapter
        '
        Me.BuchvorgangTableAdapter.ClearBeforeFill = True
        '
        'Buchvorgang_artikelTableAdapter
        '
        Me.Buchvorgang_artikelTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.buchvorgaengeausdruckeTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengeeigenschaftenTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengestatusTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgaengeTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgang_artikeldetaillagerTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgang_artikelTableAdapter = Me.Buchvorgang_artikelTableAdapter
        Me.TableAdapterManager.buchvorgangeigenschaftTableAdapter = Nothing
        Me.TableAdapterManager.buchvorgangTableAdapter = Me.BuchvorgangTableAdapter
        Me.TableAdapterManager.buchvorgangtypTableAdapter = Nothing
        Me.TableAdapterManager.grartikelTableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Button2
        '
        Me.Button2.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button2.Location = New System.Drawing.Point(574, 128)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(140, 46)
        Me.Button2.TabIndex = 17
        Me.Button2.Text = "Neuer Bonn"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'Button1
        '
        Me.Button1.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button1.Location = New System.Drawing.Point(574, 76)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(140, 46)
        Me.Button1.TabIndex = 16
        Me.Button1.Text = "Abschliessen && Drucken"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'Button4
        '
        Me.Button4.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button4.Location = New System.Drawing.Point(720, 128)
        Me.Button4.Name = "Button4"
        Me.Button4.Size = New System.Drawing.Size(140, 46)
        Me.Button4.TabIndex = 19
        Me.Button4.Text = "Storno"
        Me.Button4.UseVisualStyleBackColor = True
        '
        'Button5
        '
        Me.Button5.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Button5.Location = New System.Drawing.Point(480, 204)
        Me.Button5.Name = "Button5"
        Me.Button5.Size = New System.Drawing.Size(86, 46)
        Me.Button5.TabIndex = 70
        Me.Button5.Text = "Einfügen"
        Me.Button5.UseVisualStyleBackColor = True
        '
        'MitarbeiterNrComboBox
        '
        Me.MitarbeiterNrComboBox.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "MitarbeiterNr", True))
        Me.MitarbeiterNrComboBox.IDNR = 0
        Me.MitarbeiterNrComboBox.Location = New System.Drawing.Point(123, 121)
        Me.MitarbeiterNrComboBox.Name = "MitarbeiterNrComboBox"
        Me.MitarbeiterNrComboBox.Size = New System.Drawing.Size(175, 25)
        Me.MitarbeiterNrComboBox.TabIndex = 73
        Me.MitarbeiterNrComboBox.TabStop = False
        '
        'DatumDateTimePicker
        '
        Me.DatumDateTimePicker.DataBindings.Add(New System.Windows.Forms.Binding("Value", Me.BuchvorgangBindingSource, "Datum", True))
        Me.DatumDateTimePicker.Enabled = False
        Me.DatumDateTimePicker.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.DatumDateTimePicker.Location = New System.Drawing.Point(123, 70)
        Me.DatumDateTimePicker.Name = "DatumDateTimePicker"
        Me.DatumDateTimePicker.Size = New System.Drawing.Size(131, 20)
        Me.DatumDateTimePicker.TabIndex = 71
        Me.DatumDateTimePicker.TabStop = False
        '
        'PanelPosition
        '
        Me.PanelPosition.Controls.Add(Me.StkTextBox)
        Me.PanelPosition.Controls.Add(Me.Preis_NettoTextBox)
        Me.PanelPosition.Controls.Add(Me.Preis_BruttoTextBox)
        Me.PanelPosition.Controls.Add(Me.MWSTTextBox)
        Me.PanelPosition.Controls.Add(Me.ArtikelIdentifikationTextBox)
        Me.PanelPosition.Controls.Add(Me.BezeichnungTextBox)
        Me.PanelPosition.Controls.Add(Label1)
        Me.PanelPosition.Controls.Add(Me.btnNeuePosition)
        Me.PanelPosition.Controls.Add(ArtNrLabel)
        Me.PanelPosition.Controls.Add(StkLabel)
        Me.PanelPosition.Controls.Add(Preis_NettoLabel)
        Me.PanelPosition.Controls.Add(Me.ArtikelControl1)
        Me.PanelPosition.Location = New System.Drawing.Point(13, 179)
        Me.PanelPosition.Name = "PanelPosition"
        Me.PanelPosition.Size = New System.Drawing.Size(680, 93)
        Me.PanelPosition.TabIndex = 75
        '
        'StkTextBox
        '
        Me.StkTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.StkTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Stk", True))
        Me.StkTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.StkTextBox.Location = New System.Drawing.Point(320, 29)
        Me.StkTextBox.Name = "StkTextBox"
        Me.StkTextBox.Size = New System.Drawing.Size(58, 26)
        Me.StkTextBox.TabIndex = 3
        '
        'Preis_NettoTextBox
        '
        Me.Preis_NettoTextBox.BackColor = System.Drawing.Color.FromArgb(CType(CType(255, Byte), Integer), CType(CType(255, Byte), Integer), CType(CType(192, Byte), Integer))
        Me.Preis_NettoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Preis_Netto", True, System.Windows.Forms.DataSourceUpdateMode.OnValidation, "n.a.", "C2"))
        Me.Preis_NettoTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Preis_NettoTextBox.Location = New System.Drawing.Point(391, 29)
        Me.Preis_NettoTextBox.Name = "Preis_NettoTextBox"
        Me.Preis_NettoTextBox.Size = New System.Drawing.Size(87, 26)
        Me.Preis_NettoTextBox.TabIndex = 4
        '
        'Preis_BruttoTextBox
        '
        Me.Preis_BruttoTextBox.BackColor = System.Drawing.SystemColors.Control
        Me.Preis_BruttoTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Preis_Brutto", True, System.Windows.Forms.DataSourceUpdateMode.OnValidation, "n.a.", "C2"))
        Me.Preis_BruttoTextBox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Preis_BruttoTextBox.Location = New System.Drawing.Point(489, 29)
        Me.Preis_BruttoTextBox.Name = "Preis_BruttoTextBox"
        Me.Preis_BruttoTextBox.Size = New System.Drawing.Size(92, 26)
        Me.Preis_BruttoTextBox.TabIndex = 84
        Me.Preis_BruttoTextBox.TabStop = False
        '
        'MWSTTextBox
        '
        Me.MWSTTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "MWST", True, System.Windows.Forms.DataSourceUpdateMode.OnValidation, "n.a.", "C2"))
        Me.MWSTTextBox.Enabled = False
        Me.MWSTTextBox.Location = New System.Drawing.Point(394, 64)
        Me.MWSTTextBox.Name = "MWSTTextBox"
        Me.MWSTTextBox.Size = New System.Drawing.Size(104, 20)
        Me.MWSTTextBox.TabIndex = 85
        Me.MWSTTextBox.TabStop = False
        Me.MWSTTextBox.Visible = False
        '
        'ArtikelIdentifikationTextBox
        '
        Me.ArtikelIdentifikationTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "ArtikelIdentifikation", True))
        Me.ArtikelIdentifikationTextBox.Location = New System.Drawing.Point(515, 64)
        Me.ArtikelIdentifikationTextBox.Name = "ArtikelIdentifikationTextBox"
        Me.ArtikelIdentifikationTextBox.Size = New System.Drawing.Size(104, 20)
        Me.ArtikelIdentifikationTextBox.TabIndex = 86
        Me.ArtikelIdentifikationTextBox.TabStop = False
        Me.ArtikelIdentifikationTextBox.Visible = False
        '
        'BezeichnungTextBox
        '
        Me.BezeichnungTextBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.BezeichnungTextBox.DataBindings.Add(New System.Windows.Forms.Binding("Text", Me.Buchvorgang_artikelBindingSource, "Bezeichnung", True))
        Me.BezeichnungTextBox.Location = New System.Drawing.Point(7, 64)
        Me.BezeichnungTextBox.Multiline = True
        Me.BezeichnungTextBox.Name = "BezeichnungTextBox"
        Me.BezeichnungTextBox.Size = New System.Drawing.Size(381, 20)
        Me.BezeichnungTextBox.TabIndex = 81
        Me.BezeichnungTextBox.TabStop = False
        Me.BezeichnungTextBox.Visible = False
        '
        'btnNeuePosition
        '
        Me.btnNeuePosition.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnNeuePosition.Location = New System.Drawing.Point(590, 14)
        Me.btnNeuePosition.Name = "btnNeuePosition"
        Me.btnNeuePosition.Size = New System.Drawing.Size(86, 46)
        Me.btnNeuePosition.TabIndex = 5
        Me.btnNeuePosition.Text = "Einfügen"
        Me.btnNeuePosition.UseVisualStyleBackColor = True
        '
        'ArtikelControl1
        '
        Me.ArtikelControl1.ArtNr = 0
        Me.ArtikelControl1.BackColor = System.Drawing.Color.Transparent
        Me.ArtikelControl1.DataBindings.Add(New System.Windows.Forms.Binding("ArtNr", Me.Buchvorgang_artikelBindingSource, "ArtNr", True))
        Me.ArtikelControl1.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ArtikelControl1.Location = New System.Drawing.Point(7, 24)
        Me.ArtikelControl1.Margin = New System.Windows.Forms.Padding(4, 5, 4, 5)
        Me.ArtikelControl1.Name = "ArtikelControl1"
        Me.ArtikelControl1.ShowAddNew = False
        Me.ArtikelControl1.Size = New System.Drawing.Size(302, 36)
        Me.ArtikelControl1.TabIndex = 2
        '
        'KundNrAdressenControl
        '
        Me.KundNrAdressenControl.BackColor = System.Drawing.Color.LemonChiffon
        Me.KundNrAdressenControl.DataBindings.Add(New System.Windows.Forms.Binding("IDNR", Me.BuchvorgangBindingSource, "KundNr", True))
        Me.KundNrAdressenControl.IDNR = 0
        Me.KundNrAdressenControl.Location = New System.Drawing.Point(123, 148)
        Me.KundNrAdressenControl.Name = "KundNrAdressenControl"
        Me.KundNrAdressenControl.ShowAddNew = False
        Me.KundNrAdressenControl.Size = New System.Drawing.Size(175, 25)
        Me.KundNrAdressenControl.TabIndex = 78
        Me.KundNrAdressenControl.TabStop = False
        '
        'TypComboBox
        '
        Me.TypComboBox.BackColor = System.Drawing.Color.LemonChiffon
        Me.TypComboBox.DataBindings.Add(New System.Windows.Forms.Binding("SelectedValue", Me.BuchvorgangBindingSource, "Typ", True))
        Me.TypComboBox.Enabled = False
        Me.TypComboBox.FormattingEnabled = True
        Me.TypComboBox.Location = New System.Drawing.Point(123, 94)
        Me.TypComboBox.Name = "TypComboBox"
        Me.TypComboBox.Size = New System.Drawing.Size(131, 21)
        Me.TypComboBox.TabIndex = 76
        Me.TypComboBox.TabStop = False
        '
        'GegebenBarTextbox
        '
        Me.GegebenBarTextbox.BackColor = System.Drawing.SystemColors.Window
        Me.GegebenBarTextbox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.GegebenBarTextbox.Location = New System.Drawing.Point(129, 669)
        Me.GegebenBarTextbox.Name = "GegebenBarTextbox"
        Me.GegebenBarTextbox.Size = New System.Drawing.Size(131, 26)
        Me.GegebenBarTextbox.TabIndex = 6
        Me.GegebenBarTextbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'RestgeldTextbox
        '
        Me.RestgeldTextbox.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.RestgeldTextbox.Location = New System.Drawing.Point(129, 701)
        Me.RestgeldTextbox.Name = "RestgeldTextbox"
        Me.RestgeldTextbox.ReadOnly = True
        Me.RestgeldTextbox.Size = New System.Drawing.Size(131, 26)
        Me.RestgeldTextbox.TabIndex = 82
        Me.RestgeldTextbox.TabStop = False
        Me.RestgeldTextbox.TextAlign = System.Windows.Forms.HorizontalAlignment.Right
        '
        'VorgangBar
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(723, 736)
        Me.Controls.Add(Label3)
        Me.Controls.Add(Me.RestgeldTextbox)
        Me.Controls.Add(Label2)
        Me.Controls.Add(Me.GegebenBarTextbox)
        Me.Controls.Add(Me.KundNrAdressenControl)
        Me.Controls.Add(TypLabel)
        Me.Controls.Add(Me.TypComboBox)
        Me.Controls.Add(KundNrLabel)
        Me.Controls.Add(Me.PanelPosition)
        Me.Controls.Add(Me.MitarbeiterNrComboBox)
        Me.Controls.Add(MitarbeiterNrLabel)
        Me.Controls.Add(DatumLabel)
        Me.Controls.Add(Me.DatumDateTimePicker)
        Me.Controls.Add(Me.MenuStrip1)
        Me.Controls.Add(Me.Panel1)
        Me.Controls.Add(WaehrungLabel1)
        Me.Controls.Add(Me.WaehrungComboBox)
        Me.Controls.Add(SummeLabel)
        Me.Controls.Add(Me.SummeTextBox)
        Me.Controls.Add(SummeMWSTLabel)
        Me.Controls.Add(Me.SummeMWSTTextBox)
        Me.Controls.Add(SummeBruttoLabel)
        Me.Controls.Add(Me.SummeBruttoTextBox)
        Me.Controls.Add(Me.btnStorno)
        Me.Controls.Add(Me.btnZweiterAusdruck)
        Me.Controls.Add(Me.btnNeu)
        Me.Controls.Add(Me.btnAbschliessen)
        Me.Controls.Add(Me.BezahltCheckBox)
        Me.Controls.Add(Me.AbgeschlossenCheckBox)
        Me.Controls.Add(Me.AusgedrucktCheckBox)
        Me.Controls.Add(NummerLabel)
        Me.Controls.Add(Me.NummerTextBox)
        Me.Name = "VorgangBar"
        Me.Text = "VorgangBar"
        Me.Controls.SetChildIndex(Me.NummerTextBox, 0)
        Me.Controls.SetChildIndex(NummerLabel, 0)
        Me.Controls.SetChildIndex(Me.AusgedrucktCheckBox, 0)
        Me.Controls.SetChildIndex(Me.AbgeschlossenCheckBox, 0)
        Me.Controls.SetChildIndex(Me.BezahltCheckBox, 0)
        Me.Controls.SetChildIndex(Me.btnAbschliessen, 0)
        Me.Controls.SetChildIndex(Me.btnNeu, 0)
        Me.Controls.SetChildIndex(Me.btnZweiterAusdruck, 0)
        Me.Controls.SetChildIndex(Me.btnStorno, 0)
        Me.Controls.SetChildIndex(Me.SummeBruttoTextBox, 0)
        Me.Controls.SetChildIndex(SummeBruttoLabel, 0)
        Me.Controls.SetChildIndex(Me.SummeMWSTTextBox, 0)
        Me.Controls.SetChildIndex(SummeMWSTLabel, 0)
        Me.Controls.SetChildIndex(Me.SummeTextBox, 0)
        Me.Controls.SetChildIndex(SummeLabel, 0)
        Me.Controls.SetChildIndex(Me.WaehrungComboBox, 0)
        Me.Controls.SetChildIndex(WaehrungLabel1, 0)
        Me.Controls.SetChildIndex(Me.Panel1, 0)
        Me.Controls.SetChildIndex(Me.MenuStrip1, 0)
        Me.Controls.SetChildIndex(Me.DatumDateTimePicker, 0)
        Me.Controls.SetChildIndex(DatumLabel, 0)
        Me.Controls.SetChildIndex(MitarbeiterNrLabel, 0)
        Me.Controls.SetChildIndex(Me.MitarbeiterNrComboBox, 0)
        Me.Controls.SetChildIndex(Me.PanelPosition, 0)
        Me.Controls.SetChildIndex(KundNrLabel, 0)
        Me.Controls.SetChildIndex(Me.TypComboBox, 0)
        Me.Controls.SetChildIndex(TypLabel, 0)
        Me.Controls.SetChildIndex(Me.KundNrAdressenControl, 0)
        Me.Controls.SetChildIndex(Me.GegebenBarTextbox, 0)
        Me.Controls.SetChildIndex(Label2, 0)
        Me.Controls.SetChildIndex(Me.RestgeldTextbox, 0)
        Me.Controls.SetChildIndex(Label3, 0)
        CType(Me.BuchvorgangBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsVorgaenge, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Panel1.ResumeLayout(False)
        CType(Me.Buchvorgang_artikelDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ArtikelContextMenuStrip.ResumeLayout(False)
        CType(Me.GrArtikellisteBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Buchvorgang_artikelBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.MenuStrip1.ResumeLayout(False)
        Me.MenuStrip1.PerformLayout()
        Me.PanelPosition.ResumeLayout(False)
        Me.PanelPosition.PerformLayout()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents NummerTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezahltCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AbgeschlossenCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents AusgedrucktCheckBox As System.Windows.Forms.CheckBox
    Friend WithEvents btnAbschliessen As System.Windows.Forms.Button
    Friend WithEvents btnNeu As System.Windows.Forms.Button
    Friend WithEvents btnZweiterAusdruck As System.Windows.Forms.Button
    Friend WithEvents btnStorno As System.Windows.Forms.Button
    Friend WithEvents WaehrungComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents SummeTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeMWSTTextBox As System.Windows.Forms.TextBox
    Friend WithEvents SummeBruttoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Panel1 As System.Windows.Forms.Panel
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents DsVorgaenge As IntraSell_Net.dsVorgaenge
    Friend WithEvents GrArtikellisteTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grArtikellisteTableAdapter
    Friend WithEvents GrArtikellisteBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents MenuStrip1 As System.Windows.Forms.MenuStrip
    Friend WithEvents VorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents NeuerVorgangToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AusdruckenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents AbschliessenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents StornoToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ExportierenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KonvertierenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorlagenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents KassaBuchungToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents SendeEmailToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents VorlageeditierenToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents ArtikelContextMenuStrip As System.Windows.Forms.ContextMenuStrip
    Friend WithEvents ArtikelstammToolStripMenuItem As System.Windows.Forms.ToolStripMenuItem
    Friend WithEvents BuchvorgangBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents Buchvorgang_artikelBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents BuchvorgangTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgangTableAdapter
    Friend WithEvents Buchvorgang_artikelTableAdapter As IntraSell_Net.dsVorgaengeTableAdapters.buchvorgang_artikelTableAdapter
    Friend WithEvents TableAdapterManager As IntraSell_Net.dsVorgaengeTableAdapters.TableAdapterManager
    Friend WithEvents Buchvorgang_artikelDataGridView As System.Windows.Forms.DataGridView
    Friend WithEvents DataGridViewTextBoxColumnID As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnNummer As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnTyp As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnStk As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ArtNrComboBox As System.Windows.Forms.DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnArtNr As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnBezeichnung As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnPreisNetto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnPreisBrutto As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnMWST As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumnEKPreis As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn17 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn19 As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Button2 As System.Windows.Forms.Button
    Friend WithEvents Button1 As System.Windows.Forms.Button
    Friend WithEvents Button4 As System.Windows.Forms.Button
    Friend WithEvents Button5 As System.Windows.Forms.Button
    Friend WithEvents MitarbeiterNrComboBox As IntraSell_Net.MitarbeiterControl
    Friend WithEvents DatumDateTimePicker As System.Windows.Forms.DateTimePicker
    Friend WithEvents PanelPosition As System.Windows.Forms.Panel
    Friend WithEvents btnNeuePosition As System.Windows.Forms.Button
    Friend WithEvents ArtikelControl1 As IntraSell_Net.ArtikelControl
    Friend WithEvents StkTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Preis_NettoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents Preis_BruttoTextBox As System.Windows.Forms.TextBox
    Friend WithEvents MWSTTextBox As System.Windows.Forms.TextBox
    Friend WithEvents ArtikelIdentifikationTextBox As System.Windows.Forms.TextBox
    Friend WithEvents BezeichnungTextBox As System.Windows.Forms.TextBox
    Friend WithEvents KundNrAdressenControl As IntraSell_Net.AdressenControl
    Friend WithEvents TypComboBox As System.Windows.Forms.ComboBox
    Friend WithEvents GegebenBarTextbox As System.Windows.Forms.TextBox
    Friend WithEvents RestgeldTextbox As System.Windows.Forms.TextBox
End Class
