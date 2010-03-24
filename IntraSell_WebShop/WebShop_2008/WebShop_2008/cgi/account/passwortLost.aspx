<input type="button" value="Passwort?" onclick="document.location='javascript:PasswordSend();'"
    name="B8">

<script language="JavaScript">
    function PasswordSend() {
        var a = window.open("forgotten", null, "height=400,width=400,status=yes,toolbar=no,menubar=no,location=no");
        a.document.write("<HTML><link REL='stylesheet' HREF='skins/skin3/pages/style.css' TYPE='text/css'><BODY bgcolor=#FFFFFF>\n");
        a.document.write("<center>\n");
        a.document.write("<div align=center><BR>\n");
        a.document.write("<table width=100% border=1 cellspacing=0 bordercolor=#0000A0><tr><td><BIG>Passwort vergessen?</BIG></td></tr>\n");
        a.document.write("<tr><td align=center>Tragen Sie bitte hier Ihren Nachnamen und Emailadresse.&nbsp;<br> Das Passwort wird sofort gesendet.&nbsp;&nbsp;&nbsp;</td></tr></table>\n");
        a.document.write("<form action='cgi/account/DoSendPassword.asp' method='post'>\n");
        a.document.write("<TABLE border=1 borderColor=green cellPadding=3 cellSpacing=0>\n");
        a.document.write("<TR>\n");
        a.document.write("<Th align=right><B>Name:*</B></Th>\n");
        a.document.write("<td><input type='input' name='Name' ></td>\n");
        a.document.write("</tr>");
        a.document.write("<TR>\n");
        a.document.write("<Th  align=right><B>Email:*</B></Th>\n");
        a.document.write("<td><input type='input' name='Email' ></td>\n");
        a.document.write("</tr>");
        a.document.write("<TR>\n");
        a.document.write("<TR>\n");
        a.document.write("<Th colspan=2 align=center>\n");
        a.document.write("<input type='submit' value='Send' id='submit' name='submit'>\n");
        a.document.write("</th>\n");
        a.document.write("</tr>");
        a.document.write("</form>\n");
        a.document.write("</table>\n");
        a.document.write("<P><P><P><input type=button onClick='window.close()' name=close value=Close>\n");
        a.document.write("</div></center>\n");
        a.document.write("</BODY></HTML>\n");
    }
</script>

