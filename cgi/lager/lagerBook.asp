<!--#include file="../defaulthead.inc"-->
<h1>Warehouse Manager</h1>
<a href="../../default.asp?ArtNr=<%=request("ArtNr")%>"> Back to Product Page </a> 
<hr>

<%
'Description:  
Dim ArtNr: ArtNr = request("ArtNr")
Dim LagerOrt: LagerOrt = request("LagerOrt")
Dim Email: Email = request("Email")
Dim Stk: Stk = request("Stk") 
Dim Action: Action = request("Action") 
Dim ReserviertBis: ReserviertBis = request("ReserviertBis") 
Dim sql 

response.Write "<br>Requested Action=" & action & "<br>": response.Flush

if action = "reserve" then 
	sql  = "insert into lagerLagerBuchung (Email, ArtNr, LagerOrt, Stk, Datum) " & _ 
		"VALUES ('" & Email & "'," & ArtNr & "," & LagerOrt & "," & Stk & "," & TOSQLDATE(ReserviertBis) & ")"
		call ObjConnectionExecute(sql)
		
		call createUpdateLager(ArtNr, LagerOrt, 0)
		'set reserviert field 
		sql = "update [grArtikel-Lagerbestand] set ReserviertStk = ReserviertStk + " & Stk & _
				" where lagerOrt=" & lagerOrt & " and ArtNr=" & ArtNr
		call ObjConnectionExecute(sql)
				
		response.Write "Reservation ok!" 
end if 

if action = "book in" then 
	call createUpdateLager(ArtNr, LagerOrt, Stk)
	response.Write "Book In ok!" 
end if 

if action = "book out" then 
	call createUpdateLager(ArtNr, LagerOrt, -1*Stk)
	response.Write "Book Out ok!" 
end if 

function createUpdateLager(ArtNr, LagerOrt, Stk)
		dim sql 
		sql = "select * from [grArtikel-Lagerbestand] " & _ 
		" where lagerOrt=" & lagerOrt & " and ArtNr=" & ArtNr
		Dim existRs
		set existRs = ObjConnectionExecute(sql)
		if existRs.eof then 
		sql = "insert into  [grArtikel-Lagerbestand] (ArtNr,LagerOrt,Lagerbestand) " & _
				" values (" & ArtNr & "," & LagerOrt & "," & Stk & ")"
		else 'exists update 
		sql = "update [grArtikel-Lagerbestand] set Lagerbestand = Lagerbestand + " & Stk & _
				" where lagerOrt=" & lagerOrt & " and ArtNr=" & ArtNr
		end if 
		call ObjConnectionExecute(sql)
end function 
%>
