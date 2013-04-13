Public Class immoEingabe
    Inherits System.Web.UI.Page

    Protected WithEvents txtAnbieter As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSpeichern As System.Web.UI.WebControls.Button
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents paneWohnung As System.Web.UI.WebControls.Panel
    Protected WithEvents txtWohnflaeche As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlzimmer As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtBezeichnung As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtKaufpreis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtMietpreis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtBetriebskosten As System.Web.UI.WebControls.TextBox
    Protected WithEvents validName As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents lblGrundflaeche As System.Web.UI.WebControls.Label
    Protected WithEvents txtGrundflaeche As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblAnzahlstoeck As System.Web.UI.WebControls.Label
    Protected WithEvents txtAnzahlstoeck As System.Web.UI.WebControls.TextBox
    Protected WithEvents cbVerwendungszweck As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblWohnflaeche As System.Web.UI.WebControls.Label
    Protected WithEvents lblAnzahlzimmer As System.Web.UI.WebControls.Label
    Protected WithEvents lblKaufpreis As System.Web.UI.WebControls.Label
    Protected WithEvents lblMietpreis As System.Web.UI.WebControls.Label
    Protected WithEvents lblVerwendungszweck As System.Web.UI.WebControls.Label
    Protected WithEvents Panel1 As System.Web.UI.WebControls.Panel
    Protected WithEvents lblBetriebskosten As System.Web.UI.WebControls.Label
    Protected WithEvents lblObjektPLZ As System.Web.UI.WebControls.Label
    Protected WithEvents txtObjektPLZ As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblObjektOrt As System.Web.UI.WebControls.Label
    Protected WithEvents txtObjektOrt As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblObjektStrasse As System.Web.UI.WebControls.Label
    Protected WithEvents txtObjektStrasse As System.Web.UI.WebControls.TextBox
    Protected WithEvents rbNutzung As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents immoObjekt As WebShop.DatasetImmobilienObjekt
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents cbImmoLand As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cbImmoBundesland As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cbImmoBezirk As System.Web.UI.WebControls.DropDownList
    Protected WithEvents validBezirk As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validBundesland As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validLand As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents rbHauptKategorie As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents validWohnflaeche As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validAnzahlzimmer As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validKaufpreis As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validMietpreis As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validBetriebskosten As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validGrundflaeche As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validAnzahlstoeck As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validNutzung As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents rbTyp As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents validVerwendungszweck As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RangeValidatorKaufpreis As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidatorMietpreis As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents RangeValidatorBetriebskosten As System.Web.UI.WebControls.RangeValidator
    Protected WithEvents cbImmoTyp As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblImmoTyp As System.Web.UI.WebControls.Label
    Protected WithEvents validImmoTyp As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents RegularExpressionValidator1 As System.Web.UI.WebControls.RegularExpressionValidator
    Protected WithEvents validObjektOrt As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents validKategorie As System.Web.UI.WebControls.RequiredFieldValidator

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()
        '
        'OdbcConn
        '
        Me.OdbcConn.ConnectionString = CType(configurationAppSettings.GetValue("OdbcConn.ConnectionString", GetType(System.String)), String)

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'Put user code to initialize the page here
        If Me.txtAnbieter.Text = "" Then
            If Request("Anbieter") <> "" Then
                Me.txtAnbieter.Text = Request("Anbieter")
            End If
        End If

        If Me.txtAnbieter.Text = "" Then
            Me.txtAnbieter.Text = "0"
        End If

        Call loadCB()

        If Not IsPostBack Then
            If Request("ArtNr") <> "" Then 'edit was requested 
                Call loadArtNr(Request("ArtNr"))
                'end load 
            End If
        End If

    End Sub

    Sub loadArtNr(ByVal artNR As String)
        Me.txtArtNr.Text = artNR

        'load data and set it 
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        Try
            Me.rbHauptKategorie.Items.FindByText(immoObj.getObjektEigenschaft("ImmobilienHauptkategorie")).Selected = True
        Catch
        End Try

        Try
            Me.rbTyp.Items.FindByText(immoObj.getObjektEigenschaft("ImmobilienKategorie")).Selected = True
            Call typSet()
        Catch
        End Try

        Try
            Me.rbNutzung.Items.FindByText(immoObj.getObjektEigenschaft("ImmobilienNutzung")).Selected = True
            Call NutzungSet()
        Catch
        End Try

        Me.txtBezeichnung.Text = immoObj.getField("Bezeichnung")
        Me.txtAnzahlstoeck().Text = immoObj.getObjektEigenschaft("Anzahlstoeck")
        Me.txtAnzahlzimmer().Text = immoObj.getObjektEigenschaft("Zimmeranzahl")
        Me.txtKaufpreis().Text = immoObj.getObjektEigenschaft("Kaufpreis")
        Me.txtMietpreis().Text = immoObj.getObjektEigenschaft("Mietpreis")

        Me.txtBetriebskosten().Text = immoObj.getObjektEigenschaft("Betriebskosten")
        Me.txtGrundflaeche().Text = immoObj.getObjektEigenschaft("Grundflaeche")
        Me.txtWohnflaeche().Text = immoObj.getObjektEigenschaft("Wohnflaeche")

        Me.cbImmoTyp().Items.Add(immoObj.getObjektEigenschaft("ImmobilienTyp"))
        Me.cbImmoTyp.SelectedItem.Text = immoObj.getObjektEigenschaft("ImmobilienTyp")

        Me.cbImmoLand.Items.Add(immoObj.getObjektEigenschaft("ObjektLand"))
        Me.cbImmoLand.SelectedItem.Text = immoObj.getObjektEigenschaft("ObjektLand")

        Me.cbImmoBundesland.Items.Add(immoObj.getObjektEigenschaft("ObjektBundesland"))
        Me.cbImmoBundesland.SelectedItem.Text = immoObj.getObjektEigenschaft("ObjektBundesland")

        Me.cbImmoBezirk.Items.Add(immoObj.getObjektEigenschaft("ObjektBezirk"))
        Me.cbImmoBezirk.SelectedItem.Text = immoObj.getObjektEigenschaft("ObjektBezirk")

        Me.txtObjektOrt.Text = immoObj.getObjektEigenschaft("ObjektOrt")
        Me.txtObjektPLZ.Text = immoObj.getObjektEigenschaft("ObjektPLZ")
        Me.txtObjektStrasse.Text = immoObj.getObjektEigenschaft("ObjektStrasse")

        immoObj.objConnection.Close()
    End Sub


    Private Sub loadImmoTyp()
        Dim Rdr1 As Microsoft.Data.Odbc.OdbcDataReader
        Dim Cmd1 As Microsoft.Data.Odbc.OdbcCommand
        Dim strSQL As String

        Me.OdbcConn.Open()
        If Me.rbTyp.SelectedIndex >= 0 Then
            'If Me.cbImmoTyp.Items.Count <= 0 Then ' still emtpy 
            cbImmoTyp.Items.Clear()
            Me.cbImmoTyp.Items.Add("")
            strSQL = "select ObjektTyp from immoTyp where ObjektKategorie Like '" & Me.rbTyp.SelectedItem.Value & "' order by [ObjektTyp]"
            'Response.Write(strSQL)
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)
            Rdr1 = Cmd1.ExecuteReader()
            While Rdr1.Read
                Me.cbImmoTyp.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()
            'End If
        End If
        Me.OdbcConn.Close()
    End Sub

    Private Sub loadCB()
        Dim Rdr1 As Microsoft.Data.Odbc.OdbcDataReader
        Dim Cmd1 As Microsoft.Data.Odbc.OdbcCommand
        Dim strSQL As String

        Me.OdbcConn.Open()

        If Me.cbImmoLand.Items.Count <= 0 Then ' still emtpy 
            cbImmoLand.Items.Clear()
            Me.cbImmoLand.Items.Add("[Bitte wählen]")
            strSQL = "select [name] from grLand order by [name]"
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)

            Rdr1 = Cmd1.ExecuteReader()

            While Rdr1.Read
                Me.cbImmoLand.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()

        End If

        If Me.cbImmoLand.SelectedIndex > 0 Then
            strSQL = "select distinct Bundesland from grBezirk where Bundesland is not null " & _
            " and land in (select idnr from grLand where [Name]like '" & Me.cbImmoLand.SelectedItem.Text & "') " & _
            " order by Bundesland"
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)

            Rdr1 = Cmd1.ExecuteReader()

            While Rdr1.Read
                Me.cbImmoBundesland.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()
        End If

        If Me.cbImmoBundesland.SelectedIndex > 0 Then
            strSQL = "select distinct Bezirk from grBezirk where Bezirk is not null " & _
            " and Bundesland like '" & Me.cbImmoBundesland.SelectedItem.Text & "' order by Bezirk"
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)
            Rdr1 = Cmd1.ExecuteReader()
            cbImmoBezirk.Items.Clear()
            While Rdr1.Read
                Me.cbImmoBezirk.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()
        End If

        Me.OdbcConn.Close()
    End Sub

    Private Sub rbTyp_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbTyp.SelectedIndexChanged
        Call typSet()
    End Sub

    Sub typSet()
        Me.paneWohnung.Enabled = True
        Me.rbNutzung.Enabled = True

        paneWohnung.Visible = True
        txtWohnflaeche.Visible = True
        txtAnzahlzimmer.Visible = True
        txtKaufpreis.Visible = True
        txtMietpreis.Visible = True
        txtBetriebskosten.Visible = False
        txtGrundflaeche.Visible = True
        txtAnzahlstoeck.Visible = True
        cbImmoTyp.Visible = True
        cbVerwendungszweck.Visible = False
        rbNutzung.Items.Remove("Pacht")


        If rbTyp.SelectedItem.Value = "Wohnung" Then
            txtGrundflaeche.Visible = False
            txtAnzahlstoeck.Visible = False
            cbVerwendungszweck.Visible = False
        End If

        If rbTyp.SelectedItem.Value = "Haus" Then
            cbVerwendungszweck.Visible = False
        End If

        If rbTyp.SelectedItem.Value = "Grundstück" Then
            txtWohnflaeche.Visible = False
            txtAnzahlzimmer.Visible = False
            txtBetriebskosten.Visible = False
            txtAnzahlstoeck.Visible = False
            cbVerwendungszweck.Visible = False
            rbNutzung.Items.Add("Pacht")
        End If

        If rbTyp.SelectedItem.Value = "Gewerbeobjekt" Then
            txtWohnflaeche.Visible = False
            txtAnzahlzimmer.Visible = False
            txtBetriebskosten.Visible = False
            txtAnzahlstoeck.Visible = False
            cbVerwendungszweck.Visible = False
        End If

        If rbTyp.SelectedItem.Value = "Parkplatz" Then
            txtWohnflaeche.Visible = False
            txtAnzahlzimmer.Visible = False
            txtBetriebskosten.Visible = False
            txtAnzahlstoeck.Visible = False
            txtGrundflaeche.Visible = False
            cbVerwendungszweck.Visible = False
        End If

        Call setValidators()
        Call loadImmoTyp()
    End Sub
    Sub setValidators()

        Me.lblKaufpreis.Visible = Me.txtKaufpreis.Visible
        Me.lblMietpreis.Visible = Me.txtMietpreis.Visible
        Me.lblAnzahlzimmer.Visible = Me.txtAnzahlzimmer.Visible
        Me.lblWohnflaeche.Visible = Me.txtWohnflaeche.Visible
        Me.lblBetriebskosten.Visible = Me.txtBetriebskosten.Visible
        Me.lblGrundflaeche.Visible = Me.txtGrundflaeche.Visible
        Me.lblAnzahlstoeck.Visible = Me.txtAnzahlstoeck.Visible
        Me.lblImmoTyp.Visible = Me.cbImmoTyp.Visible
        Me.lblVerwendungszweck.Visible = Me.cbVerwendungszweck.Visible


        Me.validWohnflaeche.Enabled = Me.txtWohnflaeche.Visible
        Me.validAnzahlzimmer.Enabled = Me.txtAnzahlzimmer.Visible
        Me.validAnzahlstoeck.Enabled = Me.txtAnzahlstoeck.Visible
        Me.validGrundflaeche.Enabled = Me.txtGrundflaeche.Visible

        Me.validImmoTyp.Enabled = Me.cbImmoTyp.Visible
        Me.validVerwendungszweck.Enabled = Me.cbVerwendungszweck.Visible

        Me.validMietpreis.Enabled = Me.txtMietpreis.Visible
        Me.validKaufpreis.Enabled = Me.txtKaufpreis.Visible
        Me.validBetriebskosten.Enabled = Me.txtBetriebskosten.Visible
        Me.RangeValidatorMietpreis.Enabled = Me.txtMietpreis.Visible
        Me.RangeValidatorKaufpreis.Enabled = Me.txtKaufpreis.Visible
        Me.RangeValidatorBetriebskosten.Enabled = Me.txtBetriebskosten.Visible

    End Sub

    Private Sub btnSpeichern_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSpeichern.Click
        If Me.IsValid Then
            'CREATE AN XML DOCUMENT AND SEND IT FOR INSERT
            Dim immoObj As System.Xml.XmlDocument : immoObj = New System.Xml.XmlDocument()

            immoObj.LoadXml( _
                    "<ImmobilienObjekt>" & _
                        "<ArtNr>" & Me.txtArtNr.Text & "</ArtNr>" & _
                        "<Anbieter>" & Me.txtAnbieter.Text & "</Anbieter>" & _
                        "<Bezeichnung>" & Me.txtBezeichnung.Text & "</Bezeichnung>" & _
                        "<KategorieHaupt>" & rbHauptKategorie.SelectedItem.Value & "</KategorieHaupt>" & _
                        "<Kategorie>" & rbTyp.SelectedItem.Value & "</Kategorie>" & _
                        "<KategorieSub>" & rbNutzung.SelectedItem.Value & "</KategorieSub>" & _
                        "<Eigenschaften>" & _
                            "<ImmobilienHauptkategorie>" & Me.rbHauptKategorie.SelectedItem.Value & "</ImmobilienHauptkategorie>" & _
                            "<ImmobilienKategorie>" & Me.rbTyp.SelectedItem.Value & "</ImmobilienKategorie>" & _
                            "<ImmobilienNutzung>" & Me.rbNutzung.SelectedItem.Value & "</ImmobilienNutzung>" & _
                            "<ImmobilienTyp>" & Me.cbImmoTyp.SelectedItem.Value & "</ImmobilienTyp>" & _
                            "<Wohnflaeche>" & Me.txtWohnflaeche.Text & "</Wohnflaeche>" & _
                            "<Zimmeranzahl>" & Me.txtAnzahlzimmer.Text & "</Zimmeranzahl>" & _
                            "<Grundflaeche>" & Me.txtGrundflaeche.Text & "</Grundflaeche>" & _
                            "<Zimmeranzahl>" & Me.txtAnzahlzimmer.Text & "</Zimmeranzahl>" & _
                            "<Kaufpreis>" & Me.txtKaufpreis.Text & "</Kaufpreis>" & _
                            "<Mietpreis>" & Me.txtMietpreis.Text & "</Mietpreis>" & _
                            "<Betriebskosten>" & Me.txtBetriebskosten.Text & "</Betriebskosten>" & _
                        "</Eigenschaften>" & _
                        "<Adresse>" & _
                            "<ObjektLand>" & Me.cbImmoLand.SelectedItem.Text & "</ObjektLand>" & _
                            "<ObjektBundesland>" & Me.cbImmoBundesland.SelectedItem.Text & "</ObjektBundesland>" & _
                            "<ObjektBezirk>" & Me.cbImmoBezirk.SelectedItem.Text & "</ObjektBezirk>" & _
                            "<ObjektPLZ>" & Me.txtObjektPLZ.Text & "</ObjektPLZ>" & _
                            "<ObjektOrt>" & Me.txtObjektOrt.Text & "</ObjektOrt>" & _
                            "<ObjektStrasse>" & Me.txtObjektStrasse.Text & "</ObjektStrasse>" & _
                        "</Adresse>" & _
                    "</ImmobilienObjekt>")
            '"<Beschreibung>" & Me.txtBeschreibung.Text & "</Beschreibung>" & _
            Console.WriteLine("Display the modified XML...")
            immoObj.Save(Console.Out)

            Dim immoObjClass As ImmoObjektClass : immoObjClass = New ImmoObjektClass()
            immoObjClass.objConnection = Me.OdbcConn
            'Try
            Dim artNr : artNr = immoObjClass.saveObjektFromXML(immoObj)
            'Catch

            'End Try

            Response.Write("Danke! Ihr Inserat wurde erfolgreich gespeichert!")
            Response.Redirect("ImmoEingabe2.aspx?ArtNr=" & artNr & "&Anbieter=" & Me.txtAnbieter.Text)
        End If
        ' Me.txtBeschreibung.Text = "loading"
    End Sub

    Private Sub txtWohnflaeche_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtWohnflaeche.TextChanged

    End Sub


    Private Sub txtAnbieter_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtAnbieter.TextChanged

    End Sub

    Private Sub cbImmoLand_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoLand.SelectedIndexChanged
        Me.cbImmoBundesland.Items.Clear()
        Me.cbImmoBezirk.Items.Clear()
        Call loadCB()
    End Sub

    Private Sub cbImmoBundesland_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoBundesland.SelectedIndexChanged
        Me.cbImmoBezirk.Items.Clear()
        Call loadCB()
    End Sub

    Private Sub txtObjektOrt_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtObjektOrt.TextChanged

    End Sub

    Private Sub rbNutzung_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbNutzung.SelectedIndexChanged
        Call NutzungSet()
    End Sub

    Sub NutzungSet()

        Me.txtKaufpreis.Visible = False
        Me.txtMietpreis.Visible = False



        If Me.rbNutzung.SelectedItem.Value = "Kauf" Then
            Me.txtKaufpreis.Visible = True
        End If

        If Me.rbNutzung.SelectedItem.Value = "Miete" Then
            Me.txtMietpreis.Visible = True
            Me.lblMietpreis.Text = "Miete (Euro)"
        End If

        If Me.rbNutzung.SelectedItem.Value = "Pacht" Then
            Me.txtMietpreis.Visible = True
            Me.lblMietpreis.Text = "Pacht (Euro)"
        End If


        Call setValidators()

    End Sub
End Class
