<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
<title>Mail Sent!</title>
<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>

<body bgcolor=#FFFFFF>
<%
if Request ("ToMail") = "" or Request ("Subject")= "" or Request("FromMail") = "" then 
  %>
     You have to enter all fields!
     <P align=center>
<input type=button onClick='window.close()' name=close value=Close>
</P>
</html>
<Script>
window.setTimeout('window.close();',3000);
</Script>
  <%
   Response.End 
end if 



Dim body: body = MAKE_EMAIL_TELL_A_FRIEND(request("ProductURL"), Request ("BodyMail"))	
'if sendMailFromWithSending (Request ("ToMail"), Request ("Subject") , body, Request("FromMail")) then 	 
if sendMailFromWithSending (Request ("ToMail"), Request ("Subject") , body, Varvalue("Email")) then 
     call addUserPoints(getLOGIN(), COUNT_POINTS_SEND_TO_FRIEND, REASON_SEND_TO_FRIEND) 
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
window.setTimeout('window.close();',3000);
</Script>