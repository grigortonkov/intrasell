<%
 
    '*************************************************************************
    ' showOrder - General Function for Shopping Basket on the Administration Side
    '*************************************************************************
sub showOrder(OrderType, Nummer )
    Dim sql
    Dim TableVorgang, TableVorgangArtikel
    TableVorgang = getNameForTable(OrderType)
    TableVorgangArtikel = getNameForTableProducts(OrderType)

    sql = "SELECT *  FROM " & TableVorgang & _
       " Where Nummer=" & Nummer
    ' response.write sql
	 
    Dim rsV
    rsV = objConnectionExecute(sql)
    If rsV.EOF Then
%>
Sorry! The Order Type
<%=OrderType%>
#<%=Nummer%>
was not found!
<%
    Exit Sub
End If
%>
<form action="viewOrder.asp?nummer=<%=Nummer%>&OrderType=<%=OrderType%>&exec=Update"
method="post">
<h1>
    [<%=getTranslation(getNameFor(OrderType))%>]</h1>
<table border="1" width="800" cellspacing="0" bordercolor="#C0C0C0" id="Table1">
    <tr>
        <td width="220">
            <%=getTranslation("Datum")%>
            <input name="Datum" size="25" value="<%=rsV("Datum")%>" id="Text1">
        </td>
        <td width="566" colspan="2" align="center">
            <%=getTranslation("bezahlt")%><input type="checkbox" name="C1" value="ON" <%=SQLToCheck (rsV("Bezahlt"))%>
                id="Checkbox1">
            <%=getTranslation("Gedruckt")%><input type="checkbox" name="C2" value="ON" <%=SQLToCheck (rsV("Ausgedrukt"))%>
                id="Checkbox2">
            <%=getTranslation("Abgeschloßen")%><input type="checkbox" name="C3" value="ON" <%=SQLToCheck (rsV("anElba"))%>
                id="Checkbox3">
        </td>
    </tr>
    <tr>
        <td width="220">
            <%=getTranslation("Kunde")%>:
            <input type="hidden" name="IDNR" size="15" value="<%=rsV("KundNr")%>" id="Hidden1">
            <%=printAddress(rsV("KundNr"),OrderType,TRUE)%>
            <br>
            <%=getTranslation("aendern")%>:
            <%Call query2list("Select IdNR, '-', Name FROM ofAdressen Order BY IdNR, Name", "newIDNR")%>
        </td>
        <td width="262">
            &nbsp;
        </td>
        <td width="304">
            <%	Dim notiz : notiz = tablevalue(TableVorgang, "Nummer", Nummer, "Notiz")%>
            <%
                If notiz <> "" Then
            %>
            Notiz:
            <%
                Response.Write(notiz)
            End If
            %>
        </td>
    </tr>
</table>
<%
    rsV.close()
