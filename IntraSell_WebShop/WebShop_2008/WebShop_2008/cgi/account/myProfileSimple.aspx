<!-- ACCOUNT UPDATE-->
<%
    If getLOGIN() <> "" Then
        If Len(Request("UPDATE")) > 0 Then
            Call saveProfileSimple(TypeOfAddress.ACCOUNT)
        Else
%>
<h1>
    Mein Konto aktualisieren</h1>
<form method="POST" action="default.aspx?pageToShow=MyProfileSimple">
<input type="hidden" value="UPDATE" name="UPDATE">
<%  Call drawEmptyProfileFormSimple(1, True)%>
<p align="center">
    <input type="submit" class="button" value="<%=getTranslation("aktualisieren")%>"><br>
</p>
</form>
<%
End If
Else
Response.Write(getTranslation("Sie sind nicht angemeldet!"))
End If%>
<!-- ACCOUNT UPDATE-->
