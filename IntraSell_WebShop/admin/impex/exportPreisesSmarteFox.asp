<!-- EXPORT FILE FOR SMARTEFOX.COM-->
<!--#include file="../../intrasoft/connopen.asp"-->
<!--#include file="../login.asp"-->   
<!--#include file="../../intrasoft/functions.asp"-->
<%

    sql= "SELECT grArtikel.ArtNr AS nr, [grArtikel-Kategorien].Name AS category, grArtikel.Bezeichnung AS Name, " & _ 
    " grArtikel.Beschreibung AS description, lieferantenAdressen.Firma AS manufacturer, [MWST]/10 AS taxclass, " & _ 
    " grArtikel.PreisATS AS price, grArtikel.Gewicht AS weight, 1 AS minorder, grArtikel.EAN AS herstellernummer, 0 AS " & _ 
    " variation, 1 AS mult, grArtikel.Bezeichnung1 as avail, 'Stk.' AS units, 1 AS difftxt, grArtikel.Picture " & _ 
    " FROM [grArtikel-Kategorien] INNER JOIN ((grArtikel LEFT JOIN lieferantenAdressen ON grArtikel.LieferantNR = lieferantenAdressen.IDNR) " & _ 
    " LEFT JOIN [grArtikel-Kategorien] AS [grArtikel-Kategorien_1] ON grArtikel.ArtKatNr = [grArtikel-Kategorien_1].ArtKatNr) ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr" & _ 
    " WHERE grArtikel.ArtNr>=1000"
    
    Export="ON"
    Filename="ExportToSmartEFox.txt"
    
    response.redirect "../../intrasoft/runSqlSelect.asp?Export=ON&Filename=" & Filename & "&SQLString="&sql
%>