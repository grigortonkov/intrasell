Public MustInherit Class WebUserControl_Login
    Inherits System.Web.UI.UserControl
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents OdbcCommand As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.OdbcCommand = New Microsoft.Data.Odbc.OdbcCommand()
        Me.OdbcConn = New Microsoft.Data.Odbc.OdbcConnection()

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

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Dim isDB As FunctionsIntraSell = New FunctionsIntraSell()
        If isDB.authenticate(Me.txtEmail.Text, Me.txtPassword.Text) Then

        End If
    End Sub
End Class
