<%@  Language="VBScript.Encode" %>
<!--#include file="../../intrasoft/connOpen.aspx"-->
<!--#include file="../../intrasoft/functions.aspx"-->
<!--#include file="../functionsSkins.aspx"-->
<!--#include file="functionsMerchants.aspx"-->
<!--Das ist die Liste aller Lieferer dieses Produktes, wobei der Preis nicht immer das entscheidende Kriterium ist.-->
<h3>
    H�ndler, die dieses Produkt f�hren</h3>
<%
  Dim sqlL, rsL
  Dim OrderBy: OrderBy = Request("OrderBy"): if OrderBy= "" then OrderBy = "VKPreis"
  Dim artNR: ArtNR = request("ArtNr"): if ArtNR="" then ArtNR= "0"
  
 
  
  sqlL = " SELECT grArtikel.ArtNr, grArtikel.EAN, grArtikel.Barcode, grArtikel.Bezeichnung, " & _ 
         " [lieferantenArtikel-Preise].PreisId, [lieferantenArtikel-Preise].LieferantNr, [lieferantenArtikel-Preise].ArtikelNrLieferant, " & _ 
         " [lieferantenArtikel-Preise].VKPreis, [lieferantenArtikel-Preise].Rabatt, [lieferantenArtikel-Preise].PreisDatum, " & _ 
         " [lieferantenArtikel-Preise].Lagerinfo, [lieferantenArtikel-Preise].Bestellmenge, [lieferantenArtikel-Preise].Kategorie, " & _ 
         " [lieferantenArtikel-Preise].Prioritaet, [lieferantenArtikel-Preise].EAN, lieferantenAdressen.Firma " & _ 
         " FROM lieferantenAdressen INNER JOIN (grArtikel INNER JOIN [lieferantenArtikel-Preise] ON grArtikel.ArtNr = [lieferantenArtikel-Preise].ArtikelNr) ON lieferantenAdressen.IDNR = [lieferantenArtikel-Preise].LieferantNr " & _ 
		 " WHERE ArtNr = " & ArtNR & " " & _ 
		 " ORDER BY " & OrderBy
    
  ' response.write sqlL: response.flush  
   set rsL = objConnectionExecute(sqlL)      
%>
<table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr bgcolor="#dddddd">
        <th width="220" style="border-bottom: 2 solid #C0C0C0">
            <a href="default.aspx?ArtNr=<%=ArtNr%>&amp;OrderBy=[lieferantenArtikel-Preise].Bezeichnung">
                Lieferant</a>
        </th>
        <th width="250" style="border-bottom: 2 solid #C0C0C0">
            <a href="default.aspx?ArtNr=<%=ArtNr%>&amp;OrderBy=Firma">Bezeichnung</a>
        </th>
        <th width="100" style="border-bottom: 2 solid #C0C0C0">
            <a href="default.aspx?ArtNr=<%=ArtNr%>&amp;OrderBy=[lieferantenArtikel-Preise].LagerInfo">
                Verf�gbarkeit</a>
        </th>
        <th width="100" style="border-bottom: 2 solid #C0C0C0">
            <a href="default.aspx?ArtNr=<%=ArtNr%>&amp;OrderBy=[lieferantenArtikel-Preise].VKPreis">
                Preis</a>&nbsp;&nbsp;<br>
            /inkl. MWST/<br>
            <th width="300" style="border-bottom: 2 solid #C0C0C0">
                Zahlungs- &amp; Lieferungsmethoden
            </th>
            <!--<th width="100" style="border-bottom: 2 solid #C0C0C0"><a href="merchantCompare.aspx?ArtNr=<%=ArtNr%>&amp;OrderBy=ArtikelNrLieferant"> Nummer</a>&nbsp;<br>des Lieferantes</th>-->
            <th width="100" style="border-bottom: 2 solid #C0C0C0">
                Zum Shop
            </th>
    </tr>
    <%
Dim rowColor
if rsL.EOF then 
  call drawErrorBox("Keine Preise vorhanden", "Zur Zeit sind keine Lieferanten f�r deises Produkt vorhanden! " & _ 
                    " Es kann sein, dass kein H�ndler das Produkt liefert, oder das Produkt neu in die Datenbank eingef�gt wurde!", "", "")
end if 


while not rsL.EOF 

if rowColor = "#F7F7F7" then 
	rowColor = "#FFFFFF" 
else
	rowColor = "#F7F7F7"
end if 
    %>
    <tr>
        <td bgcolor="<%=rowColor%>">
            <%=makeMerchantView(rsL("LieferantNR").Value)%>
        </td>
        <td bgcolor="<%=rowColor%>">
            <p align="center">
                <%=rsL("Bezeichnung").Value%></p>
        </td>
        <td bgcolor="<%=rowColor%>">
            <p align="center">
                <%=rsL("LagerInfo").Value%></p>
        </td>
        <td bgcolor="<%=rowColor%>">
            <p align="right" bgcolor="<%=rowColor%>">
                <%=formatnumber(rsL("VKPreis").Value,2)%>
                �</p>
        </td>
        <td bgcolor="<%=rowColor%>">
            <%=listPaymentMethods(rsL("LieferantNR").Value)%>
            <p>
                <%=listDeliveryMethods(rsL("LieferantNR").Value)%>
        </td>
        <!--<td width="144" bgcolor="<%=rowColor%>">
  <p align="center"><%=rsL("ArtikelNrLieferant")%></p>
</td>
-->
        <td bgcolor="<%=rowColor%>">
            <p align="center">
                <a target="_new" href="cgi/priceCompare/buyFromMerchant.aspx?LieferantNr=<%=rsL("LieferantNR").Value%>&ArtNr=<%=ArtNr%>&ArtikelNrLieferant=<%=rsL("ArtikelNrLieferant").Value%>">
                    <img border="0" src="<%=imageFullName("buy.gif")%>" alt="Click here to buy!"></a>
            </p>
        </td>
    </tr>
    <%
rsL.MoveNext 
end while%>
</table>
<!--#include file="../../intrasoft/connClose.aspx"-->
