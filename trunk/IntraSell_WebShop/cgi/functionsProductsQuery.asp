<%
'moved functions from functionsProducts
'
'****************************************************************************
' makeProductListOnQuery - lists all products depending on the SQL query
' FilterBy
' SearchDescription - what the user searches for 
' 
' new feature 14-09-2004: Header of the Table with Template: if no template standard header 
' new feature 11-11-2004: Ausgewählte Liste ausdrucken in HTML oder PDF Format!
' new feature : request("showOnlyResultCount") = true
' new feature 03-12-2004: Line Highlight and Fixed Sorting on Product Keywords 
'****************************************************************************

function makeProductListOnQuery(Sql, FilterBySQL, OrderBy, SearchDescription) 
dim showOnlyResultCount: showOnlyResultCount = request("showOnlyResultCount")'true

SESSION("CURRENT_SEARCH") = sql ' save for the next search/filter

'added 22-12-2004 
'save this sessions search 
call saveSessionSearch(Sql, SearchDescription)
'set defaults for older shop versions 
  
    if NOT isNumeric( VARVALUE("SHOP_RESULT_LIST_ITEMS_PER_PAGE")) then
		call SETVARVALUE("SHOP_RESULT_LIST_ITEMS_PER_PAGE","20") 
	end if 
	
	if VARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS") <> "true" and VARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS","true") 
	end if 
	
	if VARVALUE("SHOP_SHOW_LAGERINFO") <> "true" and VARVALUE("SHOP_SHOW_LAGERINFO") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_LAGERINFO","true")
	end if 
	
	if VARVALUE("SHOP_SHOW_PRICE") <> "true" and VARVALUE("SHOP_SHOW_PRICE") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_PRICE","true")
	end if 
	
	if VARVALUE("SHOP_SHOW_COMPARE") <> "true" and VARVALUE("SHOP_SHOW_COMPARE") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_COMPARE","true")
	end if 

	if VARVALUE("SHOP_SHOW_DRUCKEN") <> "true" and VARVALUE("SHOP_SHOW_DRUCKEN") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_DRUCKEN","true")
	end if 
		
	if VARVALUE("SHOP_ALLOW_SORTING") <> "true" and VARVALUE("SHOP_ALLOW_SORTING") <> "false" then 
		call SETVARVALUE("SHOP_ALLOW_SORTING","true")
	end if 

	if VARVALUE("SHOP_ALLOW_DROPDOWN_SORTING") <> "true" and VARVALUE("SHOP_ALLOW_DROPDOWN_SORTING") <> "false" then 
		call SETVARVALUE("SHOP_ALLOW_DROPDOWN_SORTING","true")
	end if 
	
	if VARVALUE("SHOP_SHOW_HERSTELLER") <> "true" and VARVALUE("SHOP_SHOW_HERSTELLER") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_HERSTELLER","true")
	end if 

	if VARVALUE("SHOP_SHOW_THUMBNAILS") <> "true" and VARVALUE("SHOP_SHOW_THUMBNAILS") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_THUMBNAILS","true")		
	end if 		

	if not isNumeric( VARVALUE("SHOP_THUMBNAIL_MAX_SIZE") ) then 
		call SETVARVALUE("SHOP_THUMBNAIL_MAX_SIZE", "160")		
	end if 	
	
	if VARVALUE("SHOP_SHOW_ANGELEGTAM") <> "true" and VARVALUE("SHOP_SHOW_ANGELEGTAM") <> "false" then 
		call SETVARVALUE("SHOP_SHOW_ANGELEGTAM", "true")		
	end if 		
	
	if VARVALUE("SHOP_SAVE_QUERY") <> "true" and VARVALUE("SHOP_SAVE_QUERY") <> "false" then 
		call SETVARVALUE("SHOP_SAVE_QUERY","false")		
	end if 	

    'the grArtikel has keyword Highlight_Color<>0
	if VARVALUE("SHOP_USE_HIGHLIGHT") <> "true" and VARVALUE("SHOP_USE_HIGHLIGHT") <> "false" then 
		call SETVARVALUE("SHOP_USE_HIGHLIGHT", "false")		
	end if 	
	
	'the grArtikel has keyword Wichtigkeit<>0
	if VARVALUE("SHOP_USE_SORT_IMPORTANCY") <> "true" and VARVALUE("SHOP_USE_SORT_IMPORTANCY") <> "false" then 
		call SETVARVALUE("SHOP_USE_SORT_IMPORTANCY", "false")		
	end if 	
