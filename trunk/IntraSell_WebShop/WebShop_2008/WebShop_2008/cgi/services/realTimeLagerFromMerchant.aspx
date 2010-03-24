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
                Dim ArtikelNrLieferant : ArtikelNrLieferant = Request("ArtikelNrLieferant")
                Dim ArtNr : ArtNr = Request("ArtNr")
                Dim EAN : EAN = Request("EAN")
                Dim LieferantNr : LieferantNr = Request("LieferantNr")

                'DUMMY Implementation
                'for ingram 
                'https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=999999&PWD=TEST&SKU=765Z116
                'https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=AT134550&PWD=mete4550&SKU=765Z116

                ArtikelNrLieferant = tableValue("[lieferantenArtikel-Preise]", "ArtikelNr", ArtNr, "ArtikelNrLieferant")
                LieferantNr = tableValue("[lieferantenArtikel-Preise]", "ArtikelNr", ArtNr, "LieferantNr")

                'response.Write "<br>ArtikelNrLieferant=" & ArtikelNrLieferant
                'response.Write "<br>LieferantNr=" & LieferantNr
                'example Call cgi/services/realTimeLagerFromMerchant.asp?ArtikelNrLieferant=[ArtNrLieferant]&ArtNr=[ArtNr]&LieferantNr=1



                Dim lagerinfoURL

                Dim standartAntwort
                standartAntwort = "Bitte sicherheitshalber anfragen! <a href='mailto:" & varvalue("EMAIL") & "?subject=Verfügbarkeitsanfrage&ArtNr=" & ArtNr & "'>" & varvalue("EMAIL") & "</a>"

                If Not IsNumeric(LieferantNr) Then
                    Response.Write(standartAntwort) '"Keine Abfrage möglich für diesen Lieferanten (" & LieferantNr & ")!"
                    Response.End()
                End If

                If CInt(LieferantNr) = 1 Then 'ingram 
                    lagerinfoURL = "https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=AT134550&PWD=mete4550&SKU=" & ArtikelNrLieferant
                End If

                If LieferantNr = 2 Then 'tech data  
                    lagerinfoURL = "https://ec.ingrammicro.de/cgi-bin/avail/avail.pl?CCD=DE&BNR=44&KNR=AT134550&PWD=mete4550&SKU=" & ArtikelNrLieferant
                    Response.Write(standartAntwort) '"Keine Abfrage möglich für diesen Lieferanten!"
                    Response.End()
                End If

                If LieferantNr >= 3 Then 'else
                    Response.Write(standartAntwort) '"Keine Abfrage möglich für diesen Lieferanten!"
                    Response.End()
                End If

                Dim aspHttp : aspHttp = Server.CreateObject("Tonkov.ASPHttp")
                Dim responseLager : responseLager = aspHttp.getURL(lagerinfoURL)
                aspHttp = Nothing


                'response.Write "REAL TIME LAGER ABFRAGE"
                Response.Write("Lagerstand: <b>" & responseLager & "</b>")
                'response.write "<br> <a href='/default.aspx?ArtNR=" & ArtNr & "'> zum Artikelansicht </a>"
                Response.End()
                'response.Redirect "default.aspx?ArtNR=" & ArtNr
                'END DUMMY implementation 


                'take shop URL 
                Dim UrlShop : UrlShop = varValueMerchant(LieferantNr, "LAGERINFOURL")
                If UrlShop = "" Then
                    Call drawErrorBox("Keine Shopumleitung", "Dieser Lieferant hat keine Shopumleitung aktiviert! " & _
                          " Moechten Sie anstatt das die Homepage diesen Lieferanten besuchen?", _
                                      " merchantPage.asp?merchantId=" & LieferantNr & "&MERCHANT_HOME=" & TABLEVALUE("lieferantenAdressen", "IDNR", LieferantNr, "Web"), "")
                Else
                    'the user will be send directly to the shop 
                    Response.Write("<br>Sie werden automatisch zum Lieferantenshop weitergeleitet!")
                    'dim merchantURL:merchantURL = TABLEVALUE("lieferantenAdressen","IDNR",LieferantNr,"WEB")
                    Dim buyDirektURL
                    buyDirektURL = Replace(UrlShop, "HAENDLER_NUMBER", ArtikelNrLieferant)
                    buyDirektURL = Replace(buyDirektURL, "[PRODUKTNR]", ArtikelNrLieferant)
                    buyDirektURL = Replace(buyDirektURL, "[ProduktNr]", ArtikelNrLieferant)
                    buyDirektURL = Replace(buyDirektURL, "PRODUKTNR", ArtikelNrLieferant)
                    Response.Write("<br><a href=""" & buyDirektURL & """> WEITER ZUM HAENDLER SHOP</A>")
   
                    'check if deepLink exists 
                    Dim sqlDL : sqlDL = "select deepLink from [lieferantenArtikel-Preise] where LieferantNr= " & LieferantNr & " and ArtikelNrLieferant='" & ArtikelNrLieferant & "'"
                    Dim rsDL : rsDL = ObjConnectionExecute(sqlDL)
                    If Not rsDL.EOF Then
                        If rsDL("DeepLink") & "" <> "" Then
                            buyDirektURL = rsDL("DeepLink")
                        End If
                    End If
                    rsDL.close()
   
                    Call makeLogEntry(ArtNr, LieferantNr)
                    Response.Redirect(buyDirektURL)
                 
                    'TODO - WRITE LOG ENTRY!!!!!!
                End If



            %></font>
    </p>
</body>
</html>
<!--#include file="../../intrasoft/connclose.asp"-->
