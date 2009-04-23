<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================

Const SUBCATEGORIES_TO_SEARCH_INTO = 2
Const BASE_ARTKATNR = 0 
Const NOT_DEFINED = "n.a."Const TEMPLATE_ARTKATNR = 9998
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
function  SimpleListCategoriesFromCache(byVal ArtKatNr, byVal inPageToShow) 'as string
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_SIMPLELISTCATEGORIES_" & artKatNr  & "_" & inPageToShow
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,SimpleListCategories(artKatNr, inPageToShow))
   end if    
   SimpleListCategoriesFromCache = temp 
end function 

Function SimpleListCategories(PreKatNr, inPageToShow)
	dim html 
	if not isnumeric(PreKatNr) then 
	SimpleListCategories  ="" 
	exit function     
	end if 

	Dim sql, rs 
	sql = "SELECT ArtKatNr, Name FROM [grArtikel-Kategorien] WHERE " & _ 
		  " ArtKatNrParent=" & PreKatNr & " ORDER BY Name "
	Set rs = ObjConnectionexecute(sql)
	'show error that not subcats are set
	If rs.EOF then
		Dim prePreKatNr: prePreKatNr = TABLEVALUE("[grArtikel-Kategorien]","artKatNr",PreKatNr,"ArtKatNrParent")
		html = getTranslation("Es sind keine weitere Unterkategorien vorhanden.") & "<br>" 
		'<a href="default.asp?PreKatNr=prePreKatNr">Zurueck??</a>
		html = html &  SimpleListCategories(prePreKatNr, inPageToShow)
		SimpleListCategories = html 
		exit function 
	end if 


	Dim rsCheck 
	WHILE NOT rs.EOF 
	'check if the cat or the sub cat contains products 
	''not needed sql = "select ArtNr, ArtKatNr from grArtikel where ArtKatNr In (" & makeSubcategoriesList( rs("ArtKatNr"),5) & ")"
	''not needed set rsCheck = ObjConnectionexecute(sql)
    Dim name 
	Dim ShowArtKatNR: ShowArtKatNR = rs("ArtKatNr")
	   'Response.Write "Language=" &  Language 	    name = getTranslationDok("grArtikel-Kategorien" , ShowArtKatNR, "Name", rs("Name") , Language) & ""
		name = Server.HTMLEncode(name)		html = html & "<a href=""" & inPageToShow & "?PreKatNr=" & ShowArtKatNR & """><div class='category'>:: " & name & "</div></a>"  
		''not needed if rsCheck.eof then 'this cat has no products   
		''not needed 'html = html &  "[leer]"  
		''not needed end if 
		''not needed html = html &   "<br>"  
		rs.MoveNext
	WEND
	SimpleListCategories = html
	rs.Close
	set rs = nothing
end function 
 
 
'******************************************************************************
'******************************************************************************
Function MenuCategories(inPageToShow)
	Dim sql, rs 
	PreKatNr = 0
	sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & PreKatNr & " ORDER BY Name "
	Set rs = ObjConnectionexecute(sql)
	WHILE NOT rs.EOF 
  		response.write "<a href=""" & inPageToShow & "?PreKatNr=" & rs("ArtKatNr")& """>" & rs("Name") & "</a> - "  
  	    rs.MoveNext
	WEND
	rs.Close
	set rs = nothing
end function 

'******************************************************************************
'******************************************************************************
function  getProductCat(ArtNr) 'as string
	Dim sql, rsTemp 
	
	sql = "SELECT * FROM [grArtikel] WHERE ArtNr=" & ArtNr
	Set rsTemp = ObjConnectionexecute(sql)
	
	if rsTemp.EOF then
		GetProductCat = 0
	else
		GetProductCat = rsTemp("ArtKatNr")		
	end if	
end function 

'******************************************************************************
' shows the category path like 
' main>products>hardware>cards
'******************************************************************************
function  showCategoryPathFromCache(byVal ArtKatNr,byVal inPageToShow) 'as string
   'response.Write "call showCategoryPathFromCache"
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_SHOWCATEGORYPATH_" & artKatNr  & "_" & inPageToShow
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,showCategoryPath(artKatNr, inPageToShow))
   end if    
   showCategoryPathFromCache = temp 
end function 


function  showCategoryPath(byVal ArtKatNr,byVal inPageToShow) 'as string

   if not isNumeric(ArtKatNr) then 
       showCategoryPath  = getTranslation("Fehler: ArtKatNr ist keine Zahl!") & "[" & ArtKatNr & "]" 
   end if 
   
	Dim sql, rs 
	sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNr=" & ArtKatNr
	Set rs = ObjConnectionexecute(sql)
   
   if rs.eof then 
      showCategoryPath = "" 
      exit function 
   end if
   
     showCategoryPath = showCategoryPath(rs("ArtKatNrParent"),inPageToShow) & " > " & _ 
       "<a href=""" & inPageToShow & "?PreKatNr=" & rs("ArtKatNr") & """>"  & Server.HTMLEncode(rs("Name")) &  "</a>"
  
end function 

'******************************************************************************
' shows the category path like 
' main>products>hardware>cards
'******************************************************************************
function  showCategoryPathNoLinks(byVal ArtKatNr,byVal inPageToShow) 'as string
	Dim sql, rs 
	sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNr=" & ArtKatNr
	Set rs = ObjConnectionexecute(sql)
   
   if rs.eof then 
      showCategoryPathNoLinks = "" 
      exit function 
   end if
   
     showCategoryPathNoLinks = showCategoryPathNoLinks(rs("ArtKatNrParent"),inPageToShow) & " - " & Server.HTMLEncode(rs("Name"))  
  
end function 


'******************************************************************************
' shows the category path like 
' main>products>hardware>cards
'******************************************************************************
function  showCategoryName(byVal ArtKatNr) 'as string
    if ArtKatNr & "" = "" then 
       showCategoryName ="" 
       exit function 
    end if 
    
	Dim sql, rs 
	sql = "SELECT Name FROM [grArtikel-Kategorien] WHERE ArtKatNr=" & ArtKatNr
	Set rs = ObjConnectionexecute(sql)
   
   if rs.eof then 
      showCategoryName = "" 
      exit function 
   end if
   
   showCategoryName = Server.HTMLEncode(rs("Name"))
   rs.close 
end function 

'***************************************************************************
' interactionCategoriesPath
'***************************************************************************
sub interactionCategoriesPath(byVal inPageToShow, byVal pageToShow)
	Dim catToShow
	Dim path
	catToShow = request("PreKatNr") 
	'Response.Write "<br>PreKatNr1 = '" & catToShow & "'<br>"
	response.write "<a href=""default.asp?pageToShow="">Home</a>"
	
	if inStr(pageToShow, "Product") <= 0 then ' show only the requested page 
		response.write ">" & pagetoShow  
		exit sub 
	end if 
	
    if catToShow  = "" then  
     catToShow = request("ArtNr") 
		if catToShow  = "" then 
			catToShow = SESSION("CURRENT_PRODUCT_CATEGORY")
			'Response.Write "<br>PreKatNr2 = '" & catToShow & "'<br>"
		else
			'Response.Write "<br>PreKatNr3 = '" & catToShow & "'<br>"
			catToShow = GetProductCat( catToShow )
			SESSION("CURRENT_PRODUCT_CATEGORY") = catToShow
		end if	
	    'catToShow = SESSION("CURRENT_PRODUCT_CATEGORY")
	else 
	   SESSION("CURRENT_PRODUCT_CATEGORY") = catToShow  
	end if 
	if catToShow = "" then catToShow  = "0"
	path = "" & showCategoryPath(catToShow,inPageToShow) & "<br>"
	'response.write path & " the fuck ! <br>"
	response.write path

end sub 

'***************************************************************************
' interactionCategories
' copy in your table 
' shows the sime categories list on the left side on side 
'***************************************************************************
sub interactionCategories(byVal inPageToShow)
	Dim catToShow
	catToShow = request("PreKatNr") 
	if catToShow  = "" then 
	   catToShow = SESSION("CURRENT_PRODUCT_CATEGORY")
	else 
	   SESSION("CURRENT_PRODUCT_CATEGORY") = catToShow  
	end if 
	
	if catToShow = "" then 	catToShow  = "0"
	Dim path
	
	path = "Categories: " & showCategoryPath(catToShow,inPageToShow) & "<br>"
	'response.write path & " the fuck ! <br>"
	Response.write SimpleListCategoriesFromCache(catToShow,inPageToShow)
end sub 
'end copy 

'******************************************************************************
'******************************************************************************
function DisplayManu (byVal inPageToShow)

	Response.Write "<script language=""JavaScript"" src=""cgi/menu.js""></script>" & chr (10) & chr (13)
	Response.Write "<script language=""JavaScript"">" & chr (10) & chr (13)
	Response.Write "function showToolbar () { " & chr (10) & chr (13)
	Response.Write "menu= new Menu ();" & chr (10) & chr (13)

	Dim sql, rs, rsSub

	' Loop for initialize menu items
   Dim PreKatNr: PreKatNr = 0
	sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & PreKatNr & " ORDER BY Name "
	Set rs = ObjConnectionexecute(sql)
	WHILE NOT rs.EOF 
		if  rs ("ArtKatNrParent") = 0 then 
			Response.Write "menu.addItem (""menu" & _
			rs("ArtKatNr") & """, """ & _
			Server.HTMLEncode(rs("Name")) & """, """ & _
			Server.HTMLEncode(rs("Name")) & """, """ & _
			inPageToShow & "?PreKatNr=" & rs("ArtKatNr") & """ , null );"
			'"null , null );"
			Response.Write Chr(10)& Chr(13)

			sql = "SELECT ArtKatNr, Name, ArtKAtNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & rs("ArtKatNr") & " ORDER BY Name "
			Set rsSub = ObjConnectionexecute(sql)

			WHILE NOT rsSub.EOF 
				Response.Write "menu.addSubItem (""menu" & _
				rs("ArtKatNr") & """, """ & _
				rsSub("Name") & """, """ & _
				rsSub("Name") & """, """ & _
				inPageToShow & "?PreKatNr=" & rsSub("ArtKatNr") & """);"
				rsSub.MoveNext
				Response.Write Chr(10)& Chr(13)
			WEND			
			rsSub.Close
			set rsSub = Nothing
		end if
	  rs.MoveNext
	  
	WEND
	rs.Close
	set rs = nothing
	'end loop of initialization
	Response.Write "menu.showMenu ();}" & chr (10) & chr (13)
	Response.Write "showToolbar();"
	Response.Write "</script>" & chr (10) & chr (13)
	
end function

'******************************************************************
' Function makeCategoriesTree
' Description [creates categories tree and shows the count of products in the categories]
' Autor: 
' Changes: 
' ArtKatNr - the first category 
' Levels - count of levels to be shown 
' manufacturer - by Name like 'IBM'
'******************************************************************

function  makeCategoriesTreeFromCache(byval ArtKatNr, byval Levels, byVal manufacturer, byVal merchantName) 'as string
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_MAKECATEGORIESTREE_" & artKatNr  & "_" & Levels
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,makeCategoriesTree(artKatNr, Levels, manufacturer, merchantName))
   end if    
   makeCategoriesTreeFromCache = temp 
end function 

'makes cat tree by CatId, manufacturerer and merchant 
function makeCategoriesTree(byval ArtKatNr, byval Levels, byVal manufacturer, byVal merchantName) 
   
  Dim html
  Dim sql, rs, sqlProduktAnzahl, rsProduktAnzahl
  if Levels<=0 then exit function 'no more levels to show
  dim MANUFACTURER_FILTER: MANUFACTURER_FILTER = ""
  dim MERCHANT_FILTER: MERCHANT_FILTER = ""
  Dim herstellerNr, lieferantNr: herstellerNr = "": lieferantNr = "" 
  Dim useHerstellerOderLieferant:useHerstellerOderLieferant = FALSE 
   
  if manufacturer <> "" or merchantName <> "" then 
      useHerstellerOderLieferant = TRUE 
      'dim manNr: manNr = tablevalue("lieferantenAdressen","Firma", manufacturer)
      manufacturer = replace(manufacturer,"'","") 
      manufacturer = replace(manufacturer,"""","") 
      manufacturer = replace(manufacturer,"%","")
      manufacturer = replace(manufacturer,"*","")  
      
      if manufacturer <> "" then herstellerNr = tablevalue("lieferantenAdressen","Firma","'" & manufacturer & "'","IdNR")
      if merchantName <> "" then lieferantNr = tablevalue("lieferantenAdressen","Firma","'" & merchantName & "'","IdNR")
       
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
			" ArtKatNrParent=" & ArtKatNR & _
			" GROUP BY [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, ArtKatNRParent " & _ 	
			" ORDER BY [grArtikel-Kategorien].ArtKatNRParent"   
		'levels = 0 	
   else 
   
	sql = "SELECT [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, [grArtikel-Kategorien].ArtKatNrParent, 1*Count(grArtikel.ArtNr) AS [Produktanzahl], ArtKatNRParent " & _ 
			" FROM [grArtikel-Kategorien] LEFT JOIN grArtikel ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _ 
			" WHERE ArtKatNrParent=" & ArtKatNR & _
			" GROUP BY [grArtikel-Kategorien].ArtKatNr, [grArtikel-Kategorien].Name, [grArtikel-Kategorien].ArtKatNrParent " & _ 	
			" ORDER BY [grArtikel-Kategorien].ArtKatNrParent"   
   end if 
