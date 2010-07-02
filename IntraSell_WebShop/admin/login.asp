<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content="text/html; charset=unicode" http-equiv=Content-Type>
<%
Response.Expires = -1000 'Makes the browser not cache this page
Response.Buffer = True 'Buffers the content so our Response.Redirect will work
'Session("UserLoggedIn") = ""
'User is logged in do not make log check

If NOT Session("UserLoggedIn")="true" THEN
If Request.Form("login") = "true" Then
    CheckLogin
Else
    ShowLogin
End If
END IF

Sub ShowLogin
%>

<form action=default.asp method=post><BODY>
<div align="center">
  <center>
<table width="316" style="BORDER-COLLAPSE: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
<tr>
<td width="152">
<p align="center"><img hspace="0" id="IMG1" src="../company/images/company.gif"></P></TD>
<td width="150">
<p align="center"><br>
<b><font face="Verdana" size="2">Admin 
      Login<br></FONT></B><br>&nbsp;</P></TD></TR>

<tr>
<td width="152">
<font face="Verdana" size="2">User Name : </FONT></TD>
<td width="150">
<input name=username size="25" style="WIDTH: 200px; HEIGHT: 22px"> </TD></TR>

<tr>
<td width="152"><font face="Verdana" size="2">Password : </FONT></TD>
<td width="150">
<input type=password name=userpwd size="25" style="WIDTH: 200px; HEIGHT: 22px"> </TD></TR>
<tr>
<td>
<input type=hidden name=login value=true>
<input type=submit value="Login"></TD></TR></TABLE></CENTER></DIV></FORM>
<center>
<font size=1>
* Wenn Sie das 
erste mal hier sind, verwenden Sie: Name:<b>WebShop</B> und 
Passwort:<b>123</B> </FONT></CENTER>
<%
Response.End
End Sub

Sub CheckLogin
Response.Write  "Check login for " & Request.Form("username") & "|" & Request.Form("userpwd")
If LCase(Request.Form("username")) = Lcase(VARVALUE("ADMIN")) And LCase(Request.Form("userpwd")) = lcase(VARVALUE("ADMINPASS")) Then
    Session("UserLoggedIn") = "true"
    Session("ADMIN")="TRUE" 'used to show "product bearbeiten" in normal shop
    Response.Redirect "default.asp"
Else
    %><font color="#ff0000">Login Failed.</FONT><br>
<% 
    ShowLogin
End If
End Sub
%>
</BODY></HTML>
