<!--#include virtual="/cgi/defaultHead.inc.aspx"-->
<html>
<head>
    <title>Mail Sent!</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">
    <%
        If sendMailFromWithSending(Request("ToMail"), "REQUEST ORDER INFO", Request("BodyMail"), Request("FromMail")) Then
    %>
    <h3 align="center">
        <font color="green">The mail was sent successfuly!</font></h3>
    <p>
        &nbsp;</p>
    <%End If%>
    <p align="center">
        <input type="button" onclick='window.close()' name="close" value="Close">
    </p>
</html>

<script>
window.setTimeout('window.close();',3000);
</script>

