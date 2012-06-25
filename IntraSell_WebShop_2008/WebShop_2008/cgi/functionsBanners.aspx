<script language="VB" runat="server">  
    '******************************************************************
    ' Function [makeBanner]
    ' Description: Returns html that represents the banner,
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
    'Real implementation from spas, Grigor
    '29-07-2004 - return banner from parent kat if defined 
    Function makeBanner(ByVal ArtKatNr, ByVal Nr)
        Dim sql1
        Dim rsBan
        Dim bannerString
        Dim remoteAddress : remoteAddress = Request.ServerVariables("REMOTE_ADDR")
        Dim localURL : localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
        sql1 = " SELECT * FROM webBanners  " & _
               " WHERE bannerName = '" & Nr & "' and CatId = " & ArtKatNr & _
               " AND ActiveFrom<= " & SQLNOW(0) & " AND ACTIVETO>= " & SQLNOW(0) & _
               " AND MaxImpressionsCount >= ImpresionsCount " & _
               " ORDER BY ImpresionsCount" ' this way we will show alwas the banner with smallest impressions
        'Response.Write sql1: Response.end      
        rsBan = objConnectionExecute(sql1)
        
        'Response.Write sql1
    
        If rsBan.EOF Then ' no such banner
            'bannerString = "Banner not found"
            'response.Write "Banner not found"
            'tage banner from parent kategorie
            Dim ArtKatNrParent : ArtKatNrParent = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", ArtKatNr, "ArtKatNrParent")
            'response.Write "ArtKatNrParent=" & ArtKatNrParent
            If IsNumeric(ArtKatNrParent) Then 'until Haupt Kat achieved 
                If CLng(ArtKatNrParent) >= 0 Then
                    makeBanner = makeBanner(ArtKatNrParent, Nr)
                    Exit Function
                End If
            End If
            
            makeBanner = "" 'kein Banner definiert                  
            Exit Function
        Else    'new record in banner logs
            sql1 = "INSERT INTO webBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
               " Values( " & rsBan("BannerId").Value & ",'" & remoteAddress & "'," & localURL & "'," & "'View')"
            'response.write sql1
            objConnectionExecute(sql1)
            'increment impressions 
            sql1 = "UPDATE webBanners set ImpresionsCount = ImpresionsCount  + 1  WHERE bannerId = " & rsBan("BannerId").Value
            objConnectionExecute(sql1)
            Dim target : target = ""
            If rsBan("openInNewWindow").Value Then
                target = "target =""_new"""
            End If
            bannerString = "<a " & target & " href=""cgi/RedirectBanners.aspx?ID=" & rsBan("bannerId").Value & """>"
            bannerString = bannerString & "<img border=""0""  src=""" & rsBan("BannerFile").Value & """ alt=""" & rsBan("BannerName").Value & """></a>"
        End If
        rsBan.close()
        rsBan = Nothing
        makeBanner = bannerString
    End Function

</script>

