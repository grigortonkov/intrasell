<%@ LANGUAGE = VBScript.Encode%>
<%'@ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<!--#include file="../login.asp"-->   
<!--#include file="../../intrasoft/connopen.asp"-->
<!--#include file="../../intrasoft/functions.asp"-->
<!--#include file="../../intrasoft/functionsDictionary.asp"-->
<!--#include file="../../intrasoft/functionsCache.asp"--> 
<!--#include file="../../intrasoft/functionsGUI.asp"--> 
<!--#include file="../../intrasoft/functionsLogs.asp"--> 
<!--#include file="../../cgi/functionsSkins.asp"-->
<!--#include file="../../cgi/functionsPrices.asp"-->
<!--#include file="../../cgi/functionsIntraSell.asp"-->
<!--#include file="../../cgi/functionsOrderInvoice.asp"-->
<!--#include file="../../cgi/functionsOrderInvoicePrintASP.asp"-->
<!--#include file="../../cgi/functionsOrderInvoicePrint.asp"-->
<html>
<head>
	<meta http-equiv="Content-Language" content="de">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
	<title><%=VARVALUE("FIRMA")%></title>
	<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>

<body leftmargin=8 topmargin=8 MARGINWIDTH=8 MARGINHEIGHT=8 link=#000000 vlink=#000000 alink=#000000  bgcolor=#ffffff text=#000000>
<%
'Set as Printed
Dim sql: sql = "Update " & getNameForTable(request("OrderType")) & " Set Ausgedrukt=-1 WHERE Nummer=" & request("nummer")
objConnectionExecute(sql)
'show printing form
call printOrder(request("OrderType"), request("nummer"))%>
</body>
</html>
<!--#include file="../../intrasoft/connclose.asp"-->