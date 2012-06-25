<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<h1 align="left">
    <%=getTranslation("Ihre Bestellung")%></h1>
<p align="left">
    <%
        If showDebug() Then
            Response.Write("DEFAULT_PAYMODE=" + DEFAULT_PAYMODE)
        End If

        Dim Email As String, Password As String, kdnr As String
        Dim landOfCalculation As String

        payMode = Session("PayMode")
        postMode = Session("postMode")
        destination = Session("destination")
        landOfCalculation = Session("Land")

        Email = Request("EmailOld")
        Password = Request("PasswordOld")

        'check usage of old addresses 
        Dim old_SHIPPING_ID As String = Request("UseOldLI2")
        Dim old_INVOICE_ID As String = Request("UseOldAR2")
        'Response.Write ("UseOld=" &  Request("UseOldLI2"))
        If Request("UseOldLI2") = "" then 
           old_SHIPPING_ID = Request("UseOldLI2")
        End If 

 

        'response.write Email & Password
        'Find Client 
        Dim KundNr As Object = authenticate(Email, Password) 'stops processing on this page if not proper authenitification !!!

        Dim errorsFound As Boolean : errorsFound = False



        'check agb 
        Dim agbAgree : agbAgree = (UCase(Request("agb")) = "ON")
        If Not agbAgree Then
    %>
    <font color="red">
        <%=getTranslation("Sie müssen unsere AGB akzeptieren!")%>
        <a href="javascript:history.back();" _href="default.aspx?pageToShow=warenkorbStep3">
            <%=getTranslation("zur&uuml;ck")%>
            ...</a>!</font>
    <hr>
    <%
        errorsFound = True
    End If


    'check Gesetz if configured for shop
    Dim gesetzAgree As Boolean : gesetzAgree = (UCase(Request("GESETZ")) = "ON")
    If VARVALUE_DEFAULT("SHOP_USER_MUST_ACCEPT_LAW", "TRUE") = "TRUE" Then
        If Not gesetzAgree Then
    %>
    <font color="red">
        <%=getTranslation("Sie müssen das Fernabsatzgesetz lesen und akzeptieren!")%>
        <a href="javascript:history.back();" _href="default.aspx?pageToShow=warenkorbStep3">
            <%=getTranslation("zur&uuml;ck")%>
            ...</a>!</font>
    <hr>
    <%
        errorsFound = True
    End If
