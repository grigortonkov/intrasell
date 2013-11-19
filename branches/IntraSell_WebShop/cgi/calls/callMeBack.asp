<!--#include virtual="/cgi/defaulthead.inc"-->
<HTML>
	<head>
		<link REL='stylesheet' HREF='../style.css' TYPE='text/css'>
	</head>
	<BODY bgcolor="#FFFFFF">
		<center>
			<table width="300" border="0" cellspacing="0" bordercolor="#0000A0">
				<tr>
					<td><img src="<%=imageFullName("callmeback.gif")%>" align="left"><BIG></BIG></td>
				</tr>
			</table>
			<form action='DoCallMeBack.asp' method='post'>
				<TABLE border="0" borderColor="green" cellPadding="3" cellSpacing="0">
					<TR>
						<Td align="center" border="0"><B>Von:</B></Td>
						<td>Email:&nbsp; <input type='input' name='FromMail' value='<%=GetClientEMail (getLOGIN())%>'></td>
					</TR>
					<tr>
						<Th align="right">
						</Th>
						<td>Name: <input type='input' name='FromName' value=''></td>
					</tr>
					<tr>
						<Th align="right">
						</Th>
						<td>Tel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='input' name='FromTel' value=''></td>
					</tr>
					<TR>
						<Td align="center" border="0"><B>An:</B></Td>
						<td><%=GetShopEMail()%></td>
					</TR>
					<input type='hidden' name='ProductID' value='" + artNr + "'> <input type='hidden' name='ToMail' value='<%=GetShopEMail%>'>
					<TR>
						<Td align="center" border="0"><B>Betreff:</B></Td>
						<td><!--Request More Information about Product--> Informationen über Produkt Nr.:<%=request("ArtNr")%>
							anfragen</td>
					</TR>
					<TR>
						<Td align="center" border="0"><B>Text:</B></Td>
						<td><textarea name='BodyMail' cols="62" rows="10">Informationen über Produkt Nr.: <%=request("ArtNr")%> anfragen.</textarea></td>
					</TR>
					<TR>
						<Td border="0" colspan="2" align="center">
							<input type='submit' value='Send'> <input type="button" onClick='window.close()' name="close" value="Close">
						</Td>
					</TR>
			</form>
			</table>
		</center>
	</BODY>
</HTML>
