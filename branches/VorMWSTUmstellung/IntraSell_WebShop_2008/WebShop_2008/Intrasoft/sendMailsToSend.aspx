<!--#include file="menu.aspx"-->  
<%
'Selects the mails from mailsToSend table and sends them over the email server
Dim MAX_COUNT_MAILS_TO_SEND as Integer = VARVALUE_DEFAULT("MAX_COUNT_MAILS_TO_SEND", 500)
Dim MAX_ERRORS_TO_STOP as Integer = VARVALUE_DEFAULT("MAX_ERRORS_TO_STOP", 3)
%>
<html>
<head>
<link REL="stylesheet" HREF="../style.css" TYPE="text/css">
<title>Sending Mails</title>
</head>
<body>
Important: On 3 errors the mail will be deleted.
<h1 align="center">Sending Mails&nbsp;</h1>
<%   
Dim SQLString as String, rs_p
Dim i as Integer
     SQLString = "SELECT id FROM MailsToSend ORDER BY priority, id limit " & MAX_COUNT_MAILS_TO_SEND 
     rs_p = objConnection.Execute(SQLString) 
     IF rs_p.EOF THEN 
     %>
<font color="#FF0000">
     Es gibt nichts mehr zu senden! </font>      
     <%
     
     ELSE    
     %>
     
<table border="1" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#C0C0C0" align="center" width="199"><small>Recipient</small></td>
    <td bgcolor="#C0C0C0" align="center" width="204"><small>Subject</small></td>
    <td bgcolor="#C0C0C0" align="center" width="196"><small>Sender</small></td>
    <td bgcolor="#C0C0C0" align="center" width="16"><small>Prio</small></td>
    <td bgcolor="#C0C0C0" align="center" width="184"><small>Sending</small></td>
  </tr>
</table>

     
     <%
   i = 1
   Dim rsDetail
   Dim mtext as string 
   Dim Recipient, Subject, From_email as String 
   Dim priority as integer
   Dim errosFound as Integer = 0
 	while  i <= MAX_COUNT_MAILS_TO_SEND
 	 i = i + 1 
     'SQLString = "SELECT * FROM MailsToSend ORDER BY priority"
     'Response.write SQL
     rs_p = objConnection.Execute(SQLString) 
     
     if not rs_p.EOF THEN 
      
        id =  rs_p.fields("Id").Value
        rsDetail = objConnection.Execute("select * from MailsToSend  where id = " & id)
 
        mtext = rsDetail.fields("MailText").Value
        Recipient = rsDetail.fields("Recipient").Value
        Subject = rsDetail.fields("Subject").Value
        From_email = rsDetail.fields("From_email").Value
        priority =  rsDetail.fields("PRIORITY").Value

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
    <td width="16" height="1"><%=Priority%>
</td>
    <td width="180">Sending... <%
	   sendMailFromWithSending (Recipient , Subject , mtext, From_email)
	   rs_p.movenext
	   rs_p.close
           rsDetail.close 
	   
  'START ERROR HANDLING
   IF err.number=0 THEN
       Response.write ("OK")
       objConnection.Execute( "DELETE FROM MailsToSend WHERE ID = " & Id)
   else 
       if priority >= 4 then 
           Response.write ("<font color=red>Max errors reached.</font>")
           objConnection.Execute( "DELETE FROM MailsToSend WHERE ID = " & Id)
       else
           Response.write ("<font color=red>Error Description: <b>" & err.Description & "</font></b><br />")
           objConnection.Execute( "UPDATE MailsToSend SET Priority = Priority + 1 WHERE ID = " & Id)
           errosFound = errosFound + 1 
       END IF 'END ERROR HANDLING
   end if 
   
    %>
    </td>
  </tr>
  </table>
   <% 
    END IF 
    Response.Flush()
    
    if errosFound > MAX_ERRORS_TO_STOP then 
      Response.Write ("<br/> Too many errors found. We send no mails more!<br/>")
      Response.End
    end if 
    
 	end while
if i >= MAX_COUNT_MAILS_TO_SEND then 
Response.Write ("<br/>You have more mails to send. Please run again.<br/>")
end if 

END IF ' NO MORE MAILS
%>
</body>
</html>