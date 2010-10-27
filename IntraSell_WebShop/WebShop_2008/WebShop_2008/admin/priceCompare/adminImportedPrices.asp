<!--#include file="../client/intrasoft/menu.aspx"-->
<%Dim butArr(3,2)
Dim sql
Dim rs
Dim merchname
Dim count
Dim merch
merch = Request ("merch")
butArr(1,1) = "Get Prices"
butArr(1,2) = "adminGetPrices.aspx"
butArr(2,1) = "Import Prices"
butArr(2,2) = "adminImportPrices.aspx"
butArr(3,1) = "FTP Settings"
butArr(3,2) = "adminMerchantsFtp.aspx"

call drawWindowPart1("Admin Lieferanten imported prices","","state",butArr)	
'Response.Write "<h3><B>MERCH = " & merch & "</b></h3><br />"
if merch = "" then		
	sql = " SELECT  lieferantenAdressen.* FROM lieferantenAdressen " & _
	      " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR = priceCompareHaendler.lieferantNr "
	set rs = ObjConnectionExecute(sql)
	Response.Write "<b> Select a merchant from the list : <b><br /> "
	While not rs.EOF
'		Response.Write "&nbsp;&nbsp;&nbsp;<A href=""adminImportedPrices.asp?merch=" & rs("IDNR") & """><b>" & rs("Firma") & "</b></a><br />"
		%>&nbsp;&nbsp;&nbsp;<A href="adminImportedPrices.asp?merch=<%=rs("IDNR")%>"><b><%=rs("Firma")%></b></a><br /><%
		rs.MoveNext
	wend
else ' merch <> ""
	Response.Redirect "genericasp/tableRedirector_lieferantenArtikel_Preise.asp?LieferantNr=" & merch
end if
rs.close
set rs = nothing
call drawWindowPart2("Admin Merchants Payment Settings","","state",butArr) %>
