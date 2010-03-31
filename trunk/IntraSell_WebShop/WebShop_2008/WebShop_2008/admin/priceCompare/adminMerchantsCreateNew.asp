<!--#include file="../client/intrasoft/menu.aspx"-->
<%
Dim nextIdL
nextIdL = nextId("lieferantenAdressen","IDNR")+1
sql = "INSERT INTO lieferantenAdressen (IDNR, Name, Firma, PLZ) Values(" & nextIdL&",'Lieferant neu " & nextIdL & "','Lieferant neu " & nextIdL &"',1)"
call objConnectionExecute(sql) 
sql = "INSERT INTO priceCompareHAendler (LieferantNr) Values(" & nextIdL&")"
call objConnectionExecute(sql) 

%>

Fertig.... ein neuer Profil wurde angelegt... bitte Profile nochmal öffnen!