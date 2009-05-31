<!--#include file="../../intrasoft/menu.asp"-->
<%
Dim butArr(0,0)
'butArr(1,1) = "Set Home"
'butArr(2,1) = "Get Home"
'butArr(3,1) = "Go Home"
'butArr(1,2) = "Set Home"
'butArr(2,2) = "Get Home"
'butArr(3,2) = "Go Home"

'"grArtikelSearchForm.htm"

dim content: content = readTextFile(Server.MapPath (Request("SearchFormFilename")))
call drawWindow("Suche", content, "Suchen Sie hier.", butArr)
Response.Flush
%>     
</body>


