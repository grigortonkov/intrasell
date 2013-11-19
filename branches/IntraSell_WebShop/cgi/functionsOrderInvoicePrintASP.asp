<%

'*************************************************************************
'function printOrder
'*************************************************************************
function printOrder(OrderType, Nummer)
 if lcase(VARVALUE_DEFAULT("SHOP_USE_RTF_ORDER_PRINT","true")) = "true" then 
    call OpenAusdruck_inWord_RTF(OrderType, Nummer)
 else 'old asp code 
	printOrder = printOrderWithASP(OrderType, Nummer) 
 end if 
end function 

'original function 
function printOrderWithASP(OrderType, Nummer)
Dim TableVorgang,  TableVorgangArtikel
TableVorgang = getNameForTable(OrderType)
TableVorgangArtikel = getNameForTableProducts(OrderType)
%>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="670" ID="Table1">
  <tr>  
    <td width="800" valign="top">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="100%" id="AutoNumber7" height="382">
      <tr>
        <td width="100%" style="border-style: none; border-width: medium" height="54" colspan="3" align=right>
        <img border="0" src="<%=imageFullName("rechnung.gif")%>"></td>
      </tr>
      <tr>
        <td width="33%" style="border-style: none; border-width: medium" height="8"><font color=#000000>
	    <%Dim rsKUND 
	    	  Dim knd
	    	  Dim sql
              sql = "Select * from "& TableVorgang &" where Nummer=" & Nummer 
	    	  Set rsKUND = objConnectionExecute(sql)
	    	 knd = rsKUND ("KundNr")
	    	 Dim orderDate: orderDate = rsKUND("Datum")	    	 
	    	 rsKUND.close 
	    	%>
	    	<%=getTranslation("Lieferadresse")%>: <br>
	    	 <%= printAddress(knd, "LI",FALSE)%> 
	    	<hr>
	    	<%=getTranslation("Rechnungsadresse")%>: <br> 
	    	 <%= printAddress(knd,"AR",FALSE)%> 
	    </font></td>
        <td width="33%" style="border-style: none; border-width: medium" height="8"></td>
        <td width="34%" style="border-style: none; border-width: medium" height="8">
        <p align="right"><font size="1" color=#000000>
        <%=getTranslation(getNameFor(OrderType))%> Nr. <%=Nummer%> / <%=orderDate%>        
        <BR>        
        <%=getTranslation("Kunden Nr.")%>: <%=knd%>        
        </font>
        
        </td>
      </tr>
      <tr>
        <td colspan=3 style="border-style: none; border-width: medium" height="11"></td>
      </tr>
      <tr>
        <td width="33%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" height="1" bordercolor="#C0C0C0"></td>
        <td width="33%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" height="1" bordercolor="#C0C0C0"></td>
        <td width="34%" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" height="1" bordercolor="#C0C0C0"></td>
      </tr>
      <tr>
        <td width="100%" style="border-style: none; border-width: medium" colspan="3" valign="top" height="124">
        <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#C0C0C0" width="100%" id="AutoNumber8">
          <tr>
            <td width="58%" align="center" style="border-left-style:solid; border-left-width:1; border-right-style:solid; border-right-width:1; border-top-style:none; border-top-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0">
            <font size="1" >
            <%=getTranslation("Bezeichnung")%></font></td>
            <td width="17%" align="center" style="border-left-style:solid; border-left-width:1; border-right-style:solid; border-right-width:1; border-top-style:none; border-top-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0">
            <p align="right"><font size="1">
            <%=getTranslation("Einzelpreis")%></font></td>
            <td width="9%" align="center" style="border-left-style:solid; border-left-width:1; border-right-style:solid; border-right-width:1; border-top-style:none; border-top-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0">
            <font size="1">
            <%=getTranslation("Stk")%></font></td>
            <td width="16%" align="center" style="border-left-style:solid; border-left-width:1; border-right-style:solid; border-right-width:1; border-top-style:none; border-top-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0">
            <p align="right"><font size="1" >
            <%=getTranslation("Total")%> 
            <%=getTranslation("Preis")%></font></td>
          </tr>
          <%

 Dim LAND : LAND = getClientLand(knd)
	SQL = " SELECT MWST, Datum, ["&  TableVorgangArtikel  &"].* " & _
		  " FROM grArtikel " & _ 
		  " INNER JOIN ([" & TableVorgangArtikel  & "]" & _ 
		  " INNER JOIN " & TableVorgang  & _
		  " ON [" & TableVorgangArtikel  & "].RechNr = " & TableVorgang & ".Nummer) ON " & _
		  " [" & TableVorgangArtikel  & "].ArtNR = grArtikel.ArtNr " & _ 
		  " WHERE " & TableVorgang & ".KundNr=" & knd  & _
		  " and [" & TableVorgangArtikel  & "].RechNr = " & nummer  & _ 
		  " ORDER BY grArtikel.PreisATS"

