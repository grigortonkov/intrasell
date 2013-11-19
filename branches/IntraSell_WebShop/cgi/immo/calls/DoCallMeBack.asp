<%
'Must parameters for this job !
Dim artNrAnfrage: artNrAnfrage = request("artNrAnfrage")
Dim artNr: artNr = request("artNrAnfrage")
Dim mailname: mailname = request("mailname")

Dim EmailAnbieter: EmailAnbieter = getFirstField(_
   "select Email from grArtikel a, lieferantenAdressen la " & _ 
   "where a.herstellerNr=la.idnr and a.artnr=" & artNrAnfrage)

Dim idnr: idnr = getFirstField(_
   "select idnr from grArtikel a, lieferantenAdressen la " & _ 
   "where a.herstellerNr=la.idnr and a.artnr=" & artNrAnfrage)

Dim subject: subject =  request("subject")

call prepareAnSendEmail(mailname, subject, idnr)
'show product page again
response.Write parseTemplate(makeProductPage(artNrAnfrage, "1"),"")
%>
