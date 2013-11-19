Imports System.Net
Imports System.IO
Imports System.Text
Imports Microsoft.Data.Odbc
Public Class paypal_confirm
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
        Me.OdbcConn = New odbcConnection()
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

    'To test this page 
    ' TODO: this is just the code from PayPal.. please integrate it for pay pal 
    ' http://www.immobilienfox.com/cgi/immo/payment/paypal_confirm.aspx?transStatus=Y&cartId=200400032
    ' Testsystem: 
    ' http://www.immobilienfox.com:81/cgi/immo/payment/paypal_confirm.aspx?transStatus=Y&cartId=200400041
        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            'Put user code to initialize the page here
            Dim isDB As IntraSellDB = New IntraSellDB
            isDB.objConnection = New Microsoft.Data.Odbc.OdbcConnection(Me.OdbcConn.ConnectionString)
            isDB.objConnection.Open()
            Dim SqlLog As String
        Dim LogLine As String = "PAYPAL_"
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



        'PAYPAL
        If False Then
            Dim strFormValues As String = Request.Form.ToString()
            Dim strNewValue, strResponse

            ' Create the request back
            Dim req As HttpWebRequest = CType(WebRequest.Create("https://www.paypal.com/cgi-bin/webscr"), HttpWebRequest)

            ' Set values for the request back
            req.Method = "POST"
            req.ContentType = "application/x-www-form-urlencoded"
            strNewValue = strFormValues + "&cmd=_notify-validate"
            req.ContentLength = strNewValue.Length

            ' Write the request back IPN strings
            Dim stOut As StreamWriter = New StreamWriter(req.GetRequestStream(), Encoding.ASCII)
            stOut.Write(strNewValue)
            stOut.Close()
        End If
        'PAYPAL 

        Select Case Request("testMode")
            Case "100", "101"
                Response.Write("test")
            Case Else
                Response.Write("live")
        End Select

        Response.Write(" transaction was ")
        Select Case Request("transStatus")
            Case "Y"
                Response.Write(" Danke für Ihre Zahlung. Ihre Transaktion wurde abgeschlossen und Sie erhalten " & _
                " per E-Mail eine Quittung für Ihren Kauf. " & _
                " Sie können sich unter www.paypal.de in Ihr Konto einloggen, " & _
                " um die Transaktionsdetails anzuzeigen. ")

                'Response.Write("successful.")

                Dim iPay As ImmoPaymentClass = New ImmoPaymentClass
                iPay.ConnectionString = Me.OdbcConn.ConnectionString
                Response.Write("Payment Acceptment:" & iPay.acceptPayment(Request("cartId")))

            Case "C"
                Response.Write("cancelled.")
            Case Else
                Response.Write(Request("transStatus"))
        End Select
        End Sub

    End Class
