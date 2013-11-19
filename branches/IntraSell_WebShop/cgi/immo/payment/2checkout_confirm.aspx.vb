Imports System.Net
Imports System.IO
Imports System.Text
Imports Microsoft.Data.Odbc

Public Class checkout_confirm
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Dim configurationAppSettings As System.Configuration.AppSettingsReader = New System.Configuration.AppSettingsReader
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

    '    Payment Routine:
    'https://www.2checkout.com/2co/buyer/purchase

    'Required Parameters:
    'sid - your 2checkout vendor account number.
    'total - the total amount to be billed, in decimal form, without a currency symbol.
    'cart_order_id - a unique order id from your program no longer than 64 characters

    'Additional Parameters:
    'demo - Y to enable demo mode only, do not pass demo in at all to disable demo mode.

    'To pre populate the billing information page you may pass in:
    'card_holder_name - Card holder's name
    'street_address - Card holder's 
    'address city - Card holder's city 
    'state - Card holder's state 
    'zip - Card holder's zip 
    'country - Card holder's country 
    'email - Card holder's email 
    'phone - Card holder's phone

    'To pre populate the shipping information page you may pass in:
    'ship_street_address 
    'ship_city 
    'ship_state 
    'ship_zip 
    'ship_country

    'Please note that since this parameter set is for third party shopping carts, we normally do not collect shipping information for these kinds of orders. This is because your cart is responsible for calculating the shipping and it is passed in as part of the x_amount parameter. We will present the shipping information page if any of the shipping parameters are passed in. If the shipping information is passed in, we will also pre populate the billing information using that information, thereby over-riding any of the passed in billing parameters.

    'Custom Parameters:
    'You may pass in any additional parameters that you may need and they will be returned to you at the end of the sale. The only restrictions on custom parameters are that they can not be in use by our system already, which includes the other two parameter sets, and they can not begin with 'x_' as the rest of the Authorize.Net parameters do. Please note that you WILL need a return script set up on the Look and Feel page to get any of these parameters back as they are not included in the confirmation emails.

    'You can receive back all of the parameters that were passed in as well as the following parameters:
    'order_number - 2Checkout.com order number
    'cart_id - Your cart ID number passed in.
    'credit_card_processed - Y if successful (Approved), K if waiting for approval (Pending)
    'key – the MD5 hash used to verify that the sale came from one of our servers


    'To test this page 
    ' TODO: this is just the code from PayPal.. please integrate it for pay pal 
    ' http://www.immobilienfox.com/cgi/immo/payment/2checkout_confirm.aspx?order_number=123&cart_id=2004123&credit_card_processed=Y&key=12345
    ' Testsystem: 
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'SAVE FIRST IN LOG FILE 
        Dim isDB As IntraSellDB = New IntraSellDB
        isDB.objConnection = New Microsoft.Data.Odbc.OdbcConnection(Me.OdbcConn.ConnectionString)
        isDB.objConnection.Open()
        Dim SqlLog As String
        Dim LogLine As String = "2checkout_"
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

        Select Case Request("test")
            Case "Y"
                Response.Write("test")
            Case Else
                Response.Write("live")
        End Select

        Response.Write(" transaction was ")
        Select Case Request("credit_card_processed")
            Case "Y"
                Response.Write(" Danke für Ihre Zahlung. Ihre Transaktion wurde abgeschlossen und Sie erhalten " & _
                " per E-Mail eine Quittung für Ihren Kauf. " & _
                " Sie können sich unter http://www.immobilienfox.com in Ihr Konto einloggen, " & _
                " um die Transaktionsdetails anzuzeigen. ")


                Dim iPay As ImmoPaymentClass = New ImmoPaymentClass
                iPay.ConnectionString = Me.OdbcConn.ConnectionString
                Response.Write("Payment Acceptment:" & iPay.acceptPayment(Request("cartId")))

            Case "K"
                Response.Write("pending")
            Case Else
                Response.Write(Request("transStatus"))
        End Select
    End Sub

End Class
