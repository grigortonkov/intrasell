<!--#include virtual="/intrasoft/connopen.aspx"-->
<!--#include virtual="/admin/login.aspx"-->
<!--#include virtual="/intrasoft/functions.aspx"-->
<%

    dim sql as string: sql= "SELECT grArtikel.ArtNr AS nr, [grArtikel-Kategorien].Name AS category, grArtikel.Bezeichnung AS Name, " & _ 
    " grArtikel.Beschreibung AS description, lieferantenAdressen.Firma AS manufacturer, [MWST]/10 AS taxclass, " & _ 
    " grArtikel.PreisATS AS price, grArtikel.Gewicht AS weight, 1 AS minorder, 4 AS template, 0 AS " & _ 
    " variation, 1 AS mult, 'stk' AS units, 1 AS difftxt, grArtikel.Picture, grArtikel.EAN AS herstellernummer " & _ 
    " FROM [grArtikel-Kategorien] INNER JOIN ((grArtikel LEFT JOIN lieferantenAdressen ON grArtikel.LieferantNR = lieferantenAdressen.IDNR) " & _ 
    " LEFT JOIN [grArtikel-Kategorien] AS [grArtikel-Kategorien_1] ON grArtikel.ArtKatNr = [grArtikel-Kategorien_1].ArtKatNr) ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr"
    
    Export="ON"
    Filename="Preise.txt"
    
    response.redirect "../../intrasoft/runSqlSelect.asp?Export=ON&Filename=" & Filename & "&SQLString="&sql
%>