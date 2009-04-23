<%
' This file provides functiony for:
' - Show User Account Page
' - Log IN
' - ChangePassword
Const BACKTOPAGE_AFTER_LOGIN_ANMELDEN = "backToPageAfterLoginOrAnmelden"
Const BACKTOPAGE_AFTER_ERROR = "backToPageAfterError"

'saves in the session backToPage in order to return to it later
If request (BACKTOPAGE_AFTER_LOGIN_ANMELDEN) <> "" then
	Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) = request(BACKTOPAGE_AFTER_LOGIN_ANMELDEN)
end if 

'saves in the session backToPage in order to return to it later
If request (BACKTOPAGE_AFTER_ERROR) <> "" then
	Session(BACKTOPAGE_AFTER_ERROR) = request(BACKTOPAGE_AFTER_ERROR)
end if 

If request ("CHANGEPASSWD") <> "" then
	call changePassword()
End if

If request ("CHANGEEMAIL") <> "" then
	call changeEmail()
End if


Dim accountLoginPageHTML
Dim accountPageHTML

Email = cleanUserInput(request("Email"))
Password = cleanUserInput(request("Password"))
'if not Len(Session("LOG_IN")) then ' user is not lognat

if getLOGIN() = "" or lcase(request("action"))="login" then 'try to Log In
	if Len(request("B1"))>0 or lcase(request("action"))="login"  then 'Button Login is pressed
		if authenticate(Email, Password) = "" then
		    'Response.Write "Password/Name is wrong!"
		    accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
	        Response.Write accountLoginPageHTML
	       
			if Session(BACKTOPAGE_AFTER_ERROR) <> "" then 'another page than myAccount.htm is requested after error on login or anmelden 
				dim pp:pp = Session(BACKTOPAGE_AFTER_ERROR)
				response.Write "Wrong login, we will redirect you to the proper page now!" & pp
				Session(BACKTOPAGE_AFTER_ERROR) = "" 'delete the session 
				dim backToPage : backToPage = "default.asp?pageToShow=" & pp
				'add params 
				if request("ArtNr") <> "" then backToPage = backToPage & "&ArtNr=" & request("ArtNr") 
		 
				response.Redirect backToPage
			end if 
	        
		end if
	else
	        accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
	        accountLoginPageHTML = parseTemplate(accountLoginPageHTML, ArtKatNr)
            Response.Write fixRelativeImageLinks(accountLoginPageHTML)
	end if
end if

 


if getLOGIN() <> "" then 'the user gets in his private area

	if len(request("B2")) then 'user info update 
	  call saveBothAddresses ()
	 end if
	 
	 if Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) <> "" then 'another page than myAccount.htm is requested after login or anmelden 
	     dim p:p = Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN)
	     Session(BACKTOPAGE_AFTER_LOGIN_ANMELDEN) = "" 'delete the session 
	     response.Redirect "default.asp?pageToShow=" & p & "&ArtNr=" & request("ArtNr") 
	 end if 
	 
	 
	 
     'call addUserPoints(getLOGIN(),COUNT_POINTS_ACCOUNT_USAGE,REASON_SEND_ACCOUNT_USAGE)
     'show user page 
     Dim goToPage: goToPage = "skins/skin" & SkinNumber & "/pages/" & "account/myAccount.htm"
     
     'START IMMO: Different Account pages according the branche
     'default ofVars 
     if VARVALUE("SHOP_USE_BRANCHE_ACCOUNT") <> "true" and VARVALUE("SHOP_USE_BRANCHE_ACCOUNT") <> "false" then 
		call SETVARVALUE("SHOP_USE_BRANCHE_ACCOUNT", "false")
	 end if 
	 if VARVALUE("SHOP_USE_BRANCHE_ACCOUNT") = "true" then 
			Dim brSQL: brSQL = "select bezeichnung from ofAdressen a, grBranchen b where a.branche = b.brnr and a.idnr=" & getLOGIN()    
			Dim brancheSuffix: brancheSuffix = firstvalue(brSQL)
				if brancheSuffix <> "N.A." then 
					goToPage = "skins/skin" & SkinNumber & "/pages/" & "account/myAccount" & brancheSuffix & ".htm"
				end if 
     end if 
     'END IMMO
     
	 if not FileExists(Server.MapPath(goToPage)) then 
	    response.Write getTranslation("Ihre Accountseite existiert nicht!") 
	    response.write "<br>Fehlende Seite: " & goToPage
	 end if 
	 
	 accountPageHTML = readTextFile(Server.MapPath(goToPage))
	 Response.Write parseTemplate(parseTemplateUser(accountPageHTML),0)
 %>


 <%if isRefererAllowed(getLOGIN()) then %>
<!--REFERER MODULE START-->  
<table width="100%">
  <tr>
    <td width="75%" align="left" style=""  height="1"   colspan="3" bgcolor="#cccccc">
    <p align="left">fuer Referer ...</p></td>
  </tr>
  <tr>
    <td width="36%" align="left" style=""  height="1">
    <img border=0 src="<%=imageFullName("arrow.gif")%>" alt="&gt;" />
    <a href="default.asp?pageToShow=MyReferedSells&amp;orderType=AU">Bestellungen</a>&nbsp;&amp;
    <a href="default.asp?pageToShow=MyReferedSells&amp;orderType=RE"> Verkaeufe </a>nach Ihrer Empfehlung
    <br><img border=0 src="<%=imageFullName("arrow.gif")%>" alt="&gt;" /> <a href="module_ref_ShowMyProducts.asp?idnr=<%=getLOGIN()%>">new Meine sechs Produkte</a> 
    <br><img border=0 src="<%=imageFullName("arrow.gif")%>" alt="&gt;" /> <a href="module_ref_ShowMyProductsAdmin.asp?idnr=<%=getLOGIN()%>">new Meine sechs Produkte (Administration)!</a> </td>
  </tr>
</table>
<!--REFERER MODULE END-->    
<%end if %>

<!--#include file="../calls/requestOrderInfo.asp"-->
<%end if %>
