<!--#include virtual="/intrasoft/menu.aspx"-->
<p align="center">
    <%
Dim orderNummer, OrderTypeFrom, OrderTypeTo
orderNummer = request("fromNummer")
if orderNummer ="" then 
    %>
    <p align="center">
        <font color="red">The order number from is missing!</font>
        <%
response.close 
end if
OrderTypeFrom = request("From")
OrderTypeTo  = request("To")
if OrderTypeTo  = "" then
        %>
        <h2>
            <%=getTranslation(OrderTypeFrom)%>&nbsp;<%=getTranslation("Convert")%></h2>
        <%
Dim butArr(5,2)
butArr(1,1) = getTranslation("Angebot")
butArr(2,1) = getTranslation("Auftrag")
butArr(3,1) = getTranslation("Lieferschein")
butArr(4,1) = getTranslation("Rechnung")
butArr(5,1) = getTranslation("Retourwaren")
butArr(1,2) = "convertFromTo.aspx?fromNummer=" & orderNummer & "&From=" & OrderTypeFrom & "&To=AN"  
butArr(2,2) = "convertFromTo.aspx?fromNummer=" & orderNummer & "&From=" & OrderTypeFrom & "&To=AU"  
butArr(3,2) = "convertFromTo.aspx?fromNummer=" & orderNummer & "&From=" & OrderTypeFrom & "&To=LI"  
butArr(4,2) = "convertFromTo.aspx?fromNummer=" & orderNummer & "&From=" & OrderTypeFrom & "&To=AR"  
butArr(5,2) = "convertFromTo.aspx?fromNummer=" & orderNummer & "&From=" & OrderTypeFrom & "&To=RE"  
        %>
        <% =drawButtonLine(butArr)%>
        <%
response.end
end if
'ELSE 

'KundenNummer 
Dim KundNr: KundNr  = FIRSTVALUE("select Kundnr from [" & getVorgangTableForType(OrderTypeFrom) & "] where Nummer=" & orderNummer)
Dim newNumber as String = convertFromTo (OrderTypeFrom, OrderTypeTo, orderNummer, KundNr)
'Set as closed
objConnectionExecute( "Update " & getNameForTable(OrderTypeFrom) & " Set anElba=-1 WHERE Nummer=" & orderNummer)
 
Dim text: text = getNameFor(OrderTypeTo) &  " wurde erstellt!"
    text = text & "<BR>" & getNameFor(OrderTypeFrom) & " # " & orderNummer & " " & lcase(getTranslation("closed")) & "." 
    text = text & "<BR>" & getTranslation("Ansehen") & " " &  getNameFor(OrderTypeTo) & "?" 
Dim urlYes: urlYes = "viewOrder.aspx?nummer=" & newNumber & "&OrderType=" & OrderTypeTo
Response.Write( drawMsgBox("Ready", text, urlYes, "../default.aspx"))%>
</body> 