%>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
    bordercolor="#C0C0C0" width="800" id="AutoNumber1" height="38">
    <tr>
        <th width="35" height="20" align="center" nowrap>
            <%=getTranslation("Löschen")%>
        </th>
        <th width="35" height="20" align="center" nowrap>
            <%=getTranslation("Position")%>
        </th>
        <th width="50" height="20" align="center" nowrap>
            <%=getTranslation("ArtNR")%>
        </th>
        <th width="244" height="20" align="center" nowrap>
            <%=getTranslation("Bezeichnung")%>
        </th>
        <th width="44" height="20" align="center" nowrap>
            <%=getTranslation("Stk")%>
        </th>
        <th width="113" height="20" align="center" nowrap>
            <%=getTranslation("Preis")%>
        </th>
        <th width="113" height="20" align="center" nowrap>
            <%=getTranslation("Bruttopreis")%>
        </th>
    </tr>
    <%

        sql = "SELECT [" & TableVorgangArtikel & "].* " & _
           " FROM [" & TableVorgangArtikel & "] INNER JOIN grArtikel ON [" & TableVorgangArtikel & "].ArtNR = grArtikel.ArtNr" & _
           " Where RechNr=" & Nummer
	  
        'response.write sql
	  
        Dim rsWK
        rsWK = objConnectionExecute(sql)
        Dim pos : pos = 0
    %>
    <%
        Dim totalBrutto : totalBrutto = 0
        While Not rsWK.EOF
            pos = pos + 1
            totalBrutto = totalBrutto + CDbl(rsWK("PreisATS_Brutto"))
    %>
    <tr>
        <td height="17">
            <p align="center">
                <input name="art<%=Pos%>" type="hidden" value="<%=rsWK("ArtNR")%>" id="Hidden2">
                <input type="checkbox" name="checkD<%=pos%>" value="ON" onclick="return checkD<%=pos%>_onclick()"
                    id="Checkbox4">
        </td>
        <td height="17" align="center">
            <%=pos%>
        </td>
        <td height="17">
            <%If UCase(VARVALUE("BenutzeEAN")) = "TRUE" Then%>
            <%=rsWK("EAN")%>
            <%Else%>
            <%=rsWK("ArtNr")%>
            <%End If%>
        </td>
        <td height="17">
            <%=rsWK("Bezeichnung")%>
        </td>
        <td height="17" align="center">
            <input name="Stk<%=pos%>" size="4" value="<%=rsWK("Stk")%>" id="Text2">
        </td>
        <td height="17" align="right">
            <input name="PreisATS<%=Pos%>" size="15" value="<%=formatNumber(rsWK("PreisATS"),2)%>"
                id="Text3">
        </td>
        <td height="17" align="right">
            <input name="PreisATS_Brutto<%=Pos%>" size="15" value="<%=formatNumber(rsWK("PreisATS_Brutto"),2)%>"
                id="Text4">
        </td>
    </tr>
    <%   
        rsWK.MoveNext()
    End While
    rsWK.close()
    %>
    <tr>
        <td height="17" colspan="5">
        </td>
        <td height="17">
            <hr>
            Total:
        </td>
        <td height="17" align="right">
            <hr>
            <%=totalBrutto%>
        </td>
    </tr>
    <tr>
        <th colspan="6">
            <input type="hidden" name="Items" size="9" value="<%=pos%>" id="Hidden3">
        </th>
    </tr>
    <tr>
        <th colspan="3" align="right">
            <%=getTranslation("Produkt")%>&nbsp;<%=getTranslation("einfügen")%>
            #
        </th>
        <td colspan="3">
            <%
                Dim rsCheck
                rsCheck = objConnectionExecute("Select count(*) as cc from grArtikel")
                If CDbl(rsCheck("cc")) < 500 Then
            %>
            <%Call query2list("Select ArtNR,'-',Bezeichnung from grArtikel Order BY ArtNr", "AddNew")%>
            <%Else%>
            or type the #
            <input class="button" name="addNew" value="" size="10" id="Text5">
            <%  End If
                rsCheck.close()
                rsCheck = Nothing%>
        </td>
    </tr>
    <tr>
        <td colspan="6" align="center">
            <p align="left">
                <input type="submit" class="button" value="<%=getTranslation("aktualisieren")%>"></p>
        </td>
    </tr>
</table>
</form>
<%
End Sub
%>
<%
    '****************************************************************************
    ' Description: shows content of the shopping basket
    ' Show what is in WK
    ' 
    ' Modifications: 22-01.2005 
    '
    '****************************************************************************
    Function visualizeWarenkorb(ByVal StepN, ByVal Land, ByVal PayMode, ByVal PostMode, ByVal PostModeDestination)
        Dim sql, rsWK
        Dim gutscheinNummer : gutscheinNummer = Session("GutscheinNummer")
        Dim sid : sid = getSID()
        sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, webWarenkorb.Notiz, grArtikel.* " & _
           " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
           " Where SID=" & sid & " AND webWarenkorb.Quantity > 0  AND (AuftragNr is null or AuftragNr=0)"
        rsWK = objConnectionExecute(sql)

        If rsWK.EOF And rsWK.BOF Then ' empty basket%>
<h3>
    <font color="red" class="error">
        <%=getTranslation("Ihr Warenkorb ist leer!")%></font></h3>