'" HAVING Count(grArtikel.ArtNr)>0 " & _ 	
'Response.write "<BR>" & sql : Response.Flush


  set rs = ObjConnectionexecute(sql)
  'set rsProduktAnzahl = ObjConnectionexecute(sqlProduktAnzahl)
  if rs.eOF then
		makeCategoriesTree =""
		exit function 
  end if 
  'Response.Write "sql=" & sql
   html = "<ul>"   
  while not rs.EOF 
     
     
     'if manufacturer <> "" then 'show previous category 
     '    html = html & TABLEVALUE("[grArtikel-kategorien]","ArtKatNR",rs("ArtKatNRParent"),"Name") & "->" 
     'end if 
     
     dim LINK_KAT: LINK_KAT = "default.asp?preKatNr=" & rs("ArtKatNr")    
     dim LINK_PRODUCTS:  LINK_PRODUCTS = "default.asp?pageToShow=DetailSearchResult&artKatNrSearch=" & rs("ArtKatNr") & "&HerstellerSearch=" & manufacturer & "&LieferantSearch=" & merchantName

     Dim produktAnzahl: produktAnzahl = getCountOfProductsOpt(rs("ArtKatNr"), lieferantNr, herstellerNr)


     if useHerstellerOderLieferant and clng(produktAnzahl) <= 0 then 
     else 
		html = html & "<li>"      
     end if 
     'Response.Write "ANZAHL=" & cint(rs("Produktanzahl"))
     if  clng(produktAnzahl) > 0 then 
       if useHerstellerOderLieferant then 
			html = html & Server.HTMLEncode(rs("Name")) '& "  <a href=""" & LINK_KAT & """>" &  getTranslation("Alle Produkte in der Kategorie...")  & "</A>" 
	   else
	        html = html & "<a href=""" & LINK_KAT & """><b>" &  Server.HTMLEncode(rs("Name"))  & "</b></A>" 
	   end if 		
     else ' keine produkte
       if useHerstellerOderLieferant then  
				'html = html & "<a href=""" & LINK_KAT & """>" &  left(rs("Name"),5) & "..."  & "</A>" 
		else 'die standart produktkarte 
		        html = html & "<a href=""" & LINK_KAT & """>" &  Server.HTMLEncode(rs("Name"))  & "</A>" 
		end if 		
     end if 
       
     if  clng(produktAnzahl) > 0 then html = html &  " - " & "<a href='" & LINK_PRODUCTS & "'>" & produktAnzahl & " " & gettranslation("Produkte")  & "</a></b>"     
     html = html & makeCategoriesTree(rs("ArtKatNr"),levels-1, manufacturer, merchantName)
     
     if useHerstellerOderLieferant and clng(produktAnzahl) <= 0 then 
     else 
		html = html & "</li>"         
     end if
	rs.moveNext 
  wend  
  rs.close   
  html = html & "</ul>"
  makeCategoriesTree = html
end function 

'==============================================================================
'YAHOO Like Subcats 
'30-09-2004 erweterung mit LAND l=AT etc. 
'==============================================================================
function makeSubcategories(byval ArtKatNr, byval Levels) 
CONST MAX_CATS_OF_LEVEL_1 = 5 
  Dim html
  Dim sql, rs
  makeSubcategories = ""
  if Levels<=0 then exit function 'no more levels to show
 
  sql = "SELECT ArtKatNr, Name, ArtKatNrParent FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & ArtKatNR  & _
        " OR ArtKatNr in (Select ArtKatNrChild from [grArtikel-Kategorien-Verwandte] Where ArtKatNrParent = " & ArtKatNr & ") " & _   
        " ORDER BY [Order],[Name]"
   ' Response.Write sql    
  set rs = ObjConnectionexecute(sql)
  if rs.eOF then
		makeSubcategories =""
		exit function 
  end if 
  'Response.Write "sql=" & sql
  if Levels = 2 then html = "<table  align=""center"" cellspacing=""10"" width=""100%""><tr>"   
  Dim i:i=0
  while not rs.EOF 
    i = i + 1
     if Levels = 2 then html = html & "<td valign=top ><B>" 
     'html = html & "<a href=""default.asp?PageToShow=CatBrowse&ArtKatNr=" & rs("ArtKatNr") & """>" &  rs("Name")  & "</A>"
     Dim catLink: catLink  = "default.asp?PreKatNr=" & rs("ArtKatNr")
     'read land 
     dim catLand : catLand = tableValue("[grArtikel-Kategorien]","ArtKatNr",rs("ArtKatNr"),"Land")
     if len(catLand) = 2 then 'defined 
        catLink = catLink & "&l=" & catLand
     end if 
     
     html = html & "<a href=""" & catLink & """>"
     if Levels = 2 then html = html & "<B>" 
     if Levels = 2 or (Levels=1 and i<=MAX_CATS_OF_LEVEL_1) then 
        html = html & Server.HTMLEncode(rs("Name"))  
     else 
      ' html = html & "."
     end if    
     if Levels = 2 then html = html & "</B>"
     html = html &  "</A>"
     'anzahl von product is out 
     
     if levels = 2 then 'countOfProducts only on step 2
		Dim countOfProducts: countOfProducts = getCountOfProducts(rs("ArtKatNr")) 
		if clng(countOfProducts) > 0 then 
			html = html & " <font color=""#980000"" size=""1"">(" & countOfProducts & ")</font>"
		end if 
     end if 
     if Levels = 2 then html = html & "</b><br>"
     if Levels = 1 then 
        if i < MAX_CATS_OF_LEVEL_1  then html =  html & ", " else  html =  html & " " 
     end if    
     
     html = html & makeSubcategories(rs("ArtKatNr"),levels-1)
     if Levels = 2 then html = html & "</td>"
     if i = 2 and levels=2 then         
        html = html & "</tr><tr>"
        i = 0
     end if 
     
	rs.moveNext 
  wend  
  
  if  Levels = 1 and i >= MAX_CATS_OF_LEVEL_1 then html = html & " ..." ' weitere kateogiren sind vorhanden!
  
  rs.close   
  if Levels = 2 then html = html &  "</tr></table>" 
  
  if right(html,2) = ", " then html = left(html,len(html)-2) 
  makeSubcategories = html
end function 


 '****************************************************************************
' statistics for the most clicked products from caches
'****************************************************************************
function makeSubcategoriesFromCache(byVal artKatNr, byval Levels)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_CATEGORIES_LIST_" & artKatNr  & "_" & Levels
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,makeSubcategories(artKatNr, Levels))
   end if    
   makeSubcategoriesFromCache = temp 
end function 



'Caching function 
function findTemplateFromCache(byval ArtKatNr)   
   Dim  CACHE_NAME: CACHE_NAME = "CATEGORY_TEMPLATE_" & ArtKatNr
   Dim temp: temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, findTemplate(ArtKatNr))
   end if    
   findTemplateFromCache = temp 
end function 

'searches for the first non empty template 
public function findTemplate(byVal artKatNr)

			if artKatNr = "" then findTemplate="": exit function 
			'check if cat has products 
			dim sql, rs 
			sql ="select count(*) as cnt from grArtikel where artkatnr > 1 and artkatnr=" & artkatnr 
			set rs = ObjConnectionexecute(sql) 
			if not rs.eof then 
				Dim cnt: cnt = rs("cnt") & ""
				'  Response.Write cnt: Response.Flush
				if not isNull(cnt) and cnt > 0 then 
					findTemplate = findTemplateForProductCategory(artKatNr)
					rs.close
					exit function 
				end if 
			end if 
			rs.close 
			'end check

				if clng(artKatNr)<0 then findTemplate="":exit function 
				'Response.Write "Search"
				Dim catTemplate
				catTemplate = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "Template")
				if 	isNull(catTemplate) or trim(catTemplate) = "" then 'not defined search parent 
					'Response.Write "Search parent..."
					findTemplate = findTemplate(TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "ArtKatNrParent"))		  
					exit function 
				end if 
				findTemplate = catTemplate
				
				findTemplate = replace(findTemplate,"&lt;","<")
				findTemplate = replace(findTemplate,"&gt;",">")
				findTemplate = replace(findTemplate,"&quot;","""")
				findTemplate = replace(findTemplate,"&amp;nbsp;","&nbsp;")
	  