'end set 

	Dim SHOP_SHOW_PRICE : SHOP_SHOW_PRICE = VARVALUE("SHOP_SHOW_PRICE")
	Dim SHOP_SHOW_COMPARE : SHOP_SHOW_COMPARE = VARVALUE("SHOP_SHOW_COMPARE")
	Dim SHOP_SHOW_DRUCKEN : SHOP_SHOW_DRUCKEN = VARVALUE("SHOP_SHOW_DRUCKEN")
	Dim SHOP_SHOW_ANGELEGTAM : SHOP_SHOW_ANGELEGTAM = VARVALUE("SHOP_SHOW_ANGELEGTAM")
 
	 
	Dim SHOP_ALLOW_SORTING : SHOP_ALLOW_SORTING = VARVALUE("SHOP_ALLOW_SORTING")
	Dim SHOP_ALLOW_DROPDOWN_SORTING : SHOP_ALLOW_DROPDOWN_SORTING = VARVALUE("SHOP_ALLOW_DROPDOWN_SORTING")
	Dim SHOP_SHOW_HERSTELLER : SHOP_SHOW_HERSTELLER = VARVALUE("SHOP_SHOW_HERSTELLER")
	Dim ITEMPERPAGE : ITEMPERPAGE = VARVALUE("SHOP_RESULT_LIST_ITEMS_PER_PAGE") 
	Dim SHOW_PRODUCT_DETAILS : SHOW_PRODUCT_DETAILS = VARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS") 
	Dim SHOWLAGERINFO:  showlagerInfo = VARVALUE("SHOP_SHOW_LAGERINFO")
	Dim SHOP_SAVE_QUERY: SHOP_SAVE_QUERY = VARVALUE("SHOP_SAVE_QUERY") 

	'Sorting and Highlight handling 
    Dim SHOP_USE_HIGHLIGHT: SHOP_USE_HIGHLIGHT = varvalue("SHOP_USE_HIGHLIGHT") 
    Dim SHOP_USE_SORT_IMPORTANCY: SHOP_USE_SORT_IMPORTANCY = varvalue("SHOP_USE_SORT_IMPORTANCY") 
    
	'Switch show or not can be switched from user interface  
	Dim showThumbnails : showThumbnails = VARVALUE("SHOP_SHOW_THUMBNAILS") 
	Dim artKatNR: artKatNr = 0
	if request("preKatNr")<> "" then ArtKatNr=request("preKatNr")
	if request("artKatNrForFilter")<> "" then ArtKatNr=request("artKatNrForFilter")


Dim template_ColumnDescription 'template for description column
template_ColumnDescription = ""&readTextFile(Server.MapPath( "skins/skin" & SkinNumber & "/pages/" & FLENAME_PRODUCT_LIST_COLUMN_DESCRIPTION ))

Dim template_Header 'html tempalte for table header / extra functions 
template_Header = ""&readTextFile(Server.MapPath( "skins/skin" & SkinNumber & "/pages/" & FLENAME_PRODUCT_LIST_HEADER ))




'START SONDERBEHANDLUNG FÜR SUCHINSRATE IMMO 
   dim catDesc: catDesc = tablevalue("[grArtikel-Kategorien]","ArtKatNr",ArtKatNR,"[Desc]") 'has "Suchen" on beginning 
   'response.Write "catDesc=" & catDesc
   if inStr(catDesc,"uchen") > 0 then 'hat Suchen 
		SHOP_SHOW_PRICE = false 
		showThumbnails = false 
   end if 
'END SONDERBEHANDLUNG FÜR SUCHINSRATE IMMO 

Dim ordr 'holds old order by 
Dim html ' contains buffered search result 

if OrderBy <> "" then 
	ordr = orderBy
	orderBy = " ORDER BY " & orderBy
else 
   	orderBy = " ORDER BY AngelegtAm desc"
end if

Dim requestFilterBy: requestFilterBy = request("filterBy")
if request("filterBy") = "ALLE" then FilterBySQL=""

if FilterBySQL <> "" then sql = sql & " AND " & FilterBySQL
sql = sql & orderBy
        
Dim generalLinkParameters:generalLinkParameters = "preKatNr=" & ArtKatNr 
Dim hideCheckedUnchecked: hideCheckedUnchecked = request("hideCheckedUnchecked")

'DEFAULT from SESSION
if hideCheckedUnchecked & "" = "" then
   hideCheckedUnchecked = Session("hideCheckedUnchecked") & ""
end if 
'DEFAULT
if hideCheckedUnchecked = "" then
   hideCheckedUnchecked = "checked"
end if 

'Aenderung nur wenn request
if request("hideCheckedUnchecked")  <> "" then 
	if hideCheckedUnchecked = "checked" then   
	   showThumbnails = false  
	   hideCheckedUnchecked = "unchecked"
	   Session("hideCheckedUnchecked") = "unchecked"
	else 
	   showThumbnails = true   
	   hideCheckedUnchecked = "checked"
	   Session("hideCheckedUnchecked") = "checked"
	end if 
