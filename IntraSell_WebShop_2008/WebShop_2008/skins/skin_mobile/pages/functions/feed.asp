<%
Function getXML(sourceFile) 
dim styleFile 
dim source, style 
styleFile = Server.MapPath("news.xsl")

Dim xmlhttp
Set xmlhttp = Server.CreateObject("Microsoft.XMLHTTP")
xmlhttp.Open "GET", sourceFile, false
xmlhttp.Send

set source = Server.CreateObject("Microsoft.XMLDOM")
source.async = false 
source.loadxml(xmlhttp.ResponseText) 

set style = Server.CreateObject("Microsoft.XMLDOM")
style.async = false 
style.load(styleFile) 

getXML = source.transformNode(style) 
set source = nothing 
set style = nothing 
End Function 
%>

<html>
<body>
<%= getXML("http://rss.orf.at/futurezone.xml") %>
</body>

</html>