end function 




'Caching function 
function findTemplateForProductFromCache(byval ArtKatNr)   
   Dim  CACHE_NAME: CACHE_NAME = "CATEGORY_PRODUCT_TEMPLATE_" & ArtKatNr
   Dim temp: temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, findTemplateForProduct(ArtKatNr))
   end if    
   findTemplateForProductFromCache = temp 
end function 

'searches for the first non empty templateForProduct in the category  
'returns the column templateForProduct
'returns "" if nothing defined 
'no error if the column is not defined in the DB 
public function findTemplateForProduct(byVal artKatNr)
                if not isNumeric(artKatNr) then findTemplateForProduct = NOT_DEFINED : exit function 'nothing found 
			    if artKatNr = "" or clng(artKatNr)<0 then findTemplateForProduct = NOT_DEFINED : exit function 'nothing found 
				
				Dim catTemplate
				catTemplate = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "TemplateForProduct")
				if trim(catTemplate) & "" = "" then 'not defined search parent 
					'Response.Write "Search parent..."
					findTemplateForProduct = findTemplateForProduct(TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "ArtKatNrParent"))		  
					exit function 
				end if 
			
				catTemplate = replace(catTemplate,"&lt;","<")
				catTemplate = replace(catTemplate,"&gt;",">")
				catTemplate = replace(catTemplate,"&quot;","""")
				catTemplate = replace(catTemplate,"&amp;nbsp;","&nbsp;")
				
				findTemplateForProduct = catTemplate
				
end function 

private function findTemplateForProductCategory(byVal artKatNr)
  
  findTemplateForProductCategory = findTemplate(TEMPLATE_ARTKATNR)
end function 


function  listWebPagesLinksFromCache() 'as string
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "WEBPAGES_LIST"
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, listWebPagesLinks())
   end if    
   listWebPagesLinksFromCache = temp 
end function 


'lists the links on  hte left of the shop
function listWebPagesLinks()

                  Dim rsS, sqlS, html
                  sqlS = "select Title from webPages order by Title"
                  set rsS = ObjConnectionexecute(sqlS)
                  if rsS.eof then
                     html  = "keine Webpages definiert!"
                  end if    
                  while not rsS.EOF 
                   html = html & "<a href=""default.asp?pageToShow=WebPage&PreKatNr=-999&WebPage=" & rsS("Title") & """>" & rsS("Title") & "</a><br>"
                    
                   rsS.moveNext 
                  wend
		   rsS.close
                   set rsS = nothing 
                   listWebPagesLinks = html 
                  
end function 





'******************************************************************************
' Function [makeSubcategoriesList]
' Description [Creates List of Numbers of all subcategories]
' Autor: 
' Changes: 
' ArtKatNR is number or list of numbers 
'******************************************************************************
function makeSubcategoriesList(byval ArtKatNr, byval Levels)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUBCATEGORIES_LIST_" & ArtKatNr & "_" & Levels
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, makeSubcategoriesList_NoCache(ArtKatNr, Levels))
   end if    
   makeSubcategoriesList = temp 
