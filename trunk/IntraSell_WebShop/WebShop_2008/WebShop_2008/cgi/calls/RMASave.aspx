<%@  Language="VBScript.Encode" Transaction="Required" %>
<%OPTION explicit%>
<!--#include file="../../intrasoft/ConnOpen.aspx"-->
<!--#include file="../../intrasoft/functions.aspx"-->
<html>
<head>
    <title>RMA request processing</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">
    <%
dim RMANumber: RMANumber = nextId("ofKorespondenz","ID")

Dim subject, mailtext
subject ="RMA Request #" & RMANumber
mailtext = "RMA Request # " & RMANumber & " From:" & Request("FromName") & " Tel:" & Request("FromTel") & _ 
		   "Mail: " & Request("FromMail")
		   
subject = replace(subject,"""",""):subject = replace(subject,"'","")
mailtext = replace(mailtext,"""",""):mailtext = replace(mailtext,"'","")
		   
dim idnr: idnr = session("Log_IN")	: if trim(idnr) = "" or  (idnr) is nothing then idnr = "0"	   
dim sql 
sql = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & idnr & ",'" & subject & "','" & mailtext  & "')"
'Response.Write sql		   
objConnection.execute(sql)
if  sendMailFromWithSending (Request ("ToMail"), subject, mailtext , Request("FromMail")) then 
    %>
    <h3 align="center">
        <font color="green">The request was sent successfuly!</font></h3>
    <p>
        &nbsp;</p>
    <% end if%>
    <p align="center">
        <input type="button" onclick='window.close()' name="close" value="Close">
    </p>
</html>
