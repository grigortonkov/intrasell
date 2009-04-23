<!--#include file="../../defaulthead.inc"-->
<HTML>
	<head>
		<link REL='stylesheet' HREF='../styles.css' TYPE='text/css'>
	</head>
	<BODY bgcolor="#FFFFFF">
	<%
	dim ArtNr: artNr = request("ArtNr")
	dim anbieterNr: anbieterNr = request("anbieter")
	dim produktAktiv : produktAktiv= request("produktAktiv")
	dim sql, rs
	sql ="select * from grArtikel where HerstellerNr= " & anbieterNr & " and ArtNr=" & ArtNr
	
	set rs = ObjConnectionExecute(sql) 
	
	if rs.eof then 
	   response.Write "<font color='red'>Keine Berechtigung!</font>"
	else 
	   sql = "update grArtikel set produktAktiv = " &  produktAktiv & " where HerstellerNr= " & anbieterNr & " and ArtNr=" & ArtNr
	   ObjConnectionExecute(sql) 
	   if not produktAktiv then
	    %>Objekt wurde deaktiviert!<%
	   else
	    %>Objekt wurde wieder aktiviert!<%
	   end if 
	end if 
	
	%>
	
	
<Script>
window.setTimeout('window.close();',3000);
parent.document.location = "../../../default.asp?ArtNr=<%=ArtNr%>";
</Script>


	
	</BODY>
</HTML>
