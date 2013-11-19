<!--#include file="../../client/intrasoft/menu.asp"-->
<%
'on error resume next
'**********************************************************************
' UpdatePreises
' updates the selling prices with the Aufschlag from the article category
'**********************************************************************

'delete prices function 

dim SQL_STAT

SQL_STAT = "SELECT  * from grArtikel where ArtNr in (select ArtikelNr from [lieferantenArtikel-Preise] where LieferantNr = 0) " & _ 
           " AND artKatNr=1 AND Bezeichnung Like '%' " & _ 
           " AND EAN Like '%'"
response.redirect "../../client/intrasoft/runSQLSelect.asp?SQLString=" & Server.URLEncode ( SQL_STAT ) & "&ShowSQL=TRUE&PageTitle=<br>DELETE PRODUCTS"


%>