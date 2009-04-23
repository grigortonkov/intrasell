Public Class ImmoSuche
    Inherits System.Web.UI.Page
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
    Protected WithEvents validSuche As System.Web.UI.WebControls.CustomValidator
    Protected WithEvents txtArtKatNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents PanelKategorie As System.Web.UI.WebControls.Panel
    Protected WithEvents lblObjektnummer As System.Web.UI.WebControls.Label
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents PanelErweiterteSuche As System.Web.UI.WebControls.Panel
    Protected WithEvents cbVerwendungszweck As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblVerwendungszweck As System.Web.UI.WebControls.Label
    Protected WithEvents lblAnzahlstoeck As System.Web.UI.WebControls.Label
    Protected WithEvents lblGrundflaeche As System.Web.UI.WebControls.Label
    Protected WithEvents lblBetriebskosten As System.Web.UI.WebControls.Label
    Protected WithEvents lblMietpreis As System.Web.UI.WebControls.Label
    Protected WithEvents lblKaufpreis As System.Web.UI.WebControls.Label
    Protected WithEvents lblAnzahlzimmer As System.Web.UI.WebControls.Label
    Protected WithEvents txtWohnflaecheVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblWohnflaeche As System.Web.UI.WebControls.Label
    Protected WithEvents cbImmoTyp As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblImmoTyp As System.Web.UI.WebControls.Label
    Protected WithEvents txtWohnflaecheBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnShowErweiterteSuche As System.Web.UI.WebControls.Button
    Protected WithEvents txtAnzahlzimmerVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlzimmerBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtKaufpreisVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtKaufpreisBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtMietpreisVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtMietpreisBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtBetriebskostenVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtBetriebskostenBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtGrundflaecheVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtGrundflaecheBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlstoeckVon As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnzahlstoeckBis As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSuchen As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader()
        Me.OdbcCommand = New Microsoft.Data.Odbc.OdbcCommand()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()
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

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        If Not IsPostBack Then
            If Request("ArtKatNr") <> "" Then
                Me.txtArtKatNr.Text = Request("ArtKatNR")
                Me.PanelKategorie.Visible = False
            Else
                Response.Write("Parameter ArtKatNr fehlt!")
            End If
        End If

        Call loadCB()
    End Sub

    Private Sub btnSuchen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSuchen.Click
        If Me.IsValid Then
            'CREATE AN XML DOCUMENT AND SEND IT FOR INSERT
            Dim immoObj As System.Xml.XmlDocument : immoObj = New System.Xml.XmlDocument()

            immoObj.LoadXml( _
                    "<ImmobilienObjekt>" & _
                        "<Kategorie>" & rbTyp.SelectedItem.Value & "</Kategorie>" & _
                        "<KategorieHaupt>" & rbHauptKategorie.SelectedItem.Value & "</KategorieHaupt>" & _
                        "<KategorieSub>" & rbNutzung.SelectedItem.Value & "</KategorieSub>" & _
                        "<Adresse>" & _
                            "<ObjektLand>" & Me.cbImmoLand.SelectedItem.Text & "</ObjektLand>" & _
                            "<ObjektBundesland>" & Me.cbImmoBundesland.SelectedItem.Text & "</ObjektBundesland>" & _
                            "<ObjektBezirk>" & Me.cbImmoBezirk.SelectedItem.Text & "</ObjektBezirk>" & _
                            "<ObjektPLZ>" & Me.txtObjektPLZ.Text & "</ObjektPLZ>" & _
                        "</Adresse>" & _
                    "</ImmobilienObjekt>")
            '"<Beschreibung>" & Me.txtBeschreibung.Text & "</Beschreibung>" & _

            Dim immoObjClass As ImmoObjektClass : immoObjClass = New ImmoObjektClass()
            immoObjClass.objConnection = Me.OdbcConn
            Dim sql As String = immoObjClass.makeSQLFromXML(immoObj)

            'Response.Write("Danke! Ihr Inserat wurde erfolgreich gespeichert!")
            Response.Redirect("default.asp?ArtNr=" & Me.txtArtNr.Text)

        End If
        ' Me.txtBeschreibung.Text = "loading"
    End Sub


    Private Sub loadCB()
        Dim Rdr1 As Microsoft.Data.Odbc.OdbcDataReader
        Dim Cmd1 As Microsoft.Data.Odbc.OdbcCommand
        Dim strSQL As String

        Me.OdbcConn.Open()

        If Me.cbImmoLand.Items.Count <= 0 Then ' still emtpy 
            cbImmoLand.Items.Clear()
            Me.cbImmoLand.Items.Add("")
            strSQL = "select [name] from grLand order by [name]"
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
                strSQL = "select distinct Bundesland from grBezirk where Bundesland is not null " & _
                " and land in (select idnr from grLand where [Name]like '" & Me.cbImmoLand.SelectedItem.Text & "') " & _
                " order by Bundesland"
                Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)

                Rdr1 = Cmd1.ExecuteReader()
                Me.cbImmoBundesland.Items.Add("")
                While Rdr1.Read
                    Me.cbImmoBundesland.Items.Add(Rdr1.GetString(0))
                End While
                Rdr1.Close()
                Cmd1.Dispose()
            End If
        End If

        If Me.cbImmoBundesland.SelectedIndex >= 0 Then
            strSQL = "select distinct Bezirk from grBezirk where Bezirk is not null " & _
            " and Bundesland like '" & Me.cbImmoBundesland.SelectedItem.Text & "' order by Bezirk"
            Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)
            Rdr1 = Cmd1.ExecuteReader()
            cbImmoBezirk.Items.Clear()
            Me.cbImmoBezirk.Items.Add("")
            While Rdr1.Read
                Me.cbImmoBezirk.Items.Add(Rdr1.GetString(0))
            End While
            Rdr1.Close()
            Cmd1.Dispose()
        End If

        Me.OdbcConn.Close()
    End Sub



    Private Sub cbImmoLand_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoLand.SelectedIndexChanged
        Me.cbImmoBundesland.Items.Clear()
        Me.cbImmoBezirk.Items.Clear()
        Call loadCB()
        Call setURLSearch()
    End Sub

    Private Sub cbImmoBundesland_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbImmoBundesland.SelectedIndexChanged
        Me.cbImmoBezirk.Items.Clear()
        Call loadCB()
        Call setURLSearch()
    End Sub


    Private Sub LinkDetailSearchResult_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub txtArtNr_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Call setURLSearch()
    End Sub

    Sub setURLSearch()
        Dim ArtKatNr As String
        Me.HyperLinkShowResult.Enabled = False

        'Select Kategorie 
        If txtArtKatNr.Text <> "" Then
            ArtKatNr = Me.txtArtKatNr.Text
        ElseIf Me.rbHauptKategorie.SelectedIndex >= 0 And Me.rbNutzung.SelectedIndex >= 0 And Me.rbTyp.SelectedIndex >= 0 Then
            Dim immoObjClass As ImmoObjektClass : immoObjClass = New ImmoObjektClass()
            immoObjClass.objConnection = Me.OdbcConn
            Me.OdbcConn.Open()
            ArtKatNr = immoObjClass.getArtKatNr(rbHauptKategorie.SelectedItem.Value, _
                                                rbTyp.SelectedItem.Value, _
                                                rbNutzung.SelectedItem.Value)
            Me.OdbcConn.Close()
        End If


        'Wenn eine von der Drei Optionen aktiviert ist dann suchen link aktiv
        If Me.cbImmoLand.SelectedItem.Value <> "" Or _
           Me.txtArtNr.Text <> "" Or _
           Me.txtObjektPLZ.Text <> "" Then
            Dim url As String
            url = "../../default.asp?pageToShow=productSearchOnKeywords"
            url += "&ArtKatNr=" & ArtKatNr

            If txtArtNr.Text <> "" Then url += "&ArtNr=" & Me.txtArtNr.Text

            If cbImmoLand.SelectedIndex >= 0 Then url += "&ObjektLand=" & cbImmoLand.SelectedItem.Value
            If cbImmoBundesland.SelectedIndex >= 0 Then url += "&ObjektBundesland=" & cbImmoBundesland.SelectedItem.Value
            If cbImmoBezirk.SelectedIndex >= 0 Then url += "&ObjektBezirk=" & cbImmoBezirk.SelectedItem.Value

            If txtObjektPLZ.Text <> "" Then url += "&ObjektPLZ=" & Me.txtObjektPLZ.Text


            If Me.txtAnzahlzimmerVon.Text <> "" Then url += "&minZimmeranzahl=" & Me.txtAnzahlzimmerVon.Text
            If Me.txtAnzahlzimmerBis.Text <> "" Then url += "&maxZimmeranzahl=" & Me.txtAnzahlzimmerBis.Text

            Me.HyperLinkShowResult.NavigateUrl = url
            Me.HyperLinkShowResult.Enabled = True
        End If

    End Sub

    Private Sub txtObjektPLZ_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtObjektPLZ.TextChanged
        setURLSearch()
    End Sub

    Private Sub btnShowErweiterteSuche_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnShowErweiterteSuche.Click
        PanelErweiterteSuche.Visible = True
        btnShowErweiterteSuche.Visible = False
    End Sub


End Class
