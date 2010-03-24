<script language="VB" runat="server">  

    Function makeToolbar(ByVal ArtKatNr)
        Dim html
        html = html & "<table border=""0"" width=""172"" cellspacing=""5"" cellpadding=""5"">"
        html = html & "  <tr>"
        html = html & "	<td bgcolor=""#F7F3F7"">"
        html = html & "		<a href=""default.asp"" onClick=""this.style.behavior='url(#default#homepage)';this.setHomePage('http://" & varvalue("DOMAIN") & "');"">"
        html = html & "      <li><FONT color=#980000><B>Startseite</B></FONT></a>"
        html = html & "           <br> Klicken Sie hier um " & varvalue("DOMAIN") & " als Startseite festzulegen.</td>"
        html = html & "  </tr><tr>"
        html = html & "    <td bgcolor=""#F7F3F7"">"
        html = html & "     <a href=""javascript:window.external.AddFavorite('http://" & varvalue("DOMAIN") & "', '" & varvalue("DOMAIN") & "')"">"
        html = html & "           <li><FONT color=#980000><B>Bookmark</B></a></FONT>"
        html = html & "           <br>Klicken Sie hier um " & varvalue("DOMAIN") & " zu Ihren Favoriten hinzuzufügen.</td>"
        html = html & "  </tr><tr>"
        html = html & "    <td bgcolor=""#F7F3F7"">"
        html = html & "    <a href=""javascript:SendToFriend();"">"
        html = html & "           <li><FONT color=#980000><B>E-Mail a friend</B></FONT></a>"
        html = html & "           <br>Empfehlen Sie diese Seite weiter, um ihrem Freund zu helfen, Zeit und Geld zu sparen."
        html = html & "    </td>"
        html = html & "  </tr>"
        html = html & "</table>"
        makeToolbar = html & makeJSSendToFriend()
    End Function


    Function makeJSSendToFriend()
        Dim html
        html = html & "<script language=""JavaScript"">" & CHR(13) & CHR(10)
        html = html & "function SendToFriend () {" & CHR(13) & CHR(10)
        html = html & "	var a = window.open (""E-Mail"",null, ""height=450,width=500,status=yes,toolbar=no,menubar=no,location=no"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<HTML><link REL='stylesheet' HREF='../style.css' TYPE='text/css'><BODY bgcolor=#FFFFFF>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<center>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<div align=center><BR>\n"");" & CHR(13) & CHR(10)
        html = html & "	//a.document.write (""<table width=100% border=0 cellspacing=0 bordercolor=#0000A0><tr><td><img src="" + imageFullName(""emailafriend.gif"") + "" align=left><BIG></BIG></td></tr></table>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<form action='cgi/calls/DoSendToFriend.asp' method='post' id=form1 name=form1>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<TABLE border=0 borderColor=green cellPadding=3 cellSpacing=0>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<TR>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<Td align=right border=0><B>Von (Email):</B></Td>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""<td><input type='input' name='FromMail' value='" & GetClientEMail(Session("LOG_IN")) & "'></td>\n"");" & CHR(13) & CHR(10)
        html = html & "	a.document.write (""</tr>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<input type='hidden' name='ProductUrl' value='"" + document.location.href + ""'>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<TR><Td border=0 align=right><B>An (Email):</B></Td>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<td><input type='input' name='ToMail' ></td></tr>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<TR>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<Td align=right border=0><B>Betreff:</B></Td><td><input type='input' name='Subject' value='eine interessante Seite...'></td></tr>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<TR>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<Td  align=right border=0><B>Text:</B></Td>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<td>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""Dieses E-Mail wurde an Sie via " & varvalue("DOMAIN") & " gesendet.<br>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""Es beinhaltet Produktinformationen, welche Ihnen ein <br>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""Freund mitteilen möchte<BR><font color=red><b>"" );" & CHR(13) & CHR(10)
        html = html & " a.document.write (document.location.href);" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</b></font><HR><BR><textarea name='BodyMail' cols=30 rows=6></textarea></td>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</tr>"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<TR><Td border=0 colspan=2 align=left>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<input type='submit' value='Send' id='submit'1 name='submit'1>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</td>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</tr></form>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</table>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""<P><input type=button onClick='window.close()' name=close value=Close>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</div></center>\n"");" & CHR(13) & CHR(10)
        html = html & " a.document.write (""</BODY></HTML>\n"");" & CHR(13) & CHR(10)
        html = html & "}" & CHR(13) & CHR(10)
        html = html & "</" & "script>" & CHR(13) & CHR(10)
        makeJSSendToFriend = html
    End Function

 
</script>

