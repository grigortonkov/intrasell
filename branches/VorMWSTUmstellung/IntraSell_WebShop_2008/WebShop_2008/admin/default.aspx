<%@ Page AspCompat="true" Language="VB" %>
<%'Session ("BASENAME") = "http://" & Request.ServerVariables("SERVER_NAME")  & left(Request.ServerVariables("URL"), len(Request.ServerVariables("URL")) - len("\admin\default.aspx"))%>
<!--#include virtual="/intrasoft/connopen.aspx"-->
<!--#include virtual="/intrasoft/functions.aspx"-->
<!--#include virtual="/intrasoft/functionsCache.aspx"-->
<!--#include file="login.aspx"-->
<html>
<head>
    <title>IntraSell Administration Pages</title>
    <link rel="stylesheet" href="../style.css" type="text/css">
</head>
<body>
    <h1>
        Welcome to the IntraSell.Net administration pages!</h1>
    <%
    if VARVALUE_DEFAULT("ADMINPASS", "123")="123" then 'new setup
        %>
        Sie sind das erste Mal hier!?<br />
        Herzliche Gratulation für das Erwerben dieses Produkts!<br />
        Sie sollten jetzt die <a href="setup/wizzard.aspx">Grundeinstellungen vornehmen!</a><br />
        Viel Erfolg!
        <%
    else 
       response.redirect ("lists/listOrders.aspx?OrderType=AU")
    end if 
    %>
</body>
</html>
