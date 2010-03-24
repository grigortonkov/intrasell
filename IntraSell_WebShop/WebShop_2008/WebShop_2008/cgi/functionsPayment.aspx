<script language="VB" runat="server">   

    Const IMMOFOX_WP_ACCOUNT = 100874 '75891
    
    '******************************************************************
    ' Function [makeForm_WorldPayment]
    ' Description [Creates the payment form for warenkorb step 4]
    ' Autor: Grigor Tonkov
    ' Changes: 
    '******************************************************************

    Function makeForm_WorldPayment(ByVal amount, ByVal cartId, _
        ByVal name, ByVal adress, ByVal postCode, ByVal email) ' As String

        Dim html 'As String

        html = html & "<form action='https://select.worldpay.com/wcc/purchase' method=POST __target=_new name='Pay'  target='PayResponse'>"
        html = html & "  <input type=hidden name='instId' value='" & IMMOFOX_WP_ACCOUNT & "'> "
        html = html & "  <input type=hidden name='cartId' value='" & cartId & "'> "
        html = html & "  <input type=hidden name='amount' value='" & Replace(amount, ",", ".") & "'> "
        html = html & "  <input type=hidden name='currency' value='EUR'> "
        html = html & "  <input type=hidden name='desc' value='Immobilieninserat'> "
        html = html & "  <input type=hidden name='testMode' value='100'> "
        html = html & "  <input type=hidden name='name' value='" & name & "'> "
        html = html & "  <input type=hidden name='adress' value='" & adress & "'> "
        html = html & "  <input type=hidden name='address' value='" & adress & "'> "
        html = html & "  <input type=hidden name='postcode' value='" & postCode & "'> "
        html = html & "  <input type=hidden name='country' value='AT'> "
        html = html & "  <input type=hidden name='tel' value=''> "
        html = html & "  <input type=hidden name='email' value='" & email & "'> "
        html = html & "  <input type=hidden _type=submit value='bezahlen und aktivieren'> "
        html = html & "</form> "
        'JavaScript for Autosubmit 
        html = html & "<script language=JavaScript>document.forms(""Pay"").submit();</" & "script>"

        makeForm_WorldPayment = html
    End Function
    
    
    Function makeForm_PayPal(ByVal amount, ByVal orderId, ByVal client_name, ByVal adress, ByVal postCode, ByVal email) 'As String

        Dim html : html = "" 'As String
		
        Dim rs
        rs = ObjConnectionexecute("select Bezeichnung, Stk from [buchAuftrag-Artikel] where RechNr=" & orderId)
        Dim item_name : item_name = ""
        Dim item_number : item_number = 0
        While Not rs.EOF
            item_name = item_name + ", " + rs("Bezeichnung")
            item_number = item_number + CInt(rs("Stk"))
            rs.MoveNext()
        End While
	
	
        html = html & "<form action=""https://www.paypal.com/cgi-bin/webscr"" method=""post"" name='Pay' target='PayResponse'>"
        html = html & "  <input type=""hidden"" name=""cmd"" value=""_xclick"">"
        html = html & "  <input type='hidden' name='business' value='" & VARVALUE_DEFAULT("SHOP_PAYPAL_BUSINESS", "office@yourdomain.com") & "'>"
        html = html & "  <input type='hidden' name='item_name' value='" & item_name & "'>"
        html = html & "  <input type='hidden' name='item_number' value='" & item_number & "'>"
        html = html & "  <input type='hidden' name='amount' value='" & amount & "'>"
        html = html & "  <input type='hidden' name='no_shipping' value='1'>"
        html = html & "  <input type='hidden' name='return' value='" & VARVALUE_DEFAULT("DOMAIN", "www.yourdomain.com") & "'>"
        html = html & "  <input type='hidden' name='no_note' value='1'>"
        html = html & "  <input type='hidden' name='currency_code' value='" & VARVALUE_DEFAULT("SHOP_PAYPAL_CURRENCY", "EUR") & "'>"
        html = html & "  <input type='image' src='" & imageFullName("paypal.gif") & "' border='0' name='submit' alt='Zahlen Sie mit PayPal - schnell, kostenlos und sicher!'>"
        html = html & "</form> "
        'JavaScript for Autosubmit 
        html = html & "<script language=JavaScript>document.forms(""Pay"").submit();</" & "script>"

        makeForm_PayPal = html
    
    End Function
        
</script>

