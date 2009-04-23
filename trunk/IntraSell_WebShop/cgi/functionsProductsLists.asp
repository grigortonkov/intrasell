<%
Const CLEARANCE_LAGER_BEZEICHNUNG = "CLEAR CENTER"
Const CLEARANCE_LAGER_NR = 4
Const DEFAULT_LAGER_NR = 4
Const MARGIN_PERCENT_PRICE_DROPS = 5
Const TOP_MARGIN_PERCENT_PRICE_DROPS = 25
'****************************************************************************
' Show the top products from some category
'****************************************************************************

function TopCatProductsFromCache(byVal artKatNr, byVal Typ)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPCATPRODUCTS_" & artKatNr & Typ  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,TopCatProducts(artKatNr,Typ))
   end if    
   TopCatProductsFromCache = temp 
end function 

function  TopCatProducts (byVal artKatNr, byVal Typ)
'default in ofVars if not set
if not isNumeric("" & VARVALUE("SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW")) then 'this var is not set
    call SETVARVALUE("SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW", "3")
end if 
    
Dim PRODUCTS_IN_ROW : PRODUCTS_IN_ROW = cInt(VARVALUE("SHOP_TOPCATPRODUCTS_PRODUCTS_IN_ROW") )

'Const PRODUCTS_IN_ROW = 1
Dim Sql, html 
sql =" SELECT ProductID,1 from webCatTopProducts, grArtikel WHERE " & _
     " productId=artnr and produktAktiv<>0 and CatID=" & artKatNr & " and [Type] like '" & Typ & "'"  & _ 
     " UNION " & _ 
     " SELECT ProductID,1 from webCatTopProducts, grArtikel WHERE " & _
     " productId=artnr and produktAktiv<>0 and " & makeArtKatNrInPart("CatID", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
     " and [Type] like '" & Typ & "'" & _ 
     " UNION " & _ 
     " SELECT ProductID,1 from webCatTopProducts, grArtikel WHERE " & _
     " productId=artnr and produktAktiv<>0 and " & makeArtKatNrInPartParentCats("CatID", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
     " and [Type] like '" & Typ & "'" & _ 
     " ORDER BY 2"
        
Dim rsArtikel , rsTop, inRow
Dim artNr
Set rsTop  = ObjConnectionexecute(sql)
if rsTop.BOF and rsTop.EOF then
else
	inRow = 0
	
	html = "<table width=100% align=center>"
	
	while not rsTop.EOF 
		if inRow=0 then html = html & "<tr>"
        
		html = html &  "<td>"
		html = html & makeProductPageSmallWithTemplate(rsTop("ProductID"), "default.asp", "skins/skin" & SkinNumber & "/pages/productPageSmall_" & Typ & ".htm",100)
		html = html & "</td>"
	
        inRow = inRow +1    
	        if inRow>=PRODUCTS_IN_ROW then '======================================== 1 => 2 in ROW
			inRow =0
			html = html & "</tr>"
		end if
		rsTop.moveNext
	wend
 
	html = html & "</table>"
end if
rsTop.close
TopCatProducts  = html
end function

'****************************************************************************
' Show the top products from some category
'****************************************************************************
function  TopCatProductsTwoInRow (byVal artKatNr)

Const MAXPRODUCTSTOSHOW = 8
Dim  html, sql
sql = makeSQLTopClick(artKatNr)

Dim rsTop, inRow
Set rsTop  = ObjConnectionexecute(sql)
	'if rsTop.EOF then 'get products from clicks 
	'  set rsTop = ObjConnectionexecute(makeSQLTopClick(artKatNr))
	'end if 
				
	if rsTop.EOF then
	   html ="keine Produkte angeklickt"
	else
		inRow = 0
		html = html  & "<table align=center cellspacing=""10"">"	
		Dim i : i = 0
		Dim alreadyShownProducts 
		
		while (not rsTop.EOF) and i < MAXPRODUCTSTOSHOW
		   i = i + 1 
		   if InStr(alreadyShownProducts, rsTop("ArtNr")) <1 then 'not shown  
		        alreadyShownProducts = alreadyShownProducts & "," & rsTop("ArtNr")
				 
				if inRow=0 then html = html & "<tr>"	
					
				    inRow = inRow +1
					html = html & "<td>"
					html = html & makeProductPageSmall(rsTop("ArtNr"), "default.asp")
					html = html &  "</td>"
		        
		         
				if inRow>1 then '======================================== 1 => 2 in ROW
					inRow =0
					html = html & "</tr>"		
				end if
				rsTop.moveNext
			else 	
				rsTop.moveNext
		    end if 'already shown 
		wend
	html = html & "</table>"
	end if
rsTop.close
TopCatProductsTwoInRow = html
end function
 
 
 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function TopCatProductsTwoInRowFromCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPCLICKS_TWOINROW_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,TopCatProductsTwoInRow(artKatNr))
   end if    
   TopCatProductsTwoInRowFromCache = temp 
end function 


'****************************************************************************
' Show the top products from some category
'****************************************************************************
function  TopCatProductsVertical(byVal artKatNr)

Const MAXPRODUCTSTOSHOW = 4
Dim  html, sql
sql = makeSQLTopClick(artKatNr)

Dim rsTop, inRow
Set rsTop  = ObjConnectionexecute(sql)
	'if rsTop.EOF then 'get products from clicks 
	'  set rsTop = ObjConnectionexecute(makeSQLTopClick(artKatNr))
	'end if 
				
	if rsTop.EOF then
	   html = getTranslation("keine Produkte angeklickt (v)")
	else
		inRow = 0
		html = html  & "<table align=center cellspacing=""10"">"	
		Dim i : i = 0
		Dim alreadyShownProducts 
		
		while (not rsTop.EOF) and i < MAXPRODUCTSTOSHOW
		   i = i + 1 
		   if InStr(alreadyShownProducts, rsTop("ArtNr")) <1 then 'not shown  
		        alreadyShownProducts = alreadyShownProducts & "," & rsTop("ArtNr")
				 
				if inRow=0 then html = html & "<tr>"	
					
				    inRow = inRow +1
					html = html & "<td>"
					html = html & makeProductPageSmall(rsTop("ArtNr"), "default.asp")
					html = html &  "</td>"
		        
		         
				if inRow >= 1 then '======================================== 1 => 2 in ROW
					inRow =0
					html = html & "</tr>"		
				end if
				rsTop.moveNext
			else 	
				rsTop.moveNext
		    end if 'already shown 
		wend
	html = html & "</table>"
	end if
rsTop.close
TopCatProductsVertical = html
end function
 
 
 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function TopCatProductsVerticalFromCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPCLICKS_VERTICAL_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,TopCatProductsVertical(artKatNr))
   end if    
   TopCatProductsVerticalFromCache = temp 
