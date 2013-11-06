<!--#include file="../cgi/defaulthead.inc.aspx"-->
    <%
if Request.querystring("Search") <> "" then 
    CreateIndex()
    Response.Write ("Sie suchen nach " & Request.querystring("Search") )
    SearchProduct(Request.querystring("Search"))
end if 
    %>
<!--#include file="../intrasoft/connClose.aspx"-->
