<!--#include virtual="/intrasoft/menu.aspx"-->
<%	
	 dim OrderType : OrderType = request("OrderType")
	
    Dim newNummer: newNummer= createEmptyOrder(OrderType) ' kdnr = 0, SID=-999
    response.redirect "viewOrder.aspx?orderType=" & OrderType  & "&nummer=" & newNummer
%>
