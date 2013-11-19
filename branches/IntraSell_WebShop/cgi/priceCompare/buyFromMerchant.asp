<!--#include file="../defaultHead.inc"-->
<!--#include file="functionsMerchants.asp"-->
<html>
	<head>
		<title>Welcome to Price Compare - redirect to merchant's shop</title>
		<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
	</head>
	<body>
		<H1>Redirect to the merchants pages</H1>
		<%
Dim ArtikelNrLieferant: ArtikelNrLieferant = request("ArtikelNrLieferant")
Dim ArtNr: ArtNr = request("ArtNr")
Dim LieferantNr: LieferantNr = request("LieferantNr")

'take shop URL 
Dim UrlShop: UrlShop = varValueMerchant(LieferantNr,"SHOPURL")  
if UrlShop="" then 
	call drawErrorBox("Keine Shopumleitung", "Dieser Lieferant hat keine Shopumleitung aktiviert! " & _ 
					  " Möchten Sie anstatt das die Homepage diesen Lieferanten besuchen?", _
	                  " merchantPage.asp?merchantId=" & LieferantNr & "&MERCHANT_HOME="&TABLEVALUE("lieferantenAdressen","IDNR",LieferantNr,"Web"), "")
else 	                  
   'the user will be send directly to the shop 
   Response.Write "<br>Sie werden automatisch zum Lieferantenshop weitergeleitet!"
   'dim merchantURL:merchantURL = TABLEVALUE("lieferantenAdressen","IDNR",LieferantNr,"WEB")
   Dim buyDirektURL
   buyDirektURL = replace(UrlShop,"HAENDLER_NUMBER",ArtikelNrLieferant)
   buyDirektURL = replace(buyDirektURL,"[PRODUKTNR]",ArtikelNrLieferant)
   buyDirektURL = replace(buyDirektURL,"[ProduktNr]",ArtikelNrLieferant)
   buyDirektURL = replace(buyDirektURL,"PRODUKTNR",ArtikelNrLieferant)  
   Response.Write "<br><a href=""" & buyDirektURL & """> WEITER ZUM HAENDLER SHOP</A>" 
   
   call makeLogEntry(ArtNR, LieferantNr)
   Response.Redirect buyDirektURL   
                 
   'TODO - WRITE LOG ENTRY!!!!!!
end if 



function makeLogEntry(ArtNR, LieferantNR)
    dim sql ,rs 
    sql = " INSERT INTO priceComparePriceClicks (ArtNr, LieferantNr, ArtikelPreis, [Timestamp] , ArtikelLagerinfo,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER,HTTP_REFERER) " & _ 
          " select ArtikelNR, lieferantNR, EKpreis, "  & TOSQLDATE(DATE()) & " ,LagerInfo " & _ 
           ",'" & Request.ServerVariables("REMOTE_ADDR") & " ','" & _
				  Request.ServerVariables("REMOTE_HOST") & "','" & _
				  Request.ServerVariables("REMOTE_USER") & "','" & _
			      Request.ServerVariables("HTTP_REFERER") & "'" & _
          " FROM [lieferantenArtikel-Preise] where LieferantNr=" & LieferantNR & " and ArtikelNr = " & ArtNR
          
    'response.Write sql: response.Flush
    ObjConnectionExecute(sql)
          
end function 
%>


	</body>
</html>
