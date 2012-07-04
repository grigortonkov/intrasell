<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

    Const SUBCATEGORIES_TO_SEARCH_INTO As Integer = 2
    Const BASE_ARTKATNR As Integer = 0
    Const NOT_DEFINED As String = "n.a."
    Const TEMPLATE_ARTKATNR As Integer = 9998
    '******************************************************************************
    ' SimpleListCategories
    ' shows simple down list with categories 
    ' this is now shown on the left side in the default page 
    '
    ' Style can be modified with class .category for example .category    
    ' { color: #FFFFFF; font-weight: bold; line-height: 100%; margin: 0 }
    ' 
    ' PrePreKatNr - if set then will be shown zurueck list entry 
    ' new feature -> shows only categories that are not empty/contain products or some subcats contain products !!!!!
    '******************************************************************************
    Function SimpleListCategoriesFromCache(ByVal ArtKatNr, ByVal inPageToShow) As String
        Dim temp
        Dim CACHE_NAME : CACHE_NAME = "SUB_SIMPLELISTCATEGORIES_" & ArtKatNr & "_" & inPageToShow & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, SimpleListCategories(ArtKatNr, inPageToShow))
        End If
        SimpleListCategoriesFromCache = temp
    End Function

    ''' <summary>
    ''' SimpleListCategories
    ''' </summary>
    ''' <param name="PreKatNr"></param>
    ''' <param name="inPageToShow"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function SimpleListCategories(ByVal PreKatNr, ByVal inPageToShow) As String
        Dim html As String
        Dim Language As String = Session("Language")
        If Not IsNumeric(PreKatNr) Then
            SimpleListCategories = ""
            Exit Function
        End If

        Dim sql, rs
        sql = "SELECT ArtKatNr, Name FROM [grArtikel-Kategorien] WHERE " & _
           " ArtKatNrParent=" & PreKatNr & " ORDER BY Name "
        rs = ObjConnectionexecute(sql)
        'show error that not subcats are set
        If rs.EOF Then
            Dim prePreKatNr : prePreKatNr = TABLEVALUE("[grArtikel-Kategorien]", "artKatNr", PreKatNr, "ArtKatNrParent")
            'html = getTranslation("Es sind keine weitere Unterkategorien vorhanden.") & "<br />" 
            '<a href="default.aspx?PreKatNr=prePreKatNr">Zurueck??</a>
            html = html & SimpleListCategories(prePreKatNr, inPageToShow)
            SimpleListCategories = html
            Exit Function
        End If


        Dim rsCheck
        While Not rs.EOF
            'check if the cat or the sub cat contains products 
            ''not needed sql = "select ArtNr, ArtKatNr from grArtikel where ArtKatNr In (" & makeSubcategoriesList( rs("ArtKatNr").Value,5) & ")"
            ''not needed set rsCheck = ObjConnectionexecute(sql)
            Dim name
            Dim ShowArtKatNR : ShowArtKatNR = rs("ArtKatNr").Value
            'Response.Write "Language=" &  Language 
            name = getTranslationDok("grArtikel-Kategorien", ShowArtKatNR.ToString(), "Name", rs("Name").Value, Language) & ""
            name = Server.HtmlEncode(name)
            html = html & "<a href=""" & inPageToShow & "?PreKatNr=" & ShowArtKatNR & """><div class='category'>:: " & name & "</div></a>"
            ''not needed if rsCheck.eof then 'this cat has no products   
            ''not needed 'html = html &  "[leer]"  
            ''not needed end if 
            ''not needed html = html &   "<br />"  
            rs.MoveNext()
        End While
        SimpleListCategories = html
        rs.Close()
        rs = Nothing
    End Function
 
    
    
    
    '******************************************************************************
    ' SimpleListCategories with Parent Categories
    ' shows simple down list with categories and their parents
    ' this is now shown on the left side in the default page 
    '
    ' Style can be modified with class .category for example .category    
    ' { color: #FFFFFF; font-weight: bold; line-height: 100%; margin: 0 }
    ' 
    ' PrePreKatNr - if set then will be shown zurueck list entry 
    ' new feature -> shows only categories that are not empty/contain products or some subcats contain products !!!!!
    '******************************************************************************
    Function SimpleListCategoriesWithParentCatsFromCache(ByVal ArtKatNr As String, ByVal inPageToShow As String) As String
        Dim temp
        Dim CACHE_NAME As String = "SUB_SIMPLELISTCATEGORIESWITHPARENTCATS_" & ArtKatNr & "_" & inPageToShow & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, SimpleListCategoriesWithParentCats(ArtKatNr, ArtKatNr, inPageToShow))
        End If
        SimpleListCategoriesWithParentCatsFromCache = temp
    End Function

    
    Function SimpleListCategoriesWithParentCats(ByVal PreKatNr As String, ByVal OriginalKatNr As String, ByVal inPageToShow As String) As String
        Dim html As String
        Dim Language As String = Session("Language")
        If Not IsNumeric(PreKatNr) Then
            SimpleListCategoriesWithParentCats = ""
            Exit Function
        End If

        Dim sql, rs
        sql = "SELECT ArtKatNr, Name FROM [grArtikel-Kategorien] WHERE " & _
           " ArtKatNrParent=" & PreKatNr & " ORDER BY [Order], Name "
        rs = ObjConnectionexecute(sql)
	
        Dim prePreKatNr : prePreKatNr = TABLEVALUE("[grArtikel-Kategorien]", "artKatNr", PreKatNr, "ArtKatNrParent")
	
        'show error that not subcats are existing
        If rs.EOF Then
            'html = getTranslation("Es sind keine weitere Unterkategorien vorhanden.") & "<br />" 
            '<a href="default.aspx?PreKatNr=prePreKatNr">Zurueck??</a>
            html = html & SimpleListCategoriesWithParentCats(prePreKatNr, OriginalKatNr, inPageToShow)
            SimpleListCategoriesWithParentCats = html
            Exit Function
        End If

        Dim rsCheck
        Dim name As String
        Dim ShowArtKatNR As String
        html = html & "<ul style='text-indent:0; line-height:100%; margin-left:13; margin-right:3'>"
        While Not rs.EOF
            ' check if the cat or the sub cat contains products 
            ''not needed sql = "select ArtNr, ArtKatNr from grArtikel where ArtKatNr In (" & makeSubcategoriesList( rs("ArtKatNr"),5) & ")"
            ''not needed set rsCheck = ObjConnectionexecute(sql)
   
            ShowArtKatNR = rs("ArtKatNr").Value
            'Response.Write "Language=" &  Language 
            name = getTranslationDok("grArtikel-Kategorien", ShowArtKatNR, "Name", rs("Name").Value, Language) & ""
            name = Server.HtmlEncode(name)
            If OriginalKatNr & "" = rs("ArtKatNr").Value Then
                name = "<b>" & name & "</b>"
            End If
            
            html = html & "<li>"
            html = html & "<a href=""" & inPageToShow & "?PreKatNr=" & ShowArtKatNR & """><div class='category'>" & name & "</div></a><!--" & ShowArtKatNR & "-->" & Chr(13) & Chr(10)
            html = html & "</li>"
            ''not needed if rsCheck.eof then 'this cat has no products   
            ''not needed 'html = html &  "[leer]"  
            ''not needed end if 
            ''not needed html = html &   "<br />"  
            rs.MoveNext()
        End While
        html = html & "</ul>"
        rs.Close()
        rs = Nothing

        'recursion !!! 
        Dim parentCats As String = SimpleListCategoriesWithParentCats(prePreKatNr, OriginalKatNr, inPageToShow)
        Dim PosOfSubCats As Integer = InStr(parentCats, "<!--" & PreKatNr & "-->")
        Dim parentCatsAndSubCats As String
        
        If PosOfSubCats > 0 Then
            html = "<table border='0' cellspacing='5'><tr><td>" & html & "</td></tr></table>"
            parentCatsAndSubCats = Left(parentCats, PosOfSubCats - 1) & html & Right(parentCats, 1 + Len(parentCats) - PosOfSubCats)
        Else
            parentCatsAndSubCats = parentCats & html
        End If
        
        SimpleListCategoriesWithParentCats = parentCatsAndSubCats
    End Function
        
        ''' <summary>
        ''' MenuCategories
        ''' </summary>
        ''' <param name="inPageToShow"></param>
        ''' <returns></returns>
        ''' <remarks></remarks>
    Function MenuCategories(ByVal PreKatNr, ByVal inPageToShow)
        Dim sql, rs
        PreKatNr = 0
        sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & PreKatNr & " ORDER BY Name "
        rs = ObjConnectionexecute(sql)
        While Not rs.EOF
            Response.Write("<a href=""" & inPageToShow & "?PreKatNr=" & rs("ArtKatNr").Value & """>" & rs("Name") & "</a> - ")
            rs.MoveNext()
        End While
        rs.Close()
        rs = Nothing
    End Function

 
    ''' <summary>
    ''' getProductCat
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getProductCat(ByVal ArtNr) As String
        Dim sql, rsTemp
       
        sql = "SELECT * FROM [grArtikel] WHERE ArtNr=" & ArtNr
        rsTemp = ObjConnectionexecute(sql)
        
        If rsTemp.EOF Then
            getProductCat = 0
        Else
            getProductCat = rsTemp("ArtKatNr").Value
        End If
    End Function

    '******************************************************************************
    ' shows the category path like 
    ' main>products>hardware>cards
    '******************************************************************************
    Function showCategoryPathFromCache(ByVal ArtKatNr, ByVal inPageToShow) As String
        'response.Write "call showCategoryPathFromCache"
        Dim temp
        Dim CACHE_NAME As String = "SUB_SHOWCATEGORYPATH_" & ArtKatNr & "_" & inPageToShow & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, showCategoryPath(ArtKatNr, inPageToShow))
        End If
        showCategoryPathFromCache = temp
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <param name="inPageToShow"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function showCategoryPath(ByVal ArtKatNr, ByVal inPageToShow) As String
        Dim Language As String = Session("language")
        If Not IsNumeric(ArtKatNr) Then
            showCategoryPath = getTranslation("Fehler: ArtKatNr ist keine Zahl!") & "[" & ArtKatNr & "]"
        End If
   
        Dim sql, rs
        sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNr=" & ArtKatNr
        rs = ObjConnectionexecute(sql)
   
        If rs.eof Then
            showCategoryPath = ""
            Exit Function
        End If
        Dim name As String  = getTranslationDok("grArtikel-Kategorien", rs("ArtKatNr").Value, "Name", rs("Name").Value, Language)
        showCategoryPath = showCategoryPath(rs("ArtKatNrParent").Value, inPageToShow) & " > " & _
          "<a href=""" & inPageToShow & "?PreKatNr=" & rs("ArtKatNr").Value & """>" & Server.HtmlEncode(name) & "</a>"
  
    End Function

    '******************************************************************************
    ' shows the category path like 
    ' main>products>hardware>cards
    '******************************************************************************
    Function showCategoryPathNoLinks(ByVal ArtKatNr, ByVal inPageToShow) As String
        Dim sql, rs
        sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNr=" & ArtKatNr
        rs = ObjConnectionexecute(sql)
   
        If rs.eof Then
            showCategoryPathNoLinks = ""
            Exit Function
        End If
   
        showCategoryPathNoLinks = showCategoryPathNoLinks(rs("ArtKatNrParent").Value, inPageToShow) & " - " & Server.HtmlEncode(rs("Name").Value)
  
    End Function


    '******************************************************************************
    ' shows the category path like 
    ' main>products>hardware>cards
    '******************************************************************************
    Function showCategoryName(ByVal ArtKatNr) As String
        If ArtKatNr & "" = "" Then
            showCategoryName = ""
            Exit Function
        End If
    
        Dim sql, rs
        sql = "SELECT Name FROM [grArtikel-Kategorien] WHERE ArtKatNr=" & ArtKatNr
        rs = ObjConnectionexecute(sql)
   
        If rs.eof Then
            showCategoryName = ""
            Exit Function
        End If
   
        showCategoryName = Server.HtmlEncode(rs("Name").Value)
        rs.close()
    End Function

    '***************************************************************************
    ' interactionCategoriesPath
    '***************************************************************************
    Sub interactionCategoriesPath(ByVal inPageToShow, ByVal pageToShow)
        Dim catToShow
        Dim path As String
        catToShow = Request("PreKatNr")
        'Response.Write "<br />PreKatNr1 = '" & catToShow & "'<br />"
        Response.Write("<a href=""default.aspx?pageToShow="">Home</a>")

        If InStr(pageToShow, "Product") <= 0 Then ' show only the requested page 
            Response.Write(">" & pageToShow)
            Exit Sub
        End If
    
        If catToShow = "" Then
            catToShow = Request("ArtNr")
            If catToShow = "" Then
                catToShow = Session("CURRENT_PRODUCT_CATEGORY")
                'Response.Write "<br />PreKatNr2 = '" & catToShow & "'<br />"
            Else
                'Response.Write "<br />PreKatNr3 = '" & catToShow & "'<br />"
                catToShow = getProductCat(catToShow)
                Session("CURRENT_PRODUCT_CATEGORY") = catToShow
            End If
            'catToShow = SESSION("CURRENT_PRODUCT_CATEGORY")
        Else
            Session("CURRENT_PRODUCT_CATEGORY") = catToShow
        End If
        If catToShow = "" Then catToShow = "0"
        path = "" & showCategoryPath(catToShow, inPageToShow) & "<br />"
        'response.write path & " the fuck ! <br />"
        Response.Write(path)

    End Sub

    '***************************************************************************
    ' interactionCategories
    ' copy in your table 
    ' shows the sime categories list on the left side on side 
    '***************************************************************************
    Sub interactionCategories(ByVal inPageToShow)
        Dim catToShow
        catToShow = Request("PreKatNr")
        If catToShow = "" Then
            catToShow = Session("CURRENT_PRODUCT_CATEGORY")
        Else
            Session("CURRENT_PRODUCT_CATEGORY") = catToShow
        End If
    
        If catToShow = "" Then catToShow = "0"
        Dim path
    
        path = "Categories: " & showCategoryPath(catToShow, inPageToShow) & "<br />"
        'response.write path & " the fuck ! <br />"
        Response.Write(SimpleListCategoriesFromCache(catToShow, inPageToShow))
    End Sub
    'end copy 

    
    ''' <summary>
    ''' DisplayManu
    ''' </summary>
    ''' <param name="inPageToShow"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function DisplayManu(ByVal inPageToShow) As String

        Response.Write("<script language=""JavaScript"" src=""cgi/menu.js""></ script>" & Chr(10) & Chr(13))
        Response.Write("<script language=""JavaScript"">" & Chr(10) & Chr(13))
        Response.Write("function showToolbar () { " & Chr(10) & Chr(13))
        Response.Write("menu= new Menu ();" & Chr(10) & Chr(13))

        Dim sql, rs, rsSub

        ' Loop for initialize menu items
        Dim PreKatNr : PreKatNr = 0
        sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & PreKatNr & " ORDER BY Name "
        rs = ObjConnectionexecute(sql)
        While Not rs.EOF
            If rs("ArtKatNrParent").Value = 0 Then
                Response.Write("menu.addItem (""menu" & _
                rs("ArtKatNr").Value & """, """ & _
                Server.HtmlEncode(rs("Name").Value) & """, """ & _
                Server.HtmlEncode(rs("Name").Value) & """, """ & _
                inPageToShow & "?PreKatNr=" & rs("ArtKatNr").Value & """ , null );")
                '"null , null );"
                Response.Write(Chr(10) & Chr(13))

                sql = "SELECT ArtKatNr, Name, ArtKAtNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & rs("ArtKatNr").Value & " ORDER BY Name "
                rsSub = ObjConnectionexecute(sql)

                While Not rsSub.EOF
                    Response.Write("menu.addSubItem (""menu" & _
                        rs("ArtKatNr").Value & """, """ & _
                        rsSub("Name").Value & """, """ & _
                        rsSub("Name").Value & """, """ & _
                        inPageToShow & "?PreKatNr=" & rsSub("ArtKatNr").Value & """);")
                    
                    rsSub.MoveNext()
                    Response.Write(Chr(10) & Chr(13))
                End While
                rsSub.Close()
                rsSub = Nothing
            End If
            rs.MoveNext()
      
        End While
        
        rs.Close()
        rs = Nothing
        'end loop of initialization
        Response.Write("menu.showMenu ();}" & Chr(10) & Chr(13))
        Response.Write("showToolbar();")
        Response.Write("</ script>" & Chr(10) & Chr(13))
    
    End Function

    '******************************************************************
    ' Function makeCategoriesTree
    ' Description [creates categories tree and shows the count of products in the categories]
    ' Autor: 
    ' Changes: 
    ' ArtKatNr - the first category 
    ' Levels - count of levels to be shown s
    ' manufacturer - by Name like 'IBM'
    '******************************************************************

    Function makeCategoriesTreeFromCache(ByVal ArtKatNr, ByVal Levels, ByVal manufacturer, ByVal merchantName) As String
        Dim temp
        Dim CACHE_NAME As String = "SUB_MAKECATEGORIESTREE_" & ArtKatNr & "_" & Levels & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, makeCategoriesTree(ArtKatNr, Levels, manufacturer, merchantName))
        End If
        makeCategoriesTreeFromCache = temp
    End Function

    ''' <summary>
    ''' makes cat tree by CatId, manufacturerer and merchant 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <param name="Levels"></param>
    ''' <param name="manufacturer"></param>
    ''' <param name="merchantName"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeCategoriesTree(ByVal ArtKatNr, ByVal Levels, ByVal manufacturer, ByVal merchantName) As String
   
        Dim html
        Dim sql, rs, sqlProduktAnzahl, rsProduktAnzahl
        If Levels <= 0 Then Exit Function 'no more levels to show
        Dim MANUFACTURER_FILTER : MANUFACTURER_FILTER = ""
        Dim MERCHANT_FILTER : MERCHANT_FILTER = ""
        Dim herstellerNr, lieferantNr : herstellerNr = "" : lieferantNr = ""
        Dim useHerstellerOderLieferant : useHerstellerOderLieferant = False
   
        If manufacturer <> "" Or merchantName <> "" Then
            useHerstellerOderLieferant = True
            'dim manNr: manNr = tablevalue("lieferantenAdressen","Firma", manufacturer)
            manufacturer = Replace(manufacturer, "'", "")
            manufacturer = Replace(manufacturer, """", "")
            manufacturer = Replace(manufacturer, "%", "")
            manufacturer = Replace(manufacturer, "*", "")
      
            If manufacturer <> "" Then herstellerNr = tablevalue("lieferantenAdressen", "Firma", "'" & manufacturer & "'", "IdNR")
            If merchantName <> "" Then lieferantNr = tablevalue("lieferantenAdressen", "Firma", "'" & merchantName & "'", "IdNR")
       
            'MANUFACTURER_FILTER = " (herstellernr in (select idnr from lieferantenAdressen where " & _ 
            '                      " Firma like '" & manufacturer & "') or herstellernr is null) "


            'MERCHANT_FILTER = " (lieferantnr in (select idnr from lieferantenAdressen where " & _ 
            '                      " Firma like '" & manufacturer & "') or lieferantnr is null) "
                            
            sql = "SELECT [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, 1*Count(grArtikel.ArtNr) AS [Produktanzahl], ArtKatNRParent " & _
        " FROM [grArtikel-Kategorien] LEFT JOIN grArtikel ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _
        " WHERE "
            
            'if manufacturer <> "" then sql = sql & MANUFACTURER_FILTER & " and " 
            'if merchantName <> "" then sql = sql & MERCHANT_FILTER & " and " 
            
            sql = sql & _
             " ArtKatNrParent=" & ArtKatNr & _
             " GROUP BY [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, ArtKatNRParent " & _
             " ORDER BY [grArtikel-Kategorien].ArtKatNRParent"
            'levels = 0     
        Else
   
            sql = "SELECT [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, [grArtikel-Kategorien].ArtKatNrParent, 1*Count(grArtikel.ArtNr) AS [Produktanzahl], ArtKatNRParent " & _
              " FROM [grArtikel-Kategorien] LEFT JOIN grArtikel ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _
              " WHERE ArtKatNrParent=" & ArtKatNr & _
              " GROUP BY [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, [grArtikel-Kategorien].ArtKatNrParent " & _
              " ORDER BY [grArtikel-Kategorien].ArtKatNrParent"
        End If
        '" HAVING Count(grArtikel.ArtNr)>0 " & _     
        'Response.write "<br />" & sql : Response.Flush


        rs = ObjConnectionexecute(sql)
        'set rsProduktAnzahl = ObjConnectionexecute(sqlProduktAnzahl)
        If rs.eOF Then
            makeCategoriesTree = ""
            Exit Function
        End If
        'Response.Write "sql=" & sql
        html = "<ul>"
        While Not rs.EOF
     
     
            'if manufacturer <> "" then 'show previous category 
            '    html = html & TABLEVALUE("[grArtikel-kategorien]","ArtKatNR",rs("ArtKatNRParent"),"Name") & "->" 
            'end if 
     
            Dim LINK_KAT As String = "default.aspx?preKatNr=" & rs("ArtKatNr").Value
            Dim LINK_PRODUCTS As String = "default.aspx?pageToShow=DetailSearchResult&artKatNrSearch=" & rs("ArtKatNr").Value & _
                                                "&HerstellerSearch=" & manufacturer & "&LieferantSearch=" & merchantName

            Dim produktAnzahl As Integer = getCountOfProductsOpt(rs("ArtKatNr").Value, lieferantNr, herstellerNr)


            If useHerstellerOderLieferant And CLng(produktAnzahl) <= 0 Then
            Else
                html = html & "<li>"
            End If
            'Response.Write "ANZAHL=" & cint(rs("Produktanzahl"))
            If CLng(produktAnzahl) > 0 Then
                If useHerstellerOderLieferant Then
                    html = html & Server.HtmlEncode(rs("Name").Value) '& "  <a href=""" & LINK_KAT & """>" &  getTranslation("Alle Produkte in der Kategorie...")  & "</A>" 
                Else
                    html = html & "<a href=""" & LINK_KAT & """><b>" & Server.HtmlEncode(rs("Name").Value) & "</b></A>"
                End If
            Else ' keine produkte
                If useHerstellerOderLieferant Then
                    'html = html & "<a href=""" & LINK_KAT & """>" &  left(rs("Name"),5) & "..."  & "</A>" 
                Else 'die standart produktkarte 
                    html = html & "<a href=""" & LINK_KAT & """>" & Server.HtmlEncode(rs("Name").Value) & "</A>"
                End If
            End If
       
            If CLng(produktAnzahl) > 0 Then html = html & " - " & "<a href='" & LINK_PRODUCTS & "'>" & produktAnzahl & " " & gettranslation("Produkte") & "</a></b>"
            html = html & makeCategoriesTree(rs("ArtKatNr").Value, Levels - 1, manufacturer, merchantName)
     
            If useHerstellerOderLieferant And CLng(produktAnzahl) <= 0 Then
            Else
                html = html & "</li>"
            End If
            rs.moveNext()
        End While
        rs.close()
        html = html & "</ul>"
        makeCategoriesTree = html
    End Function

    '==============================================================================
    'YAHOO Like Subcats 
    '30-09-2004 erweterung mit LAND l=AT etc. 
    '==============================================================================
    Function makeSubcategories(ByVal ArtKatNr, ByVal Levels) As String
        Const MAX_CATS_OF_LEVEL_1 As Integer = 5
        Dim html As String
        Dim sql As String, rs
        makeSubcategories = ""
        If Levels <= 0 Then Exit Function 'no more levels to show
 
        sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & ArtKatNr & _
              " OR ArtKatNr in (Select ArtKatNrChild from [grArtikel-Kategorien-Verwandte] Where ArtKatNrParent = " & ArtKatNr & ") " & _
              " ORDER BY [Order],[Name]"
        ' Response.Write sql    
        rs = ObjConnectionexecute(sql)
        If rs.eOF Then
            makeSubcategories = ""
            Exit Function
        End If
        'Response.Write "sql=" & sql
        If Levels = 2 Then html = "<table  align=""center"" cellspacing=""10"" width=""100%""><tr>"
        Dim i As Integer : i = 0
        While Not rs.EOF
            i = i + 1
            If Levels = 2 Then html = html & "<td valign=top ><B>"
            'html = html & "<a href=""default.aspx?PageToShow=CatBrowse&ArtKatNr=" & rs("ArtKatNr") & """>" &  rs("Name")  & "</A>"
            Dim catLink : catLink = "default.aspx?PreKatNr=" & rs("ArtKatNr").Value
            'read land 
            Dim catLand As String : catLand = tableValue("[grArtikel-Kategorien]", "ArtKatNr", rs("ArtKatNr").Value, "Land")
            If Len(catLand) = 2 Then 'defined 
                catLink = catLink & "&l=" & catLand
            End If
     
            html = html & "<a href=""" & catLink & """>"
            If Levels = 2 Then html = html & "<B>"
            If Levels = 2 Or (Levels = 1 And i <= MAX_CATS_OF_LEVEL_1) Then
                html = html & Server.HtmlEncode(rs("Name").Value)
            Else
                ' html = html & "."
            End If
            If Levels = 2 Then html = html & "</B>"
            html = html & "</A>"
            'anzahl von product is out 
     
            If Levels = 2 Then 'countOfProducts only on step 2
                Dim countOfProducts As Long : countOfProducts = getCountOfProducts(rs("ArtKatNr").Value)
                If CLng(countOfProducts) > 0 Then
                    html = html & " <font color=""#980000"" size=""1"">(" & countOfProducts & ")</font>"
                End If
            End If
            
            If Levels = 2 Then html = html & "</b><br />"
            If Levels = 1 Then
                If i < MAX_CATS_OF_LEVEL_1 Then html = html & ", " Else html = html & " "
            End If
     
            html = html & makeSubcategories(rs("ArtKatNr").Value, Levels - 1)
            If Levels = 2 Then html = html & "</td>"
            If i = 2 And Levels = 2 Then
                html = html & "</tr><tr>"
                i = 0
            End If
     
            rs.moveNext()
        End While
  
        If Levels = 1 And i >= MAX_CATS_OF_LEVEL_1 Then html = html & " ..." ' weitere kateogiren sind vorhanden!
  
        rs.close()
        If Levels = 2 Then html = html & "</tr></table>"
  
        If Right(html, 2) = ", " Then html = Left(html, Len(html) - 2)
        makeSubcategories = html
    End Function


    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function makeSubcategoriesFromCache(ByVal artKatNr, ByVal Levels) As String
        Dim temp
        Dim CACHE_NAME As String = "SUB_CATEGORIES_LIST_" & artKatNr & "_" & Levels & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, makeSubcategories(artKatNr, Levels))
        End If
        makeSubcategoriesFromCache = temp
    End Function



    ''' <summary>
    ''' Caching function 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function findTemplateFromCache(ByVal ArtKatNr) As String
        Dim CACHE_NAME As String = "CATEGORY_TEMPLATE_" & ArtKatNr & "_" & Session("language")
        Dim temp : temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, findTemplate(ArtKatNr))
        End If
        findTemplateFromCache = temp
    End Function

    ''' <summary>
    ''' searches for the first non empty template 
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function findTemplate(ByVal artKatNr) As String

        If artKatNr Is Nothing Then findTemplate = "" : Exit Function
        'check if cat has products 
        Dim sql, rs
        sql = "select count(*) as cnt from grArtikel where artkatnr > 1 and artkatnr=" & artKatNr
        rs = ObjConnectionexecute(sql)
        If Not rs.eof Then
            Dim cnt : cnt = rs("cnt").Value & ""
            '  Response.Write cnt: Response.Flush
            If Not (cnt) Is Nothing And cnt > 0 Then
                findTemplate = findTemplateForProductCategory(artKatNr)
                rs.close()
                Exit Function
            End If
        End If
        rs.close()
        'end check

        If CLng(artKatNr) < 0 Then findTemplate = "" : Exit Function
        'Response.Write "Search"
        Dim catTemplate
        catTemplate = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "Template")
        If (catTemplate) Is Nothing Or Trim(catTemplate) = "" Then 'not defined search parent 
            'Response.Write "Search parent..."
            findTemplate = findTemplate(TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "ArtKatNrParent"))
            Exit Function
        End If
        findTemplate = catTemplate
        
        findTemplate = Replace(findTemplate, "&lt;", "<")
        findTemplate = Replace(findTemplate, "&gt;", ">")
        findTemplate = Replace(findTemplate, "&quot;", """")
        findTemplate = Replace(findTemplate, "&amp;nbsp;", "&nbsp;")
        
    End Function



    ''' <summary>
    ''' findTemplateForProductFromCache
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function findTemplateForProductFromCache(ByVal ArtKatNr)
        Dim CACHE_NAME As String = "CATEGORY_PRODUCT_TEMPLATE_" & ArtKatNr & "_" & Session("language")
        Dim temp : temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, findTemplateForProduct(ArtKatNr))
        End If
        findTemplateForProductFromCache = temp
    End Function

    ''' <summary>
    ''' 
    ''' searches for the first non empty templateForProduct in the category  
    ''' returns the column templateForProduct
    ''' returns "" if nothing defined 
    ''' no error if the column is not defined in the DB 
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function findTemplateForProduct(ByVal artKatNr) As String
        If Not IsNumeric(artKatNr) Then findTemplateForProduct = NOT_DEFINED : Exit Function 'nothing found 
        If artKatNr = "" Or CLng(artKatNr) < 0 Then findTemplateForProduct = NOT_DEFINED : Exit Function 'nothing found 
                
        Dim catTemplate
        catTemplate = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "TemplateForProduct")
        If Trim(catTemplate) & "" = "" Then 'not defined search parent 
            'Response.Write "Search parent..."
            findTemplateForProduct = findTemplateForProduct(TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "ArtKatNrParent"))
            Exit Function
        End If
            
        catTemplate = Replace(catTemplate, "&lt;", "<")
        catTemplate = Replace(catTemplate, "&gt;", ">")
        catTemplate = Replace(catTemplate, "&quot;", """")
        catTemplate = Replace(catTemplate, "&amp;nbsp;", "&nbsp;")
                
        findTemplateForProduct = catTemplate
                
    End Function

    ''' <summary>
    ''' findTemplateForProductCategory
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function findTemplateForProductCategory(ByVal artKatNr)
        findTemplateForProductCategory = findTemplate(TEMPLATE_ARTKATNR)
    End Function

    ''' <summary>
    ''' listWebPagesLinksFromCache
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function listWebPagesLinksFromCache() As String
        Dim Language As String = Session("Language")
        Dim temp
        Dim CACHE_NAME As String = "WEBPAGES_LIST_" & Language
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, listWebPagesLinks())
        End If
        listWebPagesLinksFromCache = temp
    End Function


    'lists the links on  hte left of the shop
    Function listWebPagesLinks() As String
        Dim Language As String = Session("Language")
        Dim rsS
        Dim sqlS As String
        Dim html As String
        
        sqlS = "select PageId, Title, HTML from webPages order by Title"
        rsS = ObjConnectionexecute(sqlS)
        If rsS.eof Then
            html = "keine Webpages definiert!"
        End If
        While Not rsS.EOF
            Dim title As String = rsS("Title").Value
            Dim pageId = rsS("pageID").Value
            title = getTranslationDok("webPages", pageID, "TITLE", title, Language)
            html = html & "<a href=""default.aspx?pageToShow=WebPage&PreKatNr=-999&WebPage=" & rsS("Title").Value & """>" & title & "</a><br />"
            rsS.moveNext()
        End While
        rsS.close()
        rsS = Nothing
        Return html
                  
    End Function





    '******************************************************************************
    ' Function [makeSubcategoriesList]
    ' Description [Creates List of Numbers of all subcategories]
    ' Autor: 
    ' Changes: 
    ' ArtKatNR is number or list of numbers 
    '******************************************************************************
    Function makeSubcategoriesList(ByVal ArtKatNr, ByVal Levels) As String
        Dim temp
        Dim CACHE_NAME : CACHE_NAME = "SUBCATEGORIES_LIST_" & ArtKatNr & "_" & Levels & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, makeSubcategoriesList_NoCache(ArtKatNr, Levels))
        End If
        makeSubcategoriesList = temp
    End Function

    Function makeSubcategoriesList_NoCache(ByVal ArtKatNr, ByVal Levels)
        Dim html
        Dim sql, rs
        Dim catList
        'Dim start: start = now() 
        makeSubcategoriesList_NoCache = ""
        If CStr(ArtKatNr) = "" Then Exit Function
        If Levels <= 0 Then Exit Function 'no more levels to show
 
        sql = " SELECT ArtKatNr FROM [grArtikel-Kategorien] WHERE ArtKatNrParent in(" & ArtKatNr & ")" & _
              " OR ArtKatNr in (Select ArtKatNrChild from [grArtikel-Kategorien-Verwandte] Where ArtKatNrParent in (" & ArtKatNr & ")) " & _
              " ORDER BY [Name]"
        rs = ObjConnectionexecute(sql)
        If rs.eOF Then ' no subs
            makeSubcategoriesList_NoCache = ArtKatNr
            Exit Function
        End If
        catList = ""
        Dim i : i = 0
        While Not rs.EOF
            i = i + 1
            catList = catList & rs("ArtKatNr").Value & ","
            rs.moveNext()
        End While
        rs.close()
        If catList <> "" Then
            catList = catList & makeSubcategoriesList_NoCache(Left(catList, Len(catList) - 1), Levels - 1)
        End If
  
        catList = Replace(catList, ",,", ",")
        If Right(catList, 1) = "," Then catList = Left(catList, Len(catList) - 1) 'remove last ","
        makeSubcategoriesList_NoCache = catList
    End Function

    '******************************************************************
    'returns the count of products in the given and all subcategories 
    '******************************************************************

    Function getCountOfProducts(ByVal ArtKatNR) As Long
        Dim sql As String, rs
        sql = " select count(*) as countProds from grArtikel " & _
           " Where ProduktAktiv <> 0 and ArtKatNr in (" & ArtKatNR & "," & makeSubcategoriesList(ArtKatNR, 5) & ")"
        rs = ObjConnectionexecute(sql)
        If rs.EOf Then
            getCountOfProducts = 0
        Else
            getCountOfProducts = rs("countProds").Value
        End If
        rs = Nothing
    End Function



    Function getCountOfProductsOpt(ByVal optArtKatNR, ByVal optLieferantNr, ByVal optHerstellerNr) As Long
        Dim sql As String, rs
        sql = " select count(*) as countProds from grArtikel  " & _
              " Where ProduktAktiv <> 0 and ProduktAktivOnline <>0 "
        Try
            If optArtKatNR <> "" Then sql = sql & " and ArtKatNr=" & optArtKatNR
        Catch
        End Try
        Try
            If optLieferantNr <> "" Then sql = sql & " and artNr in (select artikelnr from [lieferantenArtikel-Preise] where LieferantNr=" & optLieferantNr & ")"
        Catch
        End Try
        Try
            If optHerstellerNr <> "" Then sql = sql & " and HerstellerNr=" & optHerstellerNr
        Catch
        End Try
        
        ' response.Write sql   
        rs = ObjConnectionexecute(sql)
        If rs.EOf Then
            getCountOfProductsOpt = 0
        Else
            getCountOfProductsOpt = rs("countProds").Value
        End If
        rs = Nothing
    End Function



    '****************************************************************************
    ' statistics for the most clicked products by category 
    '****************************************************************************

    Function statisticTopClicksOnCategoryCache(ByVal ArtKatNr) As String
        Dim temp
        Dim CACHE_NAME As String = "SUB_CAT_TOPCLICKS_" & ArtKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticTopClicksOnCategory(ArtKatNr))
        End If
        statisticTopClicksOnCategoryCache = temp
    End Function

    Function statisticTopClicksOnCategory(ByVal ArtKatNrParam) As String
        'exit function 
        Dim MAX_PRODUCTS As Integer : MAX_PRODUCTS = 10
        Dim sql As String
        Dim html
        'DONE: optimize this SQL statement 
        If Session("dbType") = "MySQL" Then
            sql = " SELECT sum(CountClicks) AS CountCls, [grArtikel-Kategorien].ArtKatNrPArent, [grArtikel-Kategorien].ArtKatNr, [Name] " & _
            " FROM [grArtikel-Kategorien], grArtikel, webProductClicks " & _
            " WHERE " & _
            " [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr and " & _
            " grArtikel.ArtNr = webProductClicks.ArtNr and " & _
            " [grArtikel-Kategorien].ArtKAtNr>1 and " & _
            " [grArtikel-Kategorien].ArtKatNR In (" & ArtKatNrParam & "," & makeSubcategoriesList(ArtKatNrParam, 5) & ") " & _
            " GROUP BY [grArtikel-Kategorien].ArtKatNr, [Name], ArtKatNrPArent " & _
            " ORDER BY CountCls DESC"
        Else
            sql = " SELECT sum(CountClicks) AS CountCls, [grArtikel-Kategorien].ArtKatNrParent, [grArtikel-Kategorien].ArtKatNr, [Name] " & _
            " FROM [grArtikel-Kategorien], grArtikel, webProductClicks " & _
            " WHERE " & _
            " [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr and " & _
            " grArtikel.ArtNr = webProductClicks.ArtNr and " & _
            " [grArtikel-Kategorien].ArtKAtNr>1 and " & _
            " [grArtikel-Kategorien].ArtKatNR In (" & ArtKatNrParam & "," & makeSubcategoriesList(ArtKatNrParam, 5) & ") " & _
            " GROUP BY [grArtikel-Kategorien].ArtKatNr, [Name], ArtKatNrPArent " & _
            " ORDER BY sum(CountClicks) DESC"
        End If
        
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0
        If Not rs.eOF Then
            html = html & "<table border=0>"
            'html = html & "<tr><th><p align=""center""><b>Top " & MAX_PRODUCTS & " Kategorien</b></th></tr>"
            Dim alreadyProcessedCats : alreadyProcessedCats = ""
            While Not rs.EOF And i < MAX_PRODUCTS
                Dim artKatNr : artKatNr = rs("ArtKAtNR").Value 'TABLEVALUE("grArtikel","ArtNR",rs("ArtNR"),"ArtKatNr")
                If InStr(alreadyProcessedCats, artKatNr) <= 0 Then
                    html = html & "<tr><td><a href=""default.aspx?PreKAtNr=" & artKatNr & """>" & _
                           Server.HtmlEncode(TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNR", rs("ArtKatNrParent").Value, "Name")) & "&gt;" & " " & _
                           Server.HtmlEncode(rs("Name").Value) & "</a></td></tr>"
                    i = i + 1
                    alreadyProcessedCats = alreadyProcessedCats & "," & artKatNr
                End If
                rs.movenext()
            End While
            html = html & "</table>"
        End If
        rs.close()
        statisticTopClicksOnCategory = html
    End Function





    '******************************************************************************
    ' Function [makeSubcategoriesPicturePages]
    ' Description [Creates picture overview of all categories]
    ' Autor: Grigor TONKOV 
    ' Changes: 
    ' ArtKatNR is number or list of numbers 
    '******************************************************************************
    Function makeSubcategoriesPicturePages(ByVal ArtKatNr, ByVal Levels)
        Dim temp
        Dim CACHE_NAME As String = "SUBCATEGORIES_PICTURE_" & ArtKatNr & "_" & Levels & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, makeSubcategoriesPicturePages_NoCache(ArtKatNr, Levels))
        End If
        makeSubcategoriesPicturePages = temp
    End Function

    Function makeSubcategoriesPicturePages_NoCache(ByVal ArtKatNr, ByVal Levels) As String
        Dim tamplate_html
        tamplate_html = "<table border=0 width='100%'>" & _
             "<tr><td>[1]</td><td>[2]</td><td>[3]</td><td>[4]</td></tr>" & _
             "<tr><td>[5]</td><td>[6]</td><td>[7]</td><td>[8]</td></tr>" & _
             "<tr><td>[9]</td><td>[10]</td><td>[11]</td><td>[12]</td></tr>" & _
             "<tr><td>[13]</td><td>[14]</td><td>[15]</td><td>[16]</td></tr>" & _
             "<tr><td>[17]</td><td>[18]</td><td>[19]</td><td>[20]</td></tr>" & _
             "<tr><td>[21]</td><td>[22]</td><td>[23]</td><td>[24]</td></tr>" & _
             "<tr><td>[25]</td><td>[26]</td><td>[27]</td><td>[28]</td></tr>" & _
             "<tr><td>[29]</td><td>[30]</td><td>[31]</td><td>[32]</td></tr>" & _
             "<tr><td>[33]</td><td>[34]</td><td>[35]</td><td>[36]</td></tr>" & _
             "<tr><td>[37]</td><td>[38]</td><td>[39]</td><td>[40]</td></tr>" & _
           "</table>"

        Dim html
        Dim sql, rs
        Dim catList
        makeSubcategoriesPicturePages_NoCache = ""
        If CStr(ArtKatNr) = "" Then Exit Function
 
 
        sql = " SELECT ArtKatNr, Name, Picture FROM [grArtikel-Kategorien] WHERE ArtKatNrParent in(" & ArtKatNr & ")" & _
              " OR ArtKatNr in (Select ArtKatNrChild from [grArtikel-Kategorien-Verwandte] Where ArtKatNrParent in (" & ArtKatNr & ")) " & _
              " ORDER BY [Name]"
        rs = ObjConnectionexecute(sql)

        catList = ""
        Dim i : i = 0
        While Not rs.EOF
            i = i + 1
            catList = "<a href='default.aspx?preKatNr=" & rs("ArtKatNr").Value & "'>" & "<img border=0 src='" & rs("Picture") & "' alt='" & rs("ArtKatNr").Value & "'></a>"
            tamplate_html = Replace(tamplate_html, "[" & i & "]", catList)
            rs.moveNext()
        End While
        rs.close()

        'replace not used places 
        For i = 1 To 40
            tamplate_html = Replace(tamplate_html, "[" & i & "]", "&nbsp;")
        Next
 
        makeSubcategoriesPicturePages_NoCache = tamplate_html
    End Function

    'rebuild index for cat searching 
    Function rebuildCats()
        Dim sql_ As String, rs_
        sql_ = "select * from [grArtikel-Kategorien] order by artKAtNR"
        rs_ = objConnectionExecute(sql_)
        Dim subCats
        While Not rs_.eof
            subCats = makeSubcategoriesList(rs_("ArtKatNr").Value, 10)
            sql_ = "insert into webCatsIndex (ArtKatNrPArent, ArtKatNr) select " & rs_("ArtKatNr").Value & ", ArtKatNr from [grArtikel-Kategorien] where ArtKatNr in (" & subCats & ")"
            Response.Write(sql_ & "<br />") : Response.Flush()
            objConnectionExecute(sql_)
            
            rs_.moveNext()
        End While
        rs_.close()
    End Function
    
</script>

