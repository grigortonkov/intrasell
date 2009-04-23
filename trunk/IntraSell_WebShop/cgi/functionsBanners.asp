<%
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
function makeBanner(ArtKatNr, Nr) 
	Dim sql1
	Dim rsBan
	Dim bannerString
	Dim remoteAddress: remoteAddress = Request.ServerVariables("REMOTE_ADDR") 
	Dim localURL: localURL = "'http://" & Request.ServerVariables("SERVER_NAME") & Request.ServerVariables("URL")
	sql1 = " SELECT * FROM webBanners  " & _ 
	       " WHERE bannerName = '" & Nr & "' and CatId = " & ArtKatNr & _
	       " AND ActiveFrom<= " & SQLNOW(0) & " AND ACTIVETO>= " & SQLNOW(0)  & _
	       " AND MaxImpressionsCount >= ImpresionsCount " & _ 
	       " ORDER BY ImpresionsCount" ' this way we will show alwas the banner with smallest impressions
    'Response.Write sql1: Response.end      
	set rsBan = objConnectionExecute( sql1)
		
	'Response.Write sql1
	
	if rsBan.EOF then ' no such banner
		'bannerString = "Banner not found"
		'response.Write "Banner not found"
		'tage banner from parent kategorie
		Dim ArtKatNrParent: ArtKatNrParent = TABLEVALUE("[grArtikel-Kategorien]","ArtKatNr",ArtKatNr,"ArtKatNrParent")
		'response.Write "ArtKatNrParent=" & ArtKatNrParent
			if IsNumeric(ArtKatNrParent) then 'until Haupt Kat achieved 
			    if clng(ArtKatNrParent) >=0 then 
					makeBanner = makeBanner(ArtKatNrParent, Nr)
					exit function 
				end if 
			end if 
			
		makeBanner = "" 'kein Banner definiert  				
		exit function 
	else	'new record in banner logs
		sql1 = "INSERT INTO webBannersLogs (BannerId, FromIP , ReferingURL, [Type]) " & _
			  " Values( " & rsBan("BannerId") & ",'" & remoteAddress & "'," & localURL & "'," & "'View')"
       'response.write sql1
		objConnectionExecute( sql1 )
		'increment impressions 
		sql1 = "UPDATE webBanners set ImpresionsCount = ImpresionsCount  + 1  WHERE bannerId = " & rsBan("BannerId")
		objConnectionExecute( sql1 )
		dim target : target = "" 
		if rsBan("openInNewWindow") then 
		  target = "target =""_new""" 
		end if 
		bannerString = "<a " & target & " href=""cgi/RedirectBanners.asp?ID=" & rsBan("bannerId") & """>"
		bannerString = bannerString & "<img border=""0""  src=""" & rsBan("BannerFile") & """ alt=""" & rsBan("BannerName") & """></a>"
	end if	
	rsBan.close
	set rsBan = nothing
	makeBanner = bannerString
end function

%>