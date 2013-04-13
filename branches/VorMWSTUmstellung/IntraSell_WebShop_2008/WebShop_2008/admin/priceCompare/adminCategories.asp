<!--#include file="../client/intrasoft/menu.aspx"-->
<SCRIPT LANGUAGE="JavaScript">
function CheckForEmptyField( field1, field2 ) {
	var myform = document.forms("CategoriesForm");
	var myfield = eval ( 'myform.item(\"' + field1 + '\")');
	if ( myfield.value == "")  {
		alert('Geben Sie einen Wert in das Feld \"' + field2+ '\" ein.');
		myfield.focus();
		return true ;
	}
	return false ;
}	

function Validator( x ){
	var myform = document.forms("CategoriesForm");
	if ( CheckForEmptyField ( x + 'Name', 'Name')) return false ;
	//if ( CheckForEmptyField ( x + 'Template', 'Template')) return false ;
	/*
	var myfield = eval ( 'myform.item(\"' + x + 'Aufschlag\")');
	if ( ( myfield.value != "") && ( isNaN(myfield.value) || ( myfield.value < 1 ) ) ) {
		alert('The value in field \"Aufshlag\" must be greater or equal than 1 ! ');
			myfield.focus();
			return false ;
	}	

	myfield = eval ( 'myform.item(\"' + x + 'GewinnReferenz\")');
	if (( myfield.value != "") && ( isNaN (myfield.value) || ( myfield.value >= 1 ) ) ) {
		alert('The value in field \"GewinnReferenz\" must be less than 1 ! ');
		myfield.focus();
		return false ;
	}		
    */
	return (true);
}
</SCRIPT>
<%
Dim idKat
Dim rsKat
Dim rs
Dim sql 
Dim count
Dim keywords
Dim qString
Dim edit
Dim sqlString1
Dim sqlString2
Dim temp
Dim catname
edit = Request("Edit")
idKat = Request("KatNr")

if idKat <> "" then
	ReDim butArr(5,2)
	if edit = "" then 
		butArr(5,1) = "SubCategories"
		butArr(5,2) = "adminCategories.aspx?KatNr=" & idKat & "&edit=Sub"
		butArr(4,1) = "Create New SubCategory"
		butArr(4,2) = "adminCategories.aspx?KatNr=" & idKat & "&edit=New"
	else	
		butArr(5,1) = "Edit Category"
		butArr(5,2) = "adminCategories.aspx?KatNr=" & idKat
		butArr(4,1) = "Create New SubCategory"
		butArr(4,2) = "adminCategories.aspx?KatNr=" & idKat & "&edit=New&From=Sub"
	end if	
	butArr(3,1) = "Categories List"
	butArr(3,2) = "adminCategories.aspx"
	butArr(1,1) = "Keywords"
	butArr(1,2) = "adminCategoriesKeywords.aspx?KatNr=" & idKat
	butArr(2,1) = "Show Products"
	butArr(2,2) = "adminProdukts.aspx?KatNr=" & idKat
else
	ReDim butArr(3,2)
	butArr(3,1) = "Create New"
	butArr(3,2) = "adminCategories.aspx?Edit=New"
	butArr(2,1) = "Show Products"
	butArr(2,2) = "adminProdukts.aspx"
	butArr(1,1) = "Keywords"
	butArr(1,2) = "adminCategoriesKeywords.aspx"
end if	
call drawWindowPart1("Admin Categories","","state",butArr)

temp = Request("DeleteButton")
if temp <> "" then
	if temp = "Delete" then ' delete current
		sql = "DELETE FROM [grArtikel-Kategorien] WHERE ArtKatNr = " & idKat 
		ObjConnectionExecute(sql) 	  
		Response.Redirect("adminCategories.aspx")
	else ' delete sub kategory	
		sql = "DELETE FROM [grArtikel-Kategorien] WHERE ArtKatNr = " & temp
		ObjConnectionExecute(sql) 	  
	end if	
end if	

if Request("EditButton") <> "" then
	sqlString1 = ""
	temp = Request.Form("Aufschlag")
	if  temp <> "" then
		sqlString1 = sqlString1 & ", Aufschlag = " &  replace(temp,",",".")
	end if	
	temp = Request.Form("GewinnReferenz")
	if temp <> "" then
		sqlString1 = sqlString1 & ", GewinnReferenz = " & replace(temp,",",".")
	end if	
	temp = Request.Form("Desc")
	if temp <> "" then
		sqlString1 = sqlString1 & ", [Desc] = '" & temp & "'"
	end if	
	temp = Request.Form("stylesheet")
	if temp <> "" then
		sqlString1 = sqlString1 & ", stylesheet = '" & temp & "'"
	end if
	temp = Request.Form("Template")
	if temp <> "" then
		sqlString1 = sqlString1 & ", PriceCompareTemplate = '" & server.HTMLEncode(temp) & "'"
	end if	
	
	temp = Request.Form("UseKeywordsFromChild")
	if temp <> "" then
		sqlString1 = sqlString1 & ", UseKeywordsFromChild = " & server.HTMLEncode(temp) 
	end if	
	
	sql = "UPDATE [grArtikel-Kategorien] set Name='" & Request.Form("Name") & "', ArtKatNrParent= " & _
		  Request.Form("ParentId") & sqlString1 & " WHERE ArtKatNr = " & idKat
 	'Response.Write "SQL : " & SQL & "<br />"
	ObjConnectionExecute(sql) 	  	