<% 
    visualizeWarenkorb = False
Else
    visualizeWarenkorb = True
%>
<%  If getFreiHausLieferungUmsatz() > 0 Then%>
<h2>
    <%=getTranslation("Frei Haus Lieferung ab:")%>
    <%=formatNumber(getFreiHausLieferungUmsatz(),2)%></h2>
<%  End If%>
<table border="1" cellpadding="2" cellspacing="0" width="100%" style="border-collapse: collapse"
    bordercolor="#C0C0C0" bgcolor="#F3F3F3" id="BasketTable">
    <tr>
        <th width="58" align="center">
            <%=getTranslation("Position")%>
        </th>
        <th width="71" align="center">
            <%=getTranslation("Anzahl")%>
        </th>
        <th width="71" align="center">
            <%=getTranslation("ArtNR")%>
        </th>
        <th width="71" align="center">
            <%=getTranslation("EAN")%>
        </th>
        <th width="322" align="center">
            <%=getTranslation("Bezeichnung")%>
        </th>
        <th width="50" align="center">
            <%=getTranslation("Lieferung")%>
        </th>
        <th width="100" align="center">
            <%=getTranslation("Preis")%>
        </th>
        <th width="100" align="center">
            <%=getTranslation("Total")%>
        </th>
    </tr>
    <tr>
        <td colspan="8">
            &nbsp;
        </td>
    </tr>
    <%
        Dim pos : pos = 0
        Dim Subtotal : Subtotal = 0
        Dim SubtotalMWST : SubtotalMWST = 0
        While Not rsWK.EOF
		
            pos = pos + 1
            Dim ArtNr : ArtNr = rsWK("ArtNR")
            Dim Stk : Stk = CInt(rsWK("Quantity"))
            Dim Einzelpreis
            'Einzelpreis = makeNettoPreis(ArtNR, Stk, sid) 'old way to calculate prices
            Einzelpreis = getPreis(getLOGIN(), ArtNr, Stk)
			
			
            'call Response.Write ("Stk:[" &  stk & "]")
            'call Response.Write ("Einzelpreis:[" & einzelpreis & "]")
			
            Subtotal = CDbl(Subtotal) + CDbl(Einzelpreis) * CInt(Stk)
            'SubtotalMWST = cdbl(SubtotalMWST) + cdbl(makeBruttoPreis2(ArtNr, Stk, Land)) * Stk 'Old Way 
            Dim IDNR : IDNR = getLOGIN()
            If IDNR & "" = "" Then 'der user ist noch nicht angemeldet 
                IDNR = 0
            End If
            SubtotalMWST = CDbl(SubtotalMWST) + CDbl(calculateBruttoPreis(Einzelpreis, ArtNr, IDNR)) * Stk
            'Response.Write "SubtotalMWST = " & SubtotalMWST
    %>
    <tr bgcolor="white" id="BasketRow">
        <td width="58" height="17">
            <p align="center">
                <%=pos%>
        </td>
        <td align="center" height="17">
            <input type="hidden" name="Art<%=pos%>" size="9" value="<%=rsWK("ArtNr")%>" id="Hidden4" />
            <%If StepN = "1" Then%>
            <a href="default.aspx?pagetoShow=warenkorbStep1&Items=1&Art1=<%=rsWK("ArtNr")%>&checkD1=ON">
                <img src="<%=imageFullName("delete.gif")%>" alt="delete this position" border="0"
                    align="middle"></a>
            <!--
		 <input type="checkbox" name="checkD<%=pos%>" value="ON">
		  -->
            <input name="Stk<%=pos%>" size="3" value="<%=rsWK("Quantity")%>" id="Text6" />
            <%Else%>
            <%=rsWK("Quantity")%>
            <%End If%>
        </td>
        <td height="17">
            <a href="default.aspx?ArtNR=<%=rsWK("ArtNR")%>" target="_new">
                <%=rsWK("ArtNR")%></a>
        </td>
        <td height="17">
            <%=rsWK("EAN")%>
        </td>
        <td height="17">
            <a href="default.aspx?ArtNR=<%=rsWK("ArtNR")%>" target="_new">
                <%=getTranslationDok("grArtikel" , rsWK("ArtNR"), "Bezeichnung", rsWK("Bezeichnung") & "", Language)%></a>&nbsp;<b><%=rsWK("Notiz")%></b>
        </td>
        <td height="17">
            <a href="default.aspx?ArtNR=<%=rsWK("ArtNR")%>" target="_new">
                <%=rsWK("Bezeichnung1")%></a>
        </td>
        <td align="right" height="17">
            <p align="right">
                <%=FormatNumber(cdbl(einzelpreis),2)%></p>
        </td>
        <td align="right" height="17">
            <p align="right">
                <%=FormatNumber(cdbl(einzelpreis)*cint(stk),2)%></p>
        </td>
    </tr>
    <%   
		
        rsWK.MoveNext()
    End While
    rsWK.close()
		
    Dim subtotalNoAddCharged : subtotalNoAddCharged = Subtotal
    %>
    <input type="hidden" name="Items" value="<%=pos%>" id="Hidden5">
    <%  'POST and MODE COSTS 
        Dim KG : KG = getWeightOfBasket(sid)
        Dim PostCosts : PostCosts = 0
        Dim PostExpensesMWST : PostExpensesMWST = 0
 	  
        Dim payModeExpenses : payModeExpenses = 0
        Dim payModeExpensesMWST : payModeExpensesMWST = 0
 	  
        Dim gutscheinSumme : gutscheinSumme = 0
        Dim gutscheinSummeMWST : gutscheinSummeMWST = 0
 	 
 	  	  
        Dim messageNoCosts : messageNoCosts = ""
 	  
        'Response.Write "calculateWarenkorbSum()=" & calculateWarenkorbSum()
        'if (1*calculateWarenkorbSum() < 1*getFreiHausLieferungUmsatz()) or getFreiHausLieferungUmsatz()=-1 then  'CALCULATE COSTS 
        If (1 * Subtotal < 1 * getFreiHausLieferungUmsatz()) Or getFreiHausLieferungUmsatz() = -1 Then  'CALCULATE COSTS 
            If UCase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" Then
                Dim postSpendsArtNr : postSpendsArtNr = getPostSpendsArtNr(Land, KG, PostMode)
                PostCosts = calculatePostSpends(PostModeDestination, KG, PostMode)
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
            messageNoCosts = "<br><font color=""red"" class=""error"">Yeeep: Es werden keine Transport- und Zahlungskosten kalkuliert!</font>"
        End If
 	  
 	  
        If gutscheinNummer <> "" Then
            gutscheinSumme = getPreisForGutschein(gutscheinNummer)
            gutscheinSummeMWST = makeBruttoPreis(gutscheinSumme, 2, Land)
        End If
 	  
 	  
        Subtotal = Subtotal + payModeExpenses + PostCosts - gutscheinSumme
        SubtotalMWST = SubtotalMWST + PostExpensesMWST + payModeExpensesMWST - gutscheinSummeMWST
    %>
    <%If UCase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" Then%>
    <tr>
        <td colspan="4">
        </td>
        <td colspan="2">
            <%=getTranslation("Transportkosten")%>
            (<%=getTranslation("Dienst")%>: <b>
                <%=postMode%></b>), (KG=<b><%=KG%></b>), (<%=getTranslation("Ziel")%>=<b><%=PostModeDestination%></b>)
            <%=messageNoCosts%>
        </td>
        <td>
            &nbsp;
        </td>
        <td align="right" height="17" bgcolor="white" id="BasketRow">
            <p align="right">
                <%=FormatNumber(PostCosts ,2)%></p>
        </td>
    </tr>
    <%End If%>
    <%If UCase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" Then%>
    <tr>
        <td colspan="4">
        </td>
        <td colspan="2">
            <%=getTranslation("Zahlungskosten")%>
            (<b><%=PayMode%></b>)</font>
        </td>
        <td>
            &nbsp;
        </td>
        <td align="right" bgcolor="white" id="BasketRow">
            <p align="right">
                <%=FormatNumber( payModeExpenses,2)%></p>
        </td>
    </tr>
    <%End If%>
    <%
        'MINDESTBESTELLMENGE  
        'Wir bitten um Verständnis, dass wir auf Grund unserer äußerst knapp kalkulierten Preise Bestellungen unter € 20,- (ohne Versandkosten) nicht bearbeiten können!
        If CDbl(getMinOrderValue()) > CDbl(subtotalNoAddCharged) Then 'leider kauft der kunde zu wenig 
            Dim mindestBestellmengeArtNr : mindestBestellmengeArtNr = getMinOrderValue_charge_artnr()
            Dim bezMindestBestellMenge : bezMindestBestellMenge = tablevalue("grArtikel", "ArtNr", mindestBestellmengeArtNr, "Bezeichnung")
            Dim mindestBestellmenge_Preis_MWST : mindestBestellmenge_Preis_MWST = makeBruttoPreis2(getMinOrderValue_charge_artnr(), 1, Land)
            Subtotal = Subtotal + CDbl(getMinOrderValue_charge())
            SubtotalMWST = SubtotalMWST + CDbl(mindestBestellmenge_Preis_MWST)
    %>
    <tr>
        <td colspan="4">
        </td>
        <td colspan="2">
            <%'=getTranslation("Aufschlag wegen Mindestbestellmenge")%>
            <%=bezMindestBestellMenge%>
            (<b><%=getTranslation("Mindestwert ist ")%>
                <%=formatNumber(getMinOrderValue(),2)%></b>)
        </td>
        <td>
            &nbsp;
        </td>
        <td align="right" height="17" bgcolor="white" id="BasketRow">
            <p align="right">
                <%=FormatNumber(getMinOrderValue_charge(),2)%></p>
        </td>
    </tr>
    <%  End If
        'END MINDESBESTELLMENGE%>
    <%
        'WARENKORB RABATT 

        If getBasketDiscount_artnr() <> -1 Then 'rabatt is möglich
            Dim rabattArtNr : rabattArtNr = getBasketDiscount_artnr()
            Dim rabattBez : rabattBez = tablevalue("grArtikel", "ArtNr", rabattArtNr, "Bezeichnung")
            Dim rabatt_MWST : rabatt_MWST = 0
            Dim rabatt_Value : rabatt_Value = -1 * getBasketDiscount_Value(Subtotal)
            Subtotal = Subtotal + rabatt_Value
            SubtotalMWST = SubtotalMWST + rabatt_Value
    %>
    <tr>
        <td colspan="4">
        </td>
        <td colspan="2">
            <%=rabattBez%>
            <!--(<b><%=getTranslation("Rabatt für Ihren Einkauf")%>&nbsp;<%=formatNumber(rabatt_Value,2)%></b>)-->
        </td>
        <td>
            &nbsp;
        </td>
        <td align="right" height="17" bgcolor="white" id="BasketRow">
            <p align="right">
                <%=FormatNumber(rabatt_Value,2)%></p>
        </td>
    </tr>
    <%  End If
        'END WARENKORB RABATT %>
    <%If gutscheinNummer <> "" Then%>
    <tr>
        <td colspan="4">
            &nbsp;
        </td>
        <td colspan="2">
            <%=getTranslation("Gutschein")%>
            (<%=gutscheinNummer%>)</font>
        </td>
        <td align="right" bgcolor="white" id="BasketRow">
            <p align="right">
                <%=FormatNumber(gutscheinSumme,2)%></p>
        </td>
    </tr>
    <%End If%>
    <tr height="25">
        <td colspan="4" rowspan="2">
            <%If StepN = "3" Then 'show Notiz%>
            <%=getTranslation("Geben Sie Ihre Bemerkungen zu dieser Bestellung an (Farbe, Groesse, usw):")%>
            <%End If%>
        </td>
        <td colspan="2" rowspan="2">
            <%If StepN <> "3" Then 'show Notiz%>
            <!--Notiz: -->
            <%=left(Session("Notiz"),255)%>
            <%Else%>
            <textarea name="notiz" rows="2" cols="50" onkeypress="CheckNotizLength();" onchange="CheckNotizLength();"
                id="Textarea1"><%=Session("notiz")%>
		</textarea>
            <%End If%>
        </td>
        <td align="right">
            <p align="right">
                <b>
                    <%=getTranslation("Subtotal")%>:</b></p>
        </td>
        <td align="right" bgcolor="white" id="BasketRow">
            <p align="right">
                <b>
                    <%=FormatNumber(Subtotal, 2 )%></b>
        </td>
    </tr>
    <%
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
	
    %>
    <tr>
        <td align="right">
            <p align="right">
                <b>
                    <%=getTranslation("Total")%>
                    (+
                    <%=MWSTPercent%>
                    %
                    <%=getTranslation("MWST")%>):</b></p>
        </td>
        <td align="right" bgcolor="white" id="BasketRow">
            <p align="right">
                <b>
                    <%=FormatNumber(SubtotalMWST, 2 )%></b></p>
        </td>
    </tr>
    <%Else 'add empty line%>
    <tr>
        <td colspan="7">
            &nbsp;<tr>
            </tr>
            <%End If%>
