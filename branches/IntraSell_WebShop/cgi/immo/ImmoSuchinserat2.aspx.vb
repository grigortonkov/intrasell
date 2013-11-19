Public Class ImmoSuchinserat2
    Inherits ImmoBaseForm
    Protected WithEvents txtBeschreibung As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtLage As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnbieter As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnZurueck As System.Web.UI.WebControls.Button
    Protected WithEvents OdbcCommand As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents DataList1 As System.Web.UI.WebControls.DataList
    Protected WithEvents LabelGruppe1 As System.Web.UI.WebControls.Label
    Protected WithEvents LabelGruppe2 As System.Web.UI.WebControls.Label
    Protected WithEvents LabelGruppe3 As System.Web.UI.WebControls.Label
    Protected WithEvents Datalist3 As System.Web.UI.WebControls.DataList
    Protected WithEvents Datalist2 As System.Web.UI.WebControls.DataList
    Protected WithEvents OdbcCommand1 As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcCommand2 As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents btnSpeichern As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection
        Me.OdbcCommand = New Microsoft.Data.Odbc.OdbcCommand
        Me.OdbcCommand1 = New Microsoft.Data.Odbc.OdbcCommand
        Me.OdbcCommand2 = New Microsoft.Data.Odbc.OdbcCommand
        '
        'OdbcConn
        '
        Me.OdbcConn.ConnectionString = CType(configurationAppSettings.GetValue("OdbcConn.ConnectionString", GetType(System.String)), String)
        '
        'OdbcCommand
        '
        Me.OdbcCommand.Connection = Me.OdbcConn
        '
        'OdbcCommand1
        '
        Me.OdbcCommand1.Connection = Me.OdbcConn
        '
        'OdbcCommand2
        '
        Me.OdbcCommand2.Connection = Me.OdbcConn

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        If Not Me.IsPostBack Then ' only on load 
            If Request("ArtNr") = "" Then
                Response.Write("Bitte ArtNr parameter verwenden!") : Response.End()
            Else
                Me.txtArtNr.Text = Request("ArtNr")
            End If

            If Request("Anbieter") <> "" Then
                Me.txtAnbieter.Text = Request("Anbieter")
            End If

            Me.OdbcConn.Open()
            'Put user code to initialize the page here
            OdbcCommand.CommandText = prepareSQL("Select keywordId, [name] as KWName from [grArtikel-KeyWords] WHERE " & _
                " ArtKatNr = (select artKatNr from grArtikel where ArtNr=" & Me.txtArtNr.Text & ") " & _
                " and [Gruppe] Like 'Option' Order by [Gruppe], [Order];")
            DataList1.DataSource = OdbcCommand.ExecuteReader
            DataList1.DataBind()

            Me.OdbcConn.Close()
            Me.OdbcConn.Open()

            OdbcCommand1.CommandText = prepareSQL("Select keywordId, [name] as KWName from [grArtikel-KeyWords] WHERE " & _
                " ArtKatNr = (select artKatNr from grArtikel where ArtNr=" & Me.txtArtNr.Text & ") " & _
                " and [Gruppe] Like 'Option2' Order by [Gruppe], [Order];")
            Datalist2.DataSource = OdbcCommand1.ExecuteReader
            Datalist2.DataBind()

            Me.OdbcConn.Close()
            Me.OdbcConn.Open()

            OdbcCommand2.CommandText = prepareSQL("Select keywordId, [name] as KWName from [grArtikel-KeyWords] WHERE " & _
                " ArtKatNr = (select artKatNr from grArtikel where ArtNr=" & Me.txtArtNr.Text & ") " & _
                " and [Gruppe] Like 'Option3' Order by [Gruppe], [Order];")
            Datalist3.DataSource = OdbcCommand2.ExecuteReader
            Datalist3.DataBind()

            Me.OdbcConn.Close()

            Me.LabelGruppe1.Text = getGruppeName(Me.txtArtNr.Text, "Option", Me.OdbcConn.ConnectionString)
            Me.LabelGruppe2.Text = getGruppeName(Me.txtArtNr.Text, "Option2", Me.OdbcConn.ConnectionString)
            Me.LabelGruppe3.Text = getGruppeName(Me.txtArtNr.Text, "Option3", Me.OdbcConn.ConnectionString)

        End If
    End Sub

    Private Sub btnSpeichern_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSpeichern.Click
        If Me.IsValid Then
            Dim immoObj As ImmoObjektClass = New ImmoObjektClass
            immoObj.loadFromDB(Me.txtArtNr.Text)
            immoObj.objConnection = Me.OdbcConn
            immoObj.objConnection.Open()

            immoObj.addObjektInfo("KurzeBeschreibung", Me.txtBeschreibung.Text)
            immoObj.addObjektInfo("LangeBeschreibung", Me.txtLage.Text)

            'end set ean 
            Dim i As Integer
            Dim CurrentCheckBox As CheckBox
            For i = 0 To DataList1.Items.Count - 1
                CurrentCheckBox = DataList1.Items(i).FindControl("CheckBoxOption")
                If CurrentCheckBox.Checked Then
                    Response.Write("Checked!")
                    Call immoObj.addObjektEigenschaft(CurrentCheckBox.Text, "JA")
                End If
            Next


            For i = 0 To Datalist2.Items.Count - 1
                CurrentCheckBox = Datalist2.Items(i).FindControl("CheckBoxOption")
                If CurrentCheckBox.Checked Then
                    Response.Write("Checked!")
                    Call immoObj.addObjektEigenschaft(CurrentCheckBox.Text, "JA")
                End If
            Next


            For i = 0 To Datalist3.Items.Count - 1
                CurrentCheckBox = Datalist3.Items(i).FindControl("CheckBoxOption")
                If CurrentCheckBox.Checked Then
                    Response.Write("Checked!")
                    Call immoObj.addObjektEigenschaft(CurrentCheckBox.Text, "JA")
                End If
            Next


            immoObj.objConnection.Close()
            Response.Redirect("ImmoEingabe4.aspx?PaymentMode=Kostenlos&ArtNr=" & Me.txtArtNr.Text & "&Anbieter=" & Me.txtAnbieter.Text)
        End If
    End Sub
End Class
