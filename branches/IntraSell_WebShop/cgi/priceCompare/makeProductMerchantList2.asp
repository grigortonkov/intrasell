<%
function makeProductMechantList(byval ArtNr)
  Dim html 
   
  html = "<!--Das ist die Liste aller Lieferer dieses Produktes, wobei der Preis nicht immer das entscheidende Kriterium ist.-->"
  'html = html & "<h3>Händler, die dieses Produkt führen</h3>"

  Dim sqlL, rsL
  Dim OrderBy: OrderBy = Request("OrderBy"): if OrderBy= "" then OrderBy = "VKPreis"
  'Dim artNR: ArtNR = request("ArtNr"): 
  if ArtNR="" then ArtNR= "0"
    
  sqlL = " SELECT grArtikel.ArtNr, grArtikel.EAN, grArtikel.Barcode, grArtikel.Bezeichnung, " & _ 
         " PreisId, [lieferantenArtikel-Preise].LieferantNr, " & _ 
         " [lieferantenArtikel-Preise].ArtikelNrLieferant, " & _ 
         " [lieferantenArtikel-Preise].VKPreis, [lieferantenArtikel-Preise].Rabatt, PreisDatum, " & _ 
         " Lagerinfo, Bestellmenge, Prioritaet, Firma, Stars, deliveryPrice " & _ 
         " FROM lieferantenAdressen, grArtikel, [lieferantenArtikel-Preise], priceCompareHaendler " & _ 
		 " WHERE ArtNr = " & ArtNR & " " & _ 
		 " AND grArtikel.ArtNr = [lieferantenArtikel-Preise].ArtikelNr " & _ 
		 " AND lieferantenAdressen.IDNR = [lieferantenArtikel-Preise].LieferantNr " & _ 
		 " AND lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNR " & _ 
		 " ORDER BY " & OrderBy
    
   'response.write sqlL: response.flush  
   set rsL = objConnectionExecute(sqlL)      
 
html = html & "<table width='100%' border='0' cellspacing='0' cellpadding='3'>"
html = html & "<tr>"
html = html & "<th width='220'><a href='default.asp?ArtNr=" & ArtNr & "&amp;OrderBy=Firma'>Shop</a></th>"
html = html & "<th width='250'><a href='default.asp?ArtNr=" & ArtNr & "&amp;OrderBy=Stars'>Shop-Bewertung</a></th>"
html = html & "<th width='100'><a href='default.asp?ArtNr=" & ArtNr & "&amp;OrderBy=VKPreis'>Preis</a>&nbsp;&nbsp;<br>/inkl. MWST/<br>"
html = html & "<th width='100'><a href='default.asp?ArtNr=" & ArtNr & "&amp;OrderBy=LagerInfo'>Verfügbarkeit</a></th>"
html = html & "<th width='300'>Zahlungs- &amp; Lieferungsmethoden</th>"
'<!--<th width='100' style='border-bottom: 2 solid #C0C0C0'><a href='merchantCompare.asp?ArtNr=" & ArtNr & "&amp;OrderBy=ArtikelNrLieferant'> Nummer</a>&nbsp;<br>des Lieferantes</th>-->
html = html & "<th width='100'>Zum Shop</th>"
html = html & "</tr>"

Dim rowColor
if rsL.EOF then 
  call drawErrorBox("Keine Preise vorhanden", "Zur Zeit sind keine Lieferanten für deises Produkt vorhanden! " & _ 
                    " Es kann sein, dass kein Händler das Produkt liefert, oder das Produkt neu in die Datenbank eingefügt wurde!", "", "")
end if 

Dim lieferantNr
while not rsL.EOF 
lieferantNr = rsL("LieferantNR")
		if rowColor = "#F7F7F7" then 
			rowColor = "#FFFFFF" 
		else
			rowColor = "#F7F7F7"
		end if 

		html = html & "<tr>"
				html = html & "<td bgcolor=""" & rowColor & """>"
				html = html & makeMerchantView(lieferantNr)
				html = html & "</td>"
				
				html = html & "<td bgcolor=""" & rowColor & """>"
				html = html & makeMerchantViewBewertung(lieferantNr) '"<p align=""center"">" & rsL("Bezeichnung") & "</p>"
				html = html & "</td>"
				
				html = html & "<td bgcolor=""" & rowColor & """>"
				html = html & "<p align=""right"" bgcolor=""" & rowColor & """>" & formatnumber(rsL("VKPreis"),2) & " €</p>"
				html = html & "</td>"
				
				html = html & "<td bgcolor=""" & rowColor & """>"
				html = html & "<p align=""center"">" & rsL("LagerInfo") & "</p>"
				html = html & "</td>"
						
				html = html & "<td bgcolor=""" & rowColor & """>"
				html = html & listPaymentMethods(LieferantNR)
				html = html & "<br>" & listDeliveryMethods(lieferantNr)
				html = html & "<br>" & rsL("deliveryPrice")
				html = html & "</td>"
				
				'<!--<td width="144" bgcolor="" & rowColor & "">
				'<p align="center">rsL("ArtikelNrLieferant")</p>
				'</td>-->
				
				Dim zumShopLink: zumShopLink = "cgi/priceCompare/buyFromMerchant.asp?LieferantNr=" & lieferantNr & "&ArtNr=" & ArtNr & "&ArtikelNrLieferant=" & rsL("ArtikelNrLieferant") 
				Dim altShopLink: altShopLink = "zum Shop - " & rsL("Firma")
				html = html & "<td bgcolor=""" & rowColor & """>"
				html = html & "<p align=""center""><a target=""_new"" href=""" & zumShopLink &  """>" 
				html = html & "<img border=""0"" src=""" & imageFullName("buy.gif") & """ alt=""" & altShopLink & """></a></p>"
				html = html & "</td>"
		
		html = html & "</tr>"
		 
		rsL.MoveNext 
WEND
html = html & "</table>"
rsL.Close
makeProductMechantList = html
end function
%>
