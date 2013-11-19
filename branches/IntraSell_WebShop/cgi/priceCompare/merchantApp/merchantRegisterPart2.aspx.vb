Public Class WebForm5
    Inherits System.Web.UI.Page
    Protected WithEvents TextBox5 As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblURL As System.Web.UI.WebControls.Label
    Protected WithEvents lblFTPServername As System.Web.UI.WebControls.Label
    Protected WithEvents lblFTPUsername As System.Web.UI.WebControls.Label
    Protected WithEvents lblFTPPasswort As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotiz As System.Web.UI.WebControls.Label
    Protected WithEvents txtURLFile As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtFTPServername As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtFTPUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtFTPPasswort As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblDanke As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents txtShopURL As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAGBURL As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtProduktURL As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSend As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub btnSend_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSend.Click
        'if form validated 
        Dim elmnt As String
        Dim regText
        For Each elmnt In Request.Form
            'Response.Write("<br>Element" & Request.Form(elmnt))
            regText = regText & "<br>" & elmnt & " = " & Request.Form(elmnt)
        Next

        If Me.IsValid Then
            Call sendRegEmail("Registration part 2", regText)
            Me.lblDanke.Visible = True
            Response.End()
        Else
            Call sendRegEmail("error part 2", regText)
        End If
    End Sub
End Class
