
<%
 
'*************************************************************************
' showOrder - General Function for Shopping Basket on the Administration Side
'*************************************************************************
sub showOrder(OrderType, Nummer )
 Dim sql
	Dim TableVorgang, TableVorgangArtikel 
	TableVorgang = getNameForTable(OrderType)
	TableVorgangArtikel = getNameForTableProducts(OrderType)

	sql = "SELECT *  FROM "	 & TableVorgang & _ 
		  " Where Nummer=" & Nummer	  
' response.write sql
	 
dim rsV
set rsV = objConnectionExecute(sql)
if rsV.EOF then 
  %>
  Sorry! The Order Type <%=OrderType%> #<%=Nummer%> was not found!
  <%
  exit sub 
end if 
%>
<form action="viewOrder.asp?nummer=<%=Nummer%>&OrderType=<%=OrderType%>&exec=Update" method=post>
<h1>[<%=getTranslation(getNameFor(OrderType))%>]</h1>
<table border="1" width="800" cellspacing="0" bordercolor="#C0C0C0" ID="Table1">
  <tr>
    <td width="220"><%=getTranslation("Datum")%> 
      <input name="Datum" size="25" value="<%=rsV("Datum")%>" ID="Text1"></td>
    <td width="566" colspan="2" align="center">
      <%=getTranslation("bezahlt")%><input type="checkbox" name="C1" value="ON" <%=SQLToCheck (rsV("Bezahlt"))%> ID="Checkbox1">
      <%=getTranslation("Gedruckt")%><input type="checkbox" name="C2" value="ON" <%=SQLToCheck (rsV("Ausgedrukt"))%> ID="Checkbox2"> 
      <%=getTranslation("Abgeschloßen")%><input type="checkbox" name="C3" value="ON" <%=SQLToCheck (rsV("anElba"))%> ID="Checkbox3"></td>
  </tr>
  <tr>
    <td width="220"><%=getTranslation("Kunde")%>: <input type="hidden" name="IDNR" size="15" value="<%=rsV("KundNr")%>" ID="Hidden1">
    <%=printAddress(rsV("KundNr"),OrderType,TRUE)%> 
    <BR>
   <%=getTranslation("aendern")%>: <%call query2list("Select IdNR, '-', Name FROM ofAdressen Order BY IdNR, Name","newIDNR")%>
    </td>
    <td width="262">&nbsp;</td>
	<td width="304">
	
	<%	Dim notiz: notiz = tablevalue(TableVorgang,"Nummer", Nummer, "Notiz")%>
	<%
	if Notiz <> "" then 
	%>
	Notiz:
	<%
	response.write notiz
	end if
	%>
	</td>
  </tr>
</table>
<%
rsV.close
%>
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#C0C0C0" width="800" id="AutoNumber1" height="38">
    <tr>
      <th width="35" height="20" align="center" nowrap><%=getTranslation("Löschen")%></th>
      <th width="35" height="20" align="center" nowrap><%=getTranslation("Position")%></th>
      <th width="50" height="20" align="center" nowrap><%=getTranslation("ArtNR")%></th>
      <th width="244" height="20" align="center" nowrap><%=getTranslation("Bezeichnung")%></th>
      <th width="44" height="20" align="center" nowrap><%=getTranslation("Stk")%></th>
      <th width="113" height="20" align="center" nowrap><%=getTranslation("Preis")%></th>
      <th width="113" height="20" align="center" nowrap><%=getTranslation("Bruttopreis")%></th>
    </tr>

<%

sql = "SELECT [" & TableVorgangArtikel & "].* " & _ 
	  " FROM [" & TableVorgangArtikel & "] INNER JOIN grArtikel ON [" & TableVorgangArtikel & "].ArtNR = grArtikel.ArtNr" & _
	  " Where RechNr=" & Nummer
	  
'response.write sql
	  
dim rsWK
set rsWK = objConnectionExecute(sql)
Dim pos : pos = 0
%>
<%
Dim totalBrutto : totalBrutto = 0
 while not rsWK.EOF 
 pos = pos + 1 
 
 totalBrutto = totalBrutto + cdbl(rsWK("PreisATS_Brutto"))
