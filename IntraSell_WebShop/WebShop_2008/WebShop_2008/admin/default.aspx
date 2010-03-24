<%@  Language="VBScript.Encode" %>
<%'Session ("BASENAME") = "http://" & Request.ServerVariables("SERVER_NAME")  & left(Request.ServerVariables("URL"), len(Request.ServerVariables("URL")) - len("\admin\default.asp"))%>
<!--#include virtual="/intrasoft/connopen.aspx"-->
<!--#include virtual="/intrasoft/functions.aspx"-->
<!--#include virtual="/intrasoft/functionsCache.aspx"-->
<!--#include file="login.aspx"-->
<html>
<head>
    <title>ADMINISTRATOR</title>
    <link rel="stylesheet" href="../style.css" type="text/css">
</head>
<body>
    <h1>
        Welcome to the administration!</h1>
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
