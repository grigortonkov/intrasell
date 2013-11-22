<!--#include file="menu.aspx"-->
<%
' selects the mailadresses from an table, specified by the query and creates 
' mails to be sent later by sendMailsToSend.asp execute 
%>
<%
Dim SenderEmail as String: SenderEmail = request("SenderEmail")
Dim SQL_RECEIVERS as String: SQL_RECEIVERS = request("SQL_RECEIVERS")
Dim Subject as String: Subject = request("Subject")
Dim Body as String: Body = request("Body")
%>
<html>
	<head>
		<link REL="stylesheet" HREF="../style.css" TYPE="text/css">
			<title>Sending Mails</title>
	</head>
	<body>
		<%
if SenderEmail<>"" and SQL_RECEIVERS<>"" and Subject<>"" and Body <>"" then ' save modus 
 Dim rsEmails = ObjConnection.execute(SQL_RECEIVERS)

 Dim bodySave as String = Body 
 Dim countMails as integer = 0 
 
 while not rsEmails.EOF 
       
        Body  = bodySave 

        'replace special MySQL Chars 
        Body = Body.Replace("'","""")

        'response.write (rsEmails.Fields.Count) 
        'response.end 
        Dim i 
        for i = 1 to 5 
            if rsEmails.Fields.Count > i then 
                if inStr(Body, "Field[" & i & "]") > 0 then 
                    if IsDBNull(rsEmails(i).Value) then 
                        Body = replace (Body, "Field[" & i & "]", "")
                    else 
	                    Body = replace (Body, "Field[" & i & "]", rsEmails(i).Value & "")
                    end if 
                end if 
            end if 
        next 
 
       if Not IsDBNull(rsEmails(0).Value) then 
          countMails = countMails + 1 
         sendMailFrom(rsEmails(0).Value, Subject , Body, SenderEmail)
         Response.Write (".")
       end if 

 		rsEmails.MoveNext 
 end while
 rsEmails.close 
 %>
		Ready! All mails (<%= countMails %>) were created!&nbsp;<br />
		Now you can <a href="sendMailsToSend.aspx">execute</a> sending!
		<%
else 
Dim mailsInDB as String = FIRSTVALUE("select count(*) from mailstosend")
%>
		<form method="POST" action="createMailsToSend.aspx">
			<h1>Email Tool. You have [<%= mailsInDB %>] mails to send.</h1>
			<table border="1" width="47%" height="353">
				<tr>
					<td height="23"  >Sender *</td>
					<td width="66%" height="23"><input type="text" name="SenderEmail" size="30" 
                            value="<%=VARVALUE("EMAIL")%>" style="width: 527px"></td>
				</tr>
				<tr>
					<td height="23"  >Receivers /SQL/ *</td>
					<td width="66%" height="23">
                        <textarea type="text" name="SQL_RECEIVERS" 
                            value="" size="50" style="height: 43px; width: 528px"><%=SQL_RECEIVERS%>
                            </textarea><br />
						(the first column must contain the email adress this mail to be send on)</td>
				</tr>
				<tr>
					<td height="23"  >Subject *</td>
					<td width="66%" height="23"><input type="text" name="Subject" size="50" 
                            style="width: 527px"></td>
				</tr>
				<tr>
					<td width="100%" colspan="2" height="231">Body * <textarea rows="11" name="Body" 
                            style="width: 714px">
Hello Field[2]! 
Your Email is: Field[1].
Best regards!</textarea></td>
				</tr>
				<tr>
					<td width="100%" height="23" colspan="2">
						<p align="center"><input type="submit" value="CREATE EMAIL MESSAGES" name="B1" />
					</td>
				</tr>
			</table>
		</form>
		<p>Help:
		</p>
		<p>1. Write your Email for the Newsletter or Gewinnspiel here.<br/>
			2. Press &quot;Create..&quot;<br/>
			3. Execute &quot;SendMails...&quot; at end until all messages are proceeded by 
			Email server.<br/>
			4. Use Field[1] - Field[5] in your mail as info that comes from the SQL Query!
		</p>
		<%end if'modus write %>
	</body>
</html>
