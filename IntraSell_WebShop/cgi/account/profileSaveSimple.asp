<form method="POST" action="default.asp">
  <input type="hidden" name="pageToShow" value="ProfileSaveSimple">
<%  dim new_kdnr_simple: new_kdnr_simple = saveProfileSimple(ACCOUNT)		  
    'response.write "new_kdnr_simple=" & new_kdnr_simple
	if new_kdnr_simple = "" or new_kdnr_simple = "0"   then ' address saving failed /missing data 
%>
  <p align=center><input type="submit" class="button" value="<%=getTranslation("Speichern")%>"></p>
<%
    else 'anmelden
       Session("LOG_IN") = new_kdnr_simple
       
       'send aktivation Email 
       %>
       Sie werden in einige Minuten das Registrierungsemail bekommen! <br>
       Verwenden sie bitte den beigelegten Link um Ihren Account zu aktivieren!
       <%
       
       sendMailFromWithSending getClientEmail(new_kdnr_simple),  _ 
			    "Ihre Registrierung bei " & VARVALUE("DOMAIN") & "!", _
				MAKE_EMAIL_REGISTRATION_SIMPLE(new_kdnr_simple) , _
				VARVALUE("EMAIL_REGISTER")
		'send to webmaster too 
	   sendMailFromWithSending varvalue("EMAIL"),  _ 
			    "Eine neue Registrierung bei " & VARVALUE("DOMAIN") & "!", _
				MAKE_EMAIL_REGISTRATION_SIMPLE(new_kdnr_simple) , _
				VARVALUE("EMAIL_REGISTER")			
		
		if lcase(request("debug")) = "true" then
		   response.Write MAKE_EMAIL_REGISTRATION_SIMPLE(new_kdnr_simple)
		end if 		
		
		'Logout until activate by Email 
		Session("LOG_IN")= ""
	end if 
%>
</form>
