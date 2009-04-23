<!--#include file="../defaulthead.inc"-->
<html>

<head>
<title>Mail Sent!</title>
<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>

<body bgcolor=#FFFFFF>
<%
if  sendMailFromWithSending (Request ("ToMail"), "REQUEST ORDER INFO" , Request ("BodyMail"), Request("FromMail")) then 
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