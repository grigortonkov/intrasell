<%@ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<%OPTION explicit%>
<!--#include file="../../intrasoft/ConnOpen.asp"-->
<!--#include file="../../intrasoft/functions.asp"-->
<html>
<head>
<title>RMA request processing</title>
<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>
<body bgcolor=#FFFFFF>
<%
dim RMANumber: RMANumber = nextId("ofKorespondenz","ID")

Dim subject, mailtext
subject ="RMA Request #" & RMANumber
mailtext = "RMA Request # " & RMANumber & " From:" & Request("FromName") & " Tel:" & Request("FromTel") & _ 
		   "Mail: " & Request("FromMail")
		   
subject = replace(subject,"""",""):subject = replace(subject,"'","")
mailtext = replace(mailtext,"""",""):mailtext = replace(mailtext,"'","")
		   
dim idnr: idnr = session("Log_IN")	: if trim(idnr) = "" or isNull(idnr) then idnr = "0"	   
dim sql 
sql = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & idnr & ",'" & subject & "','" & mailtext  & "')"
'Response.Write sql		   
objConnection.execute(sql)
if  sendMailFromWithSending (Request ("ToMail"), subject, mailtext , Request("FromMail")) then 
%>
<h3 align=center><font color=green>The request was sent successfuly!</font></h3>
<P>&nbsp;</p>
<% end if%>
<P align=center>
<input type=button onClick='window.close()' name=close value=Close>
</P>
</html>