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
		<!--#include File ="includes/banner.inc"-->
<%
Level=""
For x=1 to Session("aspEdit_Level")
	Level=Level & "I"
Next
response.write("You are logged on as <b>" & Session("aspEdit_UserName") & "</b>, your Authentification-Level is <b>" & Level & "</b>.")%>
<br>
		<br>
		<br>
		<br>
		<div align="center">
			<p>[<a href="browser.asp?path=/">Open aspEdit-Browser</a>]<br>
				Opens aspEdit-Browser with the Root-Directory as starting Directory</p>
			<p>[<a href="users.asp?action=logedit">Edit Log</a>]<br>
				Users with Authentification-Level II can view and delete the Log</p>
			<p>[<a href="users.asp?action=edit">Edit User Profiles</a>]<br>
				Users with Authentification-Level III can create/edit/delete User-Accounts</p>
		</div>
	</BODY>
</HTML>