<%

    'dim kdnr: 
    kdnr = getLOGIN()

    'create new profile if not 
    If Request("action") = "saveAddresses" Then 'save actgion required 
%>
<form method="POST" action="default.asp">
<input type="hidden" name="PageToShow" value="createUpdateDeliveryAddresses">
<input type="hidden" name="action" value="saveAddresses">
<%
    Dim res1 : res1 = saveProfile(SHIPPING)
    Dim res2 : res2 = saveProfile(INVOICE)
    'kdnr = saveBothAddresses()	
    'Response.Write res1 & " und " &   res2
    If res1 = 0 Or res2 = 0 Then ' adress saving failed /missing data 
%>
<br>
<br>
<center>
    <input type="submit" value="Adressen Speichern" name="B1" style="float: left">
</center>
</form>
<%
Else
   
    If Session("LOG_IN") <> "" Then
        EmailOld = TABLEVALUE("ofAdressen", "IDNR", Session("LOG_IN"), "Email")
        PasswordOld = TABLEVALUE("ofAdressen", "IDNR", Session("LOG_IN"), "Passwort")
    End If
	         
%>
</form>
<center>
    <a href="default.aspx?pageToShow=warenkorbStep3&emailOld=<%=EmailOld%>&passwordOld=<%=PasswordOld%>">
        WEITER ZUM WARENKORB </a>
</center>
<%  Response.Redirect("default.aspx?pageToShow=warenkorbStep3&emailOld=" & EmailOld & "&passwordOld=" & PasswordOld)%>
<%
End If



'Response.Write "Kdnr=[" & kdnr & "]"

	
EmailStep3 = TABLEVALUE("ofAdressen", "idnr", kdnr, "Email")
PasswordStep3 = TABLEVALUE("ofAdressen", "idnr", kdnr, "Passwort")
Else 'no action requested 
%>
<form method="POST" action="default.asp">
<input type="hidden" name="pageToShow" value="createUpdateDeliveryAddresses">
<input type="hidden" name="action" value="saveAddresses">
<table border="0" width="100%" bordercolor="#CCCCCC" style="border-collapse: collapse"
    cellpadding="0" cellspacing="0">
    <tr>
        <td width="50%" align="center">
            Aktuelle Lieferadresse<hr>
        </td>
        <td width="50%" align="center">
            Aktuelle Rechnungsadresse<hr>
        </td>
    </tr>
    <tr>
        <td width="50%">
            <%=drawEmptyProfileForm(SHIPPING, true)%>
        </td>
        <td width="50%">
            <%=drawEmptyProfileForm(INVOICE, true)%>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <br>
            <br>
            <center>
                <input type="submit" class="button" value="Adressen speichern" name="B1" style="float: left">
            </center>
        </td>
    </tr>
</table>
</form>
<%  End If%>