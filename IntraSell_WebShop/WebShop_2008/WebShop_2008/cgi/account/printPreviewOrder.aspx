<!--#include file="../defaultHead.inc"-->
<html>
<head>
    <meta http-equiv="Content-Language" content="de">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>Print Order from
        <%=VARVALUE_DEFAULT("DOMAIN","www.yourdomain.com")%></title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body leftmargin="8" topmargin="8" marginwidth="8" marginheight="8" link="#000000"
    vlink="#000000" alink="#000000" bgcolor="#ffffff" text="#000000">
    <%
        Dim OrderType, Nummer, kdnrOfOrder, kdnr
        OrderType = cleanUserInput(Request("OrderType"))
        Nummer = cleanUserInput(Request("Nummer"))
        kdnr = cleanUserInput(Request("kdnr"))

        'the user can see only the own orders!!!!! 
        kdnrOfOrder = TABLEVALUE(getNameForTable(OrderType), "Nummer", Nummer, "kundNr")
        If CStr(kdnrOfOrder) <> CStr(getLOGIN()) And CStr(kdnr) <> CStr(kdnrOfOrder) Then
    %>
    <font color="red">Sorry! This order is not existing!
        <%=kdnrOfOrder%><><%=getLOGIN()%>
        or
        <%=kdnr%></font>
    <%
    Else
        Call printOrder(OrderType, Nummer)
    End If
    %>
</body>
</html>