end function 


'****************************************************************************
' statistics for the most clicked products
'****************************************************************************
function statisticTopClicks()
statisticTopClicks = TopCatProductsTwoInRow(0)
'exit function 
'not used now 
Dim MAX_PRODUCTS : MAX_PRODUCTS = 10
Dim sql, html

if Session("dbType") = "MySQL" then 
	sql =" SELECT ArtNr, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
		" FROM webWarenkorb " & _
		" WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 ) " & _ 
		" GROUP BY ArtNr " & _ 	  
		" ORDER BY AnzahlArtNr DESC"
else
	sql =" SELECT ArtNr, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
		" FROM webWarenkorb " & _
		" WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 ) " & _ 
		" GROUP BY ArtNr " & _ 	  
		" ORDER BY Count(webWarenkorb.ArtNr) DESC"
end if 
	  
	  
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0

	while not rs.EOF AND i < MAX_PRODUCTS
		html = html & makeProductPageSmall(rs("ArtNR"), "TopClicks")
		rs.movenext
		i = i + 1
	wend
rs.close
statisticTopClicks = html
end function 

'****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function statisticTopClicksFromCache()
   Dim categoryId: categoryId = 0
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPCLICKS_" & categoryId  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,statisticTopClicks(categoryId))
   end if    
   statisticTopClicksFromCache = temp 
end function 




'****************************************************************************
' statistics for the best sellers 
'****************************************************************************
function statisticBestsellers(ArtKatNr)
Dim MAX_PRODUCTS : MAX_PRODUCTS = 3
Const DAYS_TO_LOOK_BACK = 7

Dim sql, html
if Session("dbType") = "MySQL" then 
sql =" SELECT ArtNr, Count(ArtNr) AS [Anzahl] " & _
	  " FROM [buchAuftrag-Artikel] " & _
	  " WHERE ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 AND " &   makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) &  " ) " & _ 
	  " and rechNr in (SELECT Nummer from buchAuftrag where Datum >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK) & ")" & _ 
	  " GROUP BY ArtNr " & _ 
	  " ORDER BY [Anzahl] DESC"
else
sql =" SELECT ArtNr, Count(ArtNr) AS [Anzahl] " & _
	  " FROM [buchAuftrag-Artikel] " & _
	  " WHERE ArtNr In (SELECT ArtNR from grArtikel WHERE  ProduktAktiv<>0 AND " &   makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) &  " ) " & _ 
	  " and rechNr in (SELECT Nummer from buchAuftrag where Datum >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK) & ")" & _ 
	  " GROUP BY ArtNr " & _ 
	  " ORDER BY Count(ArtNr) DESC"
end if 
	  
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0

	while not rs.EOF AND i < MAX_PRODUCTS
		html = html & makeProductPageSmallWithTemplate(rs("ArtNr"), "default.asp", "skins/skin" & SkinNumber & "/pages/productPageSmall_Bestseller.htm",100)
		rs.movenext
		i = i + 1
	wend
	
rs.close
statisticBestsellers = html
end function 