</table>

<script language="JavaScript">
    function CheckNotizLength() {
        var note = document.warenkorbStep3.notiz.value;
        if (note.length > 255) {
            alert('<%=getTranslation("Max 255 Zeichen erlaubt!")%>');
        };
    }; 
</script>

<%  End If%>
<%  End Function%>
<%


    '****************************************************************************
    ' Show what is in WK
    '****************************************************************************
    Function visualizeWarenkorbSmall()
        Dim sid : sid = getSID()
 
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

            Dim pos : pos = 0
            Dim Subtotal : Subtotal = 0
            Dim SubtotalMWST : SubtotalMWST = 0
		
            Dim ArtNr
            Dim stk
            Dim einzelpreis
		
            While Not rsWK.EOF
                ArtNr = rsWK("ArtNR")
                pos = pos + 1
                stk = rsWK("Quantity")
                einzelpreis = makeNettoPreis(ArtNr, stk, sid)
			
                Subtotal = Subtotal + einzelpreis * stk
                'SubtotalMWST =  SubtotalMWST + makeBruttoPreis(rsWK("PreisATS"),rsWK("MWST"))  * rsWK("Quantity") 
                SubtotalMWST = SubtotalMWST + makeBruttoPreis2(rsWK("ArtNR"), stk, Session("Land")) * stk
	        
                rsWK.MoveNext()
            End While
            rsWK.close()

            'POST and MODE COSTS 
            Dim KG : KG = getWeightOfBasket(sid)
            Dim PostCosts : PostCosts = 0
            Dim payModeExpenses : payModeExpenses = 0
            Dim payModeExpensesMWST : payModeExpensesMWST = 0
            Dim PostExpensesMWST : PostExpensesMWST = 0
 	  
 	  
            If VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" Then
                PostCosts = calculatePostSpends(Land, KG, postmode)
                PostExpensesMWST = makeBruttoPreis2(getPostSpendsArtNr(Land, KG, postmode), 1, Session("Land"))
            End If
 	  
            If VARVALUE(CALCULATE_PAYMODECOSTS) = "TRUE" Then
                If paymode <> "" Then payModeExpenses = calculatePaymentModeSpends(paymode, Land, KG, Subtotal)
                payModeExpensesMWST = makeBruttoPreis2(getPaymentModeSpendsArtNr(paymode, Land), 1, Session("Land"))
            End If
            'END POST AND MODE COSTS 
 	  
 	  
 	  
            Subtotal = Subtotal + payModeExpenses + PostCosts
            SubtotalMWST = SubtotalMWST + PostExpensesMWST + payModeExpensesMWST
 	  
