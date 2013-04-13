<!--#include file="merchantView/merchantWindow.asp"-->
<%
   Call LOG() ' save in login table 
   if request("MERCHANT_HOME") <> "" then 'redirect to merchant page is required' redirect       
      response.redirect request("MERCHANT_HOME")
   end if    
%>
<table border="0" cellspacing="0" cellpadding="0">
<tr>

 
<td valign=top>
<%
Dim merchantId: merchantId = request("MerchantId")
Dim rsM:set rsM = objConnectionExecute("select * from lieferantenAdressen  where IDNR=" & merchantId)
if rsM.eof then 
    call drawErrorBox("Error", "Dieser Lieferant ist unbekannt!", "", "")
	Response.End 	
end if 


Dim butArrMerch(3,2)
butArrMerch(1,1) = "Homepage_besuchen"
butArrMerch(2,1) = "Adresse_merken"
butArrMerch(3,1) = "Filialen"
butArrMerch(1,2) = "default.asp?pageToShow=LieferantenInformationen&merchantId=" & merchantId & "&LieferantNr=" & merchantId & "&MERCHANT_HOME="&rsM("Web")
butArrMerch(2,2) = "cgi/account/saveBookmark.asp?Title=Lieferant  " & TABLEVALUE("lieferantenAdressen","IDNR", merchantId, "Firma") & "&Folder=Lieferanten&URL=../merchantPage.asp?merchantId=" &  merchantId
butArrMerch(3,2) = "#Filialen"
call drawWindowPart1Merchant("Händler Information"," ","", butArrMerch)
%>
<center>


<table cellspacing=0 cellpadding=5 border=0 width="600">
<tr><td colspan="2" width="288"><p align="center"> <%=makeMerchantView(merchantId)%></td></tr>
<tr><td width="53">Adresse:</td><td width="223" rowspan="4">    
    <% call printAddressLieferanten(merchantId)%>
    </td><td width="5" rowspan="7" style="border-left: 1 solid #C0C0C0" bordercolor="#A0A0A0">&nbsp;</td><td width="34">Tel:</td><td width="133"><%=rsM("Tel")%></td></tr>
<tr><td width="53"></td><td width="34">Tel2:</td><td width="133"><%=rsM("Tel2")%></td></tr>
<tr><td width="53"></td><td width="34">Fax:</td><td width="133"><%=rsM("Fax")%></td></tr>
<tr><td width="53"></td><td width="34">Fax2:</td><td width="133"><%=rsM("Fax2")%></td></tr>
<tr><td width="276" colspan="2">
    <hr width="300" size="1" color="#A0A0A0" align="center">
  </td><td width="34">Mobil:</td><td width="133"><%=rsM("Mobil")%></td></tr>
<tr><td width="53">Email:</td><td width="223"><a href="mailto:<%=rsM("Email")%>"><%=rsM("Email")%></a></td><td width="112"></td><td width="165"></td></tr>
<tr><td width="53">Web:</td><td width="223">
<a href="<%="merchantPage.asp?merchantId=" & merchantId & "&MERCHANT_HOME="&rsM("Web")%>"><%=rsM("Web")%></a></td>
<td width="112"></td><td width="165"></td></tr>
</table>
</center>


<%call drawWindowPart2Merchant("Händler Information"," ","",butArrMerch)%>



	<table width="800" border="0">
	<tr>
	<td height="16" bgcolor="#F7F7F7">Spezifische Informationen</td>
	</tr>
	</table>
<%
'dim butArr1(0,0)
'call drawWindowPart1("Spezifische Informationen"," ","",butArr1)
%>
<div align="center">
  <center>
			<table border=0 cellspacing=0 cellpadding=0 width="600">
			<% 
			dim merch: merch = merchantId
		    dim rsZ, check
			sql = " SELECT delivery, deliveryPrice FROM priceCompareHaendler WHERE LieferantNr=" & merch
			'response.Write sql: response.flush
			set rsM = objConnectionExecute(sql)
			%>
			<tr><td align=right width="50%"><b>Lieferungdienst</b></td>
			<td align=center width="50%">
			<%If rsM("delivery") = true Then %><img src="cgi/priceCompare/images/check-ja.gif"><%else%><img src="cgi/priceCompare/images/check-nein.gif"><%End If%> 
			</td></tr>
			<tr><td align=right width="50%"><b>Preis per Lieferung (€)</b></td><td align=center width="50%"> 
			<%if isNumeric(rsM("deliveryPrice")) then 
			 Response.Write "€ " &  formatnumber(rsM("deliveryPrice"),2)
			else 
			 Response.Write rsM("deliveryPrice")
			end if 
			%></td></tr>
			
			
			
			<!-- Zahlungsbedingungen -->
			<tr><td colspan=2 align=left bgcolor=#F7F7F7><b> Zahlungsbedingungen</b></td></tr>
			<% 
			sql = " SELECT  * FROM grZahlungsbedingung "
			set rsM = objConnectionExecute(sql)
			while not rsM.EOF 
				sql = " SELECT * FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rsM("Nr") & " and IDNR= " & merch
				set rsZ = objConnectionExecute(sql)
				if rsZ.BOF and rsZ.EOF then	check = false else check = true	end if		
				%>
				<tr><td align=right width="50%"><b><%=rsM("Methode")%>:</b></td>
				<td align=center width="50%">
					<%If check = true Then %><img src="cgi/priceCompare/images/check-ja.gif"><%else%><img src="cgi/priceCompare/images/check-nein.gif">					<%End If%> 
				</td>
				</tr>
				<%rsM.MoveNext
			wend			
			%>
			
			
			<!-- Zahlungsmethoden -->
			<tr><td colspan=2 align=left bgcolor=#F7F7F7><b> Zahlungsbedingungen - Abholung </b></td></tr>
			<%
			sql = " SELECT * FROM grZahlungsmethode "
			set rsM = objConnectionExecute(sql)
			while not rsM.EOF 
				sql = " SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] WHERE methode='" & rsM("methode") & "' and IDNR= " & merch
				set rsZ = objConnectionExecute(sql)
				if rsZ.BOF and rsZ.EOF then	check = false else check = true	end if		
				%>
				<tr><td align=right width="50%"><b><%=rsM("Methode")%>:</b></td>
				<td align=center width="50%">
				   <%If check = true Then %><img src="cgi/priceCompare/images/check-ja.gif">	<%else%><img src="cgi/priceCompare/images/check-nein.gif">					<%End If%> 
				</td>
				</tr><%
				rsM.MoveNext
			wend
			rsZ.close
			set rsZ = nothing	
			%>

			
			<!-- Lieferungsmethoden -->
			<tr><td colspan=2 align=left bgcolor=#F7F7F7><b> Lieferungsmethoden</b></td></tr>
			<% 
			sql = " SELECT  * FROM grLieferungbedingungen"
			set rsM = objConnectionExecute(sql)
			while not rsM.EOF 
				sql = " SELECT * FROM [priceCompareHaendler_Lieferungbedingungen] WHERE BedingungNr= " & rsM("Nr") & " and IDNR= " & merch
				set rsZ = objConnectionExecute(sql)
				if rsZ.BOF and rsZ.EOF then	check = false else check = true	end if		
				%>
				<tr><td align=right width="50%"><b><%=rsM("Bedingung")%>:</b></td>
				<td align=center width="50%">
					<%If check = true Then %><img src="cgi/priceCompare/images/check-ja.gif"><%else%><img src="cgi/priceCompare/images/check-nein.gif">					<%End If%> 
				</td>
				</tr>
				<%rsM.MoveNext
			wend			
			%>
			
			
		    <!-- Services -->
			<tr><td colspan=2 align=left bgcolor=#F7F7F7><b> Serviceleistungen</b></td></tr>
			<% 
			sql = " SELECT  * FROM grServices"
			set rsM = objConnectionExecute(sql)
			while not rsM.EOF 
				sql = " SELECT * FROM [priceCompareHaendler_Services] WHERE ServiceNr= " & rsM("Nr") & " and IDNR= " & merch
				set rsZ = objConnectionExecute(sql)
				if rsZ.BOF and rsZ.EOF then	check = false else check = true	end if		
				%>
				<tr><td align=right width="50%"><b><%=rsM("Service")%>:</b></td>
				<td align=center width="50%">
					<%If check = true Then %><img src="cgi/priceCompare/images/check-ja.gif"><%else%><img src="cgi/priceCompare/images/check-nein.gif">					<%End If%> 
				</td>
				</tr>
				<%rsM.MoveNext
			wend			
			%>
  </table>
  </center>
 
<%
'call drawWindowPart2("Spezifische Informationen"," ","",butArr1)
%>

	<table width="800" border="0">
	<tr>
	<td height="16" bgcolor="#F7F7F7">Filialen</td>
	</tr>
	</table>
	
<a name="Filialen"></a>
<%
Dim butArr2(0,0)
'call drawWindowPart1("Filialen"," ","", butArr2)%>
<%
dim sqlFiliallen: sqlFiliallen = "select * from priceCompareHaendlerFilialen where LieferantNr =" & merchantId
Dim rsFil : set rsFil = objConnectionExecute(sqlFiliallen)

if rsFil.EOF then
 	%>

 	Dieser Lieferant hat keine Filialen eingetragen! 
 	<% 	
end if
%>
 
  <center>
<table width="600">
<%
Dim ik : ik = 0
			while not rsFil.EOF 
				%><tr>
				<td width="300">
				<% call printAddressLieferanten(rsFil("FilialeNr"))%>
				<hr>
				</td>
				<td width="300">
				<% if not rsFil.EOF then
						call printAddressLieferanten(rsFil("FilialeNr"))
						ik = ik + 1
						rsFil.movenext
				   end if 
				%>
				<hr>
				</td>
				</tr>
				<%
				if not rsFil.EOF then
					rsFil.movenext
					ik = ik + 1
				end if 
			wend
			rsFil.close
			%></table>
  </center>
 
<%
'call drawWindowPart2("Filialen"," ","", butArr2)
%>

</td>
</table>