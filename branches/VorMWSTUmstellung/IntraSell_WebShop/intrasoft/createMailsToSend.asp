<!--#include file="menu.asp"-->
<%
' selects the mailadresses from an table, specified by the query and creates 
' mails to be sent later by sendMailsToSend.asp execute 
%>
<%
Dim SenderEmail: SenderEmail = request("SenderEmail")
Dim SQL_RECEIVERS: SQL_RECEIVERS = request("SQL_RECEIVERS")
Dim Subject: Subject = request("Subject")
Dim Body: Body = request("Body")
%>
<html>
	<head>
		<link REL="stylesheet" HREF="../style.css" TYPE="text/css">
			<title>Sending Mails</title>
	</head>
	<body>
		<%
if SenderEmail<>"" and SQL_RECEIVERS<>"" and Subject<>"" and Body <>"" then ' save modus 
 Dim rsEmails: set rsEmails = ObjConnection.execute(SQL_RECEIVERS)
dim bodySave : bodySave = Body 

 while not rsEmails.EOF 
Body  = bodySave 

if inStr(Body, "Field[1]") > 0 then 
	Body = replace (Body, "Field[1]", rsEmails(1) & "")
end if 


if inStr(Body, "Field[2]") > 0 then 
	Body = replace (Body, "Field[2]", rsEmails(2) & "")
end if 


if inStr(Body, "Field[3]") > 0 then 
	Body = replace (Body, "Field[3]", rsEmails(3) & "")
end if 


if inStr(Body, "Field[4]") > 0 then 
	Body = replace (Body, "Field[4]", rsEmails(4) & "")
end if 


if inStr(Body, "Field[5]") > 0 then 
	Body = replace (Body, "Field[5]", rsEmails(5) & "")
end if 

 

       call sendMailFrom(rsEmails(0), Subject , Body, SenderEmail)            
       Response.Write "."
 		rsEmails.MoveNext 
 wend
 rsEmails.close 
 %>
		Ready! All mails were created!&nbsp;<br>
		Now you can <a href="sendMailsToSend.asp">execute</a> sending!
		<%
else 
%>
		<form method="POST" action="createMailsToSend.asp">
			<h1>Email Tool</h1>
			<table border="1" width="47%" height="353">
				<tr>
					<td width="34%" height="23">Sender *</td>
					<td width="66%" height="23"><input type="text" name="SenderEmail" size="30" value="<%=VARVALUE("EMAIL")%>"></td>
				</tr>
				<tr>
					<td width="34%" height="23">Receivers /SQL Syntax/ *</td>
					<td width="66%" height="23"><input type="text" name="SQL_RECEIVERS" value="<%=SQL_RECEIVERS%>" size="50"><br>
						(the first column must contain the email adress this mail to be send on)</td>
				</tr>
				<tr>
					<td width="34%" height="23">Subject *</td>
					<td width="66%" height="23"><input type="text" name="Subject" size="50"></td>
				</tr>
				<tr>
					<td width="100%" colspan="2" height="231">Body * <textarea rows="11" name="Body" cols="80"></textarea></td>
				</tr>
				<tr>
					<td width="100%" height="23" colspan="2">
						<p align="center"><input type="submit" value="CREATE EMAIL MESSAGES" name="B1">
					</td>
				</tr>
			</table>
		</form>
		<p>Help:
		</p>
		<p>1. Write your Email for the Newsletter or Gewinnspiel here.<br>
			2. Press &quot;Create..&quot;<br>
			3. Execute &quot;SendMails...&quot; at end until all messages are proceeded by 
			Email server.
		</p>
		<%end if'modus write %>
	</body>
</html>
