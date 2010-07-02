<%
'Selects the mails from mailsToSend table and sends them over the email server
MAX_COUNT_MAILS_TO_SEND = 3000
%>
<html>
<head>
<link REL="stylesheet" HREF="../style.css" TYPE="text/css">
<title>Sending Mails</title>
</head>
<body>
<h1 align="center">Sending Mails&nbsp;</h1>
<%   
Dim SQLString, rs_p
     SQLString = "SELECT * FROM MailsToSend ORDER BY priority limit 3000"
     Set rs_p = objConnection.Execute(SQLString) 
     IF rs_p.EOF THEN 
     %>
<font color="#FF0000">
     Es gibt nichts mehr zu senden ! </font>      
     <%
     
     ELSE    
     %>
     
<table border="1" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#C0C0C0" align="center" width="199">Recipient </td>
    <td bgcolor="#C0C0C0" align="center" width="204"><small>Subject</small></td>
    <td bgcolor="#C0C0C0" align="center" width="196"><small>Sender</small></td>
    <td bgcolor="#C0C0C0" align="center" width="184"><small>Sending</small></td>
  </tr>
</table>

     
     <%
   i = 1
 	while  i <= MAX_COUNT_MAILS_TO_SEND
 	 i = i + 1 
     SQLString = "SELECT * FROM MailsToSend ORDER BY priority limit 1"
    ' Response.write SQL
     Set rs_p = objConnection.Execute(SQLString) 
     
     if not rs_p.EOF THEN 
     		id =  rs_p.fields("Id")
     		mtext = rs_p.fields("MailText") 
     		Recipient = rs_p.fields("Recipient")
     		Subject = rs_p.fields("Subject")
     		From_email = rs_p.fields("From_email")
     		
     		
     		mtext = replace(mtext,"~","'")
     		Subject = replace(Subject,"~","'")  
%>

<table width="100%" border="0" cellspacing="0">
  <tr>
    <td width="196" height="1"><%=Recipient %>
</td>
    <td width="199" height="1"><%=Subject %>
</td>
    <td width="194" height="1"><%=From_email%>
</td>
    <td width="180">Sending... <%
	   sendMailFromWithSending Recipient , Subject , mtext, From_email
	   rs_p.movenext
	   rs_p.close	 
	   
  'START ERROR HANDLING
   IF err.number=0 THEN         
       Response.write "OK" 
   else
   		 response.write "<font color=red>Error Number= #<b>" & err & "</font></b><br>"
   END IF 'END ERROR HANDLING
   
   objConnection.Execute( "DELETE FROM MailsToSend WHERE ID = " & Id)     
    %>
    </td>
  </tr>
  </table>
   <% 
END IF 	  
response.flush
 	WEND
END IF ' NO MORE MAILS
%>
</body>
</html>
