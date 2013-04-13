Attribute VB_Name = "functionsWEB"
Option Compare Database

Function makeArtikelURL(ArtNr)
If InStr(varValue("WWW"), "ttp") < 1 Then
    makeArtikelURL = "http://" & varValue("WWW") & "/default.asp?ArtNr=" & ArtNr
 Else
    makeArtikelURL = varValue("WWW") & "/default.asp?ArtNr=" & ArtNr
 End If
End Function
