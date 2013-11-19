<!--#include file="../../client/intrasoft/menu.asp"-->
<%
'on error resume next
'**********************************************************************
' used to update
'**********************************************************************

'UPDATE prices function 

dim SQL_STAT

SQL_STAT = "UPDATE    grArtikel SET reduntantHerstellerName = " & _ 
           " (SELECT Firma FROM [lieferantenAdressen] " & _ 
           " WHERE      idnr = lieferantNr) WHERE (ArtNr > 25000) AND (ArtNr < 45000)"
response.redirect "../../client/intrasoft/runSQLSelect.asp?SQLString=" & Server.URLEncode ( SQL_STAT ) & "&ShowSQL=TRUE&PageTitle=<br>DELETE PRODUCTS"


%>