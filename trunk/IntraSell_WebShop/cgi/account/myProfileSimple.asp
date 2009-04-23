
<!-- ACCOUNT UPDATE-->
<%
if getLOGIN() <> "" then
	if len(request("UPDATE"))>0 then 
	     call saveProfileSimple(ACCOUNT)
	else   
 %>
	<h1>Mein Konto aktualisieren</h1>
	
     <form method="POST" action="default.asp?pageToShow=MyProfileSimple">
	  <input type="hidden" value="UPDATE" name="UPDATE">
		<%call drawEmptyProfileFormSimple(1, true)%>
	    <p align="center"><input type="submit" value="<%=getTranslation("aktualisieren")%>"><br></p>
	</form>
 <%
  end if
  else
      Response.Write getTranslation("Sie sind nicht angemeldet!")
  end if %>
 <!-- ACCOUNT UPDATE-->
 