end if 

if  Session("hideCheckedUnchecked") ="unchecked" then 
   showThumbnails = false  
end if 

'save in log file'warning: needs write permisions for this file 
call writeLog("productlistSQL.log",sql)

Dim rsArtikel 
Set rsArtikel  = objConnectionExecute(sql)

if rsArtikel.EOF then 'nothing found 
	'html = ""
	makeProductListOnQuery = "<center>" & getTranslation("Ihre Suche hat leider keine Ergebnisse gebracht!") & "<br>" & _ 
							 getTranslation("Sie haben gesucht nach:") &  SearchDescription & _
							 "<br><a href='javascript:history.back();' _OnClick='history.back();'>" & getTranslation("Zurück") & "</a>" & _ 
							 "<!--<" & COUNT_RESULT_LINES & ">0</" & COUNT_RESULT_LINES & ">--><br></center>"
	                           
		'mail this event to the Shop Administration 
		dim sendVar  'set default 
		sendVar =  VARVALUE("SHOW_SEND_EMAIL_FOR_EMPTY_SEARCH")
		if sendVar <> "TRUE" and sendVar <> "FALSE" then 
			call SETVARVALUE("SHOW_SEND_EMAIL_FOR_EMPTY_SEARCH", "FALSE")
		end if  
		if sendVar = "TRUE" then 
			call sendMailFromWithSending (VARVALUE("EMAIL_ADMIN"), "Suche ohne Ergebniss nach: " & SearchDescription , "" , VARVALUE("EMAIL")) 
		end if 
		                      
	exit function 
else
Dim pgs, rscnt, pp
Dim subPage, swnItems, toP
Dim product_from, product_til
	
	rscnt=ubound(rsArtikel.getrows,2) +1
	
	rsArtikel.MoveFirst

	subPage = Request ("pp")
	if subPage = "" then 
		subPage = 1
	else
		subpage = CInt (subPage)
	end if

	toP = rscnt \ ITEMPERPAGE
	if toP * ITEMPERPAGE < rsCnt then toP = toP + 1
	
    product_from = (subPage - 1) * ITEMPERPAGE + 1  
	product_til  = product_from + ITEMPERPAGE - 1
	
	dim linkBack, linkForward
	
	 if subPage>1 then 
		linkBack = "<a href='default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&artKatNrForFilter=" & ArtKatNr & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & (subPage-1) & "'>&lt;&lt;" & getTranslation("Zur&uuml;ck") & "</a> | "
	 else 
		linkBack = "" 
	 end if 
	 if subPage< toP then 
		linkForward = "<a href='default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&artKatNrForFilter=" & ArtKatNr & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & (subPage+1) & "'>" & getTranslation("Weiter") & "&gt;&gt;</a>"
	 else 
		linkForward = "" 
	 end if 
	
	
