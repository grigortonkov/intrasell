<!--#include file="../defaulthead.inc.aspx"-->
<%


    If Request("EmailForNewsletter") <> "" Then
        if  unregisterForNewsletter(Request("EmailForNewsletter")) then 
        Response.End()
        else 
        end if 
    End If
  
%>
<form method="POST" action="unregisterNewsletter.aspx">
<%=getTranslation("Geben Sie ihre Emailadresse bekannt, hiermit werden Sie abgemeldet:")%>
<center>
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;
        border-width: 0" bordercolor="#111111" width="20%" id="AutoNumber1">
        <tr>
            <td width="100%" colspan="2" style="border-style: none; border-width: medium" align="center">
                <img border="0" src="<%=imageFullName("emailnewsletter.gif")%>" alt="Newsletter" />
                 </td>
        </tr>
        <tr>
            <td width="54%" style="border-style: none; border-width: medium" align="center">
                <input name="EmailForNewsletter" size="12" style="float: right" value="<% = Request("EmailForNewsletter") %>" />
            </td>
            <td width="25%" style="border-style: none; border-width: medium" align="center">
                <input type="submit" class="button" valign="bottom" value='<%=getTranslation("Unregister") %>'
                     align="left" />
            </td>
        </tr>
    </table>
</center>
</form>
