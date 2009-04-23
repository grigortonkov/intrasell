<!--#include file="../defaulthead.inc"-->
<%
'Example: 
'http://test.vegsys.com/cgi/services/createAccountService.asp?Email1=grigor1@vegsys.com&Emailwiederholung1=grigor1@vegsys.com&Passwort1=123123&PasswortII1=123123&Titel1=Mag&Anrede1=Mr.&Name1=Tonkov&Vorname1=grigor&Strasse1=test&PLZ1=123123&Ort1=LA&Tel1=0123123123&Mobil1=01234123123&Fax1=0123123123&Land1=1&debug=true

dim sql 
Session("SID") = "" 'to generate new session on request 
Session("LOG_IN") = ""
'generate new SID 
call createNewSession() 
call getSID() : response.Write "SID=" &  getSID() 

dim showForm: showForm = request("showForm") 'Show Form for Save Again 
if lcase(request("action"))="update" then 
'login first 
     if authenticate(request("Email1"),request("Passwort1")) = "" then 'cannot authentificate
         response.Write "Please provide valid creditentials!" 
     else 
        'the user will be logged in and an update will happen !     
     end if      
end if 


dim new_kdnr:new_kdnr = saveBothAddresses()	
      'response.Write "new_kdnr=" & new_kdnr
      'response.Write "LOG_IN=" & session("LOG_IN")
	  if new_kdnr = "" or new_kdnr = "0"  then ' address saving failed /missing data 
	     if showForm & "" <> "false" then
			 response.Write "Account konnte nicht erstellt werden!"
		 end if 	
	end if 
%>

<!--#include file="../../intrasoft/connclose.asp"-->