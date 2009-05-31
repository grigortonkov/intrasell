<%@ LANGUAGE = VBScript.Encode %>
<%'Session ("BASENAME") = "http://" & Request.ServerVariables("SERVER_NAME")  & left(Request.ServerVariables("URL"), len(Request.ServerVariables("URL")) - len("\admin\default.asp"))%>
<!--#include file="../intrasoft/connopen.asp"--> 
<!--#include file="../intrasoft/functions.asp"--> 
<!--#include file="../intrasoft/functionsCache.asp"--> 
<!--#include file="login.asp"-->   
<html>
<head>
<title>ADMINISTRATOR</title>
<link REL="stylesheet" HREF="../style.css" TYPE="text/css">
</head>  
<body>
<h1>Welcome to the administration!</h1>
<%
if VARVALUE("ADMINPASS")="123" then 'new setup
%>
Sie sind das erste mal hier!?<br>
Herzliche Gratulation für das Erwerben dieses Produkt!<br>
Sie sollten jetzt die <a href="setup/wizzard.asp">Grundeinstellungen vornehmen!</a><br>
Viel Erfolg! 
<%
else 
   response.redirect "lists/listOrders.asp?OrderType=AU"
end if 
%>

</body>
</html>