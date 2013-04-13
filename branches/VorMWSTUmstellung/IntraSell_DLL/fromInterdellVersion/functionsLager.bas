Attribute VB_Name = "functionsLager"
Option Compare Database
Option Explicit

Public Const LAGER_KOSTEN = "LK"
Public Const LAGER_EINGANG = "LE"
Public Const LAGER_AUSGANG = "LA"

'Verbucht die Einträge in der Tabelle lagerLagerBuchung
Public Sub buchen(cbDruckeBarcode As Boolean)


   DBEngine.BeginTrans
  ' save current
 
        Dim rs, sql
     
        sql = "select * from lagerLagerBuchung" ' where lagerort is not null"
           Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
           
          Dim typBuchung As Integer
           While Not rs.EOF
            typBuchung = 0
            If rs("VorgangsTyp") = LAGER_EINGANG Then typBuchung = 1
            If rs("VorgangsTyp") = LAGER_AUSGANG Then typBuchung = -1
           
           
           If rs("VorgangsTyp") = LAGER_KOSTEN Then  'Lager Kosten
                Call Lagerbuchung(rs("Vorgangsnummer"), _
                                    rs("Vorgangstyp"), _
                                    rs("ArtNR"), _
                                    0, _
                                    0, _
                                    rs("lagerOrt"), _
                                    0, _
                                    0, _
                                    0, _
                                    0, _
                                    rs("Ekpreis"), _
                                    rs("Datum"))
                                    
             Else
                       Call Lagerbuchung(rs("Vorgangsnummer"), _
                                    rs("Vorgangstyp"), _
                                    rs("ArtNR"), _
                                    rs("Ekpreis"), _
                                    typBuchung * rs("Stk"), _
                                    rs("lagerOrt"), _
                                    typBuchung * rs("GewichtBrutto"), _
                                    typBuchung * rs("GewichtNetto"), _
                                    typBuchung * rs("GewichtTara"), _
                                    typBuchung * rs("Einheiten"), _
                                    0, _
                                    rs("Datum"))
                                    
             End If
             
                 If rs("LieferantNR") & "" <> "" Then
                      Call makeLieferantenPreis(rs("ArtNR"), rs("LieferantNr"), rs("Ekpreis"))
                      
                      
                      'GENERATE BARCODE FOR EVERY ITEM
                      If cbDruckeBarcode = True Then
                             Dim sqlBC
                             DoCmd.SetWarnings False
                             Dim i As Integer
                             
                             For i = 1 To rs("Stk")
                                    
                                    Dim SerienNrOriginal
                                    SerienNrOriginal = InputBox("Scannen Sie den Produktbarcode ein:", "Original Barcode")
                                    
                                    sqlBC = "insert into [grArtikel-ItemTrackingHistory] (Barcode, SerienNrOriginal, Vorgangstyp)" & _
                                            " values ('" & generateNewBarcode(rs("ArtNR"), rs("LieferantNr")) & "','" & SerienNrOriginal & "','LE')"
                                    DoCmd.RunSQL sqlBC

                             Next
                                    'PRINT
                                    DoCmd.OpenReport "printBarcodes", acViewNormal, , "vorgangstyp='LE' and (Status='' or Status is null)"
                                    'update SQL
                                    sqlBC = "update [grArtikel-ItemTrackingHistory] set Status ='gedruckt' where vorgangstyp='LE' and (Status='' or Status is null)"
                                    DoCmd.RunSQL sqlBC
                                    DoCmd.SetWarnings True
                                    
                      End If
                      'END GENERATE
                                        
                 End If
                 rs.MoveNext
           Wend
           
           DoCmd.SetWarnings False
           sql = "delete  from lagerLagerBuchung" ' where lagerort is not null"
           DoCmd.RunSQL sql
           DoCmd.SetWarnings True
           
           DBEngine.CommitTrans
           MsgBox "Fertig!"
End Sub


Public Sub lagerEingang(ByVal RechNr, ByVal Vorgangtyp As String)
    Call lagerAusgangEingang(RechNr, Vorgangtyp, LAGER_EINGANG)
End Sub
'this fuction is called from form Retourwaren
Public Sub lagerEingang_old(ByVal RechNr, ByVal VorgangType As String)