end function 

function makeSubcategoriesList_NoCache(byval ArtKatNr, byval Levels) 
  Dim html
  Dim sql, rs
  Dim catList
  'Dim start: start = now() 
  makeSubcategoriesList_NoCache = ""
  if cstr(ArtKatNr) = "" then exit function
  if Levels<=0 then exit function 'no more levels to show
 
  sql = " SELECT ArtKatNr FROM [grArtikel-Kategorien] WHERE ArtKatNrParent in(" & ArtKatNR & ")" & _
        " OR ArtKatNr in (Select ArtKatNrChild from [grArtikel-Kategorien-Verwandte] Where ArtKatNrParent in (" & ArtKatNr & ")) " & _ 
        " ORDER BY [Name]"
  set rs = ObjConnectionexecute(sql)
  if rs.eOF then ' no subs
		makeSubcategoriesList_NoCache = ArtKatNr
		exit function 
  end if 
  catList = ""
  Dim i:i=0
  while not rs.EOF 
    i = i + 1
     catList = catList &  rs("ArtKatNr") & "," 
	 rs.moveNext 
  wend  
  rs.close   
  if catList<>"" then
     catList = catList & makeSubcategoriesList_NoCache(left(catList,len(catList)-1),levels-1)
  end if 
  
  catList = replace(catList,",,",",") 
  if right(catList,1) = "," then catList = left(catList,len(catList)-1) 'remove last ","
  makeSubcategoriesList_NoCache = catList
