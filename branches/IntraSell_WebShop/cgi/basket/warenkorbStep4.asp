<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================
%>
<h1 align="left"><%=getTranslation("Ihre Bestellung")%></h1>
<p align="left">
<%
 if debug() then 
   Response.Write "DEFAULT_PAYMODE=" + DEFAULT_PAYMODE
 end if 

Dim Email, Password, kdnr
'Dim landOfCalculation 

 payMode = Session("PayMode") 
 postMode = Session("postMode")
 destination = Session("destination")
 landOfCalculation = Session("Land") 

 Email = request("EmailOld")
 Password = request("PasswordOld")


'response.write Email & Password
'Find Client 
Dim KundNr
KundNr = authenticate(Email, Password)'stops processing on this page if not proper authenitification !!!

'Dim errorsFound: 
errorsFound = false 



'check agb 
dim agbAgree: agbAgree = (ucase(request("agb"))="ON")
if not agbAgree then 
	%>
	<font color="red"><%=getTranslation("Sie müssen unsere AGB akzeptieren!")%> <a href="javascript:history.back();" _href="default.asp?pageToShow=warenkorbStep3"><%=getTranslation("zur&uuml;ck")%> ...</a>!</font>
	<hr>
	<%
	errorsFound = true 
end if 


'check Gesetz if configured for shop
dim gesetzAgree: gesetzAgree =  (ucase(request("GESETZ"))="ON")
if  VARVALUE("SHOP_USER_MUST_ACCEPT_LAW") = "TRUE" then
	if not gesetzAgree then 
		%>
		<font color="red"><%=getTranslation("Sie müssen das Fernabsatzgesetz lesen und akzeptieren!")%> 
		<a href="javascript:history.back();" _href="default.asp?pageToShow=warenkorbStep3"><%=getTranslation("zur&uuml;ck")%> ...</a>!</font>
		<hr>
		<%
		errorsFound = true 
	end if 
end if 
if payMode & "" = "" then 
	%>
	<font color="red"><%=getTranslation("Ihre Session ist abgelaufen. Bitte erneut die Zahlungskosten kalkulieren!")%></font> 
	<br>
	<a href="default.asp?pageToShow=warenkorbStep1"><%=getTranslation("zum Warenkorb Step 1")%></a>
	<hr>
	<%
	errorsFound = true 
end if 

if postMode & "" = "" then 
	%>
	<font color="red"><%=getTranslation("Ihre Session ist abgelaufen. Bitte erneut die Versandkosten kalkulieren.")%></font> 
	<br>
	<a href="default.asp?pageToShow=warenkorbStep1"><%=getTranslation("zum Warenkorb Step 1")%></a>
	<hr>
	<%
	errorsFound = true 
end if

if isWarenkorbEmpty(getSID()) then 
%> <font color="red"><%=getTranslation("Ihr Warenkorb ist leer!")%></font>
<hr>
<%
 errorsFound = true 
end if 

