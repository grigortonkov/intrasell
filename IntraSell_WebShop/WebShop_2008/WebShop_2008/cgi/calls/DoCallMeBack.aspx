<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
    <title>Mail Sent!</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">
    <%
        
        'Request("FromName")
        'Request("FromTel")
        'Request("BodyMail")
        'Request ("ToMail")    
        
        Dim mailtext
        mailtext = "Call me back request from:" & Request("FromName") & " Tel:" & Request("FromTel") & _
             "Mail: " & Request("FromMail") & _
             "Mailtext:" & Request("BodyMail")
        If sendMailFromWithSending(Request("ToMail"), "CALL ME BACK", mailtext, Request("FromMail")) Then
    %>
    <h3 align="center">
        <font color="green">The mail was sent successfuly!</font></h3>
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

