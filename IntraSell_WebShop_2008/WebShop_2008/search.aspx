<!--#include file="cgi/defaulthead.inc.aspx"-->
<% 
 'Redirect to the searched page 
 'ASP provided in aspxerrorpath query string    

 'Folgende URLs werden unterstützt 

 '1. Produkte
 'ProductName 
 'oder 
 'ProductCategory0/ProductCategory1/ProductName/product

 '2. Produkt Images 
 'ProductCategory0/ProductCategory1/ProductName/image
 
 Dim qu = Request.querystring("aspxerrorpath")
 if isDebug() then 
    Response.write ("aspxerrorpath=" & qu)
 else 
    Dim linkArray = Split(qu, "/")
    Dim searchString = Replace(qu,"/","")

    'Möglicherweise ist das ein Produkt 
    Dim linkType as String = linkArray(linkArray.Length-1)
    Dim possibleProductName = Server.UrlDecode(linkArray(linkArray.Length-1))

    if lcase(linkType) = "product" or lcase(linkType) = "prodimage" then 
       possibleProductName = Server.UrlDecode(linkArray(linkArray.Length-2))
    end if 

     possibleProductName = Replace(possibleProductName, "x1x", """")
     possibleProductName = Replace(possibleProductName, "x2x", "'")
     possibleProductName = Replace(possibleProductName, "x3x", "*")


    Dim possibleArtNr  = tableValue("grArtikel","Bezeichnung", "'" & replace(possibleProductName,"'","''") & "'" , "ArtNr") 
    if isDebug() then 
        Response.write ("<br/>possibleProductName=" & possibleProductName) 
        Response.write ("<br/>possibleArtNr=" & possibleArtNr) 
    end if 

    if lcase(linkType) = "product" and isNumeric(possibleArtNr) then 
        Response.redirect ("default.aspx?ArtNr=" & possibleArtNr)
    end if 

    if lcase(linkType) = "prodimage" and isNumeric(possibleArtNr) then 
        'Response.redirect ("default.aspx?ArtNr=" & possibleArtNr
        Response.redirect ("productImages/" & possibleArtNr & ".gif")
    end if 

    'Produkt Suche für den Rest der nicht gefundenen Seiten 
    Response.redirect ("default.aspx?PageToShow=ProductQuery&qu=" & possibleProductName)
 end if 
%>



























