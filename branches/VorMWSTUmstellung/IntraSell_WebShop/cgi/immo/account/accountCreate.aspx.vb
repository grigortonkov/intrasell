Public Class immoAnbieterRegistrieren
    Inherits System.Web.UI.Page
    Protected WithEvents SubmitForm As System.Web.UI.HtmlControls.HtmlInputButton
    Protected WithEvents validEmail As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validPasswort As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validPasswort2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validEmail2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validAnrede As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validvorname As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validName As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validTel As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validStrasse As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validStrasseNr As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validPLZ As System.Web.UI.WebControls.RegularExpressionValidator
    Protected WithEvents validOrt As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents validLand As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents backToPageAfterLoginOrAnmelden As System.Web.UI.WebControls.TextBox
    Protected WithEvents Email As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Anrede As System.Web.UI.HtmlControls.HtmlSelect
    Protected WithEvents Email2 As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Passwort As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Passwort2 As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Firma As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Titel As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Vorname As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Name As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Web As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Tel As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Fax As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Mobil As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Strasse As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents StrasseNr As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents PLZ As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Ort As System.Web.UI.HtmlControls.HtmlInputText
    Protected WithEvents Land As System.Web.UI.HtmlControls.HtmlSelect
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents PanelForm As System.Web.UI.WebControls.Panel
    Protected WithEvents OdbcConnection1 As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents linkAfterLogin As System.Web.UI.WebControls.HyperLink
    Protected WithEvents panelConfirmation As System.Web.UI.WebControls.Panel
    Protected WithEvents PanelFirma As System.Web.UI.WebControls.Panel
    Protected WithEvents validFirma As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents PanelFirma1 As System.Web.UI.WebControls.Panel
    Protected WithEvents FileFirmaLogo As System.Web.UI.HtmlControls.HtmlInputFile

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()
        Me.OdbcConnection1 = New Microsoft.Data.Odbc.OdbcConnection()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        If Not Me.IsPostBack Then
            'set the back page 
            If Request("backToPageAfterLoginOrAnmelden") <> "" Then
                Me.backToPageAfterLoginOrAnmelden.Text = Request("backToPageAfterLoginOrAnmelden")
            End If

            If Request("Firma") <> "" Then
                Me.PanelFirma.Visible = True
                Me.PanelFirma1.Visible = Me.PanelFirma.Visible
                Me.validFirma.Enabled = Me.PanelFirma.Visible
            Else 'Privat Anbieter
                Me.PanelFirma.Visible = False
                Me.PanelFirma1.Visible = Me.PanelFirma.Visible
                Me.validFirma.Enabled = Me.PanelFirma.Visible
            End If
        End If
    End Sub


    Private Sub SubmitForm_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitForm.ServerClick
        If Me.IsValid Then
            'upload image 



            'create account 
            Dim urlForNewAccount As String = "/defaultPrintEdition.asp?pageToShow=ProfileSave&showForm=false" & _
            "&Email1=" & Me.Email.Value & _
            "&Emailwiederholung1=" & Me.Email2.Value & _
            "&Passwort1=" & Me.Passwort.Value & _
            "&PasswortII1=" & Me.Passwort2.Value & _
            "&Firma1=" & Me.Firma.Value & _
            "&Titel1=" & Me.Titel.Value & _
            "&Anrede1=" & Me.Anrede.Value & _
            "&Name1=" & Me.Name.Value & _
            "&Vorname1=" & Me.Vorname.Value & _
            "&Strasse1=" & Me.Strasse.Value & _
            "&PLZ1=" & Me.PLZ.Value & _
            "&Ort1=" & Me.Ort.Value & _
            "&Tel1=" & Me.Tel.Value & _
            "&Mobil1=" & Me.Mobil.Value & _
            "&Fax1=" & Me.Fax.Value & _
            "&Land1=" & Me.Land.Value & _
            "&Web1=" & Me.Web.Value & _
            "&Geburtstag1="

            Try
                Dim cl As System.Net.WebClient = New System.Net.WebClient()
                cl.BaseAddress = "http://" & Request.ServerVariables("SERVER_NAME")
                Dim myDatabuffer As Byte() = cl.DownloadData(urlForNewAccount)
                ' Display the downloaded data.
                Dim download As String = System.Text.Encoding.ASCII.GetString(myDatabuffer)
                If LCase(Request("debug")) = "true" Then Response.Write("Antwort vom Server: " & download)
                'TODO: response must be checked for errors 

                'the created account hat the biggest ID
                Const USERACCOUNTCREATE_OK_TAG = "USERACCOUNTCREATE_OK"
                Const IDNR_TAG = "IDNR"

                'download must contain <IDNR>123</IDNR>
                If InStr(download, USERACCOUNTCREATE_OK_TAG) > 0 Then 'ACCOUNT CREATED AND NO ERROR WAS RETURNED 
                    Dim newIDNR : newIDNR = Mid(download, _
                                            InStr(download, "<IDNR>") + Len("<IDNR>"), _
                                            InStr(download, "</IDNR>") - InStr(download, "<IDNR>") - Len("<IDNR>"))
                    'Dim sql As String = "select idnr from ofAdressen order by idnr desc"

                    If Not Me.FileFirmaLogo.PostedFile Is Nothing Then
                        If FileFirmaLogo.PostedFile.ContentLength > 0 Then
                            Dim fName As String : fName = "hersteller_logos/" & newIDNR & Right(FileFirmaLogo.PostedFile.FileName, 4)
                            FileFirmaLogo.PostedFile.SaveAs(Server.MapPath("../../../" & fName))
                        End If
                    End If
                    'send back to requesting page 

                    Me.PanelForm.Visible = False
                    Me.panelConfirmation.Visible = True

                    Me.linkAfterLogin.NavigateUrl = "../../../default.asp?pageToShow=MyAccount" & _
                    "&action=login" & _
                    "&Email=" & Me.Email.Value & _
                    "&Password=" & Me.Passwort.Value & _
                    "&backToPageAfterLoginOrAnmelden=" & Me.backToPageAfterLoginOrAnmelden.Text



                Else ' bei fehler
                    Response.Write("Account konnte nicht erstellt werden!")
                    Response.Write("Request: " & urlForNewAccount)
                    Response.Write("Antwort vom Server: " & download)
                End If

            Catch
                Response.Write("Account konnte nicht erstellt werden!")
                Response.Write("Request: " & urlForNewAccount)
                Response.Write("Error:" & Err.Description)
                Exit Sub
            End Try

        End If
    End Sub

    Private Sub Anrede_ServerChange(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Anrede.ServerChange

    End Sub

    Private Sub SubmitLogin_ServerClick(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Me.linkAfterLogin.NavigateUrl = "../../../default.asp?pageToShow=MyAccount" & _
                    "&action=login" & _
                    "&Email=" & Me.Email.Value & _
                    "&Password=" & Me.Passwort.Value & _
                    "&backToPageAfterLoginOrAnmelden=" & Me.backToPageAfterLoginOrAnmelden.Text
    End Sub
End Class
