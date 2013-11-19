
<%     
Dim searchFreeText: searchFreeText = Request("searchFreeText")
Dim keyword, keywordName, keywordValue
Dim searchSql, whereClause
Dim orderBy: OrderBy = Request("OrderBy") 
Dim ArtKatNr: ArtKatNr = request("ArtKatNr")
Dim wherePartDescription

    
    'display possible category result
    Response.Write displayCatListOnSeach(searchFreeText)

	if ArtKatNr = "" then 
	    ArtKatNr = session("ArtKatNr")
	else 
	    Session("ArtKatNr")= ArtKatNr
	end if
      
     'Draw search form again
	  Dim formName: formName = getTranslation("Suche in Kategorie ") & "'" & TableValue("[grArtikel-Kategorien]","artKatNr",artKatNr,"Name") & "'"

     'QUERY CREATION 		
		if OrderBy ="" then 
				OrderBy = "ArtKatNr"
				whereClause = makeWherePart()
				wherePartDescription = makeWherePartDescription()
				searchSql = "SELECT ArtNr, EAN, Bezeichnung, Bezeichnung1, LieferantNr, ArtKatNr, " & _ 		   
						" PreisEuro, PreisATS, MWST, AngelegtAm, grArtikel.Picture, Firma FROM grArtikel, lieferantenAdressen " & _ 
		 				" Where grArtikel.herstellerNr = lieferantenAdressen.idnr and " & whereClause '& " ORDER BY " & OrderBy						 	 						 
				'save user query 
				'Response.Write "Login=" &  getLOGIN()
				dim loggedIn : loggedIn =  getLOGIN() &"" 
				if  trim(loggedIn) <> ""  then 
						if getLOGIN() > 0 then 
							Dim USER_FRIENDLY_QUERY
							USER_FRIENDLY_QUERY = Request.Form
							'call saveUserQuery(getLOGIN(), "LastProductSearch " & USER_FRIENDLY_QUERY, searchSql, "no-email")	
							'response.write  " Ihre Abfrage wurde gespeichert f&uuml;r sp&auml;tere Verwendung. Diese finden Sie im My Account!<BR>"	  
						end if 
				end if 
		
		else  ' the user requested order by 
				searchSql = Session("LAST_QUERY")
				'remove old order by 
				if inStr(searchSql, "ORDER BY") > 0 then  searchSql = left(searchSql, inStr(searchSql, "ORDER BY")-1)
				'add new order by 
				searchSql = searchSql & " ORDER BY " & OrderBy
				whereClause = searchSql
		end if    

		'ERROR no SEARCH ATTR
		if len(whereClause) <= len(DEFAULT_PRODUCT_SEARCH_WHERE) then 
		     call drawErrorBox(getTranslation("Suche ohne Kriterien"), getTranslation("Sie haben ohne Kriterien gesucht! M&ouml;chten Sie jetzt Kriterien festlegen?"), "default.asp", "")
		else 
			'END BUILD WHERE CONDITION
			'save query 
			'Session("LAST_QUERY") = searchSql
			if showDebug() then Response.Write "Ihre Suche: sql=" & searchSql				    
			Response.Write getTranslation("Suchergebnis... moment, bitte...")
			'Response.Flush	
			Response.Write  makeProductListOnQuery(searchSql, "", "", wherePartDescription)
		end if 
		
%>

 