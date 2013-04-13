
Public Class WebForm2
    Inherits System.Web.UI.Page

    Protected WithEvents PanelLoginDialog As System.Web.UI.WebControls.Panel
    Protected WithEvents RequiredFieldValidator1 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents txtUserName As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents Benutzername As System.Web.UI.WebControls.Label
    Protected WithEvents RequiredFieldValidator2 As System.Web.UI.WebControls.RequiredFieldValidator
    Protected WithEvents lblErrorMessage As System.Web.UI.WebControls.Label
    Protected WithEvents OdbcCommand As Microsoft.Data.Odbc.OdbcCommand
    Protected WithEvents OdbcConn As Microsoft.Data.Odbc.OdbcConnection
    Protected WithEvents panelRegisteredArea As System.Web.UI.WebControls.Panel

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
        Me.OdbcConn.ConnectionString = CType(configurationAppSettings.GetValue("Database.MyDNS.MySQL", GetType(System.String)), String)

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

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        If Me.IsValid Then
            Dim sql : sql = "select LieferantNr, username, passwort from priceCompareHaendler where username='" & Me.txtUserName.Text & "' and passwort='" & Me.txtPassword.Text & "'"
            Me.OdbcConn.Open()
            Dim result As DataTable
            Me.OdbcCommand.CommandText = sql
            Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = Me.OdbcCommand.ExecuteReader()

            If myReader.Read() Then
                'Console.WriteLine(myReader.GetString(0))
                Me.panelRegisteredArea.Visible = True
                Me.PanelLoginDialog.Visible = False
                Me.lblErrorMessage.Visible = False
                Session("LieferantNr") = myReader.GetInt64(0)
            Else
                Me.lblErrorMessage.Visible = True


            End If

            Me.OdbcConn.Close()

        End If
    End Sub
End Class
