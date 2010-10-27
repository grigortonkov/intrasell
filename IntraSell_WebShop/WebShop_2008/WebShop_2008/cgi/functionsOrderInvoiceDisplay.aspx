<script language="VB" runat="server">  
 
    
    Function getTranslation_(ByVal s As String)
        Return s
    End Function
    
    '*************************************************************************
    ' showOrder - General Function for Shopping Basket on the Administration Side
    '*************************************************************************
    Sub showOrder(ByVal OrderType As String, ByVal Nummer As String)
        Dim html As String
        Dim sql As String
        
        Dim TableVorgang As String, TableVorgangArtikel As String
    
        TableVorgang = getNameForTable(OrderType)
        TableVorgangArtikel = getNameForTableProducts(OrderType)

        sql = "SELECT *  FROM " & TableVorgang & " Where Nummer=" & Nummer
        ' response.write sql
     
        Dim rsV
        rsV = objConnectionExecute(sql)
        If rsV.EOF Then
            Response.Write("Sorry! The Order " & OrderType & "-" & Nummer & "was not found!")
            Exit Sub
        End If
        html = html & "<form action='viewOrder.aspx?nummer=" & Nummer & "&OrderType=" & OrderType & "&exec=Update' method='post'>"
        html = html & "<h1> [" & getTranslation(getNameFor(OrderType)) & "]</h1>"
        html = html & "<table border='1' width='800' cellspacing='0' bordercolor='#C0C0C0' id='Table1'>"
        html = html & "<tr>"
        html = html & "<td width='220'>"
        html = html & " " & getTranslation("Datum")
        html = html & "   <input name='Datum' size='25' value='" & rsV("Datum").Value & "'>"
        html = html & "     </td>"
        html = html & "     <td width='566' colspan='2' align='center'>"
        html = html & getTranslation("bezahlt") & "<input type='checkbox' name='C1' value='ON' " & SQLToCheck(rsV("Bezahlt").Value) & " id='Checkbox1'> "
        html = html & getTranslation("ausgedruckt") & "<input type='checkbox' name='C2' value='ON' " & SQLToCheck(rsV("Ausgedrukt").Value) & " id='Checkbox2'>"
        html = html & getTranslation("abgeschloßen") & "<input type='checkbox' name='C3' value='ON' " & SQLToCheck(rsV("anElba").Value) & " id='Checkbox3'>"
    
        html = html & "    </td>"
        html = html & " </tr>"
        html = html & " <tr>"
        html = html & "    <td width='220'>" & getTranslation("Kunde") & ":"
        html = html & "        <input type='hidden' name='IDNR' size='15' value='" & rsV("KundNr").Value & "' id='Hidden1'>"
        html = html & "    " & printAddress(rsV("KundNr").Value, OrderType, True, False) & ""
        html = html & "     <br />"
        html = html & "     " & getTranslation("aendern") & ":"
        html = html & query2list("Select IdNR, '-', Name FROM ofAdressen Order BY IdNR, Name", "newIDNR")
        html = html & "  </td>"
        html = html & " <td width='262'>&nbsp;</td>"
        html = html & " <td width='304'>"
        Dim notiz : notiz = tablevalue(TableVorgang, "Nummer", Nummer, "Notiz")
          
        If notiz <> "" Then
            
            html = html & "Notiz:"
             
            ' Response.Write(notiz)
        End If
       
        html = html & " </td>"
        html = html & "</tr>"
        html = html & "</table>"
 
        rsV.close()
 
        html = html & "<table border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse'  bordercolor='#C0C0C0' width='800' id='AutoNumber1' height='38'>"
        html = html & " <tr>"
        html = html & "<th width='35' height='20' align='center' nowrap> " & getTranslation("Löschen") & " </th>"
        html = html & "<th width='35' height='20' align='center' nowrap> " & getTranslation("Position") & " </th>"
        html = html & "<th width='50' height='20' align='center' nowrap> " & getTranslation("ArtNR") & " </th>"
        html = html & "<th width='244' height='20' align='center' nowrap> " & getTranslation("Bezeichnung") & " </th>"
        html = html & "<th width='44' height='20' align='center' nowrap> " & getTranslation("Stk") & " </th>"
        html = html & "<th width='113' height='20' align='center' nowrap> " & getTranslation("Preis") & " </th>"
        html = html & "<th width='113' height='20' align='center' nowrap> " & getTranslation("Bruttopreis") & " </th>"
        html = html & "</tr>"
     

        sql = "SELECT [" & TableVorgangArtikel & "].*, EAN " & _
           " FROM [" & TableVorgangArtikel & "] INNER JOIN grArtikel ON [" & TableVorgangArtikel & "].ArtNR = grArtikel.ArtNr" & _
           " Where RechNr=" & Nummer
      
        'response.write sql
      
        Dim rsWK
        rsWK = objConnectionExecute(sql)
        Dim pos : pos = 0
   
        Dim totalBrutto : totalBrutto = 0
        While Not rsWK.EOF
            pos = pos + 1
            totalBrutto = totalBrutto + CDbl(rsWK("PreisATS_Brutto").Value)
    
            html = html & "<tr>"
            html = html & "<td height='17'>"
            html = html & "<p align='center'>"
            html = html & "    <input name='art" & pos & "' type='hidden' value='" & rsWK("ArtNR").Value & "' id='Hidden2'>"
            html = html & "    <input type='checkbox' name='checkD" & pos & "' value='ON' onclick='return checkD'" & pos & "_onclick()' id='Checkbox4'>"
            html = html & "</td>"
            html = html & "<td height='17' align='center'>" & pos & "<td height='17'>"
            If UCase(VARVALUE("BenutzeEAN")) = "TRUE" Then
                html = html & "" & rsWK("EAN").Value & ""
            Else
                html = html & "" & rsWK("ArtNr").Value & ""
            End If
            html = html & "</td>"
            html = html & "<td height='17'>"
            html = html & "" & rsWK("Bezeichnung").Value & ""
            html = html & "</td>"
            html = html & "<td height='17' align='center'>"
            html = html & "   <input name='Stk" & pos & "' size='4' value='" & rsWK("Stk").Value & "' id='Text2'>"
            html = html & "</td>"
            html = html & "<td height='17' align='right'>"
            html = html & "<input name='PreisATS" & pos & "' size='15' value='" & FormatNumber(rsWK("PreisATS").Value, 2) & "'  id='Text3'>"
            html = html & "</td>"
            html = html & "<td height='17' align='right'>"
            html = html & "<input name='PreisATS_Brutto" & pos & "' size='15' value='" & FormatNumber(rsWK("PreisATS_Brutto").Value, 2) & "'  id='Text4'>"
            html = html & "</td>"
            html = html & "</tr>"
        
            rsWK.MoveNext()
        End While
        rsWK.close()
     
        html = html & "<tr>"
        html = html & "     <td height='17' colspan='5'>"
        html = html & "    </td>"
        html = html & "  <td height='17'>"
        html = html & "    <hr>"
        html = html & "    Total:"
        html = html & " </td>"
        html = html & " <td height='17' align='right'>"
        html = html & "    <hr>"
        html = html & "    " & totalBrutto & ""
        html = html & "</td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<th colspan='6'>"
        html = html & "    <input type='hidden' name='Items' size='9' value='" & pos & "' id='Hidden3'>"
        html = html & "</th>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<th colspan='3' align='right'>"
        html = html & "" & getTranslation("Produkt") & "&nbsp;" & getTranslation("einfügen") & ""
        html = html & " #"
        html = html & "</th>"
        html = html & "<td colspan='3'>"
          
        Dim rsCheck = objConnectionExecute("Select count(*) as cc from grArtikel")
        If CDbl(rsCheck("cc").Value) < 500 Then
            Call query2list("Select ArtNR,'-',Bezeichnung from grArtikel where produktAktiv <> 0 Order BY ArtNr", "AddNew")
        Else
            html = html & " or type the #"
            html = html & "<input class='button' name='addNew' value='' size='10' id='Text5'>"
        End If
        rsCheck.close()
        rsCheck = Nothing & ""
        html = html & " </td>"
        html = html & "</tr>"
        html = html & "<tr>"
        html = html & "<td colspan='6' align='center'>"
        html = html & "    <p align='left'>"
        html = html & " <input type='submit' class='button' value='" & getTranslation("aktualisieren") & "'></p>"
        html = html & " </td>"
        html = html & "</tr>"
        html = html & "</table>"
        html = html & "</form>"
 
        Response.Write(html)
    End Sub
 

    ''' <summary>
    '****************************************************************************
    ' Description: shows content of the shopping basket
    ' Show what is in WK
    ' 
    ' Modifications: 22-01.2005 
    '
    '****************************************************************************
    ''' </summary>
    ''' <param name="StepN"></param>
    ''' <param name="Land"></param>
    ''' <param name="PayMode"></param>
    ''' <param name="PostMode"></param>
    ''' <param name="PostModeDestination"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function visualizeWarenkorb(ByVal StepN, ByVal Land, ByVal PayMode, ByVal PostMode, ByVal PostModeDestination)
        Dim sql As String, rsWK
        Dim gutscheinNummer : gutscheinNummer = Session("GutscheinNummer")
        Dim sid As String : sid = getSID()
        Dim html As String
         Dim Language As String = Session("LANGUAGE")
        Dim IDNR As Object : IDNR = getLOGIN()
        sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, webWarenkorb.Notiz, grArtikel.* " & _
           " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
           " Where SID=" & sid & " AND webWarenkorb.Quantity > 0  AND (AuftragNr is null or AuftragNr=0)"
        rsWK = objConnectionExecute(sql)

        If rsWK.EOF And rsWK.BOF Then ' empty basket & "
            html = html & "<h3>"
            html = html & "<font color='red' class='error'>"
            html = html & "" & getTranslation("Ihr Warenkorb ist leer!") & "</font></h3>"
 
            visualizeWarenkorb = False
        Else
            visualizeWarenkorb = True
 
            If getFreiHausLieferungUmsatz() > 0 Then
                html = html & "<h2>"
                html = html & "" & getTranslation("Frei Haus Lieferung ab:") & ""
                html = html & "" & FormatNumber(getFreiHausLieferungUmsatz(), 2) & "</h2>"
            End If
            html = html & "<table border='1' cellpadding='2' cellspacing='0' width='100%' style='border-collapse: collapse' bordercolor='#C0C0C0' bgcolor='#F3F3F3' id='BasketTable'>"
            html = html & "<tr>"
            html = html & "<th width='58' align='center'>"
            html = html & "   " & getTranslation("Position") & ""
            html = html & "</th>"
            html = html & "<th width='71' align='center'>"
            html = html & "   " & getTranslation("Anzahl") & ""
            html = html & "</th>"
            html = html & "<th width='71' align='center'>"
            html = html & "   " & getTranslation("ArtNR") & ""
            html = html & "</th>"
            html = html & "<th width='71' align='center'>"
            html = html & "   " & getTranslation("EAN") & ""
            html = html & "</th>"
            html = html & "<th width='322' align='center'>"
            html = html & "   " & getTranslation("Bezeichnung") & ""
            html = html & "</th>"
            html = html & "<th width='50' align='center'>"
            html = html & "   " & getTranslation("Lieferung") & ""
            html = html & "</th>"
            html = html & "<th width='100' align='center'>"
            html = html & "   " & getTranslation("Preis") & ""
            html = html & "</th>"
            html = html & "<th width='100' align='center'>"
            html = html & "   " & getTranslation("Total") & ""
            html = html & "</th>"
            html = html & "</tr>"
            html = html & "<tr>"
            html = html & "<td colspan='8'>"
            html = html & "&nbsp;"
            html = html & "</td>"
            html = html & "</tr>"
    
            Dim pos As Integer : pos = 0
            Dim Subtotal As Double : Subtotal = 0
            Dim SubtotalMWST As Double : SubtotalMWST = 0
            Dim ArtNr
            Dim Stk As Integer
            
            While Not rsWK.EOF
        
                pos = pos + 1
                ArtNr = rsWK("ArtNR").Value
                Stk = CInt(rsWK("Quantity").Value)
                Dim Einzelpreis As Double = 0
                'Einzelpreis = makeNettoPreis(ArtNR, Stk, sid) 'old way to calculate prices
                Einzelpreis = getPreis(getLOGIN(), ArtNr, Stk)
                'call Response.Write ("Stk:[" &  stk & "]")
                'call Response.Write ("Einzelpreis:[" & einzelpreis & "]")
                Subtotal = CDbl(Subtotal) + CDbl(Einzelpreis) * CInt(Stk)
                'SubtotalMWST = cdbl(SubtotalMWST) + cdbl(makeBruttoPreis2(ArtNr, Stk, Land)) * Stk 'Old Way 
                
                If IDNR & "" = "" Then 'der user ist noch nicht angemeldet 
                    IDNR = 0
                End If
                SubtotalMWST = CDbl(SubtotalMWST) + CDbl(calculateBruttoPreis(Einzelpreis, ArtNr, IDNR)) * Stk
                'Response.Write "SubtotalMWST = " & SubtotalMWST
    
                html = html & "<tr bgcolor='white' id='BasketRow'>"
                html = html & "<td width='58' height='17'>"
                html = html & "<p align='center'>"
                html = html & " " & pos & ""
                html = html & "</td>"
                html = html & "<td align='center' height='17'>"
                html = html & "<input type='hidden' name='Art" & pos & "' size='9' value='" & rsWK("ArtNr").Value & "' id='Hidden4' />"
                If StepN = "1" Then
                    html = html & "<a href='default.aspx?pagetoShow=warenkorbStep1&Items=1&Art1=" & rsWK("ArtNr").Value & "&checkD1=ON'>"
                    html = html & "<img src='" & imageFullName("delete.gif") & "' alt='delete this position' border='0' align='middle'></a>"
                    html = html & "<!-- <input type='checkbox' name='checkD'" & pos & " ' value='ON'> -->"
                    html = html & "<input name='Stk" & pos & "' size='3' value='" & rsWK("Quantity").Value & "' />"
                Else
                    html = html & "" & rsWK("Quantity").Value & ""
                End If
                html = html & "</td>"
                html = html & "<td height='17'>"
                html = html & "<a href='default.aspx?ArtNR=" & rsWK("ArtNR").Value & "' target='_new'>"
                html = html & "" & rsWK("ArtNR").Value & "</a>"
                html = html & "</td>"
                html = html & "<td height='17'>"
                html = html & "" & rsWK("EAN").Value & ""
                html = html & "</td>"
                html = html & "<td height='17'><a href='default.aspx?ArtNR=" & rsWK("ArtNR").Value & "' target='_new'>"
                html = html & getTranslationDok("grArtikel", rsWK("ArtNR").Value, "Bezeichnung", rsWK("Bezeichnung").Value & "", Language) & "</a>&nbsp;<b>" & rsWK("Notiz").Value & "</b></td>"
                html = html & "<td height='17'>"
                html = html & " <a href='default.aspx?ArtNR=" & rsWK("ArtNR").Value & "' target='_new'>" & rsWK("Bezeichnung1").Value & "</a>"
                html = html & "</td>"
                html = html & "<td align='right' height='17'>"
                html = html & "<p align='right'>" & FormatNumber(CDbl(Einzelpreis), 2) & "</p>"
                html = html & "</td>"
                html = html & "<td align='right' height='17'>"
                html = html & "<p align='right'>" & FormatNumber(CDbl(Einzelpreis) * CInt(Stk), 2) & "</p>"
                html = html & "</td>"
                html = html & "</tr>"
       
        
                rsWK.MoveNext()
            End While
            rsWK.close()
        
            Dim subtotalNoAddCharged : subtotalNoAddCharged = Subtotal
     
            html = html & "<input type='hidden' name='Items' value='" & pos & "' id='Hidden5'>"
            'POST and MODE COSTS 
            Dim KG As Double : KG = getWeightOfBasket(sid)
            Dim PostCosts As Decimal : PostCosts = 0
            Dim PostExpensesMWST As Decimal : PostExpensesMWST = 0
       
            Dim payModeExpenses As Double : payModeExpenses = 0
            Dim payModeExpensesMWST : payModeExpensesMWST = 0
       
            Dim gutscheinSumme As Double : gutscheinSumme = 0
            Dim gutscheinSummeMWST As Double : gutscheinSummeMWST = 0
      
            Dim messageNoCosts As String : messageNoCosts = ""
       
            'Response.Write "calculateWarenkorbSum()=" & calculateWarenkorbSum()
            'if (1*calculateWarenkorbSum() < 1*getFreiHausLieferungUmsatz()) or getFreiHausLieferungUmsatz()=-1 then  'CALCULATE COSTS 
            If (1 * Subtotal < 1 * getFreiHausLieferungUmsatz()) Or getFreiHausLieferungUmsatz() = -1 Then  'CALCULATE COSTS 
                If UCase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" Then
                    Dim postSpendsArtNr : postSpendsArtNr = getPostSpendsArtNr(Land, KG, PostMode)
                    PostCosts = calculatePostSpendsForWK(PostModeDestination, KG, PostMode)
                    PostExpensesMWST = makeBruttoPreis(PostCosts, 2, Land)
                    PostExpensesMWST = CDbl(calculateBruttoPreis(PostCosts, postSpendsArtNr, IDNR))
                    'if (SubtotalMWST = 0 ) then  PostExpensesMWST = 0
                End If
       
                If UCase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" Then
                    Dim payModeArtNr : payModeArtNr = getPaymentModeSpendsArtNr(PayMode, Land)
                    If PayMode <> "" Then payModeExpenses = calculatePaymentModeSpends(PayMode, Land, KG, subtotalNoAddCharged)
                    payModeExpensesMWST = makeBruttoPreis(payModeExpenses, 2, Land)
                    payModeExpensesMWST = CDbl(calculateBruttoPreis(payModeExpenses, payModeArtNr, IDNR))
                    'if (SubtotalMWST = 0 ) then  payModeExpensesMWST = 0
                End If
                'END POST AND MODE COSTS 
            Else
                messageNoCosts = "<br /><font color=""red"" class=""error"">Yeeep: Es werden keine Transport- und Zahlungskosten kalkuliert!</font>"
            End If
       
       
            If gutscheinNummer <> "" Then
                gutscheinSumme = getPreisForGutschein(gutscheinNummer)
                gutscheinSummeMWST = makeBruttoPreis(gutscheinSumme, 2, Land)
            End If
       
       
            Subtotal = Subtotal + payModeExpenses + PostCosts - gutscheinSumme
            SubtotalMWST = SubtotalMWST + PostExpensesMWST + payModeExpensesMWST - gutscheinSummeMWST
   
            If UCase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" Then
                html = html & "<tr>"
                html = html & "<td colspan='4'>"
                html = html & "</td>"
                html = html & "<td colspan='2'>"
                html = html & "" & getTranslation("Transportkosten") & ""
                html = html & "(" & getTranslation("Dienst") & ": <b>"
                html = html & "" & PostMode & "</b>), (KG=<b>" & KG & "</b>), (" & getTranslation("Ziel") & "=<b>" & PostModeDestination & "</b>)"
                html = html & "" & messageNoCosts & ""
                html = html & "</td>"
                html = html & "<td>"
                html = html & "&nbsp;"
                html = html & "</td>"
                html = html & "<td align='right' height='17' bgcolor='white' id='BasketRow'>"
                html = html & " <p align='right'>" & FormatNumber(PostCosts, 2) & "</p>"
                html = html & "</td>"
                html = html & "</tr>"
            End If
            
            If UCase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" Then
                html = html & "<tr>"
                html = html & " <td colspan='4'>"
                html = html & " </td>"
                html = html & " <td colspan='2'>"
                html = html & " " & getTranslation("Zahlungskosten") & ""
                html = html & " (<b>" & PayMode & "</b>)</font>"
                html = html & "</td>"
                html = html & "<td>"
                html = html & "   &nbsp;"
                html = html & "</td>"
                html = html & "<td align='right' bgcolor='white' id='BasketRow'>"
                html = html & "   <p align='right'>"
                html = html & "        " & FormatNumber(payModeExpenses, 2) & "</p>"
                html = html & "</td>"
                html = html & "</tr>"
            End If
    
            'MINDESTBESTELLMENGE  
            'Wir bitten um Verständnis, dass wir auf Grund unserer äußerst knapp kalkulierten Preise Bestellungen unter € 20,- (ohne Versandkosten) nicht bearbeiten können!
            If CDbl(getMinOrderValue()) > CDbl(subtotalNoAddCharged) Then 'leider kauft der kunde zu wenig 
                Dim mindestBestellmengeArtNr : mindestBestellmengeArtNr = getMinOrderValue_charge_artnr()
                Dim bezMindestBestellMenge : bezMindestBestellMenge = tablevalue("grArtikel", "ArtNr", mindestBestellmengeArtNr, "Bezeichnung")
                Dim mindestBestellmenge_Preis_MWST : mindestBestellmenge_Preis_MWST = makeBruttoPreis2(getMinOrderValue_charge_artnr(), 1, Land)
                Subtotal = Subtotal + CDbl(getMinOrderValue_charge())
                SubtotalMWST = SubtotalMWST + CDbl(mindestBestellmenge_Preis_MWST)
                html = html & " <tr>"
                html = html & "<td colspan='4'>"
                html = html & "</td>"
                html = html & "<td colspan='2'>"
                '=getTranslation("Aufschlag wegen Mindestbestellmenge") & "
                html = html & "" & bezMindestBestellMenge & ""
                html = html & "(<b>" & getTranslation("Mindestwert ist ") & ""
                html = html & "    " & FormatNumber(getMinOrderValue(), 2) & "</b>)"
                html = html & "</td>"
                html = html & "<td>"
                html = html & "&nbsp;"
                html = html & "</td>"
                html = html & "<td align='right' height='17' bgcolor='white' id='BasketRow'>"
                html = html & "<p align='right'>"
                html = html & "   " & FormatNumber(getMinOrderValue_charge(), 2) & "</p>"
                html = html & "</td>"
                html = html & "</tr>"
            End If
            'END MINDESBESTELLMENGE & "
    
            'WARENKORB RABATT 

            If getBasketDiscount_artnr() <> -1 Then 'rabatt is möglich
                Dim rabattArtNr : rabattArtNr = getBasketDiscount_artnr()
                Dim rabattBez : rabattBez = tablevalue("grArtikel", "ArtNr", rabattArtNr, "Bezeichnung")
                Dim rabatt_MWST : rabatt_MWST = 0
                Dim rabatt_Value : rabatt_Value = -1 * getBasketDiscount_Value(Subtotal)
                Subtotal = Subtotal + rabatt_Value
                SubtotalMWST = SubtotalMWST + rabatt_Value
     
                html = html & "<tr>"
                html = html & "<td colspan='4'>"
                html = html & "</td>"
                html = html & "<td colspan='2'>"
                html = html & "" & rabattBez & ""
                html = html & "<!--(<b>" & getTranslation("Rabatt für Ihren Einkauf") & "&nbsp;" & FormatNumber(rabatt_Value, 2) & "</b>)-->"
                html = html & "</td>"
                html = html & "<td>"
                html = html & "    &nbsp;"
                html = html & "</td>"
                html = html & "<td align='right' height='17' bgcolor='white' id='BasketRow'>"
                html = html & " <p align='right'>  " & FormatNumber(rabatt_Value, 2) & "</p>"
                html = html & "</td>"
                html = html & "</tr>"
            End If
            'END WARENKORB RABATT  & "
            If gutscheinNummer <> "" Then
                html = html & "<tr>"
                html = html & "   <td colspan='4'>"
                html = html & "   &nbsp;"
                html = html & "</td>"
                html = html & " <td colspan='2'>"
                html = html & "    " & getTranslation("Gutschein") & ""
                html = html & "    (" & gutscheinNummer & ")</font>"
                html = html & "</td>"
                html = html & "<td align='right' bgcolor='white' id='BasketRow'>"
                html = html & "    <p align='right'>"
                html = html & "        " & FormatNumber(gutscheinSumme, 2) & "</p>"
                html = html & "</td>"
                html = html & "</tr>"
            End If
            html = html & "<tr height='25'>"
            html = html & "<td colspan='4' rowspan='2'>"
            If StepN = "3" Then 'show Notiz & "
                html = html & "" & getTranslation("Geben Sie Ihre Bemerkungen zu dieser Bestellung an (Farbe, Groesse, usw):") & ""
            End If
            html = html & " </td>"
            html = html & "<td colspan='2' rowspan='2'>"
            If StepN <> "3" Then 'show Notiz & "
                html = html & " <!--Notiz: -->"
                html = html & "" & Left(Session("Notiz"), 255) & ""
            Else
                html = html & " <textarea name='notiz' rows='2' cols='50' onkeypress='CheckNotizLength();' onchange='CheckNotizLength();'"
                html = html & "     id='Textarea1'>" & Session("notiz") & ""
                html = html & "</textarea>"
            End If
            html = html & "</td>"
            html = html & "<td align='right'>"
            html = html & "   <p align='right'>"
            html = html & "         <b>"
            html = html & "            " & getTranslation("Subtotal") & ":</b></p>"
            html = html & "</td>"
            html = html & "<td align='right' bgcolor='white' id='BasketRow'>"
            html = html & "    <p align='right'>"
            html = html & "        <b>"
            html = html & "            " & FormatNumber(Subtotal, 2) & "</b>"
            html = html & "</td>"
            html = html & "</tr>"
    
            'SET VARS IN CASE NOT YET SET
            If VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1") <> "true" Or VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1") <> "false" Then
                Call SETVARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1", "true")
            End If
    
            If VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2") <> "true" Or VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2") <> "false" Then
                Call SETVARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2", "true")
            End If
    
            If (VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1") = "true" And StepN = "1") _
            Or (VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2") = "true" And StepN = "2") _
            Or (StepN <> "1" And StepN <> "2") Then 'show TOTAL only when user already registered!
    
                Dim MWSTPercent : MWSTPercent = 0
                MWSTPercent = Math.Round(100 * (SubtotalMWST - Subtotal) / Subtotal, 0)
    
      
                html = html & "<tr>"
                html = html & "   <td align='right'>"
                html = html & "       <p align='right'>"
                html = html & "           <b>"
                html = html & "              " & getTranslation("Total") & ""
                html = html & "              (+"
                html = html & "       " & MWSTPercent & ""
                html = html & "        %"
                html = html & "        " & getTranslation("MWST") & "):</b></p>"
                html = html & "</td>"
                html = html & "<td align='right' bgcolor='white' id='BasketRow'>"
                html = html & "   <p align='right'>"
                html = html & "    <b>"
                html = html & "        " & FormatNumber(SubtotalMWST, 2) & "</b></p>"
                html = html & "</td>"
                html = html & " </tr>"
            Else 'add empty line & "
                html = html & "<tr>"
                html = html & "<td colspan='7'>  &nbsp;<tr>  </tr>"
            End If
            html = html & "</table>"

            html = html & "<script language='JavaScript'>"
            html = html & "    function CheckNotizLength() {"
            html = html & "        var note = document.warenkorbStep3.notiz.value;"
            html = html & "       if (note.length > 255) {"
            html = html & "           alert('" & getTranslation("Max 255 Zeichen erlaubt!") & "');"
            html = html & "       };"
            html = html & "   }; "
            html = html & "</" & "script>"

        End If
        
        Response.Write(html)
        
    End Function



    '****************************************************************************
    ' Show what is in WK
    '****************************************************************************
    Function visualizeWarenkorbSmall()
        Dim html As String
        Dim SID As String : sid = getSID()
 
        If InStr(LCase(pageToShow), "warenkorb") > 0 Then ' do not show 
            visualizeWarenkorbSmall = False
            Exit Function
        End If

        Dim paymode, postmode
        Dim destination


        paymode = Request("PayMode") : If paymode = "" Then paymode = "NACHNAHME"
        postmode = Request("postMode") : If postmode = "" Then postmode = "POST"
        destination = Request("destination") : If destination = "" Then destination = Session("LAND")
 
 
        Dim sql, rsWK

        sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, grArtikel.* " & _
           " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
           " Where SID=" & sid & " AND webWarenkorb.Quantity > 0 AND (AuftragNr is null or AuftragNr=0)"
        rsWK = objConnectionExecute(sql)
 
        If rsWK.EOF And rsWK.BOF Then ' empty basket
            Response.Write(getTranslation("Ihr Warenkorb ist noch leer."))
            visualizeWarenkorbSmall = False
        Else
            visualizeWarenkorbSmall = True

            Dim Pos As Double : Pos = 0
            Dim Subtotal As Double : Subtotal = 0
            Dim SubtotalMWST As Double : SubtotalMWST = 0
        
            Dim ArtNr
            Dim Stk As Double
            Dim Einzelpreis As Double
        
            While Not rsWK.EOF
                ArtNr = rsWK("ArtNR").Value
                pos = pos + 1
                stk = rsWK("Quantity").Value
                einzelpreis = makeNettoPreis(ArtNr, stk, sid)
            
                Subtotal = Subtotal + einzelpreis * stk
                'SubtotalMWST =  SubtotalMWST + makeBruttoPreis(rsWK("PreisATS"),rsWK("MWST"))  * rsWK("Quantity") 
                SubtotalMWST = SubtotalMWST + makeBruttoPreis2(rsWK("ArtNR").Value, Stk, Session("Land")) * Stk
            
                rsWK.MoveNext()
            End While
            rsWK.close()

            'POST and MODE COSTS 
            Dim KG As Double : KG = getWeightOfBasket(sid)
            Dim PostCosts As Double : PostCosts = 0
            Dim payModeExpenses As Double : payModeExpenses = 0
            Dim payModeExpensesMWST As Double : payModeExpensesMWST = 0
            Dim PostExpensesMWST As Double : PostExpensesMWST = 0
       
       
            If UCase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" Then
                PostCosts = calculatePostSpendsForWK(Land, KG, postmode)
                PostExpensesMWST = makeBruttoPreis2(getPostSpendsArtNr(Land, KG, postmode), 1, Session("Land"))
            End If
       
            If UCase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" Then
                If paymode <> "" Then payModeExpenses = calculatePaymentModeSpends(paymode, Land, KG, Subtotal)
                payModeExpensesMWST = makeBruttoPreis2(getPaymentModeSpendsArtNr(paymode, Land), 1, Session("Land"))
            End If
            'END POST AND MODE COSTS 
       
       
       
            Subtotal = Subtotal + payModeExpenses + PostCosts
            SubtotalMWST = SubtotalMWST + PostExpensesMWST + payModeExpensesMWST
       
  
            html = html & "<table border='1' cellspacing='0' id='Table3'>"
            html = html & " <tr>"
            html = html & " <th colspan='2'>"
            html = html & "     Lieferkalkulator"
            html = html & "  </th>"
            html = html & "</tr>"
      
            If VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" Then
     
                html = html & "<tr>"
                html = html & " <td>  Post Expenes (KG=" & KG & ")"
                
                html = html & "</td>"
                html = html & "<td align='right' height='17'>"
                html = html & "" & FormatNumber(PostCosts, 2) & ""
                html = html & "</td>"
                html = html & "</tr>"
            End If
            If VARVALUE(CALCULATE_PAYMODECOSTS) = "TRUE" Then
                html = html & "<tr>"
                html = html & " <td>"
                html = html & "  Payment Expenses (" & paymode & ")</font>"
                html = html & "</td>"
                html = html & "<td align='right'>"
                html = html & "" & FormatNumber(payModeExpenses, 2) & "&nbsp;"
                html = html & "</td>"
                html = html & "</tr>"
            End If
            html = html & "<tr>"
            html = html & " <td>"
            html = html & "   <b>Subtotal:</b>"
            html = html & "</td>"
            html = html & "<td>"
            html = html & "   <b>"
            html = html & "      <p align='right'>"
            html = html & "          " & FormatNumber(Subtotal, 2) & ""
            html = html & "  </b>"
            html = html & " </td>"
            html = html & " </tr>"
            html = html & " <tr>"
            html = html & "   <td>"
            html = html & "      <b>Total (+MWST):</b>"
            html = html & "  </td>"
            html = html & " <td align='right'>"
            html = html & "<p align='right'>"
            html = html & "   <b>"
            html = html & "       " & FormatNumber(SubtotalMWST, 2) & "</b></p>"
            html = html & "</td>"
            html = html & "</tr>"
            html = html & "<tr>"
            html = html & "<td colspan='2'>"
            html = html & makeLieferKalkulatorForm(paymode, postmode, destination) & "&nbsp;"
            html = html & " </td>"
            html = html & "</tr>"
            html = html & "</table>"
        End If
        
        Response.Write(html)
        
    End Function

    '==============================================================================
    ' Manipulation of Payment and Transport from Client
    '==============================================================================
    Function makeLieferKalkulatorForm(ByVal payMode, ByVal postMode, ByVal destination)
        Dim html As String
        Dim sql As String
        
        html = html & "<form action='default.aspx?pageToShow=warenkorbStep1' method='POST'>"
        html = html & "<!-- WARENKORB PAYMODE-->"
        html = html & "<p align='left'>"
        html = html & "" & getTranslation("Bestellung-/Zahlungsart") & ":"
    
        Dim rsZM, selected
            
        sql = "select methode, destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, destination order by methode"
        rsZM = objConnectionExecute(sql)
        While Not rsZM.EOF
            'show only PayMethods for the selected destination or general destinations 
            If UCase(Trim(rsZM("destination").Value)) = "" Or UCase(Trim(rsZM("destination").Value)) = UCase(Trim(destination)) Then
                If UCase(Trim(payMode)) = UCase(Trim(rsZM("methode").Value)) Then selected = "checked" Else selected = ""
                'Response.Write selected
   
                html = html & "<input type='radio' value='" & rsZM("methode").Value & "' name='PayMode' " & selected & " onclick='document.location='default.aspx?pageToShow=warenkorbStep1&paymode=" & rsZM("methode").Value & "&postmode=" & postMode & "';"
                html = html & "   id='Radio1'>"
                html = html & "" & rsZM("methode").Value & ""
    
            End If
            rsZM.MoveNext()
        End While
    
        html = html & "<!-- END WARENKORB PAYMODE-->"
        html = html & "<!-- WARENKORB POSTMODE-->"
        html = html & "<p align='left'>" & getTranslation("Transport") & ":"
        
        'dim rsZM, selected            
        sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
        rsZM = objConnectionExecute(sql)
        While Not rsZM.EOF
            If UCase(Trim(postMode)) = UCase(Trim(rsZM("methode").Value)) Then selected = "checked" Else selected = ""
            'Response.Write selected
         
            html = html & "<input type='radio' value='" & rsZM("methode").Value & "' name='PostMode' " & selected & " onclick='document.location='default.aspx?pageToShow=warenkorbStep1&paymode=" & payMode & "&postmode=" & rsZM("methode") & "';"
            html = html & "   id='Radio2'>"
            html = html & "" & rsZM("methode").Value & ""
        
            rsZM.MoveNext()
        End While
        
        html = html & "</p>"
        html = html & "<!-- END WARENKORB POSTMODE-->"
        html = html & "<!-- SELECT PLACE OF DELIVERY  -->"
        html = html & "<p align='left'>"
        html = html & "" & getTranslation("Destination der Lieferung") & ":"
        
        'dim rsZM, selected            
        sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by destination  order by destination"
        rsZM = objConnectionExecute(sql)
        While Not rsZM.EOF
            If UCase(Trim(destination)) = UCase(Trim(rsZM("destination").Value)) Then selected = "checked" Else selected = ""
            'Response.Write selected
          
            html = html & "<input type='radio' value='" & rsZM("destination").Value & "' name='destination' " & selected & ""
            html = html & "   onclick='document.location='default.aspx?pageToShow=warenkorbStep1&paymode=" & payMode & "&postmode=" & postMode & "&destination=" & rsZM("destination").Value & "';'"
            html = html & "   id='Radio3'>"
            html = html & "" & rsZM("destination").Value
        
            rsZM.MoveNext()
        End While
         
        html = html & "</p>"
        html = html & "<!-- SELECT PLACE OF DELIVERY  -->"
        html = html & "</form>"
        
        Response.Write(html)
        
    End Function
</script>

