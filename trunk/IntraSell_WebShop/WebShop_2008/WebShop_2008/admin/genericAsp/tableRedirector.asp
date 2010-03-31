<!--#include virtual="/admin/login.aspx"-->   
<html>
<head>
<title>Table Redirector</title>
</head>
<body>
<% 
Dim rs: RS = Request.QueryString("RS")
if RS ="" THEN %>
<font color="red">Table Name is missing!</font>
<%END IF%>
<%

	' Generic interface to the Northwinds Employee table. 
	Session("dbGenericPath") = "GenericASPFull/"
	Session("dbExitPage") = "http://www.griton.eu"
	Session("dbTitle") = "WMS System"
	'MS Access Connection 
	'Session("dbConn") = "DRIVER={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=d:\daten\bene\design.mdb"
	'MS SQL Connection 
	Session("dbConn") = "driver={SQL Server};server=MATRIX;uid=sa;pwd=vunder;database=WMS"
	Session("dbRs") = RS
	Session("dbKey") = 1
	Session("dbOrder") = 2
	Session("dbDispList") = "111111111111111111"
	Session("dbDispView") = "111111111111111111"
	Session("dbWhere") = ""
	Session("dbDebug") = 0
	Session("dbCanEdit") = 1
	Session("dbCanAdd") = 1
	Session("dbCanDelete") = 1
	Session("dbViewPage") = Request.ServerVariables("PATH_INFO")
	
	Session("dbDebug") = 0
	'Session("dbType") = "SQL" 
	
	Response.Redirect Session("dbGenericPath") & "GenericList.aspx"
%>

</body>
</html>
