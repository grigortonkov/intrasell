<!--#include file="cgi/defaulthead.inc.aspx"-->
<% 
 'Redirect to the searched page 
 'ASP provided in aspxerrorpath query string    

 'Folgende URLS werden unterstützt 

 '1. Produkte

 'ProductName 
 'oder 
 'product/ProductCategory0/ProductCategory1/ProductName 

 '2. Produkt Images 
 'image/ProductCategory0/ProductCategory1/ProductName
 
 Dim qu =  Request.querystring("aspxerrorpath")
 if isDebug() then 
    Response.write ("aspxerrorpath=" & qu)
 else 
    Dim linkArray = Split(qu, "/")
    Dim searchString = Replace(qu,"/","")

    'Möglcherweise ist das ein Produkt 
    Dim linkType as String = linkArray(0)
    Dim possibleProductName = Server.UrlDecode(linkArray(linkArray.Length-1))
     possibleProductName = Replace(possibleProductName, "x1x", """")
     possibleProductName = Replace(possibleProductName, "x2x", "'")
     possibleProductName = Replace(possibleProductName, "x3x", "*")


    Dim possibleArtNr  = tableValue("grArtikel","Bezeichnung", "'" & replace(possibleProductName,"'","''") & "'" , "ArtNr") 
    if isDebug() then 
        Response.write ("<br/>possibleProductName=" & possibleProductName) 
        Response.write ("<br/>possibleArtNr=" & possibleArtNr) 
    end if 

    if lcase(linkType) = "product" or isNumeric(possibleArtNr) then 
        Response.redirect ("default.aspx?ArtNr=" & possibleArtNr)
    end if 

    if lcase(linkType) = "image" then
        Response.redirect ("default.aspx?ArtNr=" & possibleArtNr)
    end if 

    'Produkt Suche für den Rest der nicht gefundenen Seiten 
    Response.redirect ("default.aspx?PageToShow=ProductQuery&qu=" & possibleProductName)
 end if 
%>



























