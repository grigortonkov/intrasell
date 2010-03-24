<%
    If Request("ToMail") = "" Or Request("Subject") = "" Or Request("FromMail") = "" Then
        Response.Write(getTranslation("Sie müssen alle Felder mit * befüllen!"))
    Else
        Dim body : body = MAKE_EMAIL_TELL_A_FRIEND(Request("ProductURL"), Request("BodyMail"))
        If sendMailFromWithSending(Request("ToMail"), Request("Subject"), body, Request("FromMail")) Then
            Call addUserPoints(getLOGIN(), COUNT_POINTS_SEND_TO_FRIEND, REASON_SEND_TO_FRIEND)
            'Response.write (body)
%>
<h3>
    <%=getTranslation("Ihre Nachricht wurde erfolgreich versendet")%>
    Email:
    <%=Request ("ToMail")%></h3>
<%  End If
End If%>
<br>
<br>
<a href="<%=request("ProductURL")%>">
    <%=getTranslation("Zurück zur Produktseite")%></a> 