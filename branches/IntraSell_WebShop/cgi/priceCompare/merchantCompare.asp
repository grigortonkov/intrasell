<!--#include file="includeall.inc"-->
<!--#include file="Title.asp"-->
<BODY topmargin=0 leftmargin=0>
<!--#include file="menu.asp"-->
<%
Dim ArtNr: ArtNr = clng(request("ArtNr"))
Dim sql , rs
set rs = ObjConnectionexecute("Select ArtNr, ArtKatNr, LieferantNr,Picture, Bezeichnung, preisATS, EAN from grArtikel where ArtNR=" & ArtNr)
if rs.eof then 
    call drawErrorBox("Error", "Das Produkt ist unbekannt!", "", "")
	Response.End 	
end if 
Dim artKatNr: artKatNr = rs("artKatNr")
%>
<%
'Draw BANNER
'response.write makeBanner(rs("artKatNr"),1)
%>
<table  border="0" cellspacing="0" cellpadding="0" width="425">
<tr>
<td bgcolor="#F7F7F7" valign="top"  width="200"> 
<%
  Response.Write drawAreaHTML_WithImage("formName", createSearchForm(artKatNr), "Suchen Sie hier",300, "../images/windows/produktsuche.gif")
  'Response.Write drawAreaHTML_WithImage("Featured merchants", showFeaturedMerchants(rs("artKatNr")),"", 300,  "../images/windows/tophaendler.jpg")
%> 
<img border="0" src="platzhalter.gif" width="200" height="10">
</td>
<td width="10">
<img border="0" src="platzhalter.gif" width="10" height="10">
</td>
<td valign="top" width="761">
<%
Dim butArr(5,2)
butArr(1,1) = "Hersteller_Infos"
butArr(2,1) = "Preisentwicklung"
butArr(3,1) = "Produkt_merken"
butArr(4,1) = "Produktreviews"
butArr(5,1) = "Review_schreiben"

butArr(1,2) = "productManufacturerInfos.asp?ArtNR=" & ArtNR
butArr(2,2) = "merchantChart.asp?ArtNR=" & ArtNR
butArr(3,2) =  "account/saveBookmark.asp?Title=Produkt " & server.URLEncode(rs("Bezeichnung")) & "&Folder=Produkte&URL=../merchantCompare.asp?ArtNr=" &  ArtNR
butArr(4,2) = "productReviews.asp?ArtNR=" & ArtNR
butArr(5,2) = "writeReview.asp?ArtNR=" & ArtNR
call drawWindowPart1Product("Produkt Information"," ","", butArr)%>

<table cellspacing=0 style="HEIGHT: 159px" border="0"  width="700">
<tr><td align=left width="400" valign="top" rowspan="2">
    <div align="left">
    <table border="0" width="100%" cellspacing="0" cellpadding="2">
          <tr>
        <th width="93" align="left" height="18">
         <P align=right>&nbsp;HerstellerNr.</P></th>
        <td width="225" height="18"><%=rs("EAN")%></td>
      </tr>
      
      <tr>
        <th width="93" align="left" height="18">
                  <P align=right>&nbsp;Bezeichnung</P></th>
        <td width="225" height="18"><%=rs("Bezeichnung")%></td>
      </tr>
      <tr>
        <th width="93" align="left" height="18">
                  <P align=right>Beschreibung</P></th>
        <td width="225" height="18"><%=tablevalue("grArtikel","ArtNr", ArtNr, "Beschreibung")%></td>
      </tr>
      <tr>
        <th width="93" align="left" height="18">
                  <P align=right>&nbsp;Billigster Preis</P> </th>
        <td width="225" height="18"> € <%=formatnumber(rs("PreisATS"),2)%></td>
      </tr>
   <!--   <tr>
        <th width="138" align="left" height="18"><P align=right>&nbsp;Teuerster Preis</P> </th>
        <td width="225" height="18">
          <p align="right"></td>
      </tr>
      -->
