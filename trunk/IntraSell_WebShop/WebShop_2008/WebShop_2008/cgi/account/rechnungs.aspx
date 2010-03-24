<h2>
    <%=getTranslation("Ihre Auftr&auml;ge/Lieferscheine/Rechnungen")%></h2>
<%

 
    If Not isLoggedIn() Then
        Response.Write(getTranslation("Bitte vorher anmelden!"))
    Else 'logged in


        Dim orderType : orderType = Request("orderType")
        Dim tableOrders, tableOrdersProducts
        tableOrders = getNameForTable(orderType)
        tableOrdersProducts = "[" & getNameForTableProducts(orderType) & "]"

        Dim rsRech
        Dim orderNR
	

        Dim MCHAR : MCHAR = "*"
        If Session("dbType") = "SQL" Or Session("dbType") = "MySQL" Then MCHAR = "%"
	
	SQL = " SELECT " & tableOrders &".Datum, Status,  "& tableOrdersProducts &".* " & _
		  " FROM grArtikel, " & tableOrdersProducts & ", " & tableOrders  & _
		  " WHERE "& tableOrdersProducts &".RechNr = " &tableOrders& ".Nummer" & _
		  " and " & tableOrdersProducts &".ArtNR = grArtikel.ArtNr " & _ 
		  " and " & tableOrders &".KundNr=" & getLOGIN() & _
		  " and grArtikel.ArtNR>=1 and grArtikel.bezeichnung not like '" & MCHAR & "CALCULATE" & MCHAR & "' " & _ 
		  " ORDER BY ("& tableOrdersProducts &".RechNr) DESC "	
   
        'if Session("dbType")  = "SQL" then sql = replace(sql,"*","%")  
		  
        'response.write SQL
        'Response.Flush
        rsRech = objConnectionExecute(SQL)
        If rsRech.EOF And rsRech.BOF Then%>
<h2>
    <font size="2" color="red">
        <%=getTranslation("Keine Daten vorhanden!")%></font></h2>
<%  Else%>
<table border="1" bordercolor="#C0C0C0" cellpadding="2" cellspacing="0" width="100%"
    style="border-collapse: collapse">
    <tr>
        <th width="100">
            <%=getTranslation("Aktion")%>
        </th>
        <th width="120">
            <%=getTranslation("Nr")%>
        </th>
        <th width="45">
            <b>
                <%=getTranslation("Datum")%></b>
        </th>
        <th width="191">
            <b>
                <%=getTranslation("Status Bearbeitung")%></b>
        </th>
        <th width="191">
            <b>
                <%=getTranslation("Paketnummer")%></b>
        </th>
        <th width="231">
            <b>
                <%=getTranslation("Artikel#")%></b>
        </th>
        <th width="231">
            <b>
                <%=getTranslation("Bezeichnung")%></b>
        </th>
        <th width="191">
            <b>
                <%=getTranslation("Stk")%></b>
        </th>
        <th width="100">
            <b>
                <%=getTranslation("Summe")%></b>
        </th>
        <th width="191">
            <b>
                <%=getTranslation("Status Position")%></b>
        </th>
    </tr>
    <%
        orderNR = ""
        Dim count : count = 0
		
        While Not rsRech.EOF
    %>
    <tr>
        <%  If orderNR <> rsRech("RechNr") Then 'new invoice
                orderNR = rsRech("RechNr")
                count = count + 1
        %>
        <tr>
            <td align="center">
                <table>
                    <tr>
                        <td>
                            <img border="0" src='<%=imageFullName("printer.png")%>'>
                        </td>
                        <td>
                            <a href="cgi/account/printPreviewOrder.asp?nummer=<%=OrderNR%>&amp;OrderType=<%=OrderType%>"
                                target="blank">
                                <!--#<%=count%>&nbsp;-->
                                <%=getTranslation("ausdrucken")%>&nbsp; </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img border="0" src='<%=imageFullName("data_information.png")%>'>
                        </td>
                        <td>
                            <a href="cgi/calls/requestJob.asp?Job=RequestOrderInfo&ProductId=ALL&OrderId=<%=OrderType%><%=OrderNR%>"
                                target="JOB" onclick="window.open ('JOB', 'JOB', 'height=400,width=400,status=yes,toolbar=no,menubar=no,location=no');">
                                <%=getTranslation("Bestellinfo")%>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img border="0" src='<%=imageFullName("package.png")%>'>
                        </td>
                        <td>
                            <!-- Paketverfolgung -->
                            <% If Not getVorgangEigenschaft("AR", orderNR, "Paketnummer") = "" Then%>
                            <a href="<%=VARVALUE_DEFAULT("SHOP_LINK_PAKETVERFOLGUNG","http://www.dhl.at?paketnummer=")%><%=getVorgangEigenschaft("AR", OrderNR, "Paketnummer")%>"
                                target="_Paketverfolgung">
                                <%=getTranslation("Paketverfolgung")%>
                                <%Else%>
                                <%=getTranslation("keine Paketnummer vergeben")%>
                                <%End If%>
                            </a>
                            <!-- End Paketverfolgung -->
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <%=OrderType%>-<%=OrderNR%>
            </td>
            <td align="center">
                <%=rsRech("Datum")%>&nbsp;
            </td>
            <td align="center">
                <%=rsRech("Status")%>&nbsp;
            </td>
            <td align="center">
                <%=getPaketnummer(OrderType, OrderNR)%>&nbsp;
            </td>
            <%Else ' products of the invoice %>
            <td align="center" colspan="5">
                &nbsp;
            </td>
            <%End If%>
            <td align="center">
                <%=rsRech("ArtNr")%>&nbsp;
            </td>
            <td align="center">
                <%=Server.HTMLEncode(rsRech("Bezeichnung")&"")%>&nbsp;
            </td>
            <td align="center">
                <p align="center">
                    <%=rsRech("Stk")%>&nbsp;</p>
            </td>
            <td align="right">
                <b>
                    <p align="right">
                        <%=FormatNumber(rsRech("PreisATS_Brutto"),2)%></p>
                </b>
            </td>
            <td align="center">
                <%=rsRech("PositionStatus")%>&nbsp;
            </td>
        </tr>
        <%
            rsRech.MoveNext()
        End While
        rsRech.close()
        %>
</table>
<%  End If%>
<p align="center">
    <a href="default.aspx?pageToShow=MyAccount">
        <%=getTranslation("Zur&uuml;ck zu meinem Konto")%></a></p>
<%  End If 'logged in%>