'response.write sql

Dim rsWK: set rsWK = objConnectionExecute(sql)
Dim Pos : Pos = 0
Dim Subtotal, Total
Dim MWSTARRAY(2,5) ' up to 5 file MWST cases


 While not rsWK.EOF 
 pos = pos + 1 
%>
			<tr>
            <td width="58%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="17%" style="border-style: none; border-width: medium" align="right">&nbsp;</td>
            <td width="9%" style="border-style: none; border-width: medium" align="center">&nbsp;</td>
            <td width="16%" style="border-style: none; border-width: medium" align="right">&nbsp;</td>
          </tr>
			<tr>
            <td width="58%" style="border-style: none; border-width: medium"><%=rsWK("Bezeichnung")%>&nbsp;</td>
            <td width="17%" style="border-style: none; border-width: medium" align="right"><%=formatNumber(cdbl(rsWK("PreisATS")),2)%>&nbsp;</td>
            <td width="9%" style="border-style: none; border-width: medium" align="center"><%=rsWK("Stk")%>&nbsp;</td>
            <td width="16%" style="border-style: none; border-width: medium" align="right"><%=formatnumber(cdbl(rsWK("PreisATS"))*cdbl(rsWK("Stk")),2)%>&nbsp;</td>
          </tr>
          <tr>
          
   <%   
    subtotal = subtotal +  cdbl(rsWK("PreisATS"))*cdbl(rsWK("Stk"))
    Dim i, found
    found = false 
    for i = 1 to 5 
      if (MWSTARRAY(1,i)= "" or MWSTARRAY(1,i) = rsWK("MWST")) and (not found) then
          MWSTARRAY(1,i)  = rsWK("MWST")
          MWSTARRAY(2,i)  = MWSTARRAY(2,i)  +   (cdbl(rsWK("PreisATS_Brutto"))*rsWK("Stk") - cdbl(rsWK("PreisATS"))*rsWK("Stk"))
          found = true 
      end if 
    next 
    
    'subtotalMWST = subtotalMWST +   makeBruttoPreis(cdbl(rsWK("PreisATS")), cdbl(rsWK("MWST")))*rsWK("Stk")   
    Total = Total + cdbl(rsWK("PreisATS_Brutto"))*rsWK("Stk")
    
   rsWK.MoveNext 
   WEND
   rsWK.close 
   %>
            <td width="58%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="17%" style="border-style: none; border-width: medium" align="right">&nbsp;</td>
            <td width="9%"  style="border-style: none; border-width: medium" align="center">&nbsp;</td>
            <td width="16%" style="border-style: none; border-width: medium" align="right">&nbsp;</td>
          </tr>
          
          <%for i = 1 to 5 
           if NOT MWSTARRAY(1,i)= "" then 
          %>
          <tr>
            <td width="58%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="26%" colspan="2" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" align="right">
            <p align="right"><font size="1" ><br>
            <%=getTranslation("MWST")%> (<%=MWSTARRAY(1,i)%>):</font></td>
            <td style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium; border-bottom-style:solid; border-bottom-width:1" align="right">
            <%=formatNumber(MWSTARRAY(2,i),2)%>&nbsp;</td>
          </tr>
          <%
          END IF 
          next%>
          
          <tr>
            <td width="58%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="26%" colspan="2" align="right" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium">
            <font size="1" ><%=getTranslation("Gesamtsumme")%>:</font></td>
            <td style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" align="right">
            <%=formatNumber(Total,2)%>&nbsp;</td>
          </tr>
          <tr>
            <td width="58%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="17%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="9%" style="border-style: none; border-width: medium">&nbsp;</td>
            <td width="16%" style="border-style: none; border-width: medium">&nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
      <tr>
        <td colspan=3 style="border-style: none; border-width: medium" height="17"></td>
      </tr>

    </table>
    </td>
  </tr>
  </table>
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#FFFFFF" width="669" id="AutoNumber9">
  <tr>
    <td colspan=4>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="4" style="border-bottom-style: solid; border-bottom-width: 1">
    <font size="1"><%=VARVALUE("RECHNUNG_FREIER_TEXT_AGB")%>
    <br></font></td>
  </tr>
  <tr>
    <td width="665" style="border-left-style: solid; border-left-width: 1; border-right-style: solid; border-right-width: 1; border-top-style:solid; border-top-width:1" colspan="4">
    <font  size="1"><%=VARVALUE("COMPANY_FULL_NAME")%><p align="center"></font></td>
  </tr>
</table>

<%
end function 
%>

