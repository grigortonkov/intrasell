<%
    '===========================================================================
    ' Autor: written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<h1 align="left">
    <%=getTranslation("Ihr Angebot")%></h1>
<p align="left">
    <%
        If showDebug() Then
            Response.Write("DEFAULT_PAYMODE=" + DEFAULT_PAYMODE)
        End If

        Dim Email, Password, kdnr
        Dim landOfCalculation

        payMode = Session("PayMode")
        postMode = Session("PostMode")
        destination = Session("Destination")
        landOfCalculation = Session("Land")

        'User is the user set by varvalue SHOP_DEFAULT_USER_FOR_OFFERS
        Dim defaultKundNr As Object : defaultKundNr = VARVALUE_DEFAULT("SHOP_DEFAULT_USER_FOR_OFFERS", "1")
        
        Email = tablevalue("ofAdressen", "Idnr", defaultKundNr, "Email") 'Request("EmailOld")
        Password = tablevalue("ofAdressen", "Idnr", defaultKundNr, "Passwort") 'Request("PasswordOld")


        'response.write Email & Password
        'Find Client 
        Dim KundNr As Object
        KundNr = authenticate(Email, Password) 'stops processing on this page if not proper authenitification !!!

        Dim errorsFound : errorsFound = False

 
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
        <%=getTranslation("Tut uns Leid. Ihr Warenkorb ist leer. Vielleicht ist die web Session abgelaufen.")%></font>
    <hr>
    <%
        errorsFound = True
    End If


    If Not errorsFound Then
        Dim notiz : notiz = Request("notiz")
        Dim gutscheinNummerStep4 : gutscheinNummerStep4 = Session("gutscheinNummer")
    
        Dim ordId : ordId = createOrderFromBasket(KundNr, getSID(), payMode, postMode, destination, notiz, gutscheinNummerStep4, "AN")
    
        If ordId & "" = "" Then 'Fehler bei der Erstellung 
            Response.Write(getTranslation("Ihre Bestellung konnte nicht angenommen werden."))
    %>
    &nbsp;<a href="javascript:history.back();" _href="default.aspx?pageToShow=warenkorbStep1"><%=getTranslation("zur&uuml;ck")%>
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


 
    'Remove SID in order to get new one 
    'Session("SID")="" 'remove SID
    'call logOut()
    Session("gutscheinNummer") = "" ' remove used gutschein
    Session("Notiz") = ""
    'createNewSession()
    ObjConnectionExecute("Update webWarenkorb set AuftragNr=" & ordId & " where SID=" & getSID())
    
    Call logOut()
    
    %>
    <p align="left">
        <%=getTranslation("Vielen Dank für Ihre Anfrage.")%>
        <br />
        <%=getTranslation("Ihre Anfrage wurde erfolgreich gespeichert!")%>
        <p align="left">
            <br />
            <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
                bordercolor="#111111" width="500" align="center">
                <tr>
                    <!--
                    <td width="33%">
                        <input type="button" class="button" value="<%=getTranslation("Bestätigung ausdrucken")%>"
                            onclick="window.open('cgi/account/printPreviewOrder.aspx?nummer=<%=ordID%>&amp;OrderType=<%="AN"%>','Invoice','top=100,left=100,height=640,width=800,status=yes,toolbar=yes,menubar=no,location=no');">
                    </td>
                    -->
                    <td width="33%" align="center">
                        <a href="default.aspx">
                            <input type="button" class="button" value="<%=getTranslation("Home")%>" onclick="document.location='default.aspx';" />
                        </a>
                    </td>
                    <td width="33%">
                        <a href="cgi/account/logout.aspx">
                            <input type="button" class="button" value="<%=getTranslation("Abmelden")%>" onclick="document.location='cgi/account/logout.aspx';" />
                        </a>
                    </td>
                </tr>
            </table>
            <%End If ' errors found%>