%>
    <tr>
      <td height="17">
      <p align="center">
      <input name="art<%=Pos%>" type="hidden" value="<%=rsWK("ArtNR")%>" ID="Hidden2">
      <input type="checkbox" name="checkD<%=pos%>" value="ON" onclick="return checkD<%=pos%>_onclick()" ID="Checkbox4"></td>
      <td height="17" align="center">
      <%=pos%></td>
      <td height="17"><%=rsWK("ArtNr")%></td>
      <td height="17"><%=rsWK("Bezeichnung")%></td>
      <td height="17" align="center">
      <input name="Stk<%=pos%>" size="4" value="<%=rsWK("Stk")%>" ID="Text2">
      </td>
      <td height="17" align="right">
      <input name="PreisATS<%=Pos%>" size="15" value="<%=formatNumber(rsWK("PreisATS"),2)%>" ID="Text3">
      </td>
      <td height="17" align="right">
      <input name="PreisATS_Brutto<%=Pos%>" size="15" value="<%=formatNumber(rsWK("PreisATS_Brutto"),2)%>" ID="Text4">
      </td>
    </tr>
   <%   
   rsWK.MoveNext 
   WEND
   rsWK.close 
   %>   
      <tr>
      <td height="17" colspan=5>
      </td>
      <td height="17"><hr>Total:
      </td>
      <td height="17" align="right"><hr>
      <%=totalBrutto%>
      </td>
    </tr>
   
	<tr>
	<th colspan=6>
	<input type=hidden  name="Items" size="9" value="<%=pos%>" ID="Hidden3"></th>
	</tr>
	<tr>
	<th colspan=3 align=right><%=getTranslation("Produkt")%>&nbsp;<%=getTranslation("einfügen")%> #</th>
	<td colspan=3 >	
	<%
	dim rsCheck
	set rsCheck = objConnectionExecute("Select count(*) as cc from grArtikel") 
	if cdbl(rsCheck("cc")) < 500 then 
	%>
	<%call query2list("Select ArtNR,'-',Bezeichnung from grArtikel Order BY ArtNr","AddNew")%>
	<%else%> or type the # <input class="button" name="addNew" value "" size ="10" ID="Text5">
	<%end if
	rscheck.close
	set rsCheck = nothing%>
	</td>
	</tr>
	<tr>	
	<td colspan=6 align=center>
      <p align="left"><input type="submit"  class="button" value="<%=getTranslation("aktualisieren")%>"></p>
    </td>
	</tr>
</table>
</form>
<%
end sub
%>

