<script language="VB" runat="server"> 
    

    '*************************************************************************
    'function printOrder
    '*************************************************************************
    Function printOrder(ByVal OrderType, ByVal Nummer)
        If LCase(VARVALUE_DEFAULT("SHOP_USE_RTF_ORDER_PRINT", "true")) = "true" Then
            Call OpenAusdruck_inWord_RTF(OrderType, Nummer)
        Else 'old asp code 
            printOrder = printOrderWithASP(OrderType, Nummer)
        End If
    End Function

    'original function 
    Function printOrderWithASP(ByVal OrderType, ByVal Nummer) As String
        Dim html As String
    
        Dim TableVorgang, TableVorgangArtikel
        TableVorgang = getNameForTable(OrderType)
        TableVorgangArtikel = getNameForTableProducts(OrderType)
 
        html = html & "<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse'"
        html = html & " bordercolor='#111111' width='670' id='Table1'>"
        html = html & "<tr>"
        html = html & " <td width='800' valign='top'>"
        html = html & "<table border='1' cellpadding='0' cellspacing='0' style='border-collapse: collapse;"
        html = html & "    border-width: 0' bordercolor='#111111' width='100%' id='AutoNumber7' height='382'>"
        html = html & "    <tr>"
        html = html & "         <td width='100%' style='border-style: none; border-width: medium' height='54' colspan='3'"
        html = html & "             align='right'>"
        html = html & "             <img border='0' src='" & imageFullName("rechnung.gif") & "'>"
        html = html & "           </td>"
        html = html & "        </tr>"
        html = html & "        <tr>"
        html = html & "            <td width='33%' style='border-style: none; border-width: medium' height='8'>"
        html = html & "                <font color='#000000'>"
        Dim rsKUND
        Dim knd
        Dim SQL As String
        SQL = "Select * from " & TableVorgang & " where Nummer=" & Nummer
        rsKUND = objConnectionExecute(SQL)
        knd = rsKUND("KundNr").Value
        Dim orderDate : orderDate = rsKUND("Datum").Value
        rsKUND.close()
                            
        html = html & " " & getTranslation("Lieferadresse") & ":"
        html = html & " <br />"
        html = html & " " & printAddress(knd, TypeOfAddress.SHIPPING, False, False) & ""
        html = html & " <hr>"
        html = html & " " & getTranslation("Rechnungsadresse") & ":"
        html = html & "  <br />"
        html = html & "  " & printAddress(knd, TypeOfAddress.INVOICE, False, False) & ""
        html = html & " </font>"
        html = html & "</td>"
        html = html & "<td width='33%' style='border-style: none; border-width: medium' height='8'>"
        html = html & " </td>"
        html = html & "   <td width='34%' style='border-style: none; border-width: medium' height='8'>"
        html = html & "        <p align='right'>"
        html = html & "             <font size='1' color='#000000'>"
        html = html & "                 " & getTranslation(getNameFor(OrderType)) & ""
        html = html & "                  Nr."
        html = html & "                  " & Nummer & ""
        html = html & "                  /"
        html = html & "                   " & orderDate & ""
        html = html & "                   <br />"
        html = html & "                    " & getTranslation("Kunden Nr.") & ":"
        html = html & "                    " & knd & ""
        html = html & "                </font>"
        html = html & "         </td>"
        html = html & "      </tr>"
        html = html & "   <tr>"
        html = html & "            <td colspan='3' style='border-style: none; border-width: medium' height='11'>"
        html = html & "           </td>"
        html = html & "        </tr>"
        html = html & "        <tr>"
        html = html & "            <td width='33%' style='border-left-style: none; border-left-width: medium; border-right-style: none;"
        html = html & "                border-right-width: medium; border-top-style: none; border-top-width: medium;"
        html = html & "                border-bottom-style: solid; border-bottom-width: 1' height='1' bordercolor='#C0C0C0'>"
        html = html & "            </td>"
        html = html & "            <td width='33%' style='border-left-style: none; border-left-width: medium; border-right-style: none;"
        html = html & "                border-right-width: medium; border-top-style: none; border-top-width: medium;"
        html = html & "                border-bottom-style: solid; border-bottom-width: 1' height='1' bordercolor='#C0C0C0'>"
        html = html & "            </td>"
        html = html & "            <td width='34%' style='border-left-style: none; border-left-width: medium; border-right-style: none;"
        html = html & "                border-right-width: medium; border-top-style: none; border-top-width: medium;"
        html = html & "                border-bottom-style: solid; border-bottom-width: 1' height='1' bordercolor='#C0C0C0'>"
        html = html & "            </td>"
        html = html & "       </tr>"
        html = html & "       <tr>"
        html = html & "           <td width='100%' style='border-style: none; border-width: medium' colspan='3' valign='top'"
        html = html & "                height='124'>"
        html = html & "                <table border='1' cellpadding='0' cellspacing='0' style='border-width: 0; border-collapse: collapse'"
        html = html & "                   bordercolor='#C0C0C0' width='100%' id='AutoNumber8'>"
        html = html & "                    <tr>"
        html = html & "                        <td width='58%' align='center' style='border-left-style: solid; border-left-width: 1;"
        html = html & "                            border-right-style: solid; border-right-width: 1; border-top-style: none; border-top-width: medium;"
        html = html & "                            border-bottom-style: none; border-bottom-width: medium' bordercolor='#C0C0C0'>"
        html = html & "                            <font size='1'>"
        html = html & "                                " & getTranslation("Bezeichnung") & "</font>"
        html = html & "                        </td>"
        html = html & "                        <td width='17%' align='center' style='border-left-style: solid; border-left-width: 1;"
        html = html & "                            border-right-style: solid; border-right-width: 1; border-top-style: none; border-top-width: medium;"
        html = html & "                            border-bottom-style: none; border-bottom-width: medium' bordercolor='#C0C0C0'>"
        html = html & "                            <p align='right'>"
        html = html & "                                <font size='1'>"
        html = html & "                                    " & getTranslation("Einzelpreis") & "</font>"
        html = html & "                        </td>"
        html = html & "                       <td width='9%' align='center' style='border-left-style: solid; border-left-width: 1;"
        html = html & "                            border-right-style: solid; border-right-width: 1; border-top-style: none; border-top-width: medium;"
        html = html & "                            border-bottom-style: none; border-bottom-width: medium' bordercolor='#C0C0C0'>"
        html = html & "                           <font size='1'>"
        html = html & "                                " & getTranslation("Stk") & "</font>"
        html = html & "                       </td>"
        html = html & "                       <td width='16%' align='center' style='border-left-style: solid; border-left-width: 1;"
        html = html & "                           border-right-style: solid; border-right-width: 1; border-top-style: none; border-top-width: medium;"
        html = html & "                           border-bottom-style: none; border-bottom-width: medium' bordercolor='#C0C0C0'>"
        html = html & "                            <p align='right'>"
        html = html & "                                <font size='1'>"
        html = html & "                                    " & getTranslation("Total") & ""
        html = html & "                                    " & getTranslation("Preis") & "</font>"
        html = html & "                        </td>"
        html = html & "                    </tr>"
                             

        Dim LAND : LAND = getClientLand(knd)
        SQL = " SELECT MWST, Datum, [" & TableVorgangArtikel & "].* " & _
           " FROM grArtikel " & _
           " INNER JOIN ([" & TableVorgangArtikel & "]" & _
           " INNER JOIN " & TableVorgang & _
           " ON [" & TableVorgangArtikel & "].RechNr = " & TableVorgang & ".Nummer) ON " & _
           " [" & TableVorgangArtikel & "].ArtNR = grArtikel.ArtNr " & _
           " WHERE " & TableVorgang & ".KundNr=" & knd & _
           " and [" & TableVorgangArtikel & "].RechNr = " & Nummer & _
           " ORDER BY grArtikel.PreisATS"

        'response.write sql

        Dim rsWK : rsWK = objConnectionExecute(SQL)
        Dim Pos As Integer : Pos = 0
        Dim Subtotal As Double, Total As Double
        Dim MWSTARRAY(2, 5) ' up to 5 file MWST cases

        Dim i As Integer = 0
        
        While Not rsWK.EOF
            Pos = Pos + 1
                              
            html = html & "                  <tr>"
            html = html & "                      <td width='58%' style='border-style: none; border-width: medium'>"
            html = html & "                          &nbsp;"
            html = html & "                     </td>"
            html = html & "                     <td width='17%' style='border-style: none; border-width: medium' align='right'>"
            html = html & "                         &nbsp;"
            html = html & "                    </td>"
            html = html & "                    <td width='9%' style='border-style: none; border-width: medium' align='center'>"
            html = html & "                        &nbsp;"
            html = html & "                    </td>"
            html = html & "                    <td width='16%' style='border-style: none; border-width: medium' align='right'>"
            html = html & "                        &nbsp;"
            html = html & "                    </td>"
            html = html & "               </tr>"
            html = html & "                <tr>"
            html = html & "                    <td width='58%' style='border-style: none; border-width: medium'>"
            html = html & "                        " & rsWK("Bezeichnung").Value & "&nbsp;"
            html = html & "                    </td>"
            html = html & "                    <td width='17%' style='border-style: none; border-width: medium' align='right'>"
            html = html & "                        " & FormatNumber(CDbl(rsWK("PreisATS").Value), 2) & "&nbsp;"
            html = html & "                    </td>"
            html = html & "                    <td width='9%' style='border-style: none; border-width: medium' align='center'>"
            html = html & "                        " & rsWK("Stk").Value & "&nbsp;"
            html = html & "                    </td>"
            html = html & "                    <td width='16%' style='border-style: none; border-width: medium' align='right'>"
            html = html & "                        " & FormatNumber(CDbl(rsWK("PreisATS").Value) * CDbl(rsWK("Stk").Value), 2) & "&nbsp;"
            html = html & "                    </td>"
            html = html & "               </tr>"
            html = html & "                <tr>"
                                  
            Subtotal = Subtotal + CDbl(rsWK("PreisATS").Value) * CDbl(rsWK("Stk").Value)
            Dim found
            found = False
            For i = 1 To 5
                If (MWSTARRAY(1, i) = "" Or MWSTARRAY(1, i) = rsWK("MWST").Value) And (Not found) Then
                    MWSTARRAY(1, i) = rsWK("MWST").Value
                    MWSTARRAY(2, i) = MWSTARRAY(2, i) + (CDbl(rsWK("PreisATS_Brutto").Value) * rsWK("Stk") - CDbl(rsWK("PreisATS").Value) * rsWK("Stk").Value)
                    found = True
                End If
            Next
    
            'subtotalMWST = subtotalMWST +   makeBruttoPreis(cdbl(rsWK("PreisATS")), cdbl(rsWK("MWST")))*rsWK("Stk")   
            Total = Total + CDbl(rsWK("PreisATS_Brutto")) * rsWK("Stk").Value
    
            rsWK.MoveNext()
        End While
        rsWK.close()
                                
        html = html & "                  <td width='58%' style='border-style: none; border-width: medium'>"
        html = html & "                      &nbsp;"
        html = html & "                  </td>"
        html = html & "                        <td width='17%' style='border-style: none; border-width: medium' align='right'>"
        html = html & "                           &nbsp;"
        html = html & "                        </td>"
        html = html & "                        <td width='9%' style='border-style: none; border-width: medium' align='center'>"
        html = html & "                            &nbsp;"
        html = html & "                        </td>"
        html = html & "                       <td width='16%' style='border-style: none; border-width: medium' align='right'>"
        html = html & "                            &nbsp;"
        html = html & "                        </td>"
        html = html & "                    </tr>"
       
        For i = 1 To 5
            If Not MWSTARRAY(1, i) = "" Then
                              
                html = html & "   <tr>"
                html = html & "        <td width='58%' style='border-style: none; border-width: medium'>"
                html = html & "            &nbsp;"
                html = html & "         </td>"
                html = html & "              <td width='26%' colspan='2' style='border-left-style: none; border-left-width: medium;"
                html = html & "                  border-right-style: none; border-right-width: medium; border-top-style: none;"
                html = html & "                  border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1'"
                html = html & "                   align='right'>"
                html = html & "                   <p align='right'>"
                html = html & "                        <font size='1'>"
                html = html & "                            <br />"
                html = html & "                           " & getTranslation("MWST") & ""
                html = html & "                            (" & MWSTARRAY(1, i) & "):</font>"
                html = html & "                </td>"
                html = html & "                <td style='border-left-style: none; border-left-width: medium; border-right-style: none;"
                html = html & "                    border-right-width: medium; border-top-style: none; border-top-width: medium;"
                html = html & "                    border-bottom-style: solid; border-bottom-width: 1' align='right'>"
                html = html & "                     " & FormatNumber(MWSTARRAY(2, i), 2) & "&nbsp;"
                html = html & "                </td>"
                html = html & "            </tr>"
                             
            End If
        Next
        html = html & "          <tr>"
        html = html & "              <td width='58%' style='border-style: none; border-width: medium'>"
        html = html & "                 &nbsp;"
        html = html & "                       </td>"
        html = html & "                        <td width='26%' colspan='2' align='right' style='border-left-style: none; border-left-width: medium;"
        html = html & "                             border-right-style: none; border-right-width: medium; border-bottom-style: none; border(-bottom - width) : medium() '>"
        html = html & "                             <font size='1'>"
        html = html & "                                " & getTranslation("Gesamtsumme") & ":</font>"
        html = html & "                        </td>"
        html = html & "                        <td style='border-left-style: none; border-left-width: medium; border-right-style: none;"
        html = html & "                            border-right-width: medium; border-bottom-style: none; border-bottom-width: medium'"
        html = html & "                            align='right'>"
        html = html & "                            " & FormatNumber(Total, 2) & "&nbsp;"
        html = html & "                        </td>"
        html = html & "                    </tr>"
        html = html & "                    <tr>"
        html = html & "                       <td width='58%' style='border-style: none; border-width: medium'>"
        html = html & "                           &nbsp;"
        html = html & "                        </td>"
        html = html & "                        <td width='17%' style='border-style: none; border-width: medium'>"
        html = html & "                            &nbsp;"
        html = html & "                        </td>"
        html = html & "                        <td width='9%' style='border-style: none; border-width: medium'>"
        html = html & "                            &nbsp;"
        html = html & "                        </td>"
        html = html & "                        <td width='16%' style='border-style: none; border-width: medium'>"
        html = html & "                             &nbsp;"
        html = html & "                        </td>"
        html = html & "                    </tr>"
        html = html & "                </table>"
        html = html & "            </td>"
        html = html & "        </tr>"
        html = html & "        <tr>"
        html = html & "             <td colspan='3' style='border-style: none; border-width: medium' height='17'>"
        html = html & "             </td>"
        html = html & "         </tr>"
        html = html & "     </table>"
        html = html & "  </td>"
        html = html & "</tr>"
        html = html & "</table>"
        html = html & "<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse'"
        html = html & "   bordercolor='#FFFFFF' width='669' id='AutoNumber9'>"
        html = html & "   <tr>"
        html = html & "      <td colspan='4'>"
        html = html & "          &nbsp;"
        html = html & "      </td>"
        html = html & " </tr>"
        html = html & "<tr>"
        html = html & "    <td colspan='4' style='border-bottom-style: solid; border-bottom-width: 1'>"
        html = html & "       <font size='1'>"
        html = html & "           " & VARVALUE("RECHNUNG_FREIER_TEXT_AGB") & ""
        html = html & "       <br />"
        html = html & "    </font>"
        html = html & "  </td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td width='665' style='border-left-style: solid; border-left-width: 1; border-right-style: solid;"
        html = html & "    border-right-width: 1; border-top-style: solid; border-top-width: 1' colspan='4'>"
        html = html & "    <font size='1'>"
        html = html & "       " & VARVALUE("COMPANY_FULL_NAME") & "<p align='center'>"
        html = html & "    </font>"
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "</table>"
        Response.Write(html)
        
    End Function
</script>