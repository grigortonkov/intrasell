<!--#include file="../client/intrasoft/menu.aspx"-->
<SCRIPT LANGUAGE="JavaScript">
function UpdatePLZ() {
	document.forms("ProfileForm").item("CreateButton").value = 'Create New'  ;
	document.forms("ProfileForm").submit() ;	
}

function CheckForEmptyField( field1, field2 ) {
	var myform = document.forms("ProfileForm");
	var myfield = eval ( 'myform.item(\"' + field1 + '\")');
	if ( myfield.value == "")  {
		alert('Geben Sie einen Wert in das Feld \"' + field2+ '\" ein.');
		myfield.focus();
		return true ;
	}
	return false ;
}	

function Validator( x ){
	var myform = document.forms("ProfileForm");

	if ( CheckForEmptyField ( x + 'name', 'Name')) return false ;
	if ( CheckForEmptyField ( x + 'Adresse', 'Adresse')) return false ;
	if ( CheckForEmptyField ( x + 'Firma', 'Firma')) return false ;
	if ( CheckForEmptyField ( x + 'Email', 'Email')) return false ;
	if ( CheckForEmptyField ( x + 'Web', 'Web URL')) return false ;
	
	myfield = eval ( 'myform.item(\"' + x + 'Land' + '\")');
	if ( myfield.value == "")  {
		alert("Geben Sie einen Wert in das Feld \"Land\" ein.");
		myfield.focus();
		return (false);
	}
	
	myfield = eval ( 'myform.item(\"' + x + 'Ort' + '\")');
	if ( myfield.length ) {
		var len = myfield.length;
		for ( var i = 0 ; i < len  ; i++ )
			if ( myfield[i].selected ) break ;
		if ( myfield[i].text == "")  {
			alert("Geben Sie einen Wert in das Feld \"Ort\" ein.");
			myfield.focus();
			return (false);
		}
	}
	else {
		alert("Geben Sie einen Wert in das Feld \"Ort\" ein.");
		myfield.focus();
		return (false);
	}
  return (true);
}
</SCRIPT>
<%
Dim sql
Dim sqlString
Dim rs
Dim rsFil
Dim merchname
Dim count
Dim merch
Dim land
Dim ort
merch = request("merch")
if merch <> "" then 
	if request("ChooseButton") <> "" then 
		ReDim butArr(7,2)
		butArr(5,1) = "Merchant's List"
		butArr(5,2) = "adminMerchantsProfile.aspx"
		butArr(6,1) = "CANCEL"
		butArr(6,2) = "adminMerchantsProfile.aspx?merch=" & merch
	else
		ReDim butArr(6,2)
		butArr(5,1) = "Merchant's List"
		butArr(5,2) = "adminMerchantsProfile.aspx"
		butArr(6,1) = "Cat Mapping"
		butArr(6,2) = "genericAsp/tableRedirector_priceCompareImpExCategoryMapping.aspx?lieferantNr=" & merch
	end if	
else
	ReDim butArr(4,2)
end if		
butArr(1,1) = "Einstellungen"
butArr(1,2) = "adminMerchantsPayment.aspx?merch=" & merch
butArr(2,1) = "FTP settings"
butArr(2,2) = "adminMerchantsFtp.aspx?merch=" & merch
butArr(3,1) = "Stars"
butArr(3,2) = "adminMerchantsStars.aspx"
butArr(4,1) = "New Profile"
butArr(4,2) = "adminMerchantsCreateNew.aspx"



call drawWindowPart1("Admin Merchants Profile","","state",butArr)	

