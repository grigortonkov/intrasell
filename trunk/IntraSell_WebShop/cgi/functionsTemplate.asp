<%
'Dim CACHE_EXPIRE_TIME_IN_MINUTES : CACHE_EXPIRE_TIME_IN_MINUTES = Application("CACHE_EXPIRE_TIME_IN_MINUTES") 'in 60 minutes the cache will expire and new cache will be created 

const TAG_MODE = "[MODE]" 'mode can be CATEGORY, PRODUCT or NONE

'==============================================================================
' BANNERS
'==============================================================================
const TAG_BANNER1 = "[BANNER1]"
const TAG_BANNER2 = "[BANNER2]"
const TAG_BANNER3 = "[BANNER3]"
const TAG_BANNER4 = "[BANNER4]"
const TAG_BANNER5 = "[BANNER5]"

'==============================================================================
'CATEGORY TAGS 
'==============================================================================
const TAG_CATEGORYNR = "[CATEGORYNR]"
const TAG_SUBCATEGORIES = "[SUBCATEGORIES]" 'Yahoo like 
const TAG_SUBCATEGORIESTREE = "[SUBCATEGORIESTREE]"
const TAG_CATEGORYPATH = "[CATEGORYPATH]"
const TAG_CATEGORYPATH_NOLINKS = "[CATEGORYPATH_NOLINKS]"
const TAG_CATEGORY_SUBLIST = "[CATEGORY_SUBLIST]"
const TAG_CATEGORY_FILTER = "[CATEGORY_FILTER]"
const TAG_CATEGORYNAME = "[CATEGORYNAME]"
const TAG_SUBCATEGORY_IMAGES = "[SUBCATEGORY_IMAGES]"
'==============================================================================
'PRODUCT TAGS 
'==============================================================================
const TAG_TOPPRODUCTS = "[TOPPRODUCTS]"
const TAG_TOPPRODUCTS_VERTICAL = "[TOPPRODUCTS_VERTICAL]" 'new 30-09-2004
const TAG_TOPPRODUCTS_SELECTED = "[TOPPRODUCTS_SELECTED]"
const TAG_TOPPRODUCTS_TYPE = "[TOPPRODUCTS_TYPE" 'usage [TOPPRODUCTS_TYPE:Top5]
const TAG_BESTSELLERS = "[BESTSELLERS]"
const TAG_VISITED_PRODUCTS = "[VISITED_PRODUCTS]"
const TAG_VISITED_PRODUCTS_HORIZONTAL = "[VISITED_PRODUCTS_HORIZONTAL]" 'new 30-09-2004
const TAG_MOSTCLICKEDPRODUCTS = "[MOSTCLICKEDPRODUCTS]"
const TAG_MOSTCLICKEDCATEGORIES = "[MOSTCLICKEDCATEGORIES]"
const TAG_NEW_PRODUCTS = "[NEW_PRODUCTS]"
const TAG_FEATUREDMERCHANTS = "[FEATUREDMERCHANTS]"
const TAG_REVIEWS = "[REVIEWS]"
const TAG_NEWPRICES = "[NEWPRICES]"
const TAG_NEWSLETTER = "[NEWSLETTER]"
const TAG_PRODUCTLIST = "[PRODUCTLIST]"
const TAG_TOOLBAR = "[TOOLBAR]"
const TAG_TOPDEAL = "[TOPDEAL]"
const TAG_CHEAPPRODUCTS = "[CHEAPPRODUCTS]"

'==============================================================================
'PRODUCT 
'==============================================================================

const TAG_SEARCHFORM = "[SEARCHFORM]"
const TAG_SIMPLE_SEARCH_FORM = "[SIMPLE_SEARCH_FORM]"
const TAG_PRODUCT_CLEARANCE_LIST = "[PRODUCT_CLEARANCE_LIST]"
const TAG_PRODUCT_CLEARANCE_ALL = "[PRODUCT_CLEARANCE_ALL]"
const TAG_PRODUCT_PRICE_DROPS = "[PRODUCT_PRICE_DROPS]"
const TAG_PRODUCT_PRICE_DROPS_ALL = "[PRODUCT_PRICE_DROPS_ALL]"
const TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL = "[PRODUCT_MANUFACTURER_DISCOUNT_ALL]"

