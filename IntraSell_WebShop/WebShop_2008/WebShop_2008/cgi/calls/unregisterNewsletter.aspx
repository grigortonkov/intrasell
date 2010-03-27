<!--#include file="../defaulthead.inc.aspx"-->
<%


    If Request("EmailForNewsletter") <> "" Then
        Call unregisterForNewsletter(Request("EmailForNewsletter"))
        Response.End()
    End If
  
%>
<form method="POST" action="unregisterNewsletter.aspx">
<%=getTranslation("Geben Sie ihre Emailadresse bekannt, hiermit werden Sie abgemeldet:")%>
<center>
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;
        border-width: 0" bordercolor="#111111" width="20%" id="AutoNumber1">
        <tr>
            <td width="100%" colspan="2" style="border-style: none; border-width: medium" align="center">
                <img border="0" src="<%=imageFullName("emailnewsletter.gif")%>" width="130" height="16">
            </td>
        </tr>
        <tr>
            <td width="54%" style="border-style: none; border-width: medium" align="center">
                <input name="EmailForNewsletter" size="12" style="float: right">
            </td>
            <td width="25%" style="border-style: none; border-width: medium" align="center">
                <input type="image" src="<%=imageFullName("go.gif")%>" valign="bottom" value="Unregister"
                    name="I1" align="left" border="0">
            </td>
        </tr>
    </table>
</center>
</form>