End If
If payMode & "" = "" Then
    %>
    <font color="red">
        <%=getTranslation("Ihre Session ist abgelaufen. Bitte erneut die Zahlungskosten kalkulieren!")%></font>
    <br />
    <a href="default.aspx?pageToShow=warenkorbStep1">
        <%=getTranslation("zum Warenkorb Step 1")%></a>
    <hr>
    <%
        errorsFound = True
    End If

    If postMode & "" = "" Then
    %>
    <font color="red">
        <%=getTranslation("Ihre Session ist abgelaufen. Bitte erneut die Versandkosten kalkulieren.")%></font>
    <br />
    <a href="default.aspx?pageToShow=warenkorbStep1">
        <%=getTranslation("zum Warenkorb Step 1")%></a>
    <hr>
    <%
        errorsFound = True
    End If

    If isWarenkorbEmpty(getSID()) Then
    %>
    <font color="red">
        <%=getTranslation("Ihr Warenkorb ist leer!")%></font>
    <hr>
    <%
        errorsFound = True
    End If

    'Response.Write "kdnr" & kdnr
    'Response.Flush
    'Response.Write "getClientDestinationLand(KundNr)=" & getClientDestinationLand(KundNr)
    'Response.End 
    'check if the land is the same like the current session land 
    If landOfCalculation <> getClientDestinationLand(KundNr) Then

        Response.Write("<font color=red>Ihre Landauswahl [" & landOfCalculation & "] ist derzeit nicht korrekt. " & _
                       "<br />Sollte [" & getClientDestinationLand(KundNr) & "] sein. " & _
                       "<br />Es erfolgt eine neue Kalkulation! Danke f&uuml;r Ihr Verst&auml;ndnis!")
        Response.Write("<br /><a href=""default.aspx?pageToShow=warenkorbStep2&L=" & getClientDestinationLand(KundNr) & """> NEU KALKULIEREN</a></font>")
        Response.Write("<hr>")
        errorsFound = True
    End If




    If Not errorsFound Then
        Dim notiz : notiz = Request("notiz")
    
        Dim gutscheinNummerStep4 = Session("gutscheinNummer")
    
        Dim ordId as String = createOrderFromBasket(KundNr, getSID(), payMode, postMode, destination, notiz, gutscheinNummerStep4, "AU", old_SHIPPING_ID, old_INVOICE_ID)
    
        If ordId & "" = "" Then 'Fehler bei der Erstellung 
            Response.Write(getTranslation("Ihre Bestellung konnte nicht angenommen werden."))
    %>
    &nbsp;<a href="javascript:history.back();" _href="default.aspx?pageToShow=warenkorbStep3"><%=getTranslation("zur&uuml;ck")%>
        ...</a>!
    <%
        errorsFound = True
        Response.End()
    End If
    
    
    Dim client_name As String, client_address As String, client_postCode As String, client_email As String
    Dim client_vorname As String
    
    client_name = tablevalue("ofAdressen", "Idnr", KundNr, "Name")
    client_vorname = tablevalue("ofAdressen", "Idnr", KundNr, "Vorname")
    client_address = tablevalue("ofAdressen", "Idnr", KundNr, "Adresse")
    client_postCode = tablevalue("ofAdressen", "Idnr", KundNr, "PLZ")
    client_email = tablevalue("ofAdressen", "Idnr", KundNr, "Email")
     
    Dim OrderAmount : OrderAmount = tablevalue("buchAuftrag", "Nummer", ordId, "SummeBrutto")


    'coints 
    Call addUserPoints(getLOGIN(), COUNT_POINTS_ORDERS, REASON_ORDERS & ", Order# " & ordId)
    'end coins 

    'Remove SID in order to get new one 
    'Session("SID")="" 'remove SID
    'call logOut()
    Session("gutscheinNummer") = "" ' remove used gutschein
    Session("Notiz") = ""
    'createNewSession()
    ObjConnectionExecute("Update webWarenkorb set AuftragNr=" & ordId & " where SID=" & getSID())
    %>
    <p align="left">
        <%=getTranslation("Vielen Dank für Ihren Einkauf.")%>
        <br />
        <%=getTranslation("Ihre Bestellung wurde erfolgreich gespeichert!")%>
        <p align="left">
            <%=getTranslation("In Kuerze erhalten Sie eine Bestaetigung per E-Mail.")%><br />
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
                bordercolor="#111111" width="500" align="center">
                <tr>
                    <td width="33%">
                        <!--
        <input type="button" value="<%=getTranslation("Bestätigung ausdrucken")%>" 
                OnClick="document.location='cgi/account/printPreviewOrder.aspx?nummer=<%=ordID%>&amp;OrderType=<%="AU"%>'"
                style="float: right">
        -->
                        <input type="button" class="button" value="<%=getTranslation("Bestätigung ausdrucken")%>"
                            onclick="window.open('cgi/account/printPreviewOrder.aspx?nummer=<%=ordID%>&amp;OrderType=<%="AU"%>','Invoice','top=100,left=100,height=640,width=800,status=yes,toolbar=yes,menubar=no,location=no');"
                            style="float: right">
                    </td>
                    <td width="33%" align="center">
                        <a href="default.aspx">
                            <input type="button" class="button" value="<%=getTranslation("Home")%>" onclick="document.location='default.aspx';" />
                            <!--<img border="0"  src="<%=imageFullName("home.gif")%>" align="right" hspace="0">
            -->
                        </a>
                    </td>
                    <td width="33%">
                        <a href="cgi/account/logout.aspx">
                            <input type="button" class="button" value="<%=getTranslation("Abmelden")%>" onclick="document.location='cgi/account/logout.aspx';" />
                            <!--<img border="0"  src="<%=imageFullName("logout.gif")%>" align="right" hspace="0">-->
                        </a>
                    </td>
                </tr>
            </table>
            <!-- START FORMS FOR PAYMENT -->
            <%

                If LCase(payMode) = "paypal" Then
                    Response.Write("PayPal " & getTranslation("Zahlungsformular wird gerade gestartet!"))
                    Response.Write(makeForm_PayPal(OrderAmount, ordId, KundNr, client_name, client_vorname, client_address, client_postCode, client_email))
                End If

                If LCase(payMode) = "worldpayment" Then
                    Response.Write("WorldPay " & getTranslation("Zahlungsformular wird gerade gestartet!"))
                    Response.Write(makeForm_WorldPayment(OrderAmount, ordId, KundNr, client_name, client_vorname, client_address, client_postCode, client_email))
                End If

            %>
            <!-- END FORMS FOR PAYMENT -->
            <%End If ' errors found%>
