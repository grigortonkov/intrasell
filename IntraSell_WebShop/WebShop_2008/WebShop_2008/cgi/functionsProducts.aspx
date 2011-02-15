<% 
    
    PRODUCT_IMAGE_BIG_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_IMAGE_BIG_MAX_SIZE", 400)
    PRODUCT_IMAGE_MIDDLE_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_IMAGE_MIDDLE_MAX_SIZE", 200)
    PRODUCT_IMAGE_SMALL_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_IMAGE_SMALL_MAX_SIZE", 100)
    PRODUCT_SHORT_DESCRIPTION_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_SHORT_DESCRIPTION_MAX_SIZE", 255) 'MAX SIZE FOR SEARCH/LIST, SMALL PRODUCT VIEW 
    
 
%>

<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

    Const TECHINFOCONSTANT  As String= "TechInfo:"
    Const SPECIALCHOICECONSTANT  As String= "SpecialChoice:"
    Const DAYS_TO_LOOK_BACK_CLICKS As integer = 3
    Const DEFAULT_PRODUCT_SEARCH_WHERE As String = "ProduktAktiv<>0 and ProduktAktivOnline<>0 and ArtNr>=0 and preisATS<>0"

    Const TAG_EIGENSCHAFT_ As String = "[Eigenschaft" 'usage [Eigenschaft:name]
    Const TAG_IMAGETAGNAME_  As String= "[makeImgTagName" 'usage [makeImgTag:imageName]
    Const TAG_HTMLINFONAME_  As String= "[HTMLInfoName" 'usage [htmlInfoName:name]
    Const TAG_VERWANDTE_PRODUKTE_  As String= "[verwandteProdukte" 'usage [verwandteProdukte:bezeichnung]

    

    Const FLENAME_PRODUCT_LIST_COLUMN_DESCRIPTION  As String= "productList_column_description.htm"
    Const FLENAME_PRODUCT_LIST_HEADER As String = "productList_header.htm"

    Const ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS As String = "ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS" 'wenn TRUE dann nur Kunden können die Preise sehen und einkaufen  

    Const TAG_CREATEPRODUCTSPECIALCHOICE As String = "[createProductSpecialChoice]"
    Const TAG_CREATESTAFFELPREISTABLE As String = "[createStaffelPreiseTable]"

    Const TAG_BEZEICHNUNG As String = "[Bezeichnung]"
    Const TAG_BESCHREIBUNG As String = "[Beschreibung]"
    
    Const TAG_MAKEBRUTTOPREIS As String = "[makeBruttoPreis]"
    Const TAG_MAKENETTOPREIS As String = "[makeNettoPreis]"
    Const TAG_MAKEMWSTPREIS As String = "[makeMwstPreis]"
    Const TAG_MAKEBRUTTOPREIS_LIST As String = "[makeBruttoPreisList]"

    Dim PRODUCT_IMAGE_BIG_MAX_SIZE ': PRODUCT_IMAGE_BIG_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_IMAGE_BIG_MAX_SIZE", 400)
    Dim PRODUCT_IMAGE_MIDDLE_MAX_SIZE ': PRODUCT_IMAGE_MIDDLE_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_IMAGE_MIDDLE_MAX_SIZE", 200)  
    Dim PRODUCT_IMAGE_SMALL_MAX_SIZE ': PRODUCT_IMAGE_SMALL_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_IMAGE_SMALL_MAX_SIZE", 100)  
    Dim PRODUCT_SHORT_DESCRIPTION_MAX_SIZE ' : PRODUCT_SHORT_DESCRIPTION_MAX_SIZE = VARVALUE_DEFAULT("SHOP_PRODUCT_SHORT_DESCRIPTION_MAX_SIZE", 255) 'MAX SIZE FOR SEARCH/LIST, SMALL PRODUCT VIEW 

    
    ''' <summary>
    ''' WHERE Condition for all subcategories 
    ''' </summary>
    ''' <param name="fieldNAme"></param>
    ''' <param name="artKatNr"></param>
    ''' <param name="SUBLEVELS"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeArtKatNrInPart(ByVal fieldNAme, ByVal artKatNr, ByVal SUBLEVELS) As String
        If artKatNr = 0 Or artKatNr = 1 Then
            makeArtKatNrInPart = " 1=1 "
        Else
            makeArtKatNrInPart = fieldNAme & " In (select ArtKatNr from webCatsIndex where ArtKatNrParent=" & artKatNr & ")"
        End If
    End Function

    ''' <summary>
    ''' WHERE Condition for all supercategories 
    ''' </summary>
    ''' <param name="fieldNAme"></param>
    ''' <param name="artKatNr"></param>
    ''' <param name="SUBLEVELS"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeArtKatNrInPartParentCats(ByVal fieldNAme, ByVal artKatNr, ByVal SUBLEVELS)
        If artKatNr = 0 Or artKatNr = 1 Then
            makeArtKatNrInPartParentCats = " 1=1 "
        Else
            makeArtKatNrInPartParentCats = fieldNAme & " In (select ArtKatNrParent from webCatsIndex where ArtKatNr=" & artKatNr & ")"
        End If
    End Function

 
    ''' <summary>
    ''' DisplaySearchResults - search after product attributes  
    ''' added support for search in the subcats 
    ''' </summary>
    ''' <param name="SearchKeywords"></param>
    ''' <remarks></remarks>
    Sub DisplaySearchResults(ByVal SearchKeywords As String)
        Dim SEARCH_IN_DESCRIPTION : SEARCH_IN_DESCRIPTION = False
        Const MIN_SEARCHABLE As Integer = 3
 
        'init 
        SEARCH_IN_DESCRIPTION = VARVALUE_DEFAULT("SHOP_SEARCH_IN_DESCRIPTION", "true")

        
        If Len(Trim(SearchKeywords)) < MIN_SEARCHABLE Then
            Response.Write( drawErrorBox(getTranslation("Suche ungültig!"), _
                 getTranslation("Die Suche muss mindestens " & MIN_SEARCHABLE & " Symbole enthalten!"), "", ""))
            Exit Sub
        End If

        Response.Write(getTranslation("Suchergebnisse") & "...")

        Dim MC : If UCase(Session("dbType")) = UCase("Access") Then MC = "*" Else MC = "%"
        Dim sql As String, rsQ
        Dim ArtKatNr_ToSearchInto : ArtKatNr_ToSearchInto = Request("ArtKatNr_ToSearchInto")
        Dim SearchOnlyInthisCategory : SearchOnlyInthisCategory = Request("SearchOnlyInthisCategory")

        If LCase(SearchOnlyInthisCategory) <> "on" Then
            ArtKatNr_ToSearchInto = 0
        End If

        If "" & ArtKatNr_ToSearchInto = "" Then
            ArtKatNr_ToSearchInto = 0
        End If

        'Response.Write "ArtKatNr_ToSearchInto=" & ArtKatNr_ToSearchInto:Response.Flush
        'Response.Write "SearchOnlyInthisCategory=" & SearchOnlyInthisCategory


        Dim catPath As String = "", catPathOld
 
        Dim AllKeywords As String()
        SearchKeywords = Replace(SearchKeywords, "'", "")
        SearchKeywords = Replace(SearchKeywords, """", "")


        AllKeywords = Split(Trim(SearchKeywords), " ")
        sql = "1=1 "

        If Not ArtKatNr_ToSearchInto Is Nothing Then
            If CInt(ArtKatNr_ToSearchInto) > 0 Then
                sql = sql & "AND grArtikel.ArtKatNR in (" & makeSubcategoriesList(ArtKatNr_ToSearchInto, 4) & ")"
            End If
        End If

        If Not IsNumeric(Trim(SearchKeywords)) Then '
            Dim key As String = ""
            For Each key In AllKeywords

                If key <> "" Then
                    'sql = sql + "AND ([Bezeichnung] like '" & MC & key & MC & "'" & _ 
                    '" OR [Bezeichnung1] like '" & MC & key & MC & "' " &  _
                    '" OR [EAN] like '" & MC & key & MC & "' " &  _
                    '" OR [ArtNR] like '" & MC & key & MC & "' " &  _
                    '" OR [Barcode] like '" & MC & key & MC & "' " &  _
                    '" OR [Seriennummer] like '" & MC & key & MC & "' " &  _
                    '" OR [Firma] like '" & MC & key & MC & "' " &  _
                    '" OR [Beschreibung] like '" & MC & key & MC & "') "
                    If SEARCH_IN_DESCRIPTION Then ' slow  
                        sql = sql + "AND ([Bezeichnung] like '" & MC & key & MC & "'" & _
                        " OR [EAN] like '" & MC & key & MC & "' " & _
                        " OR [Beschreibung] like '" & MC & key & MC & "' " & _
                        " OR [Firma] like '" & MC & key & MC & "' )"
                    Else 'Fast
                        sql = sql + "AND ([Bezeichnung] like '" & MC & key & MC & "'" & _
                        " OR [EAN] like '" & MC & key & MC & "' " & _
                        " OR [Firma] like '" & MC & key & MC & "') "
                    End If
                
                End If
            Next
            If Mid(sql, 1, 2) = "AND" Then sql = Mid(sql, 4)
            catPathOld = ""
            sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung, ArtKatNr " & _
              " FROM grArtikel, lieferantenAdressen  " & _
              " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
              " AND " & DEFAULT_PRODUCT_SEARCH_WHERE & " AND " & _
              "(" & sql & ")"
            sql = sql & " UNION " & _
              " SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung, ArtKatNr " & _
              " FROM grArtikel, lieferantenAdressen, (SELECT t.key FROM  translations t where t.tablename = 'grArtikel' and t.translation like '" & MC & SearchKeywords & MC & "' ) ft " & _
              " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
              " AND " & DEFAULT_PRODUCT_SEARCH_WHERE & _
              " AND ft.key= ArtNr"
        Else 'product seach by ArtNR
            sql = "SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung, ArtKatNr " & _
              " FROM grArtikel, lieferantenAdressen  " & _
              " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
              " AND " & DEFAULT_PRODUCT_SEARCH_WHERE & " AND ([ArtNr] =" & SearchKeywords & " OR [EAN] like '" & SearchKeywords & "')"
        End If


        'sort initial search on ArtKatNr 

        Dim initialOrderBy
        If Request("orderby") & "" = "" Then
            initialOrderBy = VARVALUE_DEFAULT("SHOP_PROUCTLIST_SORT", "ArtKatNr")
        Else
            initialOrderBy = Request("orderby")
        End If
        'end sort 

        Call WriteLog("simpleSearchForm.log", "SearchKeywords: " & SearchKeywords)
        Response.Write(DisplayCatListOnSeach(SearchKeywords))
        Response.Write(makeProductListOnQuery(sql, Request("filterBy"), initialOrderBy, SearchKeywords))
    End Sub

    '****************************************************************************
    ' Display List Of Categories the user maybe searched for
    '****************************************************************************
    Function DisplayCatListOnSeach(ByVal partOfCatName)
        Dim html : html = ""
        Dim sql, rsKat
        Dim MC : MC = iff(Session("DbType") = "Access", "*", "%")

        If Len(partOfCatName & "") <= 3 Then DisplayCatListOnSeach = "" : Exit Function

        sql = "select ArtKAtNR, Name from [grArtikel-Kategorien] where Name like '" & MC & partOfCatName & MC & "'"
        rsKat = ObjConnectionExecute(sql)
        If Not rsKat.eof Then 'ok the user searches maybe products in these cats 
            html = html & "<br />" & getTranslation("M&ouml;chten Sie die Produkte in den folgenden Kategorien auch ansehen?") & "<br />"
            While Not rsKat.eof
                html = html & showCategoryPath(rsKat("ArtKatNr").Value, "default.aspx") & "<br />"
                rsKat.moveNext()
            End While
            rsKat.close()
        End If

        DisplayCatListOnSeach = html
    End Function

    '****************************************************************************
    ' DisplaySearchResults - search after product attributes  
    '****************************************************************************
    Public Sub DisplayDetailSearchForm()
        Dim searchForm As String
        Dim herstellerList As String

        Dim rs
        Dim sql As String
        sql = "Select distinct  Firma from lieferantenAdressen where rolle like 'Hersteller' ORDER BY Firma"
        rs = objConnectionExecute(sql)
        herstellerList = "<Select Name='HerstellerListSearch'>"

        herstellerList = herstellerList & "<Option></Option>"
        While Not rs.eof
            herstellerList = herstellerList & "<Option>" & rs("Firma").Value
            rs.moveNext()
        End While
        herstellerList = herstellerList & "</Select>"
        rs.close()
 
        searchForm = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/productSearch.htm"))
        searchForm = Replace(searchForm, "[HERSTELLER_LIST]", herstellerList)
        searchForm = parseTemplate(searchForm, Session("CURRENT_PRODUCT_CATEGORY"))
        Response.Write(searchForm)
    End Sub

    '****************************************************************************
    ' DisplaySearchResults - search after product attributes  
    '****************************************************************************
    Public Sub DisplayDetailSearchResults()
        Dim ArtNr, Bezeichnung, MinPreis, MaxPreis, Hersteller, EAN, HerstellerList, ArtKatNr, Lieferant

        ArtNr = Request("ArtNRSearch")
        ArtKatNr = Request("ArtKatNRSearch")
        EAN = Request("EANSearch")
        Bezeichnung = Request("BezeichnungSearch")
        Hersteller = Request("HerstellerSearch")
        Lieferant = Request("LieferantSearch")
        HerstellerList = Request("HerstellerListSearch")

        If HerstellerList <> "" Then Hersteller = HerstellerList

        MinPreis = Replace(Request("PreisVonSearch"), ",", ".")
        MaxPreis = Replace(Request("PreisBisSearch"), ",", ".")

        If ArtNr = "" And Bezeichnung = "" And Hersteller = "" And EAN = "" And HerstellerList = "" And ArtKatNr = "" And Lieferant = "" Then
            Response.Write( drawErrorBox("Mehr Suchkriterien!", _
                            getTranslation("Sie müssen ArtNr, ArtKatNr, Bezeichnung, Hersteller oder Lieferant eingeben."), _
                            "", ""))
            Exit Sub
        End If

        Response.Write(getTranslation("Suchergebnisse") & "...")

        Dim MC : MC = "%"
        Dim sql
        Dim rsQ
        Dim catPath, catPathOld
        catPath = ""
        sql = "1=1 "
        If IsNumeric(Trim(ArtNr)) Then sql = sql + "AND [ArtNr] like '" & MC & ArtNr & MC & "'"
        If IsNumeric(Trim(ArtKatNr)) Then sql = sql + " AND grArtikel.ArtKatNr like '" & ArtKatNr & "'"
        If EAN <> "" Then sql = sql + "AND [EAN] like '" & MC & EAN & MC & "'"
        If Bezeichnung <> "" Then sql = sql + "AND [Bezeichnung] like '" & MC & Bezeichnung & MC & "'"
        If Hersteller <> "" Then sql = sql + "AND HerstellerNr in (select Idnr from lieferantenAdressen where Firma like '" & Hersteller & "')"
        
        If Lieferant <> "" Then
            sql = sql + " AND ArtNr in (select ArtikelNr from [lieferantenArtikel-Preise] " & _
            " where LieferantNr in (select idnr from lieferantenAdressen where Firma like '" & Lieferant & "'))"
        End If
        
        If MinPreis <> "" Then sql = sql + "AND PreisATS >= " & MinPreis & " "
        If MaxPreis <> "" Then sql = sql + "AND PreisATS <= " & MaxPreis & " "

            
        sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung " & _
          " FROM grArtikel, lieferantenAdressen  " & _
          " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
          " AND " & DEFAULT_PRODUCT_SEARCH_WHERE & " AND " & _
          "(" & sql & ")"

          
        'Response.write sql 
        'Response.Flush 
        'Response.end     
        Dim searchDescription
        ' searchDescription = ArtNr  & " "  & ArtKatNr & " " & EAN & " " & Bezeichnung & " " & Hersteller & " " & HerstellerList
   
        If Bezeichnung <> "" Then searchDescription = searchDescription & " und Bezeichnung ist wie '" & Bezeichnung & "'"
        If ArtNr <> "" Then searchDescription = searchDescription & " und Produktnummer ist wie '" & ArtNr & "'"
        If ArtKatNr <> "" Then searchDescription = searchDescription & " und Produktkategorie ist wie '" & tablevalue("[grArtikel-Kategorien]", "ArtKatNr", ArtKatNr, "Name") & "'"
        If EAN <> "" Then searchDescription = searchDescription & " und EAN ist wie '" & EAN & "'"
        If Hersteller <> "" Then searchDescription = searchDescription & " und Hersteller ist wie '" & Hersteller & "'"
        If Lieferant <> "" Then searchDescription = searchDescription & " und Lieferant ist wie '" & Lieferant & "'"

   
        Call WriteLog("detailSearchForm.log", "SearchKeywords: " & searchDescription)
        Response.Write(DisplayCatListOnSeach(Bezeichnung))
        Response.Write(makeProductListOnQuery(sql, "", "", Trim(searchDescription)))
        'showProductQueryResult(sql)
        
    End Sub

    '****************************************************************************
    ' DisplaySearchResults - search after product attributes  
    ' isHersteller - true or false 
    ' 
    ' additional requests in query string: showInactive 
    '****************************************************************************
    Sub DisplaySearchResultsOnMerchantSearch(ByVal idnr, ByVal isHersteller)
        Dim sql As String
        Dim showInactive : showInactive = False
        If Request("showInactive") & "" = "true" Then showInactive = True

    
        If idnr <> "" Then
            If isHersteller Then
                sql = "Select ArtKatNr, ArtNr, EAN, Bezeichnung , Bezeichnung1 , PreisEuro , PreisATS, MWST, Firma, grArtikel.Picture, AngelegtAm " & _
                 " from [grArtikel], lieferantenAdressen " & _
                 " where lieferantenAdressen.idnr = grArtikel.herstellerNr " & _
                 " AND herstellerNr = " & CInt(idnr)
            Else
                sql = "Select ArtKatNr, ArtNr, grArtikel.EAN, grArtikel.Bezeichnung , Bezeichnung1 , grArtikel.PreisEuro , grArtikel.PreisATS, MWST, Firma, grArtikel.Picture, AngelegtAm " & _
            " from [grArtikel], lieferantenAdressen, [lieferantenArtikel-Preise] lap " & _
            " where lieferantenAdressen.idnr = lap.lieferantNr " & _
            " AND lap.ArtikelNr = grArtikel.ArtNr " & _
            " AND lieferantenAdressen.idnr = " & CInt(idnr)
            End If
       
            If showInactive Then
                sql = sql & " AND ProduktAktiv=0"
            Else 'hide inactive products 
                sql = sql & " AND " & DEFAULT_PRODUCT_SEARCH_WHERE
            End If
     

   
            Call showProductQueryResult(sql)
     
        Else
            Response.Write ( drawErrorBox("Keine Nummer!", getTranslation("Sie haben keine Lieferanten/Herstellernummer angegeben!"), "", ""))
        End If
    End Sub

    '****************************************************************************
    ' runs an SQL stametemnt and show the result 
    ' the sql must be something like select * grom grArtikel where      
    '****************************************************************************
    Function showProductQueryResult(ByVal sql)
        Response.Write(makeProductListOnQuery(sql, Request("filterBy"), Request("orderby"), ""))
    End Function


 
    '****************************************************************************
    'makeProductList - lists all products of some category 
    '****************************************************************************
    Function makeProductList(ByVal artKatNr)
        Response.Write(TopCatProducts(artKatNr, "*"))
        'List products in this cat

        Dim Sql
        Dim orderBy : orderBy = Request("orderBy")
        Dim filterBy : filterBy = Request("filterBy")

        'default sortierung nach ArtNr 
        If orderBy & "" = "" Then ' nicht gesetzt
            orderBy = VARVALUE_DEFAULT("SHOP_PRODUCTLIST_SORT", "ArtNr")
        End If

        'sql = "SELECT  IDNR, Branche, Firma, Adresse, [grArtikel-Kategorien].Name AS CaT, grArtikel.* " & _ 
        '    " FROM [grArtikel-Kategorien], grArtikel, lieferantenAdressen  " & _ 
        '    " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
        '    " AND [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _ 
        '    " AND ProduktAktiv<>0 and grArtikel.ArtKatNr=" & artKatNr 
        
        Sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung " & _
         " FROM grArtikel, lieferantenAdressen  " & _
         " Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _
         " and " & DEFAULT_PRODUCT_SEARCH_WHERE & " and grArtikel.ArtKatNr=" & artKatNr
        
        'Response.Write sql: Response.Flush   
        makeProductList = makeProductListOnQuery(Sql, filterBy, orderBy, "")
    End Function
    

    ''' <summary>
    ''' requery SQL 
    ''' </summary>
    ''' <remarks></remarks>
    Sub requerySQL()

        Dim sql As String : sql = Session("CURRENT_SEARCH") ' take last search 
        Dim orderBy : orderBy = Request("orderBy")
        Dim filterByHersteller : filterByHersteller = Request("filterBy")
 
        Dim filterBySQL : filterBySQL = ""
 
        If filterByHersteller <> "" Then
            filterBySQL = "HerstellerNr in (Select idnr from lieferantenAdressen where Firma like '" & filterByHersteller & "')"
        End If
 
        'response.write orderby 
        Response.Write(makeProductListOnQuery(sql, filterBySQL, orderBy, ""))
    End Sub
    
    '****************************************************************************
    ' htmlForSaveUserQuery - 
    ' makes an image link for saving this query
    '****************************************************************************    
    Function htmlForSaveUserQuery(ByVal Sql As String, ByVal FilterBySQL As String, ByVal OrderBy As String, ByVal SearchDescription As String)
        'response.Write sql & SearchDescription
        Dim html
        Session("SQLString") = Sql
        Session("SQLDescription") = SearchDescription
        html = "<a href=""default.aspx?pageToShow=SaveUserQuery""> <img border=""0"" src='" & imageFullName("save.gif") & "' alt='" & getTranslation("Hier können Sie Ihre Abfrage speichern") & "'></a>"
        htmlForSaveUserQuery = html
    End Function


    '****************************************************************************
    'makeProductListOnQuery - lists all products depending on the SQL query
    '****************************************************************************
    Function makeProductListOnQuerySimple(ByVal Sql As String)
        
        'Response.Write sql: Response.Flush
        Dim rsArtikel
        Dim html As String
        rsArtikel = objConnectionExecute(Sql)

        If rsArtikel.BOF And rsArtikel.EOF Then
            html = ""
            Exit Function
        Else

                
            html = html & "<table border=""0"" width=""100%""  cellpadding=""2"" cellspacing=""0"" style=""border-collapse: collapse"" bordercolor=""#111111"">"
            html = html & "<tr bgcolor=#6b8eb5>"
            html = html & "<td width=""417"" align=""left"" bgcolor=""#CCCCCC"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">"
            html = html & "<p align=""center"">Bezeichnung</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""100"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">"
            html = html & "&nbsp;&nbsp;&nbsp;Preis</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""111"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">Hersteller</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""111"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">Hersteller Nr.</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""127"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">Lagerinfo</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""39"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">Buy</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""39"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">Detail</td>"
            html = html & "<td align=""center"" bgcolor=""#CCCCCC"" width=""39"" bordercolor=""#CECFCE"" style=""border-bottom: 1 solid #42598C"">Vergl.</td>"
            html = html & "</tr>"
                


            Dim rowColor
            Dim artNr, VKPreis As Double
            While (Not rsArtikel.EOF)
                artNr = rsArtikel("ArtNR").Value
                VKPreis = FormatNumber(makeBruttoPreis(getPreis(getLOGIN(), rsArtikel("ArtNr").Value, 1), rsArtikel("MWST").Value, Session("Land")), 2)
                If rowColor = "#F7F7F7" Then rowColor = "#FFFFFF" Else rowColor = "#F7F7F7"
                  
                html = html & "<tr>"
                html = html & "<td width=""300"" align=""left"" bgcolor=""" & rowColor & """><a href='default.aspx?ArtNr=" & artNr & "'>" & rsArtikel("Bezeichnung").Value & "</a></td>"
                html = html & "<td width=""100"" align=""center"" bgcolor=""" & rowColor & """><p align=""right"">" & VKPreis & "</td>"
                html = html & "<td width=""100"" align=""center"" bgcolor=""" & rowColor & """>" & rsArtikel("Firma").Value & "</td>"
                html = html & "<td width=""100"" align=""left"" bgcolor=""" & rowColor & """>" & rsArtikel("EAN").Value & "</td>"
                html = html & "<td width=""100"" align=""center"" bgcolor=""" & rowColor & """>" & rsArtikel("Bezeichnung1").Value & "</td>"
                html = html & "<td width=""100""  align=""center"" bgcolor=""" & rowColor & """><a href='putInWarenkorb.aspx?ArtNr=" & artNr & "'>Buy</a></td>"
                html = html & "<td width=""100""  align=""center"" bgcolor=""" & rowColor & """><a href='default.aspx?ArtNr=" & artNr & "'>detail</a></td>"
                html = html & "<td><input type=""checkbox"" value=""" & artNr & """ name=""ArtNrToCompare""></td>"
                html = html & "</tr>"

                rsArtikel.moveNext()
                Response.Flush()
            End While
        
            html = html & "</table>"

        End If
        rsArtikel.close()
        makeProductListOnQuerySimple = html
    End Function





    '****************************************************************************
    ' Product Page Detail 
    ' Gramatik of Beschreibung:
    ' [CommonDescription]#[TechInfo:![ParamterName=ParamereterValue]]#[SpecialChoice:![CHOICENAME=![OPTION,]]]
    ' Example: 
    ' Some text.TechInfo:Prozessor=AMD,RAM=128;SpecialChoice:Color=Red,Green,Blue;Size=S,L,XXL
    ' pagePart = 1, 2 ,3 ,4 .. .usw 
    '****************************************************************************
    Function makeProductPage(ByVal ArtNr, ByVal pagePart) As String
        Call onProductView(ArtNr)
        If Session("ADMIN") <> "" Then  ' if the administrator is logged in then show link for changing of prices and so on 
            Response.Write("<h1><a href='admin/genericasp/tableRedirector_Products.aspx?ArtNr=" & ArtNr & "'>Artikel Bearbeiten </a></h1>")
        End If

        Dim filenameForTemplate
        If pagePart = "" Then pagePart = 1
        'filenameForTemplate =  "skins/skin" & SkinNumber & "/pages/productPage_part" &  pagePart  & ".htm"
    
        'New Feature from Immo / 26-08-2004 
        'check if the category of the product has another template file defined and use it if so ! 
        Dim possibleFilename_ProductTemplate : possibleFilename_ProductTemplate = findTemplateForProductFromCache(tablevalue("grArtikel", "ArtNr", ArtNr, "ArtKatNr"))
        'clean 
        If InStr(possibleFilename_ProductTemplate, "nicht vorhanden") > 0 Or _
           possibleFilename_ProductTemplate = NOT_DEFINED Then
            possibleFilename_ProductTemplate = "" 'clean because of function error 
        End If
     
        filenameForTemplate = "skins/skin" & SkinNumber & "/pages/productPage_part" & pagePart & possibleFilename_ProductTemplate & ".htm"
        If showDebug() Then Response.Write("<br />filenameForTemplate=" & filenameForTemplate)
        'Response.Write filenameForTemplate & Server.MapPath(filenameForTemplate) : Response.Flush
        Dim template
        Dim ArtKatNR
    
        template = makeProductPageWithTemplate(ArtNr, readTextFile(Server.MapPath(filenameForTemplate)))
        ArtKatNR = tablevalue("grArtikel", "artNR", ArtNr, "ArtKatNR")
        makeProductPage = parseTemplate(template, ArtKatNR)
    End Function

     Public Function calulateShopPreis(byval ArtNr As String, byval IDNR As String) As String 
            Dim PreisInfo As String  
            PreisInfo = getPreis(IDNR, ArtNr, 1)
            'PreisATS = makeBruttoPreis(PreisATS, MWSTGROUP, Session("Land")) 'funktioniert ja nach land korrekt
            PreisInfo = calculateBruttoPreis(PreisInfo, ArtNr, IDNR)
            PreisInfo = FormatNumber(PreisInfo, 2)
            calulateShopPreis = PreisInfo
     End Function
     
    '===============================================================================
    ' ArtNr - Integer 
    ' productTemplate - HTML of the template containing the tags. 
    ' For the tags see File shop_skins_functionality.xml
    '===============================================================================
    Public Function makeProductPageWithTemplate(ByVal ArtNr As String, ByRef productTemplate As String) As String

        Dim Sql As String 
        Dim rsArtikel
        If ArtNr = "" Then
            makeProductPageWithTemplate = "Es wurde keine ArtNr übergeben!" : Exit Function
        End If

        Sql = " SELECT Firma, lieferantenAdressen.Picture as FirmaImage, lieferantenAdressen.web as HerstellerLink, " & _
              " ArtNr , EAN, ArtKatNR, grArtikel.Picture , PreisATS , Bezeichnung1, Bezeichnung , MWST, HErstellerRabatt, HerstellerRabattText, " & _
              " ProduktAktiv, Beschreibung, Modifikationen, herstellerNr, LieferantNr, Gewicht " & _
              " FROM grArtikel, lieferantenAdressen " & _
              " Where lieferantenAdressen.IDNR = grArtikel.herstellerNr " & _
              " AND ArtNr=" & ArtNr

        rsArtikel = objConnectionExecute(Sql)

        If rsArtikel.EOF Then
            makeProductPageWithTemplate = getTranslation("Es sind keine Daten fuer dieses Produkt verfuegbar!") & " ArtNR=[" & ArtNr & "]"
            rsArtikel.close()
            Exit Function
        End If

        'product found 

        Dim Firma As String = ""
        Dim FirmaImage, HerstellerLink, Picture, Bezeichnung1, Bezeichnung, Beschreibung, MWSTGROUP
        Dim PreisATS As String, PreisATSNetto As String, PreisATSMwst As String , PreisATSList As String
        
        Dim BeschreibungWithoutTechInfo, Modifikationen, EAN, ArtKatNR
        Dim ProduktAktiv As Boolean
        Dim herstellerRabatt As Double
        Dim herstellerRabattText As String
        Dim herstellerNr, LieferantNR
        Dim Gewicht As String
        Dim LieferantLagerInfo As String

        If Not rsArtikel("Firma").Value.Equals(DBNull.Value) Then Firma = rsArtikel("Firma").Value
        HerstellerLink = rsArtikel("HerstellerLink").Value

        FirmaImage = rsArtikel("FirmaImage").Value
        ArtNr = rsArtikel("ArtNr").Value
        Picture = rsArtikel("Picture").Value

        Bezeichnung1 = rsArtikel("Bezeichnung1").Value & ""
        Try
            LieferantLagerInfo = Server.HtmlEncode(IntraSellPreise().getLieferantLagerInfo(ArtNr) & "")
        Catch
            LieferantLagerInfo = "N.A."
        End Try
        Bezeichnung = rsArtikel("Bezeichnung").Value & ""
        Bezeichnung = getTranslationDok("grArtikel", ArtNr, "Bezeichnung", Bezeichnung & "", Language)
        Bezeichnung = Server.HtmlEncode(Bezeichnung & "")

        MWSTGROUP = rsArtikel("MWST").Value
        EAN = rsArtikel("EAN").Value
        ArtKatNR = rsArtikel("ArtKatNR").Value

        herstellerNr = rsArtikel("HerstellerNr").Value
        LieferantNR = rsArtikel("LieferantNR").Value

        Dim KundenIDNRFuerPreise as String = getLOGIN()
         
        Dim shopUserForOffers = VARVALUE_DEFAULT("SHOP_DEFAULT_USER_FOR_OFFERS", "1")
         
         If KundenIDNRFuerPreise is Nothing then 
             KundenIDNRFuerPreise  = shopUserForOffers
         End If 
 
        'Listenpreis 
        If InStr(productTemplate, TAG_MAKEBRUTTOPREIS_LIST) > 0 Then
            PreisATSList = getPreis(shopUserForOffers, ArtNr, 1)
            PreisATSList = makeBruttoPreis(PreisATSList, MWSTGROUP, Session("Land"))
            PreisATSList = FormatNumber(PreisATSList, 2)
        End If
        
        'Preis - Brutto
        If InStr(productTemplate, TAG_MAKEBRUTTOPREIS) > 0 or InStr(productTemplate, TAG_MAKEMWSTPREIS) > 0  Then
            PreisATS = getPreis(KundenIDNRFuerPreise, ArtNr, 1)
            'PreisATS = makeBruttoPreis(PreisATS, MWSTGROUP, Session("Land")) 'funktioniert ja nach land korrekt
            PreisATS = calculateBruttoPreis(PreisATS, ArtNr, KundenIDNRFuerPreise)
            PreisATS = FormatNumber(PreisATS, 2)
        End If

        'Preis - Netto  
        If InStr(productTemplate, TAG_MAKENETTOPREIS) > 0 or InStr(productTemplate, TAG_MAKEMWSTPREIS) > 0  Then
            PreisATSNetto = makeNettoPreis( ArtNr, 1, KundenIDNRFuerPreise)
            'PreisATSNetto = makeBruttoPreis(PreisATS, MWSTGROUP, Session("Land"))
            PreisATSNetto = FormatNumber(PreisATSNetto, 2)
        End If
        
        'Mwst 
        If InStr(productTemplate, TAG_MAKEMWSTPREIS) > 0 Then
            PreisATSMwst = PreisATS - PreisATSNetto   'getPreis(getLOGIN(), ArtNr, 1) - makeNettoPreis( ArtNr, 1, getLOGIN())
            PreisATSMwst = FormatNumber(PreisATSMwst, 2)
        End If
        
        If Not isPurchasingAllowed() Then
            Dim info As String = getTranslation("Login für Preise!")
            PreisATS = info
            PreisATSNetto = info
            PreisATSMwst = info
        End If

        If  getLOGIN() is Nothing then 
            Dim tooltip As String = "&nbsp;<a Title='" &  getTranslation("Login Sie sich an für Ihre eigene Preisliste.") & "'>*</a>"
            PreisATS = PreisATS & tooltip
            PreisATSNetto = PreisATSNetto & tooltip
        End If 

        If rsArtikel("herstellerRabatt").Value.ToString = DBNull.Value.ToString Then
            herstellerRabatt = 0
        Else
            herstellerRabatt = rsArtikel("herstellerRabatt").Value
        End If
         
        herstellerRabattText = rsArtikel("herstellerRabattText").Value.ToString
        ProduktAktiv = rsArtikel("produktAktiv").Value.ToString
        herstellerNr = rsArtikel("herstellerNr").Value.ToString
        If rsArtikel("Gewicht").Value.ToString <> DBNull.Value.ToString Then
            Gewicht = rsArtikel("Gewicht").Value
        End If

        Beschreibung = rsArtikel("Beschreibung").Value & ""
        Beschreibung = getTranslationDok("grArtikel", ArtNr, "Beschreibung", Beschreibung & "", Language)
        Modifikationen = rsArtikel("Modifikationen").Value

        'GT: always parse the product 
        If herstellerNr = getLOGIN() Or ((Not DBNull.Value.Equals(LieferantNR)) And LieferantNR.Equals(getLOGIN())) Then 'Das ist der inserat anbieter und er darf die seite sehen!
            'response.Write "Dieses Objekt ist nicht aktiv!"
        Else 'do not allow to see this page 
            If ProduktAktiv = 0 Then
                makeProductPageWithTemplate = getTranslation("Produkt ist deaktiviert und wird nicht mehr ausgeliefert!")
                rsArtikel.close()
                rsArtikel = Nothing
                Exit Function
            End If
        End If


        If InStr(UCase(Beschreibung), UCase(TECHINFOCONSTANT)) > 0 Then
            BeschreibungWithoutTechInfo = Left(Beschreibung, InStr(UCase(Beschreibung), UCase(TECHINFOCONSTANT)) - 1)
        Else
            BeschreibungWithoutTechInfo = Beschreibung
        End If

        If InStr(UCase(BeschreibungWithoutTechInfo), UCase(SPECIALCHOICECONSTANT)) > 0 Then
            BeschreibungWithoutTechInfo = Left(BeschreibungWithoutTechInfo, InStr(UCase(BeschreibungWithoutTechInfo), UCase(SPECIALCHOICECONSTANT)) - 1)
        End If

        Const replacements = 999

        Dim imgTagPicture, imgTagPictureLarge
        'imgTagPicture = "<a href=""default.aspx?artNr=" & artNr & """>"& makeImgTag(Picture,Bezeichnung,200) & "</a>"
        imgTagPicture = makeImgTag(Picture, Bezeichnung, PRODUCT_IMAGE_MIDDLE_MAX_SIZE)
        imgTagPictureLarge = "<a href=""default.aspx?artNr=" & ArtNr & """>" & makeImgTag(Picture, Bezeichnung, PRODUCT_IMAGE_BIG_MAX_SIZE) & "</a>"

        productTemplate = Replace(productTemplate, "[ArtNr]", ArtNr & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[ProduktAktiv]", ProduktAktiv & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[EAN]", EAN & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, TAG_BEZEICHNUNG, Bezeichnung & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[Bezeichnung1]", Bezeichnung1 & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[MWSTGROUP]", MWSTGROUP & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, TAG_BESCHREIBUNG, BeschreibungWithoutTechInfo & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[Firma]", Firma & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[HerstellerLink]", HerstellerLink & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[makeImgTagFirma]", makeImgTag(FirmaImage, Firma, 60) & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[makeImgTag]", imgTagPicture & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[makeImgTagLarge]", imgTagPictureLarge & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[Modifikationen]", Modifikationen & "", 1, replacements, 1)
        
        'Preise 
        productTemplate = Replace(productTemplate, TAG_MAKEBRUTTOPREIS_LIST, PreisATSList, 1, replacements, 1)
        productTemplate = Replace(productTemplate, TAG_MAKEBRUTTOPREIS, PreisATS, 1, replacements, 1)
        productTemplate = Replace(productTemplate, TAG_MAKENETTOPREIS, PreisATSNetto, 1, replacements, 1)
        productTemplate = Replace(productTemplate, TAG_MAKEMWSTPREIS, PreisATSMwst, 1, replacements, 1)
        
        productTemplate = Replace(productTemplate, "[HerstellerNr]", herstellerNr, 1, replacements, 1)

        'new 12.10.2004
        productTemplate = Replace(productTemplate, "[Picture]", Picture & "", 1, replacements, 1)

        'new 12.10.2004
        productTemplate = Replace(productTemplate, "[Gewicht]", Gewicht & "", 1, replacements, 1)

        Call replaceEigenschaftenAndMore(ArtNr, productTemplate)
    
      
        If InStr(productTemplate, "[minLieferantVKPreis]") > 0 Then
            Dim p : p = 0 'TODO FormatNumber(getLieferantPreis(ArtNr, True, True), 2)
            productTemplate = Replace(productTemplate, "[minLieferantVKPreis]", p)
        End If


        productTemplate = Replace(productTemplate, "[herstellerRabatt]", herstellerRabatt & "", 1, replacements, 1)
        productTemplate = Replace(productTemplate, "[herstellerRabattText]", herstellerRabattText & "", 1, replacements, 1)
 
        If InStr(productTemplate, "[compareProductsSelectForm]") > 0 Then
            productTemplate = Replace(productTemplate, "[compareProductsSelectForm]", compareProductsSelectForm(ArtNr) & "", 1, replacements, 1)
        End If

        productTemplate = Replace(productTemplate, "[HTMLInfo]", getHTMLInfo(ArtNr) & "", 1, replacements, 1)

        productTemplate = Replace(productTemplate, "[makeListKeywords]", makeListKeywords(ArtNr) & "", 1, replacements, 1)

        productTemplate = Replace(productTemplate, TAG_CREATEPRODUCTSPECIALCHOICE, createProductSpecialChoice(Modifikationen) & "", 1, replacements, 1)

        If InStr(productTemplate, "[createTechnicalInfo]") > 0 Then
            productTemplate = Replace(productTemplate, "[createTechnicalInfo]", createTechnicalInfo(Beschreibung) & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, TAG_CREATESTAFFELPREISTABLE) > 0 Then
            productTemplate = Replace(productTemplate, TAG_CREATESTAFFELPREISTABLE, createStaffelPreiseTable(ArtNr) & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, "[makeReviewStars]") > 0 Then
            productTemplate = Replace(productTemplate, "[makeReviewStars]", makeBewertungStars(ArtNr) & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, "[count_product_reviews]") > 0 Then
            productTemplate = Replace(productTemplate, "[count_product_reviews]", makeBewertungAnzahl(ArtNr) & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, "[makeReviewsPage]") > 0 Then
            productTemplate = Replace(productTemplate, "[makeReviewsPage]", makeReviewsPage(ArtNr) & "", 1, replacements, 1)
        End If

        If getLOGIN() <> "" Or True Then
            productTemplate = Replace(productTemplate, "[makeWriteReviewForm]", makeWriteReviewForm(ArtNr) & "", 1, replacements, 1)
        Else
            productTemplate = Replace(productTemplate, "[makeWriteReviewForm]", getTranslation("Nur registrierte Benutzer k&ouml;nnen Bewertungen abgeben!"), 1, replacements, 1)
        End If

        If InStr(productTemplate, "[verwandteProdukte]") > 0 Then
            productTemplate = Replace(productTemplate, "[verwandteProdukte]", makeRelatedArtikelList(ArtNr, "ALLE") & "", 1, replacements, 1)
        End If

        'erweiterte Ersetzung mit Typ 

        Call replaceRelatedProductsTag(ArtNr, productTemplate)


        If InStr(productTemplate, "[DieAnderenKaufenAuch]") > 0 Then
            productTemplate = Replace(productTemplate, "[DieAnderenKaufenAuch]", makeRelatedArtikelListOtherUsersBuy(ArtNr) & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, "[priceCompare].[makeProductMechantList]") > 0 Then
            productTemplate = Replace(productTemplate, "[priceCompare].[makeProductMechantList]", makeProductMechantList(ArtNr) & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, "[HerstellerAdresse]") > 0 Then
            productTemplate = Replace(productTemplate, "[HerstellerAdresse]", printAddressLieferant(herstellerNr), 1, replacements, 1)
        End If

        'Hersteller INFOS 
        Dim sqlHerstLogo : sqlHerstLogo = "select la.Picture from grArtikel a, LieferantenAdressen la where a.herstellerNr=la.idnr and a.artnr=" & ArtNr
        Dim herstellerPicture : herstellerPicture = FirstValue(sqlHerstLogo)

        If InStr(productTemplate, "[HerstellerLogo]") > 0 Then
            Dim htmlPicture : htmlPicture = ""
            If Len(herstellerPicture & "") > 4 Then htmlPicture = "<img src='" & herstellerPicture & "' border='0'>"
            productTemplate = Replace(productTemplate, "[HerstellerLogo]", htmlPicture, 1, replacements, 1)
        End If

        If InStr(productTemplate, "[HerstellerLogoURL]") > 0 Then
            sqlHerstLogo = "select la.Picture from grArtikel a, LieferantenAdressen la where a.herstellerNr=la.idnr and a.artnr=" & ArtNr
            productTemplate = Replace(productTemplate, "[HerstellerLogoURL]", herstellerPicture & "", 1, replacements, 1)
        End If

        If InStr(productTemplate, "[LieferantAdresse]") > 0 Then
            productTemplate = Replace(productTemplate, "[LieferantAdresse]", printAddressLieferant(LieferantNR), 1, replacements, 1)
        End If
        rsArtikel.close()

        'SQL and SQL_SIMPLE ? 
        Call replaceEmbededSQL(productTemplate)


        'productTemplate  = parseTemplate(productTemplate, null)
        makeProductPageWithTemplate = productTemplate

    End Function


    'replases embeded SQL in the product template 
    Function replaceEmbededSQL(ByRef template) As String
        'const TAG_SQL = "[SQL:<![CDATA[" '[SQL:<![CDATA[select count(*) anz from pricecomparehaendler;]]>]
        'const TAG_SQL_SIMPLE = "[SQL_SIMPLE:<![CDATA["
        'const TAG_SQL_END = "]]>]" 
 
        Dim TAG_EMBED_FULL, html
        Dim embededSQL, nextBracketPos
        'TAG_SQL
        If InStr(template, TAG_SQL) > 0 Then
            nextBracketPos = InStr(InStr(template, TAG_SQL), template, TAG_SQL_END)
            embededSQL = Mid(template, InStr(template, TAG_SQL) + Len(TAG_SQL), nextBracketPos - Len(TAG_SQL) - InStr(template, TAG_SQL))
            TAG_EMBED_FULL = TAG_SQL & embededSQL & TAG_SQL_END
            html = sqlToHTML(embededSQL, True, True)
            If Err.Number > 0 Then
                Response.Write("<p style='error'>Error in TAG_SQL</p>")
            End If
            On Error GoTo 0
            template = Replace(template, TAG_EMBED_FULL, html)
        End If
    
    
        'TAG_SQL_COMMA
        If InStr(template, TAG_SQL_SIMPLE) > 0 Then
            nextBracketPos = InStr(InStr(template, TAG_SQL_SIMPLE), template, TAG_SQL_END)
            embededSQL = Mid(template, InStr(template, TAG_SQL_SIMPLE) + Len(TAG_SQL_SIMPLE), nextBracketPos - Len(TAG_SQL_SIMPLE) - InStr(template, TAG_SQL_SIMPLE))
            TAG_EMBED_FULL = TAG_SQL_SIMPLE & embededSQL & TAG_SQL_END
            html = sqlToSimple(embededSQL, True, True)
            If Err.Number > 0 Then
                Response.Write("<p style='error'>Error in TAG_SQL_SIMPLE</p>")
            End If
            On Error GoTo 0
            template = Replace(template, TAG_EMBED_FULL, html)
        End If
    
    End Function



    'Private Funktion 
    Function replaceEigenschaftenAndMore(ByVal artnr, ByRef productTemplate) As String
        Dim html, nextBracketPos1, typ, tagFull
  
        While InStr(productTemplate, TAG_EIGENSCHAFT_) > 0  'TAG_TOPPRODUCTSrequest
            nextBracketPos1 = InStr(InStr(productTemplate, TAG_EIGENSCHAFT_), productTemplate, "]")
            typ = Mid(productTemplate, InStr(productTemplate, TAG_EIGENSCHAFT_) + Len(TAG_EIGENSCHAFT_) + 1, _
              -(Len(TAG_EIGENSCHAFT_) + 1) + nextBracketPos1 - InStr(productTemplate, TAG_EIGENSCHAFT_))
            tagFull = TAG_EIGENSCHAFT_ & ":" & typ & "]"
            html = getEigenschaft(artnr, typ)
            productTemplate = Replace(productTemplate, tagFull, html)
        End While


        While InStr(productTemplate, TAG_IMAGETAGNAME_) > 0  'TAG_TOPPRODUCTSrequest
            nextBracketPos1 = InStr(InStr(productTemplate, TAG_IMAGETAGNAME_), productTemplate, "]")
            typ = Mid(productTemplate, InStr(productTemplate, TAG_IMAGETAGNAME_) + Len(TAG_IMAGETAGNAME_) + 1, _
              -(Len(TAG_IMAGETAGNAME_) + 1) + nextBracketPos1 - InStr(productTemplate, TAG_IMAGETAGNAME_))
            tagFull = TAG_IMAGETAGNAME_ & ":" & typ & "]"
            html = makeImgTag(typ, typ, PRODUCT_IMAGE_BIG_MAX_SIZE)
            productTemplate = Replace(productTemplate, tagFull, html)
        End While
  
        While InStr(productTemplate, TAG_HTMLINFONAME_) > 0  'TAG_TOPPRODUCTSrequest
            nextBracketPos1 = InStr(InStr(productTemplate, TAG_HTMLINFONAME_), productTemplate, "]")
            typ = Mid(productTemplate, InStr(productTemplate, TAG_HTMLINFONAME_) + Len(TAG_HTMLINFONAME_) + 1, _
              -(Len(TAG_HTMLINFONAME_) + 1) + nextBracketPos1 - InStr(productTemplate, TAG_HTMLINFONAME_))
            tagFull = TAG_HTMLINFONAME_ & ":" & typ & "]"
            html = getHTMLInfoName(artnr, typ)
            productTemplate = Replace(productTemplate, tagFull, html)
        End While
  
    End Function


    '==============================================================================
    'Ersetzt den Tag TAG_VERWANDTE_PRODUKTE_ mit der liste der Produkte  
    '==============================================================================
    Function replaceRelatedProductsTag(ByVal artnr, ByRef productTemplate) As String
        Dim html, nextBracketPos1, typ, tagFull
  
        While InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_) > 0  'TAG_VERWANDTE_PRODUKTE_ 
            nextBracketPos1 = InStr(InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_), productTemplate, "]")
            typ = Mid(productTemplate, InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_) + Len(TAG_VERWANDTE_PRODUKTE_) + 1, _
              -(Len(TAG_VERWANDTE_PRODUKTE_) + 1) + nextBracketPos1 - InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_))
            tagFull = TAG_VERWANDTE_PRODUKTE_ & ":" & typ & "]"
            html = makeRelatedArtikelList(artnr, typ)
            productTemplate = Replace(productTemplate, tagFull, html)
        End While
  
    End Function

    '****************************************************************************
    ' Create Technical Info Table 
    ' takes the TechInfo information from product description 
    ' Needs: for example 
    ' blie blie TechInfo:RAM=256,BUS=123,POS=123
    '****************************************************************************
    Function createTechnicalInfo(ByVal Beschreibung) As String
        Dim html
        Beschreibung = Beschreibung & ""

        Dim posTI
        posTI = InStr(UCase(Beschreibung), UCase(TECHINFOCONSTANT))
        If Beschreibung = "" Or Trim(Beschreibung) = "" Or posTI <= 0 Then
            createTechnicalInfo = "Keine technische Info vorhanden"
            Exit Function
        End If
 
 
        posTI = posTI + Len(TECHINFOCONSTANT)
  
        Dim TechInfo
        TechInfo = Mid(Beschreibung, posTI)
      
        Dim spezChoicePos : spezChoicePos = InStr(UCase(TechInfo), UCase(SPECIALCHOICECONSTANT))
  
        'Response.Write "spezChoicePos=" & spezChoicePos
        If spezChoicePos > 0 Then
            TechInfo = Left(TechInfo, spezChoicePos)
        End If
  
  

        html = html & getTranslation("Technische Informationen:")
        html = html & "<table border=1 width='100%' cellspacing=0><tr>"
 
        Dim parameter, value, splitterPos, TIPair
        For Each TIPair In Split(TechInfo, ",")
            splitterPos = InStr(TIPair, "=")
            parameter = Left(TIPair, splitterPos - 1)
            value = Mid(TIPair, splitterPos + 1)
        
            html = html & "<tr><td border='0' width='100'>" & parameter & "</td>"
            html = html & "<td border='0' width='300'>" & value & "</td></tr>"
        Next
        html = html & "</table>"
    
        createTechnicalInfo = html
    End Function


    ''' <summary>
    ''' getHTMLInfo - SHOWS PRODUCT HTML INFO IF DEFINED 
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getHTMLInfo(ByVal ArtNr)
        
        Dim html As String
        Dim htmlInfoSQL As String, hiRS : htmlInfoSQL = "select HTLMInfo from [grArtikel-HTMLInfo] " & _
              " where ArtNr=" & ArtNr
        hiRS = objConnectionExecute(htmlInfoSQL)
        While Not hiRS.eof
            'if len(hiRS("HTLMInfo"))>0 then 
            'html = html & "<h4>Weitere Informationen</h4>"
            html = html & hiRS("HTLMInfo").Value
            'end if
            hiRS.moveNext()
        End While
    
        html = fixRelativeImageLinks(html)
        getHTMLInfo = html
    End Function
 
    

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="ArtNR"></param>
    ''' <param name="infoAutorName"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getHTMLInfoName(ByVal ArtNR, ByVal infoAutorName)
        Dim sql : sql = "select HTLMInfo from [grArtikel-HTMLInfo] " & _
                       " where Autor like '" & infoAutorName & "' and ArtNr=" & ArtNR

        Dim rs : rs = ObjConnectionExecute(sql)
        getHTMLInfoName = ""
        If Not rs.eof Then
            getHTMLInfoName = rs("HTLMInfo").Value
        End If
        rs.Close()
    End Function

    
    '****************************************************************************
    ' Create Secial Choice 
    ' takes the SpecialChoice information from product description and makes combos for the user to select from 
    ' Needs: for example 
    ' SpecialChoice:Color=RED,GREEN,BLUE;Size=24,25,38;
    '****************************************************************************
    Function createProductSpecialChoice(ByVal SpecialChoice)
        Dim html
        SpecialChoice = SpecialChoice & ""
 
        If Trim(SpecialChoice) = "" Then
            createProductSpecialChoice = ""
            Exit Function
        End If
        html = "W&auml;hlen Sie:"
        html = html & "<table>"
 
        Dim parameter, value, splitterPos, Pair
        For Each Pair In Split(SpecialChoice, ";")
            html = html & "<tr>"
  
            splitterPos = InStr(Pair, "=")
            If splitterPos > 0 Then
                parameter = Left(Pair, splitterPos - 1)
                value = Mid(Pair, splitterPos + 1)
   
                html = html & "<td>" & parameter & "</td>"
                html = html & "<td>"
                html = html & "<select name=""Notiz"">"
  
                Dim choice
                For Each choice In Split(value, ",")
   
                    html = html & " <Option>" & choice
   
                Next
                html = html & "</select></td>"
 
            End If ' splitter pos>0
  
            html = html & "</tr>"
 
        Next
        html = html & "</table>"
        createProductSpecialChoice = html
    End Function


    '****************************************************************************
    ' Create Stafelpreise Tabelle
    '****************************************************************************
    Function createStaffelPreiseTable(ByVal ArtNr)
        Dim html As String
        Dim sql As String
        sql = "Select ArtNr, StkAb from [grArtikel-Staffelpreise] where ArtNr=" & ArtNr
        Dim rs
        rs = objConnectionExecute(sql)
        If rs.eof Then
            createStaffelPreiseTable = "keine Staffelung m&ouml;glich"
            Exit Function
        End If
   
        html = "<table border=0 cellpadding=0>"
        html = html & "<tr>"
        html = html & "<th colspan=2 valign=""top"" bordercolor=""#CECFCE"">Stafelpreise</th>"
        html = html & "</tr>"
 
  
        Dim stkAb As Double, Preis As Double
        While Not rs.EOF
            stkAb = rs("StkAb").Value
            Preis = FormatNumber(makeBruttoPreis2(ArtNr, stkAb, Session("Land")))
  
   
            html = html & "<tr><td border=0 width=106 >ab" & stkAb & " Stk&nbsp;</td>"
            html = html & "<td border=0 width=277>" & Preis & "&nbsp;</td ></tr>"
  
            rs.moveNext()
        End While
        rs.close()
        html = html & "</table>"
        createStaffelPreiseTable = html
    End Function

    '****************************************************************************
    ' Product Page Small Detail  
    '****************************************************************************
    Function makeProductPageSmallWithTemplate(ByVal ArtNr, ByVal pageFrom, ByVal htmlTemplate, ByVal maxImageSize) As String
        'Response.Write "makeProductPageSmall for " & ArtNR
        makeProductPageSmallWithTemplate = "..."
        Dim html
        Dim Sql
        Dim rsArtikel
        Sql = " SELECT grArtikel.ArtNr, EAN, ArtKatNR, grArtikel.Picture, Bezeichnung, Bezeichnung1, PreisATS, " & _
              " MWST, Firma, lieferantenAdressen.Picture as FirmaImage, MWST, Beschreibung, Modifikationen, " & _
              " herstellerRabatt, herstellerRabattText FROM grArtikel, lieferantenAdressen " & _
              " Where lieferantenAdressen.IDNR = grArtikel.herstellerNr " & _
              " AND ArtNr=" & ArtNr & " AND " & DEFAULT_PRODUCT_SEARCH_WHERE


        rsArtikel = objConnectionExecute(Sql)


        If rsArtikel.EOF Then
            html = "<font size='1' color='red' class='error'>" & getTranslation("Sie haben kein Produkt ausgewaehlt od. Produkt nicht verfügbar!") & "</font>"
            makeProductPageSmallWithTemplate = html
        Else

            'Prüfung ob product online

            Dim Beschreibung : Beschreibung = rsArtikel("Beschreibung").Value
            'Beschreibung = getTranslationDok("grArtikel" , ArtNr, "Beschreibung", Beschreibung & "", Language)
            Beschreibung = makeBeschreibung(ArtNr, True)

            Dim Modifikationen : Modifikationen = rsArtikel("Modifikationen").Value
            Dim Firma As String : Firma = rsArtikel("Firma").Value & ""
            Dim FirmaImage As String : FirmaImage = rsArtikel("FirmaImage").Value & ""
            Dim Bezeichnung As String : Bezeichnung = Server.HtmlEncode(rsArtikel("Bezeichnung").Value & "")
            Bezeichnung = getTranslationDok("grArtikel", ArtNr, "Bezeichnung", Bezeichnung & "", Language)
            Bezeichnung = Server.HtmlEncode(Bezeichnung)
    
            Dim Bezeichnung1
            If (Not IntraSellPreise() Is Nothing) Then
                Try
                    Dim liefLI As String = IntraSellPreise().getLieferantLagerInfo(ArtNr)
                    Bezeichnung1 = Server.HtmlEncode(liefLI & "") 'rsArtikel("Bezeichnung1").Value
                Catch ex As Exception
                    Bezeichnung1 = "n.a."
                End Try
                
            End If
            
            Dim Picture : Picture = rsArtikel("Picture").Value
            Dim ArtKatNr : ArtKatNr = rsArtikel("ArtKatNr").Value
            Dim MWSTGROUP : MWSTGROUP = rsArtikel("MWST").Value
            Dim herstellerRabatt : herstellerRabatt = rsArtikel("herstellerRabatt").Value ': If herstellerRabatt = 0 Then herstellerRabatt = ""
            Dim herstellerRabattText : herstellerRabattText = rsArtikel("herstellerRabattText").Value
 
            Dim imgTagPicture
            imgTagPicture = "<a href=""default.aspx?artNr=" & ArtNr & """>" & makeImgTag(Picture, Bezeichnung, maxImageSize) & "</a>"

            Dim bruttoPreis : bruttoPreis = getPreis(getLOGIN(), ArtNr, 1)
            bruttoPreis = FormatNumber(makeBruttoPreis(bruttoPreis, MWSTGROUP, Session("Land")), 2)


            If Not isPurchasingAllowed() Then
                bruttoPreis = getTranslation("Login für Preise!")
            End If

            Dim productTemplate

            'On Error Resume Next
            Try
                productTemplate = "" & readTextFile(Server.MapPath(htmlTemplate))
                If Err.Number > 0 Or productTemplate = "" Then
                    makeProductPageSmallWithTemplate = "Template file is missing: " & htmlTemplate
                    Exit Function
                End If
                
            Catch ex As Exception
                makeProductPageSmallWithTemplate = "Template file is missing: " & htmlTemplate
                Exit Function
            End Try
            

            'On Error GoTo 0
        
            productTemplate = Replace(productTemplate, "[ArtNr]", ArtNr & "")
            productTemplate = Replace(productTemplate, "[EAN]", rsArtikel("EAN").Value & "")
            productTemplate = Replace(productTemplate, TAG_BEZEICHNUNG, Bezeichnung & "")
            productTemplate = Replace(productTemplate, "[Bezeichnung1]", Bezeichnung1 & "")
            productTemplate = Replace(productTemplate, "[MWSTGROUP]", MWSTGROUP & "")
            productTemplate = Replace(productTemplate, TAG_BESCHREIBUNG, Beschreibung & "")
            productTemplate = Replace(productTemplate, "[Firma]", Firma & "")
            productTemplate = Replace(productTemplate, "[makeImgTagFirma]", makeImgTag(FirmaImage, Firma, 60) & "")
            productTemplate = Replace(productTemplate, "[makeImgTag]", imgTagPicture & "")
            productTemplate = Replace(productTemplate, "[Modifikationen]", Modifikationen & "")
            productTemplate = Replace(productTemplate, "[makeBruttoPreis]", bruttoPreis & "")
            productTemplate = Replace(productTemplate, "[HerstellerRabatt]", herstellerRabatt & "")
            productTemplate = Replace(productTemplate, "[HerstellerRabattText]", herstellerRabattText & "")
        
            'added at 20.01.2007
            productTemplate = Replace(productTemplate, "[Picture]", Picture & "")
        
            If InStr(productTemplate, TAG_CREATEPRODUCTSPECIALCHOICE) > 0 Then
                productTemplate = Replace(productTemplate, TAG_CREATEPRODUCTSPECIALCHOICE, createProductSpecialChoice(Modifikationen) & "")
            End If
            If InStr(productTemplate, "[HTMLInfo]") > 0 Then
                productTemplate = Replace(productTemplate, "[HTMLInfo]", getHTMLInfo(ArtNr) & "")
            End If

            Call replaceEigenschaftenAndMore(ArtNr, productTemplate)
         
            makeProductPageSmallWithTemplate = productTemplate
            End If
            rsArtikel.close()
    End Function

    ''' <summary>
    ''' makeProductPageSmall
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <param name="pageFrom"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeProductPageSmall(ByVal ArtNr, ByVal pageFrom)
        makeProductPageSmall = makeProductPageSmallWithTemplate(ArtNr, pageFrom, "skins/skin" & SkinNumber & "/pages/productPageSmall.htm", PRODUCT_IMAGE_SMALL_MAX_SIZE)
    End Function

    ''' <summary>
    ''' makeProductPageSmallForRelatedProducts
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <param name="pageFrom"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeProductPageSmallForRelatedProducts(ByVal ArtNr, ByVal pageFrom)
        makeProductPageSmallForRelatedProducts = makeProductPageSmallWithTemplate(ArtNr, pageFrom, _
                                                 "skins/skin" & SkinNumber & "/pages/productPageSmall_RelatedProduct.htm", _
                                                 PRODUCT_IMAGE_SMALL_MAX_SIZE)
    End Function

    '****************************************************************************
    ' Product Page Small Detail  
    ' for deal of the day...
    ' product and image are fitting in 200 pixel width
    '****************************************************************************
    Function makeProductPageSmall2(ByVal ArtNr, ByVal pageFrom)
        makeProductPageSmall2 = makeProductPageSmallWithTemplate(ArtNr, pageFrom, _
                                               "skins/skin" & SkinNumber & "/pages/productPageSmall.htm", _
                                               PRODUCT_IMAGE_SMALL_MAX_SIZE)
    End Function


    '****************************************************************************
    ' returns bezeichnung mit link und preis
    '****************************************************************************
    Function makeProductLine(ByVal ArtNR, ByVal showPrice) As String  'rs is the record set 
        Dim rs, sql, html
        rs = objConnectionExecute("select ArtNr, Bezeichnung, MWST from grArtikel where ArtNr=" & ArtNR)
        If rs.EOF Then
            makeProductLine = ""
        Else
            Dim bruttoPreis : bruttoPreis = FormatNumber(getPreis(getLOGIN(), ArtNR, 1), 2) 'makeBruttoPreis(getPreis(getSID(),ArtNr), rs("MWST"),session("Land"))
            bruttoPreis = FormatNumber(makeBruttoPreis(bruttoPreis, rs("MWST").Value, Session("Land")), 2)
  
            html = "<tr><td><a href=""default.aspx?ArtNr=" & rs("ArtNr").Value & """>" & Server.HtmlEncode(rs("Bezeichnung").Value & "") & "</a></td>"
            If showPrice Then html = html & "<td>" & getCurrencySymbol() & "</td><td align=""right""> " & FormatNumber(bruttoPreis, 2) & "</td>"
            html = html & "</tr>"
            makeProductLine = html
        End If
        rs.close()
    End Function



    Function iff(ByVal bool, ByVal trueV, ByVal falseV)
        If bool Then
            iff = trueV
        Else : iff = falseV
        End If
    End Function

    '===============================================================================
    ' makes table with product features 
    '===============================================================================
    Function makeListKeywords(ByVal artNr)
        Dim sql As String, rs
        Dim html As String
        
        '" [grArtikel-KeyWords].[Order], " & _ 
        sql = "SELECT [grArtikel-KeyWords].Name, [grArtikel-KeyWordsToProducts].Value, " & _
        " [grArtikel-KeyWordsToProducts].ArtNr " & _
        " FROM [grArtikel-KeyWords] INNER JOIN [grArtikel-KeyWordsToProducts] ON [grArtikel-KeyWords].KeyWordId = [grArtikel-KeyWordsToProducts].KeyWordId " & _
        " WHERE [grArtikel-KeyWordsToProducts].ArtNr=" & artNr  '& _ 
        '" ORDER BY [grArtikel-KeyWords].[Order]"
        'response.write sql
        rs = objConnectionExecute(sql)
        If rs.eOF Then
            html = getTranslation("Es sind gerade keine Informationen &uuml;ber diesen Artikel vorhanden!")
            makeListKeywords = html
            Exit Function
        Else
            html = "<table border=""2"" bordercolor=""#ffffff"" width=""500"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
            html = html & "<tr>"
            html = html & "<th width=""50%"" bgcolor=""#e0e0e0""></th>"
            html = html & "<th width=""50%"" bgcolor=""#ffffff""></th></tr>"

            While Not rs.EOF
                html = html & "<tr><td width=""50%""  bgcolor=""#e0e0e0"">" & Server.HtmlEncode(rs("Name").Value & "") & "&nbsp;</td>"
                html = html & "<td width=""50%"" >" & rs("Value").Value & "&nbsp;</td></tr>"
                rs.movenext()
            End While
            html = html & "</table></center>"
            makeListKeywords = html
        End If
    End Function

    '===============================================================================
    ' get One Eigenschaft (Keyword) Value
    '===============================================================================
    Function getEigenschaft(ByVal artNr, ByVal propertyName)
        Dim SQL As String, rs
        '" [grArtikel-KeyWords].[Order], " & _ 
        SQL = "SELECT [Name], [Value], [ArtNr] " & _
        " FROM [grArtikel-KeyWords] INNER JOIN [grArtikel-KeyWordsToProducts] ON [grArtikel-KeyWords].KeyWordId = [grArtikel-KeyWordsToProducts].KeyWordId " & _
        " WHERE [grArtikel-KeyWordsToProducts].ArtNr=" & artNr & " and [grArtikel-KeyWords].Name Like '" & propertyName & "'"
        '" ORDER BY [grArtikel-KeyWords].[Order]"
        'response.write sql
        getEigenschaft = ""
        rs = objConnectionExecute(SQL)
        If Not rs.eOF Then
            getEigenschaft = rs("Value").Value
        End If
        rs.close()
    End Function





    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="artNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeReviewsPage(ByVal artNr)
        Dim html
        Dim artKatNr : artKatNr = CLng(tablevalue("grArtikel", "ArtNr", artNr, "ArtKatNr"))

        html = html & "<table name=""reviews"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
        html = html & "<tr><td valign=""top"" width=""100%"">"
        'html = html & "<a href="writeReview.aspx?ArtNr=ArtNr">Review verfassen</a> 
 
 
        Dim Sql
        Sql = " SELECT [grArtikel-Reviews].DateCreation, grArtikel.Bezeichnung, [grArtikel-Reviews].Points, " & _
             " [grArtikel-Reviews].Autor, [grArtikel-Reviews].Review, [grArtikel-Reviews].ReviewID, grArtikel.ArtNr " & _
             " FROM grArtikel INNER JOIN [grArtikel-Reviews] ON grArtikel.ArtNr = [grArtikel-Reviews].ArtNR " & _
             " WHERE grArtikel.ArtNr =" & artNr & _
             " ORDER BY [grArtikel-Reviews].DateCreation DESC"

        'Response.Write sql
        Dim rsArtikel, rsTop, inRow
 
        rsTop = objConnectionExecute(Sql)
        If rsTop.BOF And rsTop.EOF Then
            html = getTranslation("Derzeit keine Bewertungen vorhanden.")
            makeReviewsPage = html
            Exit Function
        Else
            While Not rsTop.EOF
                'call drawWindow("Beitrag von " & rsTop("Autor"), "Datum:" & rsTop("DateCreation") & "<br />" & rsTop("Review"),"",butArrEmpty)    
                html = html & drawWindowForum(getTranslation("Beitrag von ") & rsTop("Autor").Value, _
                                               getTranslation("Datum:") & rsTop("DateCreation").Value, _
                                               rsTop("Review").Value, "")
                rsTop.moveNext()
            End While

        End If
        rsTop.close()
        html = html & "</tr></table>"
        makeReviewsPage = html
    End Function


    ''' <summary>
    ''' makeWriteReviewForm
    ''' </summary>
    ''' <param name="ArtNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function makeWriteReviewForm(ByVal ArtNr)
        Dim html : html = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/writeProductReviewForm.htm"))
        If getLOGIN() <> "" Then
            html = Replace(html, "[Autor]", TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email"))
        Else
            html = Replace(html, "[Autor]", "Anonym")
        End If
        html = Replace(html, "[ArtNr]", ArtNr)
        makeWriteReviewForm = html
    End Function

    ''' <summary>
    ''' saveReviewProduct
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function saveReviewProduct()
        Dim ArtNr : ArtNr = Request("ArtNR")
        Dim Sql
        ' call drawErrorBox("Error", "Keine Reviews vorhanden!", "", "")
        If Request("Review") <> "" Then ' the user writes comment
            Sql = "INSERT INTO [grArtikel-Reviews] (Autor, Points, Review, ArtNr, DateCreation)" & _
                  " Values ('" & Request("Autor") & "'," & Request("Points") & ",'" & Request("Review") & "'," & Request("ArtNr") & "," & SQLNOW(0) & ")"
   
            'Response.Write sql: Response.Flush
            objConnectionExecute(Sql)
            Response.Write(getTranslation("Danke! Ihre Kommentare wurden erfolgreich gespeichert!"))
   
            Call addUserPoints(getLOGIN(), COUNT_POINTS_WRITE_REVIEW, REASON_WRITE_REVIEW)
   
            Call addUserPoints(getLOGIN(), COUNT_POINTS_PRODUCT_RATING, REASON_PRODUCT_RATING)
  

        Else
            If Request("Points") <> "" Then ' the user pressed save without writing comment 
                Response.Write( drawErrorBox("Error", "Sie m&uuml;ssen auch ein Kommentar verfassen!", "", ""))
            End If
        End If

    End Function





    '==========================================================================================
    ' creates image html for the product "bewertung" 
    '==========================================================================================
    Function makeBewertungStars(ByVal artNr) As String
        Dim sql As String, rs
        sql = "select avg(Points)as aPoints from [grArtikel-Reviews] where ArtNr=" & artNr & " having count(*) >=3"
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            Dim points As Double
            points = rs("aPoints").Value
            If points - Math.Round(points, 0) <= 0.25 Or Math.Round(points, 0) - points > 0.75 Then
                points = Math.Round(points, 0)
            Else
                points = CInt(points) + 0.5
            End If
            
            Dim imageName : imageName = "" & Replace(Math.Round(points, 1), ".", ",")
            makeBewertungStars = "<img alt=""" & points & " Points"" src=""skins/skin" & SkinNumber & "/images/imagesStars/" & imageName & ".gif"">"
        Else
            makeBewertungStars = ""
        End If
        rs.close()
        rs = Nothing
    
    End Function

    '==========================================================================================
    ' returns count of Bewertungen 
    '==========================================================================================
    Function makeBewertungAnzahl(ByVal artNr) As String
        Dim sql, rs
        makeBewertungAnzahl = 0
        sql = "select count(Points)as aPoints from [grArtikel-Reviews] where ArtNr=" & artNr & " having count(*) >=3"
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            makeBewertungAnzahl = rs("aPoints").Value
        End If
        rs.close()
        rs = Nothing
    End Function

    '==========================================================================
    'this functions is called everytime the product page is shown 
    '==========================================================================
    Function onProductView(ByVal ArtNR)
        Const DAYS_TO_LOOK_BACK As Integer = 3
        If Request("nostats") = "true" Then Exit Function

        Dim sql As String, rs
        sql = "select * from webProductClicks WHERE  ArtNR=" & ArtNR & _
              " and FIRSTCLICK >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK_CLICKS)
   
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            sql = "UPDATE webProductClicks set countClicks = countclicks +1  where ArtNR=" & ArtNR & _
                  " and FIRSTCLICK >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK_CLICKS)
        Else
            sql = "insert into webProductClicks (ArtNR, CountClicks, FirstClick) values(" & ArtNR & ",1," & SQLNOW(0) & ")"
        End If
   
        'response.write sql
        rs.close()
        objConnectionExecute(sql)
   
    End Function



    '==========================================================================
    'this functions is called everytime the product page is shown 
    '==========================================================================
    Function onProductList(ByVal ArtNR)
        
        If Request("nostats") = "true" Then Exit Function
   
        Const DAYS_TO_LOOK_BACK As Integer = 3
        Dim sql As String, rs
        sql = "select ArtNR from webProductLists WHERE  ArtNR=" & ArtNR
        sql = sql & " and FIRSTCLICK >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK_CLICKS)
   
        rs = objConnectionExecute(sql)
        If Not rs.eof Then
            sql = "UPDATE webProductLists set countClicks = countclicks +1  where ArtNR=" & ArtNR & _
                  " and FIRSTCLICK >= " & SQLNOW(-1 * DAYS_TO_LOOK_BACK_CLICKS)
        Else
            sql = "insert into webProductLists (ArtNR, CountClicks, FirstClick) values(" & ArtNR & ",1," & SQLNOW(0) & ")"
        End If
   
        'response.write sql
        rs.close()
        objConnectionExecute(sql)
   
    End Function


    '==========================================================================================
    ' creates short version max 200 Chars for the product description  
    '==========================================================================================
    Function makeBeschreibung(ByVal artNr, ByVal cut)
        Dim Beschreibung
    
        Beschreibung = tablevalue("grArtikel", "ArtNR", artNr, "Beschreibung")
        Beschreibung = getTranslationDok("grArtikel", artNr, "Beschreibung", Beschreibung & "", Language)
        If InStr(UCase(Beschreibung), UCase(TECHINFOCONSTANT)) > 0 Then
            Beschreibung = Left(Beschreibung, InStr(UCase(Beschreibung), UCase(TECHINFOCONSTANT)) - 1)
        Else
            Beschreibung = Beschreibung
        End If

        If InStr(UCase(Beschreibung), UCase(SPECIALCHOICECONSTANT)) > 0 Then
            Beschreibung = Left(Beschreibung, InStr(UCase(Beschreibung), UCase(SPECIALCHOICECONSTANT)) - 1)
        End If

        'Just first Chars 
        If cut And (Len(Beschreibung) > PRODUCT_SHORT_DESCRIPTION_MAX_SIZE) Then
            Beschreibung = Left(Beschreibung, PRODUCT_SHORT_DESCRIPTION_MAX_SIZE) & " ... " & "<a href='?ArtNr=" & artNr & "'>" & getTranslation("mehr") & "</a>"
        End If

        makeBeschreibung = Beschreibung
    End Function

 

</script>