<%
'****************************************************************************
' Description: shows content of the shopping basket
' Show what is in WK
' 
' Modifications: 22-01.2005 
'
'****************************************************************************
function visualizeWarenkorb(StepN, Land, PayMode, PostMode, PostModeDestination) 
 Dim sql, rsWK
 dim gutscheinNummer: gutscheinNummer = Session("GutscheinNummer")
 Dim sid: sid = getSID()
	sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, webWarenkorb.Notiz, grArtikel.* " & _ 
		  " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
		  " Where SID=" & sid & " AND webWarenkorb.Quantity > 0  AND (AuftragNr is null or AuftragNr=0)"
	set rsWK = objConnectionExecute(sql)

	if rsWK.EOF and rsWK.BOF then ' empty basket%>
		<h3><font color="red" class="error"><%=getTranslation("Ihr Warenkorb ist leer!")%></font></h3>
	<% 
		visualizeWarenkorb = False
		else	
		visualizeWarenkorb = True
		%>

  <%if getFreiHausLieferungUmsatz()> 0 then %>
  <h2><%=getTranslation("Frei Haus Lieferung ab:")%> <%=formatNumber(getFreiHausLieferungUmsatz(),2)%></h2>
  <%end if %>
   <table border="1" cellpadding="2" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#C0C0C0" bgcolor="#F3F3F3" ID="BasketTable">
    <tr>
      <th width="58" align="center"><%=getTranslation("Position")%></th>
      <th width="71" align="center"><%=getTranslation("Anzahl")%></th>
      <th width="71" align="center"><%=getTranslation("ArtNR")%></th>
      <th width="71" align="center"><%=getTranslation("EAN")%></th>
      <th width="322" align="center"><%=getTranslation("Bezeichnung")%></th>
      <th width="50"  align="center"><%=getTranslation("Lieferung")%></th>      
      <th width="100" align="center"><%=getTranslation("Preis")%></th>
      <th width="100" align="center"><%=getTranslation("Total")%></th>
    </tr>	
    <tr>
      <td colspan=8>&nbsp;</td>
    </tr>	
      		
		<%
		Dim pos: pos = 0		
		Dim Subtotal : Subtotal = 0
		Dim SubtotalMWST : SubtotalMWST = 0
		while not rsWK.EOF 
		
			pos = pos + 1 
			Dim ArtNr: ArtNR = rsWK("ArtNR")			
			Dim Stk: Stk = cint(rsWK("Quantity"))
			Dim Einzelpreis
		    'Einzelpreis = makeNettoPreis(ArtNR, Stk, sid) 'old way to calculate prices
			Einzelpreis = getPreis(getLOGIN(), ArtNr, Stk)
			
			
			'call Response.Write ("Stk:[" &  stk & "]")
			'call Response.Write ("Einzelpreis:[" & einzelpreis & "]")
			
		    Subtotal = cdbl(Subtotal) + cdbl(Einzelpreis) * cint(stk)
		    'SubtotalMWST = cdbl(SubtotalMWST) + cdbl(makeBruttoPreis2(ArtNr, Stk, Land)) * Stk 'Old Way 
		    dim IDNR: IDNR = getLOGIN()
		    if IDNR  & "" ="" then 'der user ist noch nicht angemeldet 
		       IDNR = 0
		    end if 
		    SubtotalMWST = cdbl(SubtotalMWST) + cdbl(calculateBruttoPreis(Einzelpreis, ArtNr, IDNR)) * Stk
		%>
	    <tr bgcolor="white" ID="BasketRow">
	      <td width="58" height="17"><p align="center"><%=pos%></td>	      
	      <td align="center" height="17" >
		  <input type=hidden  name="Art<%=pos%>" size="9" value="<%=rsWK("ArtNr")%>" ID="Hidden4"/>
	      <%if StepN="1" then %>
	      <a href="default.asp?pagetoShow=warenkorbStep1&Items=1&Art1=<%=rsWK("ArtNr")%>&checkD1=ON"><img src="<%=imageFullName("delete.gif")%>" alt="delete this position" border="0" align="middle"></a>
		  <!--
		 <input type="checkbox" name="checkD<%=pos%>" value="ON">
		  -->
	      <input name="Stk<%=pos%>" size="3" value="<%=rsWK("Quantity")%>" ID="Text6"/>
	      <%else%>
	      <%=rsWK("Quantity")%>
	      <%end if%>
	      </td>
	      <td height="17"><a href="default.asp?ArtNR=<%=rsWK("ArtNR")%>" target=_new><%=rsWK("ArtNR")%></a></td>
	      <td height="17"><%=rsWK("EAN")%></td>
	      <td height="17"><a href="default.asp?ArtNR=<%=rsWK("ArtNR")%>" target=_new><%=getTranslationDok("grArtikel" , rsWK("ArtNR"), "Bezeichnung", rsWK("Bezeichnung") & "", Language)%></a>&nbsp;<b><%=rsWK("Notiz")%></b></td>
	      <td height="17"><a href="default.asp?ArtNR=<%=rsWK("ArtNR")%>" target=_new><%=rsWK("Bezeichnung1")%></a></td>	      
	      <td align="right" height="17"> <p align="right"><%=FormatNumber(cdbl(einzelpreis),2)%></p></td>
	      <td align="right" height="17"> <p align="right"><%=FormatNumber(cdbl(einzelpreis)*cint(stk),2)%></p></td>	      
	    </tr>
		<%   
		
		rsWK.MoveNext 
		WEND
		rsWK.close 
		
		dim subtotalNoAddCharged: subtotalNoAddCharged = subtotal
     %>
     <input type=hidden  name="Items" value="<%=pos%>" ID="Hidden5">
     <% 'POST and MODE COSTS 
      Dim KG: KG = getWeightOfBasket(SID)
 	  Dim PostCosts :  PostCosts = 0
 	  Dim PostExpensesMWST : PostExpensesMWST =0
 	  
 	  Dim payModeExpenses : payModeExpenses = 0
 	  Dim payModeExpensesMWST : payModeExpensesMWST =0
 	  
 	  Dim gutscheinSumme : gutscheinSumme=0
 	  Dim gutscheinSummeMWST : gutscheinSummeMWST=0 
 	 
 	  	  
 	  Dim messageNoCosts : messageNoCosts  =""
 	  
 	  'Response.Write "calculateWarenkorbSum()=" & calculateWarenkorbSum()
 	   'if (1*calculateWarenkorbSum() < 1*getFreiHausLieferungUmsatz()) or getFreiHausLieferungUmsatz()=-1 then  'CALCULATE COSTS 
 	   if (1*subtotal < 1*getFreiHausLieferungUmsatz()) or getFreiHausLieferungUmsatz()=-1 then  'CALCULATE COSTS 
 				if ucase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" then 
 				   PostCosts = calculatePostSpends(PostModeDestination, KG, PostMode)	
 				   PostExpensesMWST = makeBruttoPreis(PostCosts,2, Land)
 				end if 
 	  
 				if ucase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" then 
 					if PayMode<> "" then payModeExpenses = calculatePaymentModeSpends(PayMode, Land, KG, subtotalNoAddCharged)	
 					payModeExpensesMWST = makeBruttoPreis(payModeExpenses,2, Land)
 				end if 
 				'END POST AND MODE COSTS 
 	   else 	
 	      		messageNoCosts  ="<br><font color=""red"" class=""error"">Yeeep: Es werden keine Transport- und Zahlungskosten kalkuliert!</font>"
 	   end if 
 	  
 	  
 	  if gutscheinNummer <> "" then 
 	      gutscheinSumme = getPreisForGutschein(gutscheinNummer)
 	      gutscheinSummeMWST = makeBruttoPreis(gutscheinSumme, 2, Land)
 	  end if 
 	  
 	  
 	  subtotal = subtotal + payModeExpenses + PostCosts - gutscheinSumme
 	  SubtotalMWST = SubtotalMWST + PostExpensesMWST + payModeExpensesMWST - gutscheinSummeMWST
 	  %>

 	
 	<%if ucase(VARVALUE(CALCULATE_POSTCOSTS)) = "TRUE" then %>
    <tr>
	      <td colspan=4></td>
	      <td colspan=2><%=getTranslation("Transportkosten")%> (<%=getTranslation("Dienst")%>: <b><%=postMode%></b>), (KG=<b><%=KG%></b>), (<%=getTranslation("Ziel")%>=<b><%=PostModeDestination%></b>)
			   <%=messageNoCosts%></td>
	      <td>&nbsp;</td>
	      <td align="right" height="17" bgcolor="white" ID="BasketRow"><p align="right"><%=FormatNumber(PostCosts ,2)%></p></td>
    </tr>
     
    <%end if %>
    
    <%if ucase(VARVALUE(CALCULATE_PAYMODECOSTS)) = "TRUE" then %>
	    <tr>
	      <td colspan=4></td>
	      <td colspan=2>
	       <%=getTranslation("Zahlungskosten")%> (<b><%=PayMode%></b>)</font></td>
	      <td>&nbsp;</td>
	      <td align="right" bgcolor="white" ID="BasketRow"><p align="right"><%=FormatNumber( payModeExpenses,2)%></p></td>
	    </tr>
 	<%end if%>
 	
 
  	<%
  	'MINDESTBESTELLMENGE  
    'Wir bitten um Verständnis, dass wir auf Grund unserer äußerst knapp kalkulierten Preise Bestellungen unter € 20,- (ohne Versandkosten) nicht bearbeiten können!
  	if cdbl(getMinOrderValue()) > cdbl(subtotalNoAddCharged) then 'leider kauft der kunde zu wenig 
  	      Dim mindestBestellmengeArtNr: mindestBestellmengeArtNr = getMinOrderValue_charge_artnr()   
  	      Dim bezMindestBestellMenge: bezMindestBestellMenge = tablevalue("grArtikel","ArtNr", mindestBestellmengeArtNr, "Bezeichnung")
  	      Dim mindestBestellmenge_Preis_MWST : mindestBestellmenge_Preis_MWST = makeBruttoPreis2(getMinOrderValue_charge_artnr(), 1, Land) 
  	 	  subtotal = subtotal + cdbl(getMinOrderValue_charge())
 	      SubtotalMWST = SubtotalMWST + cdbl(mindestBestellmenge_Preis_MWST)
  	%>
    <tr>
	      <td colspan=4></td>
	      <td colspan=2><%'=getTranslation("Aufschlag wegen Mindestbestellmenge")%> 
	      <%=bezMindestBestellMenge%>
	      (<b><%=getTranslation("Mindestwert ist ")%> <%=formatNumber(getMinOrderValue(),2)%></b>)</td>
	      <td>&nbsp;</td>
	      <td align="right" height="17" bgcolor="white"  ID="BasketRow"><p align="right"><%=FormatNumber(getMinOrderValue_charge(),2)%></p></td>
    </tr>
     
    <%end if 
    'END MINDESBESTELLMENGE%>
   
 	
 	<%
  	'WARENKORB RABATT 

  	if getBasketDiscount_artnr() <> -1 then 'rabatt is möglich
  	      Dim rabattArtNr: rabattArtNr = getBasketDiscount_artnr()   
  	      Dim rabattBez: rabattBez = tablevalue("grArtikel","ArtNr", rabattArtNr, "Bezeichnung")
  	      Dim rabatt_MWST : rabatt_MWST = 0
  	      Dim rabatt_Value : rabatt_Value = -1*getBasketDiscount_Value(subtotal)
  	 	  subtotal = subtotal + rabatt_Value
 	      SubtotalMWST = SubtotalMWST + rabatt_Value
  	%>
    <tr>
	      <td colspan=4></td>
	      <td colspan=2>
	      <%=rabattBez%>
	      <!--(<b><%=getTranslation("Rabatt für Ihren Einkauf")%>&nbsp;<%=formatNumber(rabatt_Value,2)%></b>)-->
	      </td>
	      <td>&nbsp;</td>
	      <td align="right" height="17" bgcolor="white" ID="BasketRow"><p align="right"><%=FormatNumber(rabatt_Value,2)%></p></td>
    </tr>
     
    <%end if 
    'END WARENKORB RABATT %>
   
   
 	<%if gutscheinNummer <> "" then %>
	    <tr>
	      <td colspan=4>&nbsp;</td>
	      <td colspan=2>
	       <%=getTranslation("Gutschein")%> (<%=gutscheinNummer%>)</font></td>
	      <td align="right" bgcolor="white" ID="BasketRow"><p align="right"><%=FormatNumber(gutscheinSumme,2)%></p></td>

	    </tr>
 	<%end if%>
 	
 	
	   <tr height="25">
	    <td colspan=4 rowspan=2>
	    <%if StepN="3" then 'show Notiz%>    
	    <%=getTranslation("Geben Sie Ihre Bemerkungen zu dieser Bestellung an (Farbe, Groesse, usw):")%>
	    <%end if%>
	    </td>
	      <td colspan=2 rowspan=2>
	      
       <%if StepN<>"3" then 'show Notiz%>     
       <!--Notiz: --> 
       <%=left(Session("Notiz"),255)%>
       <%else%>
       
		<textarea name="notiz" rows="2" cols="50" onKeyPress="CheckNotizLength();" OnChange="CheckNotizLength();" ID="Textarea1"><%=Session("notiz")%>
		</textarea>
       <%end if %>
	      </td>
	      <td align="right"> <p align="right"><b><%=getTranslation("Subtotal")%>:</b></p></td>
	      <td align="right" bgcolor="white" ID="BasketRow"> <p align="right"><b><%=FormatNumber(Subtotal, 2 )%></b></td>	      
	    </tr>	    
	
	<%
	'SET VARS IN CASE NOT YET SET
	if VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1") <> "true" or  VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1") <> "false" then
	   call SETVARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1","true")
	end if 
	
	if VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2") <> "true" or  VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2") <> "false" then
	   call SETVARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2","true")
	end if 
	
	if (VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_1")="true" and StepN="1") _
	or (VARVALUE("SHOP_SHOW_BASKET_VAT_ON_STEP_2")="true" and StepN="2") _
	or (StepN<>"1" and StepN<>"2") then 'show TOTAL only when user already registered!
	
	Dim MWSTPercent : MWSTPercent = 0
        MWSTPercent = round(100*(SubtotalMWST-Subtotal)/Subtotal,0) 
	
	%>
	   <tr>
		  <td align="right"><p align="right"><b><%=getTranslation("Total")%> (+ <%=MWSTPercent%> % <%=getTranslation("MWST")%>):</b></p></td>
	      <td align="right" bgcolor="white" ID="BasketRow"><p align="right"><b><%=FormatNumber(SubtotalMWST, 2 )%></b></p></td>	      
       </tr>
    <%else 'add empty line%>   
       <tr><td colspan=7>&nbsp;<tr></tr>   
    <%end if%>   
       
      </table>
	 <Script language="JavaScript">
			function CheckNotizLength() {
				var note  = document.warenkorbStep3.notiz.value;
				if (note.length > 255) {
					alert('<%=getTranslation("Max 255 Zeichen erlaubt!")%>');
				};
			}; 
	 </Script>
	<%end if%>
<%end function%>
	  
	  
<%


'****************************************************************************
' Show what is in WK
'****************************************************************************
function visualizeWarenkorbSmall() 
 Dim sid: sid = getSID()
 
if inStr(lcase(pageToShow),"warenkorb")>0 then ' do not show 
     visualizeWarenkorbSmall = false 
     exit function 
end if 

Dim paymode, postmode 
Dim destination 


payMode = Request("PayMode"):   if payMode = "" then payMode ="NACHNAHME"
postMode = Request("postMode"): if postMode = "" then postMode ="POST"
destination = Request("destination"): if destination = "" then destination  = Session("LAND")
 
 
 Dim sql, rsWK

	sql = "SELECT webWarenkorb.SID, webWarenkorb.Quantity, grArtikel.* " & _ 
		  " FROM webWarenkorb INNER JOIN grArtikel ON webWarenkorb.ArtNr = grArtikel.ArtNr" & _
		  " Where SID=" & sid & " AND webWarenkorb.Quantity > 0 AND (AuftragNr is null or AuftragNr=0)"
	set rsWK = objConnectionExecute(sql)
 
	if rsWK.EOF and rsWK.BOF then ' empty basket
		response.Write getTranslation("Ihr Warenkorb ist noch leer.")
		visualizeWarenkorbSmall = False
	else	
		visualizeWarenkorbSmall = True

		Dim pos: pos = 0		
		Dim Subtotal : Subtotal = 0
		Dim SubtotalMWST : SubtotalMWST = 0
		while not rsWK.EOF 
		
			pos = pos + 1 
			Dim ArtNr: ArtNR = rsWK("ArtNR")			
			Dim stk: stk = rsWK("Quantity")
			Dim einzelpreis: einzelpreis = makeNettoPreis(ArtNR, Stk, sid)
			
		subtotal = subtotal +einzelpreis * stk
		'SubtotalMWST =  SubtotalMWST + makeBruttoPreis(rsWK("PreisATS"),rsWK("MWST"))  * rsWK("Quantity") 
		SubtotalMWST =   SubtotalMWST + makeBruttoPreis2(rsWK("ArtNR"), stk, Session("Land")) * stk
		
		
		rsWK.MoveNext 
		WEND
		rsWK.close 

     'POST and MODE COSTS 
      Dim KG: KG = getWeightOfBasket(SID)
 	  Dim PostCosts :  PostCosts = 0
 	  Dim payModeExpenses: payModeExpenses = 0
 	  Dim payModeExpensesMWST : payModeExpensesMWST =0
 	  Dim PostExpensesMWST : PostExpensesMWST =0
 	  
 	  
 	  if VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" then 
 	     PostCosts = calculatePostSpends(Land, KG, PostMode)	
 	     PostExpensesMWST =makeBruttoPreis2(getPostSpendsArtNr(Land, KG, PostMode),1, Session("Land"))
 	  end if 
 	  
 	  if VARVALUE(CALCULATE_PAYMODECOSTS) = "TRUE" then 
 		if PayMode<> "" then payModeExpenses = calculatePaymentModeSpends(PayMode, Land, KG, subtotal)	
 		payModeExpensesMWST =  makeBruttoPreis2(getPaymentModeSpendsArtNr(PayMode, Land),1, Session("Land"))
 	  end if 
 	  'END POST AND MODE COSTS 
 	  
 	  
 	  
 	  subtotal = subtotal + payModeExpenses + PostCosts
 	  SubtotalMWST = SubtotalMWST + PostExpensesMWST + payModeExpensesMWST
 	  
 	%>
 	<table border=1 cellspacing="0" ID="Table3">
 	<tr><th colspan=2>Lieferkalkulator</th></tr>
 	<%  
 	  if VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" then 
   %>
        <tr>
	      <td> Post Expenes (KG=<%=KG%>) </td>
	      <td  align="right" height="17"><%=FormatNumber( PostCosts ,2)%></td>
        </tr>
    <%end if %>
    
    <%if VARVALUE(CALCULATE_PAYMODECOSTS) = "TRUE" then %>
	    <tr>
	      <td>Payment Expenses (<%=PayMode%>)</font></td>
	      <td  align="right"  ><%=FormatNumber( payModeExpenses,2)%>&nbsp;</td>
	    </tr>
 	<%end if%>
	   <tr>
	      <td><b> Subtotal:</b></td>
	      <td>
	      <b><p align="right"><%=FormatNumber(Subtotal, 2 )%></b>
	      </td>	     
	    </tr>	    
	   <tr>
		   <td><b>Total (+MWST):</b></Td>
	       <td align="right" >
            <p align="right"><b><%=FormatNumber(SubtotalMWST, 2 )%></b></p>
  		</td>	      
       </tr>
       <tr><td colspan=2>
       <% call makeLieferKalkulatorForm(payMode, postMode, destination)  %>&nbsp;</td></tr>
	   </table>	   
	   <%end if
end function%> 
	   
	   
<%
'==============================================================================
' Manipulation of Payment and Transport from Client
'==============================================================================
function makeLieferKalkulatorForm( byVal payMode, byVal postMode, byVal destination)
%>  
<form action"default.asp?pageToShow=warenkorbStep1" method="POST">	   
	    <!-- WARENKORB PAYMODE--> 
			<p align=left>
            <%=getTranslation("Bestellung-/Zahlungsart")%>: 
            <%
            dim rsZM, selected 
            
            sql = "select methode, destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, destination order by methode"
            set rsZM = objConnectionExecute(sql) 
            while not rsZM.EOF 
              'show only PayMethods for the selected destination or general destinations 
              if ucase(trim(rsZM("destination"))) = "" or ucase(trim(rsZM("destination"))) = ucase(trim(destination)) then 
					if ucase(trim(payMode)) = ucase(trim(rsZM("methode"))) then selected = "checked" else selected=""
					'Response.Write selected
						%>
						<input type="radio" value="<%=rsZM("methode")%>" name="PayMode" <%=selected%> onClick="document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=rsZM("methode")%>&postmode=<%=postmode%>';" ID="Radio1"> <%=rsZM("methode")%>
						<%
				end if 
				rsZM.MoveNExt
            wend
            %>
   <!-- END WARENKORB PAYMODE--> 
           
   <!-- WARENKORB POSTMODE--> 
             <p align=left><%=getTranslation("Transport")%>: 
            <%
            'dim rsZM, selected            
            sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
            set rsZM = objConnectionExecute(sql) 
            while not rsZM.EOF 
              if ucase(trim(postMode)) = ucase(trim(rsZM("methode"))) then selected = "checked" else selected=""
              'Response.Write selected
				%>
				<input type="radio" value="<%=rsZM("methode")%>" name="PostMode" <%=selected%> onClick="document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=rsZM("methode")%>';" ID="Radio2"> <%=rsZM("methode")%>
				<%
				rsZM.MoveNExt
            wend
            %></p>
 <!-- END WARENKORB POSTMODE-->           
                        

 
 <!-- SELECT PLACE OF DELIVERY  -->
  <p align=left><%=getTranslation("Destination der Lieferung")%>: 

  <%
            'dim rsZM, selected            
            sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by destination  order by destination"
            set rsZM = objConnectionExecute(sql) 
            while not rsZM.EOF 
              if ucase(trim(destination)) = ucase(trim(rsZM("destination"))) then selected = "checked" else selected=""
              'Response.Write selected
				%>
				<input type="radio" value="<%=rsZM("destination")%>" name="destination" <%=selected%> onClick="document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination=<%=rsZM("destination")%>';" ID="Radio3"> <%=rsZM("destination")%>
				<%
				rsZM.MoveNExt
            wend
            %>
</p>            
<!-- SELECT PLACE OF DELIVERY  -->
 
      </form>
<%end function%>
	
	
	







