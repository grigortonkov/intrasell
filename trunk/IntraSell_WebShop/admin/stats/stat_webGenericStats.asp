<%
dim stat, sql_stat

if request("stat") = "Sessions" then 
SQL_STAT = "SELECT cdate(round(webSessions.CreationDate)), Count(webSessions.SID) AS CountOfSID " & _ 
	" FROM webSessions " & _ 
	" GROUP BY cdate(round(webSessions.CreationDate)) " & _ 
	" ORDER BY cdate(round(webSessions.CreationDate)) DESC" 
end if 


if request("stat") = "Sales" then 
SQL_STAT ="SELECT grArtikel.ArtNr, grArtikel.Bezeichnung, Sum([buchRech-Artikel].Stk) AS [Summe von Stk] " & _ 
	" FROM grArtikel INNER JOIN [buchRech-Artikel] ON grArtikel.ArtNr = [buchRech-Artikel].ArtNR " & _ 
	" GROUP BY grArtikel.ArtNr, grArtikel.Bezeichnung " & _ 
	" ORDER BY Sum([buchRech-Artikel].Stk) DESC"
end if


if request("stat") = "Order" then 
SQL_STAT ="SELECT buchRechnung.Datum, Count(buchRechnung.Nummer) AS [Anzahl von Nummer] " &_ 
"FROM buchRechnung " & _ 
"GROUP BY buchRechnung.Datum " & _ 
"ORDER BY buchRechnung.Datum DESC"
end if 

response.redirect "../../intrasoft/runSQLSelect.asp?SQLString=" & SQL_STAT
%>