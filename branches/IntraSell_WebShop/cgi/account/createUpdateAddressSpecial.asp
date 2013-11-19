<%
kdnr = getLOGIN()

Dim typeOfAddress: typeOfAddress=request("typeOfAddress")
Dim typeOfAddressToShow
Dim specialTypeOfAddress
Dim typeOfAddressForHandling

if typeOfAddress = "LI" then
  typeOfAddressForHandling = SHIPPING
  typeOfAddressToShow = "Lieferschein"
else 
  typeOfAddressForHandling = INVOICE
  typeOfAddressToShow = "Rechnung"
end if 

'create new profile if not 
if request("action") = "saveAddresses" then 'save action required 
%>	
<form method="POST" action="default.asp" id=form1 name=form1>
<input type="hidden" name="PageToShow" value="createUpdateAddressSpecial">    
<input type="hidden" name="action" value="saveAddresses">    
<%
 Dim savedID: savedID = saveProfile(typeOfAddressForHandling)
	if  savedID = 0  then ' adress saving failed /missing data 
%>
<br>
<br>
<center>
    <input type="submit" value="<%=getTranslation("Speichern")%>">
 </center>
</form>
  
<%
   else 'redirect to proper page 

    'redirect to warenkorb step 3 oder zum Profile page 
        dim redPage
        
        if calculateWarenkorbSum()>0 then 
           Dim passOld: passOld = tableValue("ofAdressen","IDNR",getLOGIN(),"Passwort")
            redPage = "default.asp?pageToShow=warenkorbStep3&EmailOld=" & GetClientEmail(getLOGIN()) & "&passwordOld=" & passOld
		else
		    redPage = "default.asp?pageToShow=MyProfileInfo"			 
        end if 
        
		Response.Write "<a href='" & redPage & "'> " & getTranslation("weiter") & "</a>"
		Response.Redirect redPage   
   end if 

else 'no action requested 
%>

<form method="POST" action="default.asp">
  <input type="hidden" name="pageToShow" value="createUpdateAddressSpecial">
  <input type="hidden" name="action" value="saveAddresses">
  <input type="hidden" name="typeOfAddress" value="<%=typeOfAddress%>">
  
   <table border="0" width="100%" bordercolor="#CCCCCC" style="border-collapse: collapse" cellpadding="0" cellspacing="0">
		<tr> 
			<td width="50%" align="center"><%=getTranslation("Aktuelle Adresse")%>-<%=getTranslation(typeOfAddressToShow)%></td>
		</tr>
		<tr> 
			<td width="50%"><%=drawEmptyProfileForm(typeOfAddressForHandling, true)%></td>
		</tr>
		<tr>
		<td colspan=2>
			<center>
			<input type="submit" class="button" value="<%=getTranslation("Speichern")%>">
			</center>    
		</td>
		</tr>
</table>
</form>
<%end if %>