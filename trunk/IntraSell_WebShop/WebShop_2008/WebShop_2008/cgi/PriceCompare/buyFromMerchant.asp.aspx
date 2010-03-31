<!--#include file="../defaultHead.inc.aspx"-->
<!--#include file="functionsMerchants.aspx"-->
<html>
<head>
    <title>Welcome to Price Compare - redirect to merchant's shop</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body>
    <h1>
        Redirect to the merchants pages</h1>
    <%
        Dim ArtikelNrLieferant : ArtikelNrLieferant = Request("ArtikelNrLieferant")
        Dim ArtNr : ArtNr = Request("ArtNr")
        Dim LieferantNr : LieferantNr = Request("LieferantNr")

        'take shop URL 
        Dim UrlShop : UrlShop = varValueMerchant(LieferantNr, "SHOPURL")
        If UrlShop = "" Then
            Response.Write( drawErrorBox("Keine Shopumleitung", "Dieser Lieferant hat keine Shopumleitung aktiviert! " & _
                  " Möchten Sie anstatt das die Homepage diesen Lieferanten besuchen?", _
                              " merchantPage.aspx?merchantId=" & LieferantNr & "&MERCHANT_HOME=" & TABLEVALUE("lieferantenAdressen", "IDNR", LieferantNr, "Web"), ""))
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
   
            Call makeLogEntry(ArtNr, LieferantNr)
            Response.Redirect(buyDirektURL)
                 
            'TODO - WRITE LOG ENTRY!!!!!!
        End If



function makeLogEntry(ArtNR, LieferantNR)
        Dim sql, rs
        sql = " INSERT INTO priceComparePriceClicks (ArtNr, LieferantNr, ArtikelPreis, [Timestamp] , ArtikelLagerinfo,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER,HTTP_REFERER) " & _
              " select ArtikelNR, lieferantNR, EKpreis, " & TOSQLDATE(Date.Today) & " ,LagerInfo " & _
               ",'" & Request.ServerVariables("REMOTE_ADDR") & " ','" & _
          Request.ServerVariables("REMOTE_HOST") & "','" & _
          Request.ServerVariables("REMOTE_USER") & "','" & _
             Request.ServerVariables("HTTP_REFERER") & "'" & _
              " FROM [lieferantenArtikel-Preise] where LieferantNr=" & LieferantNR & " and ArtikelNr = " & ArtNR
          
        'response.Write sql: response.Flush
        ObjConnectionExecute(sql)
          
    End Function
    %>
</body>
</html>