dim pagesLinks
	for pgs = 1 to toP
		if pgs <> subPage then 
			pagesLinks = pagesLinks & "<a href='default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&artKatNrForFilter=" & ArtKatNr & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & pgs & "'> " & pgs & "</a> | " 
		else
			pagesLinks = pagesLinks & "<B>" & pgs & "</B>" & " | "
		end if
		'Response.Write (pp)
		
	next
	
	

				html = html & "<a name=""top""></a>"
				html = html & "<form action=""default.asp?pageToShow=compareManyProducts"" type=""POST"">"
				html = html + "<input name=""pageToShow"" type=""hidden"" value=""compareManyProducts"">"
			
			
			    Dim htmlHeader 
			    'Template variables for the header description
				Dim htmlSearchDescription, htmlSearchDescriptionSaveButton
				Dim htmlButtonProductImages
				Dim htmlSortBy, htmlFilterBy
				Dim htmlProductCount, htmlPages
				
				if SearchDescription <> "" then 
					htmlHeader = htmlHeader & getTranslation("Sie haben gesucht nach:") & "<b>" & SearchDescription & "</b> "
					if SHOP_SAVE_QUERY then 
						htmlHeader = htmlHeader & htmlForSaveUserQuery(sql, filterBySQL, OrderBy, SearchDescription)
					end if 
					htmlHeader = htmlHeader & "<br>"
					
					htmlSearchDescription = getTranslation("Sie haben gesucht nach:") & "<b>" & SearchDescription & "</b> "
					if SHOP_SAVE_QUERY then
						htmlSearchDescriptionSaveButton = htmlForSaveUserQuery(sql, filterBySQL, OrderBy, SearchDescription)
					else 
						htmlSearchDescriptionSaveButton = ""
					end if 
				end if

								
				'main table for HEADER  
				   htmlHeader = htmlHeader & "<table align=center width=""100%"" border=""0"">"
				
				'try to load template for table headers 
				 
				if SHOP_ALLOW_SORTING then
				
					htmlHeader = htmlHeader & "<tr><td colspan=2>" 
									'HIDE PRODUCT IMAGES 
					
					htmlButtonProductImages = "<input class='extra' type='checkbox' name='HideProductImgs' " & hideCheckedUnchecked & _
								" OnClick=""top.location.href='default.asp?pageToShow=Produktliste&hideCheckedUnchecked=" & hideCheckedUnchecked & _ 
								"&artKatNrForFilter=" & ArtKatNr & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & request("pgs") & _ 
								"';""> " & getTranslation("Produktbilder anzeigen")
								
					htmlHeader = htmlHeader & htmlButtonProductImages			
					htmlHeader = htmlHeader & "</td></tr>" 
	

					htmlHeader = htmlHeader & "<tr>" 
					htmlHeader = htmlHeader & "<td align=left> " 
					'ORDER BY 
					dim ordrToShow: ordrToShow=ordr
					if ordrToShow="PreisATS" then ordrToShow="Preis"
					
					htmlSortBy = htmlSortBy & getTranslation("Sortieren nach:")
					htmlSortBy = htmlSortBy & "		<script language=""JavaScript"">"
					htmlSortBy = htmlSortBy & "        	function GOLink()" 
					htmlSortBy = htmlSortBy & "        	{ "
					htmlSortBy = htmlSortBy & "        		var indx;"
					htmlSortBy = htmlSortBy & "        		indx = document.all.item(""sortBy"").selectedIndex;"
					htmlSortBy = htmlSortBy & "        		if(document.all.item(""sortBy"").options[indx].value != '') { "
					htmlSortBy = htmlSortBy & "   				top.location.href = ""default.asp?artKatNrForFilter=" & ArtKatNr & "&pageToShow=Produktliste&filterBy=""+document.all.item(""filterBy"").value+""&orderBy=""+document.all.item(""sortBy"").options[indx].value; "
					htmlSortBy = htmlSortBy & "        			document.all.item(""sortBy"").selectedIndex=0;" 
					htmlSortBy = htmlSortBy & "        		}"
					htmlSortBy = htmlSortBy & "        	}"
					htmlSortBy = htmlSortBy & "        </script>"
					
					

					if SHOP_ALLOW_DROPDOWN_SORTING = "true" then 'ORDERBYTYPE = "SELECT" then 				
						htmlSortBy = htmlSortBy & "			<select id=""sortBy"" name=""sortBy"" onchange=""GOLink();"" >"
						htmlSortBy = htmlSortBy & "			  <option value=""" & ordr & """>" & ordrToShow & "</option>"
						htmlSortBy = htmlSortBy & "			  <option value=""AngelegtAm"">AngelegtAm</option>"
						htmlSortBy = htmlSortBy & "			  <option value=""Bezeichnung"">Bezeichnung</option>"
						htmlSortBy = htmlSortBy & "			  <option value=""PreisATS"">Preis</option>"
						if SHOP_SHOW_HERSTELLER then
							htmlSortBy = htmlSortBy & "			  <option value=""Firma"">Hersteller</option>"
						end if 
						htmlSortBy = htmlSortBy & "			</select>"
					else 'List Like Sort
						htmlSortBy = htmlSortBy & "<a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Bezeichnung""><b>" & getTranslation("Bezeichnung") & "</b></a> | "
						htmlSortBy = htmlSortBy & "<a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=PreisATS""><b>" & getTranslation("Preis aufsteigend") & "</b></a> | "
						htmlSortBy = htmlSortBy & "<a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=PreisATS DESC""><b>" & getTranslation("Preis absteigend") & "</b></a> | "
						if SHOP_SHOW_HERSTELLER then
						htmlSortBy = htmlSortBy & "<a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Firma""><b>" & getTranslation("Hersteller") & "</b></a> "				
					    end if
					end if 
					
					
					htmlHeader = htmlHeader & htmlSortBy
					htmlHeader = htmlHeader & "</td><td align=right> " 
					'END ORDER BY 
					
					
					
					if SHOP_SHOW_HERSTELLER then
							'FILTER BY
							htmlFilterBy = htmlFilterBy & getTranslation("Hersteller auswählen:")
							htmlFilterBy = htmlFilterBy & "		<script language=""JavaScript"">"
							htmlFilterBy = htmlFilterBy & "        	function GOLinkFilter()" 
							htmlFilterBy = htmlFilterBy & "        	{ "
							htmlFilterBy = htmlFilterBy & "        		var indx;"
							htmlFilterBy = htmlFilterBy & "        		indx = document.all.item(""filterBy"").selectedIndex;"
							htmlFilterBy = htmlFilterBy & "        		if(document.all.item(""filterBy"").options[indx].value != '') { "
							htmlFilterBy = htmlFilterBy & "   					top.location.href = ""default.asp?artKatNrForFilter=" & ArtKatNr & "&" & generalLinkParameters & "&pageToShow=Produktliste&filterBy=""+document.all.item(""filterBy"").options[indx].value; "
							htmlFilterBy = htmlFilterBy & "        			document.all.item(""filterBy"").selectedIndex=0;" 
							htmlFilterBy = htmlFilterBy & "        		}"
							htmlFilterBy = htmlFilterBy & "        	}"
							htmlFilterBy = htmlFilterBy & "        </script>"
							htmlFilterBy = htmlFilterBy & "<select id=""filterBy"" name=""filterBy"" onchange=""GOLinkFilter();"" >"

							
							dim rsF, sqlF 
							sqlF = "Select distinct firma from (" & SESSION("CURRENT_SEARCH") & ") NEWTBL " & _ 
								   " group by Firma order by Firma" 
							'sqlF = "Select distinct Firma from lieferantenAdressen where Rolle like 'Hersteller' group by Firma order by Firma" 
							'Response.Write sqlF: Response.Flush
						    
							if ArtKatNR >0 then  'select only the meaning Hersteller from this cat 
							sqlF = "Select distinct Firma from lieferantenAdressen where Rolle like 'Hersteller' " & _
								   " and idnr in (select HerstellerNr from grArtikel where ArtKatNr="  & ArtKatNr & _
								   ") group by Firma order by Firma" 
							end if 
						    
							set rsF = objConnectionExecute(sqlF) 
						    
							if request("FilterBy")<> "" then htmlHeader = htmlHeader & "<option value=""" & request("FilterBy") & """>" & request("FilterBy")
							htmlFilterBy = htmlFilterBy & "        <option value=""ALLE"">" & getTranslation("ALLE")
							while not rsF.EOF 
									htmlFilterBy = htmlFilterBy & "<option value=""" & rsF("Firma") & """>" & rsF("Firma") 
									rsF.MoveNext 
							wend 
							rsF.close
							htmlFilterBy = htmlFilterBy & "			</select>"
							'END FILTER 
					else 
							htmlFilterBy = htmlFilterBy & "			<select style=""visibility:hidden"" id=""filterBy"" name=""filterBy"" onchange=""GOLinkFilter();"" ></select>" 'empty select
					end if 'VARVALUE("SHOP_SHOW_HERSTELLER")
					
					htmlHeader = htmlHeader & htmlFilterBy
					htmlHeader = htmlHeader & " </td></tr>"
				
				end if 'varvalue("SHOP_ALLOW_SORTING")
				
 
				
				'PRODUCT COUNT
				htmlHeader = htmlHeader & "<tr>" 
				htmlHeader = htmlHeader & " <td align=left colspan=2>"
				htmlProductCount = getTranslation("Produktanzahl") & ": " & "<" & COUNT_RESULT_LINES & ">" & rscnt& "</" & COUNT_RESULT_LINES & ">" & " " & getTranslation("Anzeige Produkte von") & " " & product_from & " " & getTranslation("bis") & " " & product_til
				htmlHeader = htmlHeader & htmlProductCount
				htmlHeader = htmlHeader & "</td>"
				htmlHeader = htmlHeader & "</tr>" 
				
				htmlHeader = htmlHeader & "<tr><td colspan=2>" 
				htmlPages  = getTranslation("Seite") & ":" & linkBack  & pagesLinks & linkForward
				htmlHeader = htmlHeader & htmlPages
				htmlHeader = htmlHeader & " </td><tr>"
				htmlHeader = htmlHeader & "</table>"
				
				
				if showOnlyResultCount = "true" then 
				  makeProductListOnQuery = html & htmlHeader
				  exit function 
				end if 
				htmlHeader = htmlHeader & " <center>"
				
				if template_Header <> ""  then 'the shop has header defined in skins 
				    htmlHeader = "" 'do not use standard header				    
				    template_Header = replace(template_Header,"[PRODUCTLIST_SEARCH_DESCRIPTION]",htmlSearchDescription)
				    template_Header = replace(template_Header,"[PRODUCTLIST_SEARCH_DESCRIPTION_SAVE_BUTTON]",htmlSearchDescriptionSaveButton)
				    template_Header = replace(template_Header,"[PRODUCTLIST_BUTTON_HIDE_IMAGES]",htmlButtonProductImages)
				    template_Header = replace(template_Header,"[PRODUCTLIST_SORT_BY]",htmlSortBy)
				    template_Header = replace(template_Header,"[PRODUCTLIST_FILTER_BY]",htmlFilterBy)
				    template_Header = replace(template_Header,"[PRODUCTLIST_PRODUCT_COUNT]",htmlProductCount)
				    template_Header = replace(template_Header,"[PRODUCTLIST_PAGES]",htmlPages)
				    htmlHeader = template_Header
				else 'use standard 
				end if 
				
				html = html & htmlHeader
				
				'START PRODUCT LIST TABLE
				Dim tableColumns : tableColumns = 0
				html = html & "<table border=""0"" width=""100%"" cellpadding=""2"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"">"
				html = html & "<tr>"
				if showThumbnails then 
				   tableColumns = tableColumns+1
				   html = html & "<th width=""40"" height=""52"">Image</th>"
				end if 
				tableColumns = tableColumns+1
				html = html & "<th width=""400"" height=""52""><a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Bezeichnung"">" & getTranslation("Bezeichnung") & "</a></th>"
				if SHOP_SHOW_PRICE then
				    tableColumns = tableColumns+1
					html = html & "<th width=""80"" align=right><a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=PreisATS"">" & getTranslation("Preis") & "</a></th>"
				end if 
				if VARVALUE("SHOP_SHOW_HERSTELLER") then
				    tableColumns = tableColumns+1
					html = html & "<th width=""90""><a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Firma"">" & getTranslation("Hersteller") & "</a></th>"
				end if 

				if VARVALUE("SHOP_SHOW_ANGELEGTAM") then
				    tableColumns = tableColumns+1
					html = html & "<th width=""90""><a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=AngelegtAm"">" & getTranslation("AngelegtAm") & "</a></th>"
				end if 
				
				tableColumns = tableColumns+1
				
				'wir haben sortierung nach ArtikelNr auch: ->html = html & "<th width=""80"">" & getTranslation("Artikel Nr") & "</th>"
				html = html & "<th width=""80""><a href=""default.asp?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=ArtNr"">" & getTranslation("Artikel Nr") & "</a></th>"
				
				if showlagerInfo then 
				    tableColumns = tableColumns+1
					html = html & "<th width=""80"">" & getTranslation("Lagerinfo") & "</th>"
				end if 	
				tableColumns = tableColumns+1
				html = html & "<th width=""40"">" & getTranslation("Kaufen") & "</th>"
				'html = html & "<th width=""40"">Detail</th>"
				if SHOP_SHOW_COMPARE or SHOP_SHOW_DRUCKEN then
					tableColumns = tableColumns+1
					html = html & "<th width=""90"" align=""center"">"
					if SHOP_SHOW_COMPARE then 
						html = html & "<input class='extra' type=""image"" alt =""" & getTranslation("Die selektierte Objekte vergleichen.") & """ src=""" & imageFullName("compare.gif") & """ value=""Vergleichen"" Name=""Action"">"
					end if
					if SHOP_SHOW_DRUCKEN then  
						html = html & "<br/><input class='extra' type=""image"" alt =""" & getTranslation("Die selektierte Objektliste ausdrucken.") & """ src=""" & imageFullName("printer.png") & """ value=""Drucken"" OnClick=""this.form.pageToShow.value='printManyProducts';"">"
					end if 
					html = html & "</th>" 
				end if 
				html = html & "</tr>"
				


	subPage = subPage - 1
	if subPage = 0 then 
		rsArtikel.MoveFirst
	else
	   if Session("DbType") = "MySQL" then 
			dim iMove:iMove=0 
			for iMove = 1 to (subPage * ITEMPERPAGE) '+ 1 
				'response.Write "Move " &  iMove
				rsArtikel.MoveNext
			next 
	   else '"MS Access","MSSQL"
			rsArtikel.Move (subPage * ITEMPERPAGE) '+ 1 
	   end if 	
	end if
	
Dim rowColor
Dim artNr, VKPreis, Bezeichnung, picture, firma, ean, mwst, herstellerRabatt, lagerInfo, artKatNrProdukt, angelegtAm

Dim lastGroupValue 'keeps the last value from grouping on artkatnr 
Dim htmlProductRow ' html for the product table row 
Dim htmlAllRows:    	htmlAllRows = ""    
  	    swnItems = 0
		while (not rsArtikel.EOF) and (cdbl(swnItems)<cdbl(ITEMPERPAGE))   		        
				swnItems = swnItems + 1
				
				artNR = rsArtikel("ArtNR")
				
				
				'add for statistics 
				call onProductList(artNr)
				
				if rowColor = "#F7F7F7" then rowColor = "#FFFFFF" else	rowColor = "#F7F7F7" end if 
				
				if SHOP_USE_SORT_IMPORTANCY then 'set another color for the product
				   dim ownColorHighlight: ownColorHighlight =  getEigenschaft(artNr,"Highlight_Color") & ""
				   if ownColorHighlight  <> "" then 
						rowColor = ownColorHighlight
				   end if 
				end if 
				
				'start GROUP ROW
				if lcase(ordr) = "artkatnr" then 'only on this sorting show grouping headings 
					if lastGroupValue <> artKatNrProdukt then 'show 
					    htmlProductRow = htmlProductRow & "<tr><td colspan='" & (tableColumns) & "'>" 
						htmlProductRow = htmlProductRow & getTranslation("Produkte der Kategorie") & ":" & showCategoryPath(artKatNrProdukt,"default.asp")						
						htmlProductRow = htmlProductRow & "</td></tr>" 
						lastGroupValue =  artKatNrProdukt 'take new value 
					end if  
				end if 
				'end GROUP ROW 
				
				Dim productRowCacheName : productRowCacheName = "PROD_ROW_" & artNr
				htmlProductRow = getCache(productRowCacheName) 
				if htmlProductRow = "" then 
				
						mwst = rsArtikel("MWST")
						picture  = rsArtikel("Picture")
						VKPreis = FormatNumber (makeBruttoPreis(getPreis(getLOGIN(),ArtNr, 1), mwst, session("Land")), 2)
						
						if isNumeric(VKPreis) then 
							if VKPreis <= 0 then VKPreis = "n.a."'remove VKPreis for -1 and so on 
						end if 
						
						if not isPurchasingAllowed() then 
							VKPreis = getTranslation("Login für Preise!")
						end if 

						Bezeichnung = Server.HTMLEncode(rsArtikel("Bezeichnung")&"") 
						Bezeichnung = getTranslationDok("grArtikel" , ArtNr, "Bezeichnung", Bezeichnung, Language)
						
						firma = Server.HTMLEncode(rsArtikel("Firma")&"") 
						ean = rsArtikel("EAN")
						angelegtAm = rsArtikel("AngelegtAm")
						herstellerRabatt = tablevalue("grArtikel","ArtNR",artNR,"herstellerRabatt"): if herstellerRabatt = "0" then herstellerRabatt = ""
						lagerInfo=getLieferantLagerInfo(ArtNr) 
						artKatNrProdukt = tablevalue("grArtikel","ArtNR",artNR,"ArtKatNr")
								
						htmlProductRow = htmlProductRow & "<tr>"
					    
						if showThumbnails then 				  
							htmlProductRow = htmlProductRow & "<td width=""40"" bgcolor=""" & rowColor & """>" 
							htmlProductRow = htmlProductRow & "<a href='default.asp?ArtNr=" & ArtNr & "'>"
							htmlProductRow = htmlProductRow & makeImgTag(picture, Server.HTMLEncode(Bezeichnung&""), VARVALUE("SHOP_THUMBNAIL_MAX_SIZE")) ' PRODUCT_IMAGE_SMALL_MAX_SIZE) 
							htmlProductRow = htmlProductRow & "</a>"
													
										if false then 'not needed 
											if picture <> "" and picture <> "no-image" then   
													dim thumbnailBezForToolTip: thumbnailBezForToolTip =  Server.HTMLEncode(Bezeichnung&"")
													dim thumbnailURL
													if SHOP_USE_LOCAL_THUMBS then 
														thumbnailURL = "thumbs/" & picture 
													else
													if InStr(picture,"ttp") > 0 then 'it is absolute url 
															thumbnailURL = picture
													else
															thumbnailURL = "productImages/thumbnail.aspx?width=" & PRODUCT_IMAGE_SMALL_MAX_SIZE & "&filename=" & picture 
													end if  
													end if 
								                    
													htmlProductRow = htmlProductRow & "<a href='default.asp?ArtNr=" & ArtNr & "'>"
													htmlProductRow = htmlProductRow &  "<img src=""" & thumbnailURL & """ alt=""Image fuer " & Server.HTMLEncode(Bezeichnung&"") & _
																""" tooltip=""" & thumbnailBezForToolTip & """ border=0>" 
													htmlProductRow = htmlProductRow & "</a>"
											end if 
										end if   
							htmlProductRow = htmlProductRow & "</td>"				  
						end if 
						 
						 

		 
						'Bezeichnung und Beschreibung column
						htmlProductRow = htmlProductRow & "<td align=""left"" bgcolor=""" & rowColor &""">" 	
						if template_ColumnDescription<> "" then 'template exists 
						'handles in SHOW_PRODUCT_DETAILS	
						else 
						htmlProductRow = htmlProductRow & "<b><a href='default.asp?ArtNr=" & ArtNr & "'>" &  Bezeichnung &  "</b></a>"	
						end if 
								
						if SHOW_PRODUCT_DETAILS then 'the Description can be templated with a file FLENAME_COLUMNT_DESCRIPTION

						if template_ColumnDescription <> "" then 'file exists 
								Dim copyTempl: copyTempl = "" & template_ColumnDescription
								htmlProductRow = htmlProductRow & makeProductPageWithTemplate(ArtNr, copyTempl)
						else 'no template file 
						        Dim beschreibung 
                                'beschreibung =  tablevalue("grArtikel", "ArtNR", ArtNR, "Beschreibung")
						        'beschreibung = getTranslationDok("grArtikel" , ArtNr, "Beschreibung", Beschreibung, Language)
								beschreibung = makeBeschreibung (ArtNR, true)
                                htmlProductRow = htmlProductRow & "<br>" & beschreibung
								htmlProductRow = htmlProductRow & "<br>" & getTranslation("Hersteller Nr:") & "<b>" & ean & "</b>"
							end if
						end if 
						htmlProductRow = htmlProductRow & "</td>"
						
						if SHOP_SHOW_PRICE then
							htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &"""><p align=""right"">" & VKPreis 
							if herstellerRabatt <> "" then 
								htmlProductRow = htmlProductRow & "<br>" & getTranslation("Rabatt") & ":" & herstellerRabatt
							end if 				
							htmlProductRow = htmlProductRow & "</td>"
						end if 
						
						if SHOP_SHOW_HERSTELLER then
							htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &""">" & firma & "</td>"
						end if 	

						if SHOP_SHOW_ANGELEGTAM then
						 dim  color_angelegt_am 
						  'cloro to take the attention to the new producs
						  if angelegtAm  <= now() - 30  then  color_angelegt_am  = "gray" 
						  if angelegtAm  > now() - 30  then  color_angelegt_am  = "blue" 
						  if angelegtAm  > now() - 10 then  color_angelegt_am  = "green" 
						  if angelegtAm  > now() - 3  then  color_angelegt_am  = "red" 
						   
							htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &"""><font color='"  & color_angelegt_am & "'>" & angelegtAm & "</font></td>"
						end if 	
												
						htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &""">" & ArtNr & "</td>"
						if showlagerInfo then 
							htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &""">" & lagerInfo & "</td>"
						end if 
						
						htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &"""><a href='default.asp?pageToShow=PutInWarenkorb&nextPageToShow=warenkorbStep1&ArtNr=" & ArtNr & "'><img border=0 src='" & imageFullName("buy.gif") & "' alt='" & getTranslation("Kaufen") & " " & Bezeichnung & "'></a></td>"
						'html = html & "<td align=""center"" bgcolor=""" & rowColor &"""><a href='default.asp?ArtNr=" & ArtNr & "'>detail</a></td>"
						if SHOP_SHOW_COMPARE or SHOP_SHOW_DRUCKEN then 
							htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor &""" ><input type=""checkbox"" value=""" & ArtNr & """ name=""ArtNrToCompare""  class=""submit""></td>" 
						end if 
						htmlProductRow = htmlProductRow & "</tr>"
				        
				        'save in Cache 
				        call setCache(productRowCacheName, htmlProductRow) 
				end if 'read product row from cache 
				
				
				if SHOP_USE_SORT_IMPORTANCY then 
					dim productHasBetterSorting: productHasBetterSorting = getEigenschaft(artNr,"Wichtigkeit") & ""
			         if productHasBetterSorting <> "" then 'put on the top 
			            htmlAllRows = htmlProductRow & _ 
			            "<tr colspan=" & (tableColumns-1) & "><td></td></tr>" & _
			            htmlAllRows 
			         else
						htmlAllRows = htmlAllRows & htmlProductRow
			         end if 
				else 
					htmlAllRows = htmlAllRows & htmlProductRow
				end if 
				htmlProductRow = ""
		   rsArtikel.moveNext
		wend
	
                html = html & htmlAllRows
                  
				html = html & "<th colspan=" & (tableColumns-1) & "></th>"
				
				if SHOP_SHOW_COMPARE then					
					html = html & "<th><input class='extra' type='image' alt='Compare the selected products' src=""" & imageFullName("compare.gif") & """ value=""Vergleichen""  id=1 name=1><!--<input type=""submit"" value=""Vergleichen"">--></th>" 					
				end if 
				
	html = html & "</tr>"		
	html = html & "</table>"
	html = html & "<p align=""left"">" & getTranslation("Seite") & ":" & linkBack  & pagesLinks & linkForward
	html = html & "<br><a href=""#top"">" & getTranslation("Zum Seitenanfang") & "</a>"
	html = html & "</form>"
 
end if

rsArtikel.close
Response.Flush

makeProductListOnQuery = html
end function 
%>