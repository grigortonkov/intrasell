<!--#include virtual="/intrasoft/menu.aspx"-->
<%	
	dim OrderType : OrderType = request("OrderType")	
	dim OrderNummer : OrderNummer = request("OrderNummer")	
    call deleteOrder(OrderType, OrderNummer)       
    Response.Write( drawMsgBox("Gel�scht", getNameFor(OrderType) & " #" & OrderNummer & " wurde gel�scht!", "", ""))
%>
