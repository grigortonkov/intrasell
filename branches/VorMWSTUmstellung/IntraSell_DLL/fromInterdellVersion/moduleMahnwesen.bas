Attribute VB_Name = "moduleMahnwesen"
Option Compare Database
Public Const MAHNSTUFE_1 = "MAHNSTUFE_1"
Public Const MAHNSTUFE_2 = "MAHNSTUFE_2"
Public Const MAHNSTUFE_3 = "MAHNSTUFE_3"


Function calculateMahnStufe(ByVal rechDatum, ByVal RechNr, ByVal Umsatz)
   
  Dim altTage
  Dim sql, rs
  Dim countMahnungen
  sql = "select count(*) as countMahnungen from buchMahnungshistorie where nummer =" & RechNr
  Set rs = CurrentDb.openRecordset(sql)
  
  If rs.EOF Then
    countMahnungen = 0
  Else
    countMahnungen = rs("countmahnungen")
  End If
  
  altTage = Date - rechDatum
   If altTage >= 7 And countMahnungen = 0 Then
       calculateMahnStufe = MAHNSTUFE_1
   End If
   
   If altTage >= 14 And countMahnungen = 1 Then
       calculateMahnStufe = MAHNSTUFE_2
   End If
    
    
   If altTage >= 21 And countMahnungen = 2 Then
       calculateMahnStufe = MAHNSTUFE_3
   End If
    
End Function



