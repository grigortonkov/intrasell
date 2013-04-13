<!--#include file="../defaultHead.inc"-->
<html>
<head>
	<meta http-equiv="Content-Language" content="de">
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
	<title>Print Order from <%=VARVALUE_DEFAULT("DOMAIN","www.yourdomain.com")%></title>
	<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>

<body leftmargin=8 topmargin=8 MARGINWIDTH=8 MARGINHEIGHT=8 link=#000000 vlink=#000000 alink=#000000  bgcolor=#ffffff text=#000000>
<%
Dim OrderType, Nummer, kdnrOfOrder, kdnr
OrderType = cleanUserInput(request("OrderType"))
Nummer = cleanUserInput(request("Nummer"))
kdnr = cleanUserInput(request("kdnr"))

'the user can see only the own orders!!!!! 
kdnrOfOrder = TABLEVALUE(getNameForTable(orderType), "Nummer", Nummer, "kundNr")
if cstr(kdnrOfOrder) <> cstr(getLOGIN()) and cstr(kdnr) <> cstr(kdnrOfOrder) then 
%>
<font color="red">Sorry! This order is not existing! <%=kdnrOfOrder%><><%=getLOGIN()%> or <%=kdnr%></font>
<%
else 
    call printOrder(OrderType, Nummer)
end if
%>
</body>
</html>













