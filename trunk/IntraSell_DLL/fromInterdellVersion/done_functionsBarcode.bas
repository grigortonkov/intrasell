Attribute VB_Name = "functionsBArcode"

Option Compare Database
Option Explicit
Public Const BARCODE_LENGTH = 16

'creates new barcode
'if already one product with LE exists then the next ITEM is selected
Public Function generateNewBarcode(ByVal ArtNr As String, ByVal LieferantNR As String) As String
        Dim ANR, lNr, itemID
        Dim newBarcode
        
        ANR = Right("0000000" & ArtNr, 7)
        lNr = Right("0000" & LieferantNR, 4)
        itemID = "00001"
        
        
        Dim uniquePart
        Dim sql, rs
        sql = "select Barcode from [grArtikel-ItemTrackingHistory] where vorgangstyp='LE' and  Barcode like '" & ANR & lNr & "*' order by Barcode desc"   'lager eingang
        Set rs = CurrentDb.openRecordset(sql)
        
        If Not rs.EOF Then
            Dim nbc: nbc = rs("Barcode") + 1
              newBarcode = Right("0000000" & nbc, 16)
        Else
                newBarcode = ANR & lNr & itemID
        End If
        
        generateNewBarcode = newBarcode
End Function

Public Function getArtNrFromBC(ByVal bc As String) As String
   getArtNrFromBC = Left(bc, 7)
End Function


Public Function getLieferantNrFromBC(ByVal bc As String) As String
   getLieferantNrFromBC = Mid(bc, 8, 4)
End Function



Public Function isBArcodeOK(ByVal bc As String, ByVal Silent As Boolean) As Boolean
isBArcodeOK = True
  If Len(bc) <> 16 Then
      isBArcodeOK = False
      If Not Silent Then MsgBox "Barcode muss 16 Stellen haben!"
  End If
  
End Function

Function makeBCHistory(ByVal bc As String, ByVal Vorgangtyp As String, ByVal VorgangNummer As String, ByVal Status As String) As Boolean
 If bc & "" = "" Then Exit Function
 
 makeBCHistory = True
 
 DoCmd.SetWarnings False
 Dim sqlBC As String
 
  sqlBC = "insert into [grArtikel-ItemTrackingHistory] (Barcode, Vorgangstyp, VorgangsNummer, Status, [Timestamp]) " & _
          " values ('" & bc & "','" & Vorgangtyp & "'," & VorgangNummer & ",'" & Status & "', now())"
   Call writeLog("TRY " & sqlBC)
   DoCmd.RunSQL sqlBC
   Call writeLog("TRY " & sqlBC)
   DoCmd.SetWarnings True
End Function



Public Function checkIfVorgangProperScanned(ByVal Vorgangstyp As String, ByVal Vorgangsnummer As String) As String
   Dim sql, rs, rsAlle
   
   sql = "select count(*) as c from [" & getVorgangArtikelTableForType(Vorgangstyp) & "] where not Bezeichnung like '*CALCULATE*' and (ArtikelIdentifikation is null or ArtikelIdentifikation="""") and rechnr = " & Vorgangsnummer
   Set rs = CurrentDb.openRecordset(sql)
    
   sql = "select count(*) as c from [" & getVorgangArtikelTableForType(Vorgangstyp) & "] where  not Bezeichnung like '*CALCULATE*' and  rechnr = " & Vorgangsnummer
   Set rsAlle = CurrentDb.openRecordset(sql)
    
    If Not rs.EOF Then
     If rs("c") = 0 Then
          checkIfVorgangProperScanned = "alle Pos. OK"
     Else
         checkIfVorgangProperScanned = rs("c") & " von " & rsAlle("c") & " Pos.offen"
     End If
     
    Else
    checkIfVorgangProperScanned = "keine Pos."
    End If
    
    
    rs.Close
    rsAlle.Close

End Function

Function getBarcodeNachSeriennummer(ByVal txtSeriennummer As String)

    Dim sql, rs
    sql = "select  Barcode from [grArtikel-ItemTrackingHistory] where SerienNrOriginal like '" & txtSeriennummer & "'"
    Set rs = CurrentDb.openRecordset(sql)
    If Not rs.EOF Then
       getBarcodeNachSeriennummer = rs("Barcode")
    Else
        getBarcodeNachSeriennummer = ""
    End If

End Function
    
    
