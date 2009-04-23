<!--#include file="../defaultHead.inc"-->
<!--#include file="../priceCompare/functionsMerchants.asp"-->
<html>

<head>
<meta http-equiv="Content-Language" content="de-at">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Neue Seite 1</title>
</head>

<body topmargin="0" leftmargin="0">

<p align="right">
<font size="1" face="Verdana">
<%
Dim ArtikelNrLieferant: ArtikelNrLieferant = request("ArtikelNrLieferant")
Dim ArtNr: ArtNr = request("ArtNr")
Dim EAN: EAN = request("EAN")
Dim LieferantNr: LieferantNr = request("LieferantNr")

'DUMMY Implementation
'for ingram 
'https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=999999&PWD=TEST&SKU=765Z116
'https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=AT134550&PWD=mete4550&SKU=765Z116

ArtikelNrLieferant = tableValue("[lieferantenArtikel-Preise]","ArtikelNr",ArtNr,"ArtikelNrLieferant")
LieferantNr = tableValue("[lieferantenArtikel-Preise]","ArtikelNr",ArtNr,"LieferantNr")

'response.Write "<br>ArtikelNrLieferant=" & ArtikelNrLieferant
'response.Write "<br>LieferantNr=" & LieferantNr
'example Call cgi/services/realTimeLagerFromMerchant.asp?ArtikelNrLieferant=[ArtNrLieferant]&ArtNr=[ArtNr]&LieferantNr=1



dim lagerinfoURL

dim standartAntwort
standartAntwort = "Bitte sicherheitshalber anfragen! <a href='mailto:" & varvalue("EMAIL") & "?subject=Verfügbarkeitsanfrage&ArtNr=" & ArtNr & "'>" & varvalue("EMAIL") & "</a>"

if not isNumeric(LieferantNr)  then 
  response.Write standartAntwort '"Keine Abfrage möglich für diesen Lieferanten (" & LieferantNr & ")!"
  response.End
end if 

if cint(LieferantNr) = 1 then 'ingram 
 lagerinfoURL = "https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=AT134550&PWD=mete4550&SKU=" & ArtikelNrLieferant
end if 

if LieferantNr = 2 then 'tech data  
   lagerinfoURL = "https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=AT134550&PWD=mete4550&SKU=" & ArtikelNrLieferant
   response.Write standartAntwort '"Keine Abfrage möglich für diesen Lieferanten!"
   response.End
end if 

if LieferantNr >= 3 then 'else
  response.Write standartAntwort '"Keine Abfrage möglich für diesen Lieferanten!"
  response.End
end if 

    dim aspHttp: set aspHttp = Server.CreateObject("Tonkov.ASPHttp")
    dim responseLager: responseLager = aspHttp.getURL(lagerinfoURL)
    set aspHttp = nothing 


'response.Write "REAL TIME LAGER ABFRAGE"
response.write "Lagerstand: <b>" &  responseLager & "</b>"
'response.write "<br> <a href='/default.asp?ArtNR=" & ArtNr & "'> zum Artikelansicht </a>"
response.end
'response.Redirect "default.asp?ArtNR=" & ArtNr
'END DUMMY implementation 


'take shop URL 
Dim UrlShop: UrlShop = varValueMerchant(LieferantNr,"LAGERINFOURL")  
if UrlShop="" then 
	call drawErrorBox("Keine Shopumleitung", "Dieser Lieferant hat keine Shopumleitung aktiviert! " & _ 
					  " Moechten Sie anstatt das die Homepage diesen Lieferanten besuchen?", _
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
   
   'check if deepLink exists 
   dim sqlDL: sqlDL ="select deepLink from [lieferantenArtikel-Preise] where LieferantNr= " & LieferantNr & " and ArtikelNrLieferant='" & ArtikelNrLieferant &"'"
   dim rsDL: set rsDL = ObjConnectionExecute(sqlDL)
   if not rsDL.EOF then 
     if rsDL("DeepLink") & "" <> "" then 
       buyDirektURL = rsDL("DeepLink")
      end if  
   end if 
   rsDL.close 
   
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
%></font>
</p>

</body>

</html>


<!--#include file="../../intrasoft/connclose.asp"-->