%>
<table border="1" cellspacing="0" id="Table3">
    <tr>
        <th colspan="2">
            Lieferkalkulator
        </th>
    </tr>
    <%  
        If VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" Then
    %>
    <tr>
        <td>
            Post Expenes (KG=<%=KG%>)
        </td>
        <td align="right" height="17">
            <%=FormatNumber( PostCosts ,2)%>
        </td>
    </tr>
    <%End If%>
    <%If VARVALUE(CALCULATE_PAYMODECOSTS) = "TRUE" Then%>
    <tr>
        <td>
            Payment Expenses (<%=PayMode%>)</font>
        </td>
        <td align="right">
            <%=FormatNumber( payModeExpenses,2)%>&nbsp;
        </td>
    </tr>
    <%End If%>
    <tr>
        <td>
            <b>Subtotal:</b>
        </td>
        <td>
            <b>
                <p align="right">
                    <%=FormatNumber(Subtotal, 2 )%>
            </b>
        </td>
    </tr>
    <tr>
        <td>
            <b>Total (+MWST):</b>
        </td>
        <td align="right">
            <p align="right">
                <b>
                    <%=FormatNumber(SubtotalMWST, 2 )%></b></p>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <% Call makeLieferKalkulatorForm(paymode, postmode, destination)%>&nbsp;
        </td>
    </tr>
