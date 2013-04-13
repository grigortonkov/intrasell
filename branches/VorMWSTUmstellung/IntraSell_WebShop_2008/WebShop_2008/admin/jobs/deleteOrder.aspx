<!--#include virtual="/intrasoft/menu.aspx"-->
<%	
	dim OrderType : OrderType = request("OrderType")	
	dim OrderNummer : OrderNummer = request("OrderNummer")	
    call deleteOrder(OrderType, OrderNummer)       
    Response.Write( drawMsgBox("Gelöscht", getNameFor(OrderType) & " #" & OrderNummer & " wurde gelöscht!", "", ""))
%>
