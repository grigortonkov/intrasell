<!--#include file="functionsMerchants.aspx"-->
<!--#include file="makeProductMerchantList2.aspx"-->

<script language="VB" runat="server">  
public function makeProductMechantList_(ArtNr)
    Dim url as String : url = "http://localhost/WebShop/cgi/priceCompare/makeProductMerchantList.aspx?ArtNr=1001"
    dim aspHttp: aspHttp = Server.CreateObject("Tonkov.ASPHttp")
    makeProductMechantList_ = aspHttp.getURL(url)
    aspHttp = nothing 
end function 
</script>

