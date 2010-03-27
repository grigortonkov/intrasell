<div align="center">
    <center>
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
            bordercolor="#111111" width="96%">
            <tr>
                <td width="100%">
                    <img border="0" src="<%=imageFullName("newaccount.gif")%>">
                </td>
            </tr>
        </table>
        <%  If getLOGIN() <> "" Then
                Response.Write(getTranslation("Sie sind angemeldet! Bitte zuerst abmelden!"))
                Response.End()
                ' Session("LOG_IN") = ""
            End If%>
        <form method="POST" action="default.aspx">
        <input type="hidden" name="pageToShow" value="ProfileSaveSimple">
        <%Call drawEmptyProfileFormSimple(ACCOUNT, False)%>
        <input type="submit" class="button" value="<%=getTranslation("Jetzt anmelden")%>">
        </form>
    </center>
</div>
