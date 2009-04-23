<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================

Const TECHINFOCONSTANT = "TechInfo:"
Const SPECIALCHOICECONSTANT = "SpecialChoice:"
Const DAYS_TO_LOOK_BACK_CLICKS = 3
Const DEFAULT_PRODUCT_SEARCH_WHERE = "ProduktAktiv<>0 and ArtNr>=1000 and preisATS<>0"

Const PRODUCT_IMAGE_BIG_MAX_SIZE = 600 
Const PRODUCT_IMAGE_MIDDLE_MAX_SIZE = 125  
Const PRODUCT_IMAGE_SMALL_MAX_SIZE = 63
Const PRODUCT_SHORT_DESCRIPTION_MAX_SIZE = 200 'MAX SIZE FOR SEARCH/LIST, SMALL PRODUCT VIEW 
 
Const TAG_EIGENSCHAFT_  = "[Eigenschaft" 'usage [Eigenschaft:name]
Const TAG_IMAGETAGNAME_ = "[makeImgTagName" 'usage [makeImgTag:imageName]
Const TAG_HTMLINFONAME_ = "[HTMLInfoName" 'usage [htmlInfoName:name]
Const TAG_VERWANDTE_PRODUKTE_ = "[verwandteProdukte"'usage [verwandteProdukte:bezeichnung]

Const COUNT_RESULT_LINES = "COUNT_RESULT_LINES" 'xml tag name for the reult lines 

Const FLENAME_PRODUCT_LIST_COLUMN_DESCRIPTION = "productList_column_description.htm"  
Const FLENAME_PRODUCT_LIST_HEADER = "productList_header.htm"  

Const ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS = "ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS" 'wenn TRUE dann nur Kunden können die Preise sehen und einkaufen  


Const TAG_CREATEPRODUCTSPECIALCHOICE = "[createProductSpecialChoice]"  
Const TAG_CREATESTAFFELPREISTABLE = "[createStaffelPreiseTable]"

Const TAG_BEZEICHNUNG = "[Bezeichnung]"
Const TAG_BESCHREIBUNG = "[Beschreibung]"


'WHERE Condition for all subcategories 
function makeArtKatNrInPart(fieldNAme, artKatNr, SUBLEVELS)
 if artKatNr = 0 or artKatNr = 1 then 
      makeArtKatNrInPart = " 1=1 "  
 else 
      makeArtKatNrInPart= fieldName & " In (select ArtKatNr from webCatsIndex where ArtKatNrParent=" & artKatNr & ")"   
 end if 
end function 

'WHERE Condition for all supercategories 
function makeArtKatNrInPartParentCats(fieldNAme, artKatNr, SUBLEVELS)
 if artKatNr = 0 or artKatNr = 1 then 
      makeArtKatNrInPartParentCats = " 1=1 "  
 else 
      makeArtKatNrInPartParentCats= fieldName & " In (select ArtKatNrParent from webCatsIndex where ArtKatNr=" & artKatNr & ")"   
 end if 
end function 

 
'****************************************************************************
' DisplaySearchResults - search after product attributes  
'
' added support for search in the subcats 
'****************************************************************************
Sub	DisplaySearchResults (SearchKeywords)
Dim SEARCH_IN_DESCRIPTION: SEARCH_IN_DESCRIPTION = false 
 
'init 
SEARCH_IN_DESCRIPTION = VARVALUE_DEFAULT("SHOP_SEARCH_IN_DESCRIPTION","true") 
 

Const MIN_SEARCHABLE = 3 
if Len (Trim(SearchKeywords)) < MIN_SEARCHABLE then 
    call drawErrorBox(getTranslation("Suche ungültig!"), _ 
         getTranslation("Die Suche muss mindestens 3 Symbole enthalten!"),"","") 
	exit sub
end if

Response.Write getTranslation("Suchergebnisse") & "..." 

Dim MC: IF Session("dbType")="Access" then MC="*" else MC="%"
Dim sql, rsQ
Dim ArtKatNr_ToSearchInto: ArtKatNr_ToSearchInto = request("ArtKatNr_ToSearchInto")
Dim SearchOnlyInthisCategory: SearchOnlyInthisCategory = request("SearchOnlyInthisCategory")

if lcase(SearchOnlyInthisCategory) <> "on" then 
    ArtKatNr_ToSearchInto = 0
end if 

if "" & ArtKatNr_ToSearchInto = "" then 
    ArtKatNr_ToSearchInto = 0
end if 

'Response.Write "ArtKatNr_ToSearchInto=" & ArtKatNr_ToSearchInto:Response.Flush
'Response.Write "SearchOnlyInthisCategory=" & SearchOnlyInthisCategory


Dim catPath, catPathOld
catPath = ""	
Dim AllKeywords
SearchKeywords= replace(SearchKeywords,"'","") 
SearchKeywords= replace(SearchKeywords,"""","") 


AllKeywords = Split(Trim(SearchKeywords), " " )
sql = "1=1 "

if ArtKatNr_ToSearchInto <> "" then 
 if cint(ArtKatNr_ToSearchInto) > 0 then 
    sql = sql & "AND grArtikel.ArtKatNR in (" & makeSubcategoriesList(ArtKatNr_ToSearchInto, 4) & ")"
 end if 
end if 

	if Not isNumeric (Trim (SearchKeywords) ) then '
		Dim key
		For each key in AllKeywords 

			if key <> "" then
				'sql = sql + "AND ([Bezeichnung] like '" & MC & key & MC & "'" & _ 
				'" OR [Bezeichnung1] like '" & MC & key & MC & "' " &  _
				'" OR [EAN] like '" & MC & key & MC & "' " &  _
				'" OR [ArtNR] like '" & MC & key & MC & "' " &  _
				'" OR [Barcode] like '" & MC & key & MC & "' " &  _
				'" OR [Seriennummer] like '" & MC & key & MC & "' " &  _
				'" OR [Firma] like '" & MC & key & MC & "' " &  _
				'" OR [Beschreibung] like '" & MC & key & MC & "') "
			   if SEARCH_IN_DESCRIPTION then ' slow  
					sql = sql + "AND ([Bezeichnung] like '" & MC & key & MC & "'" & _ 
					" OR [EAN] like '" & MC & key & MC & "' " &  _
					" OR [Beschreibung] like '" & MC & key & MC & "' " &  _
					" OR [Firma] like '" & MC & key & MC & "' " & _ 
                    " OR EXISTS (SELECT 1 FROM  translations t where t.key= ArtNr and t.tablename = 'grArtikel' and t.translation like '" & MC & key & MC & "' ))"
               else 'Fast
					sql = sql + "AND ([Bezeichnung] like '" & MC & key & MC & "'" & _ 
					" OR [EAN] like '" & MC & key & MC & "' " &  _
					" OR [Firma] like '" & MC & key & MC & "') "
               end if 
                
			end if
		Next	
		if mid(sql,1,2)="AND" then sql = mid(sql,4)
		catPathOld = ""
		sql =   "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung " & _ 
				" FROM grArtikel, lieferantenAdressen  " & _ 
				" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
				" AND " & DEFAULT_PRODUCT_SEARCH_WHERE & " AND " & _ 
				"(" & sql & ")" 
	else 'product seach by ArtNR
		sql =  "SELECT  IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung " & _ 
				" FROM grArtikel, lieferantenAdressen  " & _ 
				" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
				" AND " & DEFAULT_PRODUCT_SEARCH_WHERE & " AND ([ArtNr] =" & SearchKeywords & " OR [EAN] like '" & SearchKeywords & "')" 
	end if	      


'sort initial search on ArtKatNr 

Dim initialOrderBy
		if request("orderby")& "" = "" then 
			initialOrderBy = "ArtKatNr"
		else 
			initialOrderBy = request("orderby")
		end if 
'end sort 

   call WriteLog("simpleSearchForm.log","SearchKeywords: " & SearchKeywords)
   Response.Write displayCatListOnSeach(SearchKeywords) 
   Response.write makeProductListOnQuery(sql, request("filterBy"), initialOrderBy, SearchKeywords)		
end sub

'****************************************************************************
' Display List Of Categories the user maybe searched for
'****************************************************************************
function DisplayCatListOnSeach(byVal partOfCatName)
Dim html: html = "" 
dim sql, rsKat  
dim MC: MC = Iff(Session("DbType")="Access","*","%")

if len(partOfCatName & "" ) <= 3 then displayCatListOnSeach = "": exit function

sql = "select ArtKAtNR, Name from [grArtikel-Kategorien] where Name like '" & MC & partOfCatName & MC & "'"
set rsKat = ObjConnectionExecute(sql) 
if not rsKat.eof then 'ok the user searches maybe products in these cats 
  html = html & "<br>" & getTranslation("M&ouml;chten Sie die Produkte in den folgenden Kategorien auch ansehen?") & "<br>"
  while not rsKat.eof 
     html = html & showCategoryPath(rsKat("ArtKatNr"),"default.asp") & "<br>"
     rsKat.moveNext 
  wend
   rsKat.close 
end if 

displayCatListOnSeach = html 
end function 

'****************************************************************************
' DisplaySearchResults - search after product attributes  
'****************************************************************************
public sub	DisplayDetailSearchForm()
dim searchForm
dim herstellerList

dim rs, sql 
sql  ="Select distinct  Firma from lieferantenAdressen where rolle like 'Hersteller' ORDER BY Firma"
set rs = objConnectionExecute(SQL) 
herstellerList = "<Select Name='HerstellerListSearch'>"

herstellerList = herstellerList & "<Option></Option>"
while not rs.eof 
    herstellerList = herstellerList & "<Option>" & rs("Firma")
    rs.moveNExt 
wend
 herstellerList = herstellerList & "</Select>"
 rs.close 
 
searchForm = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/productSearch.htm"))
searchForm = replace(searchForm,"[HERSTELLER_LIST]",herstellerList) 
searchForm = parseTemplate(searchForm,SESSION("CURRENT_PRODUCT_CATEGORY"))
Response.Write searchForm
end sub

'****************************************************************************
' DisplaySearchResults - search after product attributes  
'****************************************************************************
public sub	DisplayDetailSearchResults ()
Dim ArtNr, Bezeichnung, MinPreis, MaxPreis, Hersteller, EAN, HerstellerList, ArtKatNr, Lieferant

ArtNr = request("ArtNRSearch")
ArtKatNr = request("ArtKatNRSearch")
EAN = request("EANSearch")
Bezeichnung = request("BezeichnungSearch")
Hersteller = request("HerstellerSearch")
Lieferant = request("LieferantSearch")
HerstellerList = request("HerstellerListSearch")

if HerstellerList<> "" then Hersteller = HerstellerList

MinPreis = replace(request("PreisVonSearch"),",",".") 
MaxPreis = replace(request("PreisBisSearch"),",",".")

if ArtNr="" and Bezeichnung="" and  Hersteller= "" and EAN ="" and HerstellerList= "" and ArtKatNr = "" and  Lieferant = "" then 
   call drawErrorBox("Mehr Suchkriterien!", _
                   getTranslation("Sie müssen ArtNr, ArtKatNr, Bezeichnung, Hersteller oder Lieferant eingeben."), _ 
                   "","") 
	exit sub
end if

response.write getTranslation("Suchergebnisse") & "..." 

Dim MC: MC ="%"
Dim sql
Dim rsQ
Dim catPath, catPathOld
catPath = ""	
sql = "1=1 "
	    if isNumeric (Trim (ArtNr) ) then   sql = sql + "AND [ArtNr] like '" & MC & ArtNr & MC & "'" 
	    if isNumeric (Trim (ArtKatNr) ) then   sql = sql + " AND grArtikel.ArtKatNr like '" & ArtKatNr & "'" 
		if EAN <> "" then sql = sql + "AND [EAN] like '" & MC & EAN & MC & "'" 
		if Bezeichnung <> "" then sql = sql + "AND [Bezeichnung] like '" & MC & Bezeichnung & MC & "'" 
		if Hersteller <> "" then sql = sql + "AND HerstellerNr in (select Idnr from lieferantenAdressen where Firma like '" & Hersteller  & "')" 
		
		if Lieferant <> "" then 
		   sql = sql + " AND ArtNr in (select ArtikelNr from [lieferantenArtikel-Preise] " & _ 
		   " where LieferantNr in (select idnr from lieferantenAdressen where Firma like '" & Lieferant  & "'))" 
		end if    
		
		if MinPreis <> "" then sql = sql + "AND PreisATS >= " & MinPreis & " "  
		if MaxPreis <> "" then sql = sql + "AND PreisATS <= " & MaxPreis & " "

			
		sql =   "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung " & _ 
				" FROM grArtikel, lieferantenAdressen  " & _ 
				" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
				" AND " & DEFAULT_PRODUCT_SEARCH_WHERE & " AND " & _ 
				"(" & sql & ")" 

	      
	   'Response.write sql 
	   'Response.Flush 
	   'Response.end     
   Dim searchDescription 
   ' searchDescription = ArtNr  & " "  & ArtKatNr & " " & EAN & " " & Bezeichnung & " " & Hersteller & " " & HerstellerList
   
   if Bezeichnung <> "" then  searchDescription = searchDescription & " und Bezeichnung ist wie '" & Bezeichnung & "'"  
   if ArtNr <> "" then  searchDescription = searchDescription & " und Produktnummer ist wie '" & ArtNr & "'"
   if ArtKatNr <> "" then  searchDescription = searchDescription & " und Produktkategorie ist wie '" & tablevalue("[grArtikel-Kategorien]","ArtKatNr",ArtKatNr,"Name") & "'"
   if EAN <> "" then  searchDescription = searchDescription & " und EAN ist wie '" & EAN & "'"  
   if Hersteller <> "" then  searchDescription = searchDescription & " und Hersteller ist wie '" & Hersteller & "'"  
   if Lieferant <> "" then  searchDescription = searchDescription & " und Lieferant ist wie '" & Lieferant & "'"  

   
   call WriteLog("detailSearchForm.log","SearchKeywords: " & searchDescription)
   Response.Write displayCatListOnSeach(Bezeichnung) 
   Response.Write makeProductListOnQuery(sql,"","",trim(searchDescription))
   'showProductQueryResult(sql)
		
end sub

'****************************************************************************
' DisplaySearchResults - search after product attributes  
' isHersteller - true or false 
' 
' additional requests in query string: showInactive 
'****************************************************************************
sub	DisplaySearchResultsOnMerchantSearch (idnr, isHersteller) 

 Dim showInactive: showInactive = false 
 if request("showInactive")&""="true" then showInactive = true  

    
  if idnr <> "" then 
    if isHersteller then 
			sql = "Select ArtKatNr, ArtNr, EAN, Bezeichnung , Bezeichnung1 , PreisEuro , PreisATS, MWST, Firma, grArtikel.Picture, AngelegtAm " & _ 
				" from [grArtikel], lieferantenAdressen " & _ 
				" where lieferantenAdressen.idnr = grArtikel.herstellerNr " & _ 
				" AND herstellerNr = " & cint(idnr) 
     else 
     			sql = "Select ArtKatNr, ArtNr, grArtikel.EAN, grArtikel.Bezeichnung , Bezeichnung1 , grArtikel.PreisEuro , grArtikel.PreisATS, MWST, Firma, grArtikel.Picture, AngelegtAm " & _ 
				" from [grArtikel], lieferantenAdressen, [lieferantenArtikel-Preise] lap " & _ 
				" where lieferantenAdressen.idnr = lap.lieferantNr " & _ 	
				" AND lap.ArtikelNr = grArtikel.ArtNr " & _  
				" AND lieferantenAdressen.idnr = " & cint(idnr) 
     end if     
       
     if showInactive then 
         sql = sql & " AND ProduktAktiv=0"
     else 'hide inactive products 
		sql = sql & " AND " & DEFAULT_PRODUCT_SEARCH_WHERE
     end if 
     

   
	 call showProductQueryResult(sql)	      
     
  else 
     call drawErrorBox("Keine Nummer!", getTranslation("Sie haben keine Lieferanten/Herstellernummer angegeben!"),"","")
  end if 
end sub 

'****************************************************************************
' runs an SQL stametemnt and show the result 
' the sql must be something like select * grom grArtikel where .... 
'****************************************************************************
function showProductQueryResult(sql)
    Response.Write makeProductListOnQuery(sql, request("filterBy"), request("orderby"),"")
end function 


 
'****************************************************************************
'makeProductList - lists all products of some category 
'****************************************************************************
function makeProductList(artKatNr)
	Response.Write TopCatProducts (artKatNr,"*")
	'List products in this cat

	Dim Sql
	Dim orderBy: orderBy = request("orderBy")
	Dim filterBy: filterBy = request("filterBy")

	'default sortierung nach ArtNr 
	if orderBy & "" = "" then ' nicht gesetzt
		orderBy = "ArtNr"
	end if 

	'sql = "SELECT  IDNR, Branche, Firma, Adresse, [grArtikel-Kategorien].Name AS CaT, grArtikel.* " & _ 
	'	" FROM [grArtikel-Kategorien], grArtikel, lieferantenAdressen  " & _ 
	'	" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
	'	" AND [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _ 
	'	" AND ProduktAktiv<>0 and grArtikel.ArtKatNr=" & artKatNr 
		
	sql = "SELECT IDNR, Branche, Firma, Adresse, ArtNr, Bezeichnung, EAN, grArtikel.Picture, Bezeichnung1, PreisATS, MWST, AngelegtAm, Beschreibung " & _ 
		" FROM grArtikel, lieferantenAdressen  " & _ 
		" Where  grArtikel.HerstellerNR = lieferantenAdressen.IDNR " & _ 
		" and " & DEFAULT_PRODUCT_SEARCH_WHERE & " and grArtikel.ArtKatNr=" & artKatNr 
		
		'Response.Write sql: Response.Flush   
	makeProductList =  makeProductListOnQuery (sql, filterBy, orderBy, "")
end function 
	

sub requerySQL()

 Dim sql: sql = Session("CURRENT_SEARCH") ' take last search 
 Dim orderBy: orderBy = request("orderBy")
 Dim filterByHersteller: filterByHersteller = request("filterBy")
 
 Dim filterBySQL: filterBySQL =""
 
 if filterByHersteller <> "" then 
   filterBySQL  ="HerstellerNr in (Select idnr from lieferantenAdressen where Firma like '" & filterByHersteller  & "')" 
 end if  
 
 'response.write orderby 
 Response.Write  makeProductListOnQuery (sql, filterBySQL, orderBy, "")
end sub 
	
'****************************************************************************
' htmlForSaveUserQuery - 
' makes an image link for saving this query
'****************************************************************************	
function htmlForSaveUserQuery(Sql, FilterBySQL, OrderBy, SearchDescription)	
   'response.Write sql & SearchDescription
	dim html 
	Session("SQLString") = Sql
	Session("SQLDescription") = SearchDescription
	html = "<a href=""default.asp?pageToShow=SaveUserQuery""> <img border=""0"" src='" & imageFullName("save.gif") & "' alt='" & getTranslation("Hier können Sie Ihre Abfrage speichern") & "'></a>"
htmlForSaveUserQuery = html
end function 


'****************************************************************************
'makeProductListOnQuery - lists all products depending on the SQL query
'****************************************************************************
function makeProductListOnQuerySimple(Sql) 
        
'Response.Write sql: Response.Flush
Dim rsArtikel, html
Set rsArtikel  = objConnectionExecute(sql)

if rsArtikel.BOF and rsArtikel.EOF then
   html = ""
   exit function 
else

				
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
Dim artNr, VKPreis	
		while (not rsArtikel.EOF )
				artNR = rsArtikel("ArtNR")
				VKPreis = FormatNumber (makeBruttoPreis(getPreis(getLOGIN(),rsArtikel("ArtNr"), 1), rsArtikel("MWST"),session("Land")), 2)  
				if rowColor = "#F7F7F7" then rowColor = "#FFFFFF" else	rowColor = "#F7F7F7" end if 
				  
				html = html & "<tr>"
				html = html & "<td width=""300"" align=""left"" bgcolor=""" & rowColor &"""><a href='default.asp?ArtNr=" & ArtNr & "'>" &  rsArtikel("Bezeichnung") &  "</a></td>"
				html = html & "<td width=""100"" align=""center"" bgcolor=""" & rowColor &"""><p align=""right"">" & VKPreis & "</td>"
				html = html & "<td width=""100"" align=""center"" bgcolor=""" & rowColor &""">" & rsArtikel("Firma") & "</td>"
				html = html & "<td width=""100"" align=""left"" bgcolor=""" & rowColor &""">" & rsArtikel("EAN") & "</td>"
				html = html & "<td width=""100"" align=""center"" bgcolor=""" & rowColor &""">" & rsArtikel("Bezeichnung1")  & "</td>"
				html = html & "<td width=""100""  align=""center"" bgcolor=""" & rowColor &"""><a href='putInWarenkorb.asp?ArtNr=" & ArtNr & "'>Buy</a></td>"
				html = html & "<td width=""100""  align=""center"" bgcolor=""" & rowColor &"""><a href='default.asp?ArtNr=" & ArtNr & "'>detail</a></td>"
				html = html & "<td><input type=""checkbox"" value=""" & ArtNr & """ name=""ArtNrToCompare""></td>" 
				html = html & "</tr>"

				rsArtikel.moveNext
				Response.Flush
		wend
		
	html = html & "</table>"

end if
rsArtikel.close
makeProductListOnQuerySimple = html
end function 





'****************************************************************************
' Product Page Detail 
' Gramatik of Beschreibung:
' [CommonDescription]#[TechInfo:![ParamterName=ParamereterValue]]#[SpecialChoice:![CHOICENAME=![OPTION,]]]
' Example: 
' Some text.TechInfo:Prozessor=AMD,RAM=128;SpecialChoice:Color=Red,Green,Blue;Size=S,L,XXL
' pagePart = 1, 2 ,3 ,4 .. .usw 
'****************************************************************************
function  makeProductPage(ArtNr, pagePart)
    call onProductView(ArtNR)
	If Session("ADMIN") <> "" then  ' if the administrator is logged in then show link for changing of prices and so on 
	   response.write "<h1><a href='admin/genericasp/tableRedirector_Products.asp?ArtNr=" & ArtNr & "'>Artikel Bearbeiten </a></h1>"	 
	End If 

	Dim filenameForTemplate 
	if pagePart = "" then pagePart = 1 
	'filenameForTemplate =  "skins/skin" & SkinNumber & "/pages/productPage_part" &  pagePart  & ".htm"
	
	'New Feature from Immo / 26-08-2004 
	'check if the category of the product has another template file defined and use it if so ! 
	Dim possibleFilename_ProductTemplate: possibleFilename_ProductTemplate = findTemplateForProductFromCache(tablevalue("grArtikel","ArtNr",ArtNr,"ArtKatNr"))
	'clean 
	if InStr(possibleFilename_ProductTemplate, "nicht vorhanden") > 0 or _
	   possibleFilename_ProductTemplate = NOT_DEFINED then 
		possibleFilename_ProductTemplate = "" 'clean because of function error 
	end if 
	 
	filenameForTemplate = "skins/skin" & SkinNumber & "/pages/productPage_part" &  pagePart & possibleFilename_ProductTemplate & ".htm"
	if showDebug() then response.Write "<br>filenameForTemplate="& filenameForTemplate 
	'Response.Write filenameForTemplate & Server.MapPath(filenameForTemplate) : Response.Flush
	Dim template 
	Dim ArtKatNR
	
	template = makeProductPageWithTemplate(ArtNr, readTextFile(Server.MapPath(filenameForTemplate)))
	ArtKatNR = tablevalue("grArtikel","artNR",artNR,"ArtKatNR")
	makeProductPage = parseTemplate(template,ArtKatNr)
end function

'===============================================================================
' ArtNr - Integer 
' productTemplate - HTML of the template containing the tags. 
' For the tags see File shop_skins_functionality.xml
'===============================================================================
public function  makeProductPageWithTemplate(ByVal ArtNr, ByRef productTemplate)

Dim Sql
Dim rsArtikel 
if ArtNr= "" then 
   makeProductPageWithTemplate = "Es wurde keine ArtNr übergeben!": exit function 
end if 

sql = " SELECT Firma, lieferantenAdressen.Picture as FirmaImage, lieferantenAdressen.web as HerstellerLink, " & _ 
      " ArtNr , EAN, ArtKatNR, grArtikel.Picture , PreisATS , Bezeichnung1, Bezeichnung , MWST, HErstellerRabatt, HerstellerRabattText, " & _
      " ProduktAktiv, Beschreibung, Modifikationen, herstellerNr, LieferantNr, Gewicht " & _ 
      " FROM grArtikel, lieferantenAdressen " & _ 
      " Where lieferantenAdressen.IDNR = grArtikel.herstellerNr " & _ 
      " AND ArtNr=" & ArtNr

Set rsArtikel  = objConnectionExecute(sql)

if  rsArtikel.EOF then
	makeProductPageWithTemplate = getTranslation("Es sind keine Daten fuer dieses Produkt verfuegbar!") & " ArtNR=[" & artNr & "]"
	rsArtikel.close 
	exit function 
end if 

'product found 

Dim Firma, FirmaImage, HerstellerLink, Picture, PreisATS , Bezeichnung1, Bezeichnung , Beschreibung , MWSTGROUP
Dim BeschreibungWithoutTechInfo, Modifikationen, EAN, ProduktAktiv, ArtKatNR
Dim herstellerRabatt, herstellerRabattText 
Dim herstellerNr, LieferantNR
Dim Gewicht

Firma= rsArtikel("Firma")
HerstellerLink= rsArtikel("HerstellerLink")

FirmaImage = rsArtikel("FirmaImage")
ArtNr = rsArtikel("ArtNr")
Picture = rsArtikel("Picture") 

Bezeichnung1 = Server.HTMLEncode(IntraSellPreise().getLieferantLagerInfo(ArtNr)&"")

Bezeichnung = rsArtikel("Bezeichnung") & ""
Bezeichnung = getTranslationDok("grArtikel" , ArtNr, "Bezeichnung", Bezeichnung & "", Language)
Bezeichnung = Server.HTMLEncode(Bezeichnung&"")

MWSTGROUP =  rsArtikel("MWST")

EAN = rsArtikel("EAN")
ArtKatNR = rsArtikel("ArtKatNR")

HerstellerNr = rsArtikel("HerstellerNr")
LieferantNR = rsArtikel("LieferantNR")

'PreisATS is going to be calculated now 
if inStr(productTemplate,"[makeBruttoPreis]") > 0 then 
	PreisATS = getPreis(getLOGIN(), ArtNr, 1)
	PreisATS = makeBruttoPreis(PreisATS, MWSTGROUP, session("Land"))
	PreisATS = formatNumber(PreisATS, 2)
end if 

if not isPurchasingAllowed() then 
     PreisATS = getTranslation("Login für Preise!")
end if 

herstellerRabatt = rsArtikel("herstellerRabatt") : if herstellerRabatt = 0 then herstellerRabatt = ""
herstellerRabattText = rsArtikel("herstellerRabattText") 
ProduktAktiv = rsArtikel("produktAktiv")
herstellerNr= rsArtikel("herstellerNr")
Gewicht= rsArtikel("Gewicht")

Beschreibung = rsArtikel("Beschreibung") & ""
Beschreibung = getTranslationDok("grArtikel" , ArtNr, "Beschreibung", Beschreibung & "", Language)
Modifikationen = rsArtikel("Modifikationen")

'GT: alwas parse the product 
if herstellerNr=getLOGIN() or LieferantNR=getLOGIN() or true then 'Das ist der inserat anbieter und er darf die seite sehen!
   'response.Write "Dieses Objekt ist nicht aktiv!"
else 'do not allow to see this page 
	if ProduktAktiv=0 then  
		makeProductPageWithTemplate = getTranslation("Produkt ist deaktiviert und wird nicht mehr ausgeliefert!")
		rsArtikel.close 
		set rsArtikel = nothing 
		exit function 
	end if 
end if 


if instr(ucase(Beschreibung),ucase(TECHINFOCONSTANT))> 0 then 
	BeschreibungWithoutTechInfo = left(Beschreibung, instr(ucase(Beschreibung), ucase(TECHINFOCONSTANT))-1)
else 
	BeschreibungWithoutTechInfo =  Beschreibung
end if 

if instr(ucase(BeschreibungWithoutTechInfo),ucase(SPECIALCHOICECONSTANT))> 0 then 
	BeschreibungWithoutTechInfo = left(BeschreibungWithoutTechInfo, instr(ucase(BeschreibungWithoutTechInfo),ucase(SPECIALCHOICECONSTANT))-1)
end if 

const replacements = 999

dim imgTagPicture, imgTagPictureLarge
'imgTagPicture = "<a href=""default.asp?artNr=" & artNr & """>"& makeImgTag(Picture,Bezeichnung,200) & "</a>"
imgTagPicture = makeImgTag(Picture,Bezeichnung,PRODUCT_IMAGE_MIDDLE_MAX_SIZE) 
imgTagPictureLarge = "<a href=""default.asp?artNr=" & artNr & """>"& makeImgTag(Picture,Bezeichnung,PRODUCT_IMAGE_BIG_MAX_SIZE) & "</a>"

productTemplate = replace(productTemplate,"[ArtNr]",artNr&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[ProduktAktiv]",produktAktiv&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[EAN]",EAN &"", 1, replacements, 1)
productTemplate = replace(productTemplate,TAG_BEZEICHNUNG,Bezeichnung&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[Bezeichnung1]",Bezeichnung1&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[MWSTGROUP]",MWSTGROUP&"", 1, replacements, 1)
productTemplate = replace(productTemplate,TAG_BESCHREIBUNG,BeschreibungWithoutTechInfo&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[Firma]",Firma&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[HerstellerLink]",HerstellerLink&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[makeImgTagFirma]",makeImgTag(FirmaImage,Firma,60)&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[makeImgTag]",imgTagPicture&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[makeImgTagLarge]",imgTagPictureLarge&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[Modifikationen]",Modifikationen&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[makeBruttoPreis]", preisATS, 1, replacements, 1)
productTemplate = replace(productTemplate,"[HerstellerNr]",herstellerNr, 1, replacements, 1)

'new 12.10.2004
productTemplate = replace(productTemplate, "[Picture]", Picture&"", 1, replacements, 1)

'new 12.10.2004
productTemplate = replace(productTemplate, "[Gewicht]", Gewicht&"", 1, replacements, 1)

call replaceEigenschaftenAndMore(ArtNr,productTemplate)
    
      
if inStr(productTemplate,"[minLieferantVKPreis]") > 0 then 
  dim p: p = formatNumber(getLieferantPreis(ArtNR,true,true),2)
	productTemplate = replace(productTemplate, "[minLieferantVKPreis]", p)
end if 


productTemplate = replace(productTemplate,"[herstellerRabatt]",herstellerRabatt&"", 1, replacements, 1)
productTemplate = replace(productTemplate,"[herstellerRabattText]",herstellerRabattText&"", 1, replacements, 1)
 
if inStr(productTemplate,"[compareProductsSelectForm]") > 0 then 
	productTemplate = replace(productTemplate,"[compareProductsSelectForm]",compareProductsSelectForm(ArtNR)&"", 1, replacements, 1)
end if 

productTemplate = replace(productTemplate,"[HTMLInfo]",getHTMLInfo(ArtNR)&"", 1, replacements, 1)

productTemplate = replace(productTemplate,"[makeListKeywords]",makeListKeywords(ArtNR)&"", 1, replacements, 1)

productTemplate = replace(productTemplate, TAG_CREATEPRODUCTSPECIALCHOICE, createProductSpecialChoice(Modifikationen)&"", 1, replacements, 1)

if inStr(productTemplate,"[createTechnicalInfo]") > 0 then 
	productTemplate = replace(productTemplate,"[createTechnicalInfo]",createTechnicalInfo(Beschreibung)&"", 1, replacements, 1)
end if 

if inStr(productTemplate, TAG_CREATESTAFFELPREISTABLE) > 0 then 
	productTemplate = replace(productTemplate, TAG_CREATESTAFFELPREISTABLE,createStaffelPreiseTable(ArtNr)&"", 1, replacements, 1)
end if 

if inStr(productTemplate,"[makeReviewStars]") > 0 then 
	productTemplate = replace(productTemplate, "[makeReviewStars]", makeBewertungStars(artNr)&"", 1, replacements, 1)
end if 

if inStr(productTemplate,"[count_product_reviews]") > 0 then 
	productTemplate = replace(productTemplate, "[count_product_reviews]", makeBewertungAnzahl(artNr)&"", 1, replacements, 1)
end if 

if inStr(productTemplate,"[makeReviewsPage]") > 0 then 
	productTemplate = replace(productTemplate, "[makeReviewsPage]", makeReviewsPage(artNr)&"", 1, replacements, 1)
end if 

if getLOGIN()<>"" or true then 
	productTemplate = replace(productTemplate,"[makeWriteReviewForm]",makeWriteReviewForm(ArtNR)&"", 1, replacements, 1)
else 
	productTemplate = replace(productTemplate,"[makeWriteReviewForm]",getTranslation("Nur registrierte Benutzer k&ouml;nnen Bewertungen abgeben!"), 1, replacements, 1)
end if  

if inStr(productTemplate,"[verwandteProdukte]") > 0 then 
	productTemplate = replace(productTemplate,"[verwandteProdukte]",makeRelatedArtikelList(ArtNr,"ALLE")&"", 1, replacements, 1)
end if 

'erweiterte Ersetzung mit Typ 

call replaceRelatedProductsTag(ArtNr,productTemplate)


if inStr(productTemplate,"[DieAnderenKaufenAuch]") > 0 then 
	productTemplate = replace(productTemplate,"[DieAnderenKaufenAuch]",makeRelatedArtikelListOtherUsersBuy(ArtNr)&"", 1, replacements, 1)
end if 

if inStr(productTemplate,"[priceCompare].[makeProductMechantList]") > 0 then 
	productTemplate = replace(productTemplate,"[priceCompare].[makeProductMechantList]",makeProductMechantList(ArtNr)&"", 1, replacements, 1)
end if 

if inStr(productTemplate,"[HerstellerAdresse]") > 0 then 
	productTemplate = replace(productTemplate,"[HerstellerAdresse]",printAddressLieferant(HerstellerNr), 1, replacements, 1)	
end if 

'Hersteller INFOS 
dim sqlHerstLogo: sqlHerstLogo = "select la.Picture from grArtikel a, LieferantenAdressen la where a.herstellerNr=la.idnr and a.artnr=" & artNr
dim herstellerPicture: herstellerPicture = FirstValue(sqlHerstLogo)

if inStr(productTemplate,"[HerstellerLogo]") > 0 then     
    dim htmlPicture: htmlPicture = ""
    if len(herstellerPicture&"") > 4 then htmlPicture = "<img src='" & herstellerPicture & "' border='0'>" 
	productTemplate = replace(productTemplate,"[HerstellerLogo]", htmlPicture, 1, replacements, 1)	
end if 

if inStr(productTemplate,"[HerstellerLogoURL]") > 0 then 
    sqlHerstLogo = "select la.Picture from grArtikel a, LieferantenAdressen la where a.herstellerNr=la.idnr and a.artnr=" & artNr
	productTemplate = replace(productTemplate,"[HerstellerLogoURL]", herstellerPicture&"", 1, replacements, 1)	
end if 

if inStr(productTemplate,"[LieferantAdresse]") > 0 then 
	productTemplate = replace(productTemplate,"[LieferantAdresse]",printAddressLieferant(LieferantNr), 1, replacements, 1)	
end if 
rsArtikel.close 

'SQL and SQL_SIMPLE ? 
call replaceEmbededSQL(productTemplate)



makeProductPageWithTemplate = productTemplate

end function


'replases embeded SQL in the product template 
function replaceEmbededSQL(byRef template)
'const TAG_SQL = "[SQL:<![CDATA[" '[SQL:<![CDATA[select count(*) anz from pricecomparehaendler;]]>]
'const TAG_SQL_SIMPLE = "[SQL_SIMPLE:<![CDATA["
'const TAG_SQL_END = "]]>]" 
 
 Dim TAG_EMBED_FULL, html
 Dim embededSQL, nextBracketPos
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
			template = replace(template, TAG_EMBED_FULL, html)
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
			template = replace(template, TAG_EMBED_FULL, html)
    end if   
    
end function 



'Private Funktion 
function replaceEigenschaftenAndMore(byval artnr, byref productTemplate)
  Dim html, nextBracketPos1, typ, tagFull
  
  while InStr(productTemplate, TAG_EIGENSCHAFT_) > 0  'TAG_TOPPRODUCTSrequest
     nextBracketPos1 = InStr(InStr(productTemplate, TAG_EIGENSCHAFT_),productTemplate, "]")
     typ = mid(productTemplate, InStr(productTemplate, TAG_EIGENSCHAFT_) + len(TAG_EIGENSCHAFT_)+1 , _
       -(len(TAG_EIGENSCHAFT_)+1) + nextBracketPos1 - InStr(productTemplate, TAG_EIGENSCHAFT_))
     tagFull = TAG_EIGENSCHAFT_ & ":" & typ &  "]"
	 html =  getEigenschaft(artnr, typ)
     productTemplate = replace(productTemplate, tagFull, html) 
  wend


  while InStr(productTemplate, TAG_IMAGETAGNAME_) > 0  'TAG_TOPPRODUCTSrequest
     nextBracketPos1 = InStr(InStr(productTemplate, TAG_IMAGETAGNAME_),productTemplate, "]")
     typ = mid(productTemplate, InStr(productTemplate, TAG_IMAGETAGNAME_) + len(TAG_IMAGETAGNAME_)+1 , _
       -(len(TAG_IMAGETAGNAME_)+1) + nextBracketPos1 - InStr(productTemplate, TAG_IMAGETAGNAME_))
     tagFull = TAG_IMAGETAGNAME_ & ":" & typ &  "]"
	 html =  makeImgTag(typ, typ, PRODUCT_IMAGE_BIG_MAX_SIZE)
     productTemplate = replace(productTemplate, tagFull, html)
  wend
  
  while InStr(productTemplate, TAG_HTMLINFONAME_) > 0  'TAG_TOPPRODUCTSrequest
     nextBracketPos1 = InStr(InStr(productTemplate, TAG_HTMLINFONAME_),productTemplate, "]")
     typ = mid(productTemplate, InStr(productTemplate, TAG_HTMLINFONAME_) + len(TAG_HTMLINFONAME_)+1 , _
       -(len(TAG_HTMLINFONAME_)+1) + nextBracketPos1 - InStr(productTemplate, TAG_HTMLINFONAME_))
     tagFull = TAG_HTMLINFONAME_ & ":" & typ &  "]"
	 html =  getHtmlInfoName(artnr, typ)
     productTemplate = replace(productTemplate, tagFull, html)
  wend
  
end function 


'==============================================================================
'Ersetzt den Tag TAG_VERWANDTE_PRODUKTE_ mit der liste der Produkte  
'==============================================================================
function replaceRelatedProductsTag(byval artnr, byref productTemplate)
  Dim html, nextBracketPos1, typ, tagFull
  
  while InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_) > 0  'TAG_VERWANDTE_PRODUKTE_ 
     nextBracketPos1 = InStr(InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_),productTemplate, "]")
     typ = mid(productTemplate, InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_) + len(TAG_VERWANDTE_PRODUKTE_)+1 , _
       -(len(TAG_VERWANDTE_PRODUKTE_)+1) + nextBracketPos1 - InStr(productTemplate, TAG_VERWANDTE_PRODUKTE_))
     tagFull = TAG_VERWANDTE_PRODUKTE_ & ":" & typ &  "]"
	 html =  makeRelatedArtikelList(artnr, typ)
     productTemplate = replace(productTemplate, tagFull, html) 
  wend
  
end function 

'****************************************************************************
' Create Technical Info Table 
' takes the TechInfo information from product description 
' Needs: for example 
' blie blie TechInfo:RAM=256,BUS=123,POS=123
'****************************************************************************
function  createTechnicalInfo(byVal Beschreibung)
	dim html : 
	Beschreibung = Beschreibung & ""

  Dim posTI
      posTI = inStr(ucase(Beschreibung), ucase(TECHINFOCONSTANT)) 
  if Beschreibung= "" or trim(Beschreibung) = "" or posTI <=0 then 
    createTechnicalInfo ="Keine technische Info vorhanden"
    exit function 
  end if 
 
 
  posTI  = posTI + len(TECHINFOCONSTANT)
  
  Dim TechInfo
      TechInfo = mid(Beschreibung, posTI) 
      
  Dim spezChoicePos:  spezChoicePos =   InStr(ucase(TechInfo),ucase(SPECIALCHOICECONSTANT))
  
  'Response.Write "spezChoicePos=" & spezChoicePos
  if  spezChoicePos > 0 then 
     TechInfo = left(TechInfo, spezChoicePos)
  end if     
  
  

  html = html & getTranslation("Technische Informationen:")
  html = html & "<table border=1 width='100%' cellspacing=0><tr>"
 
	Dim parameter, value , splitterPos, TIPair 
		for each TIPair in Split(TechInfo,",")
				splitterPos  = inStr(TIPair,"=") 
				parameter = left(TIPair,splitterPos-1) 
				value      = mid(TIPair,splitterPos+1) 
		
				html = html & "<tr><td border='0' width='100'>" & parameter & "</td>" 
				html = html & "<td border='0' width='300'>" & value & "</td></tr>"
		next 
  html = html & "</table>"
    
  createTechnicalInfo = html
end function  


 
  function getHTMLInfo(ArtNr)
	'SHOW HTML INFO IF DEFINED 
	Dim html
	dim htmlInfoSQL, hiRS : htmlInfoSQL  = "select HTLMInfo from [grArtikel-HTMLInfo] " & _ 
	      " where ArtNr=" & ArtNr
	set hiRS = objConnectionExecute(htmlInfoSQL)
	while not hiRS.eof 
	'if len(hiRS("HTLMInfo"))>0 then 
	   'html = html & "<h4>Weitere Informationen</h4>"
	   html = html &  hiRS("HTLMInfo")
	'end if
	   hiRS.moveNExt 
	wend 
	getHTMLInfo = html 
end function 	
 
	

Public Function getHTMLInfoName(ArtNR, infoAutorName)
    dim sql: sql= "select HTLMInfo from [grArtikel-HTMLInfo] " & _
                   " where Autor like '" & infoAutorName & "' and ArtNr=" & ArtNr

	dim rs: set rs = ObjConnectionExecute(sql)
	getHTMLInfoName = "" 
	if not rs.eof then 
		getHTMLInfoName = rs("HTLMInfo") 
	End If
	rs.Close
End Function

	
'****************************************************************************
' Create Secial Choice 
' takes the SpecialChoice information from product description and makes combos for the user to select from 
' Needs: for example 
' SpecialChoice:Color=RED,GREEN,BLUE;Size=24,25,38;
'****************************************************************************
function createProductSpecialChoice(byVal SpecialChoice)
dim html 
	SpecialChoice = SpecialChoice & ""
 
 if trim(SpecialChoice) = "" then  
			createProductSpecialChoice =""
			exit function 
  end if 
 html = "W&auml;hlen Sie:"
 html = html & "<table>"
 
  Dim parameter, value , splitterPos, Pair 
  for each Pair in Split(SpecialChoice,";")
   html = html & "<tr>"
  
   splitterPos  = inStr(Pair,"=") 
   if splitterPos>0 then 
   parameter = left(Pair,splitterPos-1) 
   value     = mid(Pair,splitterPos+1) 
   
   html = html & "<td>" & parameter & "</td>"
   html = html & "<td>"
   html = html & "<select name=""Notiz"">"
  
   Dim choice
   for each Choice in split(value,",") 
   
   html = html & " <Option>" & choice
   
   next
   html = html & "</select></td>"
 
   end if ' splitter pos>0
  
  html = html & "</tr>"
 
  next 
 html = html & "</table>"
 createProductSpecialChoice = html 
end function  


'****************************************************************************
' Create Stafelpreise Tabelle
'****************************************************************************
function  createStaffelPreiseTable(ArtNr)
dim html 
	dim sql 
	sql = "Select ArtNr, StkAb from [grArtikel-Staffelpreise] where ArtNr=" & ArtNR
   dim rs
   set rs = objConnectionExecute(sql)
   if rs.eof then
     createStaffelPreiseTable = "keine Staffelung m&ouml;glich"
     exit function
   end if 
   
  html ="<table border=0 cellpadding=0>"
  html = html & "<tr>"
  html = html & "<th colspan=2 valign=""top"" bordercolor=""#CECFCE"">Stafelpreise</th>"
  html = html & "</tr>"
 
  
  dim stkAb,  Preis 
  While not  rs.EOF 
   stkAb  = rs("StkAb") 
   preis  =  Formatnumber(makeBruttoPreis2(ArtNr, stkAb, session("Land")))
  
   
   html = html & "<tr><td border=0 width=106 >ab" & stkAb & " Stk&nbsp;</td>"
   html = html & "<td border=0 width=277>" &  preis & "&nbsp;</td ></tr>"
  
   rs.moveNext 
  WEND
  rs.close 
  html = html & "</table>"
 createStaffelPreiseTable = html 
end function 

'****************************************************************************
' Product Page Small Detail  
'****************************************************************************
function makeProductPageSmallWithTemplate(byval ArtNr, byVal pageFrom, byVal htmlTemplate, byVal maxImageSize)
'Response.Write "makeProductPageSmall for " & ArtNR
makeProductPageSmallWithTemplate = "..." 
Dim html
Dim Sql
Dim rsArtikel 
sql = " SELECT grArtikel.ArtNr, EAN, ArtKatNR, grArtikel.Picture, Bezeichnung, Bezeichnung1, PreisATS, "&_
      " MWST, Firma, lieferantenAdressen.Picture as FirmaImage, MWST, Beschreibung, Modifikationen, " &_ 
      " herstellerRabatt, herstellerRabattText FROM grArtikel, lieferantenAdressen " & _ 
      " Where lieferantenAdressen.IDNR = grArtikel.herstellerNr " & _ 
      " AND ArtNr=" & ArtNr


Set rsArtikel  = objConnectionExecute(sql)

if  rsArtikel.EOF then
   html = "<font size='1' color='red'>"& getTranslation("Sie haben kein Produkte ausgewaehlt!") & "</font>"
else 
	Dim Beschreibung:Beschreibung=rsArtikel("Beschreibung")
	'Beschreibung = getTranslationDok("grArtikel" , ArtNr, "Beschreibung", Beschreibung & "", Language)
	Beschreibung = makeBeschreibung ( ArtNr, true)

	Dim Modifikationen: Modifikationen = rsArtikel("Modifikationen")
	Dim Firma: Firma = rsArtikel("Firma")
	Dim FirmaImage:FirmaImage=rsArtikel("FirmaImage")
	Dim Bezeichnung: Bezeichnung = Server.HTMLEncode(rsArtikel("Bezeichnung")&"")
	    Bezeichnung = getTranslationDok("grArtikel" , ArtNr, "Bezeichnung", Bezeichnung & "", Language)
	    Bezeichnung = Server.HTMLEncode(Bezeichnung) 
	
	Dim Bezeichnung1: Bezeichnung1 = Server.HTMLEncode(IntraSellPreise().getLieferantLagerInfo(ArtNr)&"") 'rsArtikel("Bezeichnung1")
	Dim Picture: Picture = rsArtikel("Picture")
	Dim ArtKatNr : ArtKatNr = rsArtikel("ArtKatNr")
    Dim MWSTGROUP: MWSTGROUP =  rsArtikel("MWST")
    Dim herstellerRabatt: herstellerRabatt = rsArtikel("herstellerRabatt") : if herstellerRabatt = 0 then herstellerRabatt = ""
    Dim herstellerRabattText: herstellerRabattText = rsArtikel("herstellerRabattText") 
 
	dim imgTagPicture
	imgTagPicture = "<a href=""default.asp?artNr=" & artNr & """>"& makeImgTag(Picture,Bezeichnung,maxImageSize) & "</a>"

		Dim bruttoPreis: bruttoPreis= getPreis(getLOGIN(), ArtNr, 1)
		bruttoPreis = formatNumber(makeBruttoPreis(bruttoPreis, MWSTGROUP, Session("Land")),2)


	if not isPurchasingAllowed() then 
		bruttoPreis = getTranslation("Login für Preise!")
	end if 

	dim productTemplate

		on error resume next 
		productTemplate = ""&readTextFile(Server.MapPath(htmlTemplate))
		if err.number > 0 or productTemplate="" then
			makeProductPageSmallWithTemplate =  "File is missing:" & htmlTemplate
			exit function 
		end if 

		on error goto 0
		productTemplate = replace(productTemplate,"[ArtNr]",artNr&"")
		productTemplate = replace(productTemplate,"[EAN]",rsArtikel("EAN")&"")
		productTemplate = replace(productTemplate,TAG_BEZEICHNUNG,Bezeichnung&"")
		productTemplate = replace(productTemplate,"[Bezeichnung1]",Bezeichnung1&"")
		productTemplate = replace(productTemplate,"[MWSTGROUP]",MWSTGROUP&"")
		productTemplate = replace(productTemplate,TAG_BESCHREIBUNG,Beschreibung&"")
		productTemplate = replace(productTemplate,"[Firma]",Firma&"")
		productTemplate = replace(productTemplate,"[makeImgTagFirma]",makeImgTag(FirmaImage,Firma,60)&"")
		productTemplate = replace(productTemplate,"[makeImgTag]",imgTagPicture&"")
		productTemplate = replace(productTemplate,"[Modifikationen]",Modifikationen&"")
		productTemplate = replace(productTemplate,"[makeBruttoPreis]",bruttoPreis&"")
		productTemplate = replace(productTemplate,"[HerstellerRabatt]",herstellerRabatt&"")
		productTemplate = replace(productTemplate,"[HerstellerRabattText]",herstellerRabattText&"")
		
		'added at 20.01.2007
		productTemplate = replace(productTemplate, "[Picture]", Picture&"")
		
		if inStr(productTemplate, TAG_CREATEPRODUCTSPECIALCHOICE) > 0 then 
			productTemplate = replace(productTemplate, TAG_CREATEPRODUCTSPECIALCHOICE, createProductSpecialChoice(Modifikationen)&"")
		end if 
		if inStr(productTemplate, "[HTMLInfo]") > 0 then 
			productTemplate = replace(productTemplate,"[HTMLInfo]",getHTMLInfo(ArtNR)&"")
		end if 

		call replaceEigenschaftenAndMore(ArtNr, productTemplate)
		 
		makeProductPageSmallWithTemplate = productTemplate
		end if
		rsArtikel.close
end function 

function makeProductPageSmall(byval ArtNr, pageFrom)
    makeProductPageSmall = makeProductPageSmallWithTemplate(ArtNr, pageFrom, "skins/skin" & SkinNumber & "/pages/productPageSmall.htm",PRODUCT_IMAGE_SMALL_MAX_SIZE)
end function 

function makeProductPageSmallForRelatedProducts(byval ArtNr, pageFrom)
    makeProductPageSmallForRelatedProducts = makeProductPageSmallWithTemplate(ArtNr, pageFrom, _
                                             "skins/skin" & SkinNumber & "/pages/productPageSmall_RelatedProduct.htm", _
                                             PRODUCT_IMAGE_SMALL_MAX_SIZE)
end function 

'****************************************************************************
' Product Page Small Detail  
' for deal of the day...
' product and image are fitting in 200 pixel width
'****************************************************************************
function makeProductPageSmall2(ArtNr, pageFrom )
makeProductPageSmall2 = makeProductPageSmallWithTemplate(ArtNr, pageFrom, _ 
                                       "skins/skin" & SkinNumber & "/pages/productPageSmall.htm", _
                                       PRODUCT_IMAGE_SMALL_MAX_SIZE)
end function


'****************************************************************************
' returns bezeichnung mit link und preis
'****************************************************************************
function makeProductLine(byVal ArtNR, byVal showPrice) 'rs is the record set 
 Dim rs,sql, html
  set rs = objConnectionExecute("select ArtNr, Bezeichnung, MWST from grArtikel where ArtNr=" & ArtNR)
  if rs.EOF then 
	makeProductLine = ""
  else 
    dim bruttoPreis: bruttoPreis=  formatNumber(getPreis(getLOGIN(), ArtNr, 1),2) 'makeBruttoPreis(getPreis(getSID(),ArtNr), rs("MWST"),session("Land"))
        bruttoPreis = formatNumber(makeBruttoPreis(bruttoPreis, rs("MWST"),session("Land")),2)
  
	html  = "<tr><td><a href=""default.asp?ArtNr=" & rs("ArtNr") & """>" & Server.HTMLEncode(rs("Bezeichnung")&"") & "</a></td>" 
	if showPrice then html = html & "<td>" & getCurrencySymbol() & "</td><td align=""right""> " &  formatNumber(bruttoPreis,2) & "</td>" 
    html = html & "</tr>"
	makeProductLine = html
  end if 
  rs.close
end function 



function iff(bool, trueV, falseV)
  if bool then 
  iff = trueV 
  else iff = falseV 
  end if 
end function  

'===============================================================================
' makes table with product features 
'===============================================================================
function makeListKeywords(artNr) 
	Dim sql, rs
	'" [grArtikel-KeyWords].[Order], " & _ 
	sql = "SELECT [grArtikel-KeyWords].Name, [grArtikel-KeyWordsToProducts].Value, " & _ 
	" [grArtikel-KeyWordsToProducts].ArtNr " & _ 
	" FROM [grArtikel-KeyWords] INNER JOIN [grArtikel-KeyWordsToProducts] ON [grArtikel-KeyWords].KeyWordId = [grArtikel-KeyWordsToProducts].KeyWordId " & _ 
	" WHERE [grArtikel-KeyWordsToProducts].ArtNr=" & ArtNR  '& _ 
	'" ORDER BY [grArtikel-KeyWords].[Order]"
	'response.write sql
	set rs = objConnectionExecute(sql)
	if rs.eOF then 
		html = getTranslation("Es sind gerade keine Informationen &uuml;ber diesen Artikel vorhanden!")
		makeListKeywords = html 
		exit function 
	else
		dim html 
		html = "<table border=""2"" bordercolor=""#ffffff"" width=""500"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
		html = html & "<tr>"
		html = html & "<th width=""50%"" bgcolor=""#e0e0e0""></th>"
		html = html & "<th width=""50%"" bgcolor=""#ffffff""></th></tr>"

		while not rs.EOF 
			html = html & "<tr><td width=""50%""  bgcolor=""#e0e0e0"">" & Server.HTMLEncode(rs("Name")&"") & "&nbsp;</td>"
			html = html & "<td width=""50%"" >" & rs("Value") & "&nbsp;</td></tr>"
			rs.movenext 
		wend 
		html = html  & "</table></center>"
		makeListKeywords = html 
	end if 
end function

'===============================================================================
' get One Eigenschaft (Keyword) Value
'===============================================================================
function getEigenschaft(artNr, propertyName) 
	Dim sql, rs
	'" [grArtikel-KeyWords].[Order], " & _ 
	sql = "SELECT [Name], [Value], [ArtNr] " & _ 
	" FROM [grArtikel-KeyWords] INNER JOIN [grArtikel-KeyWordsToProducts] ON [grArtikel-KeyWords].KeyWordId = [grArtikel-KeyWordsToProducts].KeyWordId " & _ 
	" WHERE [grArtikel-KeyWordsToProducts].ArtNr=" & ArtNR & " and [grArtikel-KeyWords].Name Like '" & propertyName & "'"
	'" ORDER BY [grArtikel-KeyWords].[Order]"
	'response.write sql
	getEigenschaft = ""
	set rs = objConnectionExecute(sql)
	if NOT rs.eOF then 
		getEigenschaft = rs("Value") 
	end if 
	rs.close
end function





 
function makeReviewsPage(artNr) 
Dim html
Dim artKatNr: artKatNr = clng(tablevalue("grArtikel","ArtNr", ArtNr,"ArtKatNr"))

html = html & "<table name=""reviews"" border=""0"" cellspacing=""0"" cellpadding=""0"" align=""center"">"
html = html & "<tr><td valign=""top"" width=""100%"">"
'html = html & "<a href="writeReview.asp?ArtNr=ArtNr">Review verfassen</a> 
 
 
Dim Sql
sql =" SELECT [grArtikel-Reviews].DateCreation, grArtikel.Bezeichnung, [grArtikel-Reviews].Points, " & _ 
     " [grArtikel-Reviews].Autor, [grArtikel-Reviews].Review, [grArtikel-Reviews].ReviewID, grArtikel.ArtNr " & _ 
     " FROM grArtikel INNER JOIN [grArtikel-Reviews] ON grArtikel.ArtNr = [grArtikel-Reviews].ArtNR " & _  
     " WHERE grArtikel.ArtNr =" & ArtNr & _ 
     " ORDER BY [grArtikel-Reviews].DateCreation DESC"

'Response.Write sql
Dim rsArtikel , rsTop, inRow
 
Set rsTop  = objConnectionExecute(sql)
if rsTop.BOF and rsTop.EOF then
      html = getTranslation("Derzeit keine Bewertungen vorhanden.")
	  makeReviewsPage = html 
	  exit function 	 
else	
	while not rsTop.EOF 
        'call drawWindow("Beitrag von " & rsTop("Autor"), "Datum:" & rsTop("DateCreation") & "<BR>" & rsTop("Review"),"",butArrEmpty)	
        html = html &  drawWindowForum(getTranslation("Beitrag von ") & rsTop("Autor"), _ 
                                       getTranslation("Datum:") & rsTop("DateCreation") ,_
                                       rsTop("Review"),"")		 
		rsTop.moveNext	    
	wend

end if
rsTop.close
html = html & "</tr></table>"
makeReviewsPage = html
end function 



function makeWriteReviewForm(ArtNr)
	dim html: html = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/writeProductReviewForm.htm"))	
	if getLOGIN() <> "" then 
	html = replace(html,"[Autor]",TABLEVALUE("ofAdressen","IDNR",getLOGIN(),"Email"))
	else 
	html = replace(html,"[Autor]","Anonym")
	end if 
	html = replace(html,"[ArtNr]",ArtNR)
	makeWriteReviewForm = html
end function 

function saveReviewProduct()
Dim ArtNr: artNr = request("ArtNR")
Dim Sql
     ' call drawErrorBox("Error", "Keine Reviews vorhanden!", "", "")
if request("Review") <> "" then ' the user writes comment
   sql = "INSERT INTO [grArtikel-Reviews] (Autor, Points, Review, ArtNr, DateCreation)" & _ 
         " Values ('" & request("Autor") & "'," & request("Points") & ",'" & request("Review") &  "'," & request("ArtNr") &  "," & SQLNOW(0) & ")" 
   
   'Response.Write sql: Response.Flush
   objConnectionExecute(sql)
   response.write getTranslation("Danke! Ihre Kommentare wurden erfolgreich gespeichert!") 
   
   call addUserPoints(getLOGIN(),COUNT_POINTS_WRITE_REVIEW,REASON_WRITE_REVIEW)
   
   call addUserPoints(getLOGIN(),COUNT_POINTS_PRODUCT_RATING,REASON_PRODUCT_RATING)
  

else 
if request("Points")<>"" then ' the user pressed save without writing comment 
   call drawErrorBox("Error", "Sie m&uuml;ssen auch ein Kommentar verfassen!", "", "")
end if 
end if 

end function 





'==========================================================================================
' creates image html for the product "bewertung" 
'==========================================================================================
function makeBewertungStars(byVal artNr)
   dim sql,rs 
     sql  ="select avg(Points)as aPoints from [grArtikel-Reviews] where ArtNr=" & ArtNr & " having count(*) >=3"
     set rs = objConnectionExecute(sql)
     if not rs.eof then
        dim points 
         points = rs("aPoints") 
         if points - round(points,0)<= 0.25 or round(points,0)-points > 0.75 then 
            points = round(points,0) 
         else 
            points = cint(points) + 0.5 
         end if 
            
         dim imageName: imageName = "" & replace(round(points,1),".",",")
         makeBewertungStars = "<img alt="""& Points &" Points"" src=""skins/skin" & SkinNumber & "/images/imagesStars/" & imageName & ".gif"">" 
     else    
     makeBewertungStars = "" 
     end if 
     rs.close 
     set rs = nothing
    
end function 

'==========================================================================================
' creates count  
'==========================================================================================
function makeBewertungAnzahl(byVal artNr)
   dim sql,rs 
   makeBewertungAnzahl = 0
     sql  ="select count(Points)as aPoints from [grArtikel-Reviews] where ArtNr=" & ArtNr & " having count(*) >=3"
     set rs = objConnectionExecute(sql)
     if not rs.eof then
         makeBewertungAnzahl = rs("aPoints") 
     end if 
     rs.close 
     set rs = nothing
end function 

'==========================================================================
'this functions is called everytime the product page is shown 
'==========================================================================
function onProductView(byval ArtNR)
   if request("nostats") = "true" then exit function 
   
   Const DAYS_TO_LOOK_BACK = 3
   dim sql, rs  
   sql = "select * from webProductClicks WHERE  ArtNR=" & ArtNR
   sql = sql & " and FIRSTCLICK >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK_CLICKS) 
   
   set rs = objConnectionExecute(sql)   
   if not rs.eof then
      sql = "UPDATE webProductClicks set countClicks = countclicks +1  where ArtNR=" & ArtNR & _ 
            " and FIRSTCLICK >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK_CLICKS) 
   else 
      sql = "insert into webProductClicks (ArtNR, CountClicks, FirstClick) values(" & ArtNR & ",1," & SQLNOW(0) & ")"
   end if 
   
   'response.write sql
   rs.close 
   objConnectionExecute(sql)
   
end function 



'==========================================================================
'this functions is called everytime the product page is shown 
'==========================================================================
function onProductList(byval ArtNR)
   if request("nostats") = "true" then exit function 
   
   Const DAYS_TO_LOOK_BACK = 3
   dim sql, rs  
   sql = "select ArtNR from webProductLists WHERE  ArtNR=" & ArtNR
   sql = sql & " and FIRSTCLICK >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK_CLICKS) 
   
   set rs = objConnectionExecute(sql)   
   if not rs.eof then
      sql = "UPDATE webProductLists set countClicks = countclicks +1  where ArtNR=" & ArtNR & _ 
            " and FIRSTCLICK >= " & SQLNOW(-1*DAYS_TO_LOOK_BACK_CLICKS) 
   else 
      sql = "insert into webProductLists (ArtNR, CountClicks, FirstClick) values(" & ArtNR & ",1," & SQLNOW(0) & ")"
   end if 
   
   'response.write sql
   rs.close 
   objConnectionExecute(sql)
   
end function 


'==========================================================================================
' creates short version max 200 Chars for the product description  
'==========================================================================================
function makeBeschreibung(byVal artNr, byVal cut)
   Dim Beschreibung
    Beschreibung = tablevalue("grArtikel", "ArtNR", ArtNR, "Beschreibung")
    Beschreibung = getTranslationDok("grArtikel" , ArtNr, "Beschreibung", Beschreibung & "", Language)

    if instr(ucase(Beschreibung),ucase(TECHINFOCONSTANT))> 0 then 
	    Beschreibung = left(Beschreibung, instr(ucase(Beschreibung), ucase(TECHINFOCONSTANT))-1)
    else 
	    Beschreibung =  Beschreibung
    end if 

    if instr(ucase(Beschreibung),ucase(SPECIALCHOICECONSTANT))> 0 then 
	    Beschreibung = left(Beschreibung, instr(ucase(Beschreibung),ucase(SPECIALCHOICECONSTANT))-1)
    end if 

    'Just first Chars 
    if cut and (len(Beschreibung) > PRODUCT_SHORT_DESCRIPTION_MAX_SIZE) then 
       Beschreibung = left(Beschreibung, PRODUCT_SHORT_DESCRIPTION_MAX_SIZE) & " ... " & "<a href='?ArtNr=" & ArtNr & "'>" & getTranslation("mehr") & "</a>"
    end if 



   makeBeschreibung = Beschreibung
end function 

'==============================================================================
' Nur registrierte Kunden dürfen einkaufen und die preise sehen!
'==============================================================================
function isPurchasingAllowed()
   isPurchasingAllowed = true 
   
   'set deault    
   if ucase(varvalue_default("ALLOW_PURCHASING_ONLY_FOR_CUSTOMERS", "false")) = "TRUE" then
      if isLoggedIn() then
        if tableValue("ofAdressen", "IdNR", getLOGIN(), "Status") = getTranslation("Kunde") then 
			isPurchasingAllowed = true 'angemeldet
        else 
            isPurchasingAllowed = false 
        end if 
      else   
        isPurchasingAllowed = false 'nicht angemeldet
       end if   
   end if 
end function 

%>