end if	

if Request("AddSubButton") <> "" then
	sqlString1 = ""
	sqlString2 = ""
	temp = Request.Form("sAufschlag")
	if  temp <> "" then
		sqlString1 = ", Aufschlag"
		sqlString2 = "," & temp
	end if	
	temp = Request.Form("sGewinnReferenz")
	if  temp <> "" then
		sqlString1 = sqlString1 & ", GewinnReferenz"
		sqlString2 = sqlString2 & "," & temp
	end if
	temp = Request.Form("sDesc")
	if temp <> "" then
		sqlString1 = sqlString1 & ", [Desc]"
		sqlString2 = sqlString2 & ",'" & temp & "'"
	end if	
	temp = Request.Form("sStylesheet")
	if temp <> "" then
		sqlString1 = sqlString1 & ", Stylesheet"
		sqlString2 = sqlString2 & ",'" & temp & "'"
	end if	
	temp = Request.Form("sTemplate")
	if temp <> "" then
		sqlString1 = sqlString1 & ", PriceCompareTemplate"
		sqlString2 = sqlString2 & ",'" & temp & "'"
	end if	
	sql = "INSERT INTO [grArtikel-Kategorien] ( ArtKatNr, Name, ArtKatNrParent" 
	sql = sql & sqlString1 & ") Values(" & NextId("[grArtikel-Kategorien]","ArtKatNr") & ",'" & Request.Form("sName")
	sql = sql & "'," & request("sParentId") & sqlString2 & ")"
'	Response.Write "SQL : " & SQL & "<br />"
	ObjConnectionExecute(sql) 	  	
	if request("From") = "Keywords" then 
		Response.Redirect("adminCategoriesKeywords.aspx")
	end if
	if request("From") = "Sub" then 
		Response.Redirect("adminCategories.aspx?KatNr=" & idKat & "&Edit=Sub" )
	end if		
end if	

if request("CancelButton") <> "" then
	idKat = ""
