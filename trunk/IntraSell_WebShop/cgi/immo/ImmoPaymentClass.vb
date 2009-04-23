Public Class ImmoPaymentClass
    Public Const MAX_FREE_INSERATE = 3
    Public Const IMMOFOX_WP_ACCOUNT = 100874 '75891
    Public ConnectionString As String
    Function getCountInserate(ByVal anbieterID As String)
        Dim sql As String = "select count(ArtNr) from grArtikel " & _
        " where herstellerNr=" & anbieterID & _
        " and artnr not in (select artnr from [grArtikel-KeywordsToProducts] where [Value] like 'Suchen')"

        Dim isDB As IntraSellDB = New IntraSellDB
        isDB.objConnection.ConnectionString = ConnectionString
        isDB.objConnection.Open()


        getCountInserate = 0
        Try
            getCountInserate = CInt(isDB.firstValue(sql))
        Catch
        Finally
            isDB.objConnection.Close()
        End Try
    End Function



    Function makeFormForWorldPayment(ByVal amount As Double, ByVal cartId As String, _
     ByVal name As String, ByVal adress As String, ByVal postCode As String, ByVal email As String) As String

        Dim html As String

        html += "<form action='https://select.worldpay.com/wcc/purchase' method=POST __target=_new name=Pay>"
        html += "<input type=hidden name='instId' value='" & IMMOFOX_WP_ACCOUNT & "'> "
        html += "<input type=hidden name='cartId' value='" & cartId & "'> "
        html += "<input type=hidden name='amount' value='" & Replace(amount, ",", ".") & "'> "
        html += "<input type=hidden name='currency' value='EUR'> "
        html += "<input type=hidden name='desc' value='Immobilieninserat'> "
        'html += "<input type=hidden name='testMode' value='100'> "
        html += "<input type=hidden name='name' value='" & name & "'> "
        html += "<input type=hidden name='adress' value='" & adress & "'> "
        html += "<input type=hidden name='address' value='" & adress & "'> "
        html += "<input type=hidden name='postcode' value='" & postCode & "'> "
        html += "<input type=hidden name='country' value='AT'> "
        html += "<input type=hidden name='tel' value=''> "
        html += "<input type=hidden name='email' value='" & email & "'> "
        html += "<input type=hidden _type=submit value='bezahlen und aktivieren'> "
        html += "</form> "
        'JavaScript for Autosubmit 
        html += "<script language=JavaScript>document.forms(""Pay"").submit();</script>"

        makeFormForWorldPayment = html
    End Function



    Function makeFormForPayPal(ByVal amount As Double, ByVal cartId As String, _
     ByVal name As String, ByVal adress As String, ByVal postCode As String, ByVal email As String) As String

        '<form action="https://www.paypal.com/cgi-bin/webscr" method="post">    LINK
        '<input type="hidden" name="cmd" value="_xclick">
        '<input type="hidden" name="business" value="admin@immobilienfox.com">      PAYMENT EMAIL
        '<input type="hidden" name="item_name" value="Immobilienfox.com Services">     NAME OF SERVICE
        '<input type="hidden" name="item_number" value="500100">    ART NR
        '<input type="hidden" name="amount" value="50.00">     AMOUNT IN EUR
        '<input type="hidden" name="no_shipping" value="1">
        '<input type="hidden" name="return" value="http://immobilienfox.com">      URL THAT CUSTOMER SHOULD COME BACK FROM PAYMENT PAGE, IT SHOULD BEE THE INSERAT ANSEHEN
        '<input type="hidden" name="no_note" value="1">
        '<input type="hidden" name="currency_code" value="EUR">
        '<input type="image" src="x-click-but03.gif" border="0" name="submit" alt="Zahlen Sie mit PayPal - schnell, kostenlos und sicher!">
        '</form>


        Dim html As String

        html += "<form action=""https://www.paypal.com/cgi-bin/webscr"" method=""post"" name='Pay'>"
        html += "<input type=""hidden"" name=""cmd"" value=""_xclick"">"
        html += "<input type='hidden' name='business' value='admin@immobilienfox.com'>"
        html += "<input type='hidden' name='item_name' value='Immobilienfox.com Services'>"
        html += "<input type='hidden' name='item_number' value='" & cartId & "'>"
        html += "<input type='hidden' name='amount' value='" & amount & "'>"
        html += "<input type='hidden' name='no_shipping' value='1'>"
        'html += "<input type='hidden' name='return' value='http://immobilienfox.com/default.asp?ArtNr='>"
        html += "<input type='hidden' name='return' value='http://www.immobilienfox.com/cgi/immo/payment/paypal_confirm.aspx?transStatus=Y&cartId=" & cartId & "'>"
        html += "<input type='hidden' name='no_note' value='1'>"
        html += "<input type='hidden' name='currency_code' value='EUR'>"
        html += "<input type='image' src='x-click-but03.gif' border='0' name='submit' alt='Zahlen Sie mit PayPal - schnell, kostenlos und sicher!'>"
        html += "</form> "
        'JavaScript for Autosubmit 
        html += "<script language=JavaScript>document.forms(""Pay"").submit();</script>"

        makeFormForPayPal = html
    End Function


    'Payment Routine:
    'https://www.2checkout.com/2co/buyer/purchase

    'Required Parameters:
    'Required Parameters:
    'sid - your 2checkout vendor account number.
    'total - the total amount to be billed, in decimal form, without a currency symbol.
    'cart_order_id - a unique order id from your program no longer than 64 characters

    'Additional Parameters:
    'demo - Y to enable demo mode only, do not pass in at all to disable demo mode.
    'fixed – Y to remove the Continue Shopping button and lock the quantity fields
    'return_url – used to control where the Continue Shopping button will send the customer when clicked

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

    Function makeFormFor2checkout(ByVal amount As Double, ByVal cartId As String, ByVal productId As String, _
                                  ByVal name As String, ByVal adress As String, ByVal postCode As String, _
                                  ByVal city As String, ByVal email As String) As String

        Dim html As String
        productId = "1"

        amount = System.Math.Round(CDbl(amount))
        html += "<form action=""https://www.2checkout.com/2co/buyer/purchase"" method=""post"" name='Pay'>"
        html += "<input type='hidden' name='sid' value='302927'>"
        'html += "<input type='hidden' name='product_id' value='" & productId & "'>"
        'html += "<input type='hidden' name='quantity' value='" & amount & "'>"
        html += "<input type='hidden' name='total' value='" & amount & "'>"
        html += "<input type='hidden' name='cart_order_id' value='" & cartId & "'>"

        'html += "<input type='hidden' name='demo' value='Y'>"
        html += "<input type='hidden' name='fixed' value='Y'>"
        html += "<input type='hidden' name='return_url' value='http://www.immobilienfox.com'>"

        html += "<input type='hidden' name='card_holder_name' value='" & name & "'>"
        html += "<input type='hidden' name='street_address' value='" & adress & "'>"
        html += "<input type='hidden' name='address city' value='" & city & "'>"
        html += "<input type='hidden' name='city' value='" & city & "'>"
        'html += "<input type='hidden' name='state' value='" & adress & "'>"
        html += "<input type='hidden' name='zip' value='" & postCode & "'>"
        'html += "<input type='hidden' name='country' value='" & adress & "'>"
        html += "<input type='hidden' name='email' value='" & email & "'>"
        'html += "<input type='hidden' name='phone' value='" & adress & "'>"

        html += "<input type='image' src='x-click-but03.gif' border='0' name='submit' alt='Zahlen Sie mit 2checkout - schnell, kostenlos und sicher!'>"
        html += "</form> "
        'JavaScript for Autosubmit 
        html += "<script language=JavaScript>document.forms(""Pay"").submit();</script>"

        makeFormFor2checkout = html
    End Function


    'wird aufgerufen nachdem die bezahlung von PayPal oder WorldPay ankommt 
    Function acceptPayment(ByVal orderId As String, Optional ByVal gutscheinNr As String = "0") As Boolean
        acceptPayment = False
        Dim sql As String = "update buchAuftrag set status='bezahlt', bezahlt=-1 where Nummer=" & orderId
        Dim isDB As IntraSellDB = New IntraSellDB
        isDB.objConnection.ConnectionString = ConnectionString
        isDB.objConnection.Open()
        isDB.execute(sql)

        'set Eigenschaft bezahlt fur alle Artikel = activate inserat 
        Dim cmdNID As Microsoft.Data.Odbc.OdbcCommand
        Dim sqlAllObjects As String = "select ArtNr from [buchAuftrag-Artikel] " & _
                                 " where ArtNr>1000 and RechNr=" & orderId
        cmdNID = New Microsoft.Data.Odbc.OdbcCommand(isDB.prepareSQL(sqlAllObjects))

        HttpContext.Current.Response.Write(sqlAllObjects)

        cmdNID.Connection = isDB.objConnection
        Dim myReader As Microsoft.Data.Odbc.OdbcDataReader = cmdNID.ExecuteReader()

        'all objects from this order 
        While myReader.Read()
            Dim cArtNr = myReader.GetString(0)
            Dim immoObj As ImmoObjektClass = New ImmoObjektClass
            immoObj.objConnection = New Microsoft.Data.Odbc.OdbcConnection(isDB.objConnection.ConnectionString)
            immoObj.objConnection.Open()
            immoObj.ArtNr = cArtNr
            immoObj.writeDebugMessage("Activate Now!")
            immoObj.setAktiv(-1)
            immoObj.setExtras()
            immoObj.addObjektEigenschaft(immoObj.BezahltStatus, immoObj.BezahltStatus_Bezahlt)
            immoObj.objConnection.Close()
            acceptPayment = True
        End While

        myReader.Close()
        cmdNID.Dispose()

        'TODO: Create Rechnung 

        'TODO: decrease Gutschein 
        If gutscheinNr <> "0" Then
            'summe vom Auftrag 
            Dim sqlSumme
            sqlSumme = "SELECT Sum(PreisATS_Brutto) as Summe FROM [buchauftrag-artikel] " & _
                       " Where RechNr = " & orderId
            Dim summe As String = isDB.firstValue(sqlSumme)

            'update Gutschein 
            Dim sqlUpdate : sqlUpdate = "update buchgutschein set Summe = Summe - " & Replace(summe, ",", ".") & _
                            " where Nummer = '" & gutscheinNr & "'"
            isDB.execute(sqlUpdate)
        End If

        isDB.objConnection.Close()
    End Function


    'leifert die aktuele Gutscheinnummer falls eine vorhanden ist 
    'sonst leifert IntraSellDb.NOT_DEFINED 
    Function isGutscheinVorhanden(ByVal orderId As String, ByVal kundNr As String) As String

        Dim sql As String = "SELECT Nummer, KundNr, Datum, Notiz, Summe FROM buchGutschein " & _
                            "WHERE Summe>0 and KundNr= " & kundNr
        Dim isDB As IntraSellDB = New IntraSellDB
        isDB.objConnection.ConnectionString = ConnectionString
        isDB.objConnection.Open()
        isGutscheinVorhanden = isDB.firstValue(sql)
        isDB.objConnection.Close()
        'set Eigenschaft bezahlt fur alle Artik
    End Function

End Class
