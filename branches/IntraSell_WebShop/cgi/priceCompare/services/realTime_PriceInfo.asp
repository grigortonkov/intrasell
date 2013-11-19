
<!--#include file="../../defaultHead.inc"-->
<!--#include file="../functionsMerchants.asp"-->
<%
rem <!--
rem Beispiel für Anbindung im Lieferanten Shop:
rem <iframe width="130" height="80" scrolling=no border=1 
rem  src="http://www.efox.at/cgi/priceCompare/services/realTime_PriceInfo.asp?LieferantNr=1990&ArtikelNrLieferant=199611">
rem </iframe>  
-->
%>
<html>
<head>
<meta http-equiv="Content-Language" content="de-at">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Best Price Info</title>
</head>
<body topmargin="5" leftmargin="5">
 
<%
rem Input Parameter
Dim ArtikelNrLieferant: ArtikelNrLieferant = request("ArtikelNrLieferant")
Dim LieferantNr: LieferantNr = request("LieferantNr")

Dim ArtNrInfo: ArtNrInfo = tableValue("[lieferantenArtikel-Preise]", "ArtikelNrLieferant", ArtikelNrLieferant ,"ArtikelNr")

if showDebug() then response.Write "<br>ArtikelNrLieferant=" & ArtikelNrLieferant
if showDebug() then response.Write "<br>LieferantNr=" & LieferantNr

dim standartAntwort
standartAntwort = "<a target=_new href='http://www.efox.at'><img src='http://www.efox.at/favicon.ico' align='middle' border=0></a>" & _ 
                  " keine Infos in <a target=_new href='http://www.efox.at'>www.efox.at</a> vorhanden! <a href='mailto:" & varvalue("EMAIL") & "?subject=PreisInfo_und_ArtikelNrLieferant=" & ArtikelNrLieferant & "'>" & varvalue("EMAIL") & "</a>"

if not isNumeric(ArtikelNrLieferant) then 
  response.Write standartAntwort  
  response.End
end if 

if not isNumeric(LieferantNr) then 
  response.Write standartAntwort  
  response.End
end if 

if not isNumeric(ArtNrInfo) then 
  response.Write standartAntwort  
  response.End
end if 


'take shop URL 
''Dim UrlShop: UrlShop = varValueMerchant(LieferantNr,"LAGERINFOURL")  

'read ranking 
dim sqlPI: sqlPI = "select lp.* from [LieferantenArtikel-Preise] lp, priceCompareHaendler h where lp.LieferantNr=h.lieferantNr and h.isActive<>0 and ArtikelNr=" & ArtNrInfo & " order by VKPreis" 
dim rsPI: set rsPI = ObjConnectionExecute(sqlPI)
dim rang: rang = 0
while not rsPI.eof
    rang = rang + 1
    if rsPI("LieferantNr") & "" = LieferantNr & "" then 
        if rang <= 5 then 
			standartAntwort = "<b>" & rang & "</b>-er Bestpreis laut <a target=_new href='http://" & varvalue("DOMAIN") & "/default.asp?ArtNr=" & ArtNrInfo & "'>www.efox.at <img src='http://www.efox.at/favicon.ico' align='middle' border=0></a>"
		else 
		   standartAntwort = "Produktinformationen auch in <a target=_new href='http://" & varvalue("DOMAIN") & "/default.asp?ArtNr=" & ArtNrInfo & "'>www.efox.at <img src='http://www.efox.at/favicon.ico' align='middle' border=0></a>"
		end if 	
    end if 
	rsPI.MoveNext 
wend 
'display 
response.Write standartAntwort

%> 
</body>
</html>
<!--#include file="../../../intrasoft/connclose.asp"-->