end if	
Response.Write "<form name=""CategoriesForm"" action=""adminCategories.aspx?KatNr=" & idKat & "&edit=" & edit & """ method=""POST"">" &  CHR(13) & CHR(10)
if idKat <> ""  then
	sql = "SELECT  Name FROM [grArtikel-Kategorien] WHERE ArtKatNr = " & idKat	
	set rsKat = ObjConnectionExecute(sql)
	catname = rsKat("Name")
	if edit = "" then
		sql = "SELECT  * FROM [grArtikel-Kategorien] WHERE ArtKatNr = " & idKat	
		set rs = ObjConnectionExecute(sql)%>
		<table width="100%" height="80%" border="0" cellspacing="2" cellpadding="0">
		<tr><td colspan="4" align="center" valign ="center">
			<br /><h4><b>Category  <i><%=rs("Name")%></i></b></h4></td>
		</tr>
		<tr>	
			<td align="right">Name*:</td>
			<td><input name="Name" style="width:200" value="<%=rs("Name")%>"></td>
			<td align="right" rowspan="6">Template:</td>
			<td rowspan="6"><textarea name="Template" cols=60 rows=15><%=rs("PriceCompareTemplate")%></textarea></td>
		</tr>
		<tr>	
			<td align="right">Parent Category*:</td><td>
			<%
			if rs("ArtKatNrParent") = -1 then ' no parent category
				Response.Write "<b><i>This is the root category !</i></b></td>" &  CHR(13) & CHR(10)
				Response.Write "<input type='hidden' name='ParentId' value='-1'>" &  CHR(13) & CHR(10)
			else
				Response.Write "<select name='ParentId' style='width:200' >" &  CHR(13) & CHR(10)
				call WriteComboOptions( "[grArtikel-Kategorien]", "Name", "ArtKatNr", rs("ArtKatNrParent") ) 
				Response.Write "</select></td>" &  CHR(13) & CHR(10)
			end if	
			%>
		</tr>
		<tr>
			<td align="right">Description*:</td><td><input name="Desc" style="width:200" value="<%=rs("Desc")%>"></td>
		</tr>
		<tr>	
			<td align="right">Aufschlag:</td><td><input name="Aufschlag" style="width:200" value="<%=rs("Aufschlag")%>"></td>
			</tr>
		<tr>	
			<td align="right">GewinnReferenz:</td><td><input name="GewinnReferenz" style="width:200"  value="<%=rs("GewinnReferenz")%>"></td>
		</tr>
		<tr>	
			<td align="right">Stylesheet:</td><td><input name="Stylesheet" style="width:200" value="<%=rs("stylesheet")%>"></td>
		</tr>
		 <tr>	
			<td align="right">Use Keywords From Child:</td><td><select name="UseKeywordsFromChild" style="width:200">
			<option selected value="<%=FormatNumber(rs("UseKeywordsFromChild"),0)%>"> <%=rs("UseKeywordsFromChild")%>
			<option value=1>True
			<option value=0>False
			</select></td>
		</tr>
		
		<tr>
		<%if rs("ArtKatNrParent") = -1 then ' no parent category
			Response.Write "<td align='center' colspan='4'><br /><br /><input type='submit' value='Apply' name='EditButton' style='width:150' onClick=""return Validator('')""></td>" &  CHR(13) & CHR(10)
		else
			Response.Write "<td align='center' colspan='3'><input type='submit' value='Apply' name='EditButton' style='width:150' onClick=""return Validator('')""></td>" &  CHR(13) & CHR(10)
			Response.Write "<td align='center' colspan='1'><input type='submit' value='Delete' name='DeleteButton' style='width:150'></td>" &  CHR(13) & CHR(10)
		end if			
		Response.Write "</tr></table>" &  CHR(13) & CHR(10)
	else ' Sub categories
		if edit = "Sub" then
			sql = "SELECT  ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] " & _
			      " WHERE ArtKatNrParent = " & idKat
			set rsKat = ObjConnectionExecute(sql)
			if rsKat.BOF and rsKat.EOF then
				Response.Write "<center><br /><h4><b>Category <I>" & catname & "</i> doesn't have SubCategories </b></h4><br />" &  CHR(13) & CHR(10)
			else
				Response.Write "<center><br /><h4 color='#000080'><b>SubCategories List for category <I>" & catname & "</i></b></h4>" &  CHR(13) & CHR(10)
				Response.Write "<table width='80%' height='40%' border='1' bordercolor='#000080' cellspacing='2' cellpadding='0'>" &  CHR(13) & CHR(10)
				While not rsKat.EOF
					DisplayCategoryInTab rsKat("Name"), 0, rsKat("ArtKatNr"), "", "adminCategories.aspx", idKat
					GetSubCategoriesInTab rsKat("ArtKatNr"), 1, "", "adminCategories.aspx", idKat
					rsKat.MoveNext
				wend
				rsKat.close
				set rsKat = nothing
				Response.Write "</table></center>" &  CHR(13) & CHR(10)
			end if	
		end if
	end if	
else 
	if edit <> "New" then 
		Response.Write "<h2>Categories List:</h2>"  &  CHR(13) & CHR(10)
		sql = "SELECT  ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] " & _
		      " WHERE ArtKatNrParent = -1" 
		      
		set rsKat = ObjConnectionExecute(sql)
		While not rsKat.EOF
			DisplayCategory rsKat("Name"), 0, rsKat("ArtKatNr"), edit, "adminCategories.aspx"
			GetSubCategories rsKat("ArtKatNr"), 1, edit, "adminCategories.aspx"
			rsKat.MoveNext
		wend
		rsKat.close
		set rsKat = nothing
	end if	
end if

if edit = "New" then
	Response.Write "<input type='hidden' name='From' value='" & Request.QueryString("From") & "'>"  &  CHR(13) & CHR(10)
	Response.Write "<table width='100%' heigth='100%' border='0' cellspacing='2' cellpadding='0'>"  &  CHR(13) & CHR(10)
	Response.Write "<tr><td colspan='4' align='center' valign ='center'>"  &  CHR(13) & CHR(10)
    Response.Write "<h4><b>Add new " 
    if idKat <> "" then 
    	Response.Write "Sub"
    end if
 	Response.Write "Category </b></h4></td></tr>" & CHR(13) & CHR(10)%>
	<tr>	
		<td align="right">Name*:</td><td><input name="sName" style="width:200"></td>
		<td align="right" rowspan="6">Template:</td>
		<td rowspan="6"><textarea name="sTemplate" cols=60 rows=15></textarea></td>
	</tr>
	<tr><td align="right">Parent Category*:</td><td><%
	if idKat <> "" then
		Response.Write "<input type='hidden' name='sParentId' value='" & idKat & "'>"  & CHR(13) & CHR(10)
		Response.Write "<b><i>" & catname & "</i></b>"  & CHR(13) & CHR(10)
	else
		Response.Write "<select name='sParentId' style='width:200' >"  & CHR(13) & CHR(10)
		call WriteComboOptions( "[grArtikel-Kategorien]", "Name", "ArtKatNr", "" )
		Response.Write "</select>"  & CHR(13) & CHR(10)
	end if%>
	</td></tr>
	<tr><td align="right">Description:</td><td><input name="sDesc" style="width:200"></td></tr>
	<tr><td align="right">Aufshlag:</td><td><input name="sAufschlag" style="width:200"></td></tr>
	<tr><td align="right">Stylesheet:</td><td><input name="sStylesheet" style="width:200"></td></tr>
	<tr><td align="right">GewinnReferenz*:</td><td><input name="sGewinnReferenz" style="width:200"></td></tr>
	<tr><td align="right">Use Keywords from Child*:</td><td><input name="sUseKeywordsFromChild" style="width:200"></td></tr>
	<tr><td align="center" colspan='4'>&nbsp;</td></tr>
	<tr><td>&nbsp;</td><td align="center"><input type="submit" value="Add" name="AddSubButton" style="width:150" onClick="return Validator('s')"></td>
	<td align="center" colspan="2"><input type=button onClick="javascript:history.go(-1)" name="Cancel" value="Cancel" style="width:120"></tr></table>
<%end if	
Response.Write "</form>"

Sub DisplayCategory (txtDisplay, intLevel, idKat , qustr, page ) 
	Dim LevelCounter
	Response.Write "&nbsp;"
	For LevelCounter = 0 to intLevel 
		Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	Next
	Response.Write "<a href = """ & page & "?KatNr=" & idKat & qustr & """>" & (Trim(txtDisplay)) & "</a><br />"  & CHR(13) & CHR(10)
End Sub

Sub GetSubCategories( idParent, intLevel, qustr, page )
	Dim rsSub
	sql = "SELECT  ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] " & _
      " WHERE ArtKatNrParent = " & idParent 
	set rsSub = ObjConnectionExecute(sql)
		while not rsSub.EOF 
		DisplayCategory rsSub("Name"), intLevel, rsSub("ArtKatNr"), qustr, page
		GetSubCategories rsSub("ArtKatNr"), intLevel + 1, qustr, page
		rsSub.MoveNext
	wend
	Set rsSub = Nothing
End Sub

Sub DisplayCategoryInTab (txtDisplay, intLevel, idKat , qustr, page, grParent ) 
	Dim LevelCounter
	Response.Write "<tr><td>"
	Response.Write "&nbsp;"
	For LevelCounter = 0 to intLevel 
		Response.Write "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	Next
	Response.Write "<a href = """ & page & "?KatNr=" & idKat & qustr & """>" & (Trim(txtDisplay)) & "</a>"
	Response.Write "</td>"  & CHR(13) & CHR(10) & "<td align='center'>"
	call DrawButton( "DelSubButton", "Delete", "adminCategories.aspx?KatNr=" & grParent & "&edit=Sub&DeleteButton=" & idKat, "white" )
	Response.Write "</td></tr>"  & CHR(13) & CHR(10)
End Sub

Sub GetSubCategoriesInTab( idParent, intLevel, qustr, page, grParent )
	Dim rsSub
	sql = "SELECT  ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] " & _
      " WHERE ArtKatNrParent = " & idParent 
	set rsSub = ObjConnectionExecute(sql)
		while not rsSub.EOF 
		call DisplayCategoryInTab( rsSub("Name"), intLevel, rsSub("ArtKatNr"), qustr, page, grParent)
		call GetSubCategoriesInTab( rsSub("ArtKatNr"), intLevel + 1, qustr, page, grParent )
		rsSub.MoveNext
	wend
	rsSub.close
	Set rsSub = Nothing
End Sub

Sub WriteComboOptions( table, itemsField, valuesField, value )
	Dim sql
	Dim rsB 
	sql = "SELECT * FROM " & table & " ORDER BY " & itemsField
	set rsB = ObjConnectionExecute(sql)
	if valuesField <> "" then
		while not rsB.EOF 
			Response.Write "<option value=" & rsB( valuesField )
			if value <> "" and value = rsB( valuesField ) then
				Response.Write " SELECTED "
			end if
			Response.Write ">" & rsB( itemsField ) & "</option>"  & CHR(13) & CHR(10)
			rsB.MoveNext
		wend
	else
		while not rsB.EOF 
			Response.Write "<option" 
			if value <> "" and value = rsB( itemsField ) then
				Response.Write " SELECTED "
			end if
			Response.Write ">" & rsB( itemsField ) & "</option>"  & CHR(13) & CHR(10)
			rsB.MoveNext
		wend
	end if 	
	rsB.close
	set rsB = nothing 
End sub

call drawWindowPart2("Categories admin","","state",butArr)
%>