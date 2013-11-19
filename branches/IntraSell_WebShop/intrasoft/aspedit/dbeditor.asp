<%@ Language=VBScript %>
<%Response.buffer=true
Level=1%>
<!--#include File ="includes/check.inc"-->
<HTML>
<HEAD>
		<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
		<title>aspEdit</title>
		<link rel=stylesheet type="text/css" href="styles/style.css">
	</HEAD>


<BODY>
		<div align="center">
			<!--#include File ="includes/banner.inc"-->[<a href="javascript:parent.close()">Close Window (File not saved!)</a>]
<hr></div>
		<%
Path=request.querystring("Path")
Action=request.querystring("Action")
If Action="" then Action="ShowTables"
Path = Server.MapPath(Path)
Set DB=Server.CreateObject("ADODB.Connection")
DB.Open "driver={Microsoft Access Driver (*.mdb)};dbq="&Path
Select Case Action
Case "ShowTables"


End Select

DB.Close
Set DB=Nothing
%>In this Version of aspEdit the Database-Editor isn't fully supported. Visit my <a href="http://saxsucks.go.cc" target="_blank">WebSite</a> for the latest Version.
	</BODY>
</HTML>