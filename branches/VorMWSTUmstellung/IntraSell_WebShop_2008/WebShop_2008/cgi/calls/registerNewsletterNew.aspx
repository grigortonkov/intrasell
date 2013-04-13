<!--#include virtual="/cgi/defaultHead.inc.aspx"-->
<body>
    <%
        Dim artKatNr : artKatNr = Session("CURRENT_ARTKATNR")
        artKatNr = 0
        Dim catName : catName = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr", artKatNr, "Name")
        Dim Interest : Interest = Request("Interest")
        Call registerForNewsletter(Request("EmailForNewsletter"), Interest & " in " & catName)
    %>
</body>
