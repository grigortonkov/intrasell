<!--#include file="../../intrasoft/menu.asp"-->
<%	
	dim OrderType : OrderType = request("OrderType")	
	dim OrderNummer : OrderNummer = request("OrderNummer")	
    call deleteOrder(OrderType, OrderNummer)       
    call drawMsgBox("Gel�scht", getNameFor(OrderType) & " #" & OrderNummer & " wurde gel�scht!", "", "")
    %>    

