<h2>
    <%=getTranslation("Ihre Produktliste")%></h2>
<%

    If Not isLoggedIn() Then
        Response.Write(getTranslation("Bitte vorher anmelden!"))
    Else 'logged in

        Dim orderTypeArtikel : orderTypeArtikel = cleanUserInput(Request("orderType"))
        Dim tableOrdersArtikel, tableOrdersProductsArtikel

        tableOrdersArtikel = getNameForTable(orderTypeArtikel)
        tableOrdersProductsArtikel = "[" & getNameForTableProducts(orderTypeArtikel) & "]"

        Dim MC : MC = "*"
        If Session("dbType") = "SQL" Or Session("dbType") = "MySQL" Then MC = "%"

        Dim rsRechArtikel
        SQL = " SELECT " & tableOrdersArtikel & ".Datum, Status,  " & tableOrdersProductsArtikel & ".* " & _
         " FROM grArtikel, " & tableOrdersProductsArtikel & "," & tableOrdersArtikel & _
         " WHERE " & tableOrdersProductsArtikel & ".RechNr = " & tableOrdersArtikel & ".Nummer " & _
         " and " & tableOrdersProductsArtikel & ".ArtNR = grArtikel.ArtNr " & _
         " and " & tableOrdersArtikel & ".KundNr=" & getLOGIN() & _
         " and grArtikel.ArtNR>=1 and grArtikel.bezeichnung not like '" & MC & "CALCULATE" & MC & "' " & _
         " ORDER BY (" & tableOrdersProductsArtikel & ".RechNr) DESC "

        ' if Session("dbType")  = "SQL" then sql = replace(sql,"*","%")            
        ' response.write SQL
        ' Response.Flush
        rsRechArtikel = objConnectionExecute(SQL)
        If rsRechArtikel.EOF And rsRechArtikel.BOF Then%>
<h2>
    <font size="2" color="red">
        <%=getTranslation("Keine Daten vorhanden!")%></font></h2>
<%  Else%>
<table border="1" bordercolor="#c0c0c0" cellpadding="2" cellspacing="0" width="100%"
    style="border-collapse: collapse">
    <tr>
        <th width="69">
            <b>
                <%=getTranslation("Datum")%></b>
        </th>
        <th width="169">
            <b>
                <%=getTranslation("Rechnung#")%></b>
        </th>
        <th width="169">
            <b>
                <%=getTranslation("Artikel#")%></b>
        </th>
        <th width="175">
            <b>
                <%=getTranslation("Bezeichnung")%></b>
        </th>
        <th width="126">
            <b>
                <%=getTranslation("Stk")%></b>
        </th>
        <th width="74">
            <b>
                <%=getTranslation("Preis")%></b>
        </th>
        <th width="149">
            <b>
                <%=getTranslation("Status Bearbeitung")%></b>
        </th>
        <th width="138">
            <b>
                <%=getTranslation("Status Position")%></b>
        </th>
        <!-- <th width="153"><b><%=getTranslation("Paketnummer")%></b></th>
                -->
        <th width="185">
            <%=getTranslation("Aktion")%>
        </th>
    </tr>
    <%
        Dim orderNRArtikel, countArtikel
        Dim prevOrderNRArtikel : prevOrderNRArtikel = -1 'die alte rechnungszeile 
            
        orderNRArtikel = ""
        countArtikel = 0
        While Not rsRechArtikel.EOF
            orderNRArtikel = rsRechArtikel("RechNr").Value
    %>
    <%If Not prevOrderNRArtikel = orderNRArtikel Then%>
    <tr>
        <td colspan="10">
            &nbsp;
        </td>
    </tr>
    <% End If%>
    <tr>
        <%If Not prevOrderNRArtikel = orderNRArtikel Then%>
        <td width="69" align="middle">
            <%=rsRechArtikel("Datum").Value%>&nbsp;
        </td>
        <td width="169" align="middle">
            <a href="cgi/account/printPreviewOrder.aspx?nummer=<%=OrderNRArtikel%>&amp;OrderType=<%=OrderTypeArtikel%>"
                target="blank">
                <%=getTranslation("ausdrucken")%><br>
                <%=OrderTypeArtikel%>-<%=OrderNRArtikel%>&nbsp;<img border="0" src='<%=imageFullName("printer.png")%>'>
            </a>
        </td>
        <% Else%>
        <td width="69" align="middle">
            -
        </td>
        <td width="69" align="middle">
            -
        </td>
        <% End If%>
        <td align="middle" width="169">
            <%=rsRechArtikel("ArtNr").Value%>&nbsp;
        </td>
        <td align="middle" width="175">
            <%=Server.HtmlEncode(rsRechArtikel("Bezeichnung").Value & "")%>&nbsp;
        </td>
        <td align="middle" width="126" align="center">
            <p align="center">
                <%=rsRechArtikel("Stk").Value%>&nbsp;</p>
        </td>
        <td align="right" width="74" align="right">
            <p align="right">
                <%=FormatNumber(rsRechArtikel("PreisATS_Brutto").Value, 2)%></p>
        </td>
        <td align="middle" width="149">
            <%=rsRechArtikel("Status").Value%>&nbsp;
        </td>
        <td align="middle" width="138">
            <%=rsRechArtikel("PositionStatus").Value%>&nbsp;
        </td>
        <!-- 
                <td align="middle" width="153"><%=getPaketnummer(OrderTypeArtikel, OrderNRArtikel)%>&nbsp;</td>
                -->
        <td align="left" width="185">
            <img border="0" src='<%=imageFullName("data_information.png")%>'>&nbsp; <a href="cgi/calls/requestJob.aspx?Job=RequestOrderInfo&ProductId=<%=rsRechArtikel("ArtNr").Value%>&OrderId=<%=OrderTypeArtikel%><%=OrderNRArtikel%>"
                target="JOB" onclick="window.open ('JOB', 'JOB', 'height=500,width=600,status=yes,toolbar=no,menubar=no,location=no');">
                <%=getTranslation("Bestellinfo")%>
            </a>
            <br>
            <img border="0" src='<%=imageFullName("question.gif")%>'>&nbsp;
            <!--<a href="cgi/calls/requestJob.aspx?Job=RMARequest&ProductId=<%=rsRechArtikel("ArtNr").Value%>&OrderId=<%=OrderTypeArtikel%><%=OrderNRArtikel%>" 
                    target="JOB" OnClick="window.open ('JOB', 'JOB', 'height=400,width=400,status=yes,toolbar=no,menubar=no,location=no');">
                    <%=getTranslation("RMA")%>
                    </a>-->
            <a href="cgi/calls/RMARequest.aspx?Job=RMARequest&ArtNr=<%=rsRechArtikel("ArtNr").Value%>&Nummer=<%=OrderTypeArtikel%><%=OrderNRArtikel%>"
                target="JOB" onclick="window.open ('JOB', 'JOB', 'height=500,width=600,status=yes,toolbar=no,menubar=no,location=no');">
                <%=getTranslation("RMA")%>
            </a>
        </td>
    </tr>
    <%
        prevOrderNRArtikel = orderNRArtikel
        rsRechArtikel.MoveNext()
    End While
    rsRechArtikel.close()
    %>
</table>
<%  End If%>
<p align="center">
    <a href="default.aspx?pageToShow=MyAccount">
        <%=getTranslation("Zurueck zu meinem Konto")%></a></p>
<%  End If%>