<!--#include file="merchantView/merchantWindow.aspx"-->
<%
    Call LOG() ' save in login table 
    If Request("MERCHANT_HOME") <> "" Then 'redirect to merchant page is required' redirect       
        Response.Redirect(Request("MERCHANT_HOME"))
    End If
%>
<table border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td valign="top">
            <%
                Dim merchantId : merchantId = Request("MerchantId")
                Dim rsM : rsM = objConnectionExecute("select * from lieferantenAdressen  where IDNR=" & merchantId)
                If rsM.eof Then
                    Response.Write(drawErrorBox("Error", "Dieser Lieferant ist unbekannt!", "", ""))
                    Response.End()
                End If


                Dim butArrMerch(3, 2)
                butArrMerch(1, 1) = "Homepage_besuchen"
                butArrMerch(2, 1) = "Adresse_merken"
                butArrMerch(3, 1) = "Filialen"
                butArrMerch(1, 2) = "default.aspx?pageToShow=LieferantenInformationen&merchantId=" & merchantId & "&LieferantNr=" & merchantId & "&MERCHANT_HOME=" & rsM("Web")
                butArrMerch(2, 2) = "cgi/account/saveBookmark.aspx?Title=Lieferant  " & TABLEVALUE("lieferantenAdressen", "IDNR", merchantId, "Firma") & "&Folder=Lieferanten&URL=../merchantPage.aspx?merchantId=" & merchantId
                butArrMerch(3, 2) = "#Filialen"
                Call drawWindowPart1Merchant("Händler Information", " ", "", butArrMerch)
            %>
            <center>
                <table cellspacing="0" cellpadding="5" border="0" width="600">
                    <tr>
                        <td colspan="2" width="288">
                            <p align="center">
                                <%=makeMerchantView(merchantId)%>
                        </td>
                    </tr>
                    <tr>
                        <td width="53">
                            Adresse:
                        </td>
                        <td width="223" rowspan="4">
                            <% Call printAddressLieferanten(merchantId)%>
                        </td>
                        <td width="5" rowspan="7" style="border-left: 1 solid #C0C0C0" bordercolor="#A0A0A0">
                            &nbsp;
                        </td>
                        <td width="34">
                            Tel:
                        </td>
                        <td width="133">
                            <%=rsM("Tel").Value%>
                        </td>
                    </tr>
                    <tr>
                        <td width="53">
                        </td>
                        <td width="34">
                            Tel2:
                        </td>
                        <td width="133">
                            <%=rsM("Tel2").Value%>
                        </td>
                    </tr>
                    <tr>
                        <td width="53">
                        </td>
                        <td width="34">
                            Fax:
                        </td>
                        <td width="133">
                            <%=rsM("Fax").Value%>
                        </td>
                    </tr>
                    <tr>
                        <td width="53">
                        </td>
                        <td width="34">
                            Fax2:
                        </td>
                        <td width="133">
                            <%=rsM("Fax2").Value%>
                        </td>
                    </tr>
                    <tr>
                        <td width="276" colspan="2">
                            <hr width="300" size="1" color="#A0A0A0" align="center">
                        </td>
                        <td width="34">
                            Mobil:
                        </td>
                        <td width="133">
                            <%=rsM("Mobil").Value%>
                        </td>
                    </tr>
                    <tr>
                        <td width="53">
                            Email:
                        </td>
                        <td width="223">
                            <a href="mailto:<%=rsM("Email").Value%>">
                                <%=rsM("Email").Value%></a>
                        </td>
                        <td width="112">
                        </td>
                        <td width="165">
                        </td>
                    </tr>
                    <tr>
                        <td width="53">
                            Web:
                        </td>
                        <td width="223">
                            <a href="<%="merchantPage.aspx?merchantId=" & merchantId & "&MERCHANT_HOME="&rsM("Web").Value%>">
                                <%=rsM("Web").Value%></a>
                        </td>
                        <td width="112">
                        </td>
                        <td width="165">
                        </td>
                    </tr>
                </table>
            </center>
            <%Call drawWindowPart2Merchant("Händler Information", " ", "", butArrMerch)%>
            <table width="800" border="0">
                <tr>
                    <td height="16" bgcolor="#F7F7F7">
                        Spezifische Informationen
                    </td>
                </tr>
            </table>
            <%
                'dim butArr1(0,0)
                'call drawWindowPart1("Spezifische Informationen"," ","",butArr1)
            %>
            <div align="center">
                <center>
                    <table border="0" cellspacing="0" cellpadding="0" width="600">
                        <% 
                            Dim merch : merch = merchantId
                            Dim rsZ, check
                            sql = " SELECT delivery, deliveryPrice FROM priceCompareHaendler WHERE LieferantNr=" & merch
                            'response.Write sql: response.flush
                            rsM = objConnectionExecute(sql)
                        %>
                        <tr>
                            <td align="right" width="50%">
                                <b>Lieferungdienst</b>
                            </td>
                            <td align="center" width="50%">
                                <%If rsM("delivery") = True Then%><img src="cgi/priceCompare/images/check-ja.gif"><%Else%><img
                                    src="cgi/priceCompare/images/check-nein.gif"><%End If%>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" width="50%">
                                <b>Preis per Lieferung (€)</b>
                            </td>
                            <td align="center" width="50%">
                                <%  If IsNumeric(rsM("deliveryPrice").Value) Then
                                        Response.Write("€ " & FormatNumber(rsM("deliveryPrice").Value, 2))
                                    Else
                                        Response.Write(rsM("deliveryPrice").Value)
                                    End If
                                %>
                            </td>
                        </tr>
                        <!-- Zahlungsbedingungen -->
                        <tr>
                            <td colspan="2" align="left" bgcolor="#F7F7F7">
                                <b>Zahlungsbedingungen</b>
                            </td>
                        </tr>
                        <% 
                            sql = " SELECT  * FROM grZahlungsbedingung "
                            rsM = objConnectionExecute(sql)
                            While Not rsM.EOF
                                sql = " SELECT * FROM [priceCompareHaendler_Zahlungsbedingungen] WHERE Bedingung= " & rsM("Nr").Value & " and IDNR= " & merch
                                rsZ = objConnectionExecute(sql)
                                If rsZ.BOF And rsZ.EOF Then check = False Else check = True
                        %>
                        <tr>
                            <td align="right" width="50%">
                                <b>
                                    <%=rsM("Methode").Value%>:</b>
                            </td>
                            <td align="center" width="50%">
                                <%If check = True Then%><img src="cgi/priceCompare/images/check-ja.gif"><%Else%><img
                                    src="cgi/priceCompare/images/check-nein.gif">
                                <%End If%>
                            </td>
                        </tr>
                        <%  rsM.MoveNext()
                        End While
                        %>
                        <!-- Zahlungsmethoden -->
                        <tr>
                            <td colspan="2" align="left" bgcolor="#F7F7F7">
                                <b>Zahlungsbedingungen - Abholung </b>
                            </td>
                        </tr>
                        <%
                            sql = " SELECT * FROM grZahlungsmethode "
                            rsM = objConnectionExecute(sql)
                            While Not rsM.EOF
                                sql = " SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] WHERE methode='" & rsM("methode").Value & "' and IDNR= " & merch
                                rsZ = objConnectionExecute(sql)
                                If rsZ.BOF And rsZ.EOF Then check = False Else check = True
                        %>
                        <tr>
                            <td align="right" width="50%">
                                <b>
                                    <%=rsM("Methode").Value%>:</b>
                            </td>
                            <td align="center" width="50%">
                                <%If check = True Then%><img src="cgi/priceCompare/images/check-ja.gif">
                                <%Else%><img src="cgi/priceCompare/images/check-nein.gif">
                                <%End If%>
                            </td>
                        </tr>
                        <%
                            rsM.MoveNext()
                        End While
                        rsZ.close()
                        rsZ = Nothing
                        %>
                        <!-- Lieferungsmethoden -->
                        <tr>
                            <td colspan="2" align="left" bgcolor="#F7F7F7">
                                <b>Lieferungsmethoden</b>
                            </td>
                        </tr>
                        <% 
                            sql = " SELECT  * FROM grLieferungbedingungen"
                            rsM = objConnectionExecute(sql)
                            While Not rsM.EOF
                                sql = " SELECT * FROM [priceCompareHaendler_Lieferungbedingungen] WHERE BedingungNr= " & rsM("Nr") & " and IDNR= " & merch
                                rsZ = objConnectionExecute(sql)
                                If rsZ.BOF And rsZ.EOF Then check = False Else check = True
                        %>
                        <tr>
                            <td align="right" width="50%">
                                <b>
                                    <%=rsM("Bedingung").Value%>:</b>
                            </td>
                            <td align="center" width="50%">
                                <%If check = True Then%><img src="cgi/priceCompare/images/check-ja.gif"><%Else%><img
                                    src="cgi/priceCompare/images/check-nein.gif">
                                <%End If%>
                            </td>
                        </tr>
                        <%  rsM.MoveNext()
                        End While
                        %>
                        <!-- Services -->
                        <tr>
                            <td colspan="2" align="left" bgcolor="#F7F7F7">
                                <b>Serviceleistungen</b>
                            </td>
                        </tr>
                        <% 
                            sql = " SELECT  * FROM grServices"
                            rsM = objConnectionExecute(sql)
                            While Not rsM.EOF
                                sql = " SELECT * FROM [priceCompareHaendler_Services] WHERE ServiceNr= " & rsM("Nr") & " and IDNR= " & merch
                                rsZ = objConnectionExecute(sql)
                                If rsZ.BOF And rsZ.EOF Then check = False Else check = True
                        %>
                        <tr>
                            <td align="right" width="50%">
                                <b>
                                    <%=rsM("Service").Value%>:</b>
                            </td>
                            <td align="center" width="50%">
                                <%If check = True Then%><img src="cgi/priceCompare/images/check-ja.gif"><%Else%><img
                                    src="cgi/priceCompare/images/check-nein.gif">
                                <%End If%>
                            </td>
                        </tr>
                        <%  rsM.MoveNext()
                        End While
                        %>
                    </table>
                </center>
                <%
                    'call drawWindowPart2("Spezifische Informationen"," ","",butArr1)
                %>
                <table width="800" border="0">
                    <tr>
                        <td height="16" bgcolor="#F7F7F7">
                            Filialen
                        </td>
                    </tr>
                </table>
                <a name="Filialen"></a>
                <%
                    Dim butArr2(0, 0)
                    'call drawWindowPart1("Filialen"," ","", butArr2)%>
                <%
                    Dim sqlFiliallen : sqlFiliallen = "select * from priceCompareHaendlerFilialen where LieferantNr =" & merchantId
                    Dim rsFil : rsFil = objConnectionExecute(sqlFiliallen)

                    If rsFil.EOF Then
                %>
                Dieser Lieferant hat keine Filialen eingetragen!
                <%     
                End If
                %>
                <center>
                    <table width="600">
                        <%
                            Dim ik : ik = 0
                            While Not rsFil.EOF
                        %><tr>
                            <td width="300">
                                <% Call printAddressLieferanten(rsFil("FilialeNr").Value)%>
                                <hr>
                            </td>
                            <td width="300">
                                <%  If Not rsFil.EOF Then
                                        Call printAddressLieferanten(rsFil("FilialeNr").Value)
                                        ik = ik + 1
                                        rsFil.movenext()
                                    End If
                                %>
                                <hr>
                            </td>
                        </tr>
                        <%
                            If Not rsFil.EOF Then
                                rsFil.movenext()
                                ik = ik + 1
                            End If
                        End While
                        rsFil.close()
                        %></table>
                </center>
                <%
                    'call drawWindowPart2("Filialen"," ","", butArr2)
                %>
        </td>
</table>
