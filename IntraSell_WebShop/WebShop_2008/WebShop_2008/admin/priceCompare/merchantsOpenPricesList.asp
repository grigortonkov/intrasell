<!--#include file="../client/intrasoft/menu.aspx"-->

<%
Dim sql
Dim rs
Dim merch
Dim csValues
Dim rsImp
Dim IDtoDelete
Dim IDtoImport
Dim liefID
Dim strSplit
merch = Request("merch")
if merch = "" then merch = Request("selMerchant")
IDtoDelete = Request("delID")
IDtoImport = Request("impID")
if IsNull(Session("objConnection")) then 
    Response.Write "No Database Connection!"
    Response.end
else 
	set objConnection = Session("objConnection")
end if
if merch <> "" then
	sql = " SELECT IDNR FROM lieferantenAdressen WHERE Firma LIKE '" & merch & "'"
	set rs = ObjConnectionExecute(sql)
	liefID = rs("IDNR")
end if	

sql = "SELECT  lieferantenAdressen.Firma FROM lieferantenAdressen " & _
      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
set rs = ObjConnectionExecute(sql)
%>
<form action="merchantsOpenPricesList.aspx" method=post id=form1 name=form1>
<input type="hidden" name="merch" value="<%=merch%>">
<h2>Merchantauswahl: 
<select id="sel1" name="selMerchant" onchange="doSubmit();"> <!-- style="width: 183; height: 23">-->
<%While not rs.EOF%>
	<OPTION <%if rs("Firma") = merch then Response.Write "selected"%>><%=rs("Firma")%></OPTION>
	<%rs.MoveNext
wend%>
</select></h2>
<%
if IDtoDelete <> "" then
	if IDtoDelete = "all" then  'delete all
		SQL = "DELETE FROM priceComparePricesToImport WHERE LieferantNr = " & liefID	
		ObjConnectionExecute(SQL) 
	else ' delete only one 
		SQL = "DELETE FROM priceComparePricesToImport WHERE ID = " & IDtoDelete
		ObjConnectionExecute(SQL) 
	end if	
end if	
if IDtoImport <> "" then
	if IDtoImport = "all" then  'import all
		SQL = "SELECT * FROM priceComparePricesToImport WHERE LieferantNr = " & liefID
		set rsImp = ObjConnectionExecute(SQL) 
		while not rsImp.EOF
			csValues = Split( rsImp("Line" ), ";" )
			sql = "INSERT INTO [lieferantenArtikel-Preise] (PreisId, LieferantNr, ArtikelNr, EKPreis, PreisDatum ) " & _
				  " Values(" & NextId("[lieferantenArtikel-Preise]","PreisId") & ", " & liefID & _
				  "," & NextId("grArtikel","ArtNr") & "," & csValues(1) & ",'" & rsImp("FromDate") & "' )"	
			ObjConnectionExecute(sql) 
			rsImp.MoveNext
		wend
			
		SQL = "DELETE FROM priceComparePricesToImport WHERE LieferantNr = " & liefID	
		ObjConnectionExecute(SQL) 
	else ' import only one 
		SQL = "SELECT * FROM priceComparePricesToImport WHERE LieferantNr = " & liefID & " and ID = " & IDtoImport
		set rsImp = ObjConnectionExecute(SQL) 
		strSplit = CStr(rsImp("Line"))
		Response.Write " LINE : " & strSplit
		csValues = Split( strSplit , ";" )
		'sql = "INSERT INTO grArtikel (ArtNr, Bezeichnung, ArtikelNr, EKPreis, PreisDatum ) " & _
		sql = "INSERT INTO [lieferantenArtikel-Preise] (PreisId, LieferantNr, ArtikelNr, EKPreis, PreisDatum ) " & _
		      " Values(" & NextId("[lieferantenArtikel-Preise]","PreisId") & ", " & liefID & _
		      "," & NextId("grArtikel","ArtNr") & "," & csValues(1) & ",'" & GermanSQLDate( rsImp("FromDate")) & "' )"	
		Response.Write " <br> SQL : " & sql
		ObjConnectionExecute(sql) 
		sql = "DELETE FROM priceComparePricesToImport WHERE ID = " & IDtoDelete
		ObjConnectionExecute(SQL) 
		
	end if	
end if	
if merch <> "" then
	SQL = "SELECT * FROM priceComparePricesToImport WHERE LieferantNr = " & liefID	
	Response.Write sql
	set rsImp = ObjConnectionExecute(SQL) 
	if rsImp.BOF and rsImp.EOF then ' nothing to import
		Response.Write "<h2>There is nothing to import for merchant:&nbsp;" & merch & "</h2>"
	else %>
<h2>Not imported Prices of&nbsp; <%=merch%></h2>

<p>Aktionen: 
<a href="merchantsOpenPricesList.asp?impID=all&merch=<%=merch%>">Import All&nbsp;</a>&nbsp;&nbsp; 
<a href="merchantsOpenPricesList.asp?delID=all&merch=<%=merch%>">Delete All</a></p>
<table border="1" width="100%" height="21">
  <tr>
    <td width="20%" height="19">Id</td>
    <td width="40%" height="19">Name</td>
    <td width="20%" height="19">Preis</td>
    <td width="20%" height="19">Seit</td>
  </tr>
  <%while not rsImp.EOF
	csValues = Split( rsImp("Line" ), ";" )%>
  <tr>
    <td width="20%" height="1">
    <a href="merchantsOpenPricesList.asp?impID=<%=rsImp("ID")%>&merch=<%=merch%>">Import</a>&nbsp; 
    <a href="merchantsOpenPricesList.asp?delID=<%=rsImp("ID")%>&merch=<%=merch%>">Del</a></td>
    <td width="40%" height="1"><%=csValues(0)%></td>
    <td width="20%" height="1" align="right"><%=FormatNumber(csValues(1),2)%></td>
    <td width="20%" height="1"><%=rsImp("FromDate")%></td>
  </tr>
  <%rsImp.MoveNext
  wend%>
</table>
<%	end if
end if %>
</form>
<SCRIPT LANGUAGE="JavaScript">
	function doSubmit() {
		document.forms("form1").item("merch").value = document.forms("form1").item("selMerchant").value ;
		document.forms("form1").submit();
	}	
</SCRIPT>
</body>
</html>