if merch = "" then		
	sql = "SELECT  lieferantenAdressen.* FROM lieferantenAdressen " & _
	      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
	set rs = ObjConnectionExecute(sql)
	Response.Write "<b> Select a merchant from the list : <b><br /> "
	While not rs.EOF
		Response.Write "&nbsp;&nbsp;&nbsp;<A href=""adminMerchantsProfile.aspx?merch=" & rs("IDNR") & """><b>" & rs("Firma") & "</b></a><br />"
		rs.MoveNext
	wend
else ' merch <> "" %>
	<form action="adminMerchantsProfile.aspx?merch=<%=merch%>" method="POST" name="ProfileForm" >
	<%sql = "SELECT  Firma FROM lieferantenAdressen WHERE IDNR = " & merch 
	set rs = ObjConnectionExecute(sql)
	merchname = rs("Firma")
	
	if request("UpdateButton") <> "" then
		sql = "UPDATE [lieferantenAdressen] set Name='" & request("Name") & "'"
		sql = sql & ", Firma = '" & request("Firma") & "', Adresse = '" & request("Adresse") & "'"
		sqlString = "SELECT IDNR FROM grPLZ WHERE PLZ = " & request("PLZ") & _
					" and Ort LIKE '" & request("Ort") & "'"	
		set rs = ObjConnectionExecute(sqlString)	
		sql = sql & ", PLZ = " & rs("IDNR") & ", Land = " & request("Land")
		sql = sql & ", Email = '" & request("Email") & "', Web = '" & request("Web") & "'"
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
		sql = sql & " WHERE IDNR = " & merch
		ObjConnectionExecute(sql)
	end if
	if request("CreateFilialeButton") <> "" then
		sql = "INSERT INTO [lieferantenAdressen] ( IDNR, Name, Firma, Adresse, Plz, Land, Email, Web "
		sql1 = ""
		sql2 = ""
		if request("fBranche") <> "" then
			sql1 = sql1 & ", Branche" 
			sql2 = sql2 & "," & request("fBranche")
		end if	
		if request("fBriefanrede") <> "" then
			sql1 = sql1 & ", Briefanrede" 
			sql2 = sql2 & ",'" & request("fBriefanrede") & "'"
		end if	
		if request("fTitel") <> "" then
			sql1 = sql1 & ", Titel" 
			sql2 = sql2 & ",'" & request("fTitel") & "'"
		end if	
		if request("fAnrede") <> "" then
			sql1 = sql1 & ", Anrede" 
			sql2 = sql2 & ",'" & request("fAnrede") & "'"
		end if	
		if request("fTel") <> "" then
			sql1 = sql1 & ", Tel" 
			sql2 = sql2 & ",'" & request("fTel") & "'"
		end if	
		if request("fTel2") <> "" then
			sql1 = sql1 & ", Tel2" 
			sql2 = sql2 & ",'" & request("fTel2") & "'"
		end if	
		if request("fFax") <> "" then
			sql1 = sql1 & ", Fax" 
			sql2 = sql2 & ",'" & request("fFax") & "'"
		end if	
		if request("fFax2") <> "" then
			sql1 = sql1 & ", Fax2" 
			sql2 = sql2 & ",'" & request("fFax2") & "'"
		end if	
		if request("fMobil") <> "" then
			sql1 = sql1 & ", Mobil" 
			sql2 = sql2 & ",'" & request("fMobil") & "'"
		end if	
		sqlString = "SELECT IDNR FROM grPLZ WHERE PLZ = " & request("fPLZ") & _
					" and Ort LIKE '" & request("fOrt") & "'"	
		set rs = ObjConnectionExecute(sqlString)			
			
		count = NextId("lieferantenAdressen","IDNR")
		sql = sql & sql1 & ") Values ( " &  count & ",'" & request("fname") 
		sql = sql & "','" & request("fFirma") & "','" & request("fAdresse") & "'"
		sql = sql  & "," & rs("IDNR") & "," & request("fLand") & ",'" & request("fEmail")
		sql = sql & "','" & request("fWeb") & "'" & sql2 & ")" 
		ObjConnectionExecute(sql)
		sql = "INSERT INTO priceCompareHaendlerFilialen ( LieferantNr, FilialeNr )" & _
			  " Values ( "  & merch & "," & count & ")"
		'& NextId("priceCompareHaendlerFilialen","ID") & ","
		ObjConnectionExecute(sql)
	end if
	
	sql = "SELECT lieferantenAdressen.*, grPLZ.Ort, grPLZ.PLZ as nPLZ FROM lieferantenAdressen, grPLZ " & _
			" WHERE lieferantenAdressen.IDNR = " & merch & " and lieferantenAdressen.PLZ = grPLZ.IDNR"
	set rs = ObjConnectionExecute(sql)
	if request("CreateButton") <> "" then ' empty form for new filialen	%>
		<input type='hidden' name="CreateButton" >
		<h1><center>Create new Filiale for <%=merchname%></h1></center>
		<table height="60%" width="100%" align=center cellspacing=0 cellpadding=1 border=0>
		<tr>
			<td align="right">Name*:</td><td><input name="fName" style="width:150" value="<%=request("fName")%>"></td>
			<td align="right">Adresse*:</td><td><input name="fAdresse" style="width:150" value="<%=request("fAdresse")%>"></td>
			<td align="right">Firma*:</td><td><input name="fFirma" style="width:150" value="<%=request("fFirma")%>"></td>
		</tr>
		<tr>
			<td align="right">Land*:</td><td><select name='fLand' style='width:150' onChange='UpdatePLZ()'>
			<%land = request("fLand")
			if land = "" then 
				sql = "SELECT IDNR FROM grLand ORDER BY Name"
				set rsFil = ObjConnectionExecute(sql)	
				land = rsFil("IDNR")
			end if
			call WriteComboOptions ("grLand", "Name", "IdNr", CInt(land) )%>
			</select></td>
			<td align="right">Branche:</td><td><select name='fBranche' style='width:150' >
			<%call WriteComboOptions( "grBranchen", "Bezeichnung", "BrNr", CInt(request("fBranche")) )%>
			</select></td>
			<td align="right">Briefanrede:</td><td><input name="fBriefanrede" style="width:150" value="<%=request("fBriefanrede")%>"></td>
		</tr>
		<tr>
			<td align="right">Ort*:</td><td><select name='fOrt' style='width:150' onChange='UpdatePLZ()'>
			<%ort = request("fOrt")
			if ort = "" then
				sql = "SELECT Ort FROM grPLZ WHERE Land = " & land & " ORDER BY Ort"
				set rsFil = ObjConnectionExecute(sql)	
				if not rsFil.BOF or not rsFil.EOF then
					ort = rsFil("Ort")
				end if
			else
				sql = "SELECT Land FROM grPLZ WHERE Ort LIKE '" & ort & "'"
				set rsFil = ObjConnectionExecute(sql)	
				if ( not rsFil.BOF or not rsFil.EOF ) then
					if CInt(rsFil("Land")) <> CInt(land) then
						sql = "SELECT Ort FROM grPLZ WHERE Land = " & land
						set rsFil = ObjConnectionExecute(sql)	
						if ( not rsFil.BOF or not rsFil.EOF ) then
							ort = rsFil("Ort")
						else 
							ort = ""
						end if	
					end if	
				end if	
			end if	
			call WriteComboOptions( "grPLZ WHERE Land=" & land , "Ort", "", ort )
			%>
			</select></td>
			<td align="right">Anrede:</td><td><select name='fAnrede' style='width:150' >
			<%call WriteComboOptions( "grAnrede", "Anrede", "", request("fAnrede") )%>
			</select></td>
			<td align="right">Titel:</td><td><input name="fTitel" style="width:150" value="<%=request("fTitel")%>"></td>
		</tr>
		<tr>
			<td align="right">PLZ*:</td><td><select name='fPLZ' style='width:150' >		
			<%call WriteComboOptions( "grPLZ WHERE Ort Like '" & ort & "'", "Plz", "", "" )	%>
			</select></td>
			<td align="right">Name1:<%=ort%></td><td><input name="fName1" style="width:150" value="<%=request("fName1")%>"></td>
			<td align="right">Tel:</td><td><input name="fTel" style="width:150" value="<%=request("fTel")%>"></td>
		</tr>
		<tr>
			<td align="right">Tel2:</td><td><input name="fTel2" style="width:150" value="<%=request("fTel2")%>"></td>
			<td align="right">Fax:</td><td><input name="fFax" style="width:150" value="<%=request("fFax")%>"></td>
			<td align="right">Fax2:</td><td><input name="fFax2" style="width:150" value="<%=request("fFax2")%>"></td>
		</tr>
		<tr>
			<td align="right">Mobil:</td><td><input name="fMobil" style="width:150" value="<%=request("fMobil")%>"></td>
			<td align="right">Email*:</td><td><input name="fEmail" style="width:150" value="<%=request("fEmail")%>"></td>
			<td align="right">Web URL*:</td><td><input name="fWeb" style="width:150" value="<%=request("fWeb")%>"></td>
		</tr>
		<tr>
		<td colspan='4' align='center'><br /><input type="submit" value="Create" id="Submit2" name="CreateFilialeButton" onClick="return Validator( 'f')"></td>
		<td colspan='2' align='center'><input type="submit" value="Cancel" id="Submit3" name="CancelButton"></td>
		</tr>
		</table>
	<%else
		if request("ChooseButton") <> "" then 
			sql = "SELECT lieferantenAdressen.IDNR, lieferantenAdressen.name, " & _ 
				  "lieferantenAdressen.firma, lieferantenAdressen.adresse, grLand.Name as country, " & _
				  "grPLZ.plz, grPLZ.Ort FROM lieferantenAdressen, grLand, grPLZ WHERE lieferantenAdressen.land= grLand.IdNr and lieferantenAdressen.PLZ = grPLZ.IdNr"
			set rsFil = ObjConnectionExecute(sql)
			Response.Write "<h1><center>Choose a Filiale for " & merchname & "</h1></center>"
			Response.Write "<table width='80%' align=center cellspacing=0 cellpadding=1 border=1><tr>"
			while not rsFil.EOF 
				Response.Write "<tr><td><b><a href=""adminMerchantsProfile.aspx?merch=" & merch & "&filiale=" & rsFil("IDNR") & """>" & rsFil("Name") & "</b></a></td>"
				Response.Write "<td>" & rsFil("Country") & "</td>"
				Response.Write "<td>" & rsFil("plz") & "</td>"
				Response.Write "<td>" & rsFil("Ort") & "</td></tr>"
				rsFil.MoveNext
			wend
			Response.Write "</table>"
		else 
			count = Request.QueryString("filiale")
			if count <> "" then
				sql = "INSERT INTO priceCompareHaendlerFilialen ( LieferantNr, FilialeNr )" & _
					  " Values ( " & merch & "," & count & ")"
				'& NextId("priceCompareHaendlerFilialen","ID") & "," 
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
				<td align="right">Name*:</td><td><input name="Name"  style="width:150" value="<%=rs("Name")%>"></td>
				<td align="right">Adresse*:</td><td><input name="Adresse"  style="width:150" value="<%=rs("Adresse")%>"></td>
				<td align="right">Firma*:</td><td><input name="Firma"  style="width:150" value="<%=rs("Firma")%>"></td>
			</tr>
			<tr>
				<td align="right">Land*:</td><td><select name='Land' style='width:150' onChange='UpdatePLZ()'>
				<%
				land = request("Land")
				
				if land = "" then 
					land = rs("Land")
				end if	
				call WriteComboOptions ("grLand", "Name", "IdNr", CInt(land) )%>
				</select></td>
				<td align="right">Branche:</td><td><select name='branche' style='width:150'>
				<%call WriteComboOptions( "grBranchen", "Bezeichnung", "BrNr", rs("branche") )%>
				</select></td>
				<td align="right">Briefanrede:</td><td><input name="Briefanrede"  style="width:150" value="<%=rs("Briefanrede")%>"></td>
			</tr>
			<tr>
				<td align="right">Ort*:</td><td><select name='Ort' style='width:150' onChange='UpdatePLZ()'>
				<%
				ort = request("Ort")
				if ort = "" then
					ort = rs("Ort")
				end if
				sql = "SELECT Land FROM grPLZ WHERE Ort LIKE '" & ort & "'"
				set rsFil = ObjConnectionExecute(sql)	
				if ( not rsFil.BOF or not rsFil.EOF ) then
					if CInt(rsFil("Land")) <> CInt(land) then
						sql = "SELECT Ort FROM grPLZ WHERE Land = " & land
						set rsFil = ObjConnectionExecute(sql)	
						if ( not rsFil.BOF or not rsFil.EOF ) then
							ort = rsFil("Ort")
						else 
							ort = ""
						end if	
					end if	
				end if	
				call WriteComboOptions( "grPLZ WHERE Land=" & land , "Ort", "", ort )
				%>
				</select></td>
				<td align="right">Anrede:</td><td><select name='Anrede' style='width:150'>
				<%call WriteComboOptions( "grAnrede", "Anrede", "", rs("Anrede") )%>
				</select></td>
				<td align="right">Titel:</td><td><input name="Titel"  style="width:150" value="<%=rs("Titel")%>"></td>
			</tr>
			<tr>
				<td align="right">PLZ*:</td><td><select name='PLZ' style='width:150' >		
				<%call WriteComboOptions( "grPLZ WHERE Ort Like '" & ort & "'", "Plz", "PLZ", ""	)%>
				</select></td>
				<td align="right">Name1:</td><td><input name="Name1"  style="width:150" value="<%=rs("Name1")%>"></td>
				<td align="right">Tel:</td><td><input name="Tel"  style="width:150" value="<%=rs("Tel")%>"></td>
			</tr>
			<tr>
				<td align="right">Tel2:</td><td><input name="Tel2"  style="width:150" value="<%=rs("Tel2")%>"></td>
				<td align="right">Fax:</td><td><input name="Fax"  style="width:150" value="<%=rs("Fax")%>"></td>
				<td align="right">Fax2:</td><td><input name="Fax2"  style="width:150" value="<%=rs("Fax2")%>"></td>
			</tr>
			<tr>
				<td align="right">Mobil:</td><td><input name="Mobil"  style="width:150" value="<%=rs("Mobil")%>"></td>
				<td align="right">Email*:</td><td><input name="Email"  style="width:150" value="<%=rs("Email")%>"></td>
				<td align="right">Web URL*:</td><td><input name="Web"  style="width:150" value="<%=rs("Web")%>"></td>
			</tr>
			</table>
			<p align=center>
			<input type="submit" value="Update" name="UpdateButton" onClick="return Validator('')">
			<hr>
			<table width="90%" align=center cellspacing=0 cellpadding=1 border=1>
			<%sql = "SELECT priceCompareHaendlerFilialen.ID, lieferantenAdressen.name, lieferantenAdressen.adresse, " & _
					  "lieferantenAdressen.firma, grLand.Name as country, grPLZ.plz, grPLZ.Ort " & _
					  " FROM priceCompareHaendlerFilialen, lieferantenAdressen, grLand, grPLZ " & _ 
					  " WHERE priceCompareHaendlerFilialen.LieferantNr = " & merch & _
					  " and priceCompareHaendlerFilialen.FilialeNr = lieferantenAdressen.IDNR and " & _
					  " lieferantenAdressen.land = grLand.IdNr and lieferantenAdressen.PLZ = grPLZ.IdNr"
			set rsFil = ObjConnectionExecute(sql)
			if rsFil.EOF and rsFil.BOF then ' no filials
				Response.Write "<tr><td bgcolor=""#6699FF"" width='10%'><b>Filialen:</b></td><td colspan='6' align='center'>Doesn't have filialen yet !</td></tr>"
			else	
				count = 0
				while not rsFil.EOF 
					count = count + 1
					rsFil.MoveNext
				wend
				rsFil.MoveFirst
				Response.Write "<tr><td rowspan='" & count & "' valign='top' width='10%' bgcolor=""#6699FF"" ><b>Filialen:</b></td>"
				Response.Write "<td width='4%'>1.</td><td  width='26%'>" & rsFil("name")& "</td><td width='20%'>"
				Response.Write rsFil("Country") & "</td><td width='5%'>" & rsFil("plz") & "</td><td width='20%'>" & rsFil("Ort") & "</td><td width='15%'>"
				call DrawButton( "DeleteFiliale", "Delete", "adminMerchantsProfile.aspx?merch=" & merch & "&delete=" & rsFil("ID"), "#000000" )
				Response.Write "</td></tr>"
				rsFil.MoveNext
				count = 2
				while not rsFil.EOF 
					Response.Write "<tr><td>" & count & ".</td><td>" & rsFil("name")& "</td><td>" 
					Response.Write rsFil("Country") & "</td><td>" & rsFil("plz") & "</td><td>" & rsFil("Ort") & "</td><td>"
					call DrawButton( "DeleteFiliale", "Delete", "adminMerchantsProfile.aspx?merch=" & merch & "&delete=" & rsFil("ID"), "#000000" )
					Response.Write "</td></tr>"
					rsFil.MoveNext
					count = count + 1
				wend
			end if
			Response.Write "</table><br /><table width='90%' align=center border='0'>"
			Response.Write "<tr><td width='10%'><br />&nbsp;</td>"
			Response.Write "<td align='center' width='30%'><input type=""submit"" value=""Add New From List"" id=""Submit2"" name=""ChooseButton""></td>"
			Response.Write "<td align='center' width='40%'><input type=""submit"" value=""Create New"" id=""Submit3"" name=""CreateButton""></td><td width='20%'>&nbsp;</td></tr>"
			Response.Write "</table>"	
			sql = "SELECT Web FROM lieferantenAdressen WHERE IDNR = " & merch
			set rs = ObjConnectionExecute(sql)
			Response.Write "<p align='center'>Store URL: <a href=""" & rs("Web") & """>" & rs("Web") & "</a></p></form>"
		end if
		rsFil.close
		set rsFil = nothing	
	end if
end if	
rs.close
set rs = nothing
call drawWindowPart2("Merchants admin","","state",butArr) 

Sub WriteComboOptions( table, itemsField, valuesField, value )
	Dim sql
	Dim rsB 
	sql = "SELECT * FROM " & table & " ORDER BY " & itemsField
	set rsB = ObjConnectionExecute(sql)
	if valuesField <> "" then
		while not rsB.EOF 
			Response.Write "<option value=" & rsB( valuesField )
			'if value <> "" and value = rsB( valuesField ) then
			if value <> "" and value = rsB( valuesField ) then
				Response.Write " SELECTED "
			end if
			Response.Write ">" & rsB( itemsField ) & "</option>"
			rsB.MoveNext
		wend
	else
		while not rsB.EOF 
			Response.Write "<option" 
			if value <> "" and value = rsB( itemsField ) then
				Response.Write " SELECTED "
			end if
			Response.Write ">" & rsB( itemsField ) & "</option>"
			rsB.MoveNext
		wend
	end if 	
	rsB.close
	set rsB = nothing 
End sub%>