'==============================================================================
'FUNCTION BLOCKS 
'==============================================================================
const TAG_FUNCTION1 = "[FUNCTION1]"
const TAG_FUNCTION2 = "[FUNCTION2]"
const TAG_FUNCTION3 = "[FUNCTION3]"

'==============================================================================
'BASKET 
'==============================================================================
const TAG_BASKET_STATE = "[BASKET_STATE]"
const TAG_BASKET_RELATED_PRODUCTS = "[BASKET_RELATED_PRODUCTS]"


'==============================================================================
'SESSION AND VARS
'==============================================================================
const TAG_PAGETOSHOW = "[PAGETOSHOW]"
const TAG_LAND = "[LAND]"
Const TAG_SESSION_LAST_SEARCH = "[SESSION_LAST_SEARCH]"
Const TAG_SESSION_SEARCHES= "[SESSION_SEARCHES]"
const TAG_SID = "[SID]"
const TAG_COUNT_ONLINE = "[COUNT_ONLINE]"
const TAG_LANGUAGE_SELECTION = "[LANGUAGE_SELECTION]"
const TAG_LAND_SELECTION = "[LAND_SELECTION]"
const TAG_CONTENT_LINKS = "[CONTENT_LINKS]"
const TAG_WEB_PAGES_LINKS = "[WEB_PAGES_LINKS]"
const TAG_CURRENT_USER = "[CURRENT_USER]"
const TAG_LOGOUT_LINK = "[LOGOUT_LINK]"
const TAG_USER_LINKS = "[USER_LINKS]"


'==============================================================================
'TECHNICAL 
'==============================================================================
const TAG_EMBED = "[EMBED" 'usage: [EMBED:test/function1.htm]
const TAG_SQL = "[SQL:<![CDATA[" '[SQL:<![CDATA[select count(*) anz from pricecomparehaendler;]]>]
const TAG_SQL_END = "]]>]"
const TAG_SQL_SIMPLE = "[SQL_SIMPLE:<![CDATA["
const TAG_TRANSLATION = "[TRANSLATION" 'usage: [TRANSLATION:mein Account ist hier zu finden]

'==============================================================================
'MISC TAGS
'==============================================================================
Const TAG_ECARD_LINK = "[ECARD_LINK]"
const TAG_FAQ_LIST = "[FAQ_LIST]"

