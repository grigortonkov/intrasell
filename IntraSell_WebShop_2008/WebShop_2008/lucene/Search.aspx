<!--#include file="../cgi/defaulthead.inc.aspx"-->
<!--#include file="Lucene.aspx"-->
<head>
</head>
<body>
    <%
if Request.querystring("Search") <> "" then 
   ' CreateIndex()
    Response.Write ("Sie suchen nach " & Request.querystring("Search") )
    SearchProduct(Request.querystring("Search"))
end if 
    %>
</body>
<!--#include file="../intrasoft/connClose.aspx"-->
