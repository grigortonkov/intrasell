<!--#include file="../defaultHead.inc.aspx"-->
<h1>
    Warehouse Manager</h1>
<a href="../../default.aspx?ArtNr=<%=request("ArtNr")%>">Back to Product Page </a>
<hr>
<%
    'Description:  
    Dim ArtNr : ArtNr = Request("ArtNr")
    Dim LagerOrt : LagerOrt = Request("LagerOrt")
    Dim Email : Email = Request("Email")
    Dim Stk : Stk = Request("Stk")
    Dim Action : Action = Request("Action")
    Dim ReserviertBis : ReserviertBis = Request("ReserviertBis")
    Dim sql

    Response.Write("<br />Requested Action=" & Action & "<br />") : Response.Flush()

    If Action = "reserve" Then
        sql = "insert into lagerLagerBuchung (Email, ArtNr, LagerOrt, Stk, Datum) " & _
         "VALUES ('" & Email & "'," & ArtNr & "," & LagerOrt & "," & Stk & "," & TOSQLDATE(ReserviertBis) & ")"
        Call ObjConnectionExecute(sql)
        
        Call createUpdateLager(ArtNr, LagerOrt, 0)
        'set reserviert field 
        sql = "update [grArtikel-Lagerbestand] set ReserviertStk = ReserviertStk + " & Stk & _
          " where lagerOrt=" & LagerOrt & " and ArtNr=" & ArtNr
        Call ObjConnectionExecute(sql)
                
        Response.Write("Reservation ok!")
    End If

    If Action = "book in" Then
        Call createUpdateLager(ArtNr, LagerOrt, Stk)
        Response.Write("Book In ok!")
    End If

    If Action = "book out" Then
        Call createUpdateLager(ArtNr, LagerOrt, -1 * Stk)
        Response.Write("Book Out ok!")
    End If

%>
