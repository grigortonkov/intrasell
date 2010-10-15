<%
    Dim kdnr As Object : kdnr = getLOGIN()
    Dim mode As String = Request("mode") 'update or new
    Dim action As String = Request("action")
    Dim typeOfAddr As String = Request("typeOfAddress")
    Dim typeOfAddressToShow As String
    Dim specialTypeOfAddress As String
    Dim typeOfAddressForHandling As String

    If typeOfAddr = TypeOfAddress.SHIPPING Then
        typeOfAddressForHandling = TypeOfAddress.SHIPPING
        typeOfAddressToShow = "Lieferschein"
    Else If typeOfAddr = TypeOfAddress.INVOICE Then
        typeOfAddressForHandling = TypeOfAddress.INVOICE
        typeOfAddressToShow = "Rechnung"
    Else If typeOfAddr = TypeOfAddress.SHIPPING2 Then
        typeOfAddressForHandling = TypeOfAddress.SHIPPING2
        typeOfAddressToShow = "alte Lieferschein"
    Else If typeOfAddr = TypeOfAddress.INVOICE2 Then
        typeOfAddressForHandling = TypeOfAddress.INVOICE2
        typeOfAddressToShow = "alte Rechnung"
    End If

    'create new profile if not 
    If Action = "saveAddresses" Then 'save action required 
    %>
    <form method='post'  action='default.aspx' id="formAddress" name="formAddress">
    <input type="hidden" name="PageToShow" value="createUpdateAddressSpecial">
    <input type="hidden" name="action" value="saveAddresses">
    <input type="hidden" name="mode" value="<%=mode%>">
    <input type="hidden" name="typeOfAddress" value="<%=typeOfAddr%>">
    <%
        Dim makeBackup as boolean = lcase(mode) = "new"
        Dim savedID As Long = saveProfile(typeOfAddressForHandling, makeBackup)
        If savedID = 0 Then ' address saving failed /missing data 
    %>
    <br />
    <br />
    <center>
        <input type="submit" value="<%=getTranslation("Speichern")%>">
    </center>
    </form>
    <%
    Else 'saved -> redirect to proper page 

        'redirect to warenkorb step 3 oder zum Profile page 
        Dim redPage
        
        If calculateWarenkorbSum() > 0 Then
            Dim passOld As String : passOld = tableValue("ofAdressen", "IDNR", getLOGIN(), "Passwort")
            redPage = "default.aspx?pageToShow=warenkorbStep3&EmailOld=" & GetClientEmail(getLOGIN()) & "&passwordOld=" & passOld
        Else
            redPage = "default.aspx?pageToShow=MyProfileInfo"
        End If
        Response.Write(getTranslation("Ihre Änderungen wurden erfolgreich gespeichert."))
        Response.Write("<a href='" & redPage & "'> " & getTranslation("weiter") & "</a>")
        Response.Redirect(redPage)
    End If

Else 'no action requested 
%>
<form method="POST" action="default.aspx">
<input type="hidden" name="pageToShow" value="createUpdateAddressSpecial">
<input type="hidden" name="action" value="saveAddresses">
<input type="hidden" name="mode" value="<%=mode%>">
<input type="hidden" name="typeOfAddress" value="<%=typeOfAddr%>">
<table border="0" width="100%" bordercolor="#CCCCCC" style="border-collapse: collapse"
    cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" align="center">
            <%=getTranslation("aktuelle Adresse")%>-<%=getTranslation(typeOfAddressToShow)%>
        </td>
    </tr>
    <tr>
        <td width="50%">
            <%=drawEmptyProfileForm(typeOfAddressForHandling, True, kdnr)%>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <center>
                <input type="submit" class='button' value="<%=getTranslation("Speichern")%>">
            </center>
        </td>
    </tr>
</table>
</form>
<%  End If%>