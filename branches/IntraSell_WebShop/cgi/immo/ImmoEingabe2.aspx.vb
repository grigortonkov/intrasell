Public Class ImmoEingabe2
    Inherits System.Web.UI.Page
    Protected WithEvents txtBeschreibung As System.Web.UI.WebControls.TextBox
    Protected WithEvents File_WeitereBilder As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents File_Hauptbild As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents File_Grundriss As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents Image_Hauptbild As System.Web.UI.WebControls.Image
    Protected WithEvents Image_WeitereBilder1 As System.Web.UI.WebControls.Image
    Protected WithEvents Image_Grundriss As System.Web.UI.WebControls.Image
    Protected WithEvents txtArtNr As System.Web.UI.WebControls.TextBox
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents Image_WeitereBilder2 As System.Web.UI.WebControls.Image
    Protected WithEvents Image_WeitereBilder3 As System.Web.UI.WebControls.Image
    Protected WithEvents btnIMGUpload As System.Web.UI.WebControls.Button
    Protected WithEvents txtLage As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAusstattung As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAnbieter As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSpeichern As System.Web.UI.WebControls.Button
    Protected WithEvents cbDeleteHauptbild As System.Web.UI.WebControls.CheckBox
    Protected WithEvents cbDeleteGrundriss As System.Web.UI.WebControls.CheckBox
    Protected WithEvents cbDelete_WeitereBilder1 As System.Web.UI.WebControls.CheckBox
    Protected WithEvents cbDelete_WeitereBilder2 As System.Web.UI.WebControls.CheckBox
    Protected WithEvents cbDelete_WeitereBilder3 As System.Web.UI.WebControls.CheckBox
    Protected WithEvents Image_Grundriss2 As System.Web.UI.WebControls.Image
    Protected WithEvents cbDeleteGrundriss2 As System.Web.UI.WebControls.CheckBox
    Protected WithEvents Image_WeitereBilder4 As System.Web.UI.WebControls.Image
    Protected WithEvents Image_WeitereBilder5 As System.Web.UI.WebControls.Image
    Protected WithEvents btnIMGUpload_Hauptbild As System.Web.UI.WebControls.Button
    Protected WithEvents btnIMGUpload_Weiteresbild As System.Web.UI.WebControls.Button
    Protected WithEvents btnIMGUpload_Grundriss As System.Web.UI.WebControls.Button
    Protected WithEvents btnIMGUpload_Grundriss2 As System.Web.UI.WebControls.Button
    Protected WithEvents cbDelete_WeitereBilder4 As System.Web.UI.WebControls.CheckBox
    Protected WithEvents cbDelete_WeitereBilder5 As System.Web.UI.WebControls.CheckBox
    Protected WithEvents btnIMGUpload_Weiteresbild2 As System.Web.UI.WebControls.Button
    Protected WithEvents btnIMGUpload_Weiteresbild3 As System.Web.UI.WebControls.Button
    Protected WithEvents btnIMGUpload_Weiteresbild4 As System.Web.UI.WebControls.Button
    Protected WithEvents btnIMGUpload_Weiteresbild5 As System.Web.UI.WebControls.Button
    Protected WithEvents File_WeitereBilder2 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents File_WeitereBilder3 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents File_WeitereBilder4 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents File_WeitereBilder5 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents Panel_13 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_1 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_2 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_23 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_33 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_43 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_53 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_63 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_73 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_83 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_3 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_4 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_5 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_6 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_7 As System.Web.UI.WebControls.Panel
    Protected WithEvents Panel_8 As System.Web.UI.WebControls.Panel
    Protected WithEvents File_Grundriss2 As System.Web.UI.HtmlControls.HtmlInputFile
    Protected WithEvents btnZurueck As System.Web.UI.WebControls.Button
    Protected WithEvents txtSonstiges As System.Web.UI.WebControls.TextBox

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
        If Request("ArtNr") = "" Then
            Response.Write("Bitte ArtNr parameter verwenden!") : Response.End()
        End If

        If Request("Anbieter") <> "" Then
            Me.txtAnbieter.Text = Request("Anbieter")
        End If

        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        Me.txtArtNr.Text = Request("ArtNr")
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        If Not Me.IsPostBack Then 'Request("Action") = "Load" Then
            Me.txtBeschreibung.Text = immoObj.getObjektInfo("Beschreibung")
            Me.txtLage.Text = immoObj.getObjektInfo("Lage")
            Me.txtSonstiges.Text = immoObj.getObjektInfo("Sonstiges")
            Me.txtAusstattung.Text = immoObj.getObjektInfo("Ausstattung")
        End If

        immoObj.objConnection.Close()
        Call loadBilder()
    End Sub

    Private Sub btnSpeichern_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSpeichern.Click
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        Call uplBilder()

        If Not OdbcConn.State = ConnectionState.Open Then
            immoObj.objConnection.Open()
        End If

        If Me.txtBeschreibung.Text <> "" Then
            immoObj.addObjektInfo("Beschreibung", Me.txtBeschreibung.Text)
        End If

        If Me.txtLage.Text <> "" Then
            immoObj.addObjektInfo("Lage", Me.txtLage.Text)
        End If

        If Me.txtAusstattung.Text <> "" Then
            immoObj.addObjektInfo("Ausstattung", Me.txtAusstattung.Text)
        End If

        If Me.txtSonstiges.Text <> "" Then
            immoObj.addObjektInfo("Sonstiges", Me.txtSonstiges.Text)
        End If
        immoObj.objConnection.Close()

        Response.Redirect("ImmoEingabe3.aspx?ArtNr=" & Me.txtArtNr.Text & "&Anbieter=" & Me.txtAnbieter.Text)

    End Sub


    Private Sub btnIMGUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload.Click
        Call uplBilder()
        loadBilder()
    End Sub


    Private Sub uplBilder()
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn


        If Not OdbcConn.State = ConnectionState.Open Then
            immoObj.objConnection.Open()
        End If

        If Not File_Hauptbild.PostedFile Is Nothing Then
            If File_Hauptbild.PostedFile.ContentLength > 0 Then
                Dim fName As String : fName = immoObj.getFilenameImage("Hauptbild", Right(File_Hauptbild.PostedFile.FileName, 4))
                File_Hauptbild.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile("Hauptbild", fName)
                immoObj.setImage(fName)
            End If
        End If

        If Not File_Grundriss.PostedFile Is Nothing Then
            If File_Grundriss.PostedFile.ContentLength > 0 Then
                Dim fName As String : fName = immoObj.getFilenameImage("Grundriss", Right(File_Grundriss.PostedFile.FileName, 4))
                File_Grundriss.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile("Grundriss", fName)
            End If
        End If
        If Not File_Grundriss2.PostedFile Is Nothing Then
            If File_Grundriss2.PostedFile.ContentLength > 0 Then
                Dim fName As String : fName = immoObj.getFilenameImage("Grundriss2", Right(File_Grundriss.PostedFile.FileName, 4))
                File_Grundriss2.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile("Grundriss2", fName)
            End If
        End If
        If Not File_WeitereBilder.PostedFile Is Nothing Then
            If Me.File_WeitereBilder.PostedFile.ContentLength > 0 Then
                Dim fNameIndex As String = "Objektbild1" '& getNextBildIndex(immoObj)
                Dim fName As String : fName = immoObj.getFilenameImage(fNameIndex, Right(File_WeitereBilder.PostedFile.FileName, 4))
                File_WeitereBilder.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile(fNameIndex, fName)
            End If
        End If
        If Not File_WeitereBilder2.PostedFile Is Nothing Then
            If Me.File_WeitereBilder2.PostedFile.ContentLength > 0 Then
                Dim fNameIndex As String = "Objektbild2" '& getNextBildIndex(immoObj)
                Dim fName As String : fName = immoObj.getFilenameImage(fNameIndex, Right(File_WeitereBilder2.PostedFile.FileName, 4))
                File_WeitereBilder2.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile(fNameIndex, fName)
            End If
        End If
        If Not File_WeitereBilder3.PostedFile Is Nothing Then
            If Me.File_WeitereBilder3.PostedFile.ContentLength > 0 Then
                Dim fNameIndex As String = "Objektbild3" '& getNextBildIndex(immoObj)
                Dim fName As String : fName = immoObj.getFilenameImage(fNameIndex, Right(File_WeitereBilder3.PostedFile.FileName, 4))
                File_WeitereBilder3.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile(fNameIndex, fName)
            End If
        End If
        If Not File_WeitereBilder4.PostedFile Is Nothing Then
            If Me.File_WeitereBilder4.PostedFile.ContentLength > 0 Then
                Dim fNameIndex As String = "Objektbild4" '& getNextBildIndex(immoObj)
                Dim fName As String : fName = immoObj.getFilenameImage(fNameIndex, Right(File_WeitereBilder4.PostedFile.FileName, 4))
                File_WeitereBilder4.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile(fNameIndex, fName)
            End If
        End If
        If Not File_WeitereBilder5.PostedFile Is Nothing Then
            If Me.File_WeitereBilder5.PostedFile.ContentLength > 0 Then
                Dim fNameIndex As String = "Objektbild5" '& getNextBildIndex(immoObj)
                Dim fName As String : fName = immoObj.getFilenameImage(fNameIndex, Right(File_WeitereBilder5.PostedFile.FileName, 4))
                File_WeitereBilder5.PostedFile.SaveAs(Server.MapPath("../../" & fName))
                immoObj.addFile(fNameIndex, fName)
            End If
        End If
        Me.OdbcConn.Close()
        loadBilder()
    End Sub

    Function getNextBildIndex(ByVal immoObj As ImmoObjektClass) As String
        getNextBildIndex = 1

        If immoObj.getObjektEigenschaft("Objektbild1") = "n.a." Then
            getNextBildIndex = 1
            Exit Function
        End If

        If immoObj.getObjektEigenschaft("Objektbild2") = "n.a." Then
            getNextBildIndex = 2
            Exit Function
        End If

        If immoObj.getObjektEigenschaft("Objektbild3") = "n.a." Then
            getNextBildIndex = 3
            Exit Function
        End If
    End Function


    Private Sub loadBilder()
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        Me.OdbcConn.Open()

        If immoObj.getObjektEigenschaft("Hauptbild") <> "n.a." Then
            'Me.Image_Hauptbild.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Hauptbild")
            Me.Image_Hauptbild.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Hauptbild")
            Me.Image_Hauptbild.Visible = True
        Else
            Me.Image_Hauptbild.Visible = False
        End If
        Me.cbDeleteHauptbild.Visible = Me.Image_Hauptbild.Visible

        'Weiterebilder 1
        If immoObj.getObjektEigenschaft("Objektbild1") <> "n.a." Then
            'Me.Image_WeitereBilder1.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Objektbild1")
            Me.Image_WeitereBilder1.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Objektbild1")
            Me.Image_WeitereBilder1.Visible = True
        Else
            Me.Image_WeitereBilder1.Visible = False
        End If
        Me.cbDelete_WeitereBilder1.Visible = Me.Image_WeitereBilder1.Visible

        'Weiterebilder 2
        If immoObj.getObjektEigenschaft("Objektbild2") <> "n.a." Then
            'Me.Image_WeitereBilder2.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Objektbild2")
            Me.Image_WeitereBilder2.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Objektbild2")
            Me.Image_WeitereBilder2.Visible = True
        Else
            Me.Image_WeitereBilder2.Visible = False
        End If
        Me.cbDelete_WeitereBilder2.Visible = Me.Image_WeitereBilder2.Visible

        'Weiterebilder 3
        If immoObj.getObjektEigenschaft("Objektbild3") <> "n.a." Then
            'Me.Image_WeitereBilder3.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Objektbild3")
            Me.Image_WeitereBilder3.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Objektbild3")
            Me.Image_WeitereBilder3.Visible = True
        Else
            Me.Image_WeitereBilder3.Visible = False
        End If
        Me.cbDelete_WeitereBilder3.Visible = Me.Image_WeitereBilder3.Visible


        'Weiterebilder 4
        If immoObj.getObjektEigenschaft("Objektbild4") <> "n.a." Then
            'Me.Image_WeitereBilder4.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Objektbild3")
            Me.Image_WeitereBilder4.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Objektbild4")
            Me.Image_WeitereBilder4.Visible = True
        Else
            Me.Image_WeitereBilder4.Visible = False
        End If
        Me.cbDelete_WeitereBilder4.Visible = Me.Image_WeitereBilder4.Visible


        'Weiterebilder 5
        If immoObj.getObjektEigenschaft("Objektbild5") <> "n.a." Then
            'Me.Image_WeitereBilder5.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Objektbild3")
            Me.Image_WeitereBilder5.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Objektbild5")
            Me.Image_WeitereBilder5.Visible = True
        Else
            Me.Image_WeitereBilder5.Visible = False
        End If
        Me.cbDelete_WeitereBilder5.Visible = Me.Image_WeitereBilder5.Visible



        'Grundriss
        If immoObj.getObjektEigenschaft("Grundriss") <> "n.a." Then
            'Me.Image_Grundriss.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Grundriss")
            Me.Image_Grundriss.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Grundriss")
            Me.Image_Grundriss.Visible = True
        Else
            Me.Image_Grundriss.Visible = False
        End If
        Me.cbDeleteGrundriss.Visible = Me.Image_Grundriss.Visible


        If immoObj.getObjektEigenschaft("Grundriss2") <> "n.a." Then
            'Me.Image_Grundriss2.ImageUrl = "../../" & immoObj.getObjektEigenschaft("Grundriss2")
            Me.Image_Grundriss2.ImageUrl = "../../productImages/thumbnail.aspx?width=100&filename=" & immoObj.getObjektEigenschaft("Grundriss2")
            Me.Image_Grundriss2.Visible = True
        Else
            Me.Image_Grundriss2.Visible = False
        End If
        Me.cbDeleteGrundriss2.Visible = Me.Image_Grundriss2.Visible


        Me.Panel_1.Visible = Not Me.Image_Hauptbild.Visible
        Me.Panel_13.Visible = Not Me.Image_Hauptbild.Visible

        Me.Panel_2.Visible = Not Me.Image_WeitereBilder1.Visible
        Me.Panel_23.Visible = Not Me.Image_WeitereBilder1.Visible

        Me.Panel_3.Visible = Not Me.Image_WeitereBilder2.Visible
        Me.Panel_33.Visible = Not Me.Image_WeitereBilder2.Visible

        Me.Panel_4.Visible = Not Me.Image_WeitereBilder3.Visible
        Me.Panel_43.Visible = Not Me.Image_WeitereBilder3.Visible

        Me.Panel_5.Visible = Not Me.Image_WeitereBilder4.Visible
        Me.Panel_53.Visible = Not Me.Image_WeitereBilder4.Visible

        Me.Panel_6.Visible = Not Me.Image_WeitereBilder5.Visible
        Me.Panel_63.Visible = Not Me.Image_WeitereBilder5.Visible

        Me.Panel_7.Visible = Not Me.Image_Grundriss.Visible
        Me.Panel_73.Visible = Not Me.Image_Grundriss.Visible

        Me.Panel_8.Visible = Not Me.Image_Grundriss2.Visible
        Me.Panel_83.Visible = Not Me.Image_Grundriss2.Visible

        Me.OdbcConn.Close()
    End Sub

    Private Sub cbDeleteHauptbild_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDeleteHauptbild.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Hauptbild", "")

        OdbcConn.Close()
        loadBilder()
        cbDeleteHauptbild.Checked = False
    End Sub

    Private Sub cbDeleteGrundriss_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDeleteGrundriss.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Grundriss", "")

        OdbcConn.Close()
        loadBilder()
        cbDeleteGrundriss.Checked = False
    End Sub

    Private Sub cbDelete_WeitereBilder1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDelete_WeitereBilder1.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Objektbild1", "")

        OdbcConn.Close()
        loadBilder()
        cbDelete_WeitereBilder1.Checked = False
    End Sub

    Private Sub cbDelete_WeitereBilder2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDelete_WeitereBilder2.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Objektbild2", "")

        OdbcConn.Close()
        loadBilder()
        cbDelete_WeitereBilder2.Checked = False
    End Sub

    Private Sub cbDelete_WeitereBilder3_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDelete_WeitereBilder3.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Objektbild3", "")

        OdbcConn.Close()
        loadBilder()
        cbDelete_WeitereBilder3.Checked = False
    End Sub

    Private Sub cbDelete_WeitereBilder4_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDelete_WeitereBilder3.CheckedChanged, cbDelete_WeitereBilder4.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Objektbild4", "")

        OdbcConn.Close()
        loadBilder()
        cbDelete_WeitereBilder4.Checked = False
    End Sub

    Private Sub cbDelete_WeitereBilder5_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDelete_WeitereBilder3.CheckedChanged, cbDelete_WeitereBilder5.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Objektbild5", "")

        OdbcConn.Close()
        loadBilder()
        cbDelete_WeitereBilder5.Checked = False
    End Sub


    Private Sub btnIMGUpload_Hauptbild_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Hauptbild.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnIMGUpload_Weiteresbild_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Weiteresbild.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnIMGUpload_Grundriss_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Grundriss.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnIMGUpload_Grundriss2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Grundriss2.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub cbDeleteGrundriss2_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbDeleteGrundriss2.CheckedChanged
        Dim immoObj As ImmoObjektClass = New ImmoObjektClass()
        immoObj.loadFromDB(Me.txtArtNr.Text)
        immoObj.objConnection = Me.OdbcConn
        immoObj.objConnection.Open()

        immoObj.addObjektEigenschaft("Grundriss2", "")

        OdbcConn.Close()
        loadBilder()
        cbDeleteGrundriss2.Checked = False
    End Sub

    Private Sub btnIMGUpload_Weiteresbild2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Weiteresbild2.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnIMGUpload_Weiteresbild3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Weiteresbild3.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnIMGUpload_Weiteresbild4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Weiteresbild4.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnIMGUpload_Weiteresbild5_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIMGUpload_Weiteresbild5.Click
        Call uplBilder()
        loadBilder()
    End Sub

    Private Sub btnZurueck_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnZurueck.Click
        Response.Redirect("immoEingabe.aspx?ArtNr=" & Me.txtArtNr.Text)
    End Sub
End Class
