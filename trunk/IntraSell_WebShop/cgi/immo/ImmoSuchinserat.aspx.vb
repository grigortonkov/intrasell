Public Class ImmoSuchinserat
    Inherits ImmoBaseForm
    Protected WithEvents lblPLZ As System.Web.UI.WebControls.Label
    Protected WithEvents validNutzung As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validKategorie As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents rbTyp As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents rbNutzung As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents Land As System.Web.UI.WebControls.Label
    Protected WithEvents cbImmoLand As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents cbImmoBundesland As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents cbImmoBezirk As System.Web.UI.WebControls.DropDownList
    Protected WithEvents OdbcCommand As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents rbHauptKategorie As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents txtObjektPLZ As System.Web.UI.WebControls.TextBox
    Protected WithEvents HyperLinkShowResult As System.Web.UI.WebControls.HyperLink
    Protected WithEvents txtArtKatNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents PanelKategorie As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelErweiterteSuche As System.Web.UI.WebControls.Panel
    Protected WithEvents cbVerwendungszweck As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblVerwendungszweck As System.Web.UI.WebControls.Label
    Protected WithEvents lblAnzahlstoeck As System.Web.UI.WebControls.Label
    Protected WithEvents lblGrundflaeche As System.Web.UI.WebControls.Label
    Protected WithEvents lblBetriebskosten As System.Web.UI.WebControls.Label
    Protected WithEvents lblMietpreis As System.Web.UI.WebControls.Label
    Protected WithEvents lblAnzahlzimmer As System.Web.UI.WebControls.Label
    Protected WithEvents txtWohnflaecheVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblWohnflaeche As System.Web.UI.WebControls.Label
    Protected WithEvents cbImmoTyp As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblImmoTyp As System.Web.UI.WebControls.Label
    Protected WithEvents txtWohnflaecheBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlzimmerVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlzimmerBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtMietpreisVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtMietpreisBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtBetriebskostenVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtBetriebskostenBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtGrundflaecheVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtGrundflaecheBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlstoeckVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlstoeckBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents PanelWohnflaeche As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelZimmeranzahl As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelMietpreis As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelBetriebskosten As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelGrundflaeche As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelStoeckanzahl As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelVerwendungsZweck As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelKaufpreis As System.Web.UI.WebControls.Panel
    Protected WithEvents lblKaufpreis As System.Web.UI.WebControls.Label
    Protected WithEvents txtKaufpreisVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtKaufpreisBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents PanelOption1 As System.Web.UI.WebControls.Panel
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents txtAnbieter As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtObjektOrt As System.Web.UI.WebControls.TextBox
    Protected WithEvents validName As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents txtBezeichnung As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSuchen As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OdbcCommand = New Microsoft.Data.Odbc.OdbcCommand
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection
        '
        'OdbcCommand
        '
        Me.OdbcCommand.Connection = Me.OdbcConn
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


    Const ALLE = ""
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        If Not IsPostBack Then
            If Request("ArtKatNr") <> "" Then
                Me.txtArtKatNr.Text = Request("ArtKatNR")
                loadImmoTyp()
                'TODO: set the selection from cat to the control 

                Dim immoObj As ImmoObjektClass = New ImmoObjektClass
                Dim isDB As IntraSellDB = New IntraSellDB

                isDB.objConnection = Me.OdbcConn
                immoObj.objConnection = Me.OdbcConn
                Me.OdbcConn.Open()
                Dim dummyArtNr
                Try
                    dummyArtNr = isDB.firstValue("select artnr from grArtikel where ArtKatNr=" & _
                                 Request("ArtKatNr") & " ORDER BY ArtNr asc")
                    immoObj.loadFromDB(dummyArtNr)
                Catch
                    Response.Write("Keine Objekte in der gewünschten Kategorie vorhanden!")
                End Try

                Try
                    Me.rbTyp.SelectedValue = immoObj.getObjektEigenschaft("ImmobilienKategorie")
                    Me.rbHauptKategorie.SelectedValue = immoObj.getObjektEigenschaft("ImmobilienHauptkategorie")
                    Me.rbNutzung.SelectedValue = immoObj.getObjektEigenschaft("ImmobilienNutzung")
                    Me.PanelKategorie.Enabled = False
                Catch
                    Response.Write("Das Objekt [" & dummyArtNr & "] hat falsche Eigenschaften! Contact the Administrator!")
                End Try

                Me.OdbcConn.Close()
                Try
                    typSet()
                Catch
                    Response.Write("Kann nicht die Pflichtfelder setzen! Contact the Administrator!")

                End Try
            Else
                'Response.Write("Parameter ArtKatNr fehlt!")
                Me.PanelKategorie.Visible = True
            End If

            If Me.txtAnbieter.Text = "" Then
                If Request("Anbieter") <> "" Then
                    Me.txtAnbieter.Text = Request("Anbieter")
                End If
            End If

            If Me.txtAnbieter.Text = "" Then
                Me.txtAnbieter.Text = "0"
            End If

            Call loadCB()


            'load for update 
            If Request("ArtNr") <> "" Then 'edit was requested 
                Dim artNrForEdit As String = Request("ArtNr")
                Call loadArtNr(Request("ArtNr"))
                PanelErweiterteSuche.Visible = True
            End If

        End If


        'try to set land 
        If Not IsPostBack Then
            If Request("LAND") <> "" Then
                If Request("LAND") = "AT" Then
                    Me.cbImmoLand.SelectedValue = "Österreich"
                ElseIf Request("LAND") = "DE" Then
                    Me.cbImmoLand.SelectedValue = "Deutschland"
                End If
                Call landChanged()
            End If
        End If
        'end land 

    End Sub



    Private Sub loadImmoTyp()
        Dim Rdr1 As Microsoft.Data.Odbc.OdbcDataReader
        Dim Cmd1 As Microsoft.Data.Odbc.OdbcCommand
        Dim strSQL As String

        Me.OdbcConn.Open()
        If Me.rbTyp.SelectedIndex >= 0 Then
            'If Me.cbImmoTyp.Items.Count <= 0 Then ' still emtpy 
            cbImmoTyp.Items.Clear()
            Me.cbImmoTyp.Items.Add(ALLE)
            strSQL = prepareSQL("select ObjektTyp from immoTyp where ObjektKategorie Like '" & Me.rbTyp.SelectedItem.Value & "' order by [ObjektTyp]")
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


    'returns the count of the results 
    'returns -1 when not count can be extracted 
    Private Function checkIfQueryReturnsResult(ByVal urlForNewAccount As String) As Integer

        urlForNewAccount = Replace(urlForNewAccount, "default.asp", "defaultPrintEdition.asp")
        checkIfQueryReturnsResult = 0
        Dim download As String = ""
        Try
            Dim cl As System.Net.WebClient = New System.Net.WebClient
            cl.BaseAddress = "http://" & Request.ServerVariables("SERVER_NAME")
            Dim myDatabuffer As Byte() = cl.DownloadData(urlForNewAccount)
            download = System.Text.Encoding.ASCII.GetString(myDatabuffer)
        Catch
            Dim url As String = "http://" & Request.ServerVariables("SERVER_NAME") & "/" & urlForNewAccount
            Response.Write("Fehler bei URL:" & url)
        End Try
        ' Display the downloaded data.

        If LCase(Request("debug")) = "true" Then Response.Write("Antwort vom Server: " & download)

        'the created account hat the biggest ID
        Const COUNT_RESULT_LINES = "COUNT_RESULT_LINES"

        'download must contain <COUNT_RESULT_LINES>123</COUNT_RESULT_LINES>

        If InStr(download, COUNT_RESULT_LINES) > 0 Then 'THE RESULT 
            Dim count As String
            count = Mid(download, InStr(download, COUNT_RESULT_LINES) + Len(COUNT_RESULT_LINES) + 1, _
                                  InStr(download, "/" & COUNT_RESULT_LINES) - (2 + Len(COUNT_RESULT_LINES) + InStr(download, COUNT_RESULT_LINES)))

            checkIfQueryReturnsResult = CInt(count)
        Else
            checkIfQueryReturnsResult = -1
        End If
    End Function

    Private Sub btnSuchen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSuchen.Click
        'Call startSearch()

        If Me.IsValid Then
            'CREATE AN XML DOCUMENT AND SEND IT FOR INSERT
            Dim immoObj As System.Xml.XmlDocument : immoObj = New System.Xml.XmlDocument

            'TODO: stupid implementation 
            Dim catLand As String = "AT"
            Try
                If Me.cbImmoLand.SelectedItem.Text = "Deutschland" Then
                    catLand = "DE"
                End If
            Catch
            End Try

            immoObj.LoadXml( _
                    "<ImmobilienObjekt>" & _
                        "<ArtNr>" & Me.txtArtNr.Text & "</ArtNr>" & _
                        "<Anbieter>" & Me.txtAnbieter.Text & "</Anbieter>" & _
                        "<Bezeichnung>" & "Suchinserat:" & Me.txtBezeichnung.Text & "</Bezeichnung>" & _
                        "<KategorieLand>" & catLand & "</KategorieLand>" & _
                        "<Kategorie>" & rbTyp.SelectedItem.Value & "</Kategorie>" & _
                        "<KategorieHaupt>" & rbHauptKategorie.SelectedItem.Value & "</KategorieHaupt>" & _
                        "<KategorieSub>" & rbNutzung.SelectedItem.Value & "</KategorieSub>" & _
                        "<Eigenschaften>" & _
                            "<ImmobilienHauptkategorie>" & Me.rbHauptKategorie.SelectedItem.Value & "</ImmobilienHauptkategorie>" & _
                            "<ImmobilienKategorie>" & Me.rbTyp.SelectedItem.Value & "</ImmobilienKategorie>" & _
                            "<ImmobilienNutzung>" & Me.rbNutzung.SelectedItem.Value & "</ImmobilienNutzung>" & _
                            "<ImmobilienTyp>" & Me.cbImmoTyp.SelectedItem.Value & "</ImmobilienTyp>" & _
                            "<Wohnflaeche>" & Me.txtWohnflaecheVon.Text & " bis " & Me.txtWohnflaecheBis.Text & "</Wohnflaeche>" & _
                            "<Zimmeranzahl>" & Me.txtAnzahlzimmerVon.Text & " bis " & Me.txtAnzahlzimmerBis.Text & "</Zimmeranzahl>" & _
                            "<Grundflaeche>" & Me.txtGrundflaecheVon.Text & " bis " & Me.txtGrundflaecheBis.Text & "</Grundflaeche>" & _
                            "<Anzahlsteock>" & Me.txtAnzahlzimmerVon.Text & " bis " & Me.txtAnzahlzimmerBis.Text & "</Anzahlsteock>" & _
                            "<Kaufpreis>" & Me.txtKaufpreisVon.Text & " bis " & Me.txtKaufpreisBis.Text & "</Kaufpreis>" & _
                            "<Mietpreis>" & Me.txtMietpreisVon.Text & " bis " & Me.txtMietpreisBis.Text & "</Mietpreis>" & _
                            "<Betriebskosten>" & Me.txtBetriebskostenVon.Text & " bis " & Me.txtBetriebskostenBis.Text & "</Betriebskosten>" & _
                        "</Eigenschaften>" & _
                        "<Adresse>" & _
                            "<ObjektLand>" & Me.cbImmoLand.SelectedItem.Text & "</ObjektLand>" & _
                            "<ObjektBundesland>" & Me.cbImmoBundesland.SelectedItem.Text & "</ObjektBundesland>" & _
                            "<ObjektBezirk>" & Me.cbImmoBezirk.SelectedItem.Text & "</ObjektBezirk>" & _
                            "<ObjektPLZ>" & Me.txtObjektPLZ.Text & "</ObjektPLZ>" & _
                        "</Adresse>" & _
                    "</ImmobilienObjekt>")


            Dim immoObjClass As ImmoObjektClass : immoObjClass = New ImmoObjektClass
            immoObjClass.objConnection = Me.OdbcConn


            Dim artNr : artNr = immoObjClass.saveObjektFromXML(immoObj)

            'log 
            immoObjClass.objConnection.Open()
            immoObjClass.db.insertIntoEingabeLogs(artNr, Request.ServerVariables("REMOTE_ADDR"), "Object", "Step1")
            immoObjClass.objConnection.Close()

            Response.Write("Danke! Ihr Inserat wurde erfolgreich gespeichert!")
            Response.Redirect("ImmoSuchinserat2.aspx?ArtNr=" & artNr & "&Anbieter=" & Me.txtAnbieter.Text)


        End If
    End Sub


    Private Sub startSearch()

        Const MAX_RESULT_LINES = 100
        'If Me.IsValid Then
        Try


        Catch ' not needed this block in try 
        End Try

        If setURLSearch() Then
            Dim countResultLines = checkIfQueryReturnsResult(Me.HyperLinkShowResult.NavigateUrl)

            Response.Write("Ihre Suche liefert " & countResultLines & " Ergbnisse!")
            If countResultLines = 0 Then
                Response.Write("Ihre suche liefert keine Ergebnisse! Bitte weniger Suchkriterien angeben!")
            ElseIf countResultLines > MAX_RESULT_LINES Then
                Response.Write("Bitte mehr Suchkriterien angeben!")
            Else 'some result 
                Me.HyperLinkShowResult.Visible = True
                'Response.Write("Danke! Ihr Inserat wurde erfolgreich gespeichert!")
                'Response.Redirect("default.asp?ArtNr=" & Me.txtArtNr.Text)
                'auto javascript redirecting 
                If True Then
                    Response.Write("<Script language=javascript> " & _
                            "  top.location = '" & Me.HyperLinkShowResult.NavigateUrl & "'; " & _
                            "</Script>")
                End If
        End If
        Else
            Response.Write("Bitte mehr Suchkriterien angeben!")
        End If
    End Sub

    Private Sub loadCB()
        Dim Rdr1 As Microsoft.Data.Odbc.OdbcDataReader
        Dim Cmd1 As Microsoft.Data.Odbc.OdbcCommand
        Dim strSQL As String

        Me.OdbcConn.Open()

        If Me.cbImmoLand.Items.Count <= 0 Then ' still emtpy 
            cbImmoLand.Items.Clear()
            'Me.cbImmoLand.Items.Add(ALLE)
            strSQL = prepareSQL("select [name] from grLand order by [name]")
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)

            Rdr1 = Cmd1.ExecuteReader()

            While Rdr1.Read
                Me.cbImmoLand.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()

        End If

        If Me.cbImmoLand.SelectedIndex >= 0 Then
            If Me.cbImmoBundesland.Items.Count <= 0 Then
                strSQL = prepareSQL("select distinct Bundesland from grBezirk where Bundesland is not null " & _
                " and land in (select idnr from grLand where [Name]like '" & Me.cbImmoLand.SelectedItem.Text & "') " & _
                " order by Bundesland")
                Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)

                Rdr1 = Cmd1.ExecuteReader()
                'Me.cbImmoBundesland.Items.Add(ALLE)
                While Rdr1.Read
                    Me.cbImmoBundesland.Items.Add(Rdr1.GetString(0))
                End While
                Rdr1.Close()
                Cmd1.Dispose()
            End If
        End If

        If Me.cbImmoBundesland.SelectedIndex >= 0 Then
            strSQL = prepareSQL("select distinct Bezirk from grBezirk where Bezirk is not null " & _
            " and Bundesland like '" & Me.cbImmoBundesland.SelectedItem.Text & "' order by Bezirk")
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)
            Rdr1 = Cmd1.ExecuteReader()
            cbImmoBezirk.Items.Clear()
            'Me.cbImmoBezirk.Items.Add(ALLE)
            While Rdr1.Read
                Me.cbImmoBezirk.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()
        End If

        Me.OdbcConn.Close()
    End Sub

 
    Private Sub cbImmoLand_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoLand.SelectedIndexChanged
        Call landChanged()
    End Sub

    Sub landChanged()
        Me.cbImmoBundesland.Items.Clear()
        Me.cbImmoBezirk.Items.Clear()
        Call loadCB()
    End Sub

    Private Sub cbImmoBundesland_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoBundesland.SelectedIndexChanged
        Me.cbImmoBezirk.Items.Clear()
        Call loadCB()
    End Sub


    Private Sub txtArtNr_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Call setURLSearch()
    End Sub




    'returns true, when enough results for result 
    Function setURLSearch()
        setURLSearch = False
        Dim ArtKatNr As String
        Me.HyperLinkShowResult.Enabled = False

        'Select Kategorie 
        If txtArtKatNr.Text <> "" Then
            ArtKatNr = Me.txtArtKatNr.Text
        ElseIf Me.rbHauptKategorie.SelectedIndex >= 0 And Me.rbNutzung.SelectedIndex >= 0 And Me.rbTyp.SelectedIndex >= 0 Then
            Dim immoObjClass As ImmoObjektClass : immoObjClass = New ImmoObjektClass
            immoObjClass.objConnection = Me.OdbcConn
            If Not Me.OdbcConn.State = ConnectionState.Open Then Me.OdbcConn.Open()
            ArtKatNr = immoObjClass.getArtKatNr(rbHauptKategorie.SelectedItem.Value, _
                                                rbTyp.SelectedItem.Value, _
                                                rbNutzung.SelectedItem.Value)
            Me.OdbcConn.Close()
        End If


        'Wenn eine von der Drei Optionen aktiviert ist dann suchen link aktiv
        If isOption1Selected() Or _
           Me.txtObjektPLZ.Text <> "" Then
            Dim url As String
            url = "/default.asp?pageToShow=productSearchOnKeywords"
            url += "&ArtKatNr=" & ArtKatNr


            If cbImmoLand.SelectedIndex >= 0 Then
                If cbImmoLand.SelectedItem.Value <> ALLE Then
                    url += "&ObjektLand=" & cbImmoLand.SelectedItem.Value
                End If
            End If

            If cbImmoBundesland.SelectedIndex >= 0 Then
                If cbImmoBundesland.SelectedItem.Value <> ALLE Then
                    url += "&ObjektBundesland=" & cbImmoBundesland.SelectedItem.Value
                End If
            End If

            If cbImmoBezirk.SelectedIndex >= 0 Then
                If cbImmoBezirk.SelectedItem.Value <> ALLE Then
                    url += "&ObjektBezirk=" & cbImmoBezirk.SelectedItem.Value
                End If
            End If

            If txtObjektPLZ.Text <> "" Then url += "&ObjektPLZ=" & Me.txtObjektPLZ.Text


            If Me.txtAnzahlzimmerVon.Text <> "" Then url += "&minZimmeranzahl=" & Me.txtAnzahlzimmerVon.Text
            If Me.txtAnzahlzimmerBis.Text <> "" Then url += "&maxZimmeranzahl=" & Me.txtAnzahlzimmerBis.Text

            If Me.txtWohnflaecheVon.Text <> "" Then url += "&minWohnflaeche=" & Me.txtWohnflaecheVon.Text
            If Me.txtWohnflaecheBis.Text <> "" Then url += "&maxWohnflaeche=" & Me.txtWohnflaecheBis.Text


            If Me.txtKaufpreisVon.Text <> "" Then url += "&minPreis=" & Me.txtKaufpreisBis.Text
            If Me.txtKaufpreisBis.Text <> "" Then url += "&maxPreis=" & Me.txtKaufpreisBis.Text

            If Me.txtMietpreisVon.Text <> "" Then url += "&minPreis=" & Me.txtMietpreisVon.Text
            If Me.txtMietpreisBis.Text <> "" Then url += "&maxPreis=" & Me.txtMietpreisBis.Text

            If Me.txtGrundflaecheVon.Text <> "" Then url += "&maxGrundflaeche=" & Me.txtGrundflaecheVon.Text
            If Me.txtGrundflaecheBis.Text <> "" Then url += "&maxGrundflaeche=" & Me.txtGrundflaecheBis.Text

            If Me.txtAnzahlstoeckVon.Text <> "" Then url += "&minAnzahlstoeck=" & Me.txtAnzahlstoeckVon.Text
            If Me.txtAnzahlstoeckBis.Text <> "" Then url += "&maxAnzahlstoeck=" & Me.txtAnzahlstoeckBis.Text

            If cbImmoTyp.SelectedIndex >= 0 Then
                If cbImmoTyp.SelectedItem.Value <> ALLE Then
                    url += "&ImmobilienTyp=" & cbImmoTyp.SelectedItem.Value
                End If
            End If

            Me.HyperLinkShowResult.NavigateUrl = url
            Me.HyperLinkShowResult.Enabled = True
            setURLSearch = True
        End If

    End Function

    Function isOption1Selected() As Boolean
        isOption1Selected = False
        If Not Me.cbImmoLand.SelectedItem Is Nothing Then
            If cbImmoLand.SelectedItem.Value <> ALLE Then
                isOption1Selected = True
            End If
        End If
    End Function

    Private Sub btnShowErweiterteSuche_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        PanelErweiterteSuche.Visible = True
        'btnShowErweiterteSuche.Visible = False
    End Sub


    Sub typSet()

        Me.rbNutzung.Enabled = True


        PanelWohnflaeche.Visible = True
        PanelZimmeranzahl.Visible = True
        PanelKaufpreis.Visible = True
        PanelMietpreis.Visible = True
        PanelBetriebskosten.Visible = False
        PanelGrundflaeche.Visible = True
        PanelStoeckanzahl.Visible = True
        PanelVerwendungsZweck.Visible = False
        rbNutzung.Items.Remove("Pacht")


        If rbTyp.SelectedItem.Value = "Wohnung" Then
            PanelGrundflaeche.Visible = False
            PanelStoeckanzahl.Visible = False
            PanelVerwendungsZweck.Visible = False
        End If

        If rbTyp.SelectedItem.Value = "Haus" Then
            cbVerwendungszweck.Visible = False
        End If

        If rbTyp.SelectedItem.Value = "Grundstück" Then
            PanelWohnflaeche.Visible = False
            PanelZimmeranzahl.Visible = False
            PanelBetriebskosten.Visible = False
            PanelStoeckanzahl.Visible = False
            PanelVerwendungsZweck.Visible = False
            rbNutzung.Items.Add("Pacht")
        End If

        If rbTyp.SelectedItem.Value = "Gewerbeobjekt" Then
            PanelWohnflaeche.Visible = False
            PanelZimmeranzahl.Visible = False
            PanelBetriebskosten.Visible = False
            PanelStoeckanzahl.Visible = False
            cbVerwendungszweck.Visible = False
        End If

        If rbTyp.SelectedItem.Value = "Parkplatz" Then
            PanelWohnflaeche.Visible = False
            PanelZimmeranzahl.Visible = False
            PanelBetriebskosten.Visible = False
            PanelStoeckanzahl.Visible = False
            PanelGrundflaeche.Visible = False
            PanelVerwendungsZweck.Visible = False
        End If

        Call loadImmoTyp()
    End Sub



    Private Sub cbImmoBezirk_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoBezirk.SelectedIndexChanged

    End Sub

    Private Sub ButtonSuche1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.PanelOption1.Visible = False

        Me.PanelErweiterteSuche.Visible = True

    End Sub

    Private Sub ButtonSuche2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

        If Len(Me.txtObjektPLZ.Text) >= 4 Then
            Me.PanelOption1.Visible = False
            Me.PanelErweiterteSuche.Visible = True
        End If

    End Sub

    Private Sub ButtonBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.PanelOption1.Visible = True

        Me.PanelErweiterteSuche.Visible = False
    End Sub


    Private Sub rbTyp_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbTyp.SelectedIndexChanged
        Call typSet()
        rbNutzung.ClearSelection()
        PanelErweiterteSuche.Visible = False
    End Sub

    Private Sub rbNutzung_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles rbNutzung.SelectedIndexChanged
        Call NutzungSet()
        If Not PanelErweiterteSuche.Visible Then
            PanelErweiterteSuche.Visible = True
        End If
    End Sub

    Sub NutzungSet()

        Me.PanelKaufpreis.Visible = False
        Me.PanelMietpreis.Visible = False



        If Me.rbNutzung.SelectedItem.Value = "Kauf" Then
            Me.PanelKaufpreis.Visible = True
        End If

        If Me.rbNutzung.SelectedItem.Value = "Miete" Then
            Me.PanelMietpreis.Visible = True
            Me.lblMietpreis.Text = "Miete (Euro)"
        End If

        If Me.rbNutzung.SelectedItem.Value = "Pacht" Then
            Me.PanelMietpreis.Visible = True
            Me.lblMietpreis.Text = "Pacht (Euro)"
        End If

    End Sub



    'for update or back button 
    Sub loadArtNr(ByVal artNR As String)
        Me.txtArtNr.Text = artNR

        'load data and set it 
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass

        immoObj.objConnection = New Microsoft.Data.Odbc.OdbcConnection(Me.OdbcConn.ConnectionString)
        immoObj.objConnection.Open()
        immoObj.loadFromDB(Me.txtArtNr.Text)

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

        'reopen if closed 
        If immoObj.objConnection.State = ConnectionState.Closed Then
            immoObj.objConnection.Open()
        End If

        'Me.txtBezeichnung.Text = immoObj.getField("Bezeichnung")
        'Me.txtAnzahlstoeckVon().Text = immoObj.getObjektEigenschaft("Stockwerkanzahl")
        'Me.txtAnzahlzimmerVon().Text = immoObj.getObjektEigenschaft("Zimmeranzahl")
        'Me.txtKaufpreisVon().Text = immoObj.getObjektEigenschaft("Kaufpreis")
        'Me.txtMietpreisVon().Text = immoObj.getObjektEigenschaft("Mietpreis")

        'Me.txtBetriebskostenVon().Text = immoObj.getObjektEigenschaft("Betriebskosten")
        'Me.txtGrundflaecheVon().Text = immoObj.getObjektEigenschaft("Grundflaeche")
        'Me.txtWohnflaecheVon().Text = immoObj.getObjektEigenschaft("Wohnflaeche")

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


        Me.txtAnbieter.Text = immoObj.getField("HerstellerNr")

        immoObj.objConnection.Close()
    End Sub


End Class
                                                                                                                                                                                                                                                                                                      