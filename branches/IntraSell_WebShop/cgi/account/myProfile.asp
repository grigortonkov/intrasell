
<!-- ACCOUNT -->
<%
'try to get login with help of send password and email 
if request("Email1") <> "" and request("Passwort1") <> "" then 'try Login 
   if authenticate(request("Email1"), request("Passwort1")) = "" then 
        Response.Write getTranslation("Ihre Anmeldedaten sind nicht korrekt!")
        response.End 
   else 'getLogin works now 
   
   end if 
end if 

if getLOGIN() <> "" then
			if len(request("UPDATE"))>0 then 
				call saveBothAddresses ()
			else   
		%>
			<h1>Mein Konto aktualisieren</h1>
			<form method="POST" action="default.asp?pageToShow=MyProfile">
				<input type="hidden" value="UPDATE" name="UPDATE">
				<%call drawProfileForm(true)%>	   	 
				<p align="center"><input type="submit" class="button" value="<%=getTranslation("aktualisieren")%>"><br></p>
			</form>
		<%
		end if
  else
      Response.Write getTranslation("Sie sind nicht angemeldet!")
  end if %>
 <!-- ACCOUNT -->
 


