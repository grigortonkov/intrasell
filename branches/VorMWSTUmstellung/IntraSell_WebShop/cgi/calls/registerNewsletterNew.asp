<!--#include virtual="/cgi/defaulthead.inc"-->
<body>
<%
Dim artKatNr: ArtKatNr = Session("CURRENT_ARTKATNR")
ArtKatNr = 0 
Dim catName: catName = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", ArtKatNr, "Name")
Dim Interest: Interest = request("Interest")
call registerForNewsletter(request("EmailForNewsletter"), Interest & " in " & catName )
%>
</body>


