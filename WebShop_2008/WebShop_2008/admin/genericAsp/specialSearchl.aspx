<!--#include file="../../intrasoft/menu.aspx"-->
<%
Dim butArr As String (,) '(0,0)
ReDim butArr(0,0)
'butArr(1,1) = "Set Home"
'butArr(2,1) = "Get Home"
'butArr(3,1) = "Go Home"
'butArr(1,2) = "Set Home"
'butArr(2,2) = "Get Home"
'butArr(3,2) = "Go Home"

'"grArtikelSearchForm.htm"

dim content as String = readTextFile(Server.MapPath (Request("SearchFormFilename")))
Response.write ( drawWindow("Suche", content, "Suchen Sie hier.", butArr) )
Response.Flush
%>     
</body>


