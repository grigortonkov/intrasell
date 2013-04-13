<!--#include file="../../client/intrasoft/menu.asp"-->
<%
'on error resume next
'**********************************************************************
' used to delete not usefull preice archives
'**********************************************************************

'delete prices function 

dim SQL_STAT

SQL_STAT = "SELECT count(*)  FROM priceCompareLieferantenArtikelPreiseArchive where preisId in ( select preisId " & _ 
" FROM priceCompareLieferantenArtikelPreiseArchive p1 " & _ 
" WHERE EXISTS " & _ 
 "        (SELECT TOP 100 * " & _ 
  "    FROM priceCompareLieferantenArtikelPreiseArchive p2 " & _ 
  "    WHERE p1.lieferantnr = p2.lieferantnr AND  " & _ 
  "         p1.artikelnr = p2.artikelnr AND  " & _ 
  "         p1.preisDatum > p2.preisdatum AND  " & _ 
  "         p2.EKPREIS = p1.EKPREIS AND NOT EXISTS " & _ 
  "             (SELECT TOP 100 * " & _ 
  "           FROM priceCompareLieferantenArtikelPreiseArchive p3 " & _ 
  "           WHERE p1.artikelnr = p3.artikelnr  and p1.lieferantnr = p3.lieferantnr and p1.preisDatum > p3.preisdatum AND  " & _ 
  "                p3.preisDatum > p2.preisdatum)))"
response.redirect "../../client/intrasoft/runSQLSelect.asp?SQLString=" & Server.URLEncode ( SQL_STAT ) & "&ShowSQL=TRUE&PageTitle=<br>DELETE PRODUCTS"


%>