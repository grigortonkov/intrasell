<script language="VB" runat="server">  
    '******************************************************************
    ' Function [createSearchForm]
    ' Description [Creates the search form for the searchPage]
    ' Autor: Grigor Tonkov
    ' Changes: 
    '******************************************************************
    Function createSearchForm(ByVal categoryId)
        Dim temp
        Dim CACHE_NAME : CACHE_NAME = "SUB_CAT_SEARCHFORM_" & categoryId
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, createSearchFormNoCache(categoryId))
        End If
        createSearchForm = temp
    End Function


    ''' <summary>
    ''' createSearchFormNoCache
    ''' </summary>
    ''' <param name="categoryId"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function createSearchFormNoCache(ByVal categoryId)

        Dim searchFreeText : searchFreeText = Request("searchFreeText")
        Dim currentSQL : currentSQL = Session("CURRENT_SEARCH")
  
        Const MAX_KEYWORDS_TO_SHOW = 15
        'TODO: make one Query for this 2 queries 
        Dim sql, rs, rsSub, html
        Dim use : use = tableValue("[grArtikel-Kategorien]", "ArtKatNr", categoryId, "useKeywordsFromChild")
        Dim catName : catName = tableValue("[grArtikel-Kategorien]", "ArtKatNr", categoryId, "Name")
   
        'response.write "use=[" & use & "]"
        If use = "-1" Or use = "1" Or use = True Then 'use from childs 
            sql = "SELECT min(KeywordId) as KeywordId, [Name], 0 as MaxSizeForComboBox FROM [grArtikel-KeyWords] Where NOT (Enabled=0) " & _
                  " and ArtKatNR in ( " & makeSubcategoriesList(categoryId, 3) & " ) Group By [Name] Order By [Name]"
        Else 'do not use from childs 
            sql = "SELECT * FROM [grArtikel-KeyWords] Where Enabled<>0 AND ArtKatNR=" & categoryId & " Order By [GruppeName],[Name]"
        End If
        'response.write sql:Response.Flush
        rs = objConnectionExecute(sql)
   
   
        html = html & "<table border=""0"" ><tr>"
        html = html & "<form action=""default.aspx"" method=""POST"">"
   
        html = html & "<input type=""Hidden"" name=""PageToShow"" value=""productSearchOnKeywords"">"
        html = html & "<input type=""Hidden"" name=""preKatNr"" value=""" & categoryId & """>"
   
        html = html & "<td>"
   
   
        If catName <> "" Then
            html = html & getTranslation("Suche") & " " & getTranslation("in") & " " & catName
        Else
            html = html & getTranslation("Suche")
        End If
   
        If Not rs.EOF Then html = html & "<br>"
        'free text search 
        html = html & "<input name=""searchFreeText"" value=""" & searchFreeText & """ size=""7"" style=""width: 70%; position: relative;""></td></tr>"
   
   
        'Hesrteller
        html = html & "<tr><td>" & getTranslation("Hersteller") & "<br>" & makeSelectForHersteller(categoryId, currentSQL, Request("Hersteller")) & "</td></tr>"
   
        html = html & "<tr><td>"
        'Min Preis
        html = html & "<table border=0><tr><td>Min " & getTranslation("Preis") & "</td><td><input type=""input"" name=""MinPreis"" size=5></td></tr>"
        'Max Preis 
        html = html & "<tr><td>Max " & getTranslation("Preis") & "</td><td><input type=""input"" name=""MaxPreis"" size=5></td></tr></table>"
        html = html & "</td><tr>"
   
        Dim i : i = 0
        While Not rs.EOF And i < MAX_KEYWORDS_TO_SHOW
            i = i + 1
            Dim kwName : kwName = Server.HtmlEncode(rs("Name").Value)
            html = html & "<tr><td>"
            sql = "Select distinct [value] from [grArtikel-KeyWordsToProducts] Where KeywordId=" & rs("KeywordId").Value & " ORDER BY [VALUE]"
            rsSub = objConnectionExecute(sql)
      
            'html = html & "<td>" 
            'make keywords 
            Dim maxSize : maxSize = 0
            If IsNumeric(rs("MaxSizeForComboBox").Value) Then
                maxSize = rs("MaxSizeForComboBox").Value * 1
            Else
                maxSize = 0
            End If
      

            'According max size we can have check box, combo box and text search  
            If maxSize > 1 And Not rsSub.EOF Then ' comboBox is needed	
                html = html & "<br>" & kwName
                html = html & "<SELECT Name=""" & kwName & """ style=""width: 70%; position: relative;"">"
                'response.write "rs(Name).Value=" & kwName 
                If kwName <> "" And Request(kwName) <> "" Then html = html & "<OPTION></OPTION>" 'Empty choice for reducing the search criterias
                html = html & "<OPTION SELECTED>" & Request(kwName) & "</OPTION>"
                While Not rsSub.EOF
                    html = html & "<OPTION>" & rsSub("Value").Value & "</OPTION>"
                    rsSub.MoveNext()
                End While
                html = html & "</SELECT></td>"
            Else
                If maxSize = 1 Then 'CheckBox is needed
                    If Not rsSub.EOF Then
                        Dim kwChecked : kwChecked = ""
                        If Request(kwName) <> "" Then kwChecked = "checked"
                        html = html & "<input class='extra' type='checkbox' name='" & kwName & "' value='" & rsSub("Value").Value & "' " & kwChecked & ">"
                        html = html & "&nbsp;" & kwName
                    End If
                Else   ' text Box is needed 
                    html = html & "<br>" & kwName & ":"
                    html = html & "<Input Name=""" & kwName & """  value=""" & Request(kwName) & """  size=""7"" style=""width: 70%; position: relative;"">"
                End If
            End If
      
            rsSub.close() : rsSub = Nothing
            html = html & "</tr>"
            rs.moveNext()
        End While
        rs.close()
        html = html & "<tr><td>" & getTranslation("alle Kategorien") & ":<input class='extra' type=""checkbox"" name=""GlobalSearch"" value=""ON""></td></tr>"
        html = html & "<tr><td  align=center>"
        '"<input value=""suchen"" type=submit>"
        'html = html & imageFullName("search.gif")
        html = html & "<input class='extra' border=""0"" src=""" & imageFullName("search.gif") & _
                      """ type=""image""  alt=""" & getTranslation("Suchen. F&uuml;r eine erfolgreiche suche, w&auml;hlen Sie einige Kriterien aus den Komboboxen!") & """>"
        html = html & "&nbsp;"
        REM html = html & "<a href=""hilfe/hilfeSuche.htm"" target=""new""><img width=""60"" height=""16"" border=""0"" src=""menu/hilfe.gif"" alt=""f&uuml;r Hilfe hier klicken...""></a>"
        html = html & "</td></tr>"
        html = html & "</table>"
   
        html = html & "</form>"
        createSearchFormNoCache = html
    End Function



    ''' <summary>
    ''' make SELECT for Hersteller 
    ''' </summary>
    ''' <param name="ArtKatNR"></param>
    ''' <param name="currentSQL"></param>
    ''' <param name="defaultHersteller"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeSelectForHersteller(ByVal ArtKatNR As String, ByVal currentSQL As String, ByVal defaultHersteller As String)
        Dim html, sqlF, rsF
  
        If Session("CURRENT_SEARCH") <> "" Then
            sqlF = "Select distinct firma from (" & Session("CURRENT_SEARCH") & ") NEWTBL " & _
                   " group by Firma order by Firma"
        Else
            If ArtKatNR >= 0 Then  'select only the meaning Hersteller from this cat 
                sqlF = "Select distinct Firma from lieferantenAdressen where Rolle like 'Hersteller' " & _
                       "and idnr in (select HerstellerNr from grArtikel where ArtKatNr=" & ArtKatNR & ") " & _
                       "group by Firma order by Firma"
            End If
        End If
			    
        'Response.Write "sqlF="& sqlF: Response.flush
        rsF = objConnectionExecute(sqlF)
			    
        html = html & "<select name=""Hersteller"">"
        'set default
        If Request("FilterBy") <> "" Then
            html = html & "<option value=""" & defaultHersteller & """>" & defaultHersteller
        End If
        'set Default
        If defaultHersteller <> "" Then
            html = html & "<option value=""" & defaultHersteller & """>" & defaultHersteller
        End If
			    
        html = html & "<option value=""ALLE"">" & getTranslation("ALLE")
        Dim firma
        While Not rsF.EOF
            firma = rsF("Firma").Value
            'cut if more than 13 chars 
            If Len(firma) > 12 Then firma = Left(firma, 12) & ".."
            html = html & "<option value=""" & firma & """>" & firma
            rsF.MoveNext()
        End While
        rsF.close()
        html = html & "</select>"
	
        makeSelectForHersteller = html
			           
    End Function

    '===============================================================
    ' Parses the search form 
    ' Bei den Keywords kannst du 
    ' MinPreis, MaxPreis und Hersteller angeben. Diese werden automatisch unterst&uuml;tzt! 
    ' Du kannst auch andere Keywords angeben, Sie werden aber nur dann funktionieren, 
    ' wenn es bei den Produkten angegeben wird/oder beim Import festglegt wird)/
    '===============================================================
    Function makeWherePart()

        Dim whereClause
        Dim searchFreeText : searchFreeText = Request("searchFreeText")
        Dim Hersteller : Hersteller = Request("Hersteller")
        Dim ArtKatNr : ArtKatNr = Request("preKatNr") : If ArtKatNr = "" Then ArtKatNr = Request("ArtKatNr")
        Dim noKriteriaSelected
  
        Dim META_CHAR : META_CHAR = "%"
        If Session("DBTYPE") = "Access" Then META_CHAR = "*"
     
  
        searchFreeText = Replace(searchFreeText, """", "")
        searchFreeText = Replace(searchFreeText, "'", "")
  
  
        'START BUILD WHERE CONDITION
        Dim showProductsWith0Price : showProductsWith0Price = VARVALUE("SHOP_SHOW_ZERO_PRICE_OBJECTS")
        If showProductsWith0Price <> "true" And showProductsWith0Price <> "false" Then
            showProductsWith0Price = SETVARVALUE("SHOP_SHOW_ZERO_PRICE_OBJECTS", True)
        End If
        If showProductsWith0Price = "false" Then
            whereClause = DEFAULT_PRODUCT_SEARCH_WHERE
        Else
            whereClause = " produktAktiv<>0 "
        End If
   

        If searchFreeText <> "" Then
            Dim fullText : fullText = META_CHAR & Replace(searchFreeText, " ", META_CHAR) & META_CHAR
            whereClause = whereClause & " AND (Beschreibung Like '" & fullText & "'" & _
                                        " or Bezeichnung Like '" & fullText & "' " & _
                                        " or EAN Like '" & fullText & "' )" '& _ 
				                            
            ' Dim fullText: fullText =  replace(trim(searchFreeText)," "," or ") 
            '	whereClause = whereClause & " AND (contains(Beschreibung,'" & fullText & "') " & _ 
            '	                            " or contains(Bezeichnung,'" & fullText  & "') " & _ 
            '	                            " or contains(EAN, '" & fullText  & "'))"  
            '                                   " or ArtNr in (Select ArtikelNr from [lieferantenArtikel-Preise] where Bezeichnung Like '" & fullText & "'))"
        End If 'request("searchFreeText")

        'Old search on artNr not used anymore 
        If IsNumeric(Request("ArtNr")) And Request("ArtNr") <> "" Then
            'whereClause = whereClause & " AND ArtNr in (Select ArtikelNR from [lieferantenArtikel-Preise] WHERE VKPreis<= " & request("MaxPreis") & " ) "  
            whereClause = whereClause & " AND (ArtNr=" & Request("ArtNr") & " or EAN=" & Request("ArtNr") & ") "
        End If
		
        'ArtNr or EAN search 
        Dim ArtNrSearch : ArtNrSearch = Request("ArtNrSearch")
        If ArtNrSearch & "" <> "" Then
            whereClause = whereClause & " AND (ArtNr='" & ArtNrSearch & "' or EAN='" & ArtNrSearch & "') "
        End If
		
        If Request("EAN") <> "" Then
            whereClause = whereClause & " AND EAN= '" & Request("EAN") & "' "
        End If
		
        If IsNumeric(Request("MinPreis")) And Request("MinPreis") <> "" Then
            'whereClause = whereClause & " AND ArtNr in (Select ArtikelNR from [lieferantenArtikel-Preise] WHERE VKPreis>= " & request("MinPreis") & " ) "  
            whereClause = whereClause & " AND PreisATS>= " & Request("MinPreis") & " "
        End If

        If IsNumeric(Request("MaxPreis")) And Request("MaxPreis") <> "" Then
            'whereClause = whereClause & " AND ArtNr in (Select ArtikelNR from [lieferantenArtikel-Preise] WHERE VKPreis<= " & request("MaxPreis") & " ) "  
            whereClause = whereClause & " AND PreisATS<= " & Request("MaxPreis") & " "
        End If
		
        If Hersteller <> "" And Left(Hersteller, 3) <> "ALL" Then
            whereClause = whereClause & " AND herstellerNr in (select IDNR from lieferantenAdressen where [Name] Like  '" & _
            META_CHAR & Hersteller & META_CHAR & "' or [Firma] Like  '" & META_CHAR & Hersteller & META_CHAR & "') "
        End If
		
        'Response.Write "Global:" & request("GlobalSearch")
        If UCase(Request("GlobalSearch")) <> "ON" Then
            If IsNumeric(ArtKatNr) And ArtKatNr >= 0 Then 'is not global search
                Dim subCats : subCats = makeSubcategoriesList(ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO)
                'Response.Write "Ubound = " & ubound(split(subCats,","))
                'check if too much sub cats, because otherwize SQL server problems 
                If ArtKatNr <> 1 And ArtKatNr <> 0 And UBound(Split(subCats, ",")) < 100 Then ' not for the main catts, because their too big 
                    whereClause = whereClause & " AND ArtKatNr in ( " & ArtKatNr & "," & subCats & ")" ' all subcategories too   
                End If
            End If
        End If 'not global search

        Dim keyword
        
        For Each keyword In Request.Form
            Call subpartForEachQueryAndForm(whereClause, LCase(keyword), LCase(Request(keyword)))
        Next
		
        For Each keyword In Request.QueryString
            Call subpartForEachQueryAndForm(whereClause, LCase(keyword), LCase(Request(keyword)))
        Next
		
        makeWherePart = whereClause
    End Function

    Function subpartForEachQueryAndForm(ByRef whereClause, ByVal keywordName, ByVal keywordValue)

        Dim META_CHAR : META_CHAR = "%"
        If Session("DBTYPE") = "Access" Then META_CHAR = "*"
  
        'response.write "<br>keyword=" & keyword & "=" & Request.Form(keyword)
        'keywordName =  lcase(keyword)
        'keywordValue =   lcase(Request(keyword))
        If keywordValue <> "" _
       And keywordName <> "searchfreetext" _
       And keywordName <> "artnr" _
       And keywordName <> "artnrsearch" _
       And keywordName <> "ean" _
       And keywordName <> "artkatnr" _
       And keywordName <> "prekatnr" _
       And keywordName <> "minpreis" _
       And keywordName <> "maxpreis" _
       And keywordName <> "pagetoshow" _
       And keywordName <> "hersteller" _
       And keywordName <> "globalsearch" _
       And keywordName <> "showonlyresultcount" _
       And keywordName <> "debug" _
       And Len(keywordName) > 1 Then
            keywordValue = Replace(keywordValue, """", "")
            keywordValue = Replace(keywordValue, "'", "")
            keywordValue = retainUmlaute(keywordValue)
            'check if it as min max request
            If Left(keywordName, 3) = "min" And IsNumeric(keywordValue) Then
                keywordName = Mid(keywordName, 4)
                whereClause = whereClause & " AND ArtNr In (Select ArtNr From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _
                   " Where kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] >= " & keywordValue & ")"
            ElseIf Left(keywordName, 3) = "max" Then
                keywordName = Mid(keywordName, 4)
                whereClause = whereClause & " AND ArtNr In (Select ArtNr From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _
                   " Where kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] <= " & keywordValue & ")"
					  
            Else
                If dbType <> "MySQL" Then
                    whereClause = whereClause & " AND ArtNr In (Select ArtNr From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _
                                 " Where kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] = '" & keywordValue & "')"
                Else ' MySQL 	            
                    whereClause = whereClause & " AND exists (Select kw.* From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _
                             " Where kwp.ArtNR = grArtikel.ArtNr and kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] = '" & keywordValue & "')"
                End If
            End If
        End If
    End Function

    Function makeWherePartDescription()
        Dim keyword
        Dim WherePartDescription
        For Each keyword In Request.Form
            Call wherePartForEachFormAndQueryString(WherePartDescription, keyword)
        Next

        For Each keyword In Request.QueryString
            Call wherePartForEachFormAndQueryString(WherePartDescription, keyword)
        Next
				
        makeWherePartDescription = Trim(WherePartDescription)
    End Function

    Sub wherePartForEachFormAndQueryString(ByRef whereClauseDescription, ByVal keywordName)
        Dim keywordValue As String
        
        keywordName = LCase(keywordName)
        keywordValue = Request(keywordName)
        If keywordValue <> "" _
          And keywordName <> "globalsearch" _
          And keywordName <> "pagetoshow" _
          And keywordName <> "artkatnr" _
          And keywordName <> "prekatnr" _
          And keywordName <> "artnrsearch" _
          And keywordName <> "showonlyresultcount" _
          And keywordName <> "debug" _
          And Len(keywordName) > 1 Then
            keywordValue = Replace(keywordValue, """", "")
            keywordValue = Replace(keywordValue, "'", "")
            keywordValue = retainUmlaute(keywordValue)
            whereClauseDescription = whereClauseDescription & " " & getTranslation(keywordName) & " " & getTranslation("ist") & " " & keywordValue & ", "
        End If
		   
        If keywordName = "artnrsearch" Then
            whereClauseDescription = whereClauseDescription & " " & getTranslation("ObjektNr") & ": " & keywordValue & ", "
        End If
		   
        If keywordName = "artkatnr" Then
            Dim catDesc : catDesc = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", keywordValue, "[Desc]")
            Dim catName : catName = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", keywordValue, "Name")
            Dim show
            If catDesc & "" <> "" Then
                show = getTranslation("Kategorie") & " " & catDesc
            Else
                show = getTranslation("Kategorie") & " " & catName
            End If
		     
            On Error Resume Next
            ' only in immo	kategory beschreibung
            Dim catBeschreibung : catBeschreibung = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", keywordValue, "Beschreibung")
            If catBeschreibung & "" <> "" Then show = catBeschreibung
            On Error GoTo 0
		      
            whereClauseDescription = whereClauseDescription & " " & show & ", "
        End If
		   

		   
    End Sub

</script>

