<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
    <title>RMA request processing</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">
    <%
        Dim RMANumber : RMANumber = nextId("ofKorespondenz", "ID")

        Dim subject, mailtext
        Dim JobDescription

        JobDescription = Request("JobDescription")

        subject = "Request #" & RMANumber
        mailtext = " Request # " & RMANumber & Chr(13) & Chr(10) & _
                   " JobDescription: " & JobDescription & Chr(13) & Chr(10) & _
                   " From: " & Request("FromName") & Chr(13) & Chr(10) & _
                   " Tel: " & Request("FromTel") & Chr(13) & Chr(10) & _
             " Mail: " & Request("FromMail")
		   
        subject = Replace(subject, """", "") : subject = Replace(subject, "'", "")
        mailtext = Replace(mailtext, """", "") : mailtext = Replace(mailtext, "'", "")
		   
        Dim idnr : idnr = getLOGIN() : If Trim(idnr) = "" Or (idnr) Is Nothing Then idnr = "0"
        Dim sql
        sql = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text], Datum) " & _
              "VALUES (" & idnr & ",'" & subject & "','" & mailtext & "', " & SQLNOW(0) & ")"
        'Response.Write sql		   
        objConnectionExecute(sql)
        Response.Write(getTranslation("Ihre Anfrage wurde erfolgreich gespiechert!"))
    %>
    <%
        If sendMailFromWithSending(Request("ToMail"), subject, mailtext, Request("FromMail")) Then
    %>
    <h3 align="center">
        <font color="green">
            <%=getTranslation("Eine Emailbenachrichtung wurde ebenfalls gesendet!")%></font></h3>
    <br />
    <% End If%>
    <p align="center">
        <input type="button" onclick='window.close()' name="close" value="Close">
    </p>
</html>
<!--#include file="../../intrasoft/ConnClose.asp"-->

<script>
window.setTimeout('window.close();',3000);
</script>

