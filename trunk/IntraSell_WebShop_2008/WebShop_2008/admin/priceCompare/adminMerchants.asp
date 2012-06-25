<!--#include file="../client/intrasoft/menu.aspx"-->
<SCRIPT LANGUAGE="JavaScript">
function doSubmit( m ) {
	document.forms("Starsform").item("merch").value = m  ;
	document.forms("Starsform").submit() ;	
}
</SCRIPT>
<%

ReDim butArr(4,2)
Dim sql
Dim rs
Dim rsFil
Dim merchname
Dim edit
Dim stars
Dim count
edit = Request("Edit")
Dim qString 
if edit <> "" then
	qString = "?edit=" & edit
else
	qString = ""
end if	
Dim merch
merch = request("merch")
Select case edit
	case "stars"
		butArr(1,1) = "Profile"
		butArr(1,2) = "adminMerchants.aspx?edit=Profile"
		butArr(2,1) = "Einstellungen"
		butArr(2,2) = "adminMerchants.aspx?edit=Payments"
		butArr(3,1) = "FTP settings"
		butArr(3,2) = "adminMerchants.aspx?edit=ftp"
		call drawWindowPart1("Admin Merchants Stars","","state",butArr)
	case "Profile"
		butArr(1,1) = "Einstellungen"
		butArr(1,2) = "adminMerchants.aspx?edit=Payments&merch=" & merch
		butArr(2,1) = "FTP settings"
		butArr(2,2) = "adminMerchants.aspx?edit=ftp&merch=" & merch
		butArr(3,1) = "Stars"
		butArr(3,2) = "adminMerchants.aspx?edit=stars"
		butArr(4,1) = "New Profile"
		butArr(4,2) = "adminMerchantsCreateNew.aspx"
		call drawWindowPart1("Admin Merchants Profile","","state",butArr)	
	case "Payments"
		butArr(1,1) = "Profile"
		butArr(1,2) = "adminMerchants.aspx?edit=Profile&merch=" & merch
		butArr(2,1) = "FTP settings"
		butArr(2,2) = "adminMerchants.aspx?edit=ftp&merch=" & merch
		butArr(3,1) = "Stars"
		butArr(3,2) = "adminMerchants.aspx?edit=stars"
		call drawWindowPart1("Admin Merchants Payment Settings","","state",butArr)	
	case "ftp"
		ReDim butArr(4,2)
		butArr(1,1) = "Profile"
		butArr(1,2) = "adminMerchants.aspx?edit=Profile&merch=" & merch
		butArr(2,1) = "Einstellungen"
		butArr(2,2) = "adminMerchants.aspx?edit=Payments&merch=" & merch
		butArr(3,1) = "Stars"
		butArr(3,2) = "adminMerchants.aspx?edit=stars"
		butArr(4,1) = "Get Prices"
		butArr(4,2) = "adminGetPrices.aspx?merch=" & merch
		
		call drawWindowPart1("Admin Merchants FTP Setting","","state",butArr)	
	end select	
		
if merch <> "" and edit="stars" then  ' edit=stars
	if merch <> "all" then
		stars = request("textStars"&merch)	
		sql = "UPDATE priceCompareHaendler set Stars = " & stars & " WHERE LieferantNr = " & merch
		ObjConnectionExecute(sql)
	else ' merch = all
		sql = " SELECT  lieferantenAdressen.* FROM lieferantenAdressen " & _
		      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
		set rs = ObjConnectionExecute(sql)
		While not rs.EOF
			stars = request( "textStars"& rs("IDNR") )	
			sql = "UPDATE priceCompareHaendler set Stars = " & stars & " WHERE LieferantNr = " & rs("IDNR")
			ObjConnectionExecute(sql)
			rs.MoveNext
		wend
	end if
	merch = ""
end if	

