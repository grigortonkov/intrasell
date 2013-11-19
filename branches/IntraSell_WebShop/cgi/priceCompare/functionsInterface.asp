<!--#include file="functionsMerchants.asp"-->
<!--#include file="makeProductMerchantList2.asp"-->
<%

public function makeProductMechantList_(ArtNr)
    Dim url
    url = "http://localhost/WebShop/cgi/priceCompare/makeProductMerchantList.asp?ArtNr=1001"
    dim aspHttp: set aspHttp = Server.CreateObject("Tonkov.ASPHttp")
    makeProductMechantList = aspHttp.getURL(url)
    set aspHttp = nothing 
end function 
%>