'****************************************************************************
' statistics for the best sellers  from caches
'****************************************************************************
function statisticBestsellersFromCache(ArtKatNr)
   Dim categoryId: categoryId = 0
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPSALES_" & categoryId  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, statisticBestsellers(ArtKatNr))
   end if    
   statisticBestsellersFromCache = temp 
end function 


'****************************************************************************
' sql for the most clicked products by category 
'****************************************************************************
function makeSQLTopClick(ArtKatNr)

dim sql
if Session("dbType") = "MySQL" then 
		sql = " SELECT ArtNr, ArtNr as productId, sum(countClicks) AS AnzahlArtNr " & _
			" FROM webProductClicks " & _
			" WHERE " & _ 
			" FIRSTCLICK >= " & SQLDATE(-1*DAYS_TO_LOOK_BACK_CLICKS) & " and " & _ 
			"webProductClicks.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _ 
			makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & ")" & _ 
			" GROUP BY webProductClicks.ArtNr " & _ 
			" HAVING AnzahlArtNr > 2 " & _ 
			" ORDER BY AnzahlArtNr DESC"
else
		sql = " SELECT ArtNr, ArtNr as productId, sum(countClicks) AS AnzahlArtNr " & _
			" FROM webProductClicks " & _
			" WHERE " & _ 
			" FIRSTCLICK >= " & SQLDATE(-1*DAYS_TO_LOOK_BACK_CLICKS) & " and " & _ 
			"webProductClicks.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _ 
			makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & ")" & _ 
			" GROUP BY webProductClicks.ArtNr " & _ 
			" HAVING sum(countClicks) > 2 " & _ 
			" ORDER BY sum(countClicks) DESC"
end if 
  
	  'Response.Write "<br>" & sql: Response.flush
	  makeSQLTopClick =sql
end function 

function makeSQLTopBuys(ArtKatNr)
dim sql
if Session("dbType") = "MySQL" then 
sql = " SELECT webWarenkorb.ArtNr, webWarenkorb.ArtNr as productId, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
	  " FROM webWarenkorb " & _
	  " WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _ 
	    makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
	  " GROUP BY webWarenkorb.ArtNr " & _
	  " HAVING AnzahlArtNr> 10 " & _  
	  " ORDER BY AnzahlArtNr DESC"
else
sql = " SELECT webWarenkorb.ArtNr, webWarenkorb.ArtNr as productId, Count(webWarenkorb.ArtNr) AS AnzahlArtNr " & _
	  " FROM webWarenkorb " & _
	  " WHERE webWarenkorb.ArtNr In (SELECT ArtNR from grArtikel Where produktAktiv<>0 and " & _ 
	    makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
	  " GROUP BY webWarenkorb.ArtNr " & _
	  " HAVING Count(webWarenkorb.ArtNr)> 10 " & _  
	  " ORDER BY Count(webWarenkorb.ArtNr) DESC"
end if 	  
	  makeSQLTopBuys =sql
end function 


'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function statisticTopClicksList(ArtKatNr)
Dim MAX_PRODUCTS : MAX_PRODUCTS = 10
Dim sql
Dim html 
sql =  makeSQLTopClick(ArtKatNr)
'Response.Write sql	  
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0
html = html & "<table border=0>"
	while not rs.EOF AND i < MAX_PRODUCTS
		'html = html &  makeProductPageSmall(rs("ArtNR"), "TopClicks")
		 html = html & makeProductLine(rs("ArtNR"), false)
		rs.movenext
		i = i + 1
	wend
	html = html & "</table>"
rs.close
statisticTopClicksList = html
end function 


 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function statisticTopClicksListFromCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPPRODUCTCLICKSLIST_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,statisticTopClicksList(artKatNr))
   end if    
   statisticTopClicksListFromCache = temp 
end function 



'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function statisticLatestPrices(ArtKatNr)
exit function
Const MAX_PRODUCTS = 10
Const MAX_CHARS = 25
Dim sql
Dim html 

if Session("dbType") = "MySQL" then 
		sql =  "SELECT grArtikel.ArtKatNr, grArtikel.ArtNr, Max(PreisDatum) as mPD, grArtikel.Bezeichnung " & _ 
		" FROM [lieferantenArtikel-Preise],grArtikel " & _
		" WHERE ArtikelNr = ArtNr and ProduktAktiv<>0 AND " & _ 
		makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
		" GROUP BY grArtikel.ArtKatNr, grArtikel.ArtNr, grArtikel.Bezeichnung " & _
		" ORDER BY mPD DESC"
else 
		sql =  "SELECT grArtikel.ArtKatNr, grArtikel.ArtNr, Max(PreisDatum), grArtikel.Bezeichnung " & _ 
		" FROM [lieferantenArtikel-Preise],grArtikel " & _
		" WHERE ArtikelNr = ArtNr and ProduktAktiv<>0 AND " & _ 
		makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
		" GROUP BY grArtikel.ArtKatNr, grArtikel.ArtNr, grArtikel.Bezeichnung " & _
		" ORDER BY Max(PreisDatum) DESC"	
end if 
		
