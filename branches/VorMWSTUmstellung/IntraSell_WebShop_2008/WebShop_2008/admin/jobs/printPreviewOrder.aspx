<!--#include virtual="/intrasoft/menu.aspx"-->
<%
'Set as Printed
Dim sql: sql = "Update " & getNameForTable(request("OrderType")) & " Set Ausgedrukt=-1 WHERE Nummer=" & request("nummer")
objConnectionExecute(sql)
'show printing form
call printOrder(request("OrderType"), request("nummer"))
%>
</body>
</html>
<!--#include file="../../intrasoft/connclose.aspx"-->
