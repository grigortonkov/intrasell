<!--#include file="../defaulthead.inc"-->
<html>
<head>
<title>Mail Sent!</title>
<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>

<body bgcolor=#FFFFFF>
<%

dim fromMail : fromMail= getClientEmail(getLOGIN())


if fromMail = "" then 
  %>
     You have to login!
     <P align=center>
<input type=button onClick='window.close()' name=close value=Close>
</P>
</html>
			<Script>
			window.setTimeout('window.close();',30000);
			</Script>
  <%
   Response.End 
end if 



dim html , typeToSave, Body

typeToSave  =request("typeToSave")

if lcase(typeToSave)="warenkorb" then 
       html = visualizeWarenkorb("1", Session("LAND"),"", "", "")
else if lcase(typeToSave)="produkt" then 
       html = makeProductPage(request("ArtNR"),"1") 
end if 
end if 



Dim tomail : tomail = "office@griton.eu" 'varvalue("EMAIL")
Dim subject : subject = "Request for help " & typeToSave


body = html 

'Dim body: body = MAKE_EMAIL_TELL_A_FRIEND(request("ProductURL"), Request ("BodyMail"))		 
if sendMailFromWithSending (ToMail, Subject , Body, FromMail) then 
     'call addUserPoints(getLOGIN(), COUNT_POINTS_SEND_TO_FRIEND, REASON_SEND_TO_FRIEND) 
'Response.write (body)
%>
<h3 align=center><font color=green>The mail was sent successfuly!</font></h3>
<P>&nbsp;</p>
<%end if%>
<P align=center>
<input type=button onClick='window.close()' name=close value=Close>
</P>
</html>


<Script>
window.setTimeout('window.close();',30000);
</Script>