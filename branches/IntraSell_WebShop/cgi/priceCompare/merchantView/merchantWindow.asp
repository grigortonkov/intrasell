<%
 function drawWindowPart1Merchant(title, links, empty2, buttons)
%>
<div align="right">
	<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="800">
		<tr>
			<td><%=title%></td>
			<td height="16" width="144"></td>
			<td height="16" width="144">
				<a href="<%=buttons(1,2)%>" target="new"><img border="0" src="cgi/priceCompare/merchantView/images/webpage-besuchen.gif" width="144" height="16" alt="Händler Homepage">
				</a>
			</td>
	
			<td height="16" width="144">
			<a OnClick="window.open('<%=buttons(2,2)%>', 'remote','top=300,left=300,height=130,width=250,status=yes,toolbar=no,menubar=no');">
			<img border="0" src="cgi/priceCompare/merchantView/images/adresse-merken.gif" width="144" height="16" alt="Adresse als Bookmark anlegen">
			</a>
		   </td>
      
			<td height="16" width="144">
				<a href="<%=buttons(3,2)%>"><img border="0" src="cgi/priceCompare/merchantView/images/filialen.gif" width="144" height="16" alt="Haendler Filialen">
				</a>
			</td>
		</tr>
		<tr>
			<td height="16" bgcolor="#F7F7F7" colspan="5"><%=links%></td>
		</tr>
		<tr>
			<td height="300" colspan="4">
				<%end function%>
				<%
 function drawWindowPart2Merchant(title, empty1, empty2, buttons)
%>
			</td>
		</tr>
		<tr>
			<td height="1" bgcolor="#999999" colspan="1">
				<img border="0" src="platzhalter.gif" width="180" height="1"></td>
			<td height="1" bgcolor="#999999" colspan="4">
				<img border="0" src="platzhalter.gif" width="520" height="1"></td>
		</tr>
	</table>
</div>
<%end function%>
