<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="96%">
    <tr>
      <td width="100%"><img border="0" src="<%=imageFullName("newaccount.gif")%>"></td>
    </tr>
  </table>
  </center>
<%if getLOGIN() <> "" then  
      response.Write getTranslation("Sie sind angemeldet! Bitte zuerst abmelden!")
      response.End
	  'Session("LOG_IN") = ""
End if %>

<form method="POST" action="default.asp">
  <input type="hidden" name="pageToShow" value="ProfileSave">
  <%call drawProfileForm(false)%>
  <p align="center">  
  <input type="submit" class="button" value="<%=getTranslation("Jetzt anmelden")%>">
  </p>
</form>
</div>