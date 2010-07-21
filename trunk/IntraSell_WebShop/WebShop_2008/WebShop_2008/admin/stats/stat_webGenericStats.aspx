<%
    Dim stat, sql_stat
    
    If UCase(Request("stat")) = UCase("Sessions") Then
        If Session("DBTYPE") = "MySQL" Then
            sql_stat = "SELECT date(round(webSessions.CreationDate)) as CreatedOn, Count(webSessions.SID) AS Sessions, Count(distinct webSessions.IP) AS IPs " & _
            " FROM webSessions " & _
            " GROUP BY date(round(webSessions.CreationDate)) " & _
            " ORDER BY date(round(webSessions.CreationDate)) DESC"
        Else
            sql_stat = "SELECT cdate(round(webSessions.CreationDate))  as CreatedOn, Count(webSessions.SID) AS Sessions, Count(distinct webSessions.IP) AS IPs " & _
                " FROM webSessions " & _
                " GROUP BY cdate(round(webSessions.CreationDate)) " & _
                " ORDER BY cdate(round(webSessions.CreationDate)) DESC"
        End If
    End If


    If UCase(Request("stat")) = UCase("Sales") Then
        If Session("DBTYPE") = "MySQL" Then
            sql_stat = "SELECT b.ArtNr, b.Bezeichnung, Sum(b.Stk) AS SumOfPieces " & _
             " FROM  buchRechnung a, `buchRech-Artikel` b WHERE a.Nummer = b.RechNr " & _
             " GROUP BY b.ArtNr, b.Bezeichnung " & _
             " ORDER BY Sum(b.Stk) DESC"
        Else
            sql_stat = "SELECT grArtikel.ArtNr, grArtikel.Bezeichnung, Sum(Stk) AS [SumOfPieces] " & _
             " FROM grArtikel INNER JOIN [buchRech-Artikel] ON grArtikel.ArtNr = [buchRech-Artikel].ArtNR " & _
             " GROUP BY grArtikel.ArtNr, grArtikel.Bezeichnung " & _
             " ORDER BY Sum(Stk) DESC"
        End If
    End If


    If UCase(Request("stat")) = UCase("Order") Then
        If Session("DBTYPE") = "MySQL" Then
		SQL_STAT ="SELECT date(round(Datum)) as Datum, Count(Nummer) AS Rechnungen " &_ 
		"FROM buchRechnung " & _ 
		"GROUP BY date(round(Datum)) " & _ 
		"ORDER BY date(round(Datum)) DESC"
        Else
		SQL_STAT ="SELECT buchRechnung.Datum, Count(buchRechnung.Nummer) AS Rechnungen " &_ 
		"FROM buchRechnung " & _ 
		"GROUP BY buchRechnung.Datum " & _ 
		"ORDER BY buchRechnung.Datum DESC"
        End If
    End If

    Response.Redirect("../../intrasoft/runSQLSelect.asp?SQLString=" & sql_stat)
%>