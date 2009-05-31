<!--#include file="../client/intrasoft/menu.asp"-->
<%Dim butArr(3,2)
butArr(3,1) = "more Product functions"
butArr(3,2) = "genericAsp/tableRedirector_grArtikel.asp?KatNr=" & Request("KatNr")
butArr(2,1) = "Edit Category"
butArr(2,2) = "adminCategories.asp"
butArr(1,1) = "Keywords"
butArr(1,2) = "adminCategoriesKeywords.asp"

call drawWindowPart1("Products admin","","state",butArr)
Dim rsKat
Dim rsArt
Dim rs
Dim sql 
Dim count
Dim keywords
Dim start
Dim final
Dim sortby
Dim desc 
Dim searchStr
Dim qString
Dim quString
Dim ArtNr
Dim ArtKatNr

ArtNr = Request("ArtNr")
ArtKatNr = Request("KatNr")
desc = Request("desc")
start = Request("start")
sortby = Request("order")
searchStr = Request.Form("searchStr")
if searchStr = "" then searchStr = Request("searchStr")
if start = "" then 
	start = 1
else
	start = CInt( start )
end if

qString="?start=" & start 
if sortby <> "" then qString= qString & "&order=" & sortby
if desc <> "" then qString= qString & "&desc=" & desc
if searchStr <> "" then qString= qString & "&searchStr=" & searchStr    
		
Function SetQueryString( newSortBy )
	Dim str 
	if  searchStr <> "" then
		str = "&searchStr=" & searchStr
	else
		str = ""
	end if					
	if ( sortby = newSortBy ) then
		if desc= "" then 
			SetQueryString = "?start=" & start & "&order=" & newSortBy & "&desc=DESC" & str
			Exit Function
		end if
		if desc= "DESC" then 
			SetQueryString = "?start=" & start & "&order=" & newSortBy & str
			Exit Function
		end if	
	else 
		SetQueryString = "?start=" & start & "&order=" & newSortBy & str
		Exit Function
	end if
End Function


if Request("SetButton") <> "" then
	ArtNr = Request("fArtNr")
	ArtKatNr = Request("fKatNr")
	sql = "SELECT * From priceCompareKeyWords WHERE ArtKatNr = " & ArtKatNr
	set rsKat = ObjConnection.execute(sql)	  
	while not rsKat.EOF 
		sql = "SELECT ArtNr, Bezeichnung From grArtikel WHERE ArtNr = " & ArtNr
		set rsArt = ObjConnection.execute(sql)	  
		sql = "SELECT * From priceCompareKeyWordsToProducts WHERE KeyWordId = " & rsKat("KeyWordId") & _
		      " and ArtNr = " & ArtNr
		set rsArt = ObjConnection.execute(sql)	
		value = Request(rsKat("Name"))
		if rsArt.BOF and rsArt.EOF then 
			if value <> "" then ' insert new value
				sql = "INSERT INTO priceCompareKeyWordsToProducts (id, ArtNr,KeyWordId,[value])" & _
					  " Values(" & nextId("priceCompareKeyWordsToProducts","id") & ", " & ArtNr & "," & rsKat("KeyWordId") & ",'" & value & "')"
				'& NextId("priceCompareKeyWordsToProducts","Id") & ","
				ObjConnection.execute(sql)	  
			end if
		else ' update	
			sql = "UPDATE priceCompareKeyWordsToProducts Set [Value]='" & value & _ 
			"' WHERE Id = " & rsArt("Id")  
			ObjConnection.execute(sql)	  
		end if
		rsKat.MoveNext
	wend
	rsKat.close 
	set rsKat = nothing 
	ArtNr = ""
	'ArtKatNr = ""
end if

