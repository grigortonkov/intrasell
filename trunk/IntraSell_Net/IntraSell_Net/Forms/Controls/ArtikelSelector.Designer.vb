<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ArtikelSelector
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
        Me.Label1 = New System.Windows.Forms.Label()
        Me.txtSuche = New System.Windows.Forms.TextBox()
        Me.btnUebernehmen = New System.Windows.Forms.Button()
        Me.dgArtikel = New System.Windows.Forms.DataGridView()
        Me.ArtNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EANDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BezeichnungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Bezeichnung1DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BeschreibungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EinheitDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PreisATSDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PreisATSBruttoDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LagerArtikelDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.EKPreisDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LEKPreisDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SeriennummerDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.LieferantNRDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SetArtikelDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ArtKatNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MWSTDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PictureDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerNrDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ProduktAktivDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ShopURLDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerURLDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ModifikationenDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerRabattDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HerstellerRabattTextDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AngelegtAnDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BruttoGewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NettoGewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TaraGewichtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AngelegtAmDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NichtBestellbarDataGridViewCheckBoxColumn = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GrartikelBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DsArtikel = New IntraSell_Net.dsArtikel()
        Me.GrartikelTableAdapter = New IntraSell_Net.dsArtikelTableAdapters.grartikelTableAdapter()
        Me.btnDetails = New System.Windows.Forms.Button()
        CType(Me.dgArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.GrartikelBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(12, 12)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(41, 13)
        Me.Label1.TabIndex = 0
        Me.Label1.Text = "Suche:"
        '
        'txtSuche
        '
        Me.txtSuche.Location = New System.Drawing.Point(57, 9)
        Me.txtSuche.Name = "txtSuche"
        Me.txtSuche.Size = New System.Drawing.Size(100, 20)
        Me.txtSuche.TabIndex = 1
        '
        'btnUebernehmen
        '
        Me.btnUebernehmen.Location = New System.Drawing.Point(279, 7)
        Me.btnUebernehmen.Name = "btnUebernehmen"
        Me.btnUebernehmen.Size = New System.Drawing.Size(132, 23)
        Me.btnUebernehmen.TabIndex = 2
        Me.btnUebernehmen.Text = "Auswahl übernehmen"
        Me.btnUebernehmen.UseVisualStyleBackColor = True
        '
        'dgArtikel
        '
        Me.dgArtikel.AllowUserToAddRows = False
        Me.dgArtikel.AllowUserToDeleteRows = False
        Me.dgArtikel.AutoGenerateColumns = False
        Me.dgArtikel.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.dgArtikel.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.ArtNrDataGridViewTextBoxColumn, Me.EANDataGridViewTextBoxColumn, Me.BezeichnungDataGridViewTextBoxColumn, Me.Bezeichnung1DataGridViewTextBoxColumn, Me.BeschreibungDataGridViewTextBoxColumn, Me.EinheitDataGridViewTextBoxColumn, Me.PreisATSDataGridViewTextBoxColumn, Me.PreisATSBruttoDataGridViewTextBoxColumn, Me.LagerArtikelDataGridViewCheckBoxColumn, Me.EKPreisDataGridViewTextBoxColumn, Me.LEKPreisDataGridViewTextBoxColumn, Me.SeriennummerDataGridViewCheckBoxColumn, Me.LieferantNRDataGridViewTextBoxColumn, Me.SetArtikelDataGridViewCheckBoxColumn, Me.ArtKatNrDataGridViewTextBoxColumn, Me.MWSTDataGridViewTextBoxColumn, Me.GewichtDataGridViewTextBoxColumn, Me.PictureDataGridViewTextBoxColumn, Me.HerstellerNrDataGridViewTextBoxColumn, Me.ProduktAktivDataGridViewCheckBoxColumn, Me.ShopURLDataGridViewTextBoxColumn, Me.HerstellerURLDataGridViewTextBoxColumn, Me.ModifikationenDataGridViewTextBoxColumn, Me.HerstellerRabattDataGridViewTextBoxColumn, Me.HerstellerRabattTextDataGridViewTextBoxColumn, Me.AngelegtAnDataGridViewTextBoxColumn, Me.BruttoGewichtDataGridViewTextBoxColumn, Me.NettoGewichtDataGridViewTextBoxColumn, Me.TaraGewichtDataGridViewTextBoxColumn, Me.AngelegtAmDataGridViewTextBoxColumn, Me.NichtBestellbarDataGridViewCheckBoxColumn, Me.ProduktAktivOnlineDataGridViewTextBoxColumn})
        Me.dgArtikel.DataSource = Me.GrartikelBindingSource
        Me.dgArtikel.Location = New System.Drawing.Point(12, 36)
        Me.dgArtikel.Name = "dgArtikel"
        Me.dgArtikel.ReadOnly = True
        Me.dgArtikel.Size = New System.Drawing.Size(537, 214)
        Me.dgArtikel.TabIndex = 3
        '
        'ArtNrDataGridViewTextBoxColumn
        '
        Me.ArtNrDataGridViewTextBoxColumn.DataPropertyName = "ArtNr"
        Me.ArtNrDataGridViewTextBoxColumn.HeaderText = "ArtNr"
        Me.ArtNrDataGridViewTextBoxColumn.Name = "ArtNrDataGridViewTextBoxColumn"
        Me.ArtNrDataGridViewTextBoxColumn.ReadOnly = True
        '
        'EANDataGridViewTextBoxColumn
        '
        Me.EANDataGridViewTextBoxColumn.DataPropertyName = "EAN"
        Me.EANDataGridViewTextBoxColumn.HeaderText = "EAN"
        Me.EANDataGridViewTextBoxColumn.Name = "EANDataGridViewTextBoxColumn"
        Me.EANDataGridViewTextBoxColumn.ReadOnly = True
        '
        'BezeichnungDataGridViewTextBoxColumn
        '
        Me.BezeichnungDataGridViewTextBoxColumn.DataPropertyName = "Bezeichnung"
        Me.BezeichnungDataGridViewTextBoxColumn.HeaderText = "Bezeichnung"
        Me.BezeichnungDataGridViewTextBoxColumn.Name = "BezeichnungDataGridViewTextBoxColumn"
        Me.BezeichnungDataGridViewTextBoxColumn.ReadOnly = True
        '
        'Bezeichnung1DataGridViewTextBoxColumn
        '
        Me.Bezeichnung1DataGridViewTextBoxColumn.DataPropertyName = "Bezeichnung1"
        Me.Bezeichnung1DataGridViewTextBoxColumn.HeaderText = "Bezeichnung1"
        Me.Bezeichnung1DataGridViewTextBoxColumn.Name = "Bezeichnung1DataGridViewTextBoxColumn"
        Me.Bezeichnung1DataGridViewTextBoxColumn.ReadOnly = True
        Me.Bezeichnung1DataGridViewTextBoxColumn.Visible = False
        '
        'BeschreibungDataGridViewTextBoxColumn
        '
        Me.BeschreibungDataGridViewTextBoxColumn.DataPropertyName = "Beschreibung"
        Me.BeschreibungDataGridViewTextBoxColumn.HeaderText = "Beschreibung"
        Me.BeschreibungDataGridViewTextBoxColumn.Name = "BeschreibungDataGridViewTextBoxColumn"
        Me.BeschreibungDataGridViewTextBoxColumn.ReadOnly = True
        Me.BeschreibungDataGridViewTextBoxColumn.Visible = False
        '
        'EinheitDataGridViewTextBoxColumn
        '
        Me.EinheitDataGridViewTextBoxColumn.DataPropertyName = "Einheit"
        Me.EinheitDataGridViewTextBoxColumn.HeaderText = "Einheit"
        Me.EinheitDataGridViewTextBoxColumn.Name = "EinheitDataGridViewTextBoxColumn"
        Me.EinheitDataGridViewTextBoxColumn.ReadOnly = True
        Me.EinheitDataGridViewTextBoxColumn.Visible = False
        '
        'PreisATSDataGridViewTextBoxColumn
        '
        Me.PreisATSDataGridViewTextBoxColumn.DataPropertyName = "PreisATS"
        Me.PreisATSDataGridViewTextBoxColumn.HeaderText = "Preis"
        Me.PreisATSDataGridViewTextBoxColumn.Name = "PreisATSDataGridViewTextBoxColumn"
        Me.PreisATSDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PreisATSBruttoDataGridViewTextBoxColumn
        '
        Me.PreisATSBruttoDataGridViewTextBoxColumn.DataPropertyName = "PreisATS_Brutto"
        Me.PreisATSBruttoDataGridViewTextBoxColumn.HeaderText = "PreisATS_Brutto"
        Me.PreisATSBruttoDataGridViewTextBoxColumn.Name = "PreisATSBruttoDataGridViewTextBoxColumn"
        Me.PreisATSBruttoDataGridViewTextBoxColumn.ReadOnly = True
        Me.PreisATSBruttoDataGridViewTextBoxColumn.Visible = False
        '
        'LagerArtikelDataGridViewCheckBoxColumn
        '
        Me.LagerArtikelDataGridViewCheckBoxColumn.DataPropertyName = "LagerArtikel"
        Me.LagerArtikelDataGridViewCheckBoxColumn.HeaderText = "LagerArtikel"
        Me.LagerArtikelDataGridViewCheckBoxColumn.Name = "LagerArtikelDataGridViewCheckBoxColumn"
        Me.LagerArtikelDataGridViewCheckBoxColumn.ReadOnly = True
        Me.LagerArtikelDataGridViewCheckBoxColumn.Visible = False
        '
        'EKPreisDataGridViewTextBoxColumn
        '
        Me.EKPreisDataGridViewTextBoxColumn.DataPropertyName = "EKPreis"
        Me.EKPreisDataGridViewTextBoxColumn.HeaderText = "EKPreis"
        Me.EKPreisDataGridViewTextBoxColumn.Name = "EKPreisDataGridViewTextBoxColumn"
        Me.EKPreisDataGridViewTextBoxColumn.ReadOnly = True
        Me.EKPreisDataGridViewTextBoxColumn.Visible = False
        '
        'LEKPreisDataGridViewTextBoxColumn
        '
        Me.LEKPreisDataGridViewTextBoxColumn.DataPropertyName = "LEKPreis"
        Me.LEKPreisDataGridViewTextBoxColumn.HeaderText = "LEKPreis"
        Me.LEKPreisDataGridViewTextBoxColumn.Name = "LEKPreisDataGridViewTextBoxColumn"
        Me.LEKPreisDataGridViewTextBoxColumn.ReadOnly = True
        Me.LEKPreisDataGridViewTextBoxColumn.Visible = False
        '
        'SeriennummerDataGridViewCheckBoxColumn
        '
        Me.SeriennummerDataGridViewCheckBoxColumn.DataPropertyName = "Seriennummer"
        Me.SeriennummerDataGridViewCheckBoxColumn.HeaderText = "Seriennummer"
        Me.SeriennummerDataGridViewCheckBoxColumn.Name = "SeriennummerDataGridViewCheckBoxColumn"
        Me.SeriennummerDataGridViewCheckBoxColumn.ReadOnly = True
        Me.SeriennummerDataGridViewCheckBoxColumn.Visible = False
        '
        'LieferantNRDataGridViewTextBoxColumn
        '
        Me.LieferantNRDataGridViewTextBoxColumn.DataPropertyName = "LieferantNR"
        Me.LieferantNRDataGridViewTextBoxColumn.HeaderText = "LieferantNR"
        Me.LieferantNRDataGridViewTextBoxColumn.Name = "LieferantNRDataGridViewTextBoxColumn"
        Me.LieferantNRDataGridViewTextBoxColumn.ReadOnly = True
        Me.LieferantNRDataGridViewTextBoxColumn.Visible = False
        '
        'SetArtikelDataGridViewCheckBoxColumn
        '
        Me.SetArtikelDataGridViewCheckBoxColumn.DataPropertyName = "SetArtikel"
        Me.SetArtikelDataGridViewCheckBoxColumn.HeaderText = "SetArtikel"
        Me.SetArtikelDataGridViewCheckBoxColumn.Name = "SetArtikelDataGridViewCheckBoxColumn"
        Me.SetArtikelDataGridViewCheckBoxColumn.ReadOnly = True
        Me.SetArtikelDataGridViewCheckBoxColumn.Visible = False
        '
        'ArtKatNrDataGridViewTextBoxColumn
        '
        Me.ArtKatNrDataGridViewTextBoxColumn.DataPropertyName = "ArtKatNr"
        Me.ArtKatNrDataGridViewTextBoxColumn.HeaderText = "ArtKatNr"
        Me.ArtKatNrDataGridViewTextBoxColumn.Name = "ArtKatNrDataGridViewTextBoxColumn"
        Me.ArtKatNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.ArtKatNrDataGridViewTextBoxColumn.Visible = False
        '
        'MWSTDataGridViewTextBoxColumn
        '
        Me.MWSTDataGridViewTextBoxColumn.DataPropertyName = "MWST"
        Me.MWSTDataGridViewTextBoxColumn.HeaderText = "MWST"
        Me.MWSTDataGridViewTextBoxColumn.Name = "MWSTDataGridViewTextBoxColumn"
        Me.MWSTDataGridViewTextBoxColumn.ReadOnly = True
        Me.MWSTDataGridViewTextBoxColumn.Visible = False
        '
        'GewichtDataGridViewTextBoxColumn
        '
        Me.GewichtDataGridViewTextBoxColumn.DataPropertyName = "Gewicht"
        Me.GewichtDataGridViewTextBoxColumn.HeaderText = "Gewicht"
        Me.GewichtDataGridViewTextBoxColumn.Name = "GewichtDataGridViewTextBoxColumn"
        Me.GewichtDataGridViewTextBoxColumn.ReadOnly = True
        '
        'PictureDataGridViewTextBoxColumn
        '
        Me.PictureDataGridViewTextBoxColumn.DataPropertyName = "Picture"
        Me.PictureDataGridViewTextBoxColumn.HeaderText = "Picture"
        Me.PictureDataGridViewTextBoxColumn.Name = "PictureDataGridViewTextBoxColumn"
        Me.PictureDataGridViewTextBoxColumn.ReadOnly = True
        Me.PictureDataGridViewTextBoxColumn.Visible = False
        '
        'HerstellerNrDataGridViewTextBoxColumn
        '
        Me.HerstellerNrDataGridViewTextBoxColumn.DataPropertyName = "HerstellerNr"
        Me.HerstellerNrDataGridViewTextBoxColumn.HeaderText = "HerstellerNr"
        Me.HerstellerNrDataGridViewTextBoxColumn.Name = "HerstellerNrDataGridViewTextBoxColumn"
        Me.HerstellerNrDataGridViewTextBoxColumn.ReadOnly = True
        Me.HerstellerNrDataGridViewTextBoxColumn.Visible = False
        '
        'ProduktAktivDataGridViewCheckBoxColumn
        '
        Me.ProduktAktivDataGridViewCheckBoxColumn.DataPropertyName = "ProduktAktiv"
        Me.ProduktAktivDataGridViewCheckBoxColumn.HeaderText = "ProduktAktiv"
        Me.ProduktAktivDataGridViewCheckBoxColumn.Name = "ProduktAktivDataGridViewCheckBoxColumn"
        Me.ProduktAktivDataGridViewCheckBoxColumn.ReadOnly = True
        Me.ProduktAktivDataGridViewCheckBoxColumn.Visible = False
        '
        'ShopURLDataGridViewTextBoxColumn
        '
        Me.ShopURLDataGridViewTextBoxColumn.DataPropertyName = "ShopURL"
        Me.ShopURLDataGridViewTextBoxColumn.HeaderText = "ShopURL"
        Me.ShopURLDataGridViewTextBoxColumn.Name = "ShopURLDataGridViewTextBoxColumn"
        Me.ShopURLDataGridViewTextBoxColumn.ReadOnly = True
        Me.ShopURLDataGridViewTextBoxColumn.Visible = False
        '
        'HerstellerURLDataGridViewTextBoxColumn
        '
        Me.HerstellerURLDataGridViewTextBoxColumn.DataPropertyName = "HerstellerURL"
        Me.HerstellerURLDataGridViewTextBoxColumn.HeaderText = "HerstellerURL"
        Me.HerstellerURLDataGridViewTextBoxColumn.Name = "HerstellerURLDataGridViewTextBoxColumn"
        Me.HerstellerURLDataGridViewTextBoxColumn.ReadOnly = True
        Me.HerstellerURLDataGridViewTextBoxColumn.Visible = False
        '
        'ModifikationenDataGridViewTextBoxColumn
        '
        Me.ModifikationenDataGridViewTextBoxColumn.DataPropertyName = "Modifikationen"
        Me.ModifikationenDataGridViewTextBoxColumn.HeaderText = "Modifikationen"
        Me.ModifikationenDataGridViewTextBoxColumn.Name = "ModifikationenDataGridViewTextBoxColumn"
        Me.ModifikationenDataGridViewTextBoxColumn.ReadOnly = True
        Me.ModifikationenDataGridViewTextBoxColumn.Visible = False
        '
        'HerstellerRabattDataGridViewTextBoxColumn
        '
        Me.HerstellerRabattDataGridViewTextBoxColumn.DataPropertyName = "HerstellerRabatt"
        Me.HerstellerRabattDataGridViewTextBoxColumn.HeaderText = "HerstellerRabatt"
        Me.HerstellerRabattDataGridViewTextBoxColumn.Name = "HerstellerRabattDataGridViewTextBoxColumn"
        Me.HerstellerRabattDataGridViewTextBoxColumn.ReadOnly = True
        Me.HerstellerRabattDataGridViewTextBoxColumn.Visible = False
        '
        'HerstellerRabattTextDataGridViewTextBoxColumn
        '
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.DataPropertyName = "HerstellerRabattText"
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.HeaderText = "HerstellerRabattText"
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.Name = "HerstellerRabattTextDataGridViewTextBoxColumn"
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.ReadOnly = True
        Me.HerstellerRabattTextDataGridViewTextBoxColumn.Visible = False
        '
        'AngelegtAnDataGridViewTextBoxColumn
        '
        Me.AngelegtAnDataGridViewTextBoxColumn.DataPropertyName = "AngelegtAn"
        Me.AngelegtAnDataGridViewTextBoxColumn.HeaderText = "AngelegtAn"
        Me.AngelegtAnDataGridViewTextBoxColumn.Name = "AngelegtAnDataGridViewTextBoxColumn"
        Me.AngelegtAnDataGridViewTextBoxColumn.ReadOnly = True
        Me.AngelegtAnDataGridViewTextBoxColumn.Visible = False
        '
        'BruttoGewichtDataGridViewTextBoxColumn
        '
        Me.BruttoGewichtDataGridViewTextBoxColumn.DataPropertyName = "BruttoGewicht"
        Me.BruttoGewichtDataGridViewTextBoxColumn.HeaderText = "BruttoGewicht"
        Me.BruttoGewichtDataGridViewTextBoxColumn.Name = "BruttoGewichtDataGridViewTextBoxColumn"
        Me.BruttoGewichtDataGridViewTextBoxColumn.ReadOnly = True
        Me.BruttoGewichtDataGridViewTextBoxColumn.Visible = False
        '
        'NettoGewichtDataGridViewTextBoxColumn
        '
        Me.NettoGewichtDataGridViewTextBoxColumn.DataPropertyName = "NettoGewicht"
        Me.NettoGewichtDataGridViewTextBoxColumn.HeaderText = "NettoGewicht"
        Me.NettoGewichtDataGridViewTextBoxColumn.Name = "NettoGewichtDataGridViewTextBoxColumn"
        Me.NettoGewichtDataGridViewTextBoxColumn.ReadOnly = True
        Me.NettoGewichtDataGridViewTextBoxColumn.Visible = False
        '
        'TaraGewichtDataGridViewTextBoxColumn
        '
        Me.TaraGewichtDataGridViewTextBoxColumn.DataPropertyName = "TaraGewicht"
        Me.TaraGewichtDataGridViewTextBoxColumn.HeaderText = "TaraGewicht"
        Me.TaraGewichtDataGridViewTextBoxColumn.Name = "TaraGewichtDataGridViewTextBoxColumn"
        Me.TaraGewichtDataGridViewTextBoxColumn.ReadOnly = True
        Me.TaraGewichtDataGridViewTextBoxColumn.Visible = False
        '
        'AngelegtAmDataGridViewTextBoxColumn
        '
        Me.AngelegtAmDataGridViewTextBoxColumn.DataPropertyName = "AngelegtAm"
        Me.AngelegtAmDataGridViewTextBoxColumn.HeaderText = "AngelegtAm"
        Me.AngelegtAmDataGridViewTextBoxColumn.Name = "AngelegtAmDataGridViewTextBoxColumn"
        Me.AngelegtAmDataGridViewTextBoxColumn.ReadOnly = True
        Me.AngelegtAmDataGridViewTextBoxColumn.Visible = False
        '
        'NichtBestellbarDataGridViewCheckBoxColumn
        '
        Me.NichtBestellbarDataGridViewCheckBoxColumn.DataPropertyName = "NichtBestellbar"
        Me.NichtBestellbarDataGridViewCheckBoxColumn.HeaderText = "NichtBestellbar"
        Me.NichtBestellbarDataGridViewCheckBoxColumn.Name = "NichtBestellbarDataGridViewCheckBoxColumn"
        Me.NichtBestellbarDataGridViewCheckBoxColumn.ReadOnly = True
        Me.NichtBestellbarDataGridViewCheckBoxColumn.Visible = False
        '
        'ProduktAktivOnlineDataGridViewTextBoxColumn
        '
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.DataPropertyName = "ProduktAktivOnline"
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.HeaderText = "ProduktAktivOnline"
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.Name = "ProduktAktivOnlineDataGridViewTextBoxColumn"
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.ReadOnly = True
        Me.ProduktAktivOnlineDataGridViewTextBoxColumn.Visible = False
        '
        'GrartikelBindingSource
        '
        Me.GrartikelBindingSource.DataMember = "grartikel"
        Me.GrartikelBindingSource.DataSource = Me.DsArtikel
        '
        'DsArtikel
        '
        Me.DsArtikel.DataSetName = "dsArtikel"
        Me.DsArtikel.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'GrartikelTableAdapter
        '
        Me.GrartikelTableAdapter.ClearBeforeFill = True
        '
        'btnDetails
        '
        Me.btnDetails.Location = New System.Drawing.Point(417, 7)
        Me.btnDetails.Name = "btnDetails"
        Me.btnDetails.Size = New System.Drawing.Size(132, 23)
        Me.btnDetails.TabIndex = 3
        Me.btnDetails.Text = "Details"
        Me.btnDetails.UseVisualStyleBackColor = True
        '
        'ArtikelSelector
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(561, 262)
        Me.Controls.Add(Me.btnDetails)
        Me.Controls.Add(Me.dgArtikel)
        Me.Controls.Add(Me.btnUebernehmen)
        Me.Controls.Add(Me.txtSuche)
        Me.Controls.Add(Me.Label1)
        Me.Name = "ArtikelSelector"
        Me.Text = "Artikel Selector"
        CType(Me.dgArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.GrartikelBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DsArtikel, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents txtSuche As System.Windows.Forms.TextBox
    Friend WithEvents btnUebernehmen As System.Windows.Forms.Button
    Friend WithEvents dgArtikel As System.Windows.Forms.DataGridView
    Friend WithEvents DsArtikel As IntraSell_Net.dsArtikel
    Friend WithEvents GrartikelBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents GrartikelTableAdapter As IntraSell_Net.dsArtikelTableAdapters.grartikelTableAdapter
    Friend WithEvents ArtNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EANDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BezeichnungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Bezeichnung1DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BeschreibungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EinheitDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PreisATSDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PreisATSBruttoDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LagerArtikelDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents EKPreisDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LEKPreisDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SeriennummerDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents LieferantNRDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SetArtikelDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ArtKatNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MWSTDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents GewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PictureDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerNrDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ProduktAktivDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ShopURLDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerURLDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ModifikationenDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerRabattDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HerstellerRabattTextDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AngelegtAnDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BruttoGewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NettoGewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TaraGewichtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AngelegtAmDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NichtBestellbarDataGridViewCheckBoxColumn As System.Windows.Forms.DataGridViewCheckBoxColumn
    Friend WithEvents ProduktAktivOnlineDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents btnDetails As System.Windows.Forms.Button
End Class
