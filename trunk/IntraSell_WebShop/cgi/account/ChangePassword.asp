
<!-- Change Password -->
<%if request ("OldDoesNotMatch") = "TRUE" then %>
<p align=center><font color=red>Incorect Old Password! Try Again!</font></p>
<%end if%>

<form method="POST" action="default.asp?pageToShow=MyAccount" id="formCPWD" name="formCPWD">
<center>
	<table border="0" align=center cellpadding="2" width="397">
	    <tr>
	      <th align="center" colspan=2>   Passwort ändern</th>	  
	    </tr>
	    <tr>
	      <td align="right" width="204">  </td>
	      <td width="175"> </td>
	    </tr>
	    <tr>
	      <td align="right" width="204">altes Passwort*:</td>
	      <td width="175"><input type="password" name="OldPasswd" size="20"></td>
	    </tr>
	    <tr>
	      <td align="right" width="204">neues Passwort*:</td>
	      <td width="175"><input type="password" name="NewPasswd" size="20"></td>
	    </tr>
	    <tr>
	      <td align="right" width="204">neues Passwort wiederholen*:</td>
	      <td width="175"><input type="password" name="CNewPasswd" size="20"></td>
	    </tr>
	    <tr>
	      <td colspan=2 align=center width="387">
	      <input type="hidden" class="button" name="CHANGEPASSWD" value="CHANGEPASSWD">
	      <input type="button" class="button" value="Change Password" OnClick="javascript:checkSame();"> &nbsp;
	      <input type="button" class="button" value= "Cancel" name="B5" OnClick="document.location='default.asp'"></td>
	    </tr>
	</table>
	<center>
  </form>

<script>
	function checkSame () {
	   
		var n;
		var cn;
		n = document.getElementsByName("NewPasswd").item(0).value; // geht nur in IE document.formCPWD.item ("NewPasswd").value;
		cn =  document.getElementsByName("CNewPasswd").item(0).value; // geht nur in IEdocument.formCPWD.item ("CNewPasswd").value;
			if (n != cn )
				alert ("The Password doesn't match");
			else {
				if (n.length>=4)
					document.formCPWD.submit ();
				else
					alert ("Password should be at least 4 chars");
			}	
			
	}	
</script>
<!-- End Change Password -->