end function 

'******************************************************************
'returns the count of products in the given and all subcategories 
'******************************************************************

function getCountOfProducts(byVal ArtKatNR) 
	dim sql, rs 
	sql = " select count(*) as countProds from grArtikel " & _ 
		  " Where ProduktAktiv <> 0 and ArtKatNr in (" & ArtKatNR & "," & makeSubcategoriesList(ArtKatNr,5) & ")"
	set rs = ObjConnectionexecute(sql) 
		if rs.EOf then 
				getCountOfProducts = 0 	
		else
				getCountOfProducts = rs("countProds")
		end if 
	set rs = nothing 
end function 



function getCountOfProductsOpt(byVal optArtKatNR, ByVal optLieferantNr, byVal optHerstellerNr) 
dim sql, rs 
sql = " select count(*) as countProds from grArtikel  " & _ 
      " Where ProduktAktiv <> 0 "  
     
   if optArtKatNR <> "" then sql = sql & " and ArtKatNr=" & optArtKatNR
   if optLieferantNr <> "" then sql = sql & " and artNr in (select artikelnr from [lieferantenArtikel-Preise] where LieferantNr=" & optLieferantNr & ")"
   if optHerstellerNr <> "" then sql = sql & " and HerstellerNr=" & optHerstellerNr    
    
   ' response.Write sql   
	set rs = ObjConnectionexecute(sql) 
	if rs.EOf then 
			getCountOfProductsOpt = 0 	
	else
			getCountOfProductsOpt = rs("countProds")
	end if 
	set rs = nothing 