</table>
<%  End If
End Function%>
<%
    '==============================================================================
    ' Manipulation of Payment and Transport from Client
    '==============================================================================
    Function makeLieferKalkulatorForm(ByVal payMode, ByVal postMode, ByVal destination)
%>
<form action="default.aspx?pageToShow=warenkorbStep1" method="POST">
<!-- WARENKORB PAYMODE-->
<p align="left">
    <%=getTranslation("Bestellung-/Zahlungsart")%>:
    <%
        Dim rsZM, selected
            
        sql = "select methode, destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, destination order by methode"
        rsZM = objConnectionExecute(sql)
        While Not rsZM.EOF
            'show only PayMethods for the selected destination or general destinations 
            If UCase(Trim(rsZM("destination"))) = "" Or UCase(Trim(rsZM("destination"))) = UCase(Trim(destination)) Then
                If UCase(Trim(payMode)) = UCase(Trim(rsZM("methode"))) Then selected = "checked" Else selected = ""
                'Response.Write selected
    %>
    <input type="radio" value="<%=rsZM("methode")%>" name="PayMode" <%=selected%> onclick="document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=rsZM("methode")%>&postmode=<%=postmode%>';"
        id="Radio1">
    <%=rsZM("methode")%>
    <%
    End If
    rsZM.MoveNExt()
