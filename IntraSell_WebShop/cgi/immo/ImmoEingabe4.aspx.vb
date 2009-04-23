Public Class ImmoEingabe4
    Inherits System.Web.UI.Page
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents validKPEmail As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents txtKontaktpersonEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator3 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents txtKontaktpersonTel As System.Web.UI.WebControls.TextBox
    Protected WithEvents validKontaktperson As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents btnLoadData As System.Web.UI.WebControls.Button
    Protected WithEvents btnSpeichern As System.Web.UI.WebControls.Button
    Protected WithEvents pLOGIN As System.Web.UI.WebControls.Panel
    Protected WithEvents txtAnbieter As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents OdbcCommand As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents OdbcDataAdapter_ofAdressen As Microsoft.Data.Odbc.OdbcDataAdapter
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents txtKontaktpersonFax As System.Web.UI.WebControls.TextBox
    Protected WithEvents Requiredfieldvalidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents PanelKontaktperson As System.Web.UI.WebControls.Panel
    Protected WithEvents CheckBoxAktiv As System.Web.UI.WebControls.CheckBox
    Protected WithEvents linkArtikel As System.Web.UI.WebControls.HyperLink
    Protected WithEvents PanelDanke As System.Web.UI.WebControls.Panel
    Protected WithEvents txtKontaktperson As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnZurueck As System.Web.UI.WebControls.Button
    Const AktuelleEingabeArtNr = "AktuelleEingabeArtNr"
#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader()
        Me.OdbcCommand = New Microsoft.Data.Odbc.OdbcCommand()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()
        Me.OdbcDataAdapter_ofAdressen = New Microsoft.Data.Odbc.OdbcDataAdapter()
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

        If Not Me.IsPostBack Then
            If Me.txtArtNr.Text = "" And Session("CurrentArtNr") <> "" Then 'the user comes from login/account form 
                Me.txtArtNr.Text = Session("CurrentArtNr")
            End If

            If Me.txtArtNr.Text = "" And Request("ArtNr") <> "" Then
                Me.txtArtNr.Text = Request("ArtNr")
            End If

            If Session(AktuelleEingabeArtNr) <> "" Then
                Me.txtArtNr.Text = Session(AktuelleEingabeArtNr)
                Session(AktuelleEingabeArtNr) = "" 'delete the session 
            End If

            'cancel page loading if not specified then ArtNr
            If Me.txtArtNr.Text = "" Then
                Response.Write("ArtNr is not specified!")
                Response.End()
            End If

            If Request("Anbieter") <> "" Then
                Me.txtAnbieter.Text = Request("Anbieter")
            End If

            ' if the user is not logged then create new account or let the user login firstly 
            If Me.txtAnbieter.Text = "" Or Me.txtAnbieter.Text = "0" Then  'not specified 
                Me.pLOGIN.Visible = True
                Me.PanelKontaktperson.Enabled = False
                Session(AktuelleEingabeArtNr) = Me.txtArtNr.Text
                'show new account form 
                Response.Redirect("account/accountCreate.aspx?backToPageAfterLoginOrAnmelden=ImmoInseratAufgebenAfterLogin")
            Else ' the user is logged in 
                Call loadPersData()
                Me.pLOGIN.Visible = False
                Me.PanelKontaktperson.Enabled = True

                'set checkbox active ot not 
                Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
                immoObj.loadFromDB(Me.txtArtNr.Text)
                immoObj.objConnection = Me.OdbcConn
                Me.OdbcConn.Open()
                Me.CheckBoxAktiv.Checked = immoObj.isAktiv()
                Me.OdbcConn.Close()
            End If

        End If
    End Sub

    Private Sub btnSpeichern_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSpeichern.Click
        If Me.IsValid Then
            'Response.Write("Danke!")

            Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
            immoObj.loadFromDB(Me.txtArtNr.Text)
            immoObj.objConnection = Me.OdbcConn
            Me.OdbcConn.Open()

            immoObj.setAnbieter(Me.txtAnbieter.Text, Me.txtKontaktperson.Text, Me.txtKontaktpersonFax.Text, txtKontaktpersonEmail.Text, txtKontaktpersonTel.Text)
            If Me.CheckBoxAktiv.Checked Then
                immoObj.setAktiv(-1) 'aktivieren
            Else
                immoObj.setAktiv(0) 'deaktivieren
            End If

            Me.OdbcConn.Close()

            'Response.End()
            Me.PanelKontaktperson.Visible = False
            pLOGIN.Visible = False
            Me.linkArtikel.NavigateUrl = "../../default.asp?ArtNr=" & Me.txtArtNr.Text
            Me.PanelDanke.Visible = True
        End If
    End Sub

    Private Sub btnLoadData_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLoadData.Click
        Call loadPersData()
    End Sub

    Private Sub loadPersData()
        'loads the data from the account and sets it as contact address
        Dim Rdr1 As Microsoft.Data.Odbc.OdbcDataReader
        Dim Cmd1 As Microsoft.Data.Odbc.OdbcCommand
        Dim strSQL As String

        Me.OdbcConn.Open()

        strSQL = "select Idnr, Name, Tel, Fax, Email from ofAdressen where idnr=" & Me.txtAnbieter.Text
        Cmd1 = New Microsoft.Data.Odbc.OdbcCommand(strSQL, Me.OdbcConn)
        Rdr1 = Cmd1.ExecuteReader()
        If Rdr1.Read Then
            Me.txtKontaktperson.Text = Rdr1.Item("Name") & ""
            Me.txtKontaktpersonTel.Text = Rdr1.Item("Tel") & ""
            Me.txtKontaktpersonFax.Text = Rdr1.Item("Fax") & ""
            Me.txtKontaktpersonEmail.Text = Rdr1.Item("Email") & ""
        End If
        Me.OdbcConn.Close()
    End Sub

    Private Sub btnMakeAccount_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

        'Response.Redirect("default.asp?pageToShow=NewAccount")
    End Sub

    Private Sub LinkButtonKontoAnlegen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Redirect("default.asp?pageToShow=NewAccount")
    End Sub

    Private Sub btnZurueck_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnZurueck.Click
        Response.Redirect("immoEingabe3.aspx?ArtNr=" & Me.txtArtNr.Text)
    End Sub
End Class
