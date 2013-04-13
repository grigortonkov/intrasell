<%@ Language="VBScript" AspCompat="true" %>
<%

Response.buffer=true
Dim Level as Integer = 0

	
Select Case request.querystring("action")
Case "edit"
	Level=3
Case "change"
	Level=3
Case "create"
	Level=3
Case "delete"
	Level=3
Case "dochange"
	Level=3
Case "docreate"
	Level=3
Case "logedit"
	Level=2
Case "logdelete"
	Level=2
Case "logdeleteall"
	Level=2
End Select
%>
<!--#include File ="includes/encryption.inc.aspx"-->
<!--#include File ="includes/check.inc.aspx"-->
<html>
<head>
    <meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
    <title>aspEdit</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
</head>
<body>
    <!--#include File ="includes/banner.inc.aspx"-->
    
    <!--#include File ="includes/db_open.inc.aspx"-->
    <%
DoAction(db, Level)
    %>
</body>
<!--#include File ="includes/db_close.inc.aspx"-->
</html>
