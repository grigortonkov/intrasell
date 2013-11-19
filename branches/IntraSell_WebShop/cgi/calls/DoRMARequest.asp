<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
<title>RMA request processing</title>
<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>
<body bgcolor=#FFFFFF>
<%
dim RMANumber: RMANumber = nextId("ofKorespondenz", "ID")

Dim subject, mailtext
subject = "RMA Request #" & RMANumber

mailtext = mailtext  + "RMA Request # " & RMANumber  & CHR(10) & CHR(13) & "\n"
mailtext = mailtext  + "Bestellnummer: " & Request("Nummer") & CHR(10) & CHR(13) & "\n"
mailtext = mailtext  + "ArtNr: " & Request("ArtNr") & CHR(10) & CHR(13) & "\n"
mailtext = mailtext  + "Ursache: " & Request("Reason") & CHR(10) & CHR(13) & "\n"
mailtext = mailtext  + "From: " & Request("FromName")  & CHR(10) & CHR(13) & "\n"
mailtext = mailtext  + "Tel: " & Request("FromTel")  & CHR(10) & CHR(13) & "\n"
mailtext = mailtext  + "Mailtext/Notiz: " & Request("FromMail") & CHR(10) & CHR(13) & "\n"

mailtext = mailtext  + "Diese Anforderung finden Sie auch in der Tabelle ofKorrespondenz und Form Korrespondenz."

		   
subject = replace(subject,"""",""):subject = replace(subject,"'","")
mailtext = replace(mailtext,"""",""):mailtext = replace(mailtext,"'","")
		   
dim idnr: idnr = getLOGIN()	: if trim(idnr) = "" or isNull(idnr) then idnr = "0"	   
dim sql 
sql = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text], DAtum) values(" & idnr & ",'" & subject & "','" & mailtext  & "', " & SQLNOW(0) & ")"
'Response.Write sql		   
objConnectionExecute(sql)
if  sendMailFromWithSending (Request ("ToMail"), subject, mailtext , Request("FromMail")) then 
%>
<h3 align=center><font color=green>The request was sent successfuly!</font></h3>
<P>&nbsp;</p>
<% end if%>
<P align=center>
<input type=button onClick='window.close()' name=close value=Close>
</P>
</html>

<Script>
window.setTimeout('window.close();',3000);
</Script>