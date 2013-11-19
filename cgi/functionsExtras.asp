<%
'******************************************************************
' Function [createSearchForm]
' Description [Creates the search form for the searchPage]
' Autor: Grigor Tonkov
' Changes: 
'******************************************************************
function createSearchForm(byval categoryId)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_CAT_SEARCHFORM_" & categoryId  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,createSearchFormNoCache( categoryId))
   end if    
   createSearchForm = temp 
end function 


function createSearchFormNoCache(byval categoryId)

  Dim searchFreeText: searchFreeText = request("searchFreeText")
  Dim currentSQL: currentSQL = SESSION("CURRENT_SEARCH")
  
  Const MAX_KEYWORDS_TO_SHOW = 15
  'TODO: make one Query for this 2 queries 
   Dim sql, rs, rsSub, html
   dim use: use =  tableValue("[grArtikel-Kategorien]","ArtKatNr", categoryId, "useKeywordsFromChild")
   dim catName: catName =  tableValue("[grArtikel-Kategorien]","ArtKatNr", categoryId, "Name")
   
   'response.write "use=[" & use & "]"
   if use="-1" or use ="1" or use = true then 'use from childs 
      sql = "SELECT min(KeywordId) as KeywordId, [Name], 0 as MaxSizeForComboBox FROM [grArtikel-KeyWords] Where NOT (Enabled=0) " & _ 
            " and ArtKatNR in ( " & makeSubcategoriesList(categoryId,3) & " ) Group By [Name] Order By [Name]"
   else 'do not use from childs 
      sql = "SELECT * FROM [grArtikel-KeyWords] Where Enabled<>0 AND ArtKatNR=" & categoryId & " Order By [GruppeName],[Name]"
   end if 
   'response.write sql:Response.Flush
   set rs = objConnectionExecute(sql)   
   
   
   html = html & "<table border=""0"" ><tr>" 
   html = html & "<form action=""default.asp"" method=""POST"">"   
   
   html = html & "<input type=""Hidden"" name=""PageToShow"" value=""productSearchOnKeywords"">" 
   html = html & "<input type=""Hidden"" name=""preKatNr"" value=""" & categoryId & """>"   
   
   html = html & "<td>"   
   
   
   if catName<> "" then 
      html = html & getTranslation("Suche")  & " " & getTranslation("in") & " " & catName
   else
      html = html & getTranslation("Suche")  
   end if   
   
   if not rs.EOF then html = html & "<br>"   
   'free text search 
   html = html & "<input name=""searchFreeText"" value=""" & searchFreeText & """ size=""7"" style=""width: 70%; position: relative;""></td></tr>"   
   
   
   'Hesrteller
   html = html & "<tr><td>" & getTranslation("Hersteller") & "<br>" &  makeSelectForHersteller(categoryId,currentSQL,request("Hersteller")) & "</td></tr>" 
   
   html = html & "<tr><td>" 
   'Min Preis
   html = html & "<table border=0><tr><td>Min " & getTranslation("Preis") & "</td><td><input type=""input"" name=""MinPreis"" size=5></td></tr>" 
   'Max Preis 
   html = html & "<tr><td>Max " & getTranslation("Preis") & "</td><td><input type=""input"" name=""MaxPreis"" size=5></td></tr></table>" 
   html = html & "</td><tr>" 
   
   Dim i: i = 0 
   While not rs.EOF and i<MAX_KEYWORDS_TO_SHOW
      i = i + 1 
      dim kwName: kwName = server.htmlEncode(rs("Name"))
      html = html & "<tr><td>" 
      sql = "Select distinct [value] from [grArtikel-KeyWordsToProducts] Where KeywordId=" & rs("KeywordId") & " ORDER BY [VALUE]"
      set rsSub = objConnectionExecute(sql)
      
      'html = html & "<td>" 
      'make keywords 
      Dim maxSize: maxSize = 0 
      if isNumeric(rs("MaxSizeForComboBox")) then 
           maxSize = rs("MaxSizeForComboBox")*1
      else
           maxSize = 0
      end if   
      

       'According max size we can have check box, combo box and text search  
      if maxSize>1 AND NOT rsSub.EOF then ' comboBox is needed	
            html = html & "<br>" & kwName 		
			html = html & "<SELECT Name=""" & kwName & """ style=""width: 70%; position: relative;"">" 
			'response.write "rs(Name)=" & kwName 
			if kwName <> "" and request(kwName)<> "" then html = html & "<OPTION></OPTION>" 'Empty choice for reducing the search criterias
			html = html & "<OPTION SELECTED>" & request(kwName)  & "</OPTION>"
			while not rsSub.EOF 
			    html = html & "<OPTION>"  & rsSub("Value") & "</OPTION>"
			    rsSub.MoveNext 
			wend 
			html = html & "</SELECT></td>" 
      else 
			If maxSize=1 then 'CheckBox is needed
				if not rsSub.EOF then 
					dim kwChecked: kwChecked = "" 
					if request(kwName)<>"" then kwChecked = "checked"
					html = html & "<input class='extra' type='checkbox' name='" & kwName &  "' value='" & rsSub("Value") &  "' " & kwChecked & ">"
					html = html & "&nbsp;" & kwName 
				end if  
			else   ' text Box is needed 
			    html = html & "<br>" & kwName & ":"
				html = html & "<Input Name=""" & kwName  & """  value=""" & request(kwName) & """  size=""7"" style=""width: 70%; position: relative;"">" 
			end if   
      end if 
      
      rsSub.close: set rsSub = nothing 
      html = html & "</tr>"
      rs.moveNext
   wend 
   rs.close         
   html = html & "<tr><td>" & getTranslation("alle Kategorien") & ":<input class='extra' type=""checkbox"" name=""GlobalSearch"" value=""ON""></td></tr>"
   html = html & "<tr><td  align=center>" 
   '"<input value=""suchen"" type=submit>"
   'html = html & imageFullName("search.gif")
   html = html & "<input class='extra' border=""0"" src=""" & imageFullName("search.gif") & _
                 """ type=""image""  alt=""" & getTranslation("Suchen. F&uuml;r eine erfolgreiche suche, w&auml;hlen Sie einige Kriterien aus den Komboboxen!") & """>"
   html = html & "&nbsp;" 
   rem html = html & "<a href=""hilfe/hilfeSuche.htm"" target=""new""><img width=""60"" height=""16"" border=""0"" src=""menu/hilfe.gif"" alt=""f&uuml;r Hilfe hier klicken...""></a>"
   html = html & "</td></tr>"
   html = html & "</table>"
   
   html = html &  "</form>"   
   createSearchFormNoCache = html
end function 


'make SELECT for Hersteller 
function makeSelectForHersteller(ArtKAtNR, currentSQL, defaultHersteller)
  Dim html, sqlF, rsF
  
                if SESSION("CURRENT_SEARCH") <> "" then 
					sqlF = "Select distinct firma from (" & SESSION("CURRENT_SEARCH") & ") NEWTBL " & _ 
					       " group by Firma order by Firma" 
			    else 
					if ArtKAtNR >=0 then  'select only the meaning Hersteller from this cat 
					  sqlF = "Select distinct Firma from lieferantenAdressen where Rolle like 'Hersteller' " & _
					         "and idnr in (select HerstellerNr from grArtikel where ArtKatNr="  & ArtKatNr & ") " & _ 
					         "group by Firma order by Firma" 
					end if 
			    end if 
			    
			    'Response.Write "sqlF="& sqlF: Response.flush
			    set rsF = objConnectionExecute(sqlF) 
			    
			    html = html & "<select name=""Hersteller"">"
			    'set default
			    if request("FilterBy")<> "" then 
					html = html & "<option value=""" & defaultHersteller & """>" & defaultHersteller
			    end if 
			    'set Default
			    if defaultHersteller<> "" then 
					html = html & "<option value=""" & defaultHersteller & """>" & defaultHersteller
			    end if 
			    
			    html = html & "<option value=""ALLE"">" & getTranslation("ALLE")
			    Dim firma 
			    while not rsF.EOF 
			    firma = rsF("Firma") 
			    'cut if more than 13 chars 
			    if len(firma) > 12 then firma = left(firma,12) & ".."
						html = html & "<option value=""" & firma & """>" & firma
						rsF.MoveNext 
				wend 
				rsF.close
				html = html & "</select>"
	
	makeSelectForHersteller = html
			           
end function 

'===============================================================
' Parses the search form 
' Bei den Keywords kannst du 
' MinPreis, MaxPreis und Hersteller angeben. Diese werden automatisch unterst&uuml;tzt! 
' Du kannst auch andere Keywords angeben, Sie werden aber nur dann funktionieren, 
' wenn es bei den Produkten angegeben wird/oder beim Import festglegt wird)/
'===============================================================
function makeWherePart()

  Dim whereClause
  Dim searchFreeText:searchFreeText=request("searchFreeText")
  Dim Hersteller: Hersteller = request("Hersteller") 
  Dim ArtKatNr: ArtKatNr = request("preKatNr"): if ArtKatNr = "" then ArtKatNr = request("ArtKatNr")
  Dim noKriteriaSelected
  
  Dim META_CHAR: META_CHAR = "%"
  if Session("DBTYPE") = "Access" then META_CHAR = "*"
     
  
    searchFreeText = replace(searchFreeText,"""","")
    searchFreeText = replace(searchFreeText,"'","")
  
  
		'START BUILD WHERE CONDITION
   dim showProductsWith0Price:  showProductsWith0Price = VARVALUE("SHOP_SHOW_ZERO_PRICE_OBJECTS")
   if showProductsWith0Price <> "true" and showProductsWith0Price <> "false" then 
		showProductsWith0Price = SETVARVALUE("SHOP_SHOW_ZERO_PRICE_OBJECTS", true)
   end if 
   if showProductsWith0Price = "false" then 
		whereClause = DEFAULT_PRODUCT_SEARCH_WHERE
   else 
        whereClause = " produktAktiv<>0 "
   end if 
   

		if searchFreeText <> "" then 
			 Dim fullText: fullText = META_CHAR & replace(searchFreeText," ",META_CHAR) &  META_CHAR 
				whereClause = whereClause & " AND (Beschreibung Like '" & fullText & "'"& _ 
				                            " or Bezeichnung Like '" & fullText  & "' " & _ 
				                            " or EAN Like '" & fullText  & "' )" '& _ 
				                            
			' Dim fullText: fullText =  replace(trim(searchFreeText)," "," or ") 
			'	whereClause = whereClause & " AND (contains(Beschreibung,'" & fullText & "') " & _ 
			'	                            " or contains(Bezeichnung,'" & fullText  & "') " & _ 
			'	                            " or contains(EAN, '" & fullText  & "'))"  
	        	'                                   " or ArtNr in (Select ArtikelNr from [lieferantenArtikel-Preise] where Bezeichnung Like '" & fullText & "'))"
		end if 'request("searchFreeText")

        'Old search on artNr not used anymore 
		if IsNumeric(request("ArtNr")) AND request("ArtNr")<> ""  then 
			'whereClause = whereClause & " AND ArtNr in (Select ArtikelNR from [lieferantenArtikel-Preise] WHERE VKPreis<= " & request("MaxPreis") & " ) "  
			whereClause = whereClause & " AND (ArtNr=" & request("ArtNr") & " or EAN=" & request("ArtNr") & ") " 
		end if 
		
		'ArtNr or EAN search 
		Dim ArtNrSearch:ArtNrSearch=request("ArtNrSearch")	
		if ArtNrSearch & "" <> ""  then 
		    whereClause = whereClause & " AND (ArtNr='" & ArtNrSearch & "' or EAN='" & ArtNrSearch & "') " 
		end if 
		
		if  request("EAN")<> ""  then 
	 		whereClause = whereClause & " AND EAN= '" & request("EAN") & "' " 
		end if 
		
		if IsNumeric(request("MinPreis")) AND request("MinPreis")<> ""  then 
			'whereClause = whereClause & " AND ArtNr in (Select ArtikelNR from [lieferantenArtikel-Preise] WHERE VKPreis>= " & request("MinPreis") & " ) "  
			whereClause = whereClause & " AND PreisATS>= " & request("MinPreis") & " "  
		end if 

		if IsNumeric(request("MaxPreis")) AND request("MaxPreis")<> ""  then 
			'whereClause = whereClause & " AND ArtNr in (Select ArtikelNR from [lieferantenArtikel-Preise] WHERE VKPreis<= " & request("MaxPreis") & " ) "  
			whereClause = whereClause & " AND PreisATS<= " & request("MaxPreis") & " " 
		end if 
		
		if Hersteller <> "" and left(Hersteller,3) <> "ALL" then 
			whereClause = whereClause & " AND herstellerNr in (select IDNR from lieferantenAdressen where [Name] Like  '" & META_CHAR & Hersteller & META_CHAR & "' or [Firma] Like  '" & META_CHAR & Hersteller & META_CHAR & "') "  
		end if 
		
        'Response.Write "Global:" & request("GlobalSearch")
        if ucase(request("GlobalSearch"))<>"ON" then 
			if IsNumeric(ArtKatNr) and ArtKatNR>=0 then 'is not global search
			Dim subCats: subCats =  makeSubcategoriesList(ArtKatNR, SUBCATEGORIES_TO_SEARCH_INTO)
				'Response.Write "Ubound = " & ubound(split(subCats,","))
				'check if too much sub cats, because otherwize SQL server problems 
			   if ArtKatNR <>1 and ArtKatNR<>0 and ubound(split(subCats,","))<100 then ' not for the main catts, because their too big 
			        whereClause = whereClause & " AND ArtKatNr in ( " & ArtKatNR & "," & subCats & ")" ' all subcategories too   
			   end if 
			end if 
		end if 'not global search


		for each keyword in Request.Form
			call subpartForEachQueryAndForm(whereClause, lcase(keyword), lcase(Request(keyword)))
		next 
		
		for each keyword in Request.QueryString
			call subpartForEachQueryAndForm(whereClause, lcase(keyword), lcase(Request(keyword)))
		next 
		
	makeWherePart = whereClause	
