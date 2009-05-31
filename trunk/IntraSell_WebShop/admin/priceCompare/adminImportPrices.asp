<!--#include file="../client/intrasoft/menu.asp"-->
<!--#include file="impex/functionsImpEx.asp"-->
<%
on error resume next 
const maxLinesToShow = 1000

Dim sql
Dim rs
Dim rsOther
Dim merch
Dim csValues
Dim rsImp
Dim IDtoDelete
Dim IDtoImport
Dim IDtoAdd
Dim liefID
Dim strSplit
Dim KatNr
Dim temp
merch = Request("merch")
katNr = request("KatNr")
if merch = "" then
	ReDim butArr(2,2)
	butArr(1,1) = "Get Preise"
	butArr(1,2) = "adminGetPrices.asp"
	butArr(2,1) = "Imported"
	butArr(2,2) = "adminImportedPrices.asp"
	call drawWindowPart1("Import Prices","","state",butArr)

	sql = "SELECT lieferantenAdressen.Firma, lieferantenAdressen.IDNR  FROM lieferantenAdressen " & _
		  "INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
	set rs = objConnection.Execute(sql)
	if rs.BOF and rs.EOF then ' no merchants 
	else
	  %>
	  <h1>Import open Prices ... </h1><%
		while not rs.EOF
			Response.Write "<a href=""adminImportPrices.asp?merch=" & rs("IDNR") & """><b>[Merchant: " & rs("Firma") & "]</b></a> " & _ 
			               "[Last Import: " & varValueMerchant(rs("IDNR"), "LAST_SUCCESSFULL_IMPORT") & "]<br>"
			rs.MoveNext
		wend
	end if	
else	
	IDtoDelete = Request("delID")
	IDtoImport = Request("impID")
	IDtoAdd = Request("addID")
	sql = "SELECT  Firma FROM lieferantenAdressen WHERE IDNR = " & merch
	set rs = objConnection.Execute(sql)
	merchname = rs("Firma")
	
	if IDtoAdd <> "" then
		ReDim butArr(2,2)
		butArr(1,1) = "Get Preise"
		butArr(1,2) = "adminGetPrices.asp"
		butArr(2,1) = "Cancel"
		butArr(2,2) = "adminImportPrices.asp?merch=" & merch
		call drawWindowPart1("Add New Produkt","","state",butArr)
		
		Response.Write "<form target=""_blank"" action=""adminImportPrices.asp?addId=" & IDtoAdd & "&KatNr=" & KatNr & "&merch=" & merch & """ method=""POST"" id=""AddForm"" name=""AddForm"">"
		Response.Write "<center><table border='0' width='80%'><tr><td colspan='4' align='right'>"
		'Response.Write "<a href=""adminImportPrices.asp?merch=" & merch & """ align=""right""><b>[ Back to Import Page ]"
		Response.Write "&nbsp;</b></a></td></tr></center>"
		if katNr <> "" then
			if request("AddButton") <> "" then 	' Add Button is pressed	
			  katNR = request("ArtKatNr") 
			  if katNR ="" then
			    Response.Write "Kategorie ist nicht ausgewählt!"
			  else 
			    katNr = left(KatNR, inStr(katNR,"->")-1) 
			  end if 
			  
			  
			  
				sql = "SELECT Line FROM priceComparePricesToImport WHERE LieferantNr = " & merch & " and ID = " & IDtoAdd
				set rsImp = ObjConnection.execute(SQL) 
				csValues = Split( rsImp("Line" ), ";" )
				Dim YesNo(3)
				Dim query1
				Dim query2
				
				if request("SetArtikel") = "Yes" then 
					YesNo(2) = 1
				else
					YesNo(2) = 0	
				end if
				if request("Seriennummer") = "Yes" then 
					YesNo(1) = 1
				else
					YesNo(1) = 0	
				end if	
				if request("LagerArtikel") = "Yes" then 
					YesNo(0) = 1
				else
					YesNo(0) = 0	
				end if
								
				
				Dim rtErrorDescription
				Dim internalArtNr: internalArtNr= request("ArtNr") 
				Session("MANUAL_IMPORT") = "TRUE"
				
				if importPriceLine(internalArtNr, csValues(0), csValues(2),  request("Beschreibung"), request("manifacturer"), request("MWST"), request("EKpreis"), request("Gewicht"), 1, _
			             request("EAN") , 0, 0, request("LagerInfo"), csValues(13), 0, request("Picture"), KatNR, "", merch, TRUE, rtErrorDescription) then 
			    
			       Response.Write "Import was okay!"
			    else 
			       Response.Write "Error happended: " & rtErrorDescription
			    end if        
			    Session("MANUAL_IMPORT") = ""  
				 Response.End 
				'Response.Redirect "adminImportPrices.asp?merch=" & merch
			else	
				Response.Write "<tr align='center'><td colspan='4'><h2>Add new produkt/price</h2></td></tr>"
				
				Response.Write "<tr><td align='right'>Als neuer Preis zu ArtNr:</td><td align='left'><input name='ArtNr' width=""10"">(nicht pflicht)</td></tr>" 
				
				Response.Write "<tr><td align='right' height='22'>* Category:</td><td align='left'>" 
				call query2List("Select ArtKAtNr, ( '->' + CatName) as Cat from viewCategoriesWithPath","ArtKatNr")
				
				if  KAtNR <> "" then 
				  Response.Write " <b>" & TABLEVALUE("[grArtikel-Kategorien]","ArtKatNr",KAtNR,"Name") &"</b>"
				else 
				  Response.Write "Gewünschte Kategorie:" & KAtNR
				end if 
				Response.Write  "</td>" 	
				
				sql = "SELECT Line FROM priceComparePricesToImport WHERE LieferantNr = " & merch & " and ID = " & IDtoAdd
				set rsImp = ObjConnection.execute(SQL) 
				csValues = Split( rsImp("Line" ), ";" )
				
					
				Response.Write "<tr><td align='right'>* Produktbezeichnung:</td><td align='left'><input name='Bezeichnung' style='width:150' value='" & csValues(2) &  "'></td></tr>" 	
				Response.Write "<tr><td align='right'>* EAN:</td><td><input name='EAN' style='width:150' value='" & csValues(9) &  "'></td>"
				Response.Write "<td align='right'>Barcode:</td><td><input name='Barcode' style='width:150'></td></tr>"
				Response.Write "<td align='right'>Lager Info:</td><td><input name='LagerInfo' style='width:150' value='" & csValues(12) &  "'></td>"
				Response.Write "<td align='right' rowspan='3' id=form1 name=form1>Beschreibung:</td>"
				Response.Write "<td rowspan='3'><textarea name='Beschreibung' cols=30 rows=5>" & csValues(3) & "</textarea></td></tr>"
				Response.Write "<tr><td align='right'>Einheit:</td><td><input name='Einheit' style='width:150' value='" & csValues(13) & "'></td></tr>"
				Response.Write "<tr><td align='right'>Manifacturer (name oder interne Nummer):</td>"
				sql = "SELECT IDNR, Name FROM lieferantenAdressen WHERE IDNR = " & merch' csValues(4)
				set rsOther = objConnection.Execute(sql)
				if rsOther.EOF and rsOther.BOF then ' no such manufacturer !
					Response.Write "<td align='left'><input name='manifacturer' style='width:150'></td>>"
				else	
					Response.Write "<input type='hidden' name='manifacturer' value='" & rsOther("IDNR") & "'>"
					Response.Write "<td align='left'><b>" & rsOther("Name") & "</b></td>"
				end if	
				'Response.Write "<tr><td align='right'>PreisEuro:</td><td><input name='PreisEuro' style='width:150'></td></tr>"
				Response.Write "<tr><td align='right'>* EKPreis:</td><td><input name='EKPreis' style='width:150' value='" & csValues(6) &"'></td>"
				Response.Write "<td align='right'>LagerArtikel:</td>"
				Response.Write "<td align='left'><INPUT TYPE='Radio' NAME='LagerArtikel' VALUE='Yes' CHECKED >Yes"
				Response.Write "<INPUT TYPE='Radio' NAME='LagerArtikel' VALUE='No'>No</td></tr>"
				Response.Write "<tr><td align='right'>* LEKPreis:</td><td><input name='LEKPreis' style='width:150' value='" & csValues(6) &"'></td>"
				Response.Write "<td align='right'>Seriennummer:</td>"
				Response.Write "<td align='left'><INPUT TYPE='Radio' NAME='Seriennummer' VALUE='Yes' CHECKED >Yes"
				Response.Write "<INPUT TYPE='Radio' NAME='Seriennummer' VALUE='No'>No</td></tr>"
				Response.Write "<tr><td align='right'>MWST:</td><td><input name='MWST' style='width:150' value='" & csValues(5) &"'></td>"
				Response.Write "<td align='right'>SetArtikel:</td>"
				Response.Write "<td align='left'><INPUT TYPE='Radio' NAME='SetArtikel' VALUE='Yes' CHECKED >Yes"
				Response.Write "<INPUT TYPE='Radio' NAME='SetArtikel' VALUE='No'>No</td></tr>"
				Response.Write "<tr><td align='right'>Gewicht:</td><td><input name='Gewicht' style='width:150' value='" & csValues(7) &"'></td>"
				Response.Write "<td align='right'>Picture:</td><td><input name='Picture' style='width:150' value='" & csValues(15) & "'></td></tr>"
				Response.Write "<tr><td align='center' colspan='4'>&nbsp;</td></tr><tr>"
				Response.Write "<td align='center' colspan='2'><input type='submit' value='Add Produkt' id='AddProductButton' name='AddButton'></td>"
				Response.Write "<td align='right' colspan='2'>&nbsp;</td></tr></table><br>"
				rsImp.close
				set rsImp = nothing
			end if	
		else ' choose category  ? REMOVE IT LATER ?
			Response.Write "<tr align='center'><td><h2>Choose a category for the produkt:</h2></td></tr><tr><td align='left'>"
			sql = "SELECT  ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] " & _
			      " WHERE ArtKatNrParent = -1" 
			      
			set rsOther = objConnection.Execute(sql)
			qString = "&addId=" & IDtoAdd & "&merch=" & merch
			While not rsOther.EOF
				DisplayCategory rsOther("Name"), 0, rsOther("ArtKatNr"), qString, "adminImportPrices.asp"
				GetSubCategories rsOther("ArtKatNr"), 1, qString, "adminImportPrices.asp"
				rsOther.MoveNext
			wend
			Response.Write "</td></tr></table>"
			rsOther.close
			set rsOther = nothing
		end if
		Response.Write "</form>"
		call drawWindowPart2("Import Prices","","state",butArr)
		Response.End
	end if		

	
	
	Response.Write "<form target=""_blank"" action=""adminImportPrices.asp?merch=" & merch & """ method=""post"" id=""form1"" name=""form1"">"

	if IDtoDelete <> "" then
		if IDtoDelete = "all" then  'delete all
			SQL = "DELETE FROM priceComparePricesToImport WHERE LieferantNr = " & merch	
			ObjConnection.execute(SQL) 
		else ' delete only one 
			SQL = "DELETE FROM priceComparePricesToImport WHERE ID = " & IDtoDelete
			ObjConnection.execute(SQL) 
		end if	
	end if	
	
	if IDtoImport <> "" then
		if IDtoImport = "all" then  'import all
			sql = "SELECT Line FROM priceComparePricesToImport WHERE LieferantNr = " & merch 
			set rsImp = ObjConnection.execute(SQL) 
			csValues = Split( rsImp("Line" ), ";" )
			SQL = "SELECT * FROM priceComparePricesToImport WHERE LieferantNr = " & merch
			set rsImp = ObjConnection.execute(SQL) 
			
			while not rsImp.EOF
				csValues = Split( rsImp("Line" ), ";" )
				sql = "Select * FROM grArtikel	WHERE Bezeichnung LIKE '" & csValues(2) & "'"
				set rsOther = objConnection.Execute(sql)			
				if rsOther.EOF and rsOther.BOF then ' Not in the database
				else
					'sql = "Select ArtNr FROM grArtikel	WHERE Bezeichnung LIKE '" & csValues(2) & "'"
					'Set rsOther = objConnection.Execute(sql)			
					if rsOther("bezeichnung1") = "" or rsOther("preisATS") = 0 then  ' first merchant with such produkt
						sql = "UPDATE grArtikel set bezeichnung1 = '" & csValues(12) & _
							  "', preisATS = " & csValues(6) & ", preisEuro = " & csValues(6) & _
							  " WHERE ArtNr = " & rsOther("ArtNr")
						ObjConnection.execute(sql) 		
					else	
						if rsOther("preisATS") > rsImp("EKPreis") then
							sql = "UPDATE grArtikel set bezeichnung1 = '" & csValues(12) & _
								  "', preisATS = " & csValues(6) & ", preisEuro = " & csValues(6) & _
								  " WHERE ArtNr = " & rsOther("ArtNr")
							ObjConnection.execute(sql) 		
						end if	
					end if	
			
					sql = "INSERT INTO [lieferantenArtikel-Preise] " & _
						  "(PreisId, LieferantNr, ArtikelNr, ArtikelNrLieferant, " & _
						  " EKPreis, VKPreis, PreisDatum, bezeichnung, lagerInfo, bestellmenge ) " & _
						  " Values(" & NextId("[lieferantenArtikel-Preise]","PreisId") & ", " & merch & _
						  "," & rsOther("ArtNr") & "," & csValues(0) & "," & csValues(6) & "," & csValues(6)& _
						  ",'" & GermanSQLDate( rsImp("FromDate")) & "','" & csValues(3) & "','" & _
						  csValues(12) & "'," & csValues(8) & ")"	
					ObjConnection.execute(sql) 
					sql = "DELETE FROM priceComparePricesToImport WHERE ID = " & rsImp("ID") 
					ObjConnection.execute(SQL) 
				end if	
				rsImp.MoveNext
			wend
			Response.Write "<h4><b><font color='green'>All Prices were imported successfuly !</font></b></h4><BR>"
		else ' import only one 
		  
		   Response.Write "Import One!" 
			SQL = "SELECT priceComparePricesToImport.*  FROM priceComparePricesToImport WHERE LieferantNr = " & merch & " and ID = " & IDtoImport
			set rsImp = ObjConnection.execute(SQL) 
			csValues = Split( rsImp("Line") , ";" ) 
			
			sql = "Select * FROM grArtikel	WHERE Bezeichnung LIKE '" & csValues(2) & "'"
			Set rsOther = objConnection.Execute(sql)			
			if rsOther("bezeichnung1") = "" or rsOther("preisATS") = 0 then  ' first merchant with such produkt
				sql = "UPDATE grArtikel set bezeichnung1 = '" & csValues(12) & _
					  "', preisATS = " & csValues(6) & ", preisEuro = " & csValues(6) & _
					  " WHERE ArtNr = " & rsOther("ArtNr")
				ObjConnection.execute(sql) 		
			else	
				if rsOther("preisATS") > csValues(6) then
					sql = "UPDATE grArtikel set bezeichnung1 = '" & csValues(12) & _
						  "', preisATS = " & csValues(6) & ", preisEuro = " & csValues(6) & _
						  " WHERE ArtNr = " & rsOther("ArtNr")
					ObjConnection.execute(sql) 		
				end if	
			end if	
			
			sql = "INSERT INTO [lieferantenArtikel-Preise] " & _
						  "(LieferantNr, ArtikelNr, ArtikelNrLieferant, " & _
						  " EKPreis, VKPreis, bezeichnung, lagerInfo, bestellmenge ) " & _
						  " Values(" & merch & _
						  "," & rsOther("ArtNr") & "," & csValues(0) & "," & csValues(6) & "," & csValues(6)& _
						  ",'" & csValues(3) & "','" & _
						  csValues(12) & "'," & csValues(8) & ")"	
			'Response.Write sql
			ObjConnection.execute(sql) 
			Response.Write "<h4><b><font color='green'>Price for produkt <i>" & csValues(2) & " was imported successfuly !</font></b></h4><BR>"			
			sql = "DELETE FROM priceComparePricesToImport WHERE ID = " & rsImp("ID") 
			ObjConnection.execute(SQL) 
		end if
		'rsOther.close
		'set rsOther = nothing	
	end if	
	
	

	SQL = "SELECT * FROM priceComparePricesToImport WHERE LieferantNr = " & merch '& " and State Like 'New'"	
	set rsImp = ObjConnection.execute(SQL) 
	if rsImp.BOF and rsImp.EOF then ' nothing to import
		ReDim butArr(1,2)
		butArr(1,1) = "Get Preise"
		butArr(1,2) = "adminGetPrices.asp"
		call drawWindowPart1("Import Prices","","state",butArr)
		Response.Write "<h2>There is nothing to import for merchant:&nbsp;" & merchname & "</h2>"
	else
		ReDim butArr(4,2)
		butArr(4,1) = "See Imported"
		butArr(4,2) = "adminImportedPrices.asp?merch=" & merch
		butArr(1,1) = "Import All"
		butArr(1,2) = "adminImportPrices.asp?impID=all&merch=" & merch
		butArr(2,1) = "Delete All"
		butArr(2,2) = "adminImportPrices.asp?delID=all&merch=" & merch
		butArr(3,1) = "Merchant's List"
		butArr(3,2) = "adminImportPrices.asp"
		call drawWindowPart1("Import Prices","","state",butArr)
	
	%><h2>Not imported Prices of&nbsp; <%=merchname%></h2>
	<table border="1" width="100%" height="21">
	  <tr>
	    <th align="center" colspan="3">&nbsp;</th>
	    <th align="center">Name</th>
	    <th align="center">Preis</th>
	    <th align="center">Seit</th>
	    <th align="center">Error</th>
	  </tr> 
	  <%

	  dim i : i = 0
	  while not rsImp.EOF and i < maxLinesToShow
	        i = i + 1 
	        dim line: line = rsImp("Line" )
			csValues = Split(line , ";" )
			Response.Write "<tr>" '"<td>"
			sql = "Select ArtNr FROM grArtikel	WHERE Bezeichnung LIKE '" & csValues(2) & "'"
			Set rsOther = objConnection.Execute(sql)			
			if rsOther.EOF and rsOther.BOF then ' Not in the database
				Response.Write "<td>[Import]</td>"
				Response.Write "<td><a href=""adminImportPrices.asp?delID=" & rsImp("ID") & "&merch=" & merch & """><b>[Delete]</b></a></td>"
				Response.Write "<td><a href=""adminImportPrices.asp?addID=" & rsImp("ID") & "&merch=" & merch 
				if csValues(1) <> "" then
					Response.Write "&KatNr=" & csValues(1)
				end if	
				Response.Write """><b>[Add to Database]</b></a></td>"
			else	
				Response.Write "<td><a href=""adminImportPrices.asp?impID=" & rsImp("ID") & "&merch=" & merch & """><b>[Import]</b></a></td>"
				Response.Write "<td><a href=""adminImportPrices.asp?delID=" & rsImp("ID") & "&merch=" & merch & """><b>[Delete]</b></a></td>"
				Response.Write "<td>&nbsp;</td>"
			end if	
			'Response.Write "FUCK :" & csValues(6) & "<BR>"
			Response.Write "<td>" &  line& "</td>"
			'Response.Write "<td>" & csValues(2) & "</td>"
			Response.Write "<td align=""right"">" & FormatNumber(csValues(6),2) & "</td>"
			Response.Write "<td>" & rsImp("FromDate") & "</td>"
			Response.Write "<td>" & rsImp("Error") & "</td></tr>"
			rsImp.MoveNext
			Response.Flush
		wend
	if i >= maxLinesToShow then	response.write "<font color=red>There are more prices... only the first " & maxLinesToShow & " are shown!</font>"
	
	Response.Write "</table></form>"
	rsOther.close
	set rsOther = nothing	
	rsImp.close
	set rsImp = nothing 
end if
end if 
rs.close
set rs = nothing 
call drawWindowPart2("Import Prices","","state",butArr)
%>
