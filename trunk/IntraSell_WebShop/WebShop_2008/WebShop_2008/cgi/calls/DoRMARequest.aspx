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
        subject = "RMA Request #" & RMANumber

        mailtext = mailtext + "RMA Request # " & RMANumber & Chr(10) & Chr(13) & "\n"
        mailtext = mailtext + "Bestellnummer: " & Request("Nummer") & Chr(10) & Chr(13) & "\n"
        mailtext = mailtext + "ArtNr: " & Request("ArtNr") & Chr(10) & Chr(13) & "\n"
        mailtext = mailtext + "Ursache: " & Request("Reason") & Chr(10) & Chr(13) & "\n"
        mailtext = mailtext + "From: " & Request("FromName") & Chr(10) & Chr(13) & "\n"
        mailtext = mailtext + "Tel: " & Request("FromTel") & Chr(10) & Chr(13) & "\n"
        mailtext = mailtext + "Mailtext/Notiz: " & Request("FromMail") & Chr(10) & Chr(13) & "\n"

        mailtext = mailtext + "Diese Anforderung finden Sie auch in der Tabelle ofKorrespondenz und Form Korrespondenz."

		   
        subject = Replace(subject, """", "") : subject = Replace(subject, "'", "")
        mailtext = Replace(mailtext, """", "") : mailtext = Replace(mailtext, "'", "")
		   
        Dim idnr : idnr = getLOGIN() : If Trim(idnr) = "" Or (idnr) Is Nothing Then idnr = "0"
        Dim sql
        sql = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text], DAtum) values(" & idnr & ",'" & subject & "','" & mailtext & "', " & SQLNOW(0) & ")"
        'Response.Write sql		   
        objConnectionExecute(sql)
        If sendMailFromWithSending(Request("ToMail"), subject, mailtext, Request("FromMail")) Then
    %>
    <h3 align="center">
        <font color="green">The request was sent successfuly!</font></h3>
    <p>
        &nbsp;</p>
    <% End If%>
    <p align="center">
        <input type="button" onclick='window.close()' name="close" value="Close">
    </p>
</html>

<script>
window.setTimeout('window.close();',3000);
</script>