end function 



'****************************************************************************
' statistics for the most clicked products by category 
'****************************************************************************

function statisticTopClicksOnCategoryCache(ArtKatNr)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_CAT_TOPCLICKS_" & ArtKatNr  
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME,statisticTopClicksOnCategory( ArtKatNr))
   end if    
   statisticTopClicksOnCategoryCache = temp 
end function 

function statisticTopClicksOnCategory(ArtKatNrParam)
'exit function 
Dim MAX_PRODUCTS : MAX_PRODUCTS = 10
Dim sql
Dim html 
'DONE: optimize this SQL statement 
if Session("dbType") = "MySQL" then 
  sql = " SELECT sum(CountClicks) AS CountCls, [grArtikel-Kategorien].ArtKatNrPArent, [grArtikel-Kategorien].ArtKatNr, [Name] " & _
		" FROM [grArtikel-Kategorien], grArtikel, webProductClicks " & _		
		" WHERE " & _ 
		" [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr and " & _ 
		" grArtikel.ArtNr = webProductClicks.ArtNr and " & _
		" [grArtikel-Kategorien].ArtKAtNr>1 and " & _
		" [grArtikel-Kategorien].ArtKatNR In (" & ArtKatNrParam & ","  & makeSubcategoriesList(ArtKatNrParam,5) & ") " & _ 
		" GROUP BY [grArtikel-Kategorien].ArtKatNr, [Name], ArtKatNrPArent " & _
		" ORDER BY CountCls DESC"
