<%     
    Dim searchFreeText : searchFreeText = Request("searchFreeText")
    Dim keyword, keywordName, keywordValue
    Dim searchSql, whereClause
    Dim orderBy : orderBy = Request("OrderBy")
    Dim ArtKatNr : ArtKatNr = Request("ArtKatNr")
    Dim wherePartDescription

    
    'display possible category result
    Response.Write(displayCatListOnSeach(searchFreeText))

    If ArtKatNr = "" Then
        ArtKatNr = Session("ArtKatNr")
    Else
        Session("ArtKatNr") = ArtKatNr
    End If
      
    'Draw search form again
    Dim formName : formName = getTranslation("Suche in Kategorie ") & "'" & TableValue("[grArtikel-Kategorien]", "artKatNr", ArtKatNr, "Name") & "'"

    'QUERY CREATION 		
    If orderBy = "" Then
        orderBy = "ArtKatNr"
        whereClause = makeWherePart()
        wherePartDescription = makeWherePartDescription()
        searchSql = "SELECT ArtNr, EAN, Bezeichnung, Bezeichnung1, LieferantNr, ArtKatNr, " & _
          " PreisEuro, PreisATS, MWST, AngelegtAm, grArtikel.Picture, Firma FROM grArtikel, lieferantenAdressen " & _
           " Where grArtikel.herstellerNr = lieferantenAdressen.idnr and " & whereClause '& " ORDER BY " & OrderBy						 	 						 
        'save user query 
        'Response.Write "Login=" &  getLOGIN()
        Dim loggedIn : loggedIn = getLOGIN() & ""
        If Trim(loggedIn) <> "" Then
            If getLOGIN() > 0 Then
                Dim USER_FRIENDLY_QUERY
                USER_FRIENDLY_QUERY = Request.Form
                'call saveUserQuery(getLOGIN(), "LastProductSearch " & USER_FRIENDLY_QUERY, searchSql, "no-email")	
                'response.write  " Ihre Abfrage wurde gespeichert f&uuml;r sp&auml;tere Verwendung. Diese finden Sie im My Account!<BR>"	  
            End If
        End If
		
    Else  ' the user requested order by 
        searchSql = Session("LAST_QUERY")
        'remove old order by 
        If InStr(searchSql, "ORDER BY") > 0 Then searchSql = Left(searchSql, InStr(searchSql, "ORDER BY") - 1)
        'add new order by 
        searchSql = searchSql & " ORDER BY " & orderBy
        whereClause = searchSql
    End If

    'ERROR no SEARCH ATTR
    If Len(whereClause) <= Len(DEFAULT_PRODUCT_SEARCH_WHERE) Then
        Call drawErrorBox(getTranslation("Suche ohne Kriterien"), getTranslation("Sie haben ohne Kriterien gesucht! M&ouml;chten Sie jetzt Kriterien festlegen?"), "default.aspx", "")
    Else
        'END BUILD WHERE CONDITION
        'save query 
        'Session("LAST_QUERY") = searchSql
        If showDebug() Then Response.Write("Ihre Suche: sql=" & searchSql)
        Response.Write(getTranslation("Suchergebnis... moment, bitte..."))
        'Response.Flush	
        Response.Write(makeProductListOnQuery(searchSql, "", "", wherePartDescription))
    End If
		
%>
