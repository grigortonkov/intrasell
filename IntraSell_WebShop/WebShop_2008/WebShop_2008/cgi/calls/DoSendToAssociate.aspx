<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
    <title>Mail Sent!</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF">
    <%

        Dim fromMail : fromMail = getClientEmail(getLOGIN())


        If fromMail = "" Then
    %>
    You have to login!
    <p align="center">
        <input type="button" onclick='window.close()' name="close" value="Close">
    </p>
</html>

<script>
            window.setTimeout('window.close();',30000);
</script>

<%
    Response.End()
End If



Dim html, typeToSave, Body

typeToSave = Request("typeToSave")

If LCase(typeToSave) = "warenkorb" Then
    html = visualizeWarenkorb("1", Session("LAND"), "", "", "")
ElseIf LCase(typeToSave) = "produkt" Then
    html = makeProductPage(Request("ArtNR"), "1")
End If
end if 



Dim tomail : tomail = "office@griton.eu" 'varvalue("EMAIL")
Dim subject : subject = "Request for help " & typeToSave


Body = html

'Dim body: body = MAKE_EMAIL_TELL_A_FRIEND(request("ProductURL"), Request ("BodyMail"))         
If sendMailFromWithSending(tomail, subject, Body, fromMail) Then
    'call addUserPoints(getLOGIN(), COUNT_POINTS_SEND_TO_FRIEND, REASON_SEND_TO_FRIEND) 
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
window.setTimeout('window.close();',30000);
</script>

