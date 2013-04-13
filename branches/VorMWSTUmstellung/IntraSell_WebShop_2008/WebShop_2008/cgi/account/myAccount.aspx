<%
    ' This file provides functiony for:
    ' - Show User Account Page
    ' - Log IN
    ' - ChangePassword
    
    Const BACKTOPAGE_AFTER_LOGIN_ANMELDEN As String = "backToPageAfterLoginOrAnmelden"
    Const BACKTOPAGE_AFTER_ERROR As String = "backToPageAfterError"

    'saves in the session backToPage in order to return to it later
    
    If Request(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) <> "" Then
        Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) = Request(BACKTOPAGE_AFTER_LOGIN_ANMELDEN)
    End If

    'saves in the session backToPage in order to return to it later
    If Request(BACKTOPAGE_AFTER_ERROR) <> "" Then
        Session(BACKTOPAGE_AFTER_ERROR) = Request(BACKTOPAGE_AFTER_ERROR)
    End If

    If Request("CHANGEPASSWD") <> "" Then
        Call ChangeMyPassword()
    End If

    If Request("CHANGEEMAIL") <> "" Then
        Call ChangeEmail()
    End If

    Dim artKatNr As String = Session("CURRENT_ARTKATNR")

    Dim accountLoginPageHTML As String
    Dim accountPageHTML As String
    
    Dim Email As String
    Dim Password As String
    
    Email = cleanUserInput(Request("Email"))
    Password = cleanUserInput(Request("Password"))
    'if not Len(Session("LOG_IN")) then ' user is not lognat

    If getLOGIN() = "" Or LCase(Request("action")) = "login" Then 'try to Log In
        If Len(Request("B1")) > 0 Or LCase(Request("action")) = "login" Then 'Button Login is pressed
            If authenticate(Email, Password) = -1 Then
                'Response.Write "Password/Name is wrong!"
                accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
                Response.Write(accountLoginPageHTML)
           
                If Session(BACKTOPAGE_AFTER_ERROR) <> "" Then 'another page than myAccount.htm is requested after error on login or anmelden 
                    Dim pp : pp = Session(BACKTOPAGE_AFTER_ERROR)
                    Response.Write("Wrong login, we will redirect you to the proper page now!" & pp)
                    Session(BACKTOPAGE_AFTER_ERROR) = "" 'delete the session 
                    Dim backToPage : backToPage = "default.aspx?pageToShow=" & pp
                    'add params 
                    If Request("ArtNr") <> "" Then backToPage = backToPage & "&ArtNr=" & Request("ArtNr")
         
                    Response.Redirect(backToPage)
                End If
            
            End If
        Else
            accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
            accountLoginPageHTML = parseTemplate(accountLoginPageHTML, ArtKatNr)
            accountLoginPageHTML = makeRelLinksAbsolute(accountLoginPageHTML)
            Response.Write(fixRelativeImageLinks(accountLoginPageHTML))
        End If
    End If

 


    If getLOGIN() <> "" Then 'the user gets in his private area

        If Len(Request("B2")) Then 'user info update 
            Call saveBothAddresses(False, False)
        End If
     
        If Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) <> "" Then 'another page than myAccount.htm is requested after login or anmelden 
            Dim p : p = Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN)
            Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) = "" 'delete the session 
            Response.Redirect("default.aspx?pageToShow=" & p & "&ArtNr=" & Request("ArtNr"))
        End If
     
     
     
        'call addUserPoints(getLOGIN(),COUNT_POINTS_ACCOUNT_USAGE,REASON_SEND_ACCOUNT_USAGE)
        'show user page 
        Dim goToPage As String = "skins/skin" & SkinNumber & "/pages/" & "account/myAccount.htm"
     
        'START IMMO: Different Account pages according the branche

        If VARVALUE_DEFAULT("SHOP_USE_BRANCHE_ACCOUNT", "false") = "true" Then
            Dim brSQL : brSQL = "select bezeichnung from ofAdressen a, grBranchen b where a.branche = b.brnr and a.idnr=" & getLOGIN()
            Dim brancheSuffix : brancheSuffix = firstvalue(brSQL)
            If brancheSuffix <> "N.A." Then
                goToPage = "skins/skin" & SkinNumber & "/pages/" & "account/myAccount" & brancheSuffix & ".htm"
            End If
        End If
        'END IMMO
     
        If Not FileExists(Server.MapPath(goToPage)) Then
            Response.Write(getTranslation("Ihre Accountseite existiert nicht!"))
            Response.Write("<br />Fehlende Seite: " & goToPage)
        End If
     
        accountPageHTML = readTextFile(Server.MapPath(goToPage))
        accountPageHTML = makeRelLinksAbsolute(accountPageHTML)
        Response.Write(parseTemplate(parseTemplateUser(accountPageHTML), 0))
%>
<%  If isRefererAllowed(getLOGIN()) Then%>
<!--REFERER MODULE START-->
<table width="100%">
    <tr>
        <td width="75%" align="left" style="" height="1" colspan="3" bgcolor="#cccccc">
            <p align="left">
                für Referer:
            </p>
        </td>
    </tr>
    <tr>
        <td width="36%" align="left" style="" height="1">
            <img border="0" src="<%=imageFullName("arrow.gif")%>" alt="&gt;" />
            <a href="default.aspx?pageToShow=MyReferedSells&amp;orderType=AU">Bestellungen</a>&nbsp;&amp;
            <a href="default.aspx?pageToShow=MyReferedSells&amp;orderType=RE">Verkaeufe </a>
            nach Ihrer Empfehlung
            <br />
            <img border="0" src="<%=imageFullName("arrow.gif")%>" alt="&gt;" />
            <a href="module_ref_ShowMyProducts.aspx?idnr=<%=getLOGIN()%>">Meine sechs Produkte</a>
            <br />
            <img border="0" src="<%=imageFullName("arrow.gif")%>" alt="&gt;" />
            <a href="module_ref_ShowMyProductsAdmin.aspx?idnr=<%=getLOGIN()%>">Meine 6 Produkte (Administration)!</a>
        </td>
    </tr>
</table>
<!--REFERER MODULE END-->
<%  End If%>
<!--#include virtual="/cgi/calls/requestOrderInfo.aspx"-->
<%  End If%>