'Response.Write "kdnr" & kdnr
'Response.Flush
'Response.Write "getClientDestinationLand(KundNr)=" & getClientDestinationLand(KundNr)
'Response.End 
'check if the land is the same like the current session land 
if landOfCalculation <> getClientDestinationLand(KundNr) then 

    Response.Write "<font color=red>Ihre Landauswahl [" & landOfCalculation & "] ist derzeit nicht korrekt. " &  _ 
                   "<br>Sollte [" & getClientDestinationLand(KundNr) & "] sein. " & _ 
                   "<br>Es erfolgt eine neue Kalkulation! Danke f&uuml;r Ihr Verst&auml;ndnis!" 
    Response.Write "<br><a href=""default.asp?pageToShow=warenkorbStep2&L=" & getClientDestinationLand(KundNr) & """> NEU KALKULIEREN</a></font>" 
    Response.Write "<hr>"
    errorsFound = true 
end if 




if NOT errorsFound then 
	Dim notiz: notiz = request("notiz")
	
	Dim gutscheinNummerStep4: gutscheinNummerStep4 = session("gutscheinNummer")
	
	Dim ordId: ordID = createOrderFromBasket(KundNr, getSID(), payMode, postMode, destination, Notiz, gutscheinNummerStep4)
    
    if ordID & "" = "" then 'Fehler bei der Erstellung 
      Response.Write getTranslation("Ihre Bestellung konnte nicht angenommen werden.")  
      %>
      &nbsp;<a href="javascript:history.back();" _href="default.asp?pageToShow=warenkorbStep3"><%=getTranslation("zur&uuml;ck")%> ...</a>!
      <%
      errorsFound = true 
      Response.End
    end if 
    
    
    Dim client_name , client_vorname , client_address , client_postCode, client_email
    client_vorname = tablevalue("ofAdressen","Idnr",KundNr,"Vorname") 
    client_name = tablevalue("ofAdressen","Idnr",KundNr,"Name") 
    client_address = tablevalue("ofAdressen","Idnr",KundNr,"Adresse") 
    client_postCode = tablevalue("ofAdressen","Idnr",KundNr,"PLZ") 
    client_email = tablevalue("ofAdressen","Idnr",KundNr,"Email") 
     
    Dim OrderAmount: OrderAmount = tablevalue("buchAuftrag", "Nummer", ordId, "SummeBrutto") 


	'coints 
	call addUserPoints(getLOGIN(), COUNT_POINTS_ORDERS, REASON_ORDERS & ", Order# " & ordId)
	'end coins 

	'Remove SID in order to get new one 
	'Session("SID")="" 'remove SID
	'call logOut()
	Session("gutscheinNummer")="" ' remove used gutschein
	Session("Notiz") = ""
	'createNewSession()
	ObjConnectionExecute("Update webWarenkorb set AuftragNr=" & ordId & " where SID=" &  getSID())
 	%>
	 
	<p align="left">
	<%=getTranslation("Vielen Dank für Ihren Einkauf.")%> 
	<br>
	<%=getTranslation("Ihre Bestellung wurde erfolgreich gespeichert!")%>
	<p align="left">
	<%=getTranslation("In Kuerze erhalten Sie eine Bestaetigung per E-Mail.")%><br/><br/>
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="500" align=center>
		<tr>
		<td width="33%">
		<!--
		<input type="button" value="<%=getTranslation("Bestätigung ausdrucken")%>" 
				OnClick="document.location='cgi/account/printPreviewOrder.asp?nummer=<%=ordID%>&amp;OrderType=<%="AU"%>'"
				style="float: right">
		-->
		<input type="button" class="button" value="<%=getTranslation("Bestätigung ausdrucken")%>" 
			   OnClick="window.open('cgi/account/printPreviewOrder.asp?nummer=<%=ordID%>&amp;OrderType=<%="AU"%>','Invoice','top=100,left=100,height=640,width=800,status=yes,toolbar=yes,menubar=no,location=no');"
			   style="float: right">
						
		</td>
		
		<td width="33%" align=center>
			<a href="default.asp">
			<input type="button" class="button" value="<%=getTranslation("Home")%>" OnClick="document.location='default.asp';" /> 
			<!--<img border="0"  src="<%=imageFullName("home.gif")%>" align="right" hspace="0">
			-->
			</a>		
		</td>
		
		<td width="33%">	 
			<a href="cgi/account/logout.asp">
			<input type="button" class="button" value="<%=getTranslation("Abmelden")%>" OnClick="document.location='cgi/account/logout.asp';" /> 
			<!--<img border="0"  src="<%=imageFullName("logout.gif")%>" align="right" hspace="0">-->
			</a>		
		</td>
		
		</tr>
	</table>
	
<!-- START FORMS FOR PAYMENT -->	
<%

if lcase(payMode) = "paypal" then 
   response.Write "PayPal " & getTranslation("Falls Sie nicht automatisch zu PayPal weitergeleitet werden, klicken Sie bitte auf das PayPal Logo.")
   response.Write makeForm_PayPal(OrderAmount, ordID, client_name, client_vorname, client_address, client_postCode, client_email, KundNr )
end if 

if lcase(payMode) = "worldpayment" then 
   response.Write "WorldPay " & getTranslation("Zahlungsformular wird gerade gestartet!")
   response.Write makeForm_WorldPayment(OrderAmount, ordID, client_name, client_address, client_postCode, client_email)
end if 

%>
<!-- END FORMS FOR PAYMENT -->		

<%end if ' errors found%>