Response.Write "<form name=""Products"" action=""adminProdukts.asp" & qString & """ method=""POST"">"
if ArtNr <> "" and ArtKatNr <> "" then 
	sql = "SELECT * From priceCompareKeyWords WHERE ArtKatNr = " & ArtKatNr
	set rsKat = ObjConnection.execute(sql)	  
	sql = "SELECT ArtNr, Bezeichnung From grArtikel WHERE ArtNr = " & ArtNr
	set rsArt = ObjConnection.execute(sql)	  
	ArtName = rsArt("Bezeichnung")
	Response.Write "<input type=""hidden"" name=""fArtNr"" value=""" & ArtNr & """>"
	Response.Write "<input type=""hidden"" name=""fKatNr"" value=""" & ArtKatNr & """>"
	Response.Write "<center><table width=""70%"" height=""50%"" border=""0"" cellspacing=""0"" cellpadding=""2"">"
		
	Response.Write "<tr><td align=""center"" colspan=""3""><h3><b>Keywords values for produkt:<br>" & ArtName & "</b><h3></td></tr>"
	
	while not rsKat.EOF 
		Response.Write "<tr><td align=""right"">" & rsKat("Name") & ":</td>"
		sql = "SELECT * From priceCompareKeyWordsToProducts WHERE KeyWordId = " & rsKat("KeyWordId") & " and ArtNr = " & ArtNr
		set rsArt = ObjConnection.execute(sql)
		if rsArt.BOF and rsArt.EOF then
			value = ""
		else	
			value = rsArt("Value")
		end if
		Response.Write "<td align=""center"" colspan=""2""><input name=""" & rsKat("Name") & """ value=""" & value & """></td></tr>"
		rsKat.MoveNext
	wend	
	Response.Write "<tr><td></td><td align=""center""><input type=""submit"" value=""Set Values"" name=""SetButton""></td>"
	Response.Write "<td align=""center""><input type=""submit"" value=""Cancel"" name=""CancelButton""></td></tr>"
	Response.Write "</table></center>"
else
	sql = " SELECT grArtikel.ArtNr,grArtikel.Bezeichnung, [grArtikel-Kategorien].Name, grArtikel.ArtKatNr FROM grArtikel,[grArtikel-Kategorien]" & _
		  " WHERE grArtikel.ArtKatNr=[grArtikel-Kategorien].ArtKatNr " 
	if ArtKatNr <> "" then
		sql = sql & " and grArtikel.ArtKatNr = " & ArtKatNr
	end if	
	if Request.QueryString("SearchButton") <> "" or searchStr <> "" then 
		sql = sql & " and [Bezeichnung] Like '%" & Request("SearchStr") & "%' "
	end if	
	if ( sortby <> "" ) then	
		sql = sql & " ORDER BY [" & sortby & "]" & desc
	end if	
	set rsArt = ObjConnection.execute(sql)	  
	count = 0 
	if rsArt.BOF and rsArt.EOF then ' no produkts
		Response.Write "<br><h3><b>No produkts to display ! </b><h3><br>"
	else
		while not rsArt.EOF
			count = count + 1
			rsArt.MoveNext 
		wend
		final = start + 19 
		%>
	    <table width="100%" height="40%" border="3" bordercolor="#FFFFFF" cellspacing="0" cellpadding="2">
	    <tr height = "5%"><td colspan="5" align="center" valign ="center">
	    
			<h3><b>Produkts List</b></h3></td>
		</tr>
		<tr bordercolor="#000080">	
			<td align="center"><a href="adminProdukts.asp<%=SetQueryString( "ArtNr" )%>"><b>ArtNr</b></a></td>
			<td align="center" width="40%"><a href="adminProdukts.asp<%=SetQueryString( "Bezeichnung" )%>"><b>Bezeichnung<b></a></td>
			<td align="center"><a href="adminProdukts.asp<%=SetQueryString( "Name" )%>"><b>Category Name</b></a></td>
			<td align="center" colspan="2"><b>Actions</b></td>
		</tr>
		<%if final > count then 
			final = count
		end if	
		rsArt.MoveFirst
		for i = 0 to start - 2
			rsArt.MoveNext
		next	
				
		for i = start to final
			Response.Write "<tr bordercolor=""#000080"">"
			Response.Write "<td align='center'>" & rsArt("ArtNr") & "</td>"
			Response.Write "<td align='center'>" & rsArt("Bezeichnung") & "</td>"
			Response.Write "<td align='center'>" & rsArt("Name") & "</td>"
			Response.Write "<td align='center'><a href='adminCategoriesKeywords.asp" & qString & "&KatNr=" & rsArt("ArtKatNr") & "'>Edit Category Keywords</a></td>"	
			Response.Write "<td align='center'>"
			sql = "SELECT KeyWordId From priceCompareKeyWords WHERE ArtKatNr = " & rsArt("ArtKatNr")
			set rsKat = ObjConnection.execute(sql)	  
			if rsKat.BOF and rsKat.EOF then ' no keywords
				Response.Write "No keywords availible!"
			else
				Response.Write "<a href='adminProdukts.asp" & qString & "&KatNr=" & rsArt("ArtKatNr") & "&ArtNr=" & rsArt("ArtNr") & "'>Edit Keyword values</a>"
			end if		
			Response.Write "</td></tr>"	
			rsArt.MoveNext
		next
		%>
		</table>
		<br>
		<%Response.Write "<b>Records " & start & " to " & final & " of " & count & "<b><br>"
		if final < ( count + 20 ) then
			if sortby <> "" then quString= quString & "&order=" & sortby
			if desc <> "" then quString= quString & "&desc=" & desc
			if searchStr <> "" then quString= quString & "&searchStr=" & searchStr    

			'quString="&order=" & sortBy & "&desc=" & desc & "&searchStr=" & searchStr				
			if start > 1 then
				Response.Write "<STRONG><A HREF='adminProdukts.asp?start=" & start - 20 & quString & "'>[&lt;&lt;&nbsp;Previous&nbsp;]</A></STRONG>"
			end if	
			i=1
			j = 1
			while i < start
				Response.Write "<STRONG><A HREF='adminProdukts.asp?start=" & i & quString & "'>" & j & "</A>&nbsp;</STRONG><br>"
				i = i + 20
				j= j + 1
			wend 
			if count > 20  then
				Response.Write "<STRONG>" & j & "&nbsp;</STRONG>"
			end if
			i = i + 20
			j = j + 1
			while i < count
				Response.Write "<STRONG><A HREF='adminProdukts.asp?start=" & i & quString & "'>" & j & "</A>&nbsp;</STRONG>"
				i = i + 20
				j= j + 1
			wend 
			if ( start + 20 ) < count then
				Response.Write "<STRONG><A HREF='adminProdukts.asp?start=" & start + 20 & quString & "'>[&nbsp;Next&nbsp;&gt;&gt;]</A></STRONG>"
			end if	
		end if	
		%>
		<br>
		<br>
		<table width="80%" border="1" cellspacing="0" cellpadding="5">
		<tr><td>Search for:</td>
		<td><input name="SearchStr" style="width=200"></td>
		<td><input type="submit" value="Search Now" name="SearchButton"></td>
		</td></tr></table>
		<br>
	</form>
	<%
		end if
	end if
	call drawWindowPart2("Products admin","","state",butArr)
	%>	