<!--#include virtual="/intrasoft/menu.aspx"-->
<%
Dim OrderType: OrderType = Request("OrderType")
Dim tableNameOrders: tableNameOrders = getNameForTable(OrderType)
Dim showClosedOrders : showClosedOrders = request("showClosedOrders"): if showClosedOrders ="" then showClosedOrders = "0"
%>
<h3>
    <%=getNameFor(OrderType)%>
    [<a href="../jobs/newOrder.asp?OrderType=<%=OrderType%>"><%=translate("NEW")%></a>]</h3>
<table border="1" width="800" cellspacing="0">
    <tr>
        <th width="25%" align="center" nowrap>
            <%=translate("Convert")%>&gt;&gt;
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("See")%>&nbsp;
        </th>
        <th width="25%" align="center" nowrap>
            Nr.
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("Client")%>
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("Date")%>
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("Sum")%>
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("Printed")%>
            (1)
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("Paid")%>
            (2)
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("Closed")%>
            (3)
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("converted from")%>
        </th>
        <th width="25%" align="center" nowrap>
            <%=translate("converted to")%>
        </th>
    </tr>
    <%



Dim sql: sql = "SELECT * FROM " & tableNameOrders  & _ 
		" WHERE anElba=" & showClosedOrders & _ 
		" Order BY Datum desc, Nummer desc" 
		
'response.write sql
dim rs = ObjConnectionExecute(sql)
dim counter as Integer = 0
while not rs.EOF and counter <= 100
counter = counter + 1
    %>
    <tr>
        <td width="25%">
            <p align="center">
                <a href="../jobs/convertFromTo.aspx?fromNummer=<%=rs("Nummer").Value%>&From=<%=OrderType%>">
                    <%=translate("Convert")%></a>
            </p>
        </td>
        <td width="25%">
            <p align="center">
                <a href="../jobs/viewOrder.aspx?nummer=<%=rs("nummer").Value%>&OrderType=<%=OrderType%>">
                    <%=translate("See")%></a></p>
        </td>
        <td width="25%">
            <%=rs("Nummer").Value%>
        </td>
        <td width="25%">
            <%=TABLEVALUE("ofAdressen","IDNR",rs("KundNR").Value,"Name")%>
        </td>
        <td width="25%">
            <%=rs("Datum").Value%>
        </td>
        <td width="25%">
            <%=rs("Summe").Value%>
        </td>
        <td width="25%">
            <%=drawCheckBoxForBoolean(rs("Ausgedrukt").Value)%>
        </td>
        <td width="25%">
            <%=drawCheckBoxForBoolean(rs("Bezahlt").Value)%>
        </td>
        <td width="25%">
            <%=drawCheckBoxForBoolean(rs("anElba").Value)%>
        </td>
        <td width="25%">
            <%=rs("Woher").Value%>
        </td>
        <td width="25%">
            <%=rs("Wohin").Value%>
        </td>
    </tr>
    <% 
  rs.moveNext 
 
end while 
rs.close 
if counter >=100 then 
    response.write ("Es sind mehr als 100 Bestellungen vorhanden!")
end if 

    %>
</table>
<p align="center">
    &nbsp;</p>
1, 2, 3 - can have different meaning in the diff. order types!