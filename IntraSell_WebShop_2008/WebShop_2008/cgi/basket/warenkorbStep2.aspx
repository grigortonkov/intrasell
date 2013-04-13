<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<!-- WARENKORB STEP 2-->
<%
    Dim SHOP_ALLOW_CHANGE_AR_ADDRESS As Boolean = VARVALUE_DEFAULT("SHOP_ALLOW_CHANGE_AR_ADDRESS", "true")
    Dim SHOP_ALLOW_CREATE_NEW_AR_ADDRESS As Boolean = VARVALUE_DEFAULT("SHOP_ALLOW_CREATE_NEW_AR_ADDRESS", "true")
    Dim SHOP_ALLOW_SELECT_OLD_AR_ADDRESS As Boolean = VARVALUE_DEFAULT("SHOP_ALLOW_SELECT_OLD_AR_ADDRESS", "true")

    
    'CHECK AUTHENTIFICATION AND SEND TO STEP 3
    If Request("CHECK_AUTHENTIFICATION") = "YES" Then
        Dim KundNrStep2 As Long
        KundNrStep2 = authenticate(Request("EmailOld"), Request("PasswordOld")) 'stops processing on this page if not proper authenitification !!!
        If KundNrStep2 <> -1 Then ' OK
            Session("EmailOld") = Request("EmailOld")
            Session("PasswordOld") =  Request("PasswordOld")
            ' Response.Redirect("default.aspx?pageToShow=warenkorbStep3&EmailOld=" & Request("EmailOld") & "&PasswordOld=" & Replace(Request("PasswordOld"), "#", "RRAAUUTTEE"))
        Else
            Response.Write(getTranslation("Ihre Angaben sind nicht korrekt!"))
        End If

    End If
    'END CHECK 


    payMode = Request("PayMode")
    If payMode = "" Then payMode = Session("payMode")
    If payMode = "" Then payMode = DEFAULT_PAYMODE
    Session("payMode") = payMode

    postMode = Request("postMode")
    If postMode = "" Then postMode = Session("postMode")
    If postMode = "" Then postMode = DEFAULT_POSTMODE
    Session("postMode") = postMode

    destination = Request("destination")
    If destination = "" Then destination = Session("destination")
    If destination = "" Then destination = DEFAULT_POSTMODE_DESTINATION
    Session("destination") = destination


    Dim ccNr, CCDat
    ccNr = Request("ccNR")
    CCDat = Request("ccDat")

    If Request("notiz") <> "" Then Session("notiz") = Request("notiz")
 
    Call visualizeWarenkorb("2", Session("LAND"), PayMode, PostMode, Destination)
    Dim EmailOld, PasswordOld
    If getLOGIN() > 0 Then
        EmailOld = TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email")
        PasswordOld = TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Passwort")
    End If
%>
<br />

<form action="default.aspx" method=post>


<%
    'get LOGIN HTML 
    If getLOGIN() <= 0 Then 'Noch nicht angemeldet 
        Dim loginHTML As String = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_login.htm"))
        'SET tags 
        loginHTML = Replace(loginHTML, "[USER_PASSWORD]", PasswordOld)
        loginHTML = Replace(loginHTML, "[USER_EMAIL]", EmailOld)
        loginHTML = parseTemplate(loginHTML, Nothing)
        Response.Write(loginHTML)
    %>
<input type="hidden" name="PageToShow" value="warenkorbStep2" />
<input type="hidden" name="CHECK_AUTHENTIFICATION" value="YES" />
    <%
    Else 'Bereits angemeldet 
        
        Dim KundNrStep3 As String = getLOGIN()
%>

<input type="hidden" name="PageToShow" value="warenkorbStep3" /> 
<div align="center">
    <center>
        <table border="1" width="550" bordercolor="#CCCCCC" style="border-collapse: collapse"
            cellpadding="5" cellspacing="0">
            <tr>
                <td width="50%" align="center" bgcolor="#F3F3F3">
                    <%=getTranslation("Aktuelle Lieferadresse")%>
                </td>
                <td width="50%" align="center" bgcolor="#F3F3F3">
                    <%=getTranslation("Aktuelle Rechnungsadresse")%>
                </td>
            </tr>
            <tr>
                <td width="50%" align="left">
                    <%=printAddress(KundNrStep3,"LI",TRUE, False)%>
                </td>
                <td width="50%" align="left">
                    <%=printAddress(KundNrStep3,"AR",TRUE, False)%>
                </td>
            </tr>
            <tr>
                <td width="50%" colspan="1">
                    <p align="center">
                        <a href="default.aspx?pageToShow=createUpdateAddressSpecial&typeOfAddress=LI&mode=update"
                            class='button'>
                            <%=getTranslation("Adresse aendern")%>
                        </a>&nbsp; <a href="default.aspx?pageToShow=createUpdateAddressSpecial&typeOfAddress=LI&mode=new"
                            class='button'>
                            <%=getTranslation("neue Adresse anlegen")%>
                        </a>
                    </p>
                </td>
                <td width="50%" colspan="1">
                    <p align="center">
                        <% If SHOP_ALLOW_CHANGE_AR_ADDRESS Then%>
                        <a href="default.aspx?pageToShow=createUpdateAddressSpecial&typeOfAddress=AR&mode=update"
                            class='button'>
                            <%=getTranslation("Adresse aendern")%>
                        </a>
                        <% End If%>
                        &nbsp;
                        <% If SHOP_ALLOW_CREATE_NEW_AR_ADDRESS Then%>
                        <a href="default.aspx?pageToShow=createUpdateAddressSpecial&typeOfAddress=AR&mode=new"
                            class='button'>
                            <%=getTranslation("neu Adresse anlegen")%>
                        </a>
                        <% End If%>
                    </p>
                </td>
            </tr>
            <tr>
                <td width="50%" align="left">
                    <%=printAddress(KundNrStep3, TypeOfAddress.SHIPPING2, True, True, True)%>
                </td>
                <td width="50%" align="left">
                    <% If SHOP_ALLOW_SELECT_OLD_AR_ADDRESS Then%>
                    <%=printAddress(KundNrStep3, TypeOfAddress.INVOICE2, True, True, True)%>
                    <% End If%>
                </td>
            </tr>
        </table>
    </center>
</div>
<br />

<p align="right">
    <input type="button" class="button" value="<%=getTranslation("weiter suchen")%>" onclick="document.location='default.aspx';">&nbsp;
    <input type="submit" class="button" value="<%=getTranslation("bestellen")%>">
</p>

<%End If 'User is Logged in %>
</form>
<!-- WARENKORB -->
