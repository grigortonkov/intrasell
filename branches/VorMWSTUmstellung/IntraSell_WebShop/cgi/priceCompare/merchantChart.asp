<%@ LANGUAGE = VBScript.Encode%>
<!--#include file="../../intrasoft/connOpen.asp"-->
<!--#include file="../../intrasoft/functions.asp"-->
<!--#include file="../../intrasoft/functionsGUI.asp"-->
<%
Dim ArtNr: ArtNr = clng(request("ArtNr"))
dim days:  days  = clng(request("days"))
Dim sql , rs
set rs = ObjConnectionexecute("Select * from grArtikel where ArtNR=" & ArtNr)
if rs.eof then 
    call drawErrorBox("Error", "Das Produkt ist unbekannt!", "", "")
	Response.End 	
end if 

Dim artKatNr: artKatNr = rs("artKatNr")
%>
<BODY topmargin="0" leftmargin="0">
	<%
 

Dim butArr(5,2)

butArr(1,1) = "eine_Woche"
butArr(2,1) = "zwei_Wochen"
butArr(3,1) = "einen_Monat"
butArr(4,1) = "3_Monate"
butArr(5,1) = "ein_Jahr"

 

butArr(1,2) = "merchantChart.asp?Days=7&ArtNR=" & ArtNR
butArr(2,2) = "merchantChart.asp?Days=14&ArtNR=" & ArtNR
butArr(3,2) = "merchantChart.asp?Days=31&ArtNR=" & ArtNR
butArr(4,2) = "merchantChart.asp?Days=90&ArtNR=" & ArtNR
butArr(5,2) = "merchantChart.asp?Days=366&ArtNR=" & ArtNR

dim LinksForChart
dim i 
LinksForChart ="Chart f�r: "
for i =1 to 5
   LinksForChart = LinksForChart & "<a href="""  & butArr(i,2) &  """>" & butArr(i,1) & "</a> "
next

Dim links: links = LinksForChart & " <a href=""merchantCompare.asp?ArtNR=" & ArtNR & """> Produktseite </a>"

'call drawWindowPart1("Preisentwicklung", links ,"", butArr)

'check if any price defined for the product 
dim sqlP : sqlP = "select count(ArtikelNr) as countOfArt, max(VKPreis) as maxP " & _
                  " from priceCompareLieferantenArtikelPreiseArchive where ArtikelNr = " & artNR 
Dim rsP: set rsP = ObjConnectionexecute(sqlP)
'Response.write sqlP: response.flush

Response.write LinksForChart
Dim countOfArt: countOfArt = 0
Dim mapP: maxP = 0

if not rsP.eof then 
     if not isNull(rsP("countOfArt")) then countOfArt = clng(rsP("countOfArt"))
     if not isNull(rsP("maxP")) then maxP = cdbl(rsP("maxP"))
end if 
%>
	<table cellSpacing="0" width="100%" border="0">
		<tr>
			<td align="middle" valign="top">
				<%if rsP.eof or countOfArt < 1 then 'or maxP < 0.1 then 'no price or less than 1 price or all prices 0  
							Response.Write "<br><br>"
							call drawErrorBox("Zu wenig Information", "Es ist leider nicht genug Information vorhanden um eine Grafik zu erstellen!","","") 
				else %>
				<img src="MakeChart.asp?DaysInPast=<%=days%>&Field=Ekpreis&ChartType=1&ArtNr=<%=CStr(ArtNr)%>">
			  <%end if %>
		</tr>
	</table>
	<%
'call drawWindowPart2("Preisentwicklung"," ","", butArr)
%>
</BODY>
<!--#include file="../../intrasoft/connClose.asp"-->