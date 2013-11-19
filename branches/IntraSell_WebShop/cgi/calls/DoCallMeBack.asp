<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
	<head>
		<title>Mail Sent!</title>
		<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
	</head>
	<body bgcolor="#FFFFFF">
		<%
		
'Request("FromName")
'Request("FromTel")
'Request("BodyMail")
'Request ("ToMail")	
		
Dim mailtext
mailtext = "Call me back request from:" & Request("FromName") & " Tel:" & Request("FromTel") & _ 
		   "Mail: " & Request("FromMail") & _ 
		   "Mailtext:" & Request("BodyMail")
if  sendMailFromWithSending (Request ("ToMail"), "CALL ME BACK" , mailtext , Request("FromMail")) then 
%>
		<h3 align="center"><font color="green">The mail was sent successfuly!</font></h3>
		<P>&nbsp;</P>
		<% end if%>
		<P align="center">
			<input type="button" onClick='window.close()' name="close" value="Close">
		</P>
</html>
<Script>
window.setTimeout('window.close();',3000);
</Script>
