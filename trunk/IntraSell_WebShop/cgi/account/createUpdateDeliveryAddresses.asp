<%

'dim kdnr: 
kdnr = getLOGIN()

'create new profile if not 
if request("action") = "saveAddresses" then 'save actgion required 
%>	
<form method="POST" action="default.asp">
<input type="hidden" name="PageToShow" value="createUpdateDeliveryAddresses">    
<input type="hidden" name="action" value="saveAddresses">    
<%
    dim res1: res1 =  saveProfile(SHIPPING)
    dim res2: res2 =  saveProfile(INVOICE)
	'kdnr = saveBothAddresses()	
	'Response.Write res1 & " und " &   res2
	if res1 = 0 or res2 =0  then ' adress saving failed /missing data 
%>
<br>
<br>
<center>
    <input type="submit" value="Adressen Speichern" name="B1" style="float: left">
 </center>
</form>
  
<%
   else 
   
   	         if SESSION ("LOG_IN") <> "" then 	 
	          EmailOld = TABLEVALUE("ofAdressen","IDNR", SESSION ("LOG_IN"), "Email")
	          PasswordOld = TABLEVALUE("ofAdressen","IDNR", SESSION ("LOG_IN"), "Passwort")
	         end if 
	         
   %>
   </form>
   
   <center>
    <a href="default.asp?pageToShow=warenkorbStep3&emailOld=<%=EmailOld%>&passwordOld=<%=PasswordOld%>"> WEITER ZUM WARENKORB </a>
   </center>
   <% Response.Redirect "default.asp?pageToShow=warenkorbStep3&emailOld=" & EmailOld & "&passwordOld=" & PasswordOld %>
<%
	end if 



'Response.Write "Kdnr=[" & kdnr & "]"

	
	EmailStep3 = TABLEVALUE("ofAdressen","idnr", kdnr , "Email")
    PasswordStep3 = TABLEVALUE("ofAdressen","idnr", kdnr , "Passwort")
else 'no action requested 
%>

<form method="POST" action="default.asp">
  <input type="hidden" name="pageToShow" value="createUpdateDeliveryAddresses">
  <input type="hidden" name="action" value="saveAddresses">
  
<table border="0" width="100%" bordercolor="#CCCCCC" style="border-collapse: collapse" cellpadding="0" cellspacing="0">

   <tr> 
    <td width="50%" align="center">Aktuelle Lieferadresse<hr></td>
    <td width="50%" align="center">Aktuelle Rechnungsadresse<hr></td>
  </tr>
 
  
  <tr> 
    <td width="50%"><%=drawEmptyProfileForm(SHIPPING, true)%></td>
    <td width="50%"><%=drawEmptyProfileForm(INVOICE, true)%></td>
  </tr>
  <tr>
  <td colspan=2>
  <br>
<br>
<center>
    <input type="submit" value="Adressen Speichern" name="B1" style="float: left">
</center>    
</td>
  </tr>
</table>
</form>
<%end if %>