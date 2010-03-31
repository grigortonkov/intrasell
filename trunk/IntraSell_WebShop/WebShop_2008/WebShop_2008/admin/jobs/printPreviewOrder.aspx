<%@  Language="VBScript.Encode" %>
<%'@ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<!--#include file="../login.aspx"-->
<!--#include file="../../intrasoft/connopen.aspx"-->
<!--#include file="../../intrasoft/functions.aspx"-->
<!--#include file="../../intrasoft/functionsDictionary.aspx"-->
<!--#include file="../../intrasoft/functionsCache.aspx"-->
<!--#include file="../../intrasoft/functionsGUI.aspx"-->
<!--#include file="../../intrasoft/functionsLogs.aspx"-->
<!--#include file="../../cgi/functionsSkins.aspx"-->
<!--#include file="../../cgi/functionsPrices.aspx"-->
<!--#include file="../../cgi/functionsIntraSell.aspx"-->
<!--#include file="../../cgi/functionsOrderInvoice.aspx"-->
<!--#include file="../../cgi/functionsOrderInvoicePrintASP.aspx"-->
<!--#include file="../../cgi/functionsOrderInvoicePrint.aspx"-->
<html>
<head>
    <meta http-equiv="Content-Language" content="de">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>
        <%=VARVALUE("FIRMA")%></title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body leftmargin="8" topmargin="8" marginwidth="8" marginheight="8" link="#000000"
    vlink="#000000" alink="#000000" bgcolor="#ffffff" text="#000000">
    <%
'Set as Printed
Dim sql: sql = "Update " & getNameForTable(request("OrderType")) & " Set Ausgedrukt=-1 WHERE Nummer=" & request("nummer")
objConnectionExecute(sql)
'show printing form
call printOrder(request("OrderType"), request("nummer"))%>
</body>
</html>
<!--#include file="../../intrasoft/connclose.aspx"-->