'Response.Write sql	  :Response.Flush
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0
Dim bezeichnung
html = html & "<table border=0>"
	while not rs.EOF AND i < MAX_PRODUCTS
		'html = html &  makeProductPageSmall(rs("ArtNR"), "TopClicks")
		'html = html & makeProductLine(rs("ArtNR"), true)
		bezeichnung = Server.HTMLEncode(rs("Bezeichnung"))
		if len(bezeichnung) > MAX_CHARS then bezeichnung = left(bezeichnung,MAX_CHARS) & ".."
		 html = html & "<tr><td><a href=""default.asp?ArtNr=" & rs("ArtNr") & """>" & bezeichnung & "</a></td></tr>" 
		rs.movenext
		i = i + 1
	wend
	html = html & "</table>"
rs.close
statisticLatestPrices = html
end function 


 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function statisticLatestPricesCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_LATESTPRICES_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,statisticLatestPrices(artKatNr))
   end if    
   statisticLatestPricesCache = temp 
end function 



'****************************************************************************
' statistics for the most clicked products by category 
' Usage: enter in table webCatTopProducts an entry from type 'TopProduct'
'****************************************************************************
function makeTopDeal(byVal artKatNr)
dim rs, sql 
Const TOP_TYPE = "TopProduct"
 sql =" SELECT ProductID, 1 from webCatTopProducts WHERE type like '" & TOP_TYPE & "' and CatID=" & artKatNr & _ 
      " UNION" & _ 
      " SELECT ProductID, 2 from webCatTopProducts WHERE type like '" & TOP_TYPE & "' and " & makeArtKatNrInPart("CatID", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
      " UNION" & _
      " SELECT ProductID, 3 from webCatTopProducts WHERE type like '" & TOP_TYPE & "' and " & makeArtKatNrInPartParentCats("CatID", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
      " ORDER BY 2 "
'Response.Write sql
set rs = ObjConnectionexecute(sql)

if rs.EOF then '
	sql = makeSQLTopClick(ArtKatNr)	
	set rs = ObjConnectionexecute(sql)
end if 

if rs.EOF then 
   makeTopDeal = getTranslation("Kein Top Deal für Heute!") & "!" 
else 
   dim artNr: artNr = rs("ProductID")
   rs.close 
   makeTopDeal = makeProductPageSmallWithTemplate(ArtNr, "default.asp", "skins/skin" & SkinNumber & "/pages/productPageSmall_TopDeal.htm",100)	
   exit function 
end if 
rs.close 
end function 


'****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function makeTopDealFromCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_TOPDEAL_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
       temp = setCache(CACHE_NAME, makeTopDeal(artKatNr))
   end if    
   makeTopDealFromCache = temp 
end function 


'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function makeSQLPriceDrops(ArtKAtNR)
 Dim sqlOnEKPreis
 Const DAYS_TO_LOOK_BACK = 5
 
  'based on EK and LEK Preis 
  sqlOnEKPreis =  " SELECT grArtikel.ArtNr, Bezeichnung, [LEKPreis]-[EKPreis] AS difference, MWST " & _ 
		" FROM grArtikel " & _
		" WHERE " & _ 
		" [EKpreis]>0 and [LEKPreis]>=[EKpreis] and ([LEKPreis]-[EKPreis])*100/[EKpreis]>" & MARGIN_PERCENT_PRICE_DROPS & " and " & _ 
		" produktAktiv<>0 and " & _ 
		  makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
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
		" AND arch.PReisDatum >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK) & _ 
		" AND arch.PReisDatum <= " & SQLNOW(0) & _ 
		" AND a.produktAktiv<>0 and " & _ 
		  makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
		" GROUP BY a.ArtNr, a.Bezeichnung, a.MWST "
	 
	 if Session("dbType") = "MySQL" then
	      sqlOnEKPreis = sqlOnEKPreis & " ORDER BY difference DESC" 
	 else 
	  	  sqlOnEKPreis = sqlOnEKPreis & " ORDER BY Min(arch.VKPreis) - Min(lp.VKPreis) DESC"
	 end if 
	 
	'response.write "<font color=red>" & sqlOnEKPreis : response.flush        
	makeSQLPriceDrops = sqlOnEKPreis      
end function 


function statisticPriceDrops(ArtKatNr)
Dim MAX_PRODUCTS : MAX_PRODUCTS = 10
Dim sql
Dim html 
sql = makeSQLPriceDrops(ArtKatNr)
'Response.Write sql	  
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0
dim bruttoPreis
html = html & "<table border=0>"
	while not rs.EOF AND i < MAX_PRODUCTS
		'html = html & makeProductLine(rs("ArtNR"), true)
		'html = html & "<tr><td>" & rs("Bezeichnung") & "</td><td>" & rs("difference") & "</td><td></td></tr>"
	    bruttoPreis = formatNumber(getPreis(getLOGIN(), rs("ArtNr"), 1),2) 'makeBruttoPreis(getPreis(getSID(),ArtNr), rs("MWST"),session("Land"))
	    bruttoPreis = formatNumber(makeBruttoPreis(bruttoPreis, rs("MWST"),session("Land")),2)
			html = html & "<tr><td><a href=""default.asp?ArtNr=" & rs("ArtNr") & """>" & server.HTMLEncode(rs("Bezeichnung")) & "</a></td>" 
			html = html & "<td align=""right""> " &  formatNumber(bruttoPreis,2) & "</td>" 
			html = html & "<td align=""right""> " &  formatNumber(rs("difference"),2) & "</td>" 
			html = html & "<td align=""right""> " &  formatNumber(100*rs("difference")/bruttoPreis,2) & "%</td>" 
			html = html & "</tr>"	
		rs.movenext
		i = i + 1
	wend
	html = html & "</table>"
	
	if not rs.eof then 'more products 
	  html = html & "<center><a href='default.asp?pagetoShow=PriceDowns'> " & getTranslation("weiter") &  "... </a></center>"
	end if 
	
