<form method="POST" action="default.asp">
<input type="hidden" name="pageToShow" value="ProfileSaveSimple">
<%  Dim new_kdnr_simple : new_kdnr_simple = saveProfileSimple(ACCOUNT)
    'response.write "new_kdnr_simple=" & new_kdnr_simple
    If new_kdnr_simple = "" Or new_kdnr_simple = "0" Then ' address saving failed /missing data 
%>
<p align="center">
    <input type="submit" class="button" value="<%=getTranslation("Speichern")%>"></p>
<%
Else 'anmelden
    Session("LOG_IN") = new_kdnr_simple
       
    'send aktivation Email 
%>
Sie werden in einige Minuten das Registrierungsemail bekommen!
<br>
Verwenden sie bitte den beigelegten Link um Ihren Account zu aktivieren!
<%
       
    sendMailFromWithSending(getClientEmail(new_kdnr_simple), _
    "Ihre Registrierung bei " & VARVALUE("DOMAIN") & "!", _
 MAKE_EMAIL_REGISTRATION_SIMPLE(new_kdnr_simple), _
 VARVALUE("EMAIL_REGISTER"))
    'send to webmaster too 
    sendMailFromWithSending(varvalue("EMAIL"), _
       "Eine neue Registrierung bei " & VARVALUE("DOMAIN") & "!", _
    MAKE_EMAIL_REGISTRATION_SIMPLE(new_kdnr_simple), _
    VARVALUE("EMAIL_REGISTER"))
		
    If LCase(Request("debug")) = "true" Then
        Response.Write(MAKE_EMAIL_REGISTRATION_SIMPLE(new_kdnr_simple))
    End If
		
    'Logout until activate by Email 
    Session("LOG_IN") = ""
End If
%>
</form>
