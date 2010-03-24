<script language="JavaScript">
    function RequestOrderInfo() {

        var a = window.open("E-Mail", null, "height=400,width=400,status=yes,toolbar=no,menubar=no,location=no");

        a.document.write("<HTML><link REL='stylesheet' HREF='../style.css' TYPE='text/css'><BODY bgcolor=#FFFFFF>\n");
        a.document.write("<center>\n");
        a.document.write("<div align=center>\n");
        //a.document.write ("<table width=100% border=1 cellspacing=0 bordercolor=#0000A0><tr><td><img src=htmlimg/email.gif align=left width=30 height=20>&nbsp;<BIG>EMAIL FORM</BIG></td></tr></table>\n");
        a.document.write("<form action='cgi/calls/DoOrderInfo.asp' method='post'>\n");
        a.document.write("<TABLE border=1 borderColor=green cellPadding=3 cellSpacing=0>\n");
        a.document.write("<TR>\n");
        a.document.write("<Th align=right><B>FROM:</B></Th>\n");
        a.document.write("<td><input type='input' name='FromMail' value='<%=GetClientEMail(KundNr)%>'></td>\n");
        a.document.write("</tr>");

        a.document.write("<TR>\n");
        a.document.write("<Th  align=right><B>TO:</B></Th>\n");
        a.document.write("<td><%=GetShopEMail%></td>\n");
        a.document.write("</tr>");

        a.document.write("<input type='hidden' name='OrderID' value='<%'=ordID%>'>\n");

        a.document.write("<input type='hidden' name='ToMail' value='<%=GetShopEMail()%>'>\n");

        a.document.write("<TR>\n");
        a.document.write("<Th  align=right><B>Subject:</B></Th>\n");
        a.document.write("<td>Request More Info for Order #<%'=ordID%></td>\n");
        a.document.write("</tr>");

        a.document.write("<TR>\n");
        a.document.write("<Th  align=right><B>BODY:</B></Th>\n");
        a.document.write("<td><textarea name='BodyMail' cols=30 rows=10></textarea></td>\n");
        a.document.write("</tr>");

        a.document.write("<TR>\n");
        a.document.write("<Th colspan=2 align=center>\n");
        a.document.write("<input type='submit' value='Send'>\n");
        a.document.write("</th>\n");
        a.document.write("</tr>");

        a.document.write("</form>\n");

        a.document.write("</table>\n");

        a.document.write("<P><P><P><input type=button onClick='window.close()' name=close value=Close>\n");
        a.document.write("</div></center>\n");
        a.document.write("</BODY></HTML>\n");
    }
</script>

