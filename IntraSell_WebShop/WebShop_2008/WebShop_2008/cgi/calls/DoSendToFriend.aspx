<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
    <title>Mail Sent!</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">
    <%
        If Request("ToMail") = "" Or Request("Subject") = "" Or Request("FromMail") = "" Then
    %>
    You have to enter all fields!
    <p align="center">
        <input type="button" onclick='window.close()' name="close" value="Close">
    </p>
</html>

<script>
window.setTimeout('window.close();',3000);
</script>

<%
    Response.End()
End If



Dim body : body = MAKE_EMAIL_TELL_A_FRIEND(Request("ProductURL"), Request("BodyMail"))
'if sendMailFromWithSending (Request ("ToMail"), Request ("Subject") , body, Request("FromMail")) then 	 
If sendMailFromWithSending(Request("ToMail"), Request("Subject"), body, Varvalue("Email")) Then
    Call addUserPoints(getLOGIN(), COUNT_POINTS_SEND_TO_FRIEND, REASON_SEND_TO_FRIEND)
    'Response.write (body)
%>
<h3 align="center">
    <font color="green">The mail was sent successfuly!</font></h3>
<p>
    &nbsp;</p>
<%  End If%>
<p align="center">
    <input type="button" onclick='window.close()' name="close" value="Close">
</p>
</html>

<script>
window.setTimeout('window.close();',3000);
</script>

