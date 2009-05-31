<!--#include file="../../intrasoft/menu.asp"-->
<%	
	 dim OrderType : OrderType = request("OrderType")
	
    Dim newNummer: newNummer= createEmptyOrder(OrderType) ' kdnr = 0, SID=-999
    response.redirect "viewOrder.asp?orderType=" & OrderType  & "&nummer=" & newNummer
%>