rs.close
statisticPriceDrops = html
end function 


 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function statisticPriceDropsFromCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_PRICEDROPS_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,statisticPriceDrops(artKatNr))
   end if    
   statisticPriceDropsFromCache = temp 
end function 



function statisticPriceDropsAll(ArtKatNr)
Const DAYS_TO_LOOK_BACK = 2
Dim sqlPD
sqlPD =           "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _ 
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
		" AND arch.PReisDatum >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK) & _ 
		" AND arch.PReisDatum <= " & SQLNOW(0) & _ 
		" AND a.produktAktiv<>0 and " & _ 
		  makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _ 
		" GROUP BY a.ArtNr, a.Bezeichnung, a.MWST, a.Bezeichnung, a.EAN, a.Picture, a.Bezeichnung1, a.PreisATS, a.MWST, a.Beschreibung, la.Firma "
	 
	 

'Response.Write sqlPD
'sqlPD = makeSQLPriceDrops(ArtKatNr)
'statisticPriceDropsAll =  sqlPD ': Response.Flush
statisticPriceDropsAll = makeProductListOnQuery(sqlPD,"","",getTranslation("Verbilligte Produkte"))
end function 


'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function statisticClearanceCenter(ArtKatNr)
Dim MAX_PRODUCTS : MAX_PRODUCTS = 10
Dim sql
Dim html 

sql =  "select ArtNr from grArtikel where ArtNR in " & _ 
       " (select ArtNr from  [grArtikel-Lagerbestand] where lagerBestand>0 and " & _
       " reserviertStk<lagerBestand and LagerOrt =  '" & DEFAULT_LAGER_NR & "')" & _
       " and ArtNR in (select ArtNr from  [grArtikel-Lagerbestand] where LagerOrt =  '" & CLEARANCE_LAGER_NR & "')" & _ 
       " ORDER BY PreisATS Desc"
'Response.Write sql	  
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0
html = html & "<table border=0>"
	while not rs.EOF AND i < MAX_PRODUCTS
		 html = html & makeProductLine(rs("ArtNR"), true)
		rs.movenext
		i = i + 1
	wend
	html = html & "</table>"
	
	html = html & "<center><a href='default.asp?pagetoShow=ClearanceCenter'> " & getTranslation("weiter") &  "... </a></center>"
rs.close
statisticClearanceCenter = html
end function 


 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function statisticClearanceCenterFromCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_CLEARANCE_CENTER_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,statisticTopClicksList(artKatNr))
   end if    
   statisticClearanceCenterFromCache = temp 
end function 



'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function statisticClearanceCenterAll(ArtKatNr)
Dim sql
Dim html 
sql =           "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _ 
				" FROM grArtikel, lieferantenAdressen  " & _ 
				" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
				" AND ProduktAktiv<>0 and ArtNr>=1000 AND " & _ 
				" grArtikel.ArtNR in (select ArtNr from  [grArtikel-Lagerbestand] where LagerOrt =  '" & CLEARANCE_LAGER_NR & "')" & _
				" and grArtikel.ArtNR in " & _ 
                " (select ArtNr from  [grArtikel-Lagerbestand] where lagerBestand>0 " & _ 
                " and reserviertStk<lagerBestand and LagerOrt =  '" & DEFAULT_LAGER_NR & "')" 


statisticClearanceCenterAll = makeProductListOnQuery(sql,"","","Produkte im ClearCenter")
end function 


'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function statisticProductsManufacturerDiscount(ArtKatNr)
Dim sql
Dim html 
sql =           "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _ 
				" FROM grArtikel, lieferantenAdressen  " & _ 
				" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
				" AND ProduktAktiv<>0 and ArtNr>=1000  " & _ 
				" and grArtikel.herstellerRabatt > 0" 


statisticProductsManufacturerDiscount = makeProductListOnQuery(sql,"","","Produkte mit Hersteller Rabatt")
end function 



