<%
    '******************************************************************
    ' Function [createSearchForm]
    ' Description [Creates the search form for the searchPage]
    ' Autor: Grigor Tonkov
    ' Changes: 
    '******************************************************************
function createSearchForm(categoryId)
    Dim temp
    Dim CACHE_NAME : CACHE_NAME = "SUB_CAT_SEARCHFORM_" & categoryId
    temp = getDBCache(CACHE_NAME)
    If temp = "" Then 'set cache  
        temp = setDBCache(CACHE_NAME, createSearchFormNoCache(ArtKatNr))
    End If
    createSearchForm = temp
End Function

Function createSearchFormNoCache(ByVal categoryId)
    Dim searchFreeText : searchFreeText = Request("searchFreeText")
    Const MAX_KEYWORDS_TO_SHOW = 15
    'TODO: make one Query for this 2 queries 
    Dim sql, rs, rsSub, html
    Dim use : use = tableValue("[grArtikel-Kategorien]", "ArtKatNr", categoryId, "useKeywordsFromChild")
    'response.write "use=[" & use & "]"
    If use = "-1" Or use = "1" Or use = True Then 'use from childs 
        sql = "SELECT min(KeywordId) as KeywordId, [Name], 0 as MaxSizeForComboBox FROM priceCompareKeyWords Where NOT (Enabled=0) " & _
              " and ArtKatNR in ( " & makeSubcategoriesList(categoryId, 3) & " ) Group By [Name] Order By [Name]"
    Else 'do not use from childs 
        sql = "SELECT * FROM priceCompareKeyWords Where NOT (Enabled=0) AND (ArtKatNR=" & categoryId & ")"
    End If
    'response.write sql:Response.Flush
    rs = objConnectionExecute(sql)
   
   
    html = html & "<table width=""180"" border=""0"" ><tr>"
    html = html & "<form action=""productSearch.aspx"" method=""POST"">"
    html = html & "<td>"
    html = html & "Suche " '"</td><td>" 
    If Not rs.EOF Then html = html & "<br>"
    'free text search 
    html = html & "<input name=""searchFreeText"" value=""" & searchFreeText & """ size=""7"" style=""width: 70%; position: relative;""></td></tr>"
   
   
    Dim i : i = 0
    While Not rs.EOF And i < MAX_KEYWORDS_TO_SHOW
        i = i + 1
        Dim kwName : kwName = Server.HtmlEncode(rs("Name"))
        html = html & "<tr><td>" & kwName & "<br>"
        'html = html &  "</td>"
        sql = "Select distinct [value] from priceCompareKeyWordsToProducts Where KeywordId=" & rs("KeywordId") & " ORDER BY [VALUE]"
        rsSub = objConnectionExecute(sql)
      
        'html = html & "<td>" 
        'make keywords 
        If rs("MaxSizeForComboBox") > 0 And Not rsSub.EOF Then ' comboBox is needed			
            html = html & "<SELECT Name=""" & kwName & """ style=""width: 70%; position: relative;"">"
            'response.write "rs(Name)=" & kwName 
            If kwName <> "" And Request(kwName) <> "" Then html = html & "<OPTION></OPTION>" 'Empty choice for reducing the search criterias
			
            html = html & "<OPTION SELECTED>" & Request(kwName) & "</OPTION>"
			
            While Not rsSub.EOF
                html = html & "<OPTION>" & rsSub("Value") & "</OPTION>"
                rsSub.MoveNext()
            End While
            rsSub.close() : rsSub = Nothing
            html = html & "</SELECT></td>"
        Else ' text Box 
            html = html & "<Input Name=""" & kwName & """  value=""" & Request(kwName) & """  size=""7"" style=""width: 70%; position: relative;"">"
        End If
      
        html = html & "</tr>"
        rs.moveNext()
    End While
    rs.close()
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
    html = html & "</form>"
    createSearchFormNoCache = html
End Function


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
Function makeBanner(ByVal ArtKatNr, ByVal Nr)
    Dim sql1
    Dim rsBan
    Dim bannerString
    Dim remoteAddress : remoteAddress = Request.ServerVariables("REMOTE_ADDR")
    Dim localURL : localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
    sql1 = " SELECT * FROM priceCompareBanners  " & _
           " WHERE bannerName = '" & Nr & "' and CatId = " & ArtKatNr & _
           " AND ActiveFrom<= getdate() AND ACTIVETO>= getdate() " & _
           " AND MaxImpressionsCount >= ImpresionsCount " & _
           " ORDER BY ImpresionsCount" ' this way we will show alwas the banner with smallest impressions
    rsBan = objConnectionExecute(sql1)
	
	
    'Response.Write sql1
	
    If rsBan.BOF And rsBan.EOF Then ' no such banner
        'bannerString = "Banner not found"
        Exit Function
    Else    'new record in banner logs
        sql1 = "INSERT INTO PriceCompareBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
           " Values( " & rsBan("BannerId") & ",'" & remoteAddress & "'," & localURL & "'," & "'View')"
        'response.write sql1
        objConnectionExecute(sql1)
        'increment impressions 
        sql1 = "UPDATE priceCompareBanners set ImpresionsCount = ImpresionsCount  + 1  WHERE bannerId = " & rsBan("BannerId")
        objConnectionExecute(sql1)
        Dim target : target = ""
        If rsBan("openInNewWindow") Then
            target = "target =""_new"""
        End If
        bannerString = "<a " & target & " href=""RedirectBanners.aspx?ID=" & rsBan("bannerId") & """>"
        bannerString = bannerString & "<img border=""0""  src=""" & rsBan("BannerFile") & """ alt=""" & rsBan("BannerName") & """></a>"
    End If
    rsBan.close()
    rsBan = Nothing
    makeBanner = bannerString
End Function



''' <summary>
''' searches for the first non empty template 
''' </summary>
''' <param name="artKatNr"></param>
''' <returns></returns>
''' <remarks></remarks>
Function findTemplate(ByVal artKatNr)
    'Response.Write "Search"
    Dim catTemplate
    catTemplate = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "PriceCompareTemplate")
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


%>