<center>
      <tr>
        <th width="93" align="left" height="18"> <P align=right>&nbsp;Hersteller</P></th>
        <td width="225" height="18"><%=makeManufacturerView(rs("LieferantNR"))%></td> </tr>
      <tr>
        <th width="93" height="194"><P align=right>&nbsp;Bild</P></th>
        <td width="225" height="194">          
        <p align="center">     
        <% call downloadFile( rs("Picture"), ArtNr)%>     
        <%=makeImgTag(TABLEValue("grArtikel","ArtNr",ArtNR,"picture"), rs("Bezeichnung"),200)%>
        </p>
        </td>
      </tr>
    </table>
    </div>
    </center>
  </td><td align=middle width="300" >
      <table border="1" width="298" cellspacing="0" align="right">
      <tr>
        <td width="400" bordercolor="#f7f7f7">
          <p align="center"><img border="0" src="menu/preisalarm.gif" align="left">Ich möchte informiert werden, sobald der Preis günstiger ist!&nbsp;
          <form action="account/priceAlarmRegister.asp" method=post id=form1 name=form1 target="PriceAlarm">
          <table border="0" cellspacing="0" width="290">
            <tr>
              <th width="98" align="right">Ihre Email*</th>
              <td width="186"> <input name="Email" size="15"    >  </td>
            </tr>
            <tr>
              <th width="98" align="right">Enddatum*</th>
              <td width="186"> <input name="EndDate" Id="EndDate" size="15" value="<%=Date()+30%>" OnClick="window.open('calendarSelect.asp?toElementName=EndDate', 'remote','top=300,left=300,height=400,width=350,status=yes,toolbar=no,menubar=no');">
              </td>
            </tr>
                        <tr>
              <th width="98" align="right"> nur wenn Preis unter </th>
              <td width="186"> <input name="PriceBorder" size="15" value="<%=formatNumber(rs("PreisATS"),2)%>">
              </td>
            </tr>
            <tr>
              <th width="98"></th>
              <td width="186">
              <input OnClick="window.open('PriceAlarm','PriceAlarm','top=300,left=300,height=100,width=200,status=yes,toolbar=no,menubar=no,location=no');" type="submit" value="Alarm aktivieren" name="AlarmAktivieren"></td>
            </tr>
          </table>
          <input type="hidden" name="ArtNr" value="<%=ArtNr%>">
          </form>
        </td>
      </tr>
    </table>
  </td></tr>
<tr>
<td align=middle width="300"> 
<table border="1" width="31%" cellspacing="0" align="right">
  <tr>
    <td width="100%" bordercolor="#f7f7f7">
    <form method="POST" action="merchantCompare.asp" target="_self">
    <input type="hidden" value="<%=artNR%>" name="ArtNr">
  <table border="0" height="53" width="292">
    <tr>
      <td width="284">
        <p align="center">
        <img border="0" src="menu/handlersuche.gif" align="left">Bitte geben Sie Ihre PLZ an, um einen Händler / Filiale in Ihrer Nähe zu finden.</td>
    </tr>
    <tr>
      <td width="284" align="center">
      <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td width="41%" align="right">
      Bundesl.</td>
          <td width="34%"><input type="text" name="BL" size="7"></td>
          <td width="13%">Ort</td>
          <td width="6%"><input type="text" name="Ort" size="7"></td>
          <td width="6%"></td>
        </tr>
        <tr>
          <td width="41%" align="right">      
      PLZ:<input type="button" value="?" name="plzSucheButton" OnClick="window.open('plzSelector.asp?toElementName=PLZ', 'remote','top=300,left=300,height=300,width=550,status=yes,toolbar=no,menubar=no');">&nbsp;</td>
          <td width="30%" colspan="2">
<input type="text" name="PLZ" size="7">
          </td>
          <td width="29%" colspan="2">
<input type="submit" value="suchen" name="plzSuche">
          </td>
        </tr>
      </table><input type="checkbox" name="SearchAround" value="ON" checked>auch in
        der Umgebung suchen</td>
    </tr>
  </table>
</form></td>
  </tr>
</table>
  </td></tr>
</table>
<%call drawWindowPart2Product("Produkt Information"," ","", butArr)%> 
  <%
  ' Print List with merchant adresses
  if request("plz")<> "" Or request("BL")<> "" or request("Ort")<> "" then 'PLZ Search     
    call findMerchants(request("BL"),request("Ort"),request("PLZ"), artNr, ucase(request("SearchAround")) = "ON") 
  end if 
  
  %>   
  <!--#include file="merchantCompareMerchantList.asp"-->
</td>
</tr>
</table> 
<%
'save as put in warenkorb 
ObjConnectionexecute("INSERT INTO webWarenkorb (ARTNR, Quantity) VALUES (" & ArtNr & ",1)")
Call LOG() ' save in login table 
%>
<!--#include file="footer.asp"-->
</BODY>