end function 

function subpartForEachQueryAndForm(byRef whereClause, keywordName, keywordValue)

  Dim META_CHAR: META_CHAR = "%"
  if Session("DBTYPE") = "Access" then META_CHAR = "*"
  
		  'response.write "<br>keyword=" & keyword & "=" & Request.Form(keyword)
		  'keywordName =  lcase(keyword)
		  'keywordValue =   lcase(Request(keyword))
		  if keywordValue <> "" _
			and keywordName <> "searchfreetext"  _ 
			and keywordName <> "artnr" _ 
			and keywordName <> "artnrsearch" _ 
			and keywordName <> "ean" _ 
			and keywordName <> "artkatnr" _ 
			and keywordName <> "prekatnr" _ 
			and keywordName <> "minpreis" _ 
			and keywordName <> "maxpreis" _
			and keywordName <> "pagetoshow" _
			and keywordName <> "hersteller" _
			and keywordName <> "globalsearch" _
			and keywordName <> "showonlyresultcount" _
			and keywordName <> "debug" _
			and len(keywordName)>1 then 
				  keywordValue = replace(keywordValue,"""","") 
				  keywordValue = replace(keywordValue,"'","")
				  keywordValue = retainUmlaute(keywordValue)
				  'check if it as min max request
				  if left(keywordName,3) = "min" and IsNumeric(keywordValue) then 
						keywordName = mid(keywordName,4)
						whereClause = whereClause & " AND ArtNr In (Select ArtNr From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _ 
									" Where kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] >= " & keywordValue & ")"
				  elseIf left(keywordName,3) = "max" then 
						keywordName = mid(keywordName,4)
						whereClause = whereClause & " AND ArtNr In (Select ArtNr From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _ 
									" Where kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] <= " & keywordValue & ")"
					  
				  else	
				    if dbType <> "MySQL" then 			  
						whereClause = whereClause & " AND ArtNr In (Select ArtNr From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _ 
						             " Where kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] = '" &  keywordValue & "')"
					else ' MySQL 	            
					    whereClause = whereClause & " AND exists (Select kw.* From [grArtikel-KeyWords] kw, [grArtikel-KeyWordsToProducts] kwp " & _ 
						            " Where kwp.ArtNR = grArtikel.ArtNr and kw.keywordId=kwp.keywordId and kw.Name ='" & keywordName & "' and [Value] = '" &  keywordValue & "')"
				   end if 
				  end if 
		   end if 
end function 

function makeWherePartDescription()
 dim keyword
 Dim WherePartDescription 
 		for each keyword in Request.form
           call wherePartForEachFormAndQueryString(WherePartDescription, keyword)	   
		next 

 		for each keyword in Request.QueryString
	       call wherePartForEachFormAndQueryString(WherePartDescription, keyword)
		next 
				
		makeWherePartDescription = trim(WherePartDescription)
end function 

sub wherePartForEachFormAndQueryString(byref whereClauseDescription, keywordName)
	      
		  keywordName =  lcase(keywordName)
		  keywordValue = request(keywordName)
		  if keywordValue <> "" _
		    and keywordName <> "globalsearch" _
		    and keywordName <> "pagetoshow" _
		    and keywordName <> "artkatnr" _
		    and keywordName <> "prekatnr" _
		    and keywordName <> "artnrsearch" _
		    and keywordName <> "showonlyresultcount" _
		    and keywordName <> "debug" _
		    and len(keywordName)>1 then 
				  keywordValue = replace(keywordValue,"""","") 
				  keywordValue = replace(keywordValue,"'","") 	
				  keywordValue = retainUmlaute(keywordValue)			  
				  whereClauseDescription = whereClauseDescription & " " & getTranslation(keywordName) & " " & getTranslation("ist")  & " " & keywordValue & ", " 
		   end if 		   
		   
		   if keywordName = "artnrsearch" then 
			  whereClauseDescription = whereClauseDescription & " " & getTranslation("ObjektNr") & ": " & keywordValue & ", " 
		   end if 
		   
		   if keywordName = "artkatnr" then 
		     Dim catDesc: catDesc = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", keywordValue, "[Desc]")
		     Dim catName: catName = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", keywordValue, "Name")
		     Dim show
				if catDesc & "" <> "" then 
					show = getTranslation("Kategorie") & " " & catDesc 
		        else 
					show = getTranslation("Kategorie") & " " & catName 
		        end if
		     
		     on error resume next  
		     ' only in immo	kategory beschreibung
		     Dim catBeschreibung: catBeschreibung = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", keywordValue, "Beschreibung")
		     if catBeschreibung & "" <> "" then show = catBeschreibung
		     on error goto 0 
		     
		     
		        
		           whereClauseDescription = whereClauseDescription & " " & show & ", " 
		   end if 
		   

		   
end sub 


%>