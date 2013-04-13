<%
'******************************************************************
' Function [createSearchForm]
' Description [Creates the search form for the searchPage]
' Autor: Grigor Tonkov
' Changes: 
'******************************************************************
function createSearchForm(categoryId)
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "SUB_CAT_SEARCHFORM_" & categoryId  
   temp = getDBCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setDBCache(CACHE_NAME,createSearchFormNoCache( ArtKatNr))
   end if    
   createSearchForm = temp 
end function 

function createSearchFormNoCache(categoryId)
  Dim searchFreeText: searchFreeText = request("searchFreeText")
  Const MAX_KEYWORDS_TO_SHOW = 15
  'TODO: make one Query for this 2 queries 
   Dim sql, rs, rsSub, html
   dim use: use =  tableValue("[grArtikel-Kategorien]","ArtKatNr", categoryId, "useKeywordsFromChild")
   'response.write "use=[" & use & "]"
   if use="-1" or use ="1" or use = true then 'use from childs 
      sql = "SELECT min(KeywordId) as KeywordId, [Name], 0 as MaxSizeForComboBox FROM priceCompareKeyWords Where NOT (Enabled=0) " & _ 
            " and ArtKatNR in ( " & makeSubcategoriesList(categoryId,3) & " ) Group By [Name] Order By [Name]"
   else 'do not use from childs 
      sql = "SELECT * FROM priceCompareKeyWords Where NOT (Enabled=0) AND (ArtKatNR=" & categoryId & ")"
   end if 
   'response.write sql:Response.Flush
   set rs = objConnectionExecute(sql)   
   
   
   html = html & "<table width=""180"" border=""0"" ><tr>" 
   html = html & "<form action=""productSearch.asp"" method=""POST"">"   
   html = html & "<td>"   
   html = html & "Suche " '"</td><td>" 
   if not rs.EOF then html = html & "<br>"   
   'free text search 
   html = html & "<input name=""searchFreeText"" value=""" & searchFreeText & """ size=""7"" style=""width: 70%; position: relative;""></td></tr>"   
   
   
   Dim i: i = 0 
   While not rs.EOF and i <MAX_KEYWORDS_TO_SHOW
   i = i + 1 
      dim kwName: kwName = server.htmlEncode(rs("Name"))
      html = html & "<tr><td>" & kwName & "<br>" 
      'html = html &  "</td>"
      sql = "Select distinct [value] from priceCompareKeyWordsToProducts Where KeywordId=" & rs("KeywordId") & " ORDER BY [VALUE]"
      set rsSub = objConnectionExecute(sql)
      
      'html = html & "<td>" 
      'make keywords 
      if rs("MaxSizeForComboBox")>0 AND NOT rsSub.EOF then ' comboBox is needed			
			html = html & "<SELECT Name=""" & kwName & """ style=""width: 70%; position: relative;"">" 
			'response.write "rs(Name)=" & kwName 
			if kwName <> "" and request(kwName)<> "" then html = html & "<OPTION></OPTION>" 'Empty choice for reducing the search criterias
			
			html = html & "<OPTION SELECTED>" & request(kwName)  & "</OPTION>"
			
			while not rsSub.EOF 
			  html = html & "<OPTION>"  & rsSub("Value") & "</OPTION>"
			  rsSub.MoveNext 
			wend 
			rsSub.close: set rsSub = nothing 
			html = html & "</SELECT></td>" 
      else ' text Box 
			html = html & "<Input Name=""" & kwName  & """  value=""" & request(kwName) & """  size=""7"" style=""width: 70%; position: relative;"">" 
      end if 
      
      html = html & "</tr>"
      rs.moveNext
   wend 
   rs.close         
   html = html & "<tr><td>alle Kategorien:<input type=""checkbox"" name=""GlobalSearch"" value=""ON""></td></tr>"
   html = html & "<tr><td  align=center>" 
   '"<input value=""suchen"" type=submit>"
   html = html & "<input border=""0"" src=""menu/suchen.gif"" type=""image""  width=""60"" height=""16""  alt=""Suchen. Für eine erfolgreiche suche, wählen Sie einige Kriterien aus den Komboboxen!"">"
   html = html & "&nbsp;" 
   html = html & "<a href=""hilfe/hilfeSuche.htm"" target=""new""><img width=""60"" height=""16"" border=""0"" src=""menu/hilfe.gif"" alt=""für Hilfe hier klicken...""></a>"
   html = html & "</td></tr>"
   html = html & "</table>"
   
   html = html & "<input type=""Hidden"" name=""PageToShow"" value=""Suchergebnis"">" 
   html = html & "<input type=""Hidden"" name=""ArtKatNr"" value=""" & categoryId & """>"   
   html = html &  "</form>"   
   createSearchFormNoCache = html
end function 


'******************************************************************
' Function [makeBanner]
' Description: Restuns html that represents the banner,
'              that to be shown on the page for the category. 
'              Every time this function is called the counter for
'              the banner is increased by one and new record is written in 
'              the banner log table. 
' Autor: 
' Changes: 
'
' ArtKatNr - the category Id
' Nr - is the banner number
'******************************************************************
'Dummy implementation
'function makeBanner(ArtKatNr, Nr) 
'  makeBanner = "<img border=""0"" src=""../banners/Intrasell.gif"" alt="""" width=468 height=60>"
'end function 
'REal implementation from spas, Grigor
function makeBanner( ArtKatNr, Nr ) 
	Dim sql1
	Dim rsBan
	Dim bannerString
	Dim remoteAddress: remoteAddress = Request.ServerVariables("REMOTE_ADDR") 
	Dim localURL: localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
	sql1 = " SELECT * FROM priceCompareBanners  " & _ 
	       " WHERE bannerName = '" & Nr & "' and CatId = " & ArtKatNr & _
	       " AND ActiveFrom<= getdate() AND ACTIVETO>= getdate() " & _
	       " AND MaxImpressionsCount >= ImpresionsCount " & _ 
	       " ORDER BY ImpresionsCount" ' this way we will show alwas the banner with smallest impressions
	set rsBan = objConnectionExecute( sql1)
	
	
	'Response.Write sql1
	
	if rsBan.BOF and rsBan.EOF then ' no such banner
		'bannerString = "Banner not found"
		exit function 
	else	'new record in banner logs
		sql1 = "INSERT INTO PriceCompareBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
			  " Values( " & rsBan("BannerId") & ",'" & remoteAddress & "'," & localURL & "'," & "'View')"
       'response.write sql1
		objConnectionExecute( sql1 )
		'increment impressions 
		sql1 = "UPDATE priceCompareBanners set ImpresionsCount = ImpresionsCount  + 1  WHERE bannerId = " & rsBan("BannerId")
		objConnectionExecute( sql1 )
		dim target : target = "" 
		if rsBan("openInNewWindow") then 
		  target = "target =""_new""" 
		end if 
		bannerString = "<a " & target & " href=""RedirectBanners.asp?ID=" & rsBan("bannerId") & """>"
		bannerString = bannerString & "<img border=""0""  src=""" & rsBan("BannerFile") & """ alt=""" & rsBan("BannerName") & """></a>"
	end if	
	rsBan.close
	set rsBan = nothing
	makeBanner = bannerString
end function



'searches for the first non empty template 
function findTemplate(byVal artKatNr)
	'Response.Write "Search"
	Dim catTemplate
	catTemplate = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "PriceCompareTemplate")
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


'
' the image is shown as head for the table 
'
function drawAreaHTML_WithImage(Title, Body, State, Width, ImageUrl)
Dim html
html =  html & "<table align=""center"" border=""0"" width=""190"" cellspacing=""0"" cellpadding=""0"">"
html =  html & "  <tr>"
html =  html & "    <td colspan=""3"" align=""center""><img border=""0"" src=""" & ImageUrl & """></td>"
html =  html & "  </tr>"
html =  html & "  <tr>"
html =  html & "    <td width=""5"">&nbsp;</td>"
html =  html & "    <td width=""190"">"
html =  html & "      <table border=""0"" width=""100%"" cellspacing=""0"" cellpadding=""0"">"
html =  html & "        <tr>"
html =  html & "          <td bgcolor=""#FFFFFF"" width=""100%"" style=""border-top: 0 solid #808080; border-left: 0 solid #808080; border-right: 1 solid #808080; border-bottom: 1 solid #808080"">&nbsp;"
html =  html & Body
html =  html & "          </td>"
html =  html & "        </tr>"
html =  html & "      </table>"
html =  html & "    </td>"
html =  html & "    <td width=""8"">&nbsp;</td>"
html =  html & "  </tr>"
html =  html & "</table>"
drawAreaHTML_WithImage = html
end function 


'=========================================================
' Implemented by Grigor Tonkov 
'    caching strategy
'    cache expires in 30 seconds 
'=========================================================
function getCache(byVal HASHNAME)	        
	getCache = Application(HASHNAME)	         
	Dim expiresOn: expiresOn = Application(HASHNAME & "_EXPIRESON") 
	'response.write "Cache expires on "& expiresOn

	if getCache<>"" then
	'response.write "Cache full!"
	else 
	'response.write "Cache empty!"
	end if 

	if expiresOn<> "" and expiresOn<NOW() then 'expired return null 
		'response.write "Cache expired! "& expiresOn
		getCache = ""
	end if 
end function 

function setCache(byVal HASHNAME, byVal stringValue)
    Application(HASHNAME) = stringValue
    Application(HASHNAME & "_EXPIRESON") = NOW() + CACHE_EXPIRE_TIME_IN_MINUTES*1/(24*60)   'in 5 minutes will expire serverside
end function 


%>