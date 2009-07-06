
<!-- Change Emails -->
<%if request ("OldDoesNotMatch") = "TRUE" then %>
<p align=center><font color=red>Incorect Old Email! Try Again!</font></p>
<%end if%>

<form method="post" action="default.asp?pageToShow=MyAccount" id=formCPWD name=formCPWD>
<center>
	<table border="0" align=center cellpadding="2" width="660">
	    <tr>
	      <th align="middle" colspan=2> Change Email </th>	  
	    </tr>
	    <tr>
	      <td align="right" width="204">  </td>
	      <td width="175"> </td>
	    </tr>
	    <tr>
	      <td align="right" width="204">Old Email*:</td>
	      <td width="175"><input   name="OldEmail" size="60"></td>
	    </tr>
	    <tr>
	      <td align="right" width="204">New Email*:</td>
	      <td width="175"><input   name="NewEmail" size="60"></td>
	    </tr>
	    <tr>
	      <td align="right" width="204">Confirm New Email*:</td>
	      <td width="175"><input   name="CNewEmail" size="60"></td>
	    </tr>
	    <tr>
	      <td colspan=2 align=middle >
	      <input type="hidden" name="CHANGEEMAIL" value="CHANGEEMAIL">
	      <input type="button" class="button" value="Change Email" onClick="javascript:checkSame();"> &nbsp;
	      <input type="button" class="button" value= "Cancel" name="B5" OnClick="document.location='default.asp'"></td>
	    </tr>
	</table>
	<center>
  </form>
<script>
	function checkSame () {
		var n;
		var cn;
		n = document.formCPWD.item ("NewEmail").value;
		cn = document.formCPWD.item ("CNewEmail").value;
			if (n != cn )
				alert ("The Emails doesn't match");
			else {
				if (n.length>10)
					document.formCPWD.submit ();
				else
					alert ("Email should be at least 10 chars");
			}	
			
	}	
</script>
<!-- End Change Password --></CENTER></CENTER> 