'****************************************************************************
' makeTOPTEN - liste mit top ten produkte 
'****************************************************************************
sub makeTOPTEN()
Dim Sql
Dim rsArtikel 
'PreKatNr = ""
'ArtNr = ""
'SESSION("CURRENT_PRODUCT_CATEGORY") = ""
sql = " SELECT grArtikel.ArtNr, grArtikel.Bezeichnung, grArtikel.PreisATS, grArtikel.MWST, Firma " & _
		" FROM webTopTen INNER JOIN (grArtikel INNER JOIN lieferantenAdressen ON " & _
		" grArtikel.herstellerNR = lieferantenAdressen.IDNR) ON webTopTen.productID = grArtikel.ArtNr " & _
		" ORDER BY grArtikel.ArtKatNr; "
Set rsArtikel  = ObjConnectionexecute(sql)
%>
<h3 align=center><img border="0" src="<%=imageFullName("pricehits.gif")%>"></h3>
<div align="center">
  <center>
<table width="600" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" cellspacing="0">
<%
while not rsArtikel.EOF 
 
	Dim bruttoPreis: bruttoPreis = getPreis(getLOGIN(),rsArtikel("ArtNr"), 1)
    bruttoPreis = formatNumber(makeBruttoPreis(bruttoPreis, rsArtikel("MWST"),session("Land")),2)
    
 %>
 <tr>
   <td width="575" bordercolor="#CECFCE" style="border-bottom-style: solid; border-bottom-width: 1">
   <font size="1">

 <a href='default.asp?ArtNr=<%=rsArtikel("ArtNr")%>'><%=server.HTMLEncode(rsArtikel("Bezeichnung"))%></a></font>
    </td>
   <td width="75" align="right" bordercolor="#CECFCE" style="border-bottom-style: solid; border-bottom-width: 1"><font size="1">
    <%=getCurrencySymbol()%> <%=bruttoPreis%></font></td>
</tr>
 <%
	rsArtikel.movenext
	wend
%></table>
  </center>
</div>
<%
rsArtikel.close
end sub



function printNewReviewsCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_PRINTNEWREVIEWS_" & artKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,printNewReviews(artKatNr))
   end if    
   printNewReviewsCache = temp 
end function 

function printNewReviews(byVal artKatNr) 
Dim html
'Dim artKatNr: artKatNr = clng(tablevalue("grArtikel","ArtNr", ArtNr,"ArtKatNr"))
Const MAX_LINES = 10 

'html = html & "<a href="writeReview.asp?ArtNr=ArtNr">Review verfassen</a> 
 
 
Dim Sql
sql =" SELECT [grArtikel-Reviews].DateCreation, grArtikel.Bezeichnung, [grArtikel-Reviews].Points, " & _ 
     " [grArtikel-Reviews].Autor, [grArtikel-Reviews].Review, [grArtikel-Reviews].ReviewID, grArtikel.ArtNr " & _ 
     " FROM grArtikel INNER JOIN [grArtikel-Reviews] ON grArtikel.ArtNr = [grArtikel-Reviews].ArtNR " & _  
     " ORDER BY [grArtikel-Reviews].DateCreation DESC"

'Response.Write sql
Dim rsTop
dim i : i = 0  
Set rsTop  = ObjConnectionexecute(sql)
if rsTop.EOF then
      html = "Derzeit keine Bewertungen vorhanden."
	  printNewReviews = html 
	  exit function 	 
else	
	while not rsTop.EOF and i < MAX_LINES 
	    i = i + 1 
        'call drawWindow("Beitrag von " & rsTop("Autor"), "Datum:" & rsTop("DateCreation") & "<BR>" & rsTop("Review"),"",butArrEmpty)	
        html = html &  drawWindowForum("Beitrag von " & rsTop("Autor"), "Datum:" & rsTop("DateCreation") , rsTop("Review"),"")		 
		rsTop.moveNext	    
	wend

end if
rsTop.close

printNewReviews = html 
end function 

'==============================================================================
' optionale auswahl nach bezeichnung 
' Bezeichnung by default = "ALLE"
'==============================================================================
function makeRelatedArtikelList(byval ArtNR, byval Bezeichnung)
dim html 
 'makeRelatedArtikelList = ""
 'exit function 
 
   Dim tamplate_html
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

if Bezeichnung <> "ALLE" and Bezeichnung <> "" then 'nur bestimmten typ wird gesucht 
	sql =   " select unterartNr from [grArtikel-VerwandteArtikel] where Bezeichnung like '" & Bezeichnung & "' and ArtNr = " & ArtNr & _
			" union " & _ 
			" select ArtNr from [grArtikel-VerwandteArtikel] where Bezeichnung like '" & Bezeichnung & "' and unterartNR = " & ArtNr 
else 
	sql =   " select unterartNr from [grArtikel-VerwandteArtikel] where ArtNr = " & ArtNr & _
			" union " & _ 
			" select ArtNr from [grArtikel-VerwandteArtikel] where unterartNR = " & ArtNr 
end if         
set rs = ObjConnectionexecute(sql)
dim ArtList: ArtList = "0" 
while not rs.eof
  ArtList = ArtList & "," & rs("unterartNR") 
  rs.MoveNext
