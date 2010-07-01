<h2><%=getTranslation("Ihre Auftr&auml;ge/Lieferscheine/Rechnungen")%></h2>
<%

 
if not isLoggedIn() then
    response.Write getTranslation("Bitte vorher anmelden!")
else 'logged in


Dim orderType:orderType=request("orderType")
Dim tableOrders, tableOrdersProducts
tableOrders= getNameForTable(orderType)
tableOrdersProducts= "[" & getNameForTableProducts(orderType) & "]"

Dim rsRech
Dim orderNR
	

dim MCHAR: MCHAR="*"
if session("dbType") = "SQL" or session("dbType") = "MySQL" then MCHAR = "%"
	
	SQL = " SELECT " & tableOrders &".Datum, Status,  "& tableOrdersProducts &".* " & _
		  " FROM grArtikel, " & tableOrdersProducts & ", " & tableOrders  & _
		  " WHERE "& tableOrdersProducts &".RechNr = " &tableOrders& ".Nummer" & _
		  " and " & tableOrdersProducts &".ArtNR = grArtikel.ArtNr " & _ 
		  " and " & tableOrders &".KundNr=" & getLOGIN() & _
		  " and grArtikel.ArtNR>=1 and grArtikel.bezeichnung not like '" & MCHAR & "CALCULATE" & MCHAR & "' " & _ 
		  " ORDER BY ("& tableOrdersProducts &".RechNr) DESC "	
   
   'if Session("dbType")  = "SQL" then sql = replace(sql,"*","%")  
		  
   'response.write SQL
   'Response.Flush
   set rsRech = objConnectionExecute(SQL)
	if rsRech.EOF and rsRech.BOF then%>
		<h2><font size="2" color="red"><%=getTranslation("Keine Daten vorhanden!")%></font></h2>
	<%else%>
 
   
		<table border=1 bordercolor="#C0C0C0" cellpadding="2" cellspacing="0" width="100%" style="border-collapse: collapse">
		<tr>
                <th width="100"><%=getTranslation("Aktion")%></th>
		        <th width="120"><%=getTranslation("Nr")%></th>
		        <th width="45"><b><%=getTranslation("Datum")%></b></th>
		        <th width="191"><b><%=getTranslation("Status Bearbeitung")%></b></th>
		        <th width="191"><b><%=getTranslation("Paketnummer")%></b></th>
		        <th width="231"><b><%=getTranslation("Artikel#")%></b></th>
		        <th width="231"><b><%=getTranslation("Bezeichnung")%></b></th>
		        <th width="191"><b><%=getTranslation("Stk")%></b></th>
		        <th width="100"><b><%=getTranslation("Summe")%></b></th>
		        <th width="191"><b><%=getTranslation("Status Position")%></b></th>
                
		</tr>
       <%
	    orderNR = ""
	    Dim count:count = 0
		
		While not rsRech.EOF 
		%>
		<tr>
		<%	if OrderNR <> rsRech("RechNr") then 'new invoice
				OrderNR = rsRech("RechNr")
				count = count + 1
		%>		
		   
		    <tr>
                <td align="center">
<table>
<tr><td><img border=0 src='<%=imageFullName("printer.png")%>'></td><td>
<a href="cgi/account/printPreviewOrder.asp?nummer=<%=OrderNR%>&amp;OrderType=<%=OrderType%>" target="blank">
			        <!--#<%=count%>&nbsp;--><%=getTranslation("ausdrucken")%>&nbsp; </a>
</td></tr>
<tr><td><img border=0 src=<%=imageFullName("data_information.png")%>></td><td>
  <a href="cgi/calls/requestJob.asp?Job=RequestOrderInfo&ProductId=ALL&OrderId=<%=OrderType%><%=OrderNR%>" 
			           target="JOB" OnClick="window.open ('JOB', 'JOB', 'height=400,width=400,status=yes,toolbar=no,menubar=no,location=no');">
			           <%=getTranslation("Bestellinfo")%>
			        </a>
</td></tr>
<tr><td><img border=0 src=<%=imageFullName("package.png")%>></td><td>
 <!-- Paketverfolgung --> 
                    <% if  not getVorgangEigenschaft(orderType, OrderNR, "Paketnummer") = "" then %>
                       <a href="<%=VARVALUE_DEFAULT("SHOP_LINK_PAKETVERFOLGUNG","http://www.dhl.at?paketnummer=")%><%=getVorgangEigenschaft("AR", OrderNR, "Paketnummer")%>" 
			               target="_Paketverfolgung">
			               <%=getTranslation("Paketverfolgung")%>
<%else %>
<%=getTranslation("keine Paketnummer vergeben")%>
                        <%end if%>
			            </a>
                   <!-- End Paketverfolgung --> 
</td></tr>
</table>
			        
			         
			      
                  

			    </td>
			    <td><%=OrderType%>-<%=OrderNR%>	</td>	
		        <td align="center"><%=rsRech("Datum")%>&nbsp;</td>	
		        <td align="center"><%=rsRech("Status")%>&nbsp;</td>	
		        <td align="center"><%=getPaketnummer(OrderType, OrderNR)%>&nbsp;</td>
    		
		    <%else ' products of the invoice %>
		            <td align="center" colspan=5> &nbsp;</td>
		    <%end if%>
    		

		    <td align="center"><%=rsRech("ArtNr")%>&nbsp;</td>
		    <td align="center"><%=Server.HTMLEncode(rsRech("Bezeichnung")&"")%>&nbsp;</td>
		    <td align="center"><p align=center><%=rsRech("Stk")%>&nbsp;</p></td>
		    <td align="right"><b><p align=right><%=FormatNumber(rsRech("PreisATS_Brutto"),2)%></p></b></td>
		    <td align="center"><%=rsRech("PositionStatus")%>&nbsp;</td>
		
		</tr>
		<%
		rsRech.MoveNext
		wend
		rsRech.close
		%>		
		</table>	

	<%end if%>	
<p align=center><a href="default.asp?pageToShow=MyAccount"><%=getTranslation("Zur&uuml;ck zu meinem Konto")%></a></p>

<% end if 'logged in%>




