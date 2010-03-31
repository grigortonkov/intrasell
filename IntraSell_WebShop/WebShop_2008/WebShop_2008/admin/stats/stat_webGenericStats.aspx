<%
    Dim stat, sql_stat

    If Request("stat") = "Sessions" Then
        sql_stat = "SELECT cdate(round(webSessions.CreationDate)), Count(webSessions.SID) AS CountOfSID " & _
         " FROM webSessions " & _
         " GROUP BY cdate(round(webSessions.CreationDate)) " & _
         " ORDER BY cdate(round(webSessions.CreationDate)) DESC"
    End If


    If Request("stat") = "Sales" Then
        sql_stat = "SELECT grArtikel.ArtNr, grArtikel.Bezeichnung, Sum([buchRech-Artikel].Stk) AS [Summe von Stk] " & _
         " FROM grArtikel INNER JOIN [buchRech-Artikel] ON grArtikel.ArtNr = [buchRech-Artikel].ArtNR " & _
         " GROUP BY grArtikel.ArtNr, grArtikel.Bezeichnung " & _
         " ORDER BY Sum([buchRech-Artikel].Stk) DESC"
    End If


    If Request("stat") = "Order" Then
        sql_stat = "SELECT buchRechnung.Datum, Count(buchRechnung.Nummer) AS [Anzahl von Nummer] " & _
        "FROM buchRechnung " & _
        "GROUP BY buchRechnung.Datum " & _
        "ORDER BY buchRechnung.Datum DESC"
    End If

    Response.Redirect("../../intrasoft/runSQLSelect.asp?SQLString=" & sql_stat)
%>