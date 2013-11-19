

Imports Microsoft.Data.Odbc


Public Class world_pay_confirm
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader()
        Me.OdbcConn = New OdbcConnection()
        '
        'OdbcConn
        '
        Me.OdbcConn.ConnectionString = CType(configurationAppSettings.GetValue("OdbcConn.ConnectionString", GetType(System.String)), String)

    End Sub
    Protected WithEvents OdbcConn As OdbcConnection

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region



    'To test this Page: 
    'Visit: http://www.immobilienfox.com/cgi/immo/payment/world_pay_confirm.aspx?transStatus=Y&cartId=200400032
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        Dim isDB As IntraSellDB = New IntraSellDB()
        isDB.objConnection = New Microsoft.Data.Odbc.OdbcConnection(Me.OdbcConn.ConnectionString)
        isDB.objConnection.Open()
        Dim SqlLog As String
        Dim LogLine As String = "WORLD_PAY_"
        Dim k As String
        For Each k In Request.QueryString
            LogLine += k & "=" & Request(k) & ";"
        Next
        For Each k In Request.Form
            LogLine += "Form " & k & "=" & Request(k) & ";"
        Next

        SqlLog = "INSERT INTO paymentLog (LOGLINE) VALUES ('" & LogLine & "')"

        'Response.Write(SqlLog)
        isDB.execute(SqlLog)
        isDB.objConnection.Close()

        Select Case Request("testMode")
            Case "100", "101"
                Response.Write("test")
            Case Else
                Response.Write("live")
        End Select

        Response.Write(" transaction was ")
        Select Case Request("transStatus")
            Case "Y"
                Response.Write("successful.")
                Dim iPay As ImmoPaymentClass = New ImmoPaymentClass()
                iPay.ConnectionString = Me.OdbcConn.ConnectionString
                Response.Write("Payment Acceptment:" & iPay.acceptPayment(Request("cartId")))

            Case "C"
                Response.Write("cancelled.")
            Case Else
                Response.Write(Request("transStatus"))
        End Select
    End Sub

End Class
