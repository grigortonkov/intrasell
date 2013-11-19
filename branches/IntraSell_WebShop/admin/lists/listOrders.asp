<!--#include virtual="/intrasoft/menu.asp"-->
<%
Dim OrderType: OrderType = Request("OrderType")
Dim tableNameOrders: tableNameOrders = getNameForTable(OrderType)
Dim showClosedOrders : showClosedOrders = request("showClosedOrders"): if showClosedOrders ="" then showClosedOrders = "0"
%>
<h3><%=getNameFor(OrderType)%>  [<a href="../jobs/newOrder.asp?OrderType=<%=OrderType%>"><%=translate("NEW")%></a>]</h3>
<table border="1" width="800" cellspacing="0">



  <tr>
    <th width="25%" align="center" nowrap><%=translate("Convert")%>&gt;&gt;</th>
    <th width="25%" align="center" nowrap><%=translate("See")%>&nbsp;</th>
    <th width="25%" align="center" nowrap>Nr.</th>
    <th width="25%" align="center" nowrap><%=translate("Client")%></th>
    <th width="25%" align="center" nowrap><%=translate("Date")%></th>
    <th width="25%" align="center" nowrap><%=translate("Sum")%></th>
    <th width="25%" align="center" nowrap><%=translate("Printed")%> (1)</th>
    <th width="25%" align="center" nowrap><%=translate("Paid")%> (2)</th>
    <th width="25%" align="center" nowrap><%=translate("Closed")%> (3)</th>
    <th width="25%" align="center" nowrap><%=translate("converted from")%></th>
    <th width="25%" align="center" nowrap><%=translate("converted to")%></th>
  </tr>
<%

function drawCheckBoxForBoolean(bool)
   if bool then 
      %><input type="checkbox" name="C1" value="ON" checked>
      <%
   else
      %>
      <input type="checkbox" name="C2" value="ON">
      <%
   end if 
end function 

Dim sql: sql = "SELECT * FROM " & tableNameOrders  & _ 
		" WHERE anElba=" & showClosedOrders & _ 
		" Order BY Datum desc, Nummer desc" 
		
'response.write sql
dim rs: set rs = ObjConnectionExecute(sql)
while not rs.EOF 
  %>

  <tr>
    <td width="25%">
      <p align="center"><a href="../jobs/convertFromTo.asp?fromNummer=<%=rs("Nummer")%>&From=<%=OrderType%>">
      <%=translate("Convert")%></a>
      </p>
    </td>
    <td width="25%">
      <p align="center"><a href="../jobs/viewOrder.asp?nummer=<%=rs("nummer")%>&OrderType=<%=OrderType%>">
      <%=translate("See")%></a></p>
    </td>
    <td width="25%"><%=rs("Nummer")%></td>
    <td width="25%"><%=TABLEVALUE("ofAdressen","IDNR",rs("KundNR"),"Name")%></td>
    <td width="25%"><%=rs("Datum")%></td>
    <td width="25%"><%=rs("Summe")%></td>
    <td width="25%"><%=drawCheckBoxForBoolean(rs("Ausgedrukt"))%></td>
    <td width="25%"><%=drawCheckBoxForBoolean(rs("Bezahlt"))%></td>
    <td width="25%"><%=drawCheckBoxForBoolean(rs("anElba"))%></td>
    <td width="25%"><%=rs("Woher")%></td>
    <td width="25%"><%=rs("Wohin")%></td>
  </tr>
  <% 
  rs.moveNext 
wend 
rs.close 
%>
</table>
<p align="center">&nbsp;</p>
1, 2, 3 - can have different meaning in the diff. order types!