wend         
        
sql  = "Select ArtNr FROM grArtikel, lieferantenAdressen  " & _ 
		" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR and ProduktAktiv<>0  " & _ 
        " and ArtNr in (" & artList & ")" 

Dim rs 
set rs = ObjConnectionexecute(sql) 
Dim i:i=0
while not rs.eof 
    i = i + 1 
    tamplate_html = replace (tamplate_html,"[" & i & "]",  makeProductPageSmallForRelatedProducts(rs("ArtNR"),"")) 
    rs.MoveNext 
wend 

  'replace not used places 
  for i = 1 to 12
     tamplate_html = replace (tamplate_html,"[" & i & "]", "&nbsp;") 
  next 
  
 rs.Close 
makeRelatedArtikelList = tamplate_html
end function 

'==============================================================================
'
'==============================================================================
function makeRelatedArtikelListOtherUsersBuy(ArtNR)
dim html 
 'makeRelatedArtikelList = ""
 'exit function 
html = "Die Benutzer kaufen auch:"
html = html & "" 

sql =   " SELECT webWarenkorb.ArtNr as unterartNR FROM webWarenkorb, webWarenkorb webWarenkorb_1 " & _
        " WHERE webWarenkorb.SID = webWarenkorb_1.SID and webWarenkorb_1.ArtNr = " & ArtNr & _
        " and  webWarenkorb.ArtNr<>webWarenkorb_1.artnr " & _ 
        " GROUP BY webWarenkorb.ArtNr, webWarenkorb_1.ArtNr " & _ 
        " HAVING Count(webWarenkorb_1.ArtNr) >=2" 
 
response.Write sql: response.Flush
        
set rs = ObjConnectionexecute(sql)
dim ArtList: ArtList = "0" 
while not rs.eof
  ArtList = ArtList & "," & rs("unterartNR") 
  rs.MoveNext
wend         
        
sql  = "Select ArtNr FROM grArtikel, lieferantenAdressen  " & _ 
		" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR and ProduktAktiv<>0  " & _ 
        " and ArtNr in (" & artList & ")" 

Dim rs 
set rs = ObjConnectionexecute(sql) 
while not rs.eof 
    html = html & makeProductPageSmallForRelatedProducts(rs("ArtNR"),"")
    rs.MoveNext 
wend 
 rs.Close 

makeRelatedArtikelListOtherUsersBuy = html
end function 
       
function makeRelatedArtikelListForWarenkorb()

sql = " select unterartNR from [grArtikel-VerwandteArtikel] where ArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ") " & _ 
       "union  select artNR from [grArtikel-VerwandteArtikel] where UnterArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ") " & _  
        " union SELECT webWarenkorb.ArtNr FROM webWarenkorb INNER JOIN webWarenkorb AS webWarenkorb_1 ON webWarenkorb.SID = webWarenkorb_1.SID " & _ 
        " WHERE webWarenkorb_1.ArtNr in (select ArtNr from webWarenkorb where Sid=" & getSID() & ")" & _ 
        " and webWarenkorb.ArtNr <>[webWarenkorb_1].[artnr] " & _ 
        " GROUP BY webWarenkorb.ArtNr, webWarenkorb_1.ArtNr " & _ 
        " HAVING  Count(webWarenkorb_1.ArtNr)>=2"
        
set rs = ObjConnectionexecute(sql)
dim ArtList: ArtList = "0" 
while not rs.eof
  ArtList = ArtList & "," & rs("unterartNR") 
  rs.MoveNext
wend         
        
        
sql  = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, Beschreibung " & _ 
		" FROM grArtikel, lieferantenAdressen  " & _ 
		" Where grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
		" AND ProduktAktiv<>0  " & _ 
		" AND ArtNr not in (select artNr from webWarenkorb where sid=" & getSID() & ") " & _ 
        " and ArtNr in (" & ArtList & ") " 
        
'Response.Write makeProductListOnQuerySimple(sql)
'exit function 
Dim rs, html 
set rs = ObjConnectionexecute(sql)
'3 in a row  

dim template 
template = "<table><tr><td>[1]</td><td>[2]</td><td>[3]</td></tr><tr><td>[4]</td><td>[5]</td><td>[6]</td></tr></table>"
Dim kk: kk = 1 
while not rs.eof 
    html = html & makeProductPageSmallForRelatedProducts(rs("ArtNR"),"")
    template = replace(template,"[" & kk  & "]",makeProductPageSmallForRelatedProducts(rs("ArtNR"),""))
    kk = kk +1 
    rs.MoveNext 
wend 
  
'remove template numbers
for kk = 1 to 6 
    template = replace(template,"[" & kk  & "]","")
next 

html = template
 rs.Close 
 makeRelatedArtikelListForWarenkorb =  html

end function 


