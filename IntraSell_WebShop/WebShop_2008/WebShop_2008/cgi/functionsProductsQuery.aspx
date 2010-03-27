<script language="VB" runat="server">  
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

    Function makeProductListOnQuery(ByVal Sql, ByVal FilterBySQL, ByVal OrderBy, ByVal SearchDescription) As String
        Dim showOnlyResultCount : showOnlyResultCount = Request("showOnlyResultCount") 'true

        Session("CURRENT_SEARCH") = Sql ' save for the next search/filter

        'added 22-12-2004 
        'save this sessions search 
        Call saveSessionSearch(Sql, SearchDescription)
        'set defaults for older shop versions 
  
        If Not IsNumeric(VARVALUE("SHOP_RESULT_LIST_ITEMS_PER_PAGE")) Then
            Call SETVARVALUE("SHOP_RESULT_LIST_ITEMS_PER_PAGE", "20")
        End If
	
        If VARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS") <> "true" And VARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS", "true")
        End If
	
        If VARVALUE("SHOP_SHOW_LAGERINFO") <> "true" And VARVALUE("SHOP_SHOW_LAGERINFO") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_LAGERINFO", "true")
        End If
	
        If VARVALUE("SHOP_SHOW_PRICE") <> "true" And VARVALUE("SHOP_SHOW_PRICE") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_PRICE", "true")
        End If
	
        If VARVALUE("SHOP_SHOW_COMPARE") <> "true" And VARVALUE("SHOP_SHOW_COMPARE") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_COMPARE", "true")
        End If

        If VARVALUE("SHOP_SHOW_DRUCKEN") <> "true" And VARVALUE("SHOP_SHOW_DRUCKEN") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_DRUCKEN", "true")
        End If
		
        If VARVALUE("SHOP_ALLOW_SORTING") <> "true" And VARVALUE("SHOP_ALLOW_SORTING") <> "false" Then
            Call SETVARVALUE("SHOP_ALLOW_SORTING", "true")
        End If

        If VARVALUE("SHOP_ALLOW_DROPDOWN_SORTING") <> "true" And VARVALUE("SHOP_ALLOW_DROPDOWN_SORTING") <> "false" Then
            Call SETVARVALUE("SHOP_ALLOW_DROPDOWN_SORTING", "true")
        End If
	
        If VARVALUE("SHOP_SHOW_HERSTELLER") <> "true" And VARVALUE("SHOP_SHOW_HERSTELLER") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_HERSTELLER", "true")
        End If

        If VARVALUE("SHOP_SHOW_THUMBNAILS") <> "true" And VARVALUE("SHOP_SHOW_THUMBNAILS") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_THUMBNAILS", "true")
        End If

        If Not IsNumeric(VARVALUE("SHOP_THUMBNAIL_MAX_SIZE")) Then
            Call SETVARVALUE("SHOP_THUMBNAIL_MAX_SIZE", "160")
        End If
	
        If VARVALUE("SHOP_SHOW_ANGELEGTAM") <> "true" And VARVALUE("SHOP_SHOW_ANGELEGTAM") <> "false" Then
            Call SETVARVALUE("SHOP_SHOW_ANGELEGTAM", "true")
        End If
	
        If VARVALUE("SHOP_SAVE_QUERY") <> "true" And VARVALUE("SHOP_SAVE_QUERY") <> "false" Then
            Call SETVARVALUE("SHOP_SAVE_QUERY", "false")
        End If

        'the grArtikel has keyword Highlight_Color<>0
        If VARVALUE("SHOP_USE_HIGHLIGHT") <> "true" And VARVALUE("SHOP_USE_HIGHLIGHT") <> "false" Then
            Call SETVARVALUE("SHOP_USE_HIGHLIGHT", "false")
        End If
	
        'the grArtikel has keyword Wichtigkeit<>0
        If VARVALUE("SHOP_USE_SORT_IMPORTANCY") <> "true" And VARVALUE("SHOP_USE_SORT_IMPORTANCY") <> "false" Then
            Call SETVARVALUE("SHOP_USE_SORT_IMPORTANCY", "false")
        End If
        'end set 

        Dim SHOP_SHOW_PRICE  As Boolean: SHOP_SHOW_PRICE = VARVALUE("SHOP_SHOW_PRICE")
        Dim SHOP_SHOW_COMPARE  As Boolean: SHOP_SHOW_COMPARE = VARVALUE("SHOP_SHOW_COMPARE")
        Dim SHOP_SHOW_DRUCKEN  As Boolean: SHOP_SHOW_DRUCKEN = VARVALUE("SHOP_SHOW_DRUCKEN")
        Dim SHOP_SHOW_ANGELEGTAM  As Boolean: SHOP_SHOW_ANGELEGTAM = VARVALUE("SHOP_SHOW_ANGELEGTAM")
 
	 
        Dim SHOP_ALLOW_SORTING : SHOP_ALLOW_SORTING = VARVALUE("SHOP_ALLOW_SORTING")
        Dim SHOP_ALLOW_DROPDOWN_SORTING : SHOP_ALLOW_DROPDOWN_SORTING = VARVALUE("SHOP_ALLOW_DROPDOWN_SORTING")
        Dim SHOP_SHOW_HERSTELLER : SHOP_SHOW_HERSTELLER = VARVALUE("SHOP_SHOW_HERSTELLER")
        Dim ITEMPERPAGE : ITEMPERPAGE = VARVALUE("SHOP_RESULT_LIST_ITEMS_PER_PAGE")
        Dim SHOW_PRODUCT_DETAILS : SHOW_PRODUCT_DETAILS = VARVALUE("SHOP_SHOW_PRODUCT_DESCRIPTIONS")
        Dim SHOWLAGERINFO : SHOWLAGERINFO = VARVALUE("SHOP_SHOW_LAGERINFO")
        Dim SHOP_SAVE_QUERY : SHOP_SAVE_QUERY = VARVALUE("SHOP_SAVE_QUERY")

        'Sorting and Highlight handling 
        Dim SHOP_USE_HIGHLIGHT : SHOP_USE_HIGHLIGHT = varvalue("SHOP_USE_HIGHLIGHT")
        Dim SHOP_USE_SORT_IMPORTANCY : SHOP_USE_SORT_IMPORTANCY = varvalue("SHOP_USE_SORT_IMPORTANCY")
    
        'Switch show or not can be switched from user interface  
        Dim showThumbnails : showThumbnails = VARVALUE("SHOP_SHOW_THUMBNAILS")
        Dim artKatNR : artKatNR = 0
        If Request("preKatNr") <> "" Then artKatNR = Request("preKatNr")
        If Request("artKatNrForFilter") <> "" Then artKatNR = Request("artKatNrForFilter")


        Dim template_ColumnDescription 'template for description column
        template_ColumnDescription = "" & readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/" & FLENAME_PRODUCT_LIST_COLUMN_DESCRIPTION))

        Dim template_Header 'html tempalte for table header / extra functions 
        template_Header = "" & readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/" & FLENAME_PRODUCT_LIST_HEADER))




        'START SONDERBEHANDLUNG FÜR SUCHINSRATE IMMO 
        Dim catDesc : catDesc = tablevalue("[grArtikel-Kategorien]", "ArtKatNr", artKatNR, "[Desc]") 'has "Suchen" on beginning 
        'response.Write "catDesc=" & catDesc
        If InStr(catDesc, "uchen") > 0 Then 'hat Suchen 
            SHOP_SHOW_PRICE = False
            showThumbnails = False
        End If
        'END SONDERBEHANDLUNG FÜR SUCHINSRATE IMMO 

        Dim ordr 'holds old order by 
        Dim html ' contains buffered search result 

        If OrderBy <> "" Then
            ordr = OrderBy
            OrderBy = " ORDER BY " & OrderBy
        Else
            OrderBy = " ORDER BY " & VARVALUE_DEFAULT("SHOP_PRODUCTLIST_SORT", "AngelegtAm") & " desc" 'neue Produkte Zuerst
        End If

        Dim requestFilterBy : requestFilterBy = Request("filterBy")
        If Request("filterBy") = "ALLE" Then FilterBySQL = ""

        If FilterBySQL <> "" Then Sql = Sql & " AND " & FilterBySQL
        Sql = Sql & OrderBy
        
        Dim generalLinkParameters : generalLinkParameters = "preKatNr=" & artKatNR
        Dim hideCheckedUnchecked : hideCheckedUnchecked = Request("hideCheckedUnchecked")

        'DEFAULT from SESSION
        If hideCheckedUnchecked & "" = "" Then
            hideCheckedUnchecked = Session("hideCheckedUnchecked") & ""
        End If
        'DEFAULT
        If hideCheckedUnchecked = "" Then
            hideCheckedUnchecked = "checked"
        End If

        'Aenderung nur wenn request
        If Request("hideCheckedUnchecked") <> "" Then
            If hideCheckedUnchecked = "checked" Then
                showThumbnails = False
                hideCheckedUnchecked = "unchecked"
                Session("hideCheckedUnchecked") = "unchecked"
            Else
                showThumbnails = True
                hideCheckedUnchecked = "checked"
                Session("hideCheckedUnchecked") = "checked"
            End If
        End If

        If Session("hideCheckedUnchecked") = "unchecked" Then
            showThumbnails = False
        End If

        'save in log file'warning: needs write permisions for this file 
        Call writeLog("productlistSQL.log", Sql)

        Dim rsArtikel
        rsArtikel = objConnectionExecute(Sql)

        If rsArtikel.EOF Then 'nothing found 
            'html = ""
            makeProductListOnQuery = "<center>" & getTranslation("Ihre Suche hat leider keine Ergebnisse gebracht!") & "<br>" & _
                   getTranslation("Sie haben gesucht nach:") & SearchDescription & _
                   "<br><a href='javascript:history.back();' _OnClick='history.back();'>" & getTranslation("Zurück") & "</a>" & _
                   "<!--<" & COUNT_RESULT_LINES & ">0</" & COUNT_RESULT_LINES & ">--><br></center>"
	                           
            'mail this event to the Shop Administration 
            Dim sendVar  'set default 
            sendVar = VARVALUE("SHOW_SEND_EMAIL_FOR_EMPTY_SEARCH")
            If sendVar <> "TRUE" And sendVar <> "FALSE" Then
                Call SETVARVALUE("SHOW_SEND_EMAIL_FOR_EMPTY_SEARCH", "FALSE")
            End If
            If sendVar = "TRUE" Then
                Call sendMailFromWithSending(VARVALUE("EMAIL_ADMIN"), "Suche ohne Ergebniss nach: " & SearchDescription, "", VARVALUE("EMAIL"))
            End If
		                      
            Exit Function
        Else
            Dim pgs, rscnt, pp
            Dim subPage, swnItems, toP
            Dim product_from, product_til
	
            rscnt = UBound(rsArtikel.getrows, 2) + 1
	
            rsArtikel.MoveFirst()

            subPage = Request("pp")
            If subPage = "" Then
                subPage = 1
            Else
                subPage = CInt(subPage)
            End If

            toP = rscnt \ ITEMPERPAGE
            If toP * ITEMPERPAGE < rscnt Then toP = toP + 1
	
            product_from = (subPage - 1) * ITEMPERPAGE + 1
            product_til = product_from + ITEMPERPAGE - 1
	
            Dim linkBack, linkForward
	
            If subPage > 1 Then
                linkBack = "<a href='default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&artKatNrForFilter=" & artKatNR & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & (subPage - 1) & "'>&lt;&lt;" & getTranslation("Zur&uuml;ck") & "</a> | "
            Else
                linkBack = ""
            End If
            If subPage < toP Then
                linkForward = "<a href='default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&artKatNrForFilter=" & artKatNR & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & (subPage + 1) & "'>" & getTranslation("Weiter") & "&gt;&gt;</a>"
            Else
                linkForward = ""
            End If
	
	
            Dim pagesLinks
            For pgs = 1 To toP
                If pgs <> subPage Then
                    pagesLinks = pagesLinks & "<a href='default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&artKatNrForFilter=" & artKatNR & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & pgs & "'> " & pgs & "</a> | "
                Else
                    pagesLinks = pagesLinks & "<B>" & pgs & "</B>" & " | "
                End If
                'Response.Write (pp)
		
            Next
	
	

            html = html & "<a name=""top""></a>"
            html = html & "<form action=""default.aspx?pageToShow=compareManyProducts"" type=""POST"">"
            html = html + "<input name=""pageToShow"" type=""hidden"" value=""compareManyProducts"">"
			
			
            Dim htmlHeader
            'Template variables for the header description
            Dim htmlSearchDescription, htmlSearchDescriptionSaveButton
            Dim htmlButtonProductImages
            Dim htmlSortBy, htmlFilterBy
            Dim htmlProductCount, htmlPages
				
            If SearchDescription <> "" Then
                htmlHeader = htmlHeader & getTranslation("Sie haben gesucht nach:") & "<b>" & SearchDescription & "</b> "
                If SHOP_SAVE_QUERY Then
                    htmlHeader = htmlHeader & htmlForSaveUserQuery(Sql, FilterBySQL, OrderBy, SearchDescription)
                End If
                htmlHeader = htmlHeader & "<br>"
					
                htmlSearchDescription = getTranslation("Sie haben gesucht nach:") & "<b>" & SearchDescription & "</b> "
                If SHOP_SAVE_QUERY Then
                    htmlSearchDescriptionSaveButton = htmlForSaveUserQuery(Sql, FilterBySQL, OrderBy, SearchDescription)
                Else
                    htmlSearchDescriptionSaveButton = ""
                End If
            End If

								
            'main table for HEADER  
            htmlHeader = htmlHeader & "<table align=center width=""100%"" border=""0"">"
				
            'try to load template for table headers 
				 
            If SHOP_ALLOW_SORTING Then
				
                htmlHeader = htmlHeader & "<tr><td colspan=2>"
                'HIDE PRODUCT IMAGES 
					
                htmlButtonProductImages = "<input class='extra' type='checkbox' name='HideProductImgs' " & hideCheckedUnchecked & _
                   " OnClick=""top.location.href='default.aspx?pageToShow=Produktliste&hideCheckedUnchecked=" & hideCheckedUnchecked & _
                   "&artKatNrForFilter=" & artKatNR & "&filterBy=" & requestFilterBy & "&orderBy=" & ordr & "&pp=" & Request("pgs") & _
                   "';""> " & getTranslation("Produktbilder anzeigen")
								
                htmlHeader = htmlHeader & htmlButtonProductImages
                htmlHeader = htmlHeader & "</td></tr>"
	

                htmlHeader = htmlHeader & "<tr>"
                htmlHeader = htmlHeader & "<td align=left> "
                'ORDER BY 
                Dim ordrToShow : ordrToShow = ordr
                If ordrToShow = "PreisATS" Then ordrToShow = "Preis"
					
                htmlSortBy = htmlSortBy & getTranslation("Sortieren nach:")
                htmlSortBy = htmlSortBy & "		<script language=""JavaScript"">"
                htmlSortBy = htmlSortBy & "        	function GOLink()"
                htmlSortBy = htmlSortBy & "        	{ "
                htmlSortBy = htmlSortBy & "        		var indx;"
                htmlSortBy = htmlSortBy & "        		indx = document.all.item(""sortBy"").selectedIndex;"
                htmlSortBy = htmlSortBy & "        		if(document.all.item(""sortBy"").options[indx].value != '') { "
                htmlSortBy = htmlSortBy & "   				top.location.href = ""default.aspx?artKatNrForFilter=" & artKatNR & "&pageToShow=Produktliste&filterBy=""+document.all.item(""filterBy"").value+""&orderBy=""+document.all.item(""sortBy"").options[indx].value; "
                htmlSortBy = htmlSortBy & "        			document.all.item(""sortBy"").selectedIndex=0;"
                htmlSortBy = htmlSortBy & "        		}"
                htmlSortBy = htmlSortBy & "        	}"
                htmlSortBy = htmlSortBy & "       </" & "script>"
					
					

                If SHOP_ALLOW_DROPDOWN_SORTING = "true" Then 'ORDERBYTYPE = "SELECT" then 				
                    htmlSortBy = htmlSortBy & "			<select id=""sortBy"" name=""sortBy"" onchange=""GOLink();"" >"
                    htmlSortBy = htmlSortBy & "			  <option value=""" & ordr & """>" & ordrToShow & "</option>"
                    htmlSortBy = htmlSortBy & "			  <option value=""AngelegtAm"">AngelegtAm</option>"
                    htmlSortBy = htmlSortBy & "			  <option value=""Bezeichnung"">Bezeichnung</option>"
                    htmlSortBy = htmlSortBy & "			  <option value=""PreisATS"">Preis</option>"
                    htmlSortBy = htmlSortBy & "			  <option value=""ArtNr"">ArtNr</option>"
                    htmlSortBy = htmlSortBy & "			  <option value=""EAN"">EAN</option>"
                    If SHOP_SHOW_HERSTELLER Then
                        htmlSortBy = htmlSortBy & "			  <option value=""Firma"">Hersteller</option>"
                    End If
                    htmlSortBy = htmlSortBy & "			</select>"
                Else 'List Like Sort
                    htmlSortBy = htmlSortBy & "<a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Bezeichnung""><b>" & getTranslation("Bezeichnung") & "</b></a> | "
                    htmlSortBy = htmlSortBy & "<a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=PreisATS""><b>" & getTranslation("Preis aufsteigend") & "</b></a> | "
                    htmlSortBy = htmlSortBy & "<a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=PreisATS DESC""><b>" & getTranslation("Preis absteigend") & "</b></a> | "
                    If SHOP_SHOW_HERSTELLER Then
                        htmlSortBy = htmlSortBy & "<a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Firma""><b>" & getTranslation("Hersteller") & "</b></a> "
                    End If
                End If
					
					
                htmlHeader = htmlHeader & htmlSortBy
                htmlHeader = htmlHeader & "</td><td align=right> "
                'END ORDER BY 
					
					
					
                If SHOP_SHOW_HERSTELLER Then
                    'FILTER BY
                    htmlFilterBy = htmlFilterBy & getTranslation("Hersteller auswählen:")
                    htmlFilterBy = htmlFilterBy & "		<script language=""JavaScript"">"
                    htmlFilterBy = htmlFilterBy & "        	function GOLinkFilter()"
                    htmlFilterBy = htmlFilterBy & "        	{ "
                    htmlFilterBy = htmlFilterBy & "        		var indx;"
                    htmlFilterBy = htmlFilterBy & "        		indx = document.all.item(""filterBy"").selectedIndex;"
                    htmlFilterBy = htmlFilterBy & "        		if(document.all.item(""filterBy"").options[indx].value != '') { "
                    htmlFilterBy = htmlFilterBy & "   					top.location.href = ""default.aspx?artKatNrForFilter=" & artKatNR & "&" & generalLinkParameters & "&pageToShow=Produktliste&filterBy=""+document.all.item(""filterBy"").options[indx].value; "
                    htmlFilterBy = htmlFilterBy & "        			document.all.item(""filterBy"").selectedIndex=0;"
                    htmlFilterBy = htmlFilterBy & "        		}"
                    htmlFilterBy = htmlFilterBy & "        	}"
                    htmlFilterBy = htmlFilterBy & "        </" & "script>"
                    htmlFilterBy = htmlFilterBy & "<select id=""filterBy"" name=""filterBy"" onchange=""GOLinkFilter();"" >"

							
                    Dim rsF, sqlF
                    sqlF = "Select distinct firma from (" & Session("CURRENT_SEARCH") & ") NEWTBL " & _
                        " group by Firma order by Firma"
                    'sqlF = "Select distinct Firma from lieferantenAdressen where Rolle like 'Hersteller' group by Firma order by Firma" 
                    'Response.Write sqlF: Response.Flush
						    
                    If artKatNR > 0 Then  'select only the meaning Hersteller from this cat 
                        sqlF = "Select distinct Firma from lieferantenAdressen where Rolle like 'Hersteller' " & _
                            " and idnr in (select HerstellerNr from grArtikel where ArtKatNr=" & artKatNR & _
                            ") group by Firma order by Firma"
                    End If
						    
                    rsF = objConnectionExecute(sqlF)
						    
                    If Request("FilterBy") <> "" Then htmlHeader = htmlHeader & "<option value=""" & Request("FilterBy") & """>" & Request("FilterBy")
                    htmlFilterBy = htmlFilterBy & "        <option value=""ALLE"">" & getTranslation("ALLE")
                    While Not rsF.EOF
                        htmlFilterBy = htmlFilterBy & "<option value=""" & rsF("Firma").Value & """>" & rsF("Firma").Value
                        rsF.MoveNext()
                    End While
                    rsF.close()
                    htmlFilterBy = htmlFilterBy & "			</select>"
                    'END FILTER 
                Else
                    htmlFilterBy = htmlFilterBy & "			<select style=""visibility:hidden"" id=""filterBy"" name=""filterBy"" onchange=""GOLinkFilter();"" ></select>" 'empty select
                End If 'VARVALUE("SHOP_SHOW_HERSTELLER")
					
                htmlHeader = htmlHeader & htmlFilterBy
                htmlHeader = htmlHeader & " </td></tr>"
				
            End If 'varvalue("SHOP_ALLOW_SORTING")
				
 
				
            'PRODUCT COUNT
            htmlHeader = htmlHeader & "<tr>"
            htmlHeader = htmlHeader & " <td align=left colspan=2>"
            htmlProductCount = getTranslation("Produktanzahl") & ": " & "<" & COUNT_RESULT_LINES & ">" & rscnt & "</" & COUNT_RESULT_LINES & ">" & " " & getTranslation("Anzeige Produkte von") & " " & product_from & " " & getTranslation("bis") & " " & product_til
            htmlHeader = htmlHeader & htmlProductCount
            htmlHeader = htmlHeader & "</td>"
            htmlHeader = htmlHeader & "</tr>"
				
            htmlHeader = htmlHeader & "<tr><td colspan=2>"
            htmlPages = getTranslation("Seite") & ":" & linkBack & pagesLinks & linkForward
            htmlHeader = htmlHeader & htmlPages
            htmlHeader = htmlHeader & " </td><tr>"
            htmlHeader = htmlHeader & "</table>"
				
				
            If showOnlyResultCount = "true" Then
                makeProductListOnQuery = html & htmlHeader
                Exit Function
            End If
            htmlHeader = htmlHeader & " <center>"
				
            If template_Header <> "" Then 'the shop has header defined in skins 
                htmlHeader = "" 'do not use standard header				    
                template_Header = Replace(template_Header, "[PRODUCTLIST_SEARCH_DESCRIPTION]", htmlSearchDescription)
                template_Header = Replace(template_Header, "[PRODUCTLIST_SEARCH_DESCRIPTION_SAVE_BUTTON]", htmlSearchDescriptionSaveButton)
                template_Header = Replace(template_Header, "[PRODUCTLIST_BUTTON_HIDE_IMAGES]", htmlButtonProductImages)
                template_Header = Replace(template_Header, "[PRODUCTLIST_SORT_BY]", htmlSortBy)
                template_Header = Replace(template_Header, "[PRODUCTLIST_FILTER_BY]", htmlFilterBy)
                template_Header = Replace(template_Header, "[PRODUCTLIST_PRODUCT_COUNT]", htmlProductCount)
                template_Header = Replace(template_Header, "[PRODUCTLIST_PAGES]", htmlPages)
                htmlHeader = template_Header
            Else 'use standard 
            End If
				
            html = html & htmlHeader
				
            'START PRODUCT LIST TABLE
            Dim tableColumns : tableColumns = 0
            html = html & "<table border=""0"" width=""100%"" cellpadding=""2"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"">"
            html = html & "<tr>"
            If showThumbnails Then
                tableColumns = tableColumns + 1
                html = html & "<th width=""40"" height=""52"">Image</th>"
            End If
            tableColumns = tableColumns + 1
            html = html & "<th width=""400"" height=""52""><a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Bezeichnung"">" & getTranslation("Bezeichnung") & "</a></th>"
            If SHOP_SHOW_PRICE Then
                tableColumns = tableColumns + 1
                html = html & "<th width=""80"" align=right><a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=PreisATS"">" & getTranslation("Preis") & "</a></th>"
            End If
            If VARVALUE("SHOP_SHOW_HERSTELLER") Then
                tableColumns = tableColumns + 1
                html = html & "<th width=""90""><a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=Firma"">" & getTranslation("Hersteller") & "</a></th>"
            End If

            If VARVALUE("SHOP_SHOW_ANGELEGTAM") Then
                tableColumns = tableColumns + 1
                html = html & "<th width=""90""><a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=AngelegtAm"">" & getTranslation("AngelegtAm") & "</a></th>"
            End If
				
            tableColumns = tableColumns + 1
				
            'wir haben sortierung nach ArtikelNr auch: ->html = html & "<th width=""80"">" & getTranslation("Artikel Nr") & "</th>"
            html = html & "<th width=""80""><a href=""default.aspx?pageToShow=Produktliste&" & generalLinkParameters & "&filterBy=" & requestFilterBy & "&orderBy=ArtNr"">" & getTranslation("Artikel Nr") & "</a></th>"
				
            If SHOWLAGERINFO Then
                tableColumns = tableColumns + 1
                html = html & "<th width=""80"">" & getTranslation("Lagerinfo") & "</th>"
            End If
            
            tableColumns = tableColumns + 1
            html = html & "<th width=""40"">" & getTranslation("Kaufen") & "</th>"
            'html = html & "<th width=""40"">Detail</th>"
            If SHOP_SHOW_COMPARE Or SHOP_SHOW_DRUCKEN Then
                tableColumns = tableColumns + 1
                html = html & "<th width=""90"" align=""center"">"
                If SHOP_SHOW_COMPARE Then
                    html = html & "<input class='extra' type=""image"" alt =""" & getTranslation("Die selektierte Objekte vergleichen.") & """ src=""" & imageFullName("compare.gif") & """ value=""Vergleichen"" Name=""Action"">"
                End If
                If SHOP_SHOW_DRUCKEN Then
                    html = html & "<br/><input class='extra' type=""image"" alt =""" & getTranslation("Die selektierte Objektliste ausdrucken.") & """ src=""" & imageFullName("printer.png") & """ value=""Drucken"" OnClick=""this.form.pageToShow.value='printManyProducts';"">"
                End If
                html = html & "</th>"
            End If
            html = html & "</tr>"
				


            subPage = subPage - 1
            If subPage = 0 Then
                rsArtikel.MoveFirst()
            Else
                If Session("DbType") = "MySQL" Then
                    Dim iMove : iMove = 0
                    For iMove = 1 To (subPage * ITEMPERPAGE) '+ 1 
                        'response.Write "Move " &  iMove
                        rsArtikel.MoveNext()
                    Next
                Else '"MS Access","MSSQL"
                    rsArtikel.Move(subPage * ITEMPERPAGE) '+ 1 
                End If
            End If
	
            Dim rowColor
            Dim artNr, VKPreis, Bezeichnung, picture, firma, ean, mwst, herstellerRabatt, lagerInfo, artKatNrProdukt
            Dim angelegtAm As Date
            Dim lastGroupValue 'keeps the last value from grouping on artkatnr 
            Dim htmlProductRow ' html for the product table row 
            Dim htmlAllRows : htmlAllRows = ""
            swnItems = 0
  	    
            Dim SHOP_PRODUCTLIST_ROW_COLOR : SHOP_PRODUCTLIST_ROW_COLOR = VARVALUE_DEFAULT("SHOP_PRODUCTLIST_ROW_COLOR", "#F7F7F7")
            Dim SHOP_PRODUCTLIST_ROW_COLOR_ALT : SHOP_PRODUCTLIST_ROW_COLOR_ALT = VARVALUE_DEFAULT("SHOP_PRODUCTLIST_ROW_COLOR_ALT", "#FFFFFF")
 
            While (Not rsArtikel.EOF) And (CDbl(swnItems) < CDbl(ITEMPERPAGE))
                swnItems = swnItems + 1
				
                artNr = rsArtikel("ArtNR").Value
				
				
                'add for statistics 
                Call onProductList(artNr)
				
                If rowColor = SHOP_PRODUCTLIST_ROW_COLOR Then
                    rowColor = SHOP_PRODUCTLIST_ROW_COLOR_ALT
                Else
                    rowColor = SHOP_PRODUCTLIST_ROW_COLOR
                End If
				
                If SHOP_USE_SORT_IMPORTANCY Then 'set another color for the product
                    Dim ownColorHighlight : ownColorHighlight = getEigenschaft(artNr, "Highlight_Color") & ""
                    If ownColorHighlight <> "" Then
                        rowColor = ownColorHighlight
                    End If
                End If
				
                'start GROUP ROW
                If LCase(ordr) = "artkatnr" Then 'only on this sorting show grouping headings 
                    If lastGroupValue <> artKatNrProdukt Then 'show 
                        htmlProductRow = htmlProductRow & "<tr><td colspan='" & (tableColumns) & "'>"
                        htmlProductRow = htmlProductRow & getTranslation("Produkte der Kategorie") & ":" & showCategoryPath(artKatNrProdukt, "default.aspx")
                        htmlProductRow = htmlProductRow & "</td></tr>"
                        lastGroupValue = artKatNrProdukt 'take new value 
                    End If
                End If
                'end GROUP ROW 
				
                Dim productRowCacheName : productRowCacheName = "PROD_ROW_" & artNr
                htmlProductRow = getCache(productRowCacheName)
                If htmlProductRow = "" Then
				
                    mwst = rsArtikel("MWST").Value
                    picture = rsArtikel("Picture").Value.ToString()
                    VKPreis = FormatNumber(makeBruttoPreis(getPreis(getLOGIN(), artNr, 1), mwst, Session("Land")), 2)
						
                    If IsNumeric(VKPreis) Then
                        If VKPreis <= 0 Then VKPreis = "n.a." 'remove VKPreis for -1 and so on 
                    End If
						
                    If Not isPurchasingAllowed() Then
                        VKPreis = getTranslation("Login für Preise!")
                    End If

                    Bezeichnung = Server.HtmlEncode(rsArtikel("Bezeichnung").Value & "")
                    Bezeichnung = getTranslationDok("grArtikel", artNr, "Bezeichnung", Bezeichnung, Language)
						
                    firma = Server.HtmlEncode(rsArtikel("Firma").Value & "")
                    ean = rsArtikel("EAN").Value
                    
                    If rsArtikel("AngelegtAm").Value.ToString <> DBNull.Value.ToString then 
                        angelegtAm = rsArtikel("AngelegtAm").Value
                    Else 
                        angelegtAm = Now
                    End If 
                    
                    herstellerRabatt = tablevalue("grArtikel", "ArtNR", artNr, "herstellerRabatt") : If herstellerRabatt = "0" Then herstellerRabatt = ""
                    lagerInfo = getLieferantLagerInfo(artNr)
                    artKatNrProdukt = tablevalue("grArtikel", "ArtNR", artNr, "ArtKatNr")
								
                    htmlProductRow = htmlProductRow & "<tr>"
					    
					Dim SHOP_THUMBNAIL_MAX_SIZE As String = VARVALUE_DEFAULT("SHOP_THUMBNAIL_MAX_SIZE", "100")
                    If showThumbnails Then
                        htmlProductRow = htmlProductRow & "<td width=""40""  bgcolor=""" & rowColor & """>"
                        htmlProductRow = htmlProductRow & "<a href='default.aspx?ArtNr=" & artNr & "'>"
                        htmlProductRow = htmlProductRow & makeImgTag(picture, Server.HtmlEncode(Bezeichnung & ""), SHOP_THUMBNAIL_MAX_SIZE) ' PRODUCT_IMAGE_SMALL_MAX_SIZE) 
                        htmlProductRow = htmlProductRow & "</a>"
													
                        If False Then 'not needed 
                            If picture <> "" And picture <> "no-image" Then
                                Dim thumbnailBezForToolTip : thumbnailBezForToolTip = Server.HtmlEncode(Bezeichnung & "")
                                Dim thumbnailURL
                                If LCase(VARVALUE_DEFAULT("SHOP_USE_LOCAL_THUMBS", "true")) = "true" Then
                                    thumbnailURL = "thumbs/" & picture
                                Else
                                    If InStr(picture, "ttp") > 0 Then 'it is absolute url 
                                        thumbnailURL = picture
                                    Else
                                        thumbnailURL = "productImages/thumbnail.aspx?width=" & PRODUCT_IMAGE_SMALL_MAX_SIZE & "&filename=" & picture
                                    End If
                                End If
								                    
                                htmlProductRow = htmlProductRow & "<a href='default.aspx?ArtNr=" & artNr & "'>"
                                htmlProductRow = htmlProductRow & "<img src=""" & thumbnailURL & """ alt='Image fuer " & _
                                Server.HtmlEncode(Bezeichnung & "") & _
                                "' tooltip='" & thumbnailBezForToolTip & "' border=0>"
                                htmlProductRow = htmlProductRow & "</a>"
                            End If
                        End If
                        htmlProductRow = htmlProductRow & "</td>"
                    End If
						 
						 

		 
                    'Bezeichnung und Beschreibung column
                    htmlProductRow = htmlProductRow & "<td align=""left"" bgcolor=""" & rowColor & """>"
                    If template_ColumnDescription <> "" Then 'template exists 
                        'handles in SHOW_PRODUCT_DETAILS	
                    Else
                        htmlProductRow = htmlProductRow & "<b><a href='default.aspx?ArtNr=" & artNr & "'>" & Bezeichnung & "</b></a>"
                    End If
								
                    If SHOW_PRODUCT_DETAILS Then 'the Description can be templated with a file FLENAME_COLUMNT_DESCRIPTION

                        If template_ColumnDescription <> "" Then 'file exists 
                            Dim copyTempl : copyTempl = "" & template_ColumnDescription
                            htmlProductRow = htmlProductRow & makeProductPageWithTemplate(artNr, copyTempl)
                        Else 'no template file 
                            Dim beschreibung
                            'beschreibung =  tablevalue("grArtikel", "ArtNR", ArtNR, "Beschreibung")
                            'beschreibung = getTranslationDok("grArtikel" , ArtNr, "Beschreibung", Beschreibung, Language)
                            beschreibung = makeBeschreibung(artNr, True)
                            htmlProductRow = htmlProductRow & "<br>" & beschreibung
                            htmlProductRow = htmlProductRow & "<br>" & getTranslation("Hersteller Nr:") & "<b>" & ean & "</b>"
                        End If
                    End If
                    htmlProductRow = htmlProductRow & "</td>"
						
                    If SHOP_SHOW_PRICE Then
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """><p align=""right"">" & VKPreis
                        If herstellerRabatt <> "" Then
                            htmlProductRow = htmlProductRow & "<br>" & getTranslation("Rabatt") & ":" & herstellerRabatt
                        End If
                        htmlProductRow = htmlProductRow & "</td>"
                    End If
						
                    If SHOP_SHOW_HERSTELLER Then
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """>" & firma & "</td>"
                    End If

                    If SHOP_SHOW_ANGELEGTAM Then
                        Dim color_angelegt_am
                        'cloro to take the attention to the new producs
                        If angelegtAm <= Now().AddDays(-30) Then color_angelegt_am = "gray"
                        If angelegtAm > Now().AddDays(-30) Then color_angelegt_am = "blue"
                        If angelegtAm > Now().AddDays(-10) Then color_angelegt_am = "green"
                        If angelegtAm > Now().AddDays(-3) Then color_angelegt_am = "red"
						   
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """><font color='" & color_angelegt_am & "'>" & angelegtAm & "</font></td>"
                    End If
                    If UCase(VARVALUE("BenutzeEAN")) = "TRUE" Then  'EAN					
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """>" & ean & "</td>"
                    Else 'ArtNR 
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """>" & artNr & "</td>"
                    End If
						
                    If SHOWLAGERINFO Then
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """>" & lagerInfo & "</td>"
                    End If
						
                    htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """><a href='default.aspx?pageToShow=PutInWarenkorb&nextPageToShow=warenkorbStep1&ArtNr=" & artNr & "'><img border=0 src='" & imageFullName("buy.gif") & "' alt='" & getTranslation("Kaufen") & " " & Bezeichnung & "'></a></td>"
                    'html = html & "<td align=""center"" bgcolor=""" & rowColor &"""><a href='default.aspx?ArtNr=" & ArtNr & "'>detail</a></td>"
                    If SHOP_SHOW_COMPARE Or SHOP_SHOW_DRUCKEN Then
                        htmlProductRow = htmlProductRow & "<td align=""center"" bgcolor=""" & rowColor & """ ><input type=""checkbox"" value=""" & artNr & """ name=""ArtNrToCompare""  class=""submit""></td>"
                    End If
                    htmlProductRow = htmlProductRow & "</tr>"
				        
                    'save in Cache 
                    Call setCache(productRowCacheName, htmlProductRow)
                End If 'read product row from cache 
				
				
                If SHOP_USE_SORT_IMPORTANCY Then
                    Dim productHasBetterSorting : productHasBetterSorting = getEigenschaft(artNr, "Wichtigkeit") & ""
                    If productHasBetterSorting <> "" Then 'put on the top 
                        htmlAllRows = htmlProductRow & _
                        "<tr colspan=" & (tableColumns - 1) & "><td></td></tr>" & _
                        htmlAllRows
                    Else
                        htmlAllRows = htmlAllRows & htmlProductRow
                    End If
                Else
                    htmlAllRows = htmlAllRows & htmlProductRow
                End If
                htmlProductRow = ""
                rsArtikel.moveNext()
            End While
	
            html = html & htmlAllRows
                  
            html = html & "<th colspan=" & (tableColumns - 1) & "></th>"
				
            If SHOP_SHOW_COMPARE Then
                html = html & "<th><input class='extra' type='image' alt='Compare the selected products' src=""" & imageFullName("compare.gif") & """ value=""Vergleichen""  id=1 name=1><!--<input type=""submit"" value=""Vergleichen"">--></th>"
            End If
				
            html = html & "</tr>"
            html = html & "</table>"
            html = html & "<p align=""left"">" & getTranslation("Seite") & ":" & linkBack & pagesLinks & linkForward
            html = html & "<br><a href=""#top"">" & getTranslation("Zum Seitenanfang") & "</a>"
            html = html & "</form>"
 
        End If

        rsArtikel.close()
        Response.Flush()

        makeProductListOnQuery = html
    End Function
</script>

