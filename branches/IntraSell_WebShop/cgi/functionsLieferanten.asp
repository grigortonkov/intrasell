<%
'*************************************************************************
' printAddress
' addressType = "LI","AR", "" basis
' showMessages BOOLEAN
'*************************************************************************
function printAddressLieferant(byval idnr) 
	Dim rsKUND
	Dim sql
	Dim html 
	Dim message: message= ""

	sql = "Select * from lieferantenAdressen where IDNR=" & idnr
	set rsKUND = objConnectionExecute(sql)

	'Response.Write showMessages
	if rsKUND.EOF then 
		printAddressLieferant = "Error": exit function 
	end if 

	Dim PLZ, Ort, Landname
	PLZ = TableValue("grPLZ","IDNR", rsKUND ("PLZ"), "PLZ")
	Ort = TableValue("grPLZ","IDNR", rsKUND ("PLZ"), "Ort")
	LandName = TableValue("grLand","IdNr", rsKUND ("Land"), "Name")

					html = ""
					if trim(rsKUND("Firma")) <> "" then
					html = html & rsKUND("Firma") & "<br>"
					end if
					html = html & rsKUND ("Anrede") & " " & rsKUND ("Name1") & " " & rsKUND ("Name") & "<br>"
					html = html & rsKUND ("Adresse") & " <br>"
					html = html & PLZ & "-" & Ort & " <br>"
					html = html & LandName & " <br>"
					html = html & "Mobil:" & rsKUND ("Mobil") & " <br>"
					html = html & "Tel:" & rsKUND ("Tel") & " <br>"
					html = html & "Fax:" & rsKUND ("Fax") & " <br>"
					html = html & "Email:<a href='mailto:" & rsKUND ("Email") & "'>" & rsKUND ("Email") & "</a><br>"
					html = html & "Web:<a href='" & rsKUND ("Web")& "'>" & rsKUND ("Web") & "</a><br>"

	printAddressLieferant = html
end function

'===============================================================================
' creates list with all lieferants of the products in the database 
' additional parameter
' branche

sub makeMerchantManufacturerList(showHersteller)
'add parameter 
 Dim branche: branche = request("branche") 
 'response.Write "branche =" & branche
 Dim nurAktiveProdukteZeigen: nurAktiveProdukteZeigen = true 


dim sql, rs 
if showHersteller then 
		sql = "SELECT IDNR, Firma, Web, Count(ArtNr) AS [ProduktAnzahl] " & _ 
		"FROM grArtikel INNER JOIN lieferantenAdressen ON grArtikel.herstellerNR = lieferantenAdressen.IDNR " & _ 
		"where " & DEFAULT_PRODUCT_SEARCH_WHERE
 
else 
		sql = "SELECT IDNR, Firma, Web, Count(grArtikel.ArtNr) AS [ProduktAnzahl] " & _ 
		" FROM grArtikel, lieferantenAdressen, [lieferantenArtikel-Preise] " & _ 
		" WHERE  grArtikel.artNR = [lieferantenArtikel-Preise].ArtikelNr " & _ 
		" AND lieferantenAdressen.IDNR = [lieferantenArtikel-Preise].LieferantNr " & _ 
		" AND IDNR in (select lieferantNr from pricecomparehaendler where isActive=-1) " & _ 
		" AND " & DEFAULT_PRODUCT_SEARCH_WHERE

end if 
		
		
if IsNumeric(branche&"") then 
		if showHersteller then 
			sql = sql & " AND herstellerNr in (select idnr from ofAdressen where branche=" & branche & ")" 
		else
			sql = sql & " AND lieferantenNr in (select idnr from ofAdressen where branche=" & branche & ")" 
		end if 
 end if 	
		
		
		sql = sql & " GROUP BY IDNR, Firma, Web " & _ 
		" HAVING (Count(ArtNr))>0 " & _ 
		" ORDER BY Firma"
		
   set rs = objConnectionExecute(sql)      
  %>
<table width="100%" border="0" cellspacing="0" cellpadding="3" ID="Table1">
<tr bgcolor=#dddddd>
<th width="200"><%if showHersteller then response.Write getTranslation("Hersteller") else response.Write getTranslation("H&auml;ndler")%></th>
<th width="100"><%=getTranslation("Produktanzahl")%></th>
<th width="200"><%=getTranslation("Aktion")%></th>
<th><%=getTranslation("Webadresse")%></th>
</tr>
<%
Dim rowColor
while not rs.EOF 
if rowColor = "#F7F7F7" then
	rowColor = "#FFFFFF" 
else
	rowColor = "#F7F7F7"
end if 
%>
<tr>
<td bgcolor="<%=rowColor%>">
<%if showHersteller then 
   Response.write makeManufacturerView(rs("idnr"))
else 'Lieferant
   Response.write makeMerchantView(rs("idnr"),"")
end if
%>
</td>
<td bgcolor="<%=rowColor%>"><p align="right"><%=rs("Produktanzahl")%></td> 
<td bgcolor="<%=rowColor%>"><a href="default.asp?pageToShow=<%=iff(showHersteller,"Manufacturer","Merchant")%>Products&idnr=<%=rs("IdNR")%>">[<%=getTranslation("als Ergebnisliste")%>]</a> oder
<br><a href="default.asp?pageToShow=ProductMap&<%=iff(showHersteller,"Manufacturer","Merchant")%>=<%=rs("Firma")%>">[<%=getTranslation("in Kategoriebaum")%>]</a></p></td>
<td bgcolor="<%=rowColor%>"><p align="center"><a href="<%=rs("Web")%>"><%=rs("Web")%></p></td>
</tr>
<%
rs.MoveNext 
WEND
rs.close 
%>
</table>
<%
end sub 


%>