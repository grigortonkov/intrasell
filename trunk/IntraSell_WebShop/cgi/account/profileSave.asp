<%


dim showForm: showForm = request("showForm") 'Show Form for Save Again 
if lcase(request("action"))="update" then 
'login first 
     if authenticate(request("Email1"),request("Passwort1")) = "" then 'cannot authentificate
         response.Write "Please provide valid creditentials!" 
     else 
        'the user will be logged in and an update will happen !     
     end if      
end if 
%>

<form method="POST" action="default.asp">
  <input type="hidden" name="pageToShow" value="ProfileSave">
<%  


dim new_kdnr:new_kdnr = saveBothAddresses()	
      'response.Write "new_kdnr=" & new_kdnr
      'response.Write "LOG_IN=" & session("LOG_IN")
	  if new_kdnr = "" or new_kdnr = "0"  then ' address saving failed /missing data 
	     if showForm & "" <> "false" then
			%>
			<p align=center><input type="submit" value="<%=getTranslation("Speichern")%>"></p>
			<%
		 end if 	
	end if 
%>
</form>
