<script language="VB" runat="server">   
    'Dim CACHE_EXPIRE_TIME_IN_MINUTES : CACHE_EXPIRE_TIME_IN_MINUTES = Application("CACHE_EXPIRE_TIME_IN_MINUTES") 'in 60 minutes the cache will expire and new cache will be created 

    Const TAG_MODE = "[MODE]" 'mode can be CATEGORY, PRODUCT or NONE

    '==============================================================================
    ' BANNERS
    '==============================================================================
    Const TAG_BANNER1 = "[BANNER1]"
    Const TAG_BANNER2 = "[BANNER2]"
    Const TAG_BANNER3 = "[BANNER3]"
    Const TAG_BANNER4 = "[BANNER4]"
    Const TAG_BANNER5 = "[BANNER5]"

    '==============================================================================
    'CATEGORY TAGS 
    '==============================================================================
    Const TAG_CATEGORYNR = "[CATEGORYNR]"
    Const TAG_SUBCATEGORIES = "[SUBCATEGORIES]" 'Yahoo like 
    Const TAG_SUBCATEGORIESTREE = "[SUBCATEGORIESTREE]"
    Const TAG_CATEGORYPATH = "[CATEGORYPATH]"
    Const TAG_CATEGORYPATH_NOLINKS = "[CATEGORYPATH_NOLINKS]"
    Const TAG_CATEGORY_SUBLIST = "[CATEGORY_SUBLIST]"
    Const TAG_CATEGORY_FILTER = "[CATEGORY_FILTER]"
    Const TAG_CATEGORYNAME = "[CATEGORYNAME]"
    Const TAG_SUBCATEGORY_IMAGES = "[SUBCATEGORY_IMAGES]"
    '==============================================================================
    'PRODUCT TAGS 
    '==============================================================================
    Const TAG_TOPPRODUCTS = "[TOPPRODUCTS]"
    Const TAG_TOPPRODUCTS_VERTICAL = "[TOPPRODUCTS_VERTICAL]" 'new 30-09-2004
    Const TAG_TOPPRODUCTS_SELECTED = "[TOPPRODUCTS_SELECTED]"
    Const TAG_TOPPRODUCTS_TYPE = "[TOPPRODUCTS_TYPE" 'usage [TOPPRODUCTS_TYPE:Top5]
    Const TAG_BESTSELLERS = "[BESTSELLERS]"
    Const TAG_VISITED_PRODUCTS = "[VISITED_PRODUCTS]"
    Const TAG_VISITED_PRODUCTS_HORIZONTAL = "[VISITED_PRODUCTS_HORIZONTAL]" 'new 30-09-2004
    Const TAG_MOSTCLICKEDPRODUCTS = "[MOSTCLICKEDPRODUCTS]"
    Const TAG_MOSTCLICKEDCATEGORIES = "[MOSTCLICKEDCATEGORIES]"
    Const TAG_NEW_PRODUCTS = "[NEW_PRODUCTS]"
    Const TAG_FEATUREDMERCHANTS = "[FEATUREDMERCHANTS]"
    Const TAG_REVIEWS = "[REVIEWS]"
    Const TAG_NEWPRICES = "[NEWPRICES]"
    Const TAG_NEWSLETTER = "[NEWSLETTER]"
    Const TAG_PRODUCTLIST = "[PRODUCTLIST]"
    Const TAG_TOOLBAR = "[TOOLBAR]"
    Const TAG_TOPDEAL = "[TOPDEAL]"
    Const TAG_CHEAPPRODUCTS = "[CHEAPPRODUCTS]"

    '==============================================================================
    'PRODUCT 
    '==============================================================================

    Const TAG_SEARCHFORM = "[SEARCHFORM]"
    Const TAG_SIMPLE_SEARCH_FORM = "[SIMPLE_SEARCH_FORM]"
    Const TAG_PRODUCT_CLEARANCE_LIST = "[PRODUCT_CLEARANCE_LIST]"
    Const TAG_PRODUCT_CLEARANCE_ALL = "[PRODUCT_CLEARANCE_ALL]"
    Const TAG_PRODUCT_PRICE_DROPS = "[PRODUCT_PRICE_DROPS]"
    Const TAG_PRODUCT_PRICE_DROPS_ALL = "[PRODUCT_PRICE_DROPS_ALL]"
    Const TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL = "[PRODUCT_MANUFACTURER_DISCOUNT_ALL]"

    '==============================================================================
    'FUNCTION BLOCKS 
    '==============================================================================
    Const TAG_FUNCTION1 = "[FUNCTION1]"
    Const TAG_FUNCTION2 = "[FUNCTION2]"
    Const TAG_FUNCTION3 = "[FUNCTION3]"

    '==============================================================================
    'BASKET 
    '==============================================================================
    Const TAG_BASKET_STATE = "[BASKET_STATE]"
    Const TAG_BASKET_RELATED_PRODUCTS = "[BASKET_RELATED_PRODUCTS]"


    '==============================================================================
    'SESSION AND VARS
    '==============================================================================
    Const TAG_PAGETOSHOW = "[PAGETOSHOW]"
    Const TAG_LAND = "[LAND]"
    Const TAG_SESSION_LAST_SEARCH = "[SESSION_LAST_SEARCH]"
    Const TAG_SESSION_SEARCHES = "[SESSION_SEARCHES]"
    Const TAG_SID = "[SID]"
    Const TAG_COUNT_ONLINE = "[COUNT_ONLINE]"
    Const TAG_LANGUAGE_SELECTION = "[LANGUAGE_SELECTION]"
    Const TAG_LAND_SELECTION = "[LAND_SELECTION]"
    Const TAG_CONTENT_LINKS = "[CONTENT_LINKS]"
    Const TAG_WEB_PAGES_LINKS = "[WEB_PAGES_LINKS]"
    Const TAG_CURRENT_USER = "[CURRENT_USER]"
    Const TAG_LOGOUT_LINK = "[LOGOUT_LINK]"
    Const TAG_USER_LINKS = "[USER_LINKS]"


    '==============================================================================
    'TECHNICAL 
    '==============================================================================
    Const TAG_EMBED = "[EMBED" 'usage: [EMBED:test/function1.htm]
    Const TAG_SQL = "[SQL:<![CDATA[" '[SQL:<![CDATA[select count(*) anz from pricecomparehaendler;]]>]
    Const TAG_SQL_END = "]]>]"
    Const TAG_SQL_SIMPLE = "[SQL_SIMPLE:<![CDATA["
    Const TAG_TRANSLATION = "[TRANSLATION" 'usage: [TRANSLATION:mein Account ist hier zu finden]

    '==============================================================================
    'MISC TAGS
    '==============================================================================
    Const TAG_ECARD_LINK = "[ECARD_LINK]"
    Const TAG_FAQ_LIST = "[FAQ_LIST]"

    'recursive function, searches for the constants above and replaces with the output from functions 
    'returns the parsed template
    Dim priceListIsUsed As Boolean ': priceListIsUsed = false 
    
    Function parseTemplate(ByVal template, ByVal artKatNr) As String
        ObjConnection.close()
        ObjConnection.Open() 'FOR SQL SERVER
        'Response.Write "<br>call " & template
        'Response.Flush
        Dim html As String
  
 
  
        'MODE
        If InStr(template, TAG_MODE) > 0 Then 'Mode
            html = "NONE"
            If artKatNr > 0 Then html = "CATEGORY"
            If artNrToShow > 0 Then html = "PRODUCT"
            parseTemplate = parseTemplate(Replace(template, TAG_MODE, html), artKatNr)
            Exit Function
        End If
  
  
        'TAG_PRODUCTLIST
        If InStr(template, TAG_PRODUCTLIST) > 0 Then 'TAG_PRODUCTLISTrequest
            'html = readTextFile(Server.MapPath("newsletterForm.htm"))
            html = makeProductList(artKatNr)
            If Len(html) > 100 Then 'something meaningfull
                'Response.Write "set priceListIsUsed" 
                priceListIsUsed = True
            End If
            parseTemplate = parseTemplate(Replace(template, TAG_PRODUCTLIST, html), artKatNr)
            Exit Function
        End If
  
        'BANNER 1
        If InStr(template, TAG_BANNER1) > 0 Then 'Banner1 request
            html = makeBanner(artKatNr, 1)
            parseTemplate = parseTemplate(Replace(template, TAG_BANNER1, html), artKatNr)
            Exit Function
        End If
  
        'BANNER 2
        If InStr(template, TAG_BANNER2) > 0 Then 'Banner2 request
            html = makeBanner(artKatNr, 2)
            parseTemplate = parseTemplate(Replace(template, TAG_BANNER2, html), artKatNr)
            Exit Function
        End If
  
        'BANNER 3
        If InStr(template, TAG_BANNER3) > 0 Then 'Banner3 request
            html = makeBanner(artKatNr, 3)
            parseTemplate = parseTemplate(Replace(template, TAG_BANNER3, html), artKatNr)
            Exit Function
        End If

        'BANNER 4
        If InStr(template, TAG_BANNER4) > 0 Then 'Banner4 request
            html = makeBanner(artKatNr, 4)
            parseTemplate = parseTemplate(Replace(template, TAG_BANNER4, html), artKatNr)
            Exit Function
        End If
  
        'BANNER 5
        If InStr(template, TAG_BANNER5) > 0 Then 'Banner5 request
            html = makeBanner(artKatNr, 5)
            parseTemplate = parseTemplate(Replace(template, TAG_BANNER5, html), artKatNr)
            Exit Function
        End If
  
  
        'TAG_SUBCATEGORIES 
        If InStr(template, TAG_SUBCATEGORIES) > 0 Then 'TAG_SUBCATEGORIES request
            Dim title
            title = "Categories:<font color=""white"">" & Mid(showCategoryPath(artKatNr, "default.aspx"), 1) & "</font>"
            'html =  drawAreaHTML(title, makeSubcategories(artKatNr,2),"", 600)
            html = makeSubcategoriesFromCache(artKatNr, 2)
            parseTemplate = parseTemplate(Replace(template, TAG_SUBCATEGORIES, html), artKatNr)
            Exit Function
        End If
  
        'TAG_SUBCATEGORIESTREE 
        If InStr(template, TAG_SUBCATEGORIESTREE) > 0 Then 'TAG_SUBCATEGORIES request    
            Title = "Categories:<font color=""white"">" & Mid(showCategoryPath(artKatNr, "default.aspx"), 1) & "</font>"
            'html =  drawAreaHTML(title, makeSubcategories(artKatNr,2),"", 600)
            html = makeCategoriesTreeFromCache(artKatNr, 2, "", "")
            parseTemplate = parseTemplate(Replace(template, TAG_SUBCATEGORIESTREE, html), artKatNr)
            Exit Function
        End If
 
        'TAG_CATEGORYNR
        If InStr(template, TAG_CATEGORYNR) > 0 Then 'TAG_CATEGORYNR request
            html = artKatNr
            parseTemplate = parseTemplate(Replace(template, TAG_CATEGORYNR, html), artKatNr)
            Exit Function
        End If
  
        'TAG_CATEGORYPATH 
        If InStr(template, TAG_CATEGORYPATH) > 0 Then 'TAG_CATEGORYPATH request
            html = showCategoryPathFromCache(artKatNr, "default.aspx")
            parseTemplate = parseTemplate(Replace(template, TAG_CATEGORYPATH, html), artKatNr)
            Exit Function
        End If

        'TAG_CATEGORYPATH_NOLINKS
        If InStr(template, TAG_CATEGORYPATH_NOLINKS) > 0 Then 'TAG_CATEGORYPATH_NOLINKS request
            html = showCategoryPathNoLinks(artKatNr, "default.aspx")
            parseTemplate = parseTemplate(Replace(template, TAG_CATEGORYPATH_NOLINKS, html), artKatNr)
            Exit Function
        End If
  
        'TAG_CATEGORYNAME
        If InStr(template, TAG_CATEGORYNAME) > 0 Then 'TAG_CATEGORYNAME request
            html = showCategoryName(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_CATEGORYNAME, html), artKatNr)
            Exit Function
        End If
  
        'TAG_CATEGORY_SUBLIST
        If InStr(template, TAG_CATEGORY_SUBLIST) > 0 Then 'TAG_CATEGORY_SUBLIST request
            html = SimpleListCategoriesFromCache(artKatNr, "default.aspx")
            parseTemplate = parseTemplate(Replace(template, TAG_CATEGORY_SUBLIST, html), artKatNr)
            Exit Function
        End If
  
        'TAG_CATEGORY_FILTER
        If InStr(template, TAG_CATEGORY_FILTER) > 0 Then 'TAG_CATEGORY_FILTER request
            html = createSearchForm(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_CATEGORY_FILTER, html), artKatNr)
            Exit Function
        End If
  
        'TAG_SUBCATEGORY_IMAGES
        If InStr(template, TAG_SUBCATEGORY_IMAGES) > 0 Then 'TAG_SUBCATEGORY_IMAGES request
            html = makeSubcategoriesPicturePages(artKatNr, "default.aspx")
            parseTemplate = parseTemplate(Replace(template, TAG_SUBCATEGORY_IMAGES, html), artKatNr)
            Exit Function
        End If
  
 
        'TAG_SEARCHFORM
        If InStr(template, TAG_SEARCHFORM) > 0 Then 'TAG_SEARCHFORM request
            Dim formName : formName = getTranslation("Suche in") & " " & TableValue("[grArtikel-Kategorien]", "artKatNr", artKatNr, "Name")
            html = drawAreaHTML_WithImage(formName, createSearchForm(artKatNr), "Suchen Sie hier", 300, Session("Basename") & "/images/windows/produktsuche.gif")
            parseTemplate = parseTemplate(Replace(template, TAG_SEARCHFORM, html), artKatNr)
            Exit Function
        End If
 
        'TAG_TOPPRODUCTS
        If InStr(template, TAG_TOPPRODUCTS) > 0 Then 'TAG_TOPPRODUCTSrequest
            html = TopCatProductsTwoInRowFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_TOPPRODUCTS, html), artKatNr)
            Exit Function
        End If
 
        'TAG_TOPPRODUCTS_VERTICAL
        If InStr(template, TAG_TOPPRODUCTS_VERTICAL) > 0 Then 'TAG_TOPPRODUCTSrequest
            html = TopCatProductsVerticalFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_TOPPRODUCTS_VERTICAL, html), artKatNr)
            Exit Function
        End If
 
        'TAG_TOPPRODUCTS_SELECTED
        If InStr(template, TAG_TOPPRODUCTS_SELECTED) > 0 Then 'TAG_TOPPRODUCTSrequest
            html = TopCatProductsFromCache(artKatNr, "*")
            parseTemplate = parseTemplate(Replace(template, TAG_TOPPRODUCTS_SELECTED, html), artKatNr)
            Exit Function
        End If


        'TAG_TOPPRODUCTS_TYPE
        If InStr(template, TAG_TOPPRODUCTS_TYPE) > 0 Then 'TAG_TOPPRODUCTSrequest
  
            Dim nextBracketPos1 : nextBracketPos1 = InStr(InStr(template, TAG_TOPPRODUCTS_TYPE), template, "]")
            Dim typ : typ = Mid(template, InStr(template, TAG_TOPPRODUCTS_TYPE) + Len(TAG_TOPPRODUCTS_TYPE) + 1, -(Len(TAG_TOPPRODUCTS_TYPE) + 1) + nextBracketPos1 - InStr(template, TAG_TOPPRODUCTS_TYPE))
            Dim TAG_TOPPRODUCTS_TYPE_FULL : TAG_TOPPRODUCTS_TYPE_FULL = TAG_TOPPRODUCTS_TYPE & ":" & typ & "]"
            'Response.Write "TAG_TOPPRODUCTS_TYPE_FULL=" & TAG_TOPPRODUCTS_TYPE_FULL
            html = TopCatProductsFromCache(artKatNr, typ)
            parseTemplate = parseTemplate(Replace(template, TAG_TOPPRODUCTS_TYPE_FULL, html), artKatNr)
            Exit Function
        End If
  
   
        'TAG_BESTSELLERS
        If InStr(template, TAG_BESTSELLERS) > 0 Then 'TAG_BESTSELLERS
            html = statisticBestsellersFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_BESTSELLERS, html), artKatNr)
            Exit Function
        End If
  
        ' TODO: statisticTopClicksList is very slow 
        'TAG_MOSTCLICKEDPRODUCTS
        If InStr(template, TAG_MOSTCLICKEDPRODUCTS) > 0 Then 'TAG_MOSTCLICKEDPRODUCTS request
            'html = drawAreaHTML_WithImage("Most clicked products", statisticTopClicks(artKatNr),"", 300,"../images/windows/mostclickedproducts.jpg")
            html = statisticTopClicksListFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_MOSTCLICKEDPRODUCTS, html), artKatNr)
            Exit Function
        End If
        'exit function   
    
        'TAG_CHEAPPRODUCTS
        If InStr(template, TAG_CHEAPPRODUCTS) > 0 Then 'TAG_CHEAPPRODUCTS request
            html = "statisticCheapProductsFromCache(artKatNr)" ' TODO not existing 
            parseTemplate = parseTemplate(Replace(template, TAG_CHEAPPRODUCTS, html), artKatNr)
            Exit Function
        End If
  
  
        'TAG_MOSTCLICKEDCATEGORIES
        If InStr(template, TAG_MOSTCLICKEDCATEGORIES) > 0 Then 'TAG_MOSTCLICKEDCATEGORIES request     
            'response.Write "Parse TAG_MOSTCLICKEDCATEGORIES"
            html = statisticTopClicksOnCategoryCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_MOSTCLICKEDCATEGORIES, html), artKatNr)
            Exit Function
        End If
    
        'TAG_FEATUREDMERCHANTS
        If InStr(template, TAG_FEATUREDMERCHANTS) > 0 Then 'TAG_FEATUREDMERCHANTSrequest
            html = showFeaturedMerchants(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_FEATUREDMERCHANTS, html), artKatNr)
            Exit Function
        End If

        'TAG_REVIEWS
        If InStr(template, TAG_REVIEWS) > 0 Then 'TAG_SUBCATEGORIES request
            html = "printNewReviewsFromCache(artKatNr)" ' TODO implement
            parseTemplate = parseTemplate(Replace(template, TAG_REVIEWS, html), artKatNr)
            Exit Function
        End If
  
        'TAG_NEWPRICES
        If InStr(template, TAG_NEWPRICES) > 0 Then 'TAG_NEWPRICES request
            html = statisticLatestPricesCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_NEWPRICES, html), artKatNr)
            Exit Function
        End If
   
        'TAG_NEWSLETTER
        If InStr(template, TAG_NEWSLETTER) > 0 Then 'TAG_NEWSLETTER request
            html = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/newsletterForm.htm"))
            parseTemplate = parseTemplate(Replace(template, TAG_NEWSLETTER, html), artKatNr)
            Exit Function
        End If
  
  
        'TAG_TOOLBAR
        If InStr(template, TAG_TOOLBAR) > 0 Then 'TAG_TOOLBAR
            html = makeToolbar(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_TOOLBAR, html), artKatNr)
            Exit Function
        End If

        'TAG_TOPDEAL
        If InStr(template, TAG_TOPDEAL) > 0 Then 'TAG_TOPDEAL
            html = makeTopDealFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_TOPDEAL, html), artKatNr)
            Exit Function
        End If
  
  
  
        Dim filepath
        'TAG_FUNCTION1
        If InStr(template, TAG_FUNCTION1) > 0 Then 'TAG_FUNCTION1
            filepath = Replace(Mid(Skin, 2), "/", "\") & "\pages\function1.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_FUNCTION1, html), artKatNr)
            Exit Function
        End If
  
        'TAG_FUNCTION2
        If InStr(template, TAG_FUNCTION2) > 0 Then 'TAG_FUNCTION1
            filepath = Replace(Mid(Skin, 2), "/", "\") & "\pages\function2.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_FUNCTION2, html), artKatNr)
            Exit Function
        End If
    
        'TAG_FUNCTION3
        If InStr(template, TAG_FUNCTION3) > 0 Then 'TAG_FUNCTION1
            filepath = Replace(Mid(Skin, 2), "/", "\") & "\pages\function3.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_FUNCTION3, html), artKatNr)
            Exit Function
        End If
  
        'TAG_LANGUAGE_SELECTION
        If InStr(template, TAG_LANGUAGE_SELECTION) > 0 Then 'TAG_LANGUAGE_SELECTION
            filepath = "skins/skin" & SkinNumber & "/pages/languageSelection.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_LANGUAGE_SELECTION, html), artKatNr)
            Exit Function
        End If
  
        'TAG_LAND_SELECTION
        If InStr(template, TAG_LAND_SELECTION) > 0 Then 'TAG_LAND_SELECTION
            filepath = "skins/skin" & SkinNumber & "/pages/landSelection.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_LAND_SELECTION, html), artKatNr)
            Exit Function
        End If
  
        'TAG_CONTENT_LINKS
        If InStr(template, TAG_CONTENT_LINKS) > 0 Then 'TAG_LANGUAGE_SELECTION
            filepath = "skins/skin" & SkinNumber & "/pages/contentLinks.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_CONTENT_LINKS, html), artKatNr)
            Exit Function
        End If
  
 
        'TAG_SIMPLE_SEARCH_FORM
        If InStr(template, TAG_SIMPLE_SEARCH_FORM) > 0 Then 'TAG_LANGUAGE_SELECTION
            filepath = "skins/skin" & SkinNumber & "/pages/simpleSearchForm.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_SIMPLE_SEARCH_FORM, html), artKatNr)
            Exit Function
        End If
 

        'TAG_LAND
        If InStr(template, TAG_LAND) > 0 Then 'TAG_LAND     
            If land & "" = "" Then
                Response.Write("Cannot replace TAG_LAND in tempalte because Land is null!")
            Else
                parseTemplate = parseTemplate(Replace(template, TAG_LAND, land), artKatNr)
            End If
            Exit Function
        End If

 
        'TAG_USER_LINKS
        If InStr(template, TAG_USER_LINKS) > 0 Then 'TAG_LANGUAGE_SELECTION
            filepath = "skins/skin" & SkinNumber & "/pages/usermenu.htm"
            html = readTextFile(Server.MapPath(filepath))
            parseTemplate = parseTemplate(Replace(template, TAG_USER_LINKS, html), artKatNr)
            Exit Function
        End If
    
        'TAG_WEB_PAGES_LINKS
        If InStr(template, TAG_WEB_PAGES_LINKS) > 0 Then 'TAG_LANGUAGE_SELECTION
            html = listWebPagesLinksFromCache()
            parseTemplate = parseTemplate(Replace(template, TAG_WEB_PAGES_LINKS, html), artKatNr)
            Exit Function
        End If
   
        'TAG_CURRENT_USER
        If InStr(template, TAG_CURRENT_USER) > 0 Then 'TAG_CURRENT_USER
            If getLOGIN() > 0 Then
                html = TABLEVALUE("ofAdressen", "IDNR", getLOGIN(), "Email")
            Else
                html = ""
            End If
            parseTemplate = parseTemplate(Replace(template, TAG_CURRENT_USER, html), artKatNr)
            Exit Function
        End If
    
        'TAG_LOGOUT_LINK
        If InStr(template, TAG_LOGOUT_LINK) > 0 Then 'TAG_LOGOUT_LINK
            If getLOGIN() > 0 Then
                html = "<a href='cgi/account/logout.aspx'><img border=0 src='" & imageFullName("logout.gif") & "' alt='LOGIN'></a>"
            Else
                html = "<a href='default.aspx?pagetoshow=MyAccount'><img border=0 src='" & imageFullName("login.gif") & "' alt='LOGOUT'></a>"
            End If
            parseTemplate = parseTemplate(Replace(template, TAG_LOGOUT_LINK, html), artKatNr)
            Exit Function
        End If
   
  
        'TAG_PRODUCT_CLEARANCE_LIST
        If InStr(template, TAG_PRODUCT_CLEARANCE_LIST) > 0 Then
            html = statisticClearanceCenterFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_PRODUCT_CLEARANCE_LIST, html), artKatNr)
            Exit Function
        End If
 
        'TAG_PRODUCT_CLEARANCE_ALL
        If InStr(template, TAG_PRODUCT_CLEARANCE_ALL) > 0 Then
            html = statisticClearanceCenterAll(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_PRODUCT_CLEARANCE_ALL, html), artKatNr)
            Exit Function
        End If

        'TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL
        If InStr(template, TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL) > 0 Then
            html = statisticProductsManufacturerDiscount(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL, html), artKatNr)
            Exit Function
        End If
    
 
        'TAG_PRODUCT_PRICE_DROPS
        If InStr(template, TAG_PRODUCT_PRICE_DROPS) > 0 Then
            html = statisticPriceDropsFromCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_PRODUCT_PRICE_DROPS, html), artKatNr)
            Exit Function
        End If

        'TAG_PRODUCT_PRICE_DROPS_ALL
        If InStr(template, TAG_PRODUCT_PRICE_DROPS_ALL) > 0 Then
            html = statisticPriceDropsAll(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_PRODUCT_PRICE_DROPS_ALL, html), artKatNr)
            Exit Function
        End If
     
          
        'TAG_BASKET_STATE
        If InStr(template, TAG_BASKET_STATE) > 0 Then
            html = showBasket()
            parseTemplate = parseTemplate(Replace(template, TAG_BASKET_STATE, html), artKatNr)
            Exit Function
        End If
     
        'TAG_PAGETOSHOW
        If InStr(template, TAG_PAGETOSHOW) > 0 Then
            html = getTranslation(pageToShow)
            parseTemplate = parseTemplate(Replace(template, TAG_PAGETOSHOW, html), artKatNr)
            Exit Function
        End If

        'TAG_SID
        If InStr(template, TAG_SID) > 0 Then
            html = getSID()
            parseTemplate = parseTemplate(Replace(template, TAG_SID, html), artKatNr)
            Exit Function
        End If
    
            
        'TAG_BASKET_RELATED_PRODUCTS
        If InStr(template, TAG_BASKET_RELATED_PRODUCTS) > 0 Then
            html = makeRelatedArtikelListForWarenkorb()
            parseTemplate = parseTemplate(Replace(template, TAG_BASKET_RELATED_PRODUCTS, html), artKatNr)
            Exit Function
        End If

        'TAG_VISITED_PRODUCTS
        If InStr(template, TAG_VISITED_PRODUCTS) > 0 Then
            html = listUserVisitedProducts()
            parseTemplate = parseTemplate(Replace(template, TAG_VISITED_PRODUCTS, html), artKatNr)
            Exit Function
        End If


        'TAG_VISITED_PRODUCTS_HORIZONTAL
        If InStr(template, TAG_VISITED_PRODUCTS_HORIZONTAL) > 0 Then
            html = listUserVisitedProductsHorizontal()
            parseTemplate = parseTemplate(Replace(template, TAG_VISITED_PRODUCTS_HORIZONTAL, html), artKatNr)
            Exit Function
        End If
    
        'TAG_NEW_PRODUCTS
        If InStr(template, TAG_NEW_PRODUCTS) > 0 Then
            html = statisticNewProductsCache(artKatNr)
            parseTemplate = parseTemplate(Replace(template, TAG_NEW_PRODUCTS, html), artKatNr)
            Exit Function
        End If


        'TAG_FAQ_LIST
        If InStr(template, TAG_FAQ_LIST) > 0 Then
            html = showFAQList(pageToShow)
            parseTemplate = parseTemplate(Replace(template, TAG_FAQ_LIST, html), artKatNr)
            Exit Function
        End If
    
   
   
        'TAG_SESSION_SEARCHES
        If InStr(template, TAG_SESSION_SEARCHES) > 0 Then
            html = ListUserSearches()
            parseTemplate = parseTemplate(Replace(template, TAG_SESSION_SEARCHES, html), artKatNr)
            Exit Function
        End If
 
        'TAG_SESSION_LAST_SEARCH
        If InStr(template, TAG_SESSION_LAST_SEARCH) > 0 Then
            html = ListUserLastSearch()
            parseTemplate = parseTemplate(Replace(template, TAG_SESSION_LAST_SEARCH, html), artKatNr)
            Exit Function
        End If
    
    
    
    
        Dim nextBracketPos
        Dim TAG_EMBED_FULL
             
        'TAG_EMBED
        If InStr(template, TAG_EMBED) > 0 Then
            nextBracketPos = InStr(InStr(template, TAG_EMBED), template, "]")
            Dim embededFilename : embededFilename = Mid(template, InStr(template, TAG_EMBED) + Len(TAG_EMBED) + 1, -7 + nextBracketPos - InStr(template, TAG_EMBED))
            TAG_EMBED_FULL = TAG_EMBED & ":" & embededFilename & "]"
            'Response.Write "nextBracketPos:" & nextBracketPos:Response.Flush
            'Response.Write "firstBracket:" & InStr(template, TAG_EMBED):Response.Flush
            'Response.Write "embededFilename:" & embededFilename:Response.Flush
     
            filepath = "skins/skin" & SkinNumber & "/pages/" & embededFilename
            'Response.Write "filepath:" & filepath:Response.Flush
            On Error Resume Next
            html = readTextFile(Server.MapPath(filepath))
     
            If Err.Number > 0 Then
                'Response.Write "<p style='error'>File is missing:" & filepath  & "</p>"
            End If
            On Error GoTo 0
     
            parseTemplate = parseTemplate(Replace(template, TAG_EMBED_FULL, html), artKatNr)
            Exit Function
        End If
   
        'TRANSLATION 
        Dim TAG_TRANSLATION_FULL
             


        'TAG_TRANSLATION
        If InStr(template, TAG_TRANSLATION) > 0 Then
            
            nextBracketPos = InStr(InStr(template, TAG_TRANSLATION), template, "]")
            Dim textToTranslate : textToTranslate = Mid(template, InStr(template, TAG_TRANSLATION) + Len(TAG_TRANSLATION) + 1, -13 + nextBracketPos - InStr(template, TAG_TRANSLATION))
            TAG_TRANSLATION_FULL = TAG_TRANSLATION & ":" & textToTranslate & "]"
            html = getTranslation(textToTranslate)
            'Response.Write "TAG_TRANSLATION_FULL:" & TAG_TRANSLATION_FULL & "<br/>"
            'Response.Write "html:" & html & "<br/>"
            parseTemplate = parseTemplate(Replace(template, TAG_TRANSLATION_FULL, html), artKatNr)
            Exit Function
        End If
   
        'TAG_COUNT_ONLINE
        If InStr(template, TAG_COUNT_ONLINE) > 0 Then
            html = Application("useronline")
            parseTemplate = parseTemplate(Replace(template, TAG_COUNT_ONLINE, html), artKatNr)
            Exit Function
        End If
    
  
     
        'ADD TAGS FROM USER TEMPLATE 
        parseTemplate = parseTemplateUser(template)
   
   
        'ADD TAGS FROM PRODUCT TEMPLATES 
        If Request("ArtNr") <> "" Then
            parseTemplate = makeProductPageWithTemplate(Request("ArtNr"), template)
        End If
   
        Dim embededSQL
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
            parseTemplate = parseTemplate(Replace(template, TAG_EMBED_FULL, html), artKatNr)
            Exit Function
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
            parseTemplate = parseTemplate(Replace(template, TAG_EMBED_FULL, html), artKatNr)
            Exit Function
        End If
        
        'TAG_ECARD_LINK
   
        If InStr(template, TAG_ECARD_LINK) > 0 Then
            'response.Write "Found TAG_ECARD_LINK"
            parseTemplate = parseTemplate(Replace(template, TAG_ECARD_LINK, "default.aspx?PageToShow=Ecard"), artKatNr)
            Exit Function
        End If
        
        
    
        template = fixRelativeImageLinks(template)

        parseTemplate = template 'leave recursion
    End Function

    'replace the '../images tag with the fill images link 
    Function fixRelativeImageLinks(ByVal template)
        Const IMAGES_RELATIVE_LINK = "../images"
        Const PRODUCTIMAGES_RELATIVE_LINK = "../productImages"
     
        Dim images_full_link : images_full_link = "skins/skin" & varvalue("SKINNUMBER") & "/images"
        Dim productimages_full_link : productimages_full_link = "skins/skin" & varvalue("SKINNUMBER") & "/productImages"
     
        Dim full
        full = Replace(template, IMAGES_RELATIVE_LINK, images_full_link)
        full = Replace(full, PRODUCTIMAGES_RELATIVE_LINK, productimages_full_link)
     
     
        fixRelativeImageLinks = full
    End Function

</script>

