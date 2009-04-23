<!--#include file="../defaulthead.inc"-->

<html>
<head>
	<link REL='stylesheet' HREF='<%=BASENAME%>'>/style.css' TYPE='text/css'>
</head>
<body bgcolor=#FFFFFF>
<form action='DoSendToFriend.asp' method='post'>
        <table border=0 cellspacing=0 bordercolor=#0000A0>
        <tr><td><img src="<%=imageFullName("emailafriend.gif")%>" align=left>
        </td>
        </tr></table>
		
		<TABLE border=0 borderColor=#008000 cellPadding=3 cellSpacing=0 width="500">
		<TR>
		<Td align=right border=0><B>Von:</B></Td>
		<td><input type='input' name='FromMail' value='<%=GetClientEMail (getLOGIN())%>'></td>
		</tr>
		
		<input type='hidden' name='ProductUrl' value=''>
		
		<TR>
		<Td border=0 align=right><B><%=getTranslation("An")%>:</B></Td>
		
		<td><input type='input' name='ToMail' ></td>
		</tr>
		<TR>
		<Td align=right border=0><B><%=getTranslation("Betreff")%>:</B></Td>
		<td><input type='input' name='Subject'></td>
		</tr>

		<TR>
		<Td  align=right border=0><B><%=getTranslation("Text")%>:</B></Td>
		<td>
		
        <BR><textarea name='BodyMail' cols=59 rows=7>
<%=getTranslation("Produktempfehlung")%>
<%=getTranslation("Dieses E-Mail wurde an Sie via nachfolgender gesendet.")%> <%=VARVALUE ("EMAIL")%> 
<%=getTranslation("Es beinhaltet Produktinformationen welche Ihnen ein Freund mitteilen m&ouml;chte:")%>
<%Response.Write "http://" & varvalue("DOMAIN") & "/cgi/default.asp?ArtNr=" & request("ArtNr")%>
		</textarea></td>
		</tr>
		<TR>
		<Td border=0 colspan=2 align=center>
		<input type='submit' value='<%=getTranslation("senden")%>'><input type=button onClick='window.close()' name=close value=Close>
		</td>
		</tr>
		
		</table>
</form>
</body>
</html>
