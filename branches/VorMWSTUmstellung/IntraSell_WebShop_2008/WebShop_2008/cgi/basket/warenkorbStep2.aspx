<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<!-- WARENKORB -->
<%

    'CHECK AUTHENTIFICATION AND SEND TO STEP 3
    If Request("CHECK_AUTHENTIFICATION") = "YES" Then
        Dim KundNrStep2 As Long 
        KundNrStep2 = authenticate(Request("EmailOld"), Request("PasswordOld")) 'stops processing on this page if not proper authenitification !!!
        If KundNrStep2 <> -1 Then ' OK
            Response.Redirect("default.aspx?pageToShow=warenkorbStep3&EmailOld=" & Request("EmailOld") & "&PasswordOld=" & Replace(Request("PasswordOld"), "#", "RRAAUUTTEE"))
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

%>
<%  Call visualizeWarenkorb("2", Session("LAND"), PayMode, PostMode, Destination)%>
<%
    Dim EmailOld, PasswordOld
    If getLOGIN() > 0 Then
        EmailOld = TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email")
        PasswordOld = TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Passwort")
    End If
%>
<form method="POST" action="default.aspx">
<input type="hidden" name="PageToShow" value="warenkorbStep2">
<input type="hidden" name="CHECK_AUTHENTIFICATION" value="YES">
<p align="right">
    <input type="button" class="button" value="<%=getTranslation("weiter suchen")%>"
        onclick="document.location='default.aspx';">&nbsp;&nbsp;
    <input type="submit" class="button" value="<%=getTranslation("bestellen")%>">
</p>
<%
    'get LOGIN HTML 

    Dim logHTML : logHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_login.htm"))

    'SET tags 
    logHTML = Replace(logHTML, "[USER_PASSWORD]", PasswordOld)
    logHTML = Replace(logHTML, "[USER_EMAIL]", EmailOld)

    logHTML = parseTemplate(logHTML, Nothing)


    Response.Write(logHTML)
%>
</form>
<!-- WARENKORB -->