End While
    %>
    <!-- END WARENKORB PAYMODE-->
    <!-- WARENKORB POSTMODE-->
    <p align="left">
        <%=getTranslation("Transport")%>:
        <%
            'dim rsZM, selected            
            sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
            rsZM = objConnectionExecute(sql)
            While Not rsZM.EOF
                If UCase(Trim(postMode)) = UCase(Trim(rsZM("methode"))) Then selected = "checked" Else selected = ""
                'Response.Write selected
        %>
        <input type="radio" value="<%=rsZM("methode")%>" name="PostMode" <%=selected%> onclick="document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=rsZM("methode")%>';"
            id="Radio2">
        <%=rsZM("methode")%>
        <%
            rsZM.MoveNExt()
        End While
        %></p>
    <!-- END WARENKORB POSTMODE-->
    <!-- SELECT PLACE OF DELIVERY  -->
    <p align="left">
        <%=getTranslation("Destination der Lieferung")%>:
        <%
            'dim rsZM, selected            
            sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by destination  order by destination"
            rsZM = objConnectionExecute(sql)
            While Not rsZM.EOF
                If UCase(Trim(destination)) = UCase(Trim(rsZM("destination"))) Then selected = "checked" Else selected = ""
                'Response.Write selected
        %>
        <input type="radio" value="<%=rsZM("destination")%>" name="destination" <%=selected%>
            onclick="document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination=<%=rsZM("destination")%>';"
            id="Radio3">
        <%=rsZM("destination")%>
        <%
            rsZM.MoveNExt()
        End While
        %>
    </p>
    <!-- SELECT PLACE OF DELIVERY  -->
</form>
<%  End Function%>
