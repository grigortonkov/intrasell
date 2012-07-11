<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class KundenListe
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
        Me.DataGridView1 = New System.Windows.Forms.DataGridView()
        Me.IDNRDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.StatusDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BrancheDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BriefanredeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TitelDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AnredeDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.VornameDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Name1DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FirmaDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AdresseDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.LandDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PLZDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OrtDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TelDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Tel2DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FaxDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Fax2DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MobilDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EmailDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.WebDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.ExportDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AngelegtAnDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MAAusenDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MAInnenDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.AbbuchungDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.HasMenuDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.PasswortDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.NextIDNRDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MandantDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.GeburtstagDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.UIDDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.SkypeAdresseDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.MessengerAdresseDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EUNummerDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EUNummer1DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.EUNummer2DataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BHReferenzDataGridViewTextBoxColumn = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.OfAdressenBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataSetKunden = New IntraSell_Net.dsAdressen()
        Me.OfAdressenTableAdapter = New IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter()
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.OfAdressenBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataSetKunden, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'DataGridView1
        '
        Me.DataGridView1.AllowUserToOrderColumns = True
        Me.DataGridView1.AutoGenerateColumns = False
        Me.DataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.DataGridView1.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.IDNRDataGridViewTextBoxColumn, Me.StatusDataGridViewTextBoxColumn, Me.BrancheDataGridViewTextBoxColumn, Me.BriefanredeDataGridViewTextBoxColumn, Me.TitelDataGridViewTextBoxColumn, Me.AnredeDataGridViewTextBoxColumn, Me.NameDataGridViewTextBoxColumn, Me.VornameDataGridViewTextBoxColumn, Me.Name1DataGridViewTextBoxColumn, Me.FirmaDataGridViewTextBoxColumn, Me.AdresseDataGridViewTextBoxColumn, Me.LandDataGridViewTextBoxColumn, Me.PLZDataGridViewTextBoxColumn, Me.OrtDataGridViewTextBoxColumn, Me.TelDataGridViewTextBoxColumn, Me.Tel2DataGridViewTextBoxColumn, Me.FaxDataGridViewTextBoxColumn, Me.Fax2DataGridViewTextBoxColumn, Me.MobilDataGridViewTextBoxColumn, Me.EmailDataGridViewTextBoxColumn, Me.WebDataGridViewTextBoxColumn, Me.ExportDataGridViewTextBoxColumn, Me.AngelegtAnDataGridViewTextBoxColumn, Me.MAAusenDataGridViewTextBoxColumn, Me.MAInnenDataGridViewTextBoxColumn, Me.AbbuchungDataGridViewTextBoxColumn, Me.HasMenuDataGridViewTextBoxColumn, Me.PasswortDataGridViewTextBoxColumn, Me.NextIDNRDataGridViewTextBoxColumn, Me.MandantDataGridViewTextBoxColumn, Me.GeburtstagDataGridViewTextBoxColumn, Me.UIDDataGridViewTextBoxColumn, Me.SkypeAdresseDataGridViewTextBoxColumn, Me.MessengerAdresseDataGridViewTextBoxColumn, Me.EUNummerDataGridViewTextBoxColumn, Me.EUNummer1DataGridViewTextBoxColumn, Me.EUNummer2DataGridViewTextBoxColumn, Me.BHReferenzDataGridViewTextBoxColumn})
        Me.DataGridView1.DataSource = Me.OfAdressenBindingSource
        Me.DataGridView1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.DataGridView1.Location = New System.Drawing.Point(0, 0)
        Me.DataGridView1.Name = "DataGridView1"
        Me.DataGridView1.Size = New System.Drawing.Size(1190, 468)
        Me.DataGridView1.TabIndex = 0
        '
        'IDNRDataGridViewTextBoxColumn
        '
        Me.IDNRDataGridViewTextBoxColumn.DataPropertyName = "IDNR"
        Me.IDNRDataGridViewTextBoxColumn.HeaderText = "IDNR"
        Me.IDNRDataGridViewTextBoxColumn.Name = "IDNRDataGridViewTextBoxColumn"
        '
        'StatusDataGridViewTextBoxColumn
        '
        Me.StatusDataGridViewTextBoxColumn.DataPropertyName = "Status"
        Me.StatusDataGridViewTextBoxColumn.HeaderText = "Status"
        Me.StatusDataGridViewTextBoxColumn.Name = "StatusDataGridViewTextBoxColumn"
        '
        'BrancheDataGridViewTextBoxColumn
        '
        Me.BrancheDataGridViewTextBoxColumn.DataPropertyName = "Branche"
        Me.BrancheDataGridViewTextBoxColumn.HeaderText = "Branche"
        Me.BrancheDataGridViewTextBoxColumn.Name = "BrancheDataGridViewTextBoxColumn"
        '
        'BriefanredeDataGridViewTextBoxColumn
        '
        Me.BriefanredeDataGridViewTextBoxColumn.DataPropertyName = "Briefanrede"
        Me.BriefanredeDataGridViewTextBoxColumn.HeaderText = "Briefanrede"
        Me.BriefanredeDataGridViewTextBoxColumn.Name = "BriefanredeDataGridViewTextBoxColumn"
        '
        'TitelDataGridViewTextBoxColumn
        '
        Me.TitelDataGridViewTextBoxColumn.DataPropertyName = "Titel"
        Me.TitelDataGridViewTextBoxColumn.HeaderText = "Titel"
        Me.TitelDataGridViewTextBoxColumn.Name = "TitelDataGridViewTextBoxColumn"
        '
        'AnredeDataGridViewTextBoxColumn
        '
        Me.AnredeDataGridViewTextBoxColumn.DataPropertyName = "Anrede"
        Me.AnredeDataGridViewTextBoxColumn.HeaderText = "Anrede"
        Me.AnredeDataGridViewTextBoxColumn.Name = "AnredeDataGridViewTextBoxColumn"
        '
        'NameDataGridViewTextBoxColumn
        '
        Me.NameDataGridViewTextBoxColumn.DataPropertyName = "Name"
        Me.NameDataGridViewTextBoxColumn.HeaderText = "Name"
        Me.NameDataGridViewTextBoxColumn.Name = "NameDataGridViewTextBoxColumn"
        '
        'VornameDataGridViewTextBoxColumn
        '
        Me.VornameDataGridViewTextBoxColumn.DataPropertyName = "Vorname"
        Me.VornameDataGridViewTextBoxColumn.HeaderText = "Vorname"
        Me.VornameDataGridViewTextBoxColumn.Name = "VornameDataGridViewTextBoxColumn"
        '
        'Name1DataGridViewTextBoxColumn
        '
        Me.Name1DataGridViewTextBoxColumn.DataPropertyName = "Name1"
        Me.Name1DataGridViewTextBoxColumn.HeaderText = "Name1"
        Me.Name1DataGridViewTextBoxColumn.Name = "Name1DataGridViewTextBoxColumn"
        '
        'FirmaDataGridViewTextBoxColumn
        '
        Me.FirmaDataGridViewTextBoxColumn.DataPropertyName = "Firma"
        Me.FirmaDataGridViewTextBoxColumn.HeaderText = "Firma"
        Me.FirmaDataGridViewTextBoxColumn.Name = "FirmaDataGridViewTextBoxColumn"
        '
        'AdresseDataGridViewTextBoxColumn
        '
        Me.AdresseDataGridViewTextBoxColumn.DataPropertyName = "Adresse"
        Me.AdresseDataGridViewTextBoxColumn.HeaderText = "Adresse"
        Me.AdresseDataGridViewTextBoxColumn.Name = "AdresseDataGridViewTextBoxColumn"
        '
        'LandDataGridViewTextBoxColumn
        '
        Me.LandDataGridViewTextBoxColumn.DataPropertyName = "Land"
        Me.LandDataGridViewTextBoxColumn.HeaderText = "Land"
        Me.LandDataGridViewTextBoxColumn.Name = "LandDataGridViewTextBoxColumn"
        '
        'PLZDataGridViewTextBoxColumn
        '
        Me.PLZDataGridViewTextBoxColumn.DataPropertyName = "PLZ"
        Me.PLZDataGridViewTextBoxColumn.HeaderText = "PLZ"
        Me.PLZDataGridViewTextBoxColumn.Name = "PLZDataGridViewTextBoxColumn"
        '
        'OrtDataGridViewTextBoxColumn
        '
        Me.OrtDataGridViewTextBoxColumn.DataPropertyName = "Ort"
        Me.OrtDataGridViewTextBoxColumn.HeaderText = "Ort"
        Me.OrtDataGridViewTextBoxColumn.Name = "OrtDataGridViewTextBoxColumn"
        '
        'TelDataGridViewTextBoxColumn
        '
        Me.TelDataGridViewTextBoxColumn.DataPropertyName = "Tel"
        Me.TelDataGridViewTextBoxColumn.HeaderText = "Tel"
        Me.TelDataGridViewTextBoxColumn.Name = "TelDataGridViewTextBoxColumn"
        '
        'Tel2DataGridViewTextBoxColumn
        '
        Me.Tel2DataGridViewTextBoxColumn.DataPropertyName = "Tel2"
        Me.Tel2DataGridViewTextBoxColumn.HeaderText = "Tel2"
        Me.Tel2DataGridViewTextBoxColumn.Name = "Tel2DataGridViewTextBoxColumn"
        '
        'FaxDataGridViewTextBoxColumn
        '
        Me.FaxDataGridViewTextBoxColumn.DataPropertyName = "Fax"
        Me.FaxDataGridViewTextBoxColumn.HeaderText = "Fax"
        Me.FaxDataGridViewTextBoxColumn.Name = "FaxDataGridViewTextBoxColumn"
        '
        'Fax2DataGridViewTextBoxColumn
        '
        Me.Fax2DataGridViewTextBoxColumn.DataPropertyName = "Fax2"
        Me.Fax2DataGridViewTextBoxColumn.HeaderText = "Fax2"
        Me.Fax2DataGridViewTextBoxColumn.Name = "Fax2DataGridViewTextBoxColumn"
        '
        'MobilDataGridViewTextBoxColumn
        '
        Me.MobilDataGridViewTextBoxColumn.DataPropertyName = "Mobil"
        Me.MobilDataGridViewTextBoxColumn.HeaderText = "Mobil"
        Me.MobilDataGridViewTextBoxColumn.Name = "MobilDataGridViewTextBoxColumn"
        '
        'EmailDataGridViewTextBoxColumn
        '
        Me.EmailDataGridViewTextBoxColumn.DataPropertyName = "Email"
        Me.EmailDataGridViewTextBoxColumn.HeaderText = "Email"
        Me.EmailDataGridViewTextBoxColumn.Name = "EmailDataGridViewTextBoxColumn"
        '
        'WebDataGridViewTextBoxColumn
        '
        Me.WebDataGridViewTextBoxColumn.DataPropertyName = "Web"
        Me.WebDataGridViewTextBoxColumn.HeaderText = "Web"
        Me.WebDataGridViewTextBoxColumn.Name = "WebDataGridViewTextBoxColumn"
        '
        'ExportDataGridViewTextBoxColumn
        '
        Me.ExportDataGridViewTextBoxColumn.DataPropertyName = "Export"
        Me.ExportDataGridViewTextBoxColumn.HeaderText = "Export"
        Me.ExportDataGridViewTextBoxColumn.Name = "ExportDataGridViewTextBoxColumn"
        '
        'AngelegtAnDataGridViewTextBoxColumn
        '
        Me.AngelegtAnDataGridViewTextBoxColumn.DataPropertyName = "AngelegtAn"
        Me.AngelegtAnDataGridViewTextBoxColumn.HeaderText = "AngelegtAn"
        Me.AngelegtAnDataGridViewTextBoxColumn.Name = "AngelegtAnDataGridViewTextBoxColumn"
        '
        'MAAusenDataGridViewTextBoxColumn
        '
        Me.MAAusenDataGridViewTextBoxColumn.DataPropertyName = "MAAusen"
        Me.MAAusenDataGridViewTextBoxColumn.HeaderText = "MAAusen"
        Me.MAAusenDataGridViewTextBoxColumn.Name = "MAAusenDataGridViewTextBoxColumn"
        '
        'MAInnenDataGridViewTextBoxColumn
        '
        Me.MAInnenDataGridViewTextBoxColumn.DataPropertyName = "MAInnen"
        Me.MAInnenDataGridViewTextBoxColumn.HeaderText = "MAInnen"
        Me.MAInnenDataGridViewTextBoxColumn.Name = "MAInnenDataGridViewTextBoxColumn"
        '
        'AbbuchungDataGridViewTextBoxColumn
        '
        Me.AbbuchungDataGridViewTextBoxColumn.DataPropertyName = "Abbuchung"
        Me.AbbuchungDataGridViewTextBoxColumn.HeaderText = "Abbuchung"
        Me.AbbuchungDataGridViewTextBoxColumn.Name = "AbbuchungDataGridViewTextBoxColumn"
        '
        'HasMenuDataGridViewTextBoxColumn
        '
        Me.HasMenuDataGridViewTextBoxColumn.DataPropertyName = "hasMenu"
        Me.HasMenuDataGridViewTextBoxColumn.HeaderText = "hasMenu"
        Me.HasMenuDataGridViewTextBoxColumn.Name = "HasMenuDataGridViewTextBoxColumn"
        '
        'PasswortDataGridViewTextBoxColumn
        '
        Me.PasswortDataGridViewTextBoxColumn.DataPropertyName = "Passwort"
        Me.PasswortDataGridViewTextBoxColumn.HeaderText = "Passwort"
        Me.PasswortDataGridViewTextBoxColumn.Name = "PasswortDataGridViewTextBoxColumn"
        '
        'NextIDNRDataGridViewTextBoxColumn
        '
        Me.NextIDNRDataGridViewTextBoxColumn.DataPropertyName = "nextIDNR"
        Me.NextIDNRDataGridViewTextBoxColumn.HeaderText = "nextIDNR"
        Me.NextIDNRDataGridViewTextBoxColumn.Name = "NextIDNRDataGridViewTextBoxColumn"
        '
        'MandantDataGridViewTextBoxColumn
        '
        Me.MandantDataGridViewTextBoxColumn.DataPropertyName = "mandant"
        Me.MandantDataGridViewTextBoxColumn.HeaderText = "mandant"
        Me.MandantDataGridViewTextBoxColumn.Name = "MandantDataGridViewTextBoxColumn"
        '
        'GeburtstagDataGridViewTextBoxColumn
        '
        Me.GeburtstagDataGridViewTextBoxColumn.DataPropertyName = "Geburtstag"
        Me.GeburtstagDataGridViewTextBoxColumn.HeaderText = "Geburtstag"
        Me.GeburtstagDataGridViewTextBoxColumn.Name = "GeburtstagDataGridViewTextBoxColumn"
        '
        'UIDDataGridViewTextBoxColumn
        '
        Me.UIDDataGridViewTextBoxColumn.DataPropertyName = "UID"
        Me.UIDDataGridViewTextBoxColumn.HeaderText = "UID"
        Me.UIDDataGridViewTextBoxColumn.Name = "UIDDataGridViewTextBoxColumn"
        '
        'SkypeAdresseDataGridViewTextBoxColumn
        '
        Me.SkypeAdresseDataGridViewTextBoxColumn.DataPropertyName = "SkypeAdresse"
        Me.SkypeAdresseDataGridViewTextBoxColumn.HeaderText = "SkypeAdresse"
        Me.SkypeAdresseDataGridViewTextBoxColumn.Name = "SkypeAdresseDataGridViewTextBoxColumn"
        '
        'MessengerAdresseDataGridViewTextBoxColumn
        '
        Me.MessengerAdresseDataGridViewTextBoxColumn.DataPropertyName = "MessengerAdresse"
        Me.MessengerAdresseDataGridViewTextBoxColumn.HeaderText = "MessengerAdresse"
        Me.MessengerAdresseDataGridViewTextBoxColumn.Name = "MessengerAdresseDataGridViewTextBoxColumn"
        '
        'EUNummerDataGridViewTextBoxColumn
        '
        Me.EUNummerDataGridViewTextBoxColumn.DataPropertyName = "EUNummer"
        Me.EUNummerDataGridViewTextBoxColumn.HeaderText = "EUNummer"
        Me.EUNummerDataGridViewTextBoxColumn.Name = "EUNummerDataGridViewTextBoxColumn"
        '
        'EUNummer1DataGridViewTextBoxColumn
        '
        Me.EUNummer1DataGridViewTextBoxColumn.DataPropertyName = "EUNummer1"
        Me.EUNummer1DataGridViewTextBoxColumn.HeaderText = "EUNummer1"
        Me.EUNummer1DataGridViewTextBoxColumn.Name = "EUNummer1DataGridViewTextBoxColumn"
        '
        'EUNummer2DataGridViewTextBoxColumn
        '
        Me.EUNummer2DataGridViewTextBoxColumn.DataPropertyName = "EUNummer2"
        Me.EUNummer2DataGridViewTextBoxColumn.HeaderText = "EUNummer2"
        Me.EUNummer2DataGridViewTextBoxColumn.Name = "EUNummer2DataGridViewTextBoxColumn"
        '
        'BHReferenzDataGridViewTextBoxColumn
        '
        Me.BHReferenzDataGridViewTextBoxColumn.DataPropertyName = "BHReferenz"
        Me.BHReferenzDataGridViewTextBoxColumn.HeaderText = "BHReferenz"
        Me.BHReferenzDataGridViewTextBoxColumn.Name = "BHReferenzDataGridViewTextBoxColumn"
        '
        'OfAdressenBindingSource
        '
        Me.OfAdressenBindingSource.DataMember = "ofAdressen"
        Me.OfAdressenBindingSource.DataSource = Me.DataSetKunden
        '
        'DataSetKunden
        '
        Me.DataSetKunden.DataSetName = "DataSetKunden"
        Me.DataSetKunden.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'OfAdressenTableAdapter
        '
        Me.OfAdressenTableAdapter.ClearBeforeFill = True
        '
        'KundenListe
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1190, 468)
        Me.Controls.Add(Me.DataGridView1)
        Me.Name = "KundenListe"
        Me.Text = "KundenListe"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.DataGridView1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.OfAdressenBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataSetKunden, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents DataGridView1 As System.Windows.Forms.DataGridView
    Friend WithEvents DataSetKunden As IntraSell_Net.dsAdressen
    Friend WithEvents OfAdressenBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents OfAdressenTableAdapter As IntraSell_Net.dsAdressenTableAdapters.ofadressenTableAdapter
    Friend WithEvents IDNRDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents StatusDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BrancheDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BriefanredeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TitelDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AnredeDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents VornameDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Name1DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FirmaDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AdresseDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents LandDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PLZDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents OrtDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents TelDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Tel2DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents FaxDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents Fax2DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MobilDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EmailDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents WebDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents ExportDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AngelegtAnDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MAAusenDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MAInnenDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents AbbuchungDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents HasMenuDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents PasswortDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents NextIDNRDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MandantDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents GeburtstagDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents UIDDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents SkypeAdresseDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents MessengerAdresseDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EUNummerDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EUNummer1DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents EUNummer2DataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
    Friend WithEvents BHReferenzDataGridViewTextBoxColumn As System.Windows.Forms.DataGridViewTextBoxColumn
End Class
