<!--#include file="menu.asp"-->  
<%
SQLString = Request.QueryString("SQLString")
if len(SQLString)<1 then 
SQLString = Request.Form("SQLString")
end if

zurueckSeite = Request.QueryString("zurueckSeite")  
response.write "sqlstring = "  + SQLString 


Set rs = objConnection.Execute(SQLString) 
%>

<p align="center"><font face="Arial"><a href="<%=zurueckSeite%>">zurück</a> </TBODY> <TFOOT> </TFOOT> </font></p>
</body>
</html>









