Public Class ImmoEingabe3
    Inherits System.Web.UI.Page
    Protected WithEvents OdbcCommand As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents DataList As System.Web.UI.WebControls.DataList
    Protected WithEvents DataList1 As System.Web.UI.WebControls.DataList
    Protected WithEvents btnSpeichern As System.Web.UI.WebControls.Button
    Protected WithEvents txtEAN As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnbieter As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnZurueck As System.Web.UI.WebControls.Button
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()
        Me.OdbcCommand = New Microsoft.Data.Odbc.OdbcCommand()
        '
        'OdbcConn
        '
        Me.OdbcConn.ConnectionString = CType(configurationAppSettings.GetValue("OdbcConn.ConnectionString", GetType(System.String)), String)
        '
        'OdbcCommand
        '
        Me.OdbcCommand.Connection = Me.OdbcConn

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
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
            OdbcCommand.CommandText = "Select keywordId, [name] as KWName from [grArtikel-KeyWords] WHERE " & _
            " ArtKatNr = (select artKatNr from grArtikel where ArtNr=" & Me.txtArtNr.Text & ") and [Gruppe] Like 'Option%' Order by [Gruppe], [Order];"
            DataList1.DataSource = OdbcCommand.ExecuteReader
            DataList1.DataBind()
            Me.OdbcConn.Close()
        End If
    End Sub

    Private Sub btnSpeichern_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSpeichern.Click
        If Me.IsValid Then
            Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
            immoObj.loadFromDB(Me.txtArtNr.Text)
            immoObj.objConnection = Me.OdbcConn
            immoObj.objConnection.Open()

            'set ean 
            If Me.txtEAN.Text <> "" Then
                immoObj.setEAN(txtEAN.Text)
            End If

            'end set ean 
            Dim i As Integer
            For i = 0 To DataList1.Items.Count - 1

                Dim CurrentCheckBox As CheckBox
                CurrentCheckBox = DataList1.Items(i).FindControl("CheckBoxOption")
                If CurrentCheckBox.Checked Then
                    Response.Write("Checked!")
                    Call immoObj.addObjektEigenschaft(CurrentCheckBox.Text, "JA")
                End If
            Next
            immoObj.objConnection.Close()
            Response.Redirect("ImmoEingabe4.aspx?ArtNr=" & Me.txtArtNr.Text & "&Anbieter=" & Me.txtAnbieter.Text)
        End If

    End Sub

    Private Sub btnZurueck_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnZurueck.Click
        Response.Redirect("immoEingabe2.aspx?ArtNr=" & Me.txtArtNr.Text)
    End Sub
End Class
