<!-- ACCOUNT -->
<%
    'try to get login with help of send password and email 
    If Request("Email1") <> "" And Request("Passwort1") <> "" Then 'try Login 
        If authenticate(Request("Email1"), Request("Passwort1")) = -1 Then
            Response.Write(getTranslation("Ihre Anmeldedaten sind nicht korrekt!"))
            Response.End()
        Else 'getLogin works now 
   
        End If
    End If

    If getLOGIN() <> "" Then
        If Len(Request("UPDATE")) > 0 Then
            Call saveBothAddresses(False, False)
        Else
%>
<h1>Mein Konto aktualisieren</h1>
<form method="POST" action="default.aspx?pageToShow=MyProfile">
<input type="hidden" value="UPDATE" name="UPDATE">
<%  Call drawProfileForm(True)%>
<p align="center">
    <input type="submit" class="button" value="<%=getTranslation("aktualisieren")%>"><br>
</p>
</form>
<%
End If
Else
Response.Write(getTranslation("Sie sind nicht angemeldet!"))
End If%>
<!-- ACCOUNT -->