else
  sql = " SELECT sum(CountClicks) AS CountCls, [grArtikel-Kategorien].ArtKatNrParent, [grArtikel-Kategorien].ArtKatNr, [Name] " & _
		" FROM [grArtikel-Kategorien], grArtikel, webProductClicks " & _		
		" WHERE " & _ 
		" [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr and " & _ 
		" grArtikel.ArtNr = webProductClicks.ArtNr and " & _
		" [grArtikel-Kategorien].ArtKAtNr>1 and " & _
		" [grArtikel-Kategorien].ArtKatNR In (" & ArtKatNrParam & ","  & makeSubcategoriesList(ArtKatNrParam,5) & ") " & _ 
		" GROUP BY [grArtikel-Kategorien].ArtKatNr, [Name], ArtKatNrPArent " & _
		" ORDER BY sum(CountClicks) DESC"
end if 
		
Dim rs: set rs = ObjConnectionexecute(sql)
Dim i : i = 0
if not rs.eOF then 
html = html & "<table border=0>"
'html = html & "<tr><th><p align=""center""><b>Top " & MAX_PRODUCTS & " Kategorien</b></th></tr>"
Dim alreadyProcessedCats: alreadyProcessedCats ="" 
	while not rs.EOF AND i < MAX_PRODUCTS
		dim artKatNr: artKatNr = rs("ArtKAtNR") 'TABLEVALUE("grArtikel","ArtNR",rs("ArtNR"),"ArtKatNr")
		 if inStr(alreadyProcessedCats,artKatNr) <= 0 then 			
			html = html & "<tr><td><a href=""default.asp?PreKAtNr=" & ArtKatNR & """>"  & _ 
			       Server.HTMLEncode(TABLEVALUE("[grArtikel-Kategorien]","ArtKatNR", rs("ArtKatNrParent") ,"Name")) & "&gt;" & " " & _ 
			       Server.HTMLEncode(rs("Name")) & "</a></td></tr>"
			i = i + 1		 
			alreadyProcessedCats = alreadyProcessedCats & "," & artKatNr
		 end if 
		rs.movenext		
	wend
	html = html & "</table>"
 end if 	
rs.close
statisticTopClicksOnCategory = html
end function 





'******************************************************************************
' Function [makeSubcategoriesPicturePages]
' Description [Creates picture overview of all categories]
' Autor: Grigor TONKOV 
' Changes: 
' ArtKatNR is number or list of numbers 
'******************************************************************************
function makeSubcategoriesPicturePages(byval ArtKatNr, byval Levels)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUBCATEGORIES_PICTURE_" & ArtKatNr & "_" & Levels
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, makeSubcategoriesPicturePages_NoCache(ArtKatNr, Levels))
   end if    
   makeSubcategoriesPicturePages = temp 
end function 

function makeSubcategoriesPicturePages_NoCache(byval ArtKatNr, byval Levels) 
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
  if cstr(ArtKatNr) = "" then exit function
 
 
  sql = " SELECT ArtKatNr, Name, Picture FROM [grArtikel-Kategorien] WHERE ArtKatNrParent in(" & ArtKatNR & ")" & _
        " OR ArtKatNr in (Select ArtKatNrChild from [grArtikel-Kategorien-Verwandte] Where ArtKatNrParent in (" & ArtKatNr & ")) " & _ 
        " ORDER BY [Name]"
  set rs = ObjConnectionexecute(sql)

  catList = ""
  Dim i:i=0
  while not rs.EOF 
     i = i + 1
     catList = "<a href='default.asp?preKatNr=" & rs("ArtKatNr") & "'>" & "<img border=0 src='" & rs("Picture") & "' alt='" & rs("ArtKatNr")  & "'></a>" 
	 tamplate_html = replace (tamplate_html,"[" & i & "]",catList) 
	 rs.moveNext 
  wend  
  rs.close   

  'replace not used places 
  for i = 1 to 40
     tamplate_html = replace (tamplate_html,"[" & i & "]", "&nbsp;") 
  next 
 
  makeSubcategoriesPicturePages_NoCache = tamplate_html
end function 

%>