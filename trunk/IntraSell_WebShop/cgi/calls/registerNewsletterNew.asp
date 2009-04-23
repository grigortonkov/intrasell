<%@ LANGUAGE = VBScript.Encode%>
<%'@ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<%OPTION explicit%>
<!--#include file="../../intrasoft/connopen.asp"-->
<!--#include file="../../intrasoft/functions.asp"-->
<!--#include file="../functionsIntrasoft.asp"-->
<!--#include file="../functionsNewsletter.asp"-->
<!--#include file="../mailtexts.asp"-->
<body>
<%
Dim artKatNr: ArtKatNr = Session("CURRENT_ARTKATNR")
ArtKatNr = 0 
Dim catName: catName = TABLEVALUE("[grArtikel-Kategorien]", "ArtKatNr",ArtKatNr,"Name")
Dim Interest: Interest = request("Interest")
call registerForNewsletter(request("EmailForNewsletter"), Interest & " in " & catName )
%>
</body>