'begin transaction
'DBEngine.BeginTrans
 
  If IsNull(RechNr) Or RechNr = "" Then
        Exit Sub
  End If

  DoCmd.SetWarnings False
  Dim sql, rs
  Dim tableToUpdate
  tableToUpdate = getVorgangArtikelTableForType(VorgangType)
  
  'lagerstand von den betroffenen artikel aktualisieren
  Set rs = CurrentDb.openRecordset("select Id, Stk, ArtNr, ArtikelIdentifikation from [" & tableToUpdate & "] Where RechNr = " & RechNr, dbOpenDynaset, dbSeeChanges)
    
  While Not rs.EOF
      Dim Einstandspreis: Einstandspreis = Replace(getEinstandsPreis(rs("ArtNR")), ",", ".")
      sql = "INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, PreisEingang, Eingang, Datum )" & _
              " SELECT """ & VorgangType & """, RechNr, ArtNR, " & Einstandspreis & " , Stk , Date()" & _
              " FROM [" & tableToUpdate & "]" & _
              " WHERE  ArtNR = " & rs("ArtNr") & " and RechNr =" & RechNr & " and Id=" & rs("Id")
    
      Call writeLog("TRY " & sql)
      DoCmd.RunSQL sql
      Call writeLog("DONE " & sql)
     
      Call CreateLagerbestandAndIncrease(rs("ArtNr"), rs("Stk"), 0, 0, 0, 0, 0, 0, 0)
      'make Barcodebewegung
      Call makeBCHistory(rs("ArtikelIdentifikation") & "", VorgangType, RechNr, "Lagereingang")
      rs.MoveNext
  Wend
  rs.Close
  DoCmd.SetWarnings True
  
  'end transaction
  'DBEngine.CommitTrans
  MsgBox "Der Lagerbestand wurde mit diesen Artikeln aktualisiert!"
  
End Sub


'this fuction is called from form Lieferschein
Public Sub lagerAusgang(ByVal RechNr, ByVal Vorgangtyp As String, Optional Silent As Boolean = False)
    Call lagerAusgangEingang(RechNr, Vorgangtyp, LAGER_AUSGANG, Silent)
End Sub

Public Sub lagerAusgangEingang(ByVal RechNr, _
 ByVal Vorgangtyp As String, _
 ByVal BewegungsTyp As String, _
 Optional Silent As Boolean = False)
'DBEngine.BeginTrans
  
'lagerstand von den betroffenen Artikel aktualisieren
  Dim tableToUpdate
  tableToUpdate = getVorgangArtikelTableForType(Vorgangtyp)

Dim Bewegung As Integer: Bewegung = -1
If BewegungsTyp = LAGER_EINGANG Then Bewegung = 1


 Dim sql, rs
  'check if closed
  sql = "select  anElba from " & getVorgangTableForType(Vorgangtyp) & " where nummer=" & RechNr
  Set rs = CurrentDb.openRecordset(sql)
  
  If rs.EOF Then ' error
     Exit Sub
  Else
    If rs("anElba") = True And BewegungsTyp = LAGER_AUSGANG Then
        MsgBox "Der Lagerbestand wurde bereits ausgebucht!", vbCritical
        Exit Sub
    End If
  End If
 
 rs.Close
 Set rs = Nothing
 
  DoCmd.SetWarnings False
  'lagerstand von alle betroffene artikel aktualisieren
 
  Set rs = CurrentDb.openRecordset("select [" & tableToUpdate & "].Id, [" & tableToUpdate & "].Stk, [" & tableToUpdate & "].ArtNr, ArtikelIdentifikation, LagerOrt, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten " & _
                                   "from [" & tableToUpdate & "]  LEFT JOIN [buchvorgang-artikeldetaillager] lb ON [" & tableToUpdate & "].ID = lb.ID " & _
                                   " Where RechNr = " & RechNr, dbOpenDynaset, dbSeeChanges)
    
  While Not rs.EOF
   
    'kalkulationen im lager basieren auf einstandspreise
    Dim Einstandspreis: Einstandspreis = Replace(getEinstandsPreis(rs("ArtNr")), ",", ".")
   
    If rs("LagerOrt") & "" <> "" Then
         sql = " INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, " & IIf(Bewegung = -1, "PreisAusgang, Ausgang", "PreisEingang, Eingang") & ", Datum, " & _
              " LagerOrt, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten)" & _
              " SELECT """ & Vorgangtyp & """, RechNr, [" & tableToUpdate & "].ArtNR, " & Einstandspreis & ", [" & tableToUpdate & "].Stk, Now(), " & _
              " LagerOrt, " & Bewegung & "*GewichtBrutto, " & Bewegung & "*GewichtNetto, " & Bewegung & "*GewichtTara, " & Bewegung & "*Einheiten " & _
              " FROM [" & tableToUpdate & "] LEFT JOIN [buchvorgang-artikeldetaillager] lb ON [" & tableToUpdate & "].ID = lb.ID" & _
              " WHERE  [" & tableToUpdate & "].ArtNr = " & rs("ArtNr") & " and RechNr =" & RechNr & " and [" & tableToUpdate & "].id = " & rs("Id")
    Else
         sql = " INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, " & IIf(Bewegung = -1, "PreisAusgang, Ausgang", "PreisEingang, Eingang") & ", Datum)" & _
              " SELECT """ & Vorgangtyp & """, RechNr, [" & tableToUpdate & "].ArtNR, " & Einstandspreis & ", [" & tableToUpdate & "].Stk, Now() " & _
              " FROM [" & tableToUpdate & "] LEFT JOIN lagerlagerbuchung ON [" & tableToUpdate & "].ID = lagerlagerbuchung.ID" & _
              " WHERE  [" & tableToUpdate & "].ArtNr = " & rs("ArtNr") & " and RechNr =" & RechNr & " and [" & tableToUpdate & "].id = " & rs("Id")
    End If
    
        Call writeLog("TRY " & sql)
        DoCmd.SetWarnings False
        DoCmd.RunSQL sql
        DoCmd.SetWarnings True
        Call writeLog("DONE " & sql)
        
        Call CreateLagerbestandAndIncrease(rs("ArtNr"), _
         Bewegung * rs("Stk"), _
         nvl(rs("LagerOrt"), 0), _
         Bewegung * nvl(rs("GewichtBrutto"), 0), _
         Bewegung * nvl(rs("GewichtNetto"), 0), _
         Bewegung * nvl(rs("GewichtTara"), 0), _
         Bewegung * nvl(rs("Einheiten"), 0), _
         0, 0)
        'lagerbuchung detail löschen
        'DoCmd.RunSQL "delete from [buchvorgang-artikeldetaillager] where id = " & rs("Id")
        'make Barcodebewegung
        Call makeBCHistory(rs("ArtikelIdentifikation") & "", Vorgangtyp, RechNr, IIf(Bewegung = -1, "Lagerausgang", "Lagereingang"))
        
        rs.MoveNext
  Wend
  
  rs.Close
  Set rs = Nothing
  DoCmd.SetWarnings True
  
    'end transaction
    'DBEngine.CommitTrans
    
  If Not Silent Then MsgBox "Der Lagerbestand wurde mit diesen Artikeln aktualisiert!"
  
End Sub


'this function is called from lagerBuchung Form
Public Sub Lagerbuchung(ByVal Vorgangsnummer, _
                        ByVal VorgangType, _
                        ByVal ArtNr, _
                        ByVal EKPreis, _
                        ByVal Stk, _
                        ByVal LagerOrt, _
                        ByVal GewichtBrutto, _
                        ByVal GewichtNetto, _
                        ByVal gewichttara, _
                        ByVal einheiten, _
                        ByVal LagerKosten, _
                        ByVal Datum As Date)

  If IsNull(LagerOrt) Then
        MsgBox "Lagerort ist nicht definiert!"
  End If
  
  If IsNull(Vorgangsnummer) Or Vorgangsnummer = "" Then
        Exit Sub
  End If

  DoCmd.SetWarnings False
  Dim sql
    If Stk >= 0 Then
             sql = "INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, PreisEingang, PreisAusgang, Eingang, Ausgang, Datum, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten, Lagerort, LagerKosten )" & _
            " VALUES ('" & VorgangType & "'," & Vorgangsnummer & "," & ArtNr & "," & Replace(EKPreis, ",", ".") & ",0, " & Replace(Stk, ",", ".") & ", 0, " & makeSQLDate(Datum) & ", " & Replace(GewichtBrutto, ",", ".") & ", " & Replace(GewichtNetto, ",", ".") & ", " & Replace(gewichttara, ",", ".") & ", " & Replace(einheiten, ",", ".") & ", " & LagerOrt & "," & Replace(LagerKosten, ",", ".") & ")"
            
    Else
              sql = "INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, PreisAusgang, PreisEingang, Ausgang, Eingang, Datum, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten, Lagerort)" & _
            " VALUES ('" & VorgangType & "'," & Vorgangsnummer & "," & ArtNr & "," & Replace(EKPreis, ",", ".") & ", 0, " & Replace(-1 * Stk, ",", ".") & ", 0, " & makeSQLDate(Datum) & ", " & Replace(-1 * GewichtBrutto, ",", ".") & ", " & Replace(-1 * GewichtNetto, ",", ".") & ", " & Replace(-1 * gewichttara, ",", ".") & ", " & Replace(-1 * einheiten, ",", ".") & ", " & LagerOrt & ")"
    End If
    
   Call writeLog("TRY" & sql)
   DoCmd.RunSQL sql
   Call writeLog("DONE " & sql)
   
   Dim AktuellerWert: AktuellerWert = getEinstandsPreis(ArtNr, LagerOrt)
   
    
  'lagerstand von den betroffenen artikeln aktualisieren
   Call CreateLagerbestandAndIncrease(ArtNr, _
                                      Stk, _
                                      LagerOrt, _
                                      GewichtBrutto, _
                                      GewichtNetto, _
                                      gewichttara, _
                                      einheiten, _
                                      AktuellerWert, _
                                      LagerKosten)
   DoCmd.SetWarnings True
End Sub


'Einfache Lagerbuchung in Tabelle Lagerbestand
Sub CreateLagerbestandAndIncrease(ByVal ArtNr, ByVal Stk As Double, _
                                  ByVal LagerOrt As Integer, _
                                  ByVal GewichtBrutto, _
                                  ByVal GewichtNetto, _
                                  ByVal gewichttara, _
                                  ByVal einheiten, _
                                  ByVal AktuellerWert, _
                                  ByVal LagerKosten)
    
     Dim rsExistsLager, sql
     DoCmd.SetWarnings False
     'Dim AktuellerWert As Double 'kalkulieren Einstandspreis
     'AktuellerWert = getEinstandsPreis(ArtNR, LagerOrt)
     
     
    If LagerOrt < 0 Or IsNull(LagerOrt) Then LagerOrt = 0
     
     
     Set rsExistsLager = CurrentDb.openRecordset("select ArtNr from [grArtikel-Lagerbestand] " & _
        " Where lagerOrt= " & LagerOrt & " and ArtNR = " & ArtNr, dbOpenDynaset, dbSeeChanges)
     ' create new record 'Warning: the Update is done afterwards
     If rsExistsLager.EOF Then 'no lagerbestand info
           sql = "Insert Into [grArtikel-Lagerbestand] (Datum, ArtNR, LagerOrt, LagerBestand, ReserviertStk, MaxStk, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten, AktuellerWert, LagerKosten) " & _
                 " values (Date(), " & ArtNr & " ," & LagerOrt & ",0 , 0, 0, 0, 0, 0, 0, 0, 0)"
           Call writeLog("TRY " & sql)
           DoCmd.RunSQL sql
           Call writeLog("DONE " & sql)
     End If
     
      ' at the end
      sql = "UPDATE [grArtikel-Lagerbestand] Set " & _
      "  lagerBestand = lagerBestand + " & Replace(Stk, ",", ".") & _
      ", GewichtBrutto = GewichtBrutto + " & Replace(GewichtBrutto, ",", ".") & _
      ", GewichtNetto = GewichtNetto + " & Replace(GewichtNetto, ",", ".") & _
      ", GewichtTara = GewichtTara + " & Replace(gewichttara, ",", ".") & _
      ", Einheiten = Einheiten + " & Replace(einheiten, ",", ".") & _
      ", AktuellerWert = " & Replace(AktuellerWert, ",", ".") & _
      ", LagerKosten = LagerKosten + " & Replace(LagerKosten, ",", ".") & _
      " where  lagerOrt= " & LagerOrt & " and  ArtNr = " & ArtNr
      
      Call writeLog("TRY " & sql)
      DoCmd.RunSQL sql
      Call writeLog("DONE " & sql)
      DoCmd.SetWarnings True
End Sub

Public Function maxBestand(real1, real2) As Double
      maxBestand = real2
      If real1 > real2 Then
       maxBestand = real1
      End If
End Function

'Liefert die Lagermenge in allen Läger
Public Function getLagerBestandArtikel(ByVal ArtNr As Variant) As Double

    If IsNull(ArtNr) Then
       getLagerBestandArtikel = 0: Exit Function
    End If
    
     Dim rs As Recordset
     Dim sql As String
     sql = "select sum(lagerbestand) as lB from [grArtikel-Lagerbestand] where ArtNR = " & ArtNr
     Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
     If Not rs.EOF And Not IsNull(rs("lB")) Then
       getLagerBestandArtikel = rs("lB")
     Else
       getLagerBestandArtikel = -9999999 'egal ' wird nicht lagerbestand geführt
     End If
     
     rs.Close
     Set rs = Nothing
  
End Function


'Liefert die Lagermenge in bestimmten Lager an bestimmten DAtum
Public Function getLagerBestandArtikelAnDatum( _
  ByVal ArtNr As Variant, _
  ByVal LagerOrt As String, _
  ByVal Datum As Date, _
  ByVal ergebnisSpalte As String) As Double

    If IsNull(ArtNr) Then
       getLagerBestandArtikelAnDatum = 0: Exit Function
    End If
    
     Dim rs As Recordset
     Dim sql As String
     sql = "select a." & ergebnisSpalte & " as lB from " & _
     " (SELECT   Sum([Eingang]-[Ausgang]) AS Bestand, Sum([grartikel-lagerbewegung].LagerKosten) AS LagerKosten, " & _
     " Sum([grartikel-lagerbewegung].Einheiten*iif(Ausgang>0,-1,1)) AS Einheiten, " & _
     " Sum([grartikel-lagerbewegung].GewichtBrutto*iif(Ausgang>0,-1,1)) AS GewichtBrutto, " & _
     " Sum([grartikel-lagerbewegung].GewichtNetto*iif(Ausgang>0,-1,1)) AS GewichtNetto, " & _
     " Sum([grartikel-lagerbewegung].GewichtTara*iif(Ausgang>0,-1,1)) AS GewichtTara " & _
     " FROM [grartikel-lagerbewegung] " & _
     " where ArtNR = " & ArtNr & " and LagerOrt = " & LagerOrt & " And Datum < " & toSQLDate(Datum) & _
     " GROUP BY  ArtNr,  Lagerort) a  "
     Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
     If Not rs.EOF And Not IsNull(rs("lB")) Then
       getLagerBestandArtikelAnDatum = rs("lB")
     Else
       getLagerBestandArtikelAnDatum = 0 'egal ' wird nicht lagerbestand geführt
     End If
     
     rs.Close
     Set rs = Nothing
  
End Function





'Liefert Einstandpreis pro Artikel, ohne Lagerberücksichtigung! nur Lagereingänge!
Public Function getEinstandsPreis(ByVal ArtNr, Optional LagerOrt = 0) As Double
         If Not IsNumeric(ArtNr) Then
             getEinstandsPreis = 0
             Exit Function
         End If
        
        Dim rs, sql
        
        'Methode I nur nach Lager Eingänge!
        sql = " SELECT [grArtikel-LagerBewegung].ArtNr, " & _
        " Sum((iif([Eingang]=0,1,[Eingang])*[PreisEingang]-[Ausgang]*[PreisAusgang]))/Sum(([Eingang]-[Ausgang])) AS DurchschnEKPreis, " & _
        " Sum(([Eingang]*[PreisEingang]))/Sum(([Eingang])) AS DurchschnEKPreisNurEK, " & _
        " Sum(([Eingang]-[Ausgang])) AS Bestand , " & _
        " Sum(([Eingang])) AS BestandNurEK " & _
        " FROM [grArtikel-LagerBewegung] " & _
        " WHERE (VorgangsTyp=""LE"") AND ArtNr = " & ArtNr
        
        If LagerOrt & "" <> "0" Then
                sql = sql & " AND LagerOrt = " & LagerOrt
        End If
        
        sql = sql & " GROUP BY [grArtikel-LagerBewegung].ArtNr"
        
        Debug.Print sql
        Set rs = CurrentDb.openRecordset(sql)
        
         getEinstandsPreis = 0
         getEinstandsPreis = getEKPreis(ArtNr)
         
           If Not rs.EOF Then
                If rs("Bestand") <= 0 Then
                   'If rs("BestandNurEK") > 0 Then
                   '    getEinstandsPreis = Round(rs("DurchschnEKPreisNurEK"), 2)
                   'End If
               Else
                    If IsNull(rs("DurchschnEKPreis")) Then
                         getEinstandsPreis = Round(0, 2)
                    Else
                         getEinstandsPreis = Round(rs("DurchschnEKPreis"), 2)
                    End If
              End If
           End If
           
        rs.Close
        Set rs = Nothing
End Function

'Liefert Lagerkosten/Enstehungskosten pro Artikel je nach Lager für einen bestimmten Zeitraum
Public Function getLagerKosten(ByVal ArtNr, ByVal LagerOrt, ByVal FromDatum As Date, ByVal ToDatum As Date) As Double
         If Not IsNumeric(ArtNr) Then
             getLagerKosten = 0
             Exit Function
         End If
        
        Dim rs, sql
        
        'Methode I nur nach Lagerkosten
        sql = " SELECT [grArtikel-LagerBewegung].ArtNr, " & _
        " Sum([PreisEingang]) AS LagerKosten, " & _
        " FROM [grArtikel-LagerBewegung] " & _
        " WHERE (VorgangsTyp=""" & LAGER_KOSTEN & """) AND ArtNr = " & ArtNr
        
        
        sql = sql & " AND LagerOrt = " & LagerOrt
        sql = sql & " AND Datum between " & toSQLDate(FromDatum) & " and " & toSQLDate(ToDatum)
        sql = sql & " GROUP BY [grArtikel-LagerBewegung].ArtNr"
        
        Debug.Print sql
        Set rs = CurrentDb.openRecordset(sql)
        
         getLagerKosten = 0
         getLagerKosten = getEKPreis(ArtNr)
         
           If Not rs.EOF Then
              getLagerKosten = Round(rs("LagerKosten"), 2)
           End If
           
        rs.Close
        Set rs = Nothing
End Function


' erstellt eine Nachricht ja nachdem vorgangTyp
Function checkVorgangForWarnings(ByVal Vorgangtyp As String, ByVal VorgangNummer As String) As String
Dim sql, rs

  checkVorgangForWarnings = ""
  If Vorgangtyp = "LI" Or Vorgangtyp = "AU" Then
   'ccheck if closed
    
    sql = "select anElba from " & getVorgangTableForType(Vorgangtyp) & " where nummer  = " & VorgangNummer
   Set rs = CurrentDb.openRecordset(sql)
   If Not rs.EOF Then
            If rs("anElba") <> 0 Then
                        checkVorgangForWarnings = "Abgeschlossen"
                        rs.Close
                        Exit Function
            End If
    End If
   
   
     If Not checkIfVorgangLagerBestandOK(Vorgangtyp, VorgangNummer) Then
          checkVorgangForWarnings = "Lagerbest fehlt"
      Else
          checkVorgangForWarnings = "Lagerbest OK"
     End If
  End If

End Function

'prüft ob der lagerbestand ist genug um den auftrag zu akzeptieren
Function checkIfVorgangLagerBestandOK(Vorgangtyp As String, VorgangNummer As String) As Boolean
        
        Dim sql, rs
        
        sql = "SELECT [buchAuftrag-Artikel].RechNr FROM [buchAuftrag-Artikel] WHERE RechNr=" & VorgangNummer & " AND (((getlagerbestandartikel([ArtNr])-[Stk])<0))"
        Set rs = CurrentDb.openRecordset(sql)
        If rs.EOF Then
             checkIfVorgangLagerBestandOK = True
        Else
             checkIfVorgangLagerBestandOK = False
        End If

End Function


Public Function makeLieferantenPreis(ByVal ArtNr, ByVal LieferantNR, ByVal EKPreis, Optional Bezeichnung As Variant = "")
      makeLieferantenPreis = True
      err.Clear
      
      If LieferantNR = Null Or LieferantNR = "" Or LieferantNR < 1 Then Exit Function
         Dim rs As Recordset
         Set rs = CurrentDb.openRecordset("lieferantenArtikel-Preise", dbOpenDynaset, dbSeeChanges)
         
         DoCmd.SetWarnings False
         On Error GoTo newPreis
         Dim PreisId  As Long
        
    
            rs.FindFirst "ArtikelNr =" & ArtNr & " AND LieferantNr = " & LieferantNR
            If rs.nomatch Then ' add new
newPreis:
                   On Error GoTo 0
                   PreisId = nextId("[lieferantenArtikel-Preise]", "PreisID")
                    DoCmd.SetWarnings False
                   DoCmd.RunSQL "insert into [lieferantenArtikel-Preise] (PreisId, ArtikelNr, LieferantNR, EKPreis, Bezeichnung) " & _
                   " values (" & PreisId & "," & ArtNr & "," & LieferantNR & "," & Replace(EKPreis, ",", ".") & ",'" & Bezeichnung & "')"
                    DoCmd.SetWarnings True
        Else ' update
                    On Error GoTo 0
                     PreisId = rs("PreisID")
                     rs.Close
                     DoCmd.RunSQL "update [lieferantenArtikel-Preise] set EKPreis = " & Replace(EKPreis, ",", ".") & " where PreisId=" & PreisId

            End If
        On Error GoTo 0
        DoCmd.SetWarnings True
End Function