if merch = "" then		
	if edit <> "stars" then
		sql = " SELECT  lieferantenAdressen.* FROM lieferantenAdressen " & _
		      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
		set rs = ObjConnectionExecute(sql)
		Response.Write "<b> Select a merchant from the list : <b><br /> "
		While not rs.EOF
			Response.Write "&nbsp;&nbsp;&nbsp;<A href=""adminMerchants.aspx" & qString & "&merch=" & rs("IDNR") & """><b>" & rs("Firma") & "</b></a><br />"
			rs.MoveNext
		wend
	else ' edit = stars
		sql = " SELECT  lieferantenAdressen.*, priceCompareHaendler.Stars FROM lieferantenAdressen " & _
			  " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
		set rs = ObjConnectionExecute(sql)
		Response.Write "<form action=""adminMerchants.aspx?edit=stars"" method=""POST"" id='Starsform' name='Starsform'>" 
		Response.Write "<input type='hidden' name='merch'>"
		Response.Write "<center><table border='1' width='70%'>"
		Response.Write "<tr><td colspan='3' align='center'><b><h3>Edit merchant's stars</h3></b></td></tr>"
		if not rs.BOF and not rs.EOF then 
			Response.Write "<tr><td colspan='3' align='center'>"
			Response.Write "<input type='submit' value='Update All' name='UpdateAllButton' onclick=""doSubmit('all')""></td></tr>" 
			Response.Write "<tr><td colspan='3' align='center'>&nbsp;</td></tr>"
			while not rs.EOF 
				Response.Write "<tr><td width='60%' align='center'>&nbsp;&nbsp;&nbsp;" & rs("Firma") & "</td>"
				Response.Write "<td align='center' width='10%'><input name='textStars" & rs("IDNR") & "' type='text' value='" & rs("Stars") & "'></td>"
				Response.Write "<td align='center'><input type='submit' value='Update' name='UpdateButton' onclick=""doSubmit(" & rs("IDNR") & ")""></td></tr>" 'Update" & rs("IDNR") & "'
				rs.MoveNext
			wend
			Response.Write "<tr><td colspan='3' align='center'>&nbsp;</td></tr>"
			Response.Write "<tr><td colspan='3' align='center'>"
			Response.Write "<input type='submit' value='Update All' name='UpdateAllButton' onclick=""doSubmit('all')""></td></tr>" 
		end if
		Response.Write"</table></center>"
	end if	
else ' merch <> ""
	if edit <> "stars" then
		Response.Write "<p align=""right""><a href=""adminMerchants.aspx" & qString & """><b> [ BACK TO MERCHANT'S LIST ] </b></a></p>"
		sql = " SELECT  Firma FROM lieferantenAdressen WHERE IDNR = " & merch 
		set rs = ObjConnectionExecute(sql)
		merchname = rs("Firma")
	
		Select case edit
			case "Profile" 
				if request("UpdateButton") <> "" then
					if request("Name") <> "" then
						sql = " UPDATE [lieferantenAdressen] set Name='" & request("Name") & "'"
						if request("Firma") <> "" then
							sql = sql & ", Firma = '" & request("Firma") & "'"
						end if	
						if request("Adresse") <> "" then
							sql = sql & ", Adresse = '" & request("Adresse") & "'"
						end if	
						if request("PLZ") <> "" then
							sql = sql & ", PLZ = " & request("PLZ")
						end if	
						if request("Land") <> "" then
							sql = sql & ", Land = " & request("Land")
						end if	
						if request("Branche") <> "" then
							sql = sql & ", Branche = " & request("Branche") 
						end if	
						if request("Briefanrede") <> "" then
							sql = sql & ", Briefanrede = '" & request("Briefanrede") & "'"
						end if	
						if request("Titel") <> "" then
							sql = sql & ", Titel = '" & request("Titel") & "'"
						end if	
						if request("Anrede") <> "" then
							sql = sql & ", Anrede = '" & request("Anrede") & "'"
						end if	
						if request("Tel") <> "" then
							sql = sql & ", Tel = '" & request("Tel") & "'"
						end if	
						if request("Tel2") <> "" then
							sql = sql & ", Tel2 = '" & request("Tel2") & "'"
						end if	
						if request("Fax") <> "" then
							sql = sql & ", Fax = '" & request("Fax") & "'"
						end if	
						if request("Fax2") <> "" then
							sql = sql & ", Fax2= '" & request("Fax2") & "'"
						end if	
						if request("Mobil") <> "" then
							sql = sql & ", Mobil = '" & request("Mobil") & "'"
						end if	
						if request("Email") <> "" then
							sql = sql & ", Email = '" & request("Email") & "'"
						end if	
						if request("Web") <> "" then
							sql = sql & ", Web = '" & request("Web") & "'"
						end if	
						sql = sql & " WHERE IDNR = " & merch
						ObjConnectionExecute(sql)
					else ' No name
						Response.Write " Name field can not be empty !<br /> "
					end if		
				end if
				if request("CreateFilialeButton") <> "" then
					if request("name") <> "" then
						sql = " INSERT INTO [lieferantenAdressen] ( IDNR, Name "
						sql1 = ""
						sql2 = ""
						if request("Firma") <> "" then
							sql1 = sql1 & ", Firma" 
							sql2 = sql2 & ",'" & request("Firma") & "'"
						end if	
						if request("Adresse") <> "" then
							sql1 = sql1 & ", Adresse" 
							sql2 = sql2 & ",'" & request("Adresse") & "'"
						end if	
						if request("PLZ") <> "" then
							sql1 = sql1 & ", PLZ" 
							sql2 = sql2 & "," & request("PLZ") 
						end if	
						if request("Land") <> "" then
							sql1 = sql1 & ", Land" 
							sql2 = sql2 & "," & request("Land")
						end if	
						if request("Branche") <> "" then
							sql1 = sql1 & ", Branche" 
							sql2 = sql2 & "," & request("Branche")
						end if	
						if request("Briefanrede") <> "" then
							sql1 = sql1 & ", Briefanrede" 
							sql2 = sql2 & ",'" & request("Briefanrede") & "'"
						end if	
						if request("Titel") <> "" then
							sql1 = sql1 & ", Titel" 
							sql2 = sql2 & ",'" & request("Titel") & "'"
						end if	
						if request("Anrede") <> "" then
							sql1 = sql1 & ", Anrede" 
							sql2 = sql2 & ",'" & request("Anrede") & "'"
						end if	
						if request("Tel") <> "" then
							sql1 = sql1 & ", Tel" 
							sql2 = sql2 & ",'" & request("Tel") & "'"
						end if	
						if request("Tel2") <> "" then
							sql1 = sql1 & ", Tel2" 
							sql2 = sql2 & ",'" & request("Tel2") & "'"
						end if	
						if request("Fax") <> "" then
							sql1 = sql1 & ", Fax" 
							sql2 = sql2 & ",'" & request("Fax") & "'"
						end if	
						if request("Fax2") <> "" then
							sql1 = sql1 & ", Fax2" 
							sql2 = sql2 & ",'" & request("Fax2") & "'"
						end if	
						if request("Mobil") <> "" then
							sql1 = sql1 & ", Mobil" 
							sql2 = sql2 & ",'" & request("Mobil") & "'"
						end if	
						if request("Email") <> "" then
							sql1 = sql1 & ", Email" 
							sql2 = sql2 & ",'" & request("Email") & "'"
						end if	
						if request("Web") <> "" then
							sql1 = sql1 & ", Web" 
							sql2 = sql2 & ",'" & request("Web") & "'"
						end if	
						count = NextId("lieferantenAdressen","IDNR")
						sql = sql & sql1 & ") Values ( " &  count
						sql = sql & ",'" & request("name") & "'" & sql2 & ")" 
						ObjConnectionExecute(sql)
						sql = "INSERT INTO priceCompareHaendlerFilialen ( ID, LieferantNr, FilialeNr )" & _
							  " Values ( " & NextId("priceCompareHaendlerFilialen","ID") & "," & merch & "," & count & ")"
						ObjConnectionExecute(sql)
					else ' No name
						Response.Write " Name field can not be empty !<br /> "
					end if		
				end if
				sql = "SELECT * FROM lieferantenAdressen WHERE IDNR = " & merch 
				set rs = ObjConnectionExecute(sql)
				Response.Write "<form action=""adminMerchants.aspx?edit=Profile&merch=" & merch & """ method=POST id='form1' name='form1'>"
				if request("CreateButton") <> "" then ' empty form for new filialen					
				%>				
					<h1><center>Create new Filiale for <%=merchname%></h1></center>
					<table height="60%" width="100%" align=center cellspacing=0 cellpadding=1 border=0>
					<tr>
						<td align="right">Firma:</td><td><input name="Firma" style="width:130"></td>
						<td align="right">Adresse:</td><td><input name="Adresse" style="width:130"></td>
						<td align="right">PLZ:</td><td><input name="PLZ" style="width:130"></td>
					</tr>
					<tr>
						<td align="right">Land:</td><td><select name="Land" style="width:130">
					<%
					sql = "SELECT * FROM grLand"
					set rsB = ObjConnectionExecute(sql)
					while not rsB.EOF 
						Response.Write "<option value=" & rsB("IdNr") & ">" & rsB("Name") & "</option>"
						rsB.MoveNext
					wend%>
					</td>
						<td align="right">Branche:</td><td><select name="Branche"  style="width:130">
					<%
					sql = "SELECT * FROM grBranchen"
					set rsB = ObjConnectionExecute(sql)
					while not rsB.EOF 
						Response.Write "<option value=" & rsB("BrNr") & ">" & rsB("Bezeichnung") & "</option>"
						rsB.MoveNext
					wend%>
						</td>
						<td align="right">Briefanrede:</td><td><input name="Briefanrede" style="width:130"></td>
					</tr>
					<tr>
						<td align="right">Titel:</td><td><input name="Titel" style="width:130"></td>
						<td align="right">Anrede:</td><td><select name="Anrede" style="width:130">
					<%
					sql = "SELECT * FROM grAnrede"
					set rsB = ObjConnectionExecute(sql)
					while not rsB.EOF 
						Response.Write "<option>" & rsB("Anrede") & "</option>"
						rsB.MoveNext
					wend
					rsB.close
					set rsB = nothing
					%>
						</td>
						<td align="right">Name:</td><td><input name="Name" style="width:130" ></td>
					</tr>
					<tr>
						<td align="right">Name1:</td><td><input name="Name1" style="width:130" ></td>
						<td align="right">Tel:</td><td><input name="Tel" style="width:130" ></td>
						<td align="right">Tel2:</td><td><input name="Tel2" style="width:130" ></td>
					</tr>
					<tr>
						<td align="right">Fax:</td><td><input name="Fax" style="width:130" ></td>
						<td align="right">Fax2:</td><td><input name="Fax2" style="width:130" ></td>
						<td align="right">Mobil:</td><td><input name="Mobil" style="width:130" ></td>
					</tr>
					<tr>
						<td align="right">Email:</td><td><input name="Email" style="width:130" ></td>
						<td align="right">Web URL:</td><td><input name="Web" style="width:130"></td>
						<td>&nbsp;</td>
					</tr>
					<tr>
					<td colspan='4' align='center'><br /><input type="submit" value="Create" id="Submit2" name="CreateFilialeButton"></td>
					<td colspan='2' align='center'><input type="submit" value="Cancel" id="Submit3" name="CancelButton"></td>
					</tr>
					</table>
				<%else
				if request("ChooseButton") <> "" then ' empty form for new filialen					
					sql = "SELECT IDNR, name, firma, adresse FROM lieferantenAdressen "
					set rsB = ObjConnectionExecute(sql)
					Response.Write "<h1><center>Choose a Filiale for " & merchname & "</h1></center>"
					Response.Write "<table width='80%' align=center cellspacing=0 cellpadding=1 border=1><tr>"
					Response.Write "<th>Name</th><th>Adresse</th>"
					while not rsB.EOF 
						Response.Write "<tr><td><b><a href=""adminMerchants.aspx?edit=Profile&merch=" & merch & "&filiale=" & rsB("IDNR") & """>" & rsB("Name") & "</b></a></td>"
						Response.Write "<td>" & rsB("Adresse") & "</td></tr>"
						rsB.MoveNext
					wend
					Response.Write "</table>"
					rsB.close
					set rsB = nothing
				else 
					count = Request.QueryString("filiale")
					if count <> "" then
						sql = "INSERT INTO priceCompareHaendlerFilialen ( ID, LieferantNr, FilialeNr )" & _
							  " Values ( " & NextId("priceCompareHaendlerFilialen","ID") & "," & merch & "," & count & ")"
						ObjConnectionExecute(sql)				
					end if
					count = Request.QueryString("delete")
					if count <> "" then
						sql = "DELETE FROM priceCompareHaendlerFilialen WHERE ID = " & count
						ObjConnectionExecute(sql)				
					end if		
					
					%>
				
				<h1><center>Profile Information for <%=merchname%></h1></center>

				<table height="60%" width="100%" align=center cellspacing=0 cellpadding=1 border=0>
				<tr>
					<td align="right">Firma:</td><td><input name="Firma"  style="width:130" value="<%=rs("Firma")%>"></td>
					<td align="right">Adresse:</td><td><input name="Adresse"  style="width:130" value="<%=rs("Adresse")%>"></td>
					<td align="right">PLZ:</td><td><input name="PLZ"  style="width:130" value="<%=rs("PLZ")%>"></td>
				</tr>
				<tr>
					<td align="right">Land:</td><td><select name="Land" style="width:130">
				<%
				sql = "SELECT * FROM grLand"
				set rsB = ObjConnectionExecute(sql)
				while not rsB.EOF 
					Response.Write "<option value=" & rsB("IdNr") 
					if rsB("IdNr")=rs("Land") then
						Response.Write " SELECTED "
					end if	
					Response.Write ">" & rsB("Name") & "</option>"
					rsB.MoveNext
				wend
				rsB.close
				set rsB = nothing
				%>
				</td>
					<td align="right">Branche:</td><td><select name="Branche"  style="width:130">
				<%
				sql = "SELECT * FROM grBranchen"
				set rsB = ObjConnectionExecute(sql)
				while not rsB.EOF 
					Response.Write "<option value=" & rsB("BrNr") 
					if rsB("BrNr")=rs("branche") then
						Response.Write " SELECTED "
					end if	
					Response.Write ">" & rsB("Bezeichnung") & "</option>"
					rsB.MoveNext
				wend
				rsB.close
				set rsB = nothing
				%>
					</td>
					<td align="right">Briefanrede:</td><td><input name="Briefanrede"  style="width:130" value="<%=rs("Briefanrede")%>"></td>
				</tr>
				<tr>
					<td align="right">Titel:</td><td><input name="Titel"  style="width:130" value="<%=rs("Titel")%>"></td>
					<td align="right">Anrede:</td><td><select name="Anrede"  style="width:130" value="<%=rs("Anrede")%>">
				<%
				sql = "SELECT * FROM grAnrede"
				set rsB = ObjConnectionExecute(sql)
				while not rsB.EOF 
					Response.Write "<option " 
					if rsB("Anrede")=rs("Anrede") then
						Response.Write " SELECTED "
					end if	
			
					Response.Write ">" & rsB("Anrede") & "</option>"
					rsB.MoveNext
				wend
				rsB.close
				set rsB = nothing
				%>
					</td>
					<td align="right">Name:</td><td><input name="Name"  style="width:130" value="<%=rs("Name")%>"></td>
				</tr>
				<tr>
					<td align="right">Name1:</td><td><input name="Name1"  style="width:130" value="<%=rs("Name1")%>"></td>
					<td align="right">Tel:</td><td><input name="Tel"  style="width:130" value="<%=rs("Tel")%>"></td>
					<td align="right">Tel2:</td><td><input name="Tel2"  style="width:130" value="<%=rs("Tel2")%>"></td>
				</tr>
				<tr>
					<td align="right">Fax:</td><td><input name="Fax"  style="width:130" value="<%=rs("Fax")%>"></td>
					<td align="right">Fax2:</td><td><input name="Fax2"  style="width:130" value="<%=rs("Fax2")%>"></td>
					<td align="right">Mobil:</td><td><input name="Mobil"  style="width:130" value="<%=rs("Mobil")%>"></td>
				</tr>
				<tr>
					<td align="right">Email:</td><td><input name="Email"  style="width:130" value="<%=rs("Email")%>"></td>
					<td align="right">Web URL:</td><td><input name="Web"  style="width:130" value="<%=rs("Web")%>"></td>
					<td>&nbsp;</td><td>&nbsp;</td>
				</tr>
				</table>
				<p align=center>
				<input type="submit" value="Update" id="Submit1" name="UpdateButton">
				<hr>
				<table width="80%" align=center cellspacing=0 cellpadding=1 border=0>
				<%
				sql = "SELECT priceCompareHaendlerFilialen.ID, lieferantenAdressen.name, lieferantenAdressen.adresse" & _
					  " FROM priceCompareHaendlerFilialen, lieferantenAdressen" & _ 
					  " WHERE priceCompareHaendlerFilialen.LieferantNr = " & merch & _
					  " and priceCompareHaendlerFilialen.FilialeNr = lieferantenAdressen.IDNR"
				set rsFil = ObjConnectionExecute(sql)
				if rsFil.EOF and rsFil.BOF then ' no filials
					Response.Write "<tr><td><b>Filialen:</b></td><td colspan='2' align='center'>Doesn't have filialen yet !</td></tr>"
				else	
					count = 0
					while not rsFil.EOF 
						count = count + 1
						rsFil.MoveNext
					wend
					rsFil.MoveFirst
					Response.Write "<tr><td rowspan='" & count & "' valign='top' width='10%'><b>Filialen:</b></td><td width='40%'>" & rsFil("name")& "</td><td width='40%'>" & rsFil("adresse") & "</td><td>"
					call DrawButton( "DeleteFiliale", "Delete", "adminMerchants.aspx?edit=Profile&merch=" & merch & "&delete=" & rsFil("ID"), "#000000" )
					Response.Write "</td></tr>"
					rsFil.MoveNext
					while not rsFil.EOF 
						Response.Write "<tr><td width='40%'>" & rsFil("name")& "</td><td width='40%'>" & rsFil("adresse") & "</td><td>"
						call DrawButton( "DeleteFiliale", "Delete", "adminMerchants.aspx?edit=Profile&merch=" & merch & "&delete=" & rsFil("ID"), "#000000" )
						Response.Write "</td></tr>"
						rsFil.MoveNext
					wend
				end if
				Response.Write "<tr><td><br />&nbsp;</td>"
				Response.Write "<td align='center'><input type=""submit"" value=""Add New From List"" id=""Submit2"" name=""ChooseButton""></td>"
				Response.Write "<td align='center'><input type=""submit"" value=""Create New"" id=""Submit3"" name=""CreateButton""></td>"
				Response.Write "</table>"	
			end if
			end if
			%>
				
				
				<br />
				<p align=center>Store URL: <a href="http://store.shop">http://store.shop</a></p>
				</td>
				</tr>
				</form>
		<%Case "Payments"
			if request("UpdateButton") <> "" then 
				sql = " SELECT delivery,PaymentMode FROM priceCompareHaendler WHERE LieferantNr=" & merch
				set rs = ObjConnectionExecute(sql)
				if rs("delivery") = true and request("delivery") = "No" then
					sql = "UPDATE priceCompareHaendler set delivery=false WHERE LieferantNr=" & merch
					ObjConnectionExecute(sql)
				end if	
				if rs("delivery") = false and request("delivery") = "Yes" then
					sql = "UPDATE priceCompareHaendler set delivery=true WHERE LieferantNr=" & merch
					ObjConnectionExecute(sql)
				end if	
				if rs("PaymentMode") <> request("PaymentMode") then
					sql = "UPDATE priceCompareHaendler set PaymentMode='" & request("PaymentMode") & "' WHERE LieferantNr=" & merch
					ObjConnectionExecute(sql)
				end if	
				sql = " SELECT  * FROM grZahlungsbedingung "
				set rs = ObjConnectionExecute(sql)

				while not rs.EOF 
					sql = " SELECT * FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rs("Nr") & " and IDNR= " & merch
					set rsZ = ObjConnectionExecute(sql)
					if Request( rs("Methode") ) = "Yes"  then
						if rsZ.BOF and rsZ.EOF then ' insert record
							sql = "INSERT INTO [priceCompareHaendler_Zahlungsbedingungen] ( ID,IDNR,Bedingung ) " & _
								  " Values( " & NextId("[priceCompareHaendler_Zahlungsbedingungen]","ID") & _
								  "," & merch & "," & rs("Nr") & ")"
							ObjConnectionExecute(sql)
						end if 'else Doesn't need update
					else
						if rsZ.BOF and rsZ.EOF then ' delete record
							'Doesn't need update
						else
							sql = "DELETE FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rs("Nr") & " and IDNR= " & merch
							ObjConnectionExecute(sql)
						end if		
					end if
					rs.MoveNext
				wend 
				
				sql = " SELECT * FROM grZahlungsmethode "
				set rs = ObjConnectionExecute(sql)
				while not rs.EOF 
					sql = " SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] WHERE methode='" & rs("methode") & "' and IDNR= " & merch
					set rsZ = ObjConnectionExecute(sql)
					if Request( rs("Methode") ) = "Yes"  then
						if rsZ.BOF and rsZ.EOF then ' insert record
							sql = "INSERT INTO [priceCompareHaendler_Zahlungsmethoden] ( ID,IDNR,Methode ) " & _
								  " Values( " & NextId("[priceCompareHaendler_Zahlungsmethoden]","ID") & _
								  "," & merch & ",'" & rs("Methode") & "')"
							ObjConnectionExecute(sql)
							end if 'else Doesn't need update
					else
						if rsZ.BOF and rsZ.EOF then ' delete record
							'Doesn't need update
						else
							sql = "DELETE FROM [priceCompareHaendler_Zahlungsmethoden] WHERE Methode Like '" & rs("Methode") & "' and IDNR= " & merch
							ObjConnectionExecute(sql)
						end if		
					end if
					rs.MoveNext
				wend 
				
			end if	%>
			<form action="adminMerchants.aspx?edit=Payments&merch=<%=merch%>" method=post id=form2 name=form2>      
			<h1><center>Payment & Delivery settings for <%=merchname%></h1></center>
			<table align=center border=1 cellspacing=0 cellpadding=0 width="60%">
			<tr><td colspan=2 align=middle bgcolor=#d0d0d0> Current settings</td></tr>
			<tr><td colspan=2 align=middle bgcolor=#a0a0a0><IMG src="../images/dot.gif" width="1" height="1"></td></tr>
			<% 
			sql = " SELECT delivery FROM priceCompareHaendler WHERE LieferantNr=" & merch
			set rs = ObjConnectionExecute(sql)
			%>
			<tr><td align=right><b>Delivery [Active Store]</b></td>
			<td align=center>
				<INPUT TYPE="Radio" NAME="delivery" <%If rs("delivery") = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
				<INPUT TYPE="Radio" NAME="delivery" <%If rs("delivery") = false Then %>CHECKED<%End If%> VALUE="No">No
			</td></tr>
			<%Response.Write "<tr><td colspan=2 align=middle bgcolor=#d0d0d0><b> Zahlungsmethoden </b></td></tr>"
			sql = " SELECT  * FROM grZahlungsbedingung "
			set rs = ObjConnectionExecute(sql)
			while not rs.EOF 
				sql = " SELECT * FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rs("Nr") & " and IDNR= " & merch
				set rsZ = ObjConnectionExecute(sql)
				if rsZ.BOF and rsZ.EOF then
					check = false
				else
					check = true
				end if		
				%>
				<tr><td align=right><b><%=rs("Methode")%>:</b></td>
				<td align=center>
					<INPUT TYPE="Radio" NAME="<%=rs("Methode")%>" <%If check = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
					<INPUT TYPE="Radio" NAME="<%=rs("Methode")%>" <%If check = false Then %>CHECKED<%End If%> VALUE="No">No
				</td></tr><%
				rs.MoveNext
			wend
			Response.Write "<tr><td colspan=2 align=middle bgcolor=#d0d0d0><b> Zahlungsbedingungen </b></td></tr>"
			sql = " SELECT * FROM grZahlungsmethode "
			set rs = ObjConnectionExecute(sql)
			while not rs.EOF 
				sql = " SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] WHERE methode='" & rs("methode") & "' and IDNR= " & merch
				set rsZ = ObjConnectionExecute(sql)
				if rsZ.BOF and rsZ.EOF then
					check = false
				else
					check = true
				end if		
				%>
				<tr><td align=right><b><%=rs("Methode")%>:</b></td>
				<td align=center>
					<INPUT TYPE="Radio" NAME="<%=rs("Methode")%>" <%If check = true Then %>CHECKED<%End If%> VALUE="Yes">Yes
					<INPUT TYPE="Radio" NAME="<%=rs("Methode")%>" <%If check = false Then %>CHECKED<%End If%> VALUE="No">No
				</td></tr><%
				rs.MoveNext
			wend
			rsZ.close
			set rsZ = nothing	
			%>
			<tr><td align=right><b>Price of Delivery (&euro;)</b></td>
			<td align=center><input name="priceOfDelivery" style='width:100'></td></tr><%
			sql = " SELECT PaymentMode FROM priceCompareHaendler WHERE LieferantNr=" & merch
			set rs = ObjConnectionExecute(sql)
			Response.Write "<tr><td align=right><b>Payment Mode</b></td>"
			Response.Write "<td align=center><select name='PaymentMode' style='width:100'><option"
			if rs("PaymentMode") = "base" then 
				Response.Write " SELECTED"
			end if
			Response.Write ">base</option><option"
			if rs("PaymentMode") = "middle" then 
				Response.Write " SELECTED"
			end if
			Response.Write ">middle</option><option"
			if rs("PaymentMode") = "top" then 
				Response.Write " SELECTED"
			end if
			Response.Write ">top</option></td></tr>"%>
			
			</table>
			<br />
			<p align=center>
			<input type="submit" value="Update" id="Submit1" name="UpdateButton">
			</p>
			<p align=center>Store URL: <a href="http://store.shop">http://store.shop</a></p>
			</td>
			</tr>
			</form>
		<%case "ftp" 
			if request("UpdateButton") <> "" then 
				sql = " UPDATE [priceCompareHaendler] set ftpserver='" & request("ftpserver") & _
					  "', ftpusername='" & request("ftpusername") & "', ftppassword='"& request("ftppassword") & _
					  "', filename='" & request("filename") & "' WHERE LieferantNr = " & merch
				ObjConnectionExecute(sql)
			end if	
			sql = " SELECT * FROM [priceCompareHaendler] WHERE LieferantNr = " & merch
			set rs = ObjConnectionExecute(sql)
		%>
			<form action="adminMerchants.aspx?edit=ftp&merch=<%=merch%>" method=post id=form3 name=form3>
			<h1><center>Upload settings for <%=merchname%></h1></center>
			<table align=center cellspacing=0 cellpadding=5 border=0>
			<tr>
				<td align=right>FTP Server:</td><td><input name="ftpserver" value="<%=rs("ftpserver")%>"></td>
				<td>IP Adresse des Servers</td>
			</tr>
			<tr>
				<td align=right>FTP Username:</td>
				<td><input name="ftpusername" size="20" value="<%=rs("ftpusername")%>"></td><td></td>
			</tr>
			<tr>
				<td align=right>FTP Password:</td>
				<td><input name="ftppassword" size="20" value="<%=rs("ftppassword")%>"></td><td></td>
			</tr>
			<tr>
				<td align=right>FTP Filename(* + path):</td>
				<td><input name="filename"  value="<%=rs("filename")%>"></td><td></td>
			</tr>
			<tr>
				<td align=right>Zeitinterval:</td>
				<td><select size="1" name="UpdateTime">
							<option>5 Min</option>
							<option>30 Min</option>
						    <option>1 Std</option>
						    <option>24 Std</option>
						    <option>1 woche</option>
						</select></td>
				<td>Am besten 1 Tag</td>
			</tr>
			<tr>
			  <td align=right>
			</table>
			<p align=center>
			<input type="submit" value="Update" id="Submit1" name="UpdateButton">
			</p>
			<p align=center>Store URL: <a href="http://store.shop">http://store.shop</a></p>
			</td>
			</tr>
			</form>
			<%
		end select
		rs.close
		set rs = nothing
	end if
end if	
'	rs.close
'	set rs = nothing
call drawWindowPart2("Merchants admin","","state",butArr) %>
