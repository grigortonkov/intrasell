<!--#include file="../defaulthead.inc"-->
<html>
	<head>
		<title>RMA request processing</title>
		<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
	</head>
	<body bgcolor="#FFFFFF">
		<%
dim RMANumber: RMANumber = nextId("ofKorespondenz","ID")

Dim subject, mailtext
Dim JobDescription

JobDescription = request("JobDescription")

subject = "Request #" & RMANumber
mailtext = " Request # " & RMANumber & CHR(13) & CHR(10) & _  
           " JobDescription: " & JobDescription & CHR(13) & CHR(10) & _  
           " From: " & Request("FromName") & CHR(13) & CHR(10) & _  
           " Tel: " & Request("FromTel") & CHR(13) & CHR(10) & _  
		   " Mail: " & Request("FromMail")
		   
subject = replace(subject,"""",""):subject = replace(subject,"'","")
mailtext = replace(mailtext,"""",""):mailtext = replace(mailtext,"'","")
		   
dim idnr: idnr = getLOGIN()	: if trim(idnr) = "" or isNull(idnr) then idnr = "0"	   
dim sql 
sql = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text], Datum) " & _ 
      "VALUES (" & idnr & ",'" & subject & "','" & mailtext  & "', " & SQLNOW(0) & ")"
'Response.Write sql		   
objConnectionExecute(sql)
Response.Write getTranslation("Ihre Anfrage wurde erfolgreich gespiechert!")
%>

<%
if  sendMailFromWithSending (Request ("ToMail"), subject, mailtext , Request("FromMail")) then 
%>
		<h3 align="center"><font color="green"><%=getTranslation("Eine Emailbenachrichtung wurde ebenfalls gesendet!")%></font></h3>
		<br/>
<% end if%>
		<P align="center">
			<input type="button" onClick='window.close()' name="close" value="Close">
		</P>
</html>
<!--#include file="../../intrasoft/ConnClose.asp"-->
<Script>
window.setTimeout('window.close();',3000);
</Script>
