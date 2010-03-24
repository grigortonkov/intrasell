<script language="VB" runat="server">  
    ''' <summary>
    ''' replaceTagsForStatistics
    ''' </summary>
    ''' <param name="templateHTML"></param>
    ''' <param name="idnr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function replaceTagsForStatistics(ByVal templateHTML, ByVal idnr)

        If InStr(templateHTML, "[COUNT_PRODUCTS_AKTIV]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_AKTIV]", getProductsCount(getLOGIN(), True))
        If InStr(templateHTML, "[COUNT_PRODUCTS_INAKTIV]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_INAKTIV]", getProductsCount(getLOGIN(), False))

        If InStr(templateHTML, "[COUNT_PRODUCTS_DETAIL_VIEW]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_DETAIL_VIEW]", stat1(idnr))
        If InStr(templateHTML, "[COUNT_PRODUCTS_LIST_VIEW]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_LIST_VIEW]", stat2(idnr))
        If InStr(templateHTML, "[COUNT_PRODUCTS_CONTACT]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_CONTACT]", stat3(idnr))

        If InStr(templateHTML, "[COUNT_PRODUCTS_ADDED_BOOKMARKS]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_ADDED_BOOKMARKS]", stat4(idnr))
        If InStr(templateHTML, "[COUNT_PRODUCTS_SENDTOFRIEND]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_SENDTOFRIEND]", stat5(idnr))
        If InStr(templateHTML, "[COUNT_PRODUCTS_CONTACTME]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_PRODUCTS_CONTACTME]", stat6(idnr))

        If InStr(templateHTML, "[COUNT_USER_QUERIES]") > 0 Then templateHTML = Replace(templateHTML, "[COUNT_USER_QUERIES]", stat7(idnr))

    
        replaceTagsForStatistics = templateHTML
    End Function

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function stat1(ByVal idnr)
        stat1 = getFirstField("select count(countClicks) from grArtikel a, webProductClicks c where a.ArtNr = c.ArtNr and a.herstellerNr=" & idnr)
    End Function

    Function stat2(ByVal idnr)
        stat2 = getFirstField("select count(countClicks) from grArtikel a, webProductLists c where a.ArtNr = c.ArtNr and a.herstellerNr=" & idnr)
    End Function

    Function stat3(ByVal idnr)
        stat3 = getFirstField("select count(*) from ofKorespondenz k where subjekt like 'Schnell%' and k.idnr=" & idnr)
    End Function

    Function stat4(ByVal idnr)
        If Session("dbType") <> "MySQL" Then
            stat4 = getFirstField("select count(*) from UserBookmarks ub, grArtikel a where ub.URL like '*ArtNR=' & a.ArtNr and a.herstellerNr=" & idnr)
        Else
            stat4 = getFirstField("select count(*) from UserBookmarks ub, grArtikel a where ub.URL like concat('*ArtNR=', a.ArtNr) and a.herstellerNr=" & idnr)
        End If
    End Function

    Function stat5(ByVal idnr)
        stat5 = getFirstField("select count(ToEmail) from webProductsSendToFriend sf, grArtikel a where sf.artNr=a.ArtNr and a.herstellerNr=" & idnr)
    End Function

    Function stat6(ByVal idnr)
        stat6 = getFirstField("select count(*) from ofKorespondenz k where subjekt like 'Objekt%' and k.idnr=" & idnr)
    End Function


    Function stat7(ByVal idnr)
        stat7 = getFirstField("select count(*) from userQueries k where UserId=" & idnr)
    End Function

    Public Function getProductsCount(ByVal idnr, ByVal active)
        getProductsCount = getFirstField("Select count(*) as co From grArtikel where HerstellerNr =" & idnr & " and ProduktAktiv=" & CLng(CInt(active)))
    End Function

</script>

