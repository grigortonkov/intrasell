<%


    Dim showForm : showForm = Request("showForm") 'Show Form for Save Again 
    If LCase(Request("action")) = "update" Then
        'login first 
        If authenticate(Request("Email1"), Request("Passwort1")) = -1 Then 'cannot authentificate
            Response.Write("Please provide valid creditentials!")
        Else
            'the user will be logged in and an update will happen !     
        End If
    End If
%>
<form method="POST" action="default.aspx">
<input type="hidden" name="pageToShow" value="ProfileSave">
<%  


    Dim new_kdnr : new_kdnr = saveBothAddresses()
    'response.Write "new_kdnr=" & new_kdnr
    'response.Write "LOG_IN=" & session("LOG_IN")
    If new_kdnr = "" Or new_kdnr = "0" Then ' address saving failed /missing data 
        If showForm & "" <> "false" Then
%>
<p align="center">
    <input type="submit" class="button" value="<%=getTranslation("Speichern")%>"></p>
<%
End If
End If
%>
</form>
