<%
    Dim kdnr As Long : kdnr = getLOGIN()

    Dim typeOfAddress : typeOfAddress = Request("typeOfAddress")
    Dim typeOfAddressToShow
    Dim specialTypeOfAddress
    Dim typeOfAddressForHandling

    If typeOfAddress = "LI" Then
        typeOfAddressForHandling = SHIPPING
        typeOfAddressToShow = "Lieferschein"
    Else
        typeOfAddressForHandling = INVOICE
        typeOfAddressToShow = "Rechnung"
    End If

    'create new profile if not 
    If Request("action") = "saveAddresses" Then 'save action required 
%>
<form method="POST" action="default.aspx" id="form1" name="form1">
<input type="hidden" name="PageToShow" value="createUpdateAddressSpecial">
<input type="hidden" name="action" value="saveAddresses">
<%
    Dim savedID : savedID = saveProfile(typeOfAddressForHandling)
    If savedID = 0 Then ' adress saving failed /missing data 
%>
<br>
<br>
<center>
    <input type="submit" value="<%=getTranslation("Speichern")%>">
</center>
</form>
<%
Else 'redirect to proper page 

    'redirect to warenkorb step 3 oder zum Profile page 
    Dim redPage
        
    If calculateWarenkorbSum() > 0 Then
        Dim passOld : passOld = tableValue("ofAdressen", "IDNR", getLOGIN(), "Passwort")
        redPage = "default.aspx?pageToShow=warenkorbStep3&EmailOld=" & GetClientEmail(getLOGIN()) & "&passwordOld=" & passOld
    Else
        redPage = "default.aspx?pageToShow=MyProfileInfo"
    End If
        
    Response.Write("<a href='" & redPage & "'> " & getTranslation("weiter") & "</a>")
    Response.Redirect(redPage)
End If

Else 'no action requested 
%>
<form method="POST" action="default.aspx">
<input type="hidden" name="pageToShow" value="createUpdateAddressSpecial">
<input type="hidden" name="action" value="saveAddresses">
<input type="hidden" name="typeOfAddress" value="<%=typeOfAddress%>">
<table border="0" width="100%" bordercolor="#CCCCCC" style="border-collapse: collapse"
    cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" align="center">
            <%=getTranslation("Aktuelle Adresse")%>-<%=getTranslation(typeOfAddressToShow)%>
        </td>
    </tr>
    <tr>
        <td width="50%">
            <%=drawEmptyProfileForm(typeOfAddressForHandling, true)%>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <input type="submit" class="button" value="<%=getTranslation("Speichern")%>">
            </center>
        </td>
    </tr>
</table>
</form>
<%  End If%>