'================================================================================
' addToUserVisitedProducts
' When Detail of Product is shown this function adds the product to an session list 
'================================================================================
Const SESSION_NAME_VISITED_PRODUCT = "VISITED_PRODUCT_" 
Const COUNT_VISITED_PRODUCTS = 5
function addToUserVisitedProducts(byval artNr) 
	Dim i

	for i = 1 to COUNT_VISITED_PRODUCTS
	
		if Session("SESSION_NAME_VISITED_PRODUCT" & i ) & "" = "" then
			Session("SESSION_NAME_VISITED_PRODUCT" & i ) = artNr
			'Response.Write "VISITED: " & i & ":" & artNR
			exit function 
		end if 
		'do not add if already in 
		if cstr(Session("SESSION_NAME_VISITED_PRODUCT" & i )) = cstr(artNr) then
			exit function 
		end if 
		
			'if max achieved then offcet all old 
		if Session("SESSION_NAME_VISITED_PRODUCT" & COUNT_VISITED_PRODUCTS ) & "" <> "" and _
		   i = COUNT_VISITED_PRODUCTS then 
		    dim kk: kk = 1
		    dim kkPrev
		    for kk = 2 to COUNT_VISITED_PRODUCTS
		       kkPrev = cstr(kk-1)
		       Session("SESSION_NAME_VISITED_PRODUCT" & kkPrev) = Session("SESSION_NAME_VISITED_PRODUCT" & kk)		       
		    next 
		    'the last is now the current 
		    Session("SESSION_NAME_VISITED_PRODUCT" & COUNT_VISITED_PRODUCTS) = cstr(artNr)
		end if    
	
	next 
	addToUserVisitedProducts = true 
end function 


function listUserVisitedProducts()
  Dim i
  Dim html 
  html = "<table border=0>"
for i = 1 to COUNT_VISITED_PRODUCTS
  dim artNR : artNR = Session("SESSION_NAME_VISITED_PRODUCT" & i )
   if artNR&"" <> "" then
       'html = html &  makeProductLine(artNR, false)
       html = html & "<tr><td>"
       html = html &   makeProductPageSmallWithTemplate(ArtNr, "default.asp", "skins/skin" & SkinNumber & "/pages/productPageSmall_visitedProduct.htm",100)
       html = html & "</td></tr>"
      ' Response.Write "Add line " 
   end if 
next  
  html = html & "</table>"
listUserVisitedProducts = html 
end function 


function listUserVisitedProductsHorizontal()
  Dim i
  Dim html 
  html = "<table border=0><tr>"
for i = 1 to 3 'COUNT_VISITED_PRODUCTS
  dim artNR : artNR = Session("SESSION_NAME_VISITED_PRODUCT" & i )
   if artNR&"" <> "" then
       'html = html &  makeProductLine(artNR, false)
       html = html & "<td>"
       html = html &   makeProductPageSmallWithTemplate(ArtNr, "default.asp", "skins/skin" & SkinNumber & "/pages/productPageSmall_visitedProduct.htm",100)
       html = html & "</td>"
      ' Response.Write "Add line " 
   end if 
next  
  html = html & "</tr></table>"
listUserVisitedProductsHorizontal = html 
end function 

'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************
function statisticNewProducts(ArtKatNr)
Const MAX_PRODUCTS = 10
Const MAX_CHARS = 25
Dim sql
Dim html

		sql =  "SELECT grArtikel.ArtKatNr, grArtikel.ArtNr, grArtikel.Bezeichnung, AngelegtAm " & _ 
		" FROM grArtikel " & _
		" WHERE ProduktAktiv<>0 AND " & _ 
		  makeArtKatNrInPart("ArtKatNr", ArtKatNr, SUBCATEGORIES_TO_SEARCH_INTO) & _
		" ORDER BY AngelegtAm DESC"

'Response.Write sql	  :Response.Flush
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0
Dim bezeichnung
html = html & "<table border=0>"
	while not rs.EOF AND i < MAX_PRODUCTS
		'html = html &  makeProductPageSmall(rs("ArtNR"), "TopClicks")
		'html = html & makeProductLine(rs("ArtNR"), true)
		bezeichnung = Server.HTMLEncode(rs("Bezeichnung")&"")
		if len(bezeichnung) > MAX_CHARS then bezeichnung = left(bezeichnung,MAX_CHARS) & ".."
		 html = html & "<tr><td><a href=""default.asp?ArtNr=" & rs("ArtNr") & """>" & bezeichnung & "</a></td>"
		 html = html & "<td>" & getTranslation("seit") & " " & GermanSQLDate(rs("AngelegtAm")) & "</td></tr>" 
		rs.movenext
		i = i + 1
	wend
	html = html & "</table>"
rs.close
statisticNewProducts = html
end function 


 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function statisticNewProductsCache(byVal artKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_NEW_PRODUCTS_" & artKatNr  
   temp = getCache(CACHE_NAME)
   'response.Write "temp='" & temp & "'"
   if temp = "" then 'set cache  
      temp =  setCache(CACHE_NAME, statisticNewProducts(artKatNr))
   end if    
   statisticNewProductsCache = temp 
end function 


%>

 