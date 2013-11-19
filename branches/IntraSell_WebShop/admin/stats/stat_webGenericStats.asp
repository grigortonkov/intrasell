<%
dim stat, sql_stat

if ucase(request("stat")) = ucase("Sessions") then
    if Session("DBTYPE") = "MySQL" then
            SQL_STAT = "SELECT date(round(webSessions.CreationDate)) as CreatedOn, Count(webSessions.SID) AS Sessions, Count(distinct webSessions.IP) AS IPs " & _
            " FROM webSessions " & _
            " GROUP BY date(round(webSessions.CreationDate)) " & _
            " ORDER BY date(round(webSessions.CreationDate)) DESC"
    else
        SQL_STAT = "SELECT cdate(round(webSessions.CreationDate))  as CreatedOn, Count(webSessions.SID) AS Sessions, Count(distinct webSessions.IP) AS IPs " & _
            " FROM webSessions " & _
            " GROUP BY cdate(round(webSessions.CreationDate)) " & _
            " ORDER BY cdate(round(webSessions.CreationDate)) DESC"
    end if
end if 


if ucase(request("stat")) = ucase("Sales") then 
	if Session("DBTYPE") = "MySQL" then 
		SQL_STAT ="SELECT b.ArtNr, b.Bezeichnung, Sum(b.Stk) AS SumOfPieces " & _ 
			" FROM  buchRechnung a, `buchRech-Artikel` b WHERE a.Nummer = b.RechNr " & _ 
			" GROUP BY b.ArtNr, b.Bezeichnung " & _ 
			" ORDER BY Sum(b.Stk) DESC"
	else 
		SQL_STAT ="SELECT grArtikel.ArtNr, grArtikel.Bezeichnung, Sum(Stk) AS [SumOfPieces] " & _ 
			" FROM grArtikel INNER JOIN [buchRech-Artikel] ON grArtikel.ArtNr = [buchRech-Artikel].ArtNR " & _ 
			" GROUP BY grArtikel.ArtNr, grArtikel.Bezeichnung " & _ 
			" ORDER BY Sum(Stk) DESC"
	end if 
end if


if ucase(request("stat")) = ucase("Order") then 
	if Session("DBTYPE") = "MySQL" then 
		SQL_STAT ="SELECT date(round(Datum)) as Datum, Count(Nummer) AS Rechnungen " &_ 
		"FROM buchRechnung " & _ 
		"GROUP BY date(round(Datum)) " & _ 
		"ORDER BY date(round(Datum)) DESC"
	else 
		SQL_STAT ="SELECT buchRechnung.Datum, Count(buchRechnung.Nummer) AS Rechnungen " &_ 
		"FROM buchRechnung " & _ 
		"GROUP BY buchRechnung.Datum " & _ 
		"ORDER BY buchRechnung.Datum DESC"
	end if 
end if 

response.redirect "../../intrasoft/runSQLSelect.asp?SQLString=" & SQL_STAT
%>