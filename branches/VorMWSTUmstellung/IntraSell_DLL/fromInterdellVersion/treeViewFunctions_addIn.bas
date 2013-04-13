Attribute VB_Name = "treeViewFunctions_addIn"
Option Compare Database

Public Function makeQueryForArtikelGruppen(ArtKatNr)
makeQueryForArtikelGruppen = "SELECT Name, """" AS form, " & _
                             "makeQueryForArtikelGruppen(artKatNr) , 1 AS icon " & _
                             " FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & ArtKatNr & _
                             " UNION " & _
                             " Select Bezeichnung ,""artikelArtikel,artnr="" & artnr,"""",4 as icon " & _
                             " from grArtikel where ArtKatNR=" & ArtKatNr
End Function


Public Function makeQueryForKategorien(ArtKatNrParent)
makeQueryForKategorien = "SELECT Name, ""grArtikel-KategorienDetail,ArtKatNr="" & ArtKatNr AS form, " & _
                             " makeQueryForKategorien(artKatNr) , 1 AS icon " & _
                             " FROM [grArtikel-Kategorien] WHERE ArtKatNrParent=" & ArtKatNrParent
End Function


