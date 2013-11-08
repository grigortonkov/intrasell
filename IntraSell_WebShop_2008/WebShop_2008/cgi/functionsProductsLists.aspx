<script language="VB" runat="server">  
    
    ''' <summary>
    ''' CLEARANCE_LAGER_BEZEICHNUNG
    ''' </summary>
    ''' <remarks></remarks>
    Const CLEARANCE_LAGER_BEZEICHNUNG = "CLEAR CENTER"
    
    ''' <summary>
    ''' CLEARANCE_LAGER_NR
    ''' </summary>
    ''' <remarks></remarks>
    Const CLEARANCE_LAGER_NR As Integer = 4
    ''' <summary>
    ''' DEFAULT_LAGER_NR
    ''' </summary>
    ''' <remarks></remarks>
    Const DEFAULT_LAGER_NR As Integer = 1
    
    ''' <summary>
    ''' MARGIN_PERCENT_PRICE_DROPS
    ''' </summary>
    ''' <remarks></remarks>
    Const MARGIN_PERCENT_PRICE_DROPS As Integer = 5
    
    ''' <summary>
    ''' TOP_MARGIN_PERCENT_PRICE_DROPS
    ''' </summary>
    ''' <remarks></remarks>
    Const TOP_MARGIN_PERCENT_PRICE_DROPS As Integer = 25
    
    
    Const SESSION_NAME_VISITED_PRODUCT = "VISITED_PRODUCT_"
    
    
    Const COUNT_VISITED_PRODUCTS As Integer = 5
    
    
    '****************************************************************************
    ' Show the top products from some category
    '****************************************************************************

    Function TopCatProductsFromCache(ByVal artKatNr, ByVal Typ)
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPCATPRODUCTS_" & artKatNr & Typ & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, TopCatProducts(artKatNr, Typ))
        End If
        TopCatProductsFromCache = temp
    End Function

    Function TopCatProducts(ByVal artKatNr, ByVal Typ)
        'default in ofVars if not set
        If Not IsNumeric("" & VARVALUE("SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW")) Then 'this var is not set
            Call SETVARVALUE("SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW", "3")
        End If
    
        Dim PRODUCTS_IN_ROW : PRODUCTS_IN_ROW = CInt(VARVALUE("SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW"))

        'Const PRODUCTS_IN_ROW = 1
        Dim Sql, html
        Sql = " SELECT ProductID,1 from webCatTopProducts, grArtikel WHERE " & _
             " productId=artnr and produktAktiv<>0 and CatID=" & artKatNr & " and [Type] like '" & Typ & "'" & _
             " UNION " & _
             " SELECT ProductID,1 from webCatTopProducts, grArtikel WHERE " & _
             " productId=artnr and produktAktiv<>0 and " & makeArtKatNrInPart("CatID", artKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
             " and [Type] like '" & Typ & "'" & _
             " UNION " & _
             " SELECT ProductID,1 from webCatTopProducts, grArtikel WHERE " & _
             " productId=artnr and produktAktiv<>0 and " & makeArtKatNrInPartParentCats("CatID", artKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
             " and [Type] like '" & Typ & "'" & _
             " ORDER BY 2"
        
        Dim rsArtikel, rsTop, inRow
        Dim artNr
        rsTop = ObjConnectionexecute(Sql)
        If rsTop.BOF And rsTop.EOF Then
        Else
            inRow = 0
    
            html = "<table width=100% align=center>"
    
            While Not rsTop.EOF
                If inRow = 0 Then html = html & "<tr>"
        
                html = html & "<td>"
                html = html & makeProductPageSmallWithTemplate(rsTop("ProductID").Value, "default.aspx", "skins/skin" & SkinNumber & "/pages/productPageSmall_" & Typ & ".htm", 100)
                html = html & "</td>"
    
                inRow = inRow + 1
                If inRow >= PRODUCTS_IN_ROW Then '======================================== 1 => 2 in ROW
                    inRow = 0
                    html = html & "</tr>"
                End If
                rsTop.moveNext()
            End While
 
            html = html & "</table>"
        End If
        rsTop.close()
        TopCatProducts = html
    End Function

    '****************************************************************************
    ' Show the top products from some category
    '****************************************************************************
    Function TopCatProductsTwoInRow(ByVal artKatNr)

        Const MAXPRODUCTSTOSHOW = 8
        Dim html As String, sql As String
        sql = makeSQLTopClick(artKatNr)

        Dim rsTop
        Dim inRow As Integer
        rsTop = ObjConnectionexecute(sql)
        'if rsTop.EOF then 'get products from clicks 
        '  set rsTop = ObjConnectionexecute(makeSQLTopClick(artKatNr))
        'end if 
                
        If rsTop.EOF Then
            html = "keine Produkte angeklickt"
        Else
            inRow = 0
            html = html & "<table align=center cellspacing=""10"">"
            Dim i : i = 0
            Dim alreadyShownProducts
        
            While (Not rsTop.EOF) And i < MAXPRODUCTSTOSHOW
                i = i + 1
                If InStr(alreadyShownProducts, rsTop("ArtNr").Value) < 1 Then 'not shown  
                    alreadyShownProducts = alreadyShownProducts & "," & rsTop("ArtNr").Value
                 
                    If inRow = 0 Then html = html & "<tr>"
                    
                    inRow = inRow + 1
                    html = html & "<td>"
                    html = html & makeProductPageSmall(rsTop("ArtNr").Value, "default.aspx")
                    html = html & "</td>"
                
                 
                    If inRow > 1 Then '======================================== 1 => 2 in ROW
                        inRow = 0
                        html = html & "</tr>"
                    End If
                    rsTop.moveNext()
                Else
                    rsTop.moveNext()
                End If 'already shown 
            End While
            html = html & "</table>"
        End If
        rsTop.close()
        TopCatProductsTwoInRow = html
    End Function
 
 
    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function TopCatProductsTwoInRowFromCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPCLICKS_TWOINROW_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, TopCatProductsTwoInRow(artKatNr))
        End If
        TopCatProductsTwoInRowFromCache = temp
    End Function


    '****************************************************************************
    ' Show the top products from some category
    '****************************************************************************
    Function TopCatProductsVertical(ByVal artKatNr)

        Const MAXPRODUCTSTOSHOW As Integer = 4
        Dim html As String, sql As String
        sql = makeSQLTopClick(artKatNr)

        Dim rsTop
        Dim inRow As Integer
        rsTop = ObjConnectionexecute(sql)
        'if rsTop.EOF then 'get products from clicks 
        '  set rsTop = ObjConnectionexecute(makeSQLTopClick(artKatNr))
        'end if 
                
        If rsTop.EOF Then
            html = getTranslation("keine Produkte ausgewählt (v)")
        Else
            inRow = 0
            html = html & "<table align=center cellspacing=""10"">"
            Dim i : i = 0
            Dim alreadyShownProducts
        
            While (Not rsTop.EOF) And i < MAXPRODUCTSTOSHOW
                i = i + 1
                If InStr(alreadyShownProducts, rsTop("ArtNr").Value) < 1 Then 'not shown  
                    alreadyShownProducts = alreadyShownProducts & "," & rsTop("ArtNr").Value
                 
                    If inRow = 0 Then html = html & "<tr>"
                    
                    inRow = inRow + 1
                    html = html & "<td>"
                    html = html & makeProductPageSmall(rsTop("ArtNr").Value, "default.aspx")
                    html = html & "</td>"
                
                 
                    If inRow >= 1 Then '======================================== 1 => 2 in ROW
                        inRow = 0
                        html = html & "</tr>"
                    End If
                    rsTop.moveNext()
                Else
                    rsTop.moveNext()
                End If 'already shown 
            End While
            html = html & "</table>"
        End If
        rsTop.close()
        TopCatProductsVertical = html
    End Function
 
 
    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function TopCatProductsVerticalFromCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPCLICKS_VERTICAL_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, TopCatProductsVertical(artKatNr))
        End If
        TopCatProductsVerticalFromCache = temp
    End Function


    '****************************************************************************
    ' statistics for the most clicked products
    '****************************************************************************
    Function statisticTopClicks()
        statisticTopClicks = TopCatProductsTwoInRow(0)
        'exit function 
        'not used now 
        Dim MAX_PRODUCTS As Integer : MAX_PRODUCTS = 10
        Dim sql As String, html As String

        If Session("dbType") = "MySQL" Then
            sql = " SELECT ArtNr, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
             " FROM webWarenkorb " & _
             " WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 ) " & _
             " GROUP BY ArtNr " & _
             " ORDER BY AnzahlArtNr DESC"
        Else
            sql = " SELECT ArtNr, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
             " FROM webWarenkorb " & _
             " WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 ) " & _
             " GROUP BY ArtNr " & _
             " ORDER BY Count(webWarenkorb.ArtNr) DESC"
        End If
      
      
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0

        While Not rs.EOF And i < MAX_PRODUCTS
            html = html & makeProductPageSmall(rs("ArtNR").Value, "TopClicks")
            rs.movenext()
            i = i + 1
        End While
        rs.close()
        statisticTopClicks = html
    End Function

    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function statisticTopClicksFromCache()
        Dim categoryId As Integer = 0
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPCLICKS_" & categoryId & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticTopClicks(categoryId))
        End If
        statisticTopClicksFromCache = temp
    End Function




    '****************************************************************************
    ' statistics for the best sellers 
    '****************************************************************************
    Function statisticBestsellers(ByVal ArtKatNr)
        Dim MAX_PRODUCTS : MAX_PRODUCTS = 3
        Const DAYS_TO_LOOK_BACK = 7

        Dim sql, html
        If Session("dbType") = "MySQL" Then
            sql = " SELECT ArtNr, Count(ArtNr) AS [Anzahl] " & _
               " FROM [buchAuftrag-Artikel] " & _
               " WHERE ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 AND " & makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & " ) " & _
               " and rechNr in (SELECT Nummer from buchAuftrag where Datum >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK) & ")" & _
               " GROUP BY ArtNr " & _
               " ORDER BY [Anzahl] DESC"
        Else
            sql = " SELECT ArtNr, Count(ArtNr) AS [Anzahl] " & _
               " FROM [buchAuftrag-Artikel] " & _
               " WHERE ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 AND " & makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & " ) " & _
               " and rechNr in (SELECT Nummer from buchAuftrag where Datum >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK) & ")" & _
               " GROUP BY ArtNr " & _
               " ORDER BY Count(ArtNr) DESC"
        End If
      
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0

        While Not rs.EOF And i < MAX_PRODUCTS
            html = html & makeProductPageSmallWithTemplate(rs("ArtNr").Value, "default.aspx", "skins/skin" & SkinNumber & "/pages/productPageSmall_Bestseller.htm", 100)
            rs.movenext()
            i = i + 1
        End While
    
        rs.close()
        statisticBestsellers = html
    End Function

    '****************************************************************************
    ' statistics for the best sellers  from caches
    '****************************************************************************
    Function statisticBestsellersFromCache(ByVal ArtKatNr)
        Dim categoryId As Integer = 0
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPSALES_" & categoryId & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticBestsellers(ArtKatNr))
        End If
        statisticBestsellersFromCache = temp
    End Function


    '****************************************************************************
    ' sql for the most clicked products by category 
    '****************************************************************************
    Function makeSQLTopClick(ByVal ArtKatNr)

        Dim sql
        If Session("dbType") = "MySQL" Then
            sql = " SELECT ArtNr, ArtNr as productId, sum(countClicks) AS AnzahlArtNr " & _
             " FROM webProductClicks " & _
             " WHERE " & _
             " FIRSTCLICK >= " & SQLDATE(-1 * DAYS_TO_LOOK_BACK_CLICKS) & " and " & _
             "webProductClicks.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _
             makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & ")" & _
             " GROUP BY webProductClicks.ArtNr " & _
             " HAVING AnzahlArtNr > 2 " & _
             " ORDER BY AnzahlArtNr DESC"
        Else
            sql = " SELECT ArtNr, ArtNr as productId, sum(countClicks) AS AnzahlArtNr " & _
             " FROM webProductClicks " & _
             " WHERE " & _
             " FIRSTCLICK >= " & SQLDATE(-1 * DAYS_TO_LOOK_BACK_CLICKS) & " and " & _
             "webProductClicks.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _
             makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & ")" & _
             " GROUP BY webProductClicks.ArtNr " & _
             " HAVING sum(countClicks) > 2 " & _
             " ORDER BY sum(countClicks) DESC"
        End If
  
        'Response.Write "<br />" & sql: Response.flush
        makeSQLTopClick = sql
    End Function

    Function makeSQLTopBuys(ByVal ArtKatNr)
        Dim sql
        If Session("dbType") = "MySQL" Then
            sql = " SELECT webWarenkorb.ArtNr, webWarenkorb.ArtNr as productId, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
               " FROM webWarenkorb " & _
               " WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _
                 makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
               " GROUP BY webWarenkorb.ArtNr " & _
               " HAVING AnzahlArtNr> 10 " & _
               " ORDER BY AnzahlArtNr DESC"
        Else
            sql = " SELECT webWarenkorb.ArtNr, webWarenkorb.ArtNr as productId, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
               " FROM webWarenkorb " & _
               " WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _
                 makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
               " GROUP BY webWarenkorb.ArtNr " & _
               " HAVING Count(webWarenkorb.ArtNr)> 10 " & _
               " ORDER BY Count(webWarenkorb.ArtNr) DESC"
        End If
        makeSQLTopBuys = sql
    End Function


    '****************************************************************************
    ' statistics for the most clicked products by category 
    '****************************************************************************

    Function statisticTopClicksList(ByVal ArtKatNr)
        Dim MAX_PRODUCTS As Integer : MAX_PRODUCTS = 10
        Dim sql As String = makeSQLTopClick(ArtKatNr)
        Dim html As String
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0
        
        html = html & "<table border=0>"
        While Not rs.EOF And i < MAX_PRODUCTS
            'html = html &  makeProductPageSmall(rs("ArtNR"), "TopClicks")
            html = html & makeProductLine(rs("ArtNR").Value, False)
            rs.movenext()
            i = i + 1
        End While
        html = html & "</table>"
        rs.close()
        statisticTopClicksList = html
    End Function


    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function statisticTopClicksListFromCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPPRODUCTCLICKSLIST_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticTopClicksList(artKatNr))
        End If
        statisticTopClicksListFromCache = temp
    End Function



    '****************************************************************************
    ' statistics for the most clicked products by category 
    '****************************************************************************

    Function statisticLatestPrices(ByVal ArtKatNr)
        Exit Function
        Const MAX_PRODUCTS = 10
        Const MAX_CHARS = 25
        Dim sql
        Dim html

        If Session("dbType") = "MySQL" Then
            sql = "SELECT grArtikel.ArtKatNr, grArtikel.ArtNr, Max(PreisDatum) as mPD, grArtikel.Bezeichnung " & _
            " FROM [lieferantenArtikel-Preise],grArtikel " & _
            " WHERE ArtikelNr = ArtNr and ProduktAktiv<>0 AND " & _
            makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
            " GROUP BY grArtikel.ArtKatNr, grArtikel.ArtNr, grArtikel.Bezeichnung " & _
            " ORDER BY mPD DESC"
        Else
            sql = "SELECT grArtikel.ArtKatNr, grArtikel.ArtNr, Max(PreisDatum), grArtikel.Bezeichnung " & _
            " FROM [lieferantenArtikel-Preise],grArtikel " & _
            " WHERE ArtikelNr = ArtNr and ProduktAktiv<>0 AND " & _
            makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
            " GROUP BY grArtikel.ArtKatNr, grArtikel.ArtNr, grArtikel.Bezeichnung " & _
            " ORDER BY Max(PreisDatum) DESC"
        End If
        
        'Response.Write sql      :Response.Flush
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0
        Dim Bezeichnung As String
        html = html & "<table border=0>"
        While Not rs.EOF And i < MAX_PRODUCTS
            'html = html &  makeProductPageSmall(rs("ArtNR"),.Value "TopClicks")
            'html = html & makeProductLine(rs("ArtNR").Value, true)
            Bezeichnung = Server.HtmlEncode(rs("Bezeichnung").Value)
            If Len(Bezeichnung) > MAX_CHARS Then Bezeichnung = Left(Bezeichnung, MAX_CHARS) & ".."
            html = html & "<tr><td><a href=""default.aspx?ArtNr=" & rs("ArtNr").Value & """>" & Bezeichnung & "</a></td></tr>"
            rs.movenext()
            i = i + 1
        End While
        html = html & "</table>"
        rs.close()
        statisticLatestPrices = html
    End Function


    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function statisticLatestPricesCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_LATESTPRICES_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticLatestPrices(artKatNr))
        End If
        statisticLatestPricesCache = temp
    End Function



    ''' <summary>
    '''  statistics for the most clicked products by category 
    '''  Usage: enter in table webCatTopProducts an entry from type 'TopProduct'
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeTopDeal(ByVal artKatNr)
        Dim rs
        Dim sql As String
        Const TOP_TYPE = "TopProduct"
        sql = " SELECT ProductID, 1 from webCatTopProducts WHERE type like '" & TOP_TYPE & "' and CatID=" & artKatNr & _
             " UNION" & _
             " SELECT ProductID, 2 from webCatTopProducts WHERE type like '" & TOP_TYPE & "' and " & makeArtKatNrInPart("CatID", artKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
             " UNION" & _
             " SELECT ProductID, 3 from webCatTopProducts WHERE type like '" & TOP_TYPE & "' and " & makeArtKatNrInPartParentCats("CatID", artKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
             " ORDER BY 2 "
        'Response.Write sql
        rs = ObjConnectionexecute(sql)

        If rs.EOF Then '
            sql = makeSQLTopClick(artKatNr)
            rs = ObjConnectionexecute(sql)
        End If

        If rs.EOF Then
            makeTopDeal = getTranslation("Kein Top Deal für Heute!") & "!"
        Else
            Dim artNr : artNr = rs("ProductID").Value
            rs.close()
            makeTopDeal = makeProductPageSmallWithTemplate(artNr, "default.aspx", "skins/skin" & SkinNumber & "/pages/productPageSmall_TopDeal.htm", 100)
            Exit Function
        End If
        rs.close()
    End Function

    ''' <summary>
    ''' statistics for the most clicked products from caches
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeTopDealFromCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_TOPDEAL_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, makeTopDeal(artKatNr))
        End If
        makeTopDealFromCache = temp
    End Function


    ''' <summary>
    ''' statistics for the most clicked products by category 
    ''' </summary>
    ''' <param name="ArtKAtNR"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeSQLPriceDrops(ByVal ArtKAtNR)
        Dim sqlOnEKPreis
        Const DAYS_TO_LOOK_BACK = 5
 
        'based on EK and LEK Preis 
        sqlOnEKPreis = " SELECT grArtikel.ArtNr, Bezeichnung, [LEKPreis]-[EKPreis] AS difference, MWST " & _
        " FROM grArtikel " & _
        " WHERE " & _
        " [EKpreis]>0 and [LEKPreis]>=[EKpreis] and ([LEKPreis]-[EKPreis])*100/[EKpreis]>" & MARGIN_PERCENT_PRICE_DROPS & " and " & _
        " produktAktiv<>0 and " & _
          makeArtKatNrInPart("ArtKatNr", ArtKAtNR, SUBCATEGORIES_TO_SEARCH_INTO) & _
        " ORDER BY [LEKPreis]-[EKPreis] DESC"
  
        'based on Price Archives     
        sqlOnEKPreis = "SELECT a.ArtNr, a.Bezeichnung, Min(arch.VKPreis) - Min(lp.VKPreis) AS difference, a.MWST" & _
        " FROM grArtikel a, [lieferantenArtikel-Preise] lp, priceCompareLieferantenArtikelPreiseArchive arch  " & _
        " WHERE a.ArtNr = lp.ArtikelNr " & _
        " AND a.ArtNr = arch.ArtikelNr " & _
        " AND lp.VKPreis > 0 AND arch.VKPreis > 0 " & _
        " AND lp.VKPreis < arch.VKPreis " & _
        " AND (arch.VKPreis-lp.VKPreis)*100/lp.VKPreis<=" & TOP_MARGIN_PERCENT_PRICE_DROPS & _
        " AND (arch.VKPreis-lp.VKPreis)*100/lp.VKPreis>" & MARGIN_PERCENT_PRICE_DROPS & _
        " AND arch.PreisDatum >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK) & _
        " AND arch.PreisDatum <= " & SQLNOW(0) & _
        " AND a.produktAktiv<>0 and " & _
          makeArtKatNrInPart("ArtKatNr", ArtKAtNR, SUBCATEGORIES_TO_SEARCH_INTO) & _
        " GROUP BY a.ArtNr, a.Bezeichnung, a.MWST "
     
        If Session("dbType") = "MySQL" Then
            sqlOnEKPreis = sqlOnEKPreis & " ORDER BY difference DESC"
        Else
            sqlOnEKPreis = sqlOnEKPreis & " ORDER BY Min(arch.VKPreis) - Min(lp.VKPreis) DESC"
        End If
     
        'response.write "<font color=red>" & sqlOnEKPreis : response.flush        
        makeSQLPriceDrops = sqlOnEKPreis
    End Function

    ''' <summary>
    ''' statisticPriceDrops
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticPriceDrops(ByVal ArtKatNr)
        Dim MAX_PRODUCTS : MAX_PRODUCTS = 10
        Dim sql As String
        Dim html As String
        sql = makeSQLPriceDrops(ArtKatNr)
        'Response.Write sql      
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0
        Dim bruttoPreis As Double
        html = html & "<table border=0>"
        While Not rs.EOF And i < MAX_PRODUCTS
            'html = html & makeProductLine(rs("ArtNR").Value, true)
            'html = html & "<tr><td>" & rs("Bezeichnung").Value & "</td><td>" & rs("difference") & "</td><td></td></tr>"
            bruttoPreis = FormatNumber(getPreis(getLOGIN(), rs("ArtNr").Value, 1), 2) 'makeBruttoPreis(getPreis(getSID(),ArtNr), rs("MWST"),session("Land"))
            bruttoPreis = FormatNumber(makeBruttoPreis(bruttoPreis, rs("MWST").Value, Session("Land")), 2)
            html = html & "<tr><td><a href=""default.aspx?ArtNr=" & rs("ArtNr").Value & """>" & Server.HtmlEncode(rs("Bezeichnung").Value) & "</a></td>"
            html = html & "<td align=""right""> " & FormatNumber(bruttoPreis, 2) & "</td>"
            html = html & "<td align=""right""> " & FormatNumber(rs("difference").Value, 2) & "</td>"
            html = html & "<td align=""right""> " & FormatNumber(100 * rs("difference").Value / bruttoPreis, 2) & "%</td>"
            html = html & "</tr>"
            rs.movenext()
            i = i + 1
        End While
        html = html & "</table>"
    
        If Not rs.eof Then 'more products 
            html = html & "<center><a href='default.aspx?pagetoShow=PriceDowns'> " & getTranslation("weiter") & "... </a></center>"
        End If
    
        rs.close()
        statisticPriceDrops = html
    End Function


    ''' <summary>
    ''' statistics for the most clicked products from caches
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticPriceDropsFromCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_PRICEDROPS_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticPriceDrops(artKatNr))
        End If
        statisticPriceDropsFromCache = temp
    End Function


    ''' <summary>
    ''' statisticPriceDropsAll
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticPriceDropsAll(ByVal ArtKatNr)
        Const DAYS_TO_LOOK_BACK = 2
        Dim sqlPD
        sqlPD = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _
            " FROM grArtikel, lieferantenAdressen  " & _
            " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
            " AND ProduktAktiv<>0 and ArtNr>=1000 AND " & _
            " [EKpreis]>0 and [LEKPreis]>=[EKpreis] and ([LEKPreis]-[EKPreis])*100/[EKpreis]>" & MARGIN_PERCENT_PRICE_DROPS & " and " & _
                      makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO)
                 
                 
        sqlPD = "SELECT a.ArtNr, a.Bezeichnung, la.Firma, Min(arch.VKPreis) - Min(lp.VKPreis) AS difference, a.MWST, " & _
                " a.Bezeichnung, a.EAN, a.Picture, a.Bezeichnung1, a.PreisATS, a.MWST, a.Beschreibung " & _
          " FROM grArtikel a, lieferantenAdressen la, [lieferantenArtikel-Preise] lp, priceCompareLieferantenArtikelPreiseArchive arch  " & _
          " WHERE a.HerstellerNr = la.Idnr and a.ArtNr = lp.ArtikelNr " & _
          " AND a.ArtNr = arch.ArtikelNr " & _
          " AND lp.VKPreis > 0 AND arch.VKPreis > 0 " & _
          " AND lp.VKPreis < arch.VKPreis " & _
          " AND (arch.VKPreis-lp.VKPreis)*100/lp.VKPreis<=" & TOP_MARGIN_PERCENT_PRICE_DROPS & _
          " AND (arch.VKPreis-lp.VKPreis)*100/lp.VKPreis>" & MARGIN_PERCENT_PRICE_DROPS & _
          " AND arch.PReisDatum >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK) & _
          " AND arch.PReisDatum <= " & SQLNOW(0) & _
          " AND a.produktAktiv<>0 and " & _
            makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
          " GROUP BY a.ArtNr, a.Bezeichnung, a.MWST, a.Bezeichnung, a.EAN, a.Picture, a.Bezeichnung1, a.PreisATS, a.MWST, a.Beschreibung, la.Firma "
     
     

        'Response.Write sqlPD
        'sqlPD = makeSQLPriceDrops(ArtKatNr)
        'statisticPriceDropsAll =  sqlPD ': Response.Flush
        statisticPriceDropsAll = makeProductListOnQuery(sqlPD, "", "", getTranslation("Verbilligte Produkte"))
    End Function


    ''' <summary>
    ''' statistics for the most clicked products by category 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticClearanceCenter(ByVal ArtKatNr)
        
        Dim MAX_PRODUCTS As Integer : MAX_PRODUCTS = 10
        Dim sql As String
        Dim html As String

        sql = "select ArtNr from grArtikel where ArtNR in " & _
               " (select ArtNr from  [grArtikel-Lagerbestand] where lagerBestand>0 and " & _
               " reserviertStk<lagerBestand and LagerOrt =  '" & DEFAULT_LAGER_NR & "')" & _
               " and ArtNR in (select ArtNr from  [grArtikel-Lagerbestand] where LagerOrt =  '" & CLEARANCE_LAGER_NR & "')" & _
               " ORDER BY PreisATS Desc"
        'Response.Write sql      
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0
        
        html = html & "<table border=0>"
        While Not rs.EOF And i < MAX_PRODUCTS
            html = html & makeProductLine(rs("ArtNR").Value, True)
            rs.movenext()
            i = i + 1
        End While
        html = html & "</table>"
    
        html = html & "<center><a href='default.aspx?pagetoShow=ClearanceCenter'> " & getTranslation("weiter") & "... </a></center>"
        rs.close()
        statisticClearanceCenter = html
    End Function


    ''' <summary>
    ''' statistics for the most clicked products from caches
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticClearanceCenterFromCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_CLEARANCE_CENTER_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticTopClicksList(artKatNr))
        End If
        statisticClearanceCenterFromCache = temp
    End Function



    ''' <summary>
    ''' statistics for the most clicked products by category 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticClearanceCenterAll(ByVal ArtKatNr)
        Dim sql
        Dim html
        sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _
            " FROM grArtikel, lieferantenAdressen  " & _
            " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
            " AND ProduktAktiv<>0 and ArtNr>=1000 AND " & _
            " grArtikel.ArtNR in (select ArtNr from  [grArtikel-Lagerbestand] where LagerOrt =  '" & CLEARANCE_LAGER_NR & "')" & _
            " and grArtikel.ArtNR in " & _
                        " (select ArtNr from  [grArtikel-Lagerbestand] where lagerBestand>0 " & _
                        " and reserviertStk<lagerBestand and LagerOrt =  '" & DEFAULT_LAGER_NR & "')"
        statisticClearanceCenterAll = makeProductListOnQuery(sql, "", "", "Produkte im ClearCenter")
    End Function


    ''' <summary>
    '''  statistics for the most clicked products by category 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticProductsManufacturerDiscount(ByVal ArtKatNr)
        Dim sql
        Dim html
        sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _
            " FROM grArtikel, lieferantenAdressen  " & _
            " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
            " AND ProduktAktiv<>0 and ArtNr>=1000  " & _
            " and grArtikel.herstellerRabatt > 0"


        statisticProductsManufacturerDiscount = makeProductListOnQuery(sql, "", "", "Produkte mit Hersteller Rabatt")
    End Function



    ''' <summary>
    '''  makeTOPTEN - liste mit top ten produkte 
    ''' </summary>
    ''' <remarks></remarks>
    Sub makeTOPTEN()
        Dim Sql As String
        Dim rsArtikel
        Dim html As String : html = ""
        'PreKatNr = ""
        'ArtNr = ""
        'SESSION("CURRENT_PRODUCT_CATEGORY") = ""
        Sql = " SELECT grArtikel.ArtNr, grArtikel.Bezeichnung, grArtikel.PreisATS, grArtikel.MWST, Firma " & _
          " FROM webTopTen INNER JOIN (grArtikel INNER JOIN lieferantenAdressen ON " & _
          " grArtikel.herstellerNR = lieferantenAdressen.IDNR) ON webTopTen.productID = grArtikel.ArtNr " & _
          " ORDER BY grArtikel.ArtKatNr; "
        rsArtikel = ObjConnectionexecute(Sql)
        
        
        html = html & "<h3 align=center><img border='0' src='" & imageFullName("pricehits.gif") & "'></h3>"
        html = html & "<div align='center'>"
        html = html & "<center>"
        html = html & "<table width='600' style='border-collapse: collapse' bordercolor='#111111' cellpadding='0' cellspacing='0'>"
        Dim bruttoPreis As Double
        
        While Not rsArtikel.EOF
 
            bruttoPreis = getPreis(getLOGIN(), rsArtikel("ArtNr").Value, 1)
            bruttoPreis = FormatNumber(makeBruttoPreis(bruttoPreis, rsArtikel("MWST").Value, Session("Land")), 2)
    
            html = html & "<tr>"
            html = html & "<td width='575' bordercolor='#CECFCE' style='border-bottom-style: solid; border-bottom-width: 1'>"
            html = html & " <font size='1'>"

            html = html & " <a href='default.aspx?ArtNr=" & rsArtikel("ArtNr").Value & "'>" & Server.HtmlEncode(rsArtikel("Bezeichnung").Value) & "</a></font>"
            html = html & "</td>"
            html = html & "<td width='75' align='right' bordercolor='#CECFCE' style='border-bottom-style: solid; border-bottom-width: 1'><font size=" '1'>
            html = html & getCurrencySymbol() & " " & bruttoPreis & "</font></td>"
            html = html & "</tr>"
 
            rsArtikel.movenext()
        End While
        
        html = html & "</table>"
        html = html & "</center>"
        html = html & "</div>"
 
        rsArtikel.close()
        Response.Write(html)
        
    End Sub


    ''' <summary>
    ''' printNewReviewsCache
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function printNewReviewsCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_PRINTNEWREVIEWS_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, printNewReviews(artKatNr))
        End If
        printNewReviewsCache = temp
    End Function

    ''' <summary>
    ''' printNewReviews
    ''' </summary>
    ''' <param name="artKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function printNewReviews(ByVal artKatNr)
        Dim html As String
        'Dim artKatNr: artKatNr = clng(tablevalue("grArtikel","ArtNr", ArtNr,"ArtKatNr"))
        Const MAX_LINES As Integer = 10

        'html = html & "<a href="writeReview.aspx?ArtNr=ArtNr">Review verfassen</a> 
 
 
        Dim Sql As String
        Sql = " SELECT [grArtikel-Reviews].DateCreation, grArtikel.Bezeichnung, [grArtikel-Reviews].Points, " & _
             " [grArtikel-Reviews].Autor, [grArtikel-Reviews].Review, [grArtikel-Reviews].ReviewID, grArtikel.ArtNr " & _
             " FROM grArtikel INNER JOIN [grArtikel-Reviews] ON grArtikel.ArtNr = [grArtikel-Reviews].ArtNR " & _
             " ORDER BY [grArtikel-Reviews].DateCreation DESC"

        'Response.Write sql
        Dim rsTop
        Dim i As Integer : i = 0
        rsTop = ObjConnectionexecute(Sql)
        If rsTop.EOF Then
            html = "Derzeit keine Bewertungen vorhanden."
            printNewReviews = html
            Exit Function
        Else
            While Not rsTop.EOF And i < MAX_LINES
                i = i + 1
                'call drawWindow("Beitrag von " & rsTop("Autor"), "Datum:" & rsTop("DateCreation") & "<br />" & rsTop("Review"),"",butArrEmpty)    
                html = html & drawWindowForum("Beitrag von " & rsTop("Autor").Value, "Datum:" & rsTop("DateCreation").Value, rsTop("Review").Value, "")
                rsTop.moveNext()
            End While

        End If
        rsTop.close()

        printNewReviews = html
    End Function

    '==============================================================================
    ' optionale auswahl nach bezeichnung 
    ' Bezeichnung by default = "ALLE"
    '==============================================================================
    Function makeRelatedArtikelList(ByVal ArtNR, ByVal Bezeichnung)
        Dim html As String
        Dim sql As String
        Dim rs
        'makeRelatedArtikelList = ""
        'exit function 
 
        Dim tamplate_html As String
        tamplate_html = "<table border=0 width='100%'>" & _
                         "<tr><td>[1]</td><td>[2]</td><td>[3]</td><td>[4]</td></tr>" & _
                         "<tr><td>[5]</td><td>[6]</td><td>[7]</td><td>[8]</td></tr>" & _
                         "<tr><td>[9]</td><td>[10]</td><td>[11]</td><td>[12]</td></tr>" & _
                       "</table>"
     
        tamplate_html = "<table border=0 width='100%'>" & _
                              "<tr><td>[1]</td><td>[2]</td><td>[3]</td></tr>" & _
                              "<tr><td>[4]</td><td>[5]</td><td>[6]</td></tr>" & _
                              "<tr><td>[7]</td><td>[8]</td><td>[9]</td></tr>" & _
                              "<tr><td>[10]</td><td>[11]</td><td>[12]</td></tr>" & _
                            "</table>"
       
        'html = getTranslation(Bezeichnung)  & ":" '"Zubehoer:"
        'html = html & "" 
        html = ""
        tamplate_html = html & tamplate_html

        If Bezeichnung <> "ALLE" And Bezeichnung <> "" Then 'nur bestimmten typ wird gesucht 
            sql = " select unterartNr from [grArtikel-VerwandteArtikel] where Bezeichnung like '" & Bezeichnung & "' and ArtNr = " & ArtNR & _
              " union " & _
              " select ArtNr from [grArtikel-VerwandteArtikel] where Bezeichnung like '" & Bezeichnung & "' and unterartNR = " & ArtNR
        Else
            sql = " select unterartNr from [grArtikel-VerwandteArtikel] where ArtNr = " & ArtNR & _
              " union " & _
              " select ArtNr from [grArtikel-VerwandteArtikel] where unterartNR = " & ArtNR
        End If
        rs = ObjConnectionexecute(sql)
        Dim ArtList : ArtList = "-1"
        While Not rs.eof
            ArtList = ArtList & "," & rs("unterartNR").Value
            rs.MoveNext()
        End While
        
        sql = "Select ArtNr FROM grArtikel, lieferantenAdressen  " & _
          " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR and ProduktAktiv<>0  " & _
                " and ArtNr in (" & ArtList & ")"

      
        rs = ObjConnectionexecute(sql)
        Dim i : i = 0
        While Not rs.eof
            i = i + 1
            tamplate_html = Replace(tamplate_html, "[" & i & "]", makeProductPageSmallForRelatedProducts(rs("ArtNR").Value, ""))
            rs.MoveNext()
        End While

        'replace not used places 
        For i = 1 To 12
            tamplate_html = Replace(tamplate_html, "[" & i & "]", "&nbsp;")
        Next
  
        rs.Close()
        makeRelatedArtikelList = tamplate_html
    End Function

    
    ''' <summary>
    ''' makeRelatedArtikelListOtherUsersBuy
    ''' </summary>
    ''' <param name="ArtNR"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeRelatedArtikelListOtherUsersBuy(ByVal ArtNR)
        Dim html As String
        Dim sql As String
        Dim rs
        
        'makeRelatedArtikelList = ""
        'exit function 
        html = "Unsere Kunden kaufen auch:"
        html = html & ""

        sql = " SELECT webWarenkorb.ArtNr as unterartNR FROM webWarenkorb, webWarenkorb webWarenkorb_1 " & _
                " WHERE webWarenkorb.SID = webWarenkorb_1.SID and webWarenkorb_1.ArtNr = " & ArtNR & _
                " and  webWarenkorb.ArtNr<>webWarenkorb_1.artnr " & _
                " GROUP BY webWarenkorb.ArtNr, webWarenkorb_1.ArtNr " & _
                " HAVING Count(webWarenkorb_1.ArtNr) >=2"
 
        Response.Write(sql) : Response.Flush()
        
        rs = ObjConnectionexecute(sql)
        Dim ArtList As String : ArtList = "-1"
        While Not rs.eof
            ArtList = ArtList & "," & rs("unterartNR").Value
            rs.MoveNext()
        End While
        
        sql = "Select ArtNr FROM grArtikel, lieferantenAdressen  " & _
          " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR and ProduktAktiv<>0  " & _
                " and ArtNr in (" & ArtList & ")"

       
        rs = ObjConnectionexecute(sql)
        While Not rs.eof
            html = html & makeProductPageSmallForRelatedProducts(rs("ArtNR").Value, "")
            rs.MoveNext()
        End While
        rs.Close()

        makeRelatedArtikelListOtherUsersBuy = html
    End Function
       
    
    ''' <summary>
    ''' makeRelatedArtikelListForWarenkorb
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeRelatedArtikelListForWarenkorb()
        Dim sql As String
        Dim rs, html
        
        sql = " select unterartNR from [grArtikel-VerwandteArtikel] where ArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ") " & _
               "union  select artNR from [grArtikel-VerwandteArtikel] where UnterArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ") " & _
                " union SELECT webWarenkorb.ArtNr FROM webWarenkorb INNER JOIN webWarenkorb AS webWarenkorb_1 ON webWarenkorb.SID = webWarenkorb_1.SID " & _
                " WHERE webWarenkorb_1.ArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ")" & _
                " and webWarenkorb.ArtNr <>[webWarenkorb_1].[artnr] " & _
                " GROUP BY webWarenkorb.ArtNr, webWarenkorb_1.ArtNr " & _
                " HAVING  Count(webWarenkorb_1.ArtNr)>=2"
        
        sql = " select unterartNR from [grArtikel-VerwandteArtikel] where ArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ") " & _
               " union  " & _
               " select artNR from [grArtikel-VerwandteArtikel] where UnterArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ") "

        'TODO: SEHR LANGSAM IN MY SQL 
        ' sql = sql & " union select ArtNr from " & _
        '      " webWarenkorb wk where " & _
        '      " wk.sid  in (select sid from webWarenkorb where artnr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ")) " & _
        '      " group by ArtNr " & _
        '      " order by count(*) desc limit 10"
        
        rs = ObjConnectionexecute(sql)
        Dim ArtList As String : ArtList = "-1"
        While Not rs.eof
            ArtList = ArtList & "," & rs("unterartNR").Value
            rs.MoveNext()
        End While
        
        
        sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _
          " FROM grArtikel, lieferantenAdressen  " & _
          " Where grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
          " AND ProduktAktiv<>0  " & _
          " AND ArtNr not in (select artNr from webWarenkorb where sid=" & getSID() & ") " & _
                " and ArtNr in (" & ArtList & ") "
        
        'Response.Write makeProductListOnQuerySimple(sql)
        'exit function 
       
        rs = ObjConnectionexecute(sql)
        '3 in a row  

        Dim template
        template = "<table><tr><td>[1]</td><td>[2]</td><td>[3]</td></tr><tr><td>[4]</td><td>[5]</td><td>[6]</td></tr></table>"
        Dim kk : kk = 1
        While Not rs.eof
            html = html & makeProductPageSmallForRelatedProducts(rs("ArtNR").Value, "")
            template = Replace(template, "[" & kk & "]", makeProductPageSmallForRelatedProducts(rs("ArtNR").Value, ""))
            kk = kk + 1
            rs.MoveNext()
        End While
  
        'remove template numbers
        For kk = 1 To 6
            template = Replace(template, "[" & kk & "]", "")
        Next

        html = template
        rs.Close()
        makeRelatedArtikelListForWarenkorb = html

    End Function


    '================================================================================
    ' addToUserVisitedProducts
    ' When Detail of Product is shown this function adds the product to an session list 
    '================================================================================

    
    Function addToUserVisitedProducts(ByVal artNr)
        Dim i

        For i = 1 To COUNT_VISITED_PRODUCTS
    
            If Session("SESSION_NAME_VISITED_PRODUCT" & i) & "" = "" Then
                Session("SESSION_NAME_VISITED_PRODUCT" & i) = artNr
                'Response.Write "VISITED: " & i & ":" & artNR
                Exit Function
            End If
            'do not add if already in 
            If CStr(Session("SESSION_NAME_VISITED_PRODUCT" & i)) = CStr(artNr) Then
                Exit Function
            End If
        
            'if max achieved then offcet all old 
            If Session("SESSION_NAME_VISITED_PRODUCT" & COUNT_VISITED_PRODUCTS) & "" <> "" And _
               i = COUNT_VISITED_PRODUCTS Then
                Dim kk : kk = 1
                Dim kkPrev
                For kk = 2 To COUNT_VISITED_PRODUCTS
                    kkPrev = CStr(kk - 1)
                    Session("SESSION_NAME_VISITED_PRODUCT" & kkPrev) = Session("SESSION_NAME_VISITED_PRODUCT" & kk)
                Next
                'the last is now the current 
                Session("SESSION_NAME_VISITED_PRODUCT" & COUNT_VISITED_PRODUCTS) = CStr(artNr)
            End If
    
        Next
        addToUserVisitedProducts = True
    End Function


    Function listUserVisitedProducts()
        Dim i
        Dim html
        html = "<table border=0>"
        For i = 1 To COUNT_VISITED_PRODUCTS
            Dim artNR : artNR = Session("SESSION_NAME_VISITED_PRODUCT" & i)
            If artNR & "" <> "" Then
                'html = html &  makeProductLine(artNR, false)
                html = html & "<tr><td>"
                html = html & makeProductPageSmallWithTemplate(artNR, "default.aspx", "skins/skin" & SkinNumber & "/pages/productPageSmall_visitedProduct.htm", 100)
                html = html & "</td></tr>"
                ' Response.Write "Add line " 
            End If
        Next
        html = html & "</table>"
        listUserVisitedProducts = html
    End Function


    Function listUserVisitedProductsHorizontal()
        Dim i
        Dim html
        html = "<table border=0><tr>"
        For i = 1 To 3 'COUNT_VISITED_PRODUCTS
            Dim artNR : artNR = Session("SESSION_NAME_VISITED_PRODUCT" & i)
            If artNR & "" <> "" Then
                'html = html &  makeProductLine(artNR, false)
                html = html & "<td>"
                html = html & makeProductPageSmallWithTemplate(artNR, "default.aspx", "skins/skin" & SkinNumber & "/pages/productPageSmall_visitedProduct.htm", 100)
                html = html & "</td>"
                ' Response.Write "Add line " 
            End If
        Next
        html = html & "</tr></table>"
        listUserVisitedProductsHorizontal = html
    End Function

 
    ''' <summary>
    ''' statistics for the most clicked products by category 
    ''' </summary>
    ''' <param name="ArtKatNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function statisticNewProducts(ByVal ArtKatNr)
        Const MAX_PRODUCTS As Integer = 10
        Const MAX_CHARS As Integer = 25
        Dim sql As String
        Dim html As String

        sql = "SELECT grArtikel.ArtKatNr, grArtikel.ArtNr, grArtikel.Bezeichnung, AngelegtAm " & _
        " FROM grArtikel " & _
        " WHERE ProduktAktiv<>0 AND " & _
          makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
        " ORDER BY AngelegtAm DESC"

        'Response.Write sql      :Response.Flush
        Dim rs : rs = ObjConnectionexecute(sql)
        Dim i As Integer : i = 0
        Dim Bezeichnung As String
        html = html & "<table border=0>"
        While Not rs.EOF And i < MAX_PRODUCTS
            'html = html &  makeProductPageSmall(rs("ArtNR").Value, "TopClicks")
            'html = html & makeProductLine(rs("ArtNR").Value, true)
            Bezeichnung = Server.HtmlEncode(rs("Bezeichnung").Value & "")
            If Len(Bezeichnung) > MAX_CHARS Then Bezeichnung = Left(Bezeichnung, MAX_CHARS) & ".."
            html = html & "<tr><td><a href=""default.aspx?ArtNr=" & rs("ArtNr").Value & """>" & Bezeichnung & "</a></td>"
            html = html & "<td>" & getTranslation("seit") & " " & GermanSQLDate(rs("AngelegtAm").Value) & "</td></tr>"
            rs.movenext()
            i = i + 1
        End While
        html = html & "</table>"
        rs.close()
        statisticNewProducts = html
    End Function


    '****************************************************************************
    ' statistics for the most clicked products from caches
    '****************************************************************************
    Function statisticNewProductsCache(ByVal artKatNr)
        Dim temp
        Dim CACHE_NAME As String = "SUB_NEW_PRODUCTS_" & artKatNr & "_" & Session("language")
        temp = getCache(CACHE_NAME)
        'response.Write "temp='" & temp & "'"
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, statisticNewProducts(artKatNr))
        End If
        statisticNewProductsCache = temp
    End Function

</script>