'recursive function, searches for the constants above and replaces with the output from functions 
'returns the parsed template
Dim priceListIsUsed: priceListIsUsed = false 
function parseTemplate(byVal template, byVal artKatNr)
  ObjConnection.close
  ObjConnection.Open 'FOR SQL SERVER
  'Response.Write "<br>call " & template
  'Response.Flush
  dim html
  
 
  
  'MODE
  if InStr(template, TAG_MODE) > 0 then 'Mode
    html = "NONE"
    if ArtKatNr > 0 then  html = "CATEGORY"
    if artNrToShow > 0 then html = "PRODUCT"
     parseTemplate = parseTemplate(replace(template,TAG_MODE,html), artKatNr)
     exit function 
  end if 
  
  
    'TAG_PRODUCTLIST
  if InStr(template, TAG_PRODUCTLIST) > 0 then 'TAG_PRODUCTLISTrequest
    'html = readTextFile(Server.MapPath("newsletterForm.htm"))
     html = makeProductList(artKatNr)
     if len(html)>100 then 'something meaningfull
        'Response.Write "set priceListIsUsed" 
        priceListIsUsed = true 
     end if 
        parseTemplate = parseTemplate(replace(template, TAG_PRODUCTLIST, html), artKatNr)
     exit function 
  end if 
  
  'BANNER 1
  if InStr(template, TAG_BANNER1) > 0 then 'Banner1 request
     html = makeBanner(artKatNr,1)
     parseTemplate = parseTemplate(replace(template,TAG_BANNER1,html), artKatNr)
     exit function 
  end if 
  
  'BANNER 2
  if InStr(template, TAG_BANNER2) > 0 then 'Banner2 request
     html = makeBanner(artKatNr,2)
     parseTemplate = parseTemplate(replace(template,TAG_BANNER2,html), artKatNr)
     exit function 
  end if 
  
  'BANNER 3
  if InStr(template, TAG_BANNER3) > 0 then 'Banner3 request
     html = makeBanner(artKatNr,3)
     parseTemplate = parseTemplate(replace(template,TAG_BANNER3,html), artKatNr)
     exit function 
  end if 

  'BANNER 4
  if InStr(template, TAG_BANNER4) > 0 then 'Banner4 request
     html = makeBanner(artKatNr,4)
     parseTemplate = parseTemplate(replace(template,TAG_BANNER4,html), artKatNr)
     exit function 
  end if 
  
  'BANNER 5
  if InStr(template, TAG_BANNER5) > 0 then 'Banner5 request
     html = makeBanner(artKatNr,5)
     parseTemplate = parseTemplate(replace(template,TAG_BANNER5,html), artKatNr)
     exit function 
  end if 
  
  
  'TAG_SUBCATEGORIES 
  if InStr(template, TAG_SUBCATEGORIES) > 0 then 'TAG_SUBCATEGORIES request
    Dim title
     title = "Categories:<font color=""white"">"& mid(showCategoryPath(artKatNr,"default.asp"),1) & "</font>"
     'html =  drawAreaHTML(title, makeSubcategories(artKatNr,2),"", 600)
     html =   makeSubcategoriesFromCache(artKatNr,2)
     parseTemplate = parseTemplate(replace(template,TAG_SUBCATEGORIES,html), artKatNr)
     exit function 
  end if 
  
  'TAG_SUBCATEGORIESTREE 
  if InStr(template, TAG_SUBCATEGORIESTREE) > 0 then 'TAG_SUBCATEGORIES request    
     title = "Categories:<font color=""white"">"& mid(showCategoryPath(artKatNr,"default.asp"),1) & "</font>"
     'html =  drawAreaHTML(title, makeSubcategories(artKatNr,2),"", 600)
     html =   makeCategoriesTreeFromCache(artKatNr,2,"","")
     parseTemplate = parseTemplate(replace(template,TAG_SUBCATEGORIESTREE,html), artKatNr)
     exit function 
  end if   
 
  'TAG_CATEGORYNR
  if InStr(template, TAG_CATEGORYNR) > 0 then 'TAG_CATEGORYNR request
     html = artkatnr
     parseTemplate = parseTemplate(replace(template,TAG_CATEGORYNR,html), artKatNr)
     exit function 
  end if 
  
  'TAG_CATEGORYPATH 
  if InStr(template, TAG_CATEGORYPATH) > 0 then 'TAG_CATEGORYPATH request
     html = showCategoryPathFromCache(artKatNr,"default.asp")
     parseTemplate = parseTemplate(replace(template,TAG_CATEGORYPATH,html), artKatNr)
     exit function 
  end if 

  'TAG_CATEGORYPATH_NOLINKS
  if InStr(template, TAG_CATEGORYPATH_NOLINKS) > 0 then 'TAG_CATEGORYPATH_NOLINKS request
     html = showCategoryPathNoLinks(artKatNr,"default.asp")
     parseTemplate = parseTemplate(replace(template,TAG_CATEGORYPATH_NOLINKS,html), artKatNr)
     exit function 
  end if 
  
  'TAG_CATEGORYNAME
  if InStr(template, TAG_CATEGORYNAME) > 0 then 'TAG_CATEGORYNAME request
     html = showCategoryName(artKatNr)
     parseTemplate = parseTemplate(replace(template,TAG_CATEGORYNAME,html), artKatNr)
     exit function 
  end if 
  
    'TAG_CATEGORY_SUBLIST
  if InStr(template, TAG_CATEGORY_SUBLIST) > 0 then 'TAG_CATEGORY_SUBLIST request
     html = SimpleListCategoriesFromCache(artKatNr,"default.asp")
     parseTemplate = parseTemplate(replace(template,TAG_CATEGORY_SUBLIST,html), artKatNr)
     exit function 
  end if 
  
    'TAG_CATEGORY_FILTER
  if InStr(template, TAG_CATEGORY_FILTER) > 0 then 'TAG_CATEGORY_FILTER request
     html = createSearchForm(artKatNr)
     parseTemplate = parseTemplate(replace(template,TAG_CATEGORY_FILTER,html), artKatNr)
     exit function 
  end if   
  
  'TAG_SUBCATEGORY_IMAGES
  if InStr(template, TAG_SUBCATEGORY_IMAGES) > 0 then 'TAG_SUBCATEGORY_IMAGES request
     html = makeSubcategoriesPicturePages(artKatNr,"default.asp")
     parseTemplate = parseTemplate(replace(template,TAG_SUBCATEGORY_IMAGES, html), artKatNr)
     exit function 
  end if   
  
 
  'TAG_SEARCHFORM
  if InStr(template, TAG_SEARCHFORM) > 0 then 'TAG_SEARCHFORM request
     Dim formName: formName = getTranslation("Suche in") & " " & TableValue("[grArtikel-Kategorien]","artKatNr",artKatNr,"Name")
     html = drawAreaHTML_WithImage(formName, createSearchForm(artKatNr), "Suchen Sie hier",300, Session("Basename") & "/images/windows/produktsuche.gif")
     parseTemplate = parseTemplate(replace(template,TAG_SEARCHFORM,html), artKatNr)
     exit function 
  end if 
 
  'TAG_TOPPRODUCTS
  if InStr(template, TAG_TOPPRODUCTS) > 0 then 'TAG_TOPPRODUCTSrequest
	 html =  TopCatProductsTwoInRowFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_TOPPRODUCTS, html), artKatNr)
     exit function 
  end if 
 
  'TAG_TOPPRODUCTS_VERTICAL
  if InStr(template, TAG_TOPPRODUCTS_VERTICAL) > 0 then 'TAG_TOPPRODUCTSrequest
	 html =  TopCatProductsVerticalFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_TOPPRODUCTS_VERTICAL, html), artKatNr)
     exit function 
  end if 
 
   'TAG_TOPPRODUCTS_SELECTED
  if InStr(template, TAG_TOPPRODUCTS_SELECTED) > 0 then 'TAG_TOPPRODUCTSrequest
	  html =  TopCatProductsFromCache(artKatNr,"*")
     parseTemplate = parseTemplate(replace(template, TAG_TOPPRODUCTS_SELECTED, html), artKatNr)
     exit function 
  end if 


   'TAG_TOPPRODUCTS_TYPE
  if InStr(template, TAG_TOPPRODUCTS_TYPE) > 0 then 'TAG_TOPPRODUCTSrequest
  
     dim nextBracketPos1 : nextBracketPos1 = InStr(InStr(template, TAG_TOPPRODUCTS_TYPE),template, "]")
     dim typ: typ = mid(template, InStr(template, TAG_TOPPRODUCTS_TYPE) + len(TAG_TOPPRODUCTS_TYPE)+1 ,  -(len(TAG_TOPPRODUCTS_TYPE)+1) + nextBracketPos1 - InStr(template, TAG_TOPPRODUCTS_TYPE))
     dim TAG_TOPPRODUCTS_TYPE_FULL: TAG_TOPPRODUCTS_TYPE_FULL = TAG_TOPPRODUCTS_TYPE & ":" & typ &  "]"
     'Response.Write "TAG_TOPPRODUCTS_TYPE_FULL=" & TAG_TOPPRODUCTS_TYPE_FULL
	 html =  TopCatProductsFromCache(artKatNr,typ)
     parseTemplate = parseTemplate(replace(template, TAG_TOPPRODUCTS_TYPE_FULL, html), artKatNr)
     exit function 
  end if 
  
   
   'TAG_BESTSELLERS
  if InStr(template, TAG_BESTSELLERS) > 0 then 'TAG_BESTSELLERS
	  html =  statisticBestsellersFromCache(artKatNr)
      parseTemplate = parseTemplate(replace(template, TAG_BESTSELLERS, html), artKatNr)
      exit function 
  end if 
  
 ' TODO: statisticTopClicksList is very slow 
  'TAG_MOSTCLICKEDPRODUCTS
  if InStr(template, TAG_MOSTCLICKEDPRODUCTS) > 0 then 'TAG_MOSTCLICKEDPRODUCTS request
     'html = drawAreaHTML_WithImage("Most clicked products", statisticTopClicks(artKatNr),"", 300,"../images/windows/mostclickedproducts.jpg")
	 html = statisticTopClicksListFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_MOSTCLICKEDPRODUCTS, html), artKatNr)
     exit function 
  end if 
  'exit function   
    
  'TAG_CHEAPPRODUCTS
  if InStr(template, TAG_CHEAPPRODUCTS) > 0 then 'TAG_CHEAPPRODUCTS request
	 html = statisticCheapProductsFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_CHEAPPRODUCTS, html), artKatNr)
     exit function 
  end if 
  
  
  'TAG_MOSTCLICKEDCATEGORIES
  if InStr(template, TAG_MOSTCLICKEDCATEGORIES) > 0 then 'TAG_MOSTCLICKEDCATEGORIES request     
     'response.Write "Parse TAG_MOSTCLICKEDCATEGORIES"
     html = statisticTopClicksOnCategoryCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_MOSTCLICKEDCATEGORIES, html), artKatNr)
     exit function 
  end if    
    
    'TAG_FEATUREDMERCHANTS
  if InStr(template, TAG_FEATUREDMERCHANTS) > 0 then 'TAG_FEATUREDMERCHANTSrequest
     html = showFeaturedMerchants(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_FEATUREDMERCHANTS, html), artKatNr)
     exit function 
  end if 

    'TAG_REVIEWS
  if InStr(template, TAG_REVIEWS) > 0 then 'TAG_SUBCATEGORIES request
     html = printNewReviewsFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_REVIEWS, html), artKatNr)
     exit function 
  end if 
  
    'TAG_NEWPRICES
  if InStr(template, TAG_NEWPRICES) > 0 then 'TAG_NEWPRICES request
     html = statisticLatestPricesCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_NEWPRICES, html), artKatNr)
     exit function 
  end if 
   
      'TAG_NEWSLETTER
  if InStr(template, TAG_NEWSLETTER) > 0 then 'TAG_NEWSLETTER request
     html = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/newsletterForm.htm"))
     parseTemplate = parseTemplate(replace(template, TAG_NEWSLETTER, html), artKatNr)
     exit function 
  end if 
  
  
  'TAG_TOOLBAR
  if InStr(template, TAG_TOOLBAR) > 0 then 'TAG_TOOLBAR
     html = makeToolbar(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_TOOLBAR, html), artKatNr)
     exit function 
  end if 

  'TAG_TOPDEAL
  if InStr(template, TAG_TOPDEAL) > 0 then 'TAG_TOPDEAL
     html = makeTopDealFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_TOPDEAL, html), artKatNr)
     exit function 
  end if 
  
  
  
   dim filepath
    'TAG_FUNCTION1
  if InStr(template, TAG_FUNCTION1) > 0 then 'TAG_FUNCTION1
     filepath  = replace(mid(Skin,2),"/","\") & "\pages\function1.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_FUNCTION1, html), artKatNr)
     exit function 
  end if 
  
    'TAG_FUNCTION2
  if InStr(template, TAG_FUNCTION2) > 0 then 'TAG_FUNCTION1
     filepath  = replace(mid(Skin,2),"/","\") & "\pages\function2.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_FUNCTION2, html), artKatNr)
     exit function 
  end if   
    
    'TAG_FUNCTION3
  if InStr(template, TAG_FUNCTION3) > 0 then 'TAG_FUNCTION1
     filepath  = replace(mid(Skin,2),"/","\") & "\pages\function3.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_FUNCTION3, html), artKatNr)
     exit function 
  end if 
  
    'TAG_LANGUAGE_SELECTION
  if InStr(template, TAG_LANGUAGE_SELECTION) > 0 then 'TAG_LANGUAGE_SELECTION
     filepath  = "skins/skin" & SkinNumber & "/pages/languageSelection.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_LANGUAGE_SELECTION, html), artKatNr)
     exit function 
  end if 
  
      'TAG_LAND_SELECTION
  if InStr(template, TAG_LAND_SELECTION) > 0 then 'TAG_LAND_SELECTION
     filepath  = "skins/skin" & SkinNumber & "/pages/landSelection.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_LAND_SELECTION, html), artKatNr)
     exit function 
  end if 
  
        'TAG_CONTENT_LINKS
  if InStr(template, TAG_CONTENT_LINKS) > 0 then 'TAG_LANGUAGE_SELECTION
     filepath  = "skins/skin" & SkinNumber & "/pages/contentLinks.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_CONTENT_LINKS, html), artKatNr)
     exit function 
  end if 
  
 
  'TAG_SIMPLE_SEARCH_FORM
  if InStr(template, TAG_SIMPLE_SEARCH_FORM) > 0 then 'TAG_LANGUAGE_SELECTION
     filepath  = "skins/skin" & SkinNumber & "/pages/simpleSearchForm.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_SIMPLE_SEARCH_FORM, html), artKatNr)
     exit function 
  end if 
 

  'TAG_LAND
  if InStr(template, TAG_LAND) > 0 then 'TAG_LAND     
		if land & "" = "" then 
			response.Write "Cannot replace TAG_LAND in tempalte because Land is null!" 
		else 
			parseTemplate = parseTemplate(replace(template, TAG_LAND, land), artKatNr)
		end if 
     exit function 
  end if 

 
   'TAG_USER_LINKS
  if InStr(template, TAG_USER_LINKS) > 0 then 'TAG_LANGUAGE_SELECTION
     filepath  = "skins/skin" & SkinNumber & "/pages/usermenu.htm"
     html = readTextFile(Server.MapPath(filepath))
     parseTemplate = parseTemplate(replace(template, TAG_USER_LINKS, html), artKatNr)
     exit function 
  end if 
    
  'TAG_WEB_PAGES_LINKS
  if InStr(template, TAG_WEB_PAGES_LINKS) > 0 then 'TAG_LANGUAGE_SELECTION
     html = listWebPagesLinksFromCache()
     parseTemplate = parseTemplate(replace(template, TAG_WEB_PAGES_LINKS, html), artKatNr)
     exit function 
  end if 
   
   'TAG_CURRENT_USER
  if InStr(template, TAG_CURRENT_USER) > 0 then 'TAG_CURRENT_USER
    if getLOGIN()>0 then 
     html = TABLEVALUE("ofAdressen","IDNR", getLOGIN(), "Email")
    else 
     html = "" 
    end if  
     parseTemplate = parseTemplate(replace(template, TAG_CURRENT_USER, html), artKatNr)
     exit function 
  end if 
    
   'TAG_LOGOUT_LINK
  if InStr(template, TAG_LOGOUT_LINK) > 0 then 'TAG_LOGOUT_LINK
    if getLOGIN()>0 then 
        html = "<a href='cgi/account/logout.asp'><img border=0 src='" & imageFullName("logout.gif") & "' alt='LOGIN'></a>"
    else 
        html = "<a href='default.asp?pagetoshow=MyAccount'><img border=0 src='" & imageFullName("login.gif") & "' alt='LOGOUT'></a>"
    end if  
     parseTemplate = parseTemplate(replace(template, TAG_LOGOUT_LINK, html), artKatNr)
     exit function 
  end if 
   
  
   'TAG_PRODUCT_CLEARANCE_LIST
    if InStr(template, TAG_PRODUCT_CLEARANCE_LIST) > 0 then 
     html = statisticClearanceCenterFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_PRODUCT_CLEARANCE_LIST, html), artKatNr)
     exit function 
    end if 
 
    'TAG_PRODUCT_CLEARANCE_ALL
    if InStr(template, TAG_PRODUCT_CLEARANCE_ALL) > 0 then 
     html = statisticClearanceCenterAll(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_PRODUCT_CLEARANCE_ALL, html), artKatNr)
     exit function 
    end if 

    'TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL
    if InStr(template, TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL) > 0 then 
     html = statisticProductsManufacturerDiscount(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_PRODUCT_MANUFACTURER_DISCOUNT_ALL, html), artKatNr)
     exit function 
    end if 
    
 
    'TAG_PRODUCT_PRICE_DROPS
    if InStr(template, TAG_PRODUCT_PRICE_DROPS) > 0 then 
     html = statisticPriceDropsFromCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_PRODUCT_PRICE_DROPS, html), artKatNr)
     exit function 
    end if 

    'TAG_PRODUCT_PRICE_DROPS_ALL
    if InStr(template, TAG_PRODUCT_PRICE_DROPS_ALL) > 0 then 
     html = statisticPriceDropsAll(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_PRODUCT_PRICE_DROPS_ALL, html), artKatNr)
     exit function 
    end if 
     
          
    'TAG_BASKET_STATE
    if InStr(template, TAG_BASKET_STATE) > 0 then 
     html = showBasket()
     parseTemplate = parseTemplate(replace(template, TAG_BASKET_STATE, html), artKatNr)
     exit function 
    end if 
     
    'TAG_PAGETOSHOW
    if InStr(template, TAG_PAGETOSHOW) > 0 then 
     html = getTranslation(pageToShow)
     parseTemplate = parseTemplate(replace(template, TAG_PAGETOSHOW, html), artKatNr)
     exit function 
    end if 

    'TAG_SID
    if InStr(template, TAG_SID) > 0 then 
     html = getSID()
     parseTemplate = parseTemplate(replace(template, TAG_SID, html), artKatNr)
     exit function 
    end if 
    
            
    'TAG_BASKET_RELATED_PRODUCTS
    if InStr(template, TAG_BASKET_RELATED_PRODUCTS) > 0 then 
     html = makeRelatedArtikelListForWarenkorb()
     parseTemplate = parseTemplate(replace(template, TAG_BASKET_RELATED_PRODUCTS, html), artKatNr)
     exit function 
    end if 

    'TAG_VISITED_PRODUCTS
    if InStr(template, TAG_VISITED_PRODUCTS) > 0 then 
     html = listUserVisitedProducts()
     parseTemplate = parseTemplate(replace(template, TAG_VISITED_PRODUCTS, html), artKatNr)
     exit function 
    end if 


    'TAG_VISITED_PRODUCTS_HORIZONTAL
    if InStr(template, TAG_VISITED_PRODUCTS_HORIZONTAL) > 0 then 
     html = listUserVisitedProductsHorizontal()
     parseTemplate = parseTemplate(replace(template, TAG_VISITED_PRODUCTS_HORIZONTAL, html), artKatNr)
     exit function 
    end if 
    
    'TAG_NEW_PRODUCTS
    if InStr(template, TAG_NEW_PRODUCTS) > 0 then 
     html = statisticNewProductsCache(artKatNr)
     parseTemplate = parseTemplate(replace(template, TAG_NEW_PRODUCTS, html), artKatNr)
     exit function 
    end if 


    'TAG_FAQ_LIST
    if InStr(template, TAG_FAQ_LIST) > 0 then 
     html = showFAQList(pageToShow)
     parseTemplate = parseTemplate(replace(template, TAG_FAQ_LIST, html), artKatNr)
     exit function 
    end if 
    
   
   
   'TAG_SESSION_SEARCHES
    if InStr(template, TAG_SESSION_SEARCHES) > 0 then 
     html = ListUserSearches()
     parseTemplate = parseTemplate(replace(template, TAG_SESSION_SEARCHES, html), artKatNr)
     exit function 
    end if 
 
    'TAG_SESSION_LAST_SEARCH
    if InStr(template, TAG_SESSION_LAST_SEARCH) > 0 then 
     html = ListUserLastSearch()
     parseTemplate = parseTemplate(replace(template, TAG_SESSION_LAST_SEARCH, html), artKatNr)
     exit function 
    end if    
    
    
    
    
   Dim nextBracketPos   
   Dim TAG_EMBED_FULL
             
    'TAG_EMBED
    if InStr(template, TAG_EMBED) > 0 then 
			nextBracketPos = InStr(InStr(template, TAG_EMBED),template, "]")
			dim embededFilename: embededFilename = mid(template, InStr(template, TAG_EMBED) + len(TAG_EMBED)+1 ,  -7 + nextBracketPos - InStr(template, TAG_EMBED))
			TAG_EMBED_FULL = TAG_EMBED & ":" & embededFilename &  "]"
			'Response.Write "nextBracketPos:" & nextBracketPos:Response.Flush
			'Response.Write "firstBracket:" & InStr(template, TAG_EMBED):Response.Flush
			'Response.Write "embededFilename:" & embededFilename:Response.Flush
     
			filepath  = "skins/skin" & SkinNumber & "/pages/" & embededFilename
			'Response.Write "filepath:" & filepath:Response.Flush
			on error resume next 
			 html = readTextFile(Server.MapPath(filepath))
     
			if err.number > 0 then 
			   'Response.Write "<p style='error'>File is missing:" & filepath  & "</p>"
			end if 
			on error goto 0 
     
			parseTemplate = parseTemplate(replace(template, TAG_EMBED_FULL, html), artKatNr)
			exit function 
    end if     
   
   'TRANSLATION 
   Dim TAG_TRANSLATION_FULL
             


    'TAG_TRANSLATION
    if InStr(template, TAG_TRANSLATION) > 0 then 
            
			nextBracketPos = InStr(InStr(template, TAG_TRANSLATION),template, "]")
			dim textToTranslate: textToTranslate = mid(template, InStr(template, TAG_TRANSLATION) + len(TAG_TRANSLATION)+1 ,  -13 + nextBracketPos - InStr(template, TAG_TRANSLATION))
			TAG_TRANSLATION_FULL = TAG_TRANSLATION & ":" & textToTranslate &  "]"
			html = getTranslation(textToTranslate)
            'Response.Write "TAG_TRANSLATION_FULL:" & TAG_TRANSLATION_FULL & "<br/>"
            'Response.Write "html:" & html & "<br/>"
			parseTemplate = parseTemplate(replace(template, TAG_TRANSLATION_FULL, html), artKatNr)
			exit function 
    end if  
   
    'TAG_COUNT_ONLINE
    if InStr(template, TAG_COUNT_ONLINE) > 0 then 
     html = Application("useronline")
     parseTemplate = parseTemplate(replace(template, TAG_COUNT_ONLINE, html), artKatNr)
     exit function 
    end if 
    
  
     
   'ADD TAGS FROM USER TEMPLATE 
   parseTemplate = parseTemplateUser (template)
   
   
   'ADD TAGS FROM PRODUCT TEMPLATES 
   if request("ArtNr") <> "" then 
      parseTemplate = makeProductPageWithTemplate(request("ArtNr"), template)
   end if 
   
   Dim embededSQL
    'TAG_SQL
    if InStr(template, TAG_SQL) > 0 then 
			nextBracketPos = InStr(InStr(template, TAG_SQL),template, TAG_SQL_END)
			embededSQL = mid(template, InStr(template, TAG_SQL) + len(TAG_SQL), nextBracketPos -len(TAG_SQL) -InStr(template, TAG_SQL))
			TAG_EMBED_FULL = TAG_SQL & embededSQL & TAG_SQL_END			
		    html = sqlToHTML(embededSQL,true,true)
			if err.number > 0 then 
			    Response.Write "<p style='error'>Error in TAG_SQL</p>"
			end if 
			on error goto 0 
			parseTemplate = parseTemplate(replace(template, TAG_EMBED_FULL, html), artKatNr)
			exit function 
    end if    
    
    
    'TAG_SQL_COMMA
    if InStr(template, TAG_SQL_SIMPLE) > 0 then 
			nextBracketPos = InStr(InStr(template, TAG_SQL_SIMPLE),template, TAG_SQL_END)
			embededSQL = mid(template, InStr(template, TAG_SQL_SIMPLE) + len(TAG_SQL_SIMPLE), nextBracketPos -len(TAG_SQL_SIMPLE) -InStr(template, TAG_SQL_SIMPLE))
			TAG_EMBED_FULL = TAG_SQL_SIMPLE & embededSQL & TAG_SQL_END			
		    html = sqlToSimple(embededSQL,true,true)
			if err.number > 0 then 
			   Response.Write "<p style='error'>Error in TAG_SQL_SIMPLE</p>"
			end if 
			on error goto 0 
			parseTemplate = parseTemplate(replace(template, TAG_EMBED_FULL, html), artKatNr)
			exit function 
    end if   
        
     'TAG_ECARD_LINK
   
    if InStr(template, TAG_ECARD_LINK) > 0 then 
           'response.Write "Found TAG_ECARD_LINK"
			parseTemplate = parseTemplate(replace(template, TAG_ECARD_LINK, "default.asp?PageToShow=Ecard"), artKatNr)
			exit function	
    end if   
        
        
    
   template = fixRelativeImageLinks(template)

  parseTemplate = template 'leave recursion
end function 

 'replace the '../images tag with the fill images link 
function fixRelativeImageLinks(byVal template)   
     Const IMAGES_RELATIVE_LINK = "../images"
     Const PRODUCTIMAGES_RELATIVE_LINK = "../productImages"
     
     Dim images_full_link: images_full_link = "skins/skin" & varvalue("SKINNUMBER") & "/images"
     Dim productimages_full_link: productimages_full_link = "skins/skin" & varvalue("SKINNUMBER") & "/productImages"
     
     Dim full
     full =  replace(template,IMAGES_RELATIVE_LINK,images_full_link)
     full =  replace(full,PRODUCTIMAGES_RELATIVE_LINK,productimages_full_link)
     
     
     fixRelativeImageLinks = full
end function 



%>