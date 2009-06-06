<!--#include file="../../client/intrasoft/menu.asp"-->
<%
dim stat, sql_stat, merch 
merch = request("merch")
stat = request("stat")

Dim fromdate, todate 
fromdate = request("fromdate")
todate = request("todate")
	       
if fromdate= "" then fromdate = date()-7 
if todate= "" then todate = date()+1
   		

'MERCHANT SPECIFIC STATISITCS 
if stat = "Banners" or stat = "BannersDetail" or _ 
          stat = "MerchantsInfo" or stat = "MerchantsInfoDetail" or _
          stat = "MerchantsInfoRedirections" or stat = "MerchantsInfoRedirectionsDetail" or _
          stat = "FeaturedMerchants"  or stat = "FeaturedMerchantsDetail" then

 
	'Response.End 
	if merch = "" then 'merchant must be defined as well as fromDate and toDate %>

		<h1>Merchant oriented statistics [<%=stat%>]</h1>
		<form action="stat_webGenericStats.asp">
		<input type="hidden" name ="stat" value="<%=stat%>">
		From: <input  name ="fromdate" value="<%=fromdate%>">(dd.mm.yyyy)- To 
		<input  name ="todate" value="<%=todate%>">(dd.mm.yyyy)
		<br>
	   <b> Select a merchant from the list : <b>
	   <select name="merch">
	   <OPTION value="all">all</OPTION>
		<%sql = " SELECT  lieferantenAdressen.* FROM lieferantenAdressen " & _
	           " INNER JOIN priceCompareHaendler ON  lieferantenAdressen.IDNR =priceCompareHaendler.lieferantNr "
		set rs = ObjConnectionExecute(sql)
		While not rs.EOF
			Response.Write "<OPTION value=""" & rs("IDNR") & """>" & rs("Firma") & "</OPTION>"
			rs.MoveNext
		wend		
		rs.close
		set rs = nothing
		%>		
		</SELECT>
		<input type="submit" value="make Statistics">
		</form>
		<%
		Response.End 
	else 
	   'shows the banners impressions per merchant and day 
	   
       dim merchantWherePart:  merchantWherePart ="1=1"
       Dim View: View = "REPLACE(REPLACE(Type, 'Click', 0), 'View', 1)"
       Dim Click: Click = "REPLACE(REPLACE(Type, 'Click', 1), 'View', 0)"
	     if stat ="Banners" then 
	       if merch ="all" then merch="%"
	      'shows the banners impressions and clicks for this merchant
			SQL_STAT =  "SELECT BannerId, DateAndTime, sum(CounterViews)as countImpressions, sum(CounterClicks) as countClicks" & _ 
			            " FROM " & _ 
			            "(SELECT priceCompareBanners.BannerId, convert(varchar,PriceCompareBannersLogs.DateTimestamp,1) as DateAndTime, PriceCompareBannersLogs.Type, " & _ 
			            " Sum(1*" & View & ") as CounterViews, " & _ 
			            " 0 as CounterClicks " &  _ 
			            " FROM priceCompareBanners, PriceCompareBannersLogs " & _
					    " WHERE cast(priceCompareBanners.LieferantId as varchar) Like '" & merch & "'" & _ 
					    " AND PriceCompareBannersLogs.BannerId= priceCompareBanners.BannerId " & _ 
					    " AND PriceCompareBannersLogs.DateTimestamp >= " & tosqldate(fromdate) & _
					    " AND PriceCompareBannersLogs.DateTimestamp <=" & tosqldate(todate) & _ 
					    " GROUP BY priceCompareBanners.BannerId, PriceCompareBannersLogs.Type, convert(varchar,PriceCompareBannersLogs.DateTimestamp,1)" & _ 
					    " UNION " & _ 
					    "SELECT priceCompareBanners.BannerId, convert(varchar,PriceCompareBannersLogs.DateTimestamp,1) as DateAndTime, PriceCompareBannersLogs.Type, " & _ 
			            " 0 as CounterViews, " & _ 
			            " Sum(1*" & Click & ") as CounterClicks " & _ 
			            " FROM priceCompareBanners, PriceCompareBannersLogs " & _
					    " WHERE cast(priceCompareBanners.LieferantId as varchar) Like '" & merch & "'" & _ 
					    " AND PriceCompareBannersLogs.BannerId= priceCompareBanners.BannerId " & _ 
					    " AND PriceCompareBannersLogs.DateTimestamp >= " & tosqldate(fromdate) & _
					    " AND PriceCompareBannersLogs.DateTimestamp <=" & tosqldate(todate)  & _ 
					    " GROUP BY priceCompareBanners.BannerId, PriceCompareBannersLogs.Type, convert(varchar,PriceCompareBannersLogs.DateTimestamp,1)" & _ 
					    ") clicksAndViews GROUP BY BannerId, DateAndTime " & _ 
					    " ORDER BY   DateAndTime DESC,BannerId" 
         end if 
         
			if stat ="BannersDetail" then 
			if merch ="all" then merch="%"
			 'shows the banners IP calls and impressions and counts for this merchant
			  if merch<>"all" then   merchantWherePart = " priceCompareBanners.LieferantId= " & merch  
			SQL_STAT =  "SELECT BannerId, FromIp, DateAndTime, sum(CounterViews)as countImpressions, sum(CounterClicks) as countClicks" & _ 
			            " FROM " & _ 
			            "(SELECT FRomIp, priceCompareBanners.BannerId, PriceCompareBannersLogs.DateTimestamp as DateAndTime, PriceCompareBannersLogs.Type, " & _ 
			            " Sum(1*" & View & ") as CounterViews, " & _ 
			            " 0 as CounterClicks " &  _ 
			            " FROM priceCompareBanners, PriceCompareBannersLogs " & _
					    " WHERE priceCompareBanners.LieferantId Like '" & merch & "'" & _ 
					    " AND PriceCompareBannersLogs.BannerId= priceCompareBanners.BannerId " & _ 
					    " AND PriceCompareBannersLogs.DateTimestamp >= " & tosqldate(fromdate) & _
					    " AND PriceCompareBannersLogs.DateTimestamp <=" & tosqldate(todate) & _ 
					    " GROUP BY FromIp, priceCompareBanners.BannerId, PriceCompareBannersLogs.Type, PriceCompareBannersLogs.DateTimestamp" & _ 
					    " UNION " & _ 
					    "SELECT fromIp, priceCompareBanners.BannerId, PriceCompareBannersLogs.DateTimestamp as DateAndTime, PriceCompareBannersLogs.Type, " & _ 
			            " 0 as CounterViews, " & _ 
			            " Sum(1*" & Click & ") as CounterClicks " & _ 
			            " FROM priceCompareBanners, PriceCompareBannersLogs " & _
					    " WHERE priceCompareBanners.LieferantId Like '" & merch & "'" & _ 
					    " AND PriceCompareBannersLogs.BannerId= priceCompareBanners.BannerId " & _ 
					    " AND PriceCompareBannersLogs.DateTimestamp >= " & tosqldate(fromdate) & _
					    " AND PriceCompareBannersLogs.DateTimestamp <=" & tosqldate(todate)  & _ 
					    " GROUP BY FRomIp, priceCompareBanners.BannerId, PriceCompareBannersLogs.Type, PriceCompareBannersLogs.DateTimestamp " & _ 
					    ") clicksAndViews GROUP BY BannerId, DateAndTime, FRomIp " & _ 
					    " ORDER BY   DateAndTime DESC,BannerId, FromIp" 
			end if 

             'for the rest statistics 
             Dim requestedMerchant: requestedMerchant= merch 
            if merch="all" then   merch="%": requestedMerchant="'All'"
			
			
			if stat = "MerchantsInfo" then 
		   'shows the impressions on the page merchantPage
			SQL_STAT = "SELECT " & DateFormat("Datum") & " as LogDate, " & requestedMerchant & " as merchant, Count( Login.Datum) As UserImpressionsCount " & _
					" FROM Login " & _ 
					" WHERE Login.Path_Translated LIKE '%merchantPage.asp?merchantId=" & merch & "%' " & _
					" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
					" GROUP BY " & DateFormat("Datum") & _ 
					" ORDER BY " & DateFormat("Datum") & " DESC"
			end if


			if stat = "MerchantsInfoDetail" then 
		   'shows the impressions on the page merchantPage
			SQL_STAT = "SELECT Datum as LogDate , " & requestedMerchant & " as merchant, REMOTE_HOST  " & _
					" FROM Login " & _ 
					" WHERE Login.Path_Translated LIKE '%merchantPage.asp?merchantId=" & merch & "%' " & _
					" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
					" GROUP BY Datum, REMOTE_HOST " & _ 
					" ORDER BY Datum DESC"
			end if
			
			
			if stat = "MerchantsInfoRedirections" then 
		   'shows the redirections on the page merchantPage
			SQL_STAT = "SELECT " & DateFormat("Datum") & " as LogDate, " & requestedMerchant & " as merchant, Count( Login.Datum) As UserRedirectionsCountOnMerchantsHomepage " & _
					" FROM Login " & _ 
					" WHERE Login.Path_Translated LIKE '%merchantPage.asp?MERCHANT_HOME%merchantId=" & merch & "%' " & _
 					" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
					" GROUP BY " & DateFormat("Datum") & _ 
					" ORDER BY " & DateFormat("Datum") & " DESC"
			end if

  			if stat = "MerchantsInfoRedirectionsDetail" then 
		   'shows the impressions on the page merchantPage
			SQL_STAT = "SELECT Datum as LogDate , " & requestedMerchant & " as merchant, REMOTE_HOST  " & _
					" FROM Login " & _ 
					" WHERE Login.Path_Translated LIKE '%merchantPage.asp?MERCHANT_HOME%merchantId=" & merch & "%' " & _
					" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
					" GROUP BY Datum, REMOTE_HOST " & _ 
					" ORDER BY Datum DESC"
			end if
			
  
			if stat = "FeaturedMerchants" then 
			'must show how many times the merchant is shown as a featured merchant 	 
    		'shows the count of impressions through featured merchants 
 	   		SQL_STAT = "SELECT " & DateFormat("Datum") & " as LogDate , " & requestedMerchant & " as merchant, Count( Login.Datum) As ImpressionsCountAsFeaturedMerchant " & _
					" FROM Login " & _ 
					" WHERE Login.Path_Translated LIKE 'showMerchantAsFeaturedMerchant?merchantId=" & merch & "' " & _
					" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
					" GROUP BY " & DateFormat("Datum") & _ 
					" ORDER BY " & DateFormat("Datum") & " DESC"
			end if		

			if stat = "FeaturedMerchantsDetail" then 
			'must show how many times the merchant is shown as a featured merchant 	 
    		'shows the count of impressions through featured merchants 
 	   		SQL_STAT = "SELECT Datum as LogDate, " & requestedMerchant & " as merchant, Count( Login.Datum) As ImpressionsCountAsFeaturedMerchant, REMOTE_HOST " & _
					" FROM Login " & _ 
					" WHERE Login.Path_Translated LIKE 'showMerchantAsFeaturedMerchant?merchantId=" & merch & "%' " & _
					" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
					" GROUP BY Datum, REMOTE_HOST " & _ 
					" ORDER BY Datum DESC"
			end if		
	end if	'merchant is defined 			
end if		  
'END MERCHANT SPECIFIC STATISITCS 






'REST STATISTICS 
 if stat = "RealTimeUsers" Or  _ 
	stat = "Sessions" Or  _ 
	stat = "UsersOrigin" Or  _ 
	stat = "Newsletter" Or  _ 
	stat = "PriceAlarm" Or  _ 
	stat = "CategoriesPages" Or _ 
	stat = "MostClickedProdukts" Or  _ 
	stat = "TopProdukts" Or  _    
	stat = "RegisteredKunde" Or _
	stat = "UniqueIP" then 
	if  request("fromdate")="" then ' the user can specify now the fromdate or todate
		 
	%>
	    <h1>Statistics [<%=stat%>]</h1>
	    Select date period for the statistics 
		<form action="stat_webGenericStats.asp" id=form1 name=form1>
		<input type="hidden" name ="stat" value="<%=stat%>">
		From: <input  name ="fromdate" value="<%=fromdate%>">(dd.mm.yyyy)- To 
		<input  name ="todate" value="<%=todate%>">(dd.mm.yyyy)	
		<input type="submit" value="make Statistics">
		</form><%
		Response.End 
	else 
				if stat = "RealTimeUsers" then 
					'show what happens on the site in the last 20 minutes
					SQL_STAT = "SELECT * " & _ 
					" FROM login " & _ 
					" WHERE Datum >= CURRENT_TIMESTAMP - 1" & _ 
					" ORDER BY Datum DESC" 
				end if 


				if stat = "Sessions" then 
				SQL_STAT = "SELECT webSessions.CreationDate, Count(webSessions.SID) AS CountOfSID " & _ 
					" FROM webSessions " & _ 
					" WHERE webSessions.CreationDate >=" & tosqldate(fromdate) & _
					" AND webSessions.CreationDate <=" & tosqldate(todate) & _
					" GROUP BY webSessions.CreationDate " & _ 
					" ORDER BY webSessions.CreationDate DESC" 
				end if 


				if stat = "UsersOrigin" then  
					SQL_STAT = "SELECT HTTP_REFERER, count(datum) as countViews  " & _ 
					" FROM login " & _ 
					" WHERE DATUM >=" & tosqldate(fromdate) & "AND DATUM <=" & tosqldate(todate) & _
					" GROUP BY HTTP_REFERER " & _ 
					" ORDER BY count(datum) DESC" 
				end if 

 

				if stat = "Newsletter" then 
					SQL_STAT = " SELECT  Count(Email) as counter, NewsletterName " & _
							   " FROM webNewsletter " & _ 
							   " WHERE registrationDate >=" & tosqldate(fromdate) & _
							   " AND registrationDate <=" & tosqldate(todate) & _
							   " GROUP BY NewsletterName ORDER BY NewsletterName"
				end if				
								
				if stat = "PriceAlarm" then 
					SQL_STAT = "SELECT  Count(UserId) as Users, CreatedOn " & _
							   " FROM userQueries WHERE [Name] LIKE 'PriceAlarm%' " & _
							   " AND CreatedOn >=" & tosqldate(fromdate) & _
							   " AND CreatedOn <=" & tosqldate(todate) & _
							   " GROUP BY CreatedOn ORDER BY CreatedOn DESC"	
				end if		


				if stat = "CategoriesPages" then 
					SQL_STAT = "SELECT [grArtikel-Kategorien].[Name], Count( Login.Path_translated ) As ImpressionsCount " & _
								" FROM [grArtikel-Kategorien] " & _ 
								" INNER JOIN Login ON " & _
								" ( Login.Path_Translated LIKE '%default.asp?ArtKatNr=' + LTRIM(STR([grArtikel-Kategorien].ArtKatNr)) + '%' " & _
								" OR Login.Path_Translated LIKE '%default.asp?PreKatNr=' + LTRIM(STR([grArtikel-Kategorien].ArtKatNr)) + '%' ) " & _
								"WHERE Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 
								" GROUP BY [grArtikel-Kategorien].[Name] " & _ 
								" ORDER BY Count( Login.Path_translated ) DESC " 
				end if


				if stat = "MostClickedProdukts" then 
					'SQL_STAT = "SELECT [grArtikel-Kategorien].[Name], [grArtikel].Bezeichnung, Count( Login.Path_translated ) As Clicked " & _
					'			" FROM [grArtikel-Kategorien], grArtikel, Login " & _
					'			" WHERE ( ( [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr )AND " & _
					'			" ( Login.Path_Translated LIKE '%.asp?ArtNr=' + LTRIM( STR ( grArtikel.ArtNr )) + '%' ) ) " & _
					'			" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 				
					'			" GROUP BY [grArtikel-Kategorien].[Name],[grArtikel].Bezeichnung " & _ 
					'			" ORDER BY Count( Login.Path_translated ) DESC " 
					SQL_STAT = "SELECT [grArtikel-Kategorien].[Name], [grArtikel].Bezeichnung, Count( Datum) As Clicked " & _
								" FROM [grArtikel-Kategorien], grArtikel, webWarenkorb " & _
								" WHERE  [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr  and webWarenkorb.ArtNr =grArtikel.ArtNr  " & _
								" AND Datum >= " & tosqldate(fromdate) & " AND Datum <=" & tosqldate(todate) & " " & _ 				
								" GROUP BY [grArtikel-Kategorien].[Name],[grArtikel].Bezeichnung " & _ 
								" ORDER BY Count( Datum ) DESC " 
				end if

				if stat = "TopProdukts" then 
					SQL_STAT = "SELECT [grArtikel-Kategorien].[Name], [grArtikel].Bezeichnung " & _
								" FROM [grArtikel-Kategorien], grArtikel, webCatTopProducts " & _
								" WHERE ( webCatTopProducts.ProductId = grArtikel.ArtNr ) AND " & _
								" ( webCatTopProducts.CatId = [grArtikel-Kategorien].ArtKatNr ) " & _
								" GROUP BY [grArtikel-Kategorien].[Name],[grArtikel].Bezeichnung " 
				end if

				if stat = "RegisteredKunde" then 
					SQL_STAT = "SELECT  ofAdressen.Name, ofAdressen.Email, ofAdressen.Web " & _
							   ", grLand.Name as Land, grPLZ.Ort, grPLZ.PLZ, grBranchen.Bezeichnung As Branche " & _
							   " FROM ofAdressen, grLand, grPLZ, grBranchen " & _
							   " WHERE  ofAdressen.Land = grLand.IdNr  AND " & _
							   "  ofAdressen.Plz = grPLZ.IdNr  AND  ofAdressen.branche = grBranchen.BrNr " & _
							   " AND ofAdressen.IDNR IN ( SELECT LieferantNr FROM PriceCompareHaendler ) " & _
							   " ORDER BY ofAdressen.Name "	
				end if		
				
				if stat = "UniqueIP" then 
					SQL_STAT = "SELECT REMOTE_HOST , count(datum) as countViews  " & _ 
					" FROM login " & _ 
					" WHERE DATUM >=" & tosqldate(fromdate) & "AND DATUM <=" & tosqldate(todate) & _
					" GROUP BY REMOTE_HOST  " & _ 
					" ORDER BY count(datum) DESC" 
				end if			   
	end if 'date specified 
end if 


 if stat = "HaendlerAnzahlProdukte" then  
		SQL_STAT = "SELECT lieferantenAdressen.Name AS Haendler, " & _ 
		    "COUNT([lieferantenArtikel-Preise].PreisId) " & _ 
		    "AS AnzahlProdukte " & _ 
			"FROM lieferantenAdressen INNER JOIN " & _ 
			"    [lieferantenArtikel-Preise] ON  " & _ 
			"    lieferantenAdressen.IDNR = [lieferantenArtikel-Preise].LieferantNr " & _ 
			"GROUP BY lieferantenAdressen.Name " 
end if 

 if stat = "HerstellerAnzahlProdukte" then 
		SQL_STAT = "SELECT lieferantenAdressen.Firma AS Hersteller,  " & _ 
				" COUNT(grArtikel.ArtNr) AS CountProducts " & _ 
				"FROM grArtikel INNER JOIN " & _ 
				"   lieferantenAdressen ON  " & _ 
				"   grArtikel.LieferantNR = lieferantenAdressen.IDNR " & _ 
				" GROUP BY lieferantenAdressen.Firma " & _ 
				"ORDER BY COUNT(grArtikel.ArtNr) DESC " 
end if 



Response.Write "<br>SQL_STAT= " & SQL_STAT
if SQL_STAT <> "" then 
	response.redirect "../../client/intrasoft/runSQLSelect.asp?SQLString=" & Server.URLEncode ( SQL_STAT ) & "&ShowSQL=TRUE&PageTitle=<br>Statistics [" & stat & "]"
end if 
%>

Statistik:  All statistik should be in day, week , month + all with Time 
<ol>
  <li>Realtime for users online howmany users online + real time</li>
  <li>Statistik for each page (It&nbsp; means how many users were on category computer) and altogether users +IP
    registriert&nbsp;</li>
  <li>
Statistik for each Merchant:&nbsp;</li>
  <li>  How many times the Merchant info is clicked and how many times is weitergeleited with IP and user info and Date and
    time</li>
  <li>How many users used emailnewsletter in each different interest&nbsp;</li>
  <li>
How many users used Pricealarm&nbsp;</li>
  <li>
How many users used PLZ&nbsp;</li>
  <li>
Statistik For each banner&nbsp;</li>
  <li>
Statistik per each gewinn spiel&nbsp;</li>
  <li>
Statistik for Featured merchants&nbsp;</li>
  <li>
Statistik for top products&nbsp;</li>
  <li>
Statistik for hersteller link&nbsp;</li>
  <li>
Statistik for most clicked products per category&nbsp;</li>
  <li>
Statistik for regtrierte Kunde

</li>
</ol>