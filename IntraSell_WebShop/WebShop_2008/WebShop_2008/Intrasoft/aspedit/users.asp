<%@ Language=VBScript %>
<%Response.buffer=true
Level=0
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
<!--#include File ="includes/check.inc"-->
<HTML>
<HEAD>
		<meta http-equiv="content-type" content="text/html;charset=iso-8859-1">
		<title>aspEdit</title>
		<link rel=stylesheet type="text/css" href="styles/style.css">
	</HEAD>
<BODY>
		
			<!--#include File ="includes/banner.inc"--><!--#include File ="includes/encryption.inc"--><!--#include File ="includes/db_open.inc"--><%
Select Case request.querystring("action")
Case "logedit"
	response.write("<div align='center'>[<a href='users.asp?action=logdeleteall'>Delete all</a>]<br><br>	<table border='0' cellpadding='0' cellspacing='0'><tr><td colspan='3' bgcolor='#31618c'><div align='center'><b><font color='white'>Log</font></b></div></td></tr><tr><td width='200' bgcolor='#31618c'><div align='center'><b><font size='-2'>UserName</font></b></div></td><td width='200' bgcolor='#31618c'><div align='center'><font size='-2'><b>Date</b></font></div></td><td bgcolor='#31618c'></td></tr>")
	Set rs1=db.execute("SELECT * FROM [user] INNER JOIN log ON user.UserID = log.UserID;")
	Do While not rs1.EOF
		response.write("<tr><td width='200'>" & DeCode(rs1.fields("UserName")) & "</td><td width='200'>" & rs1.fields("LogOnDate") & "</td><td><div align='right'><font size='-2'>[<a href='users.asp?action=logdelete&logid=" & rs1.fields("LogID") & "'>delete</a>]</font></div></td></tr>")
		rs1.movenext
	Loop
	response.write("</table></div>")
Case "logdelete"
	If request.querystring("logid")<>"" then
		db.Execute("DELETE * FROM [log] WHERE (((log.logID)=" & request.querystring("logid") & "));")
		response.write("The specified data of the log has been deleted.<br><br><br>Click <a href=users.asp?action=logedit>here</a> to proceed.")
	Else
		response.write("An error occurred: A needed parameter has not been specified.<br><br><br>Click <a href=users.asp?action=logedit>here</a> to proceed.")
	End if
Case "logdeleteall"
		db.Execute("DELETE * FROM [log];")
		response.write("The log has been cleared.<br><br><br>Click <a href=users.asp?action=logedit>here</a> to proceed.")
Case "logon"
	response.write("<div align='center'><form action='users.asp?action=dologon' method='post'><table border='0' cellpadding='0' cellspacing='1'><tr><td colspan='2' bgcolor='#31618c'><div align='center'><b><font color='white'>LogOn to aspEdit </font></b></div></td></tr><tr><td bgcolor='#31618c' width='75'><b><font size='-2'>UserName:</font></b></td><td><div align='right'><input type='text' name='UserName' size='24'></div></td></tr><tr><td bgcolor='#31618c' width='75'><b><font size='-2'>Password:</font></b></td><td><div align='right'><input type='password' name='password' size='24'></div></td></tr></table><input type='submit' name='submitButtonName' value='LogOn...'></form></div>")
Case "dologon"
	UserName=Encode(request.form("UserName"))
	Password=Encode(request.form("Password"))
	Error=""
	If UserName="" then Error = Error & "<li>No UserName entered."
	If Password="" then Error = Error & "<li>No Password entered."
	Set rs1=db.Execute("SELECT * FROM user WHERE user.UserName='" & UserName & "' AND user.Password='" & Password & "';")
	If UserName<>"" AND Password<>"" AND rs1.EOF=true then Error = Error & "<li>Wrong UserName and/or Password."
	If Error<>"" then response.write("<div align='left'>The following error(s) occured:<ul>" & Error & "</ul></div><br><br>Click <a href='javascript:history.back()'>here</a> to try again.")
	If Error="" then
		Session("aspEdit_UserName")=DeCode(UserName)
		Session("aspEdit_Level")=rs1.fields("Level")
		'db.Execute("INSERT INTO log(UserID,LogOnDate) VALUES (" & rs1.fields("UserID") & ",'" & now & "');")
		response.write("<br>You succesfully logged on.<br><br><br>Click <a href='aspedit.asp'>here</a> to proceed.")
	end if
	rs1.Close
	Set rs1=Nothing
Case "level"
	response.write("You tried to enter a section with a higher Security-Level than yours. You can not enter that section with your current Authentification-Level.<br><br><br>Click <a href='aspedit.asp'>here</a> to proceed or <a href='users.asp?action=logon'>here</a> to logon with another UserName.")
Case "edit"
	response.write("<div align='center'>[<a href='users.asp?action=create'>Create new User</a>]<br><br><table border='0' cellpadding='0' cellspacing='0'><tr><td colspan='4' bgcolor='#31618c'><div align='center'><b><font color='white'>User-Accounts:</font></b></div></td></tr><tr><td width='200' bgcolor='#31618c'><div align='center'><font size='-2'><b>UserName</b></font></div></td><td width='200' bgcolor='#31618c'><div align='center'><font size='-2'><b>Password</b></font></div></td><td width='150' bgcolor='#31618c'><div align='center'><font size='-2'><b>Authentification-Level</b></font></div></td><td width='70' bgcolor='#31618c'></td></tr>")
	set rs1=db.Execute("SELECT * FROM user")
	Do While Not rs1.EOF
		response.write("<tr><td width='200'>" & DeCode(rs1.fields("UserName")) & "</td><td width='200'>" & DeCode(rs1.fields("Password")) & "</td><td width='150'><div align='center'>")
		Level=""
		For x=1 to rs1.fields("Level")
			Level=Level & "I"
		Next
		response.write(Level & "</div></td><td width='70'><div align='right'><font size='-2'>[<a href='users.asp?action=change&userid=" & rs1.fields("UserID") & "'>edit</a>][<a href='users.asp?action=delete&userid=" & rs1.fields("UserID") & "'>delete</a>]</font></div></td></tr>")
		rs1.MoveNext
	Loop
	rs1.Close
	Set rs1=Nothing
	response.write("</table></div>")
Case "delete"
	If request.querystring("userid")<>"" then
		db.Execute("DELETE * FROM [user] WHERE (((user.UserID)=" & request.querystring("userid") & "));")
		response.write("User has been deleted.<br><br><br>Click <a href=users.asp?action=edit>here</a> to proceed.")
	Else
		response.write("An error occurred: A needed parameter has not been specified.<br><br><br>Click <a href=users.asp?action=edit>here</a> to proceed.")
	End if
Case "create"
	response.write("<div align='center'><form name='FormName' action='users.asp?action=docreate' method='post'><table border='0' cellpadding='0' cellspacing='1'><tr><td colspan='2' bgcolor='#31618c'><div align='center'><b><font color='white'>New User</font></b></div></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>UserName:</b></font></td><td><input type='text' name='UserName' size='24'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Password:</b></font></td><td><input type='text' name='Password' size='24'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Authentification-Level:</b></font></td><td><input type='radio' value='1' name='Level' checked>I<br><input type='radio' value='2' name='Level'>II<br><input type='radio' value='3' name='Level'>III</td></tr></table><input type='submit' name='submitButtonName' value='Create new User...'></form></div>")
Case "docreate"
	UserName=Encode(request.form("UserName"))
	Password=Encode(request.form("Password"))
	Level=int(request.form("Level"))
	If UserName="" then Error = Error & "<li>No UserName entered."
	If Password="" then Error = Error & "<li>No Password entered."
	Set rs1=db.Execute("SELECT * FROM user WHERE user.UserName='" & UserName & "';")
	If UserName<>"" AND Password<>"" AND rs1.EOF<>true then Error = Error & "<li>UserName already exists."
	If Error<>"" then response.write("<div align='left'>The following error(s) occured:<ul>" & Error & "</ul></div><br><br>Click <a href='javascript:history.back()'>here</a> to try again.")
	If Error="" then
		db.Execute("INSERT INTO [user]([UserName],[Password],[Level]) VALUES ('" & UserName & "','" & Password & "'," & Level & ");")
		response.write("New User successfully created.<br><br><br>Click <a href='users.asp?action=edit'>here</a> to proceed.")
	end if
	rs1.Close
	Set rs1=Nothing
Case "change"
	Set rs1=db.Execute("SELECT * FROM user WHERE user.userid=" & request.querystring("userid") & ";")
	response.write("<div align='center'><form name='FormName' action='users.asp?action=dochange&userid=" & rs1.fields("UserID") & "' method='post'><table border='0' cellpadding='0' cellspacing='1'><tr><td colspan='2' bgcolor='#31618c'><div align='center'><b><font color='white'>Edit User</font></b></div></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>UserName:</b></font></td><td><input type='text' name='UserName' size='24' value='" & DeCode(rs1.fields("UserName")) & "'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Password:</b></font></td><td><input type='text' name='Password' size='24'value='" & DeCode(rs1.fields("Password")) & "'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Authentification-Level:</b></font></td><td><input type='radio' value='1' name='Level'")
	If rs1.fields("Level")=1 then response.write("checked")
	response.write(">I<br><input type='radio' value='2' name='Level'")
	If rs1.fields("Level")=2 then response.write("checked")
	response.write(">II<br><input type='radio' value='3' name='Level'")
	If rs1.fields("Level")=3 then response.write("checked")
	response.write(">III</td></tr></table><input type='submit' name='submitButtonName' value='Save Changes...'><input type='reset' name='resetButtonName' value='ReSet...'></form></div>")
Case "dochange"
	If request.querystring("userid")<>"" then
		UserName=Encode(request.form("UserName"))
		Password=Encode(request.form("Password"))
		Level=int(request.form("Level"))
		If UserName="" then Error = Error & "<li>No UserName entered."
		If Password="" then Error = Error & "<li>No Password entered."
		If Error<>"" then response.write("<div align='left'>The following error(s) occured:<ul>" & Error & "</ul></div><br><br>Click <a href='javascript:history.back()'>here</a> to try again.")
		If Error="" then
			db.Execute("UPDATE [user] SET [user].UserName = '" & UserName & "', [user].[Password] = '" & Password & "', [user].[Level] = " & Level & " WHERE (((user.UserID)=" & request.querystring("userid") & "));")
			response.write("Changes successfully saved.<br><br><br>Click <a href='users.asp?action=edit'>here</a> to proceed.")
		end if
		else
			response.write("An error occurred: A needed parameter has not been specified.<br><br><br>Click <a href=users.asp?action=edit>here</a> to proceed.")
		End if
End Select%>
	</BODY><!--#include File ="includes/db_close.inc"-->
</HTML>