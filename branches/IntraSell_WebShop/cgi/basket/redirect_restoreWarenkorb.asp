
<%

Dim oldWarenkorbSID
oldWarenkorbSID = request ("oldWarenkorbSID")
Response.redirect "../../default.asp?pageToShow=RestoreWarenkorb&oldWarenkorbSID=" & oldWarenkorbSID 

%>