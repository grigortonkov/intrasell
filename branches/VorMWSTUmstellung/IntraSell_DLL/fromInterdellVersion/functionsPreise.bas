Attribute VB_Name = "functionsPreise"
Option Compare Database
Option Explicit

'for compatibility reasons
Const dbOpenDynaset = 0
Dim Preise As IntraSell.IntraSellPreise
Public Const VORGANG_TYP_LAU = "LAU"
Public Const VORGANG_TYP_LI = "LI"
Public Const VORGANG_TYP_AR = "AR"
Public Const VORGANG_TYP_AN = "AN"
Public Const VORGANG_TYP_AU = "AU"

Function openRecordset(sql, something)
 
    If InStr(sql, "INSERT") > 0 Or InStr(sql, "UPDATE") > 0 Or InStr(sql, "DELETE") > 0 Then
          DoCmd.SetWarnings False
          DoCmd.RunSQL sql
          DoCmd.SetWarnings True
          Exit Function
    End If
  
  err.Clear
  On Error Resume Next
  Dim rs1
  
  Set rs1 = CurrentDb.openRecordset(sql) ', dbOpenDynaset) ')
  If err.Number = 3622 Then 'use identity column for replicated sql tables::You must use the dbSeeChanges option with OpenRecordset when accessing a SQL Server table that has an IDENTITY column.
      Set rs1 = CurrentDb.openRecordset(sql, , dbSeeChanges)
  End If
  Set openRecordset = rs1
  On Error GoTo 0
End Function

'THIS FUNCTIONS ARE COPIED IN THE WEBSHOP MODULE
'PLEASE MAKE WHEN MAKING CHANGES HERE COPY THE MODULE TO THE WEB SHOP TOO

'Start Copy here to the end of module
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See www.vegsys.com for last changes.
'===========================================================================

'*****************************************************************
' returns the special preis if defined
' when not defined returns 0
'*****************************************************************
 Function getSpecialPreis(ByVal IDNR, ByVal ArtNr)
    getSpecialPreis = 0
     Dim sql, rs
     sql = "select * from [grArtikel-VKPreisPerSelection] where preislistename in " & _
     " (select preisliste from [ofAdressen-settings] where IdNR = " & IDNR & ") and artnr = " & ArtNr
     Set rs = openRecordset(sql, dbOpenDynaset)
     If Not rs.EOF Then
      'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
      getSpecialPreis = rs("vkpreis")
     End If
     rs.Close
 End Function
 
'*****************************************************************
' returns the  min or max and VK or EK PReis from LieferantenArtikelPreis
'*****************************************************************
 Public Function getLieferantPreis(ByVal ArtNr, ByVal boolMinPreis, ByVal boolVKPreis)
    getLieferantPreis = 0
     Dim sql, rs
     
     If boolMinPreis Then
         sql = "select min(PreisField) as mPREIS from [lieferantenArtikel-Preise] where PreisField>0 and artikelnr = " & ArtNr
     Else
         sql = "select max(PreisField) as mPREIS from [lieferantenArtikel-Preise] where PreisField>0 and artikelnr = " & ArtNr
     End If
     
     If boolVKPreis Then sql = Replace(sql, "PreisField", "VKpreis") Else sql = Replace(sql, "PreisField", "EKpreis")
     
     Set rs = openRecordset(sql, dbOpenDynaset)
     If Not rs.EOF Then
      'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
      getLieferantPreis = rs("mPREIS")
     End If
     rs.Close
 End Function
 
 
 '*****************************************************************
' more compilated function that calculates the price because of priority
' returns the special preis if defined
' when not defined returns 0
'*****************************************************************
 Public Function getPreis(ByVal IDNR, ByVal ArtNr, ByVal Stk)
 
 
 If ArtNr & "" = "" Then Exit Function
 
     If Preise Is Nothing Then   ' init
        
        On Error Resume Next
        Set Preise = New IntraSell.IntraSellPreise
    
        If err.Number <> 0 Then
            MsgBox "Die IntraSell DLL konnte nicht gefunden werden!" & err.Description, vbCritical
            getPreis = 0
            err.Number = 0
            On Error GoTo 0
            Exit Function
        End If
        On Error GoTo 0
        'init
            Preise.Init (ConnStringIntraSellData)
     End If

    getPreis = Preise.getPreis(IDNR, ArtNr, Stk)
 End Function


'*****************************************************************
'gibt den VKpreis eines Artikels zurück, egal von besteller
'falls aufschlag auf EKpreis nach KAtegorie existiert dann wird es aufgeschlagen
'*****************************************************************
Function getBasisVKPreis(ByVal ArtNr)
     Dim sql, rs, ArtKatNr
     
     sql = "select ArtKatNr from grArtikel where artNr = " & ArtNr
     Set rs = openRecordset(sql, dbOpenDynaset)
     ArtKatNr = rs("ArtKAtNR")
     
     sql = "select * from [grArtikel ] where artnr=" & ArtNr
     Set rs = openRecordset(sql, dbOpenDynaset)
     getBasisVKPreis = 0
      
     If Not rs.EOF Then
       Dim Aufschlag: Aufschlag = getAufschlagEKpreisKategorie(ArtKatNr)
        If Aufschlag <> 0 Then
           getBasisVKPreis = getEKPreis(ArtNr) * (1 + Aufschlag)
        Else
           If IsNull(rs("PreisATS")) Then
               getBasisVKPreis = 0
           Else
               getBasisVKPreis = rs("PreisATS")
           End If
        End If
     End If
     
End Function

'*****************************************************************
'*****************************************************************
Function getEKPreis(ByVal ArtNr)
     Dim sql, rs

     sql = "select * from [grArtikel] where artnr=" & ArtNr
     Set rs = openRecordset(sql, dbOpenDynaset)
      getEKPreis = 0
     If Not rs.EOF Then
       If rs("EKPreis") <= 0 Then 'not defined
        getEKPreis = makeEKPreisVonLieferant(ArtNr)
       Else
        If IsNull(rs("EKPreis")) Then
            getEKPreis = 0
        Else
            getEKPreis = rs("EKPreis")
        End If
       End If
     End If
     rs.Close
End Function



'*****************************************************************
'liefert Bestpreis aus der lieferanten Preise Tabelle
'*****************************************************************
Function makeEKPreisVonLieferant(ByVal ArtNr)
     makeEKPreisVonLieferant = 0
     If ArtNr & "" = "" Then Exit Function
     Dim sql, rs
     sql = "select EKPreis from [lieferantenArtikel-Preise] where ekpreis>0 and artikelnr=" & ArtNr & " ORDER BY Prioritaet, EKPreis"
     Set rs = openRecordset(sql, dbOpenDynaset)
     
     If Not rs.EOF Then
        If IsNull(rs("EKPreis")) Then
           makeEKPreisVonLieferant = 0
        Else
           makeEKPreisVonLieferant = rs("EKPreis")
        End If
     End If
     rs.Close
End Function

'*****************************************************************
'returns the name of the best lieferant
'*****************************************************************
Public Function getBestLieferant(ByVal ArtNr)
    getBestLieferant = NOT_AVAILABLE
    If ArtNr & "" = "" Then Exit Function
    
     Dim sql, rs
     sql = "select * from [lieferantenArtikel-Preise] where artikelnr=" & ArtNr & " ORDER BY prioritaet, EKPreis"
     Set rs = openRecordset(sql, dbOpenDynaset)
      
     If Not rs.EOF Then
            sql = "select * from lieferantenAdressen where idnr=" & rs("LieferantNr")
            Set rs = openRecordset(sql, dbOpenDynaset)
                If Not rs.EOF Then
                    getBestLieferant = rs("Firma")
                End If
     End If
     rs.Close
End Function
'*****************************************************************
'returns the lagerinfo of the best lieferant
'*****************************************************************
Public Function getLieferantLagerInfo(ByVal ArtNr)

  If IsNull(ArtNr) Then
        getLieferantLagerInfo = ""
        Exit Function
  End If

     Dim sql, rs
     sql = "select * from [grArtikel] where artnr=" & ArtNr
     Set rs = openRecordset(sql, dbOpenDynaset)
     If Not rs.EOF Then
            If rs("Bezeichnung1") & "" <> "" Then
                        getLieferantLagerInfo = rs("Bezeichnung1")
             End If
     End If
     
     sql = "select * from [lieferantenArtikel-Preise] where artikelnr=" & ArtNr & " ORDER BY prioritaet, EKPreis"
     Set rs = openRecordset(sql, dbOpenDynaset)
      getLieferantLagerInfo = NOT_AVAILABLE
     If Not rs.EOF Then
                    getLieferantLagerInfo = rs("Lagerinfo")
     End If
     rs.Close
End Function

'*****************************************************************
'*****************************************************************
Function getAufschlagEKpreisKategorie(ArtKatNr)
Dim sql, rs
     sql = " select * from [grArtikel-Kategorien] where " & _
           " (ArtKatNr =" & ArtKatNr & ")" & _
           " and  Aufschlag > 0 "
     'Debug.Print sql
    Set rs = openRecordset(sql, dbOpenDynaset)
    
    If Not rs.EOF Then
       getAufschlagEKpreisKategorie = rs("Aufschlag")
    Else 'recursion
      If ArtKatNr > 0 Then ' not hte main kat
         sql = "select * from [grArtikel-KAtegorien] where ArtKAtNR =" & ArtKatNr
         Set rs = openRecordset(sql, dbOpenDynaset)
            If Not rs.EOF Then
               getAufschlagEKpreisKategorie = getAufschlagEKpreisKategorie(rs("ArtKatNrParent"))
            End If
        End If
    End If
End Function


'*****************************************************************
' makeBruttoPreis for any preis without artnr
'*****************************************************************
Function makeBruttoPreis(ByVal Preis, ByVal MwstGroup, ByVal Land)
' Dim Land: Land = Session("LAND")
 If Land = "" Then Land = "AT"
 makeBruttoPreis = Preis * (1 + getVAT(Land, MwstGroup) / 100)
End Function

'*****************************************************************
'need only the artNr AND Stk /for staffelung/ to create preis / +MWST, VAT/
'*****************************************************************
Function makeBruttoPreis2(ByVal ArtNr, ByVal Stk, ByVal Land)
If Stk = "" Then Stk = 1
Dim sql, rs, preisManyPieces
Set rs = openRecordset("select * from grArtikel where ArtNr=" & ArtNr, dbOpenDynaset)
If rs.EOF Then
    makeBruttoPreis2 = 0
Else
    Dim preis1stk:  preis1stk = makeNettoPreis(ArtNr, Stk, 0)
    makeBruttoPreis2 = makeBruttoPreis(preis1stk, rs("MWST"), Land)
End If
rs.Close
End Function


'*****************************************************************
' makeNettoPreis
' need only the artNr AND Stk /for staffelung/
'*****************************************************************
Function makeNettoPreis(ArtNr, Stk, IDNR)
Dim sql, rs, preisManyPieces
Set rs = openRecordset("select * from grArtikel where ArtNr=" & ArtNr, dbOpenDynaset)
If rs.EOF Then
    makeNettoPreis = 0
Else
   Dim preis1stk:  preis1stk = getPreis(IDNR, ArtNr, Stk) 'rs("PreisATS")
   sql = "select * from [grArtikel-Staffelpreise] Where ArtNr = " & ArtNr & " AND stkAb <" & Stk
   Dim rsRabatt: Set rsRabatt = openRecordset(sql, dbOpenDynaset)
   Dim prozent: prozent = 0
   If Not rsRabatt.EOF Then prozent = rsRabatt("ProzentRabatt")
  
    
    preisManyPieces = preis1stk * 100 / (100 + prozent)
    makeNettoPreis = preisManyPieces
End If
rs.Close
End Function



'*****************************************************************
' getVAT
' MWSTGROUP -0, 1, or 2
'*****************************************************************
Function getVAT(Land, MwstGroup)
 If Land = "" Then Land = "AT"
 Land = UCase(Land)
 Dim sql, rs
 sql = "SELECT * FROM grMWST where Land='" & Land & "' AND MWSTGROUP=" & MwstGroup
 'Response.Write sql
 Set rs = openRecordset(sql, dbOpenDynaset)
 If Not rs.EOF Then
    getVAT = rs("Prozent")
 Else
    getVAT = 206
    getVAT = "Error: Die MWST Information fehlt für Land [" & Land & "]!"
 
 End If
 rs.Close
 ' if LAND = "AT" THEN getVAT=20
 ' if LAND = "DE" THEN  getVAT=16
 ' if LAND = "US" THEN getVAT=15
End Function

'*****************************************************************
' getVAT
'*****************************************************************
Function getClientLand(IDNR)
  Dim plzLAND, clientPLZ
   plzLAND = TABLEVALUE("ofAdressen", "IDNR", IDNR, "LAND")
 'response.write "PLZLand =" & PLZLand
   If plzLAND = 43 Then getClientLand = "AT"
   If plzLAND = 49 Then getClientLand = "DE"
   If plzLAND = 359 Then getClientLand = "BG"
   If plzLAND = 1 Then getClientLand = "US"
End Function



'*****************************************************************
' For example Converts one Auftrag to Rechnung
' returns the nummer of the created new OrderType or 0 of failed
'*****************************************************************
Public Function convertFromTo(FromOrder, ToOrder, FromNummer, NewKundNr)
        Dim sql
        Dim rs
        Dim tableNameFrom, tableNameFromProducts, tableNameTo, tableNameToProducts
        
        tableNameFrom = getVorgangTableForType(FromOrder)
        tableNameFromProducts = getVorgangArtikelTableForType(FromOrder)
        
        tableNameTo = getVorgangTableForType(ToOrder)
        tableNameToProducts = getVorgangArtikelTableForType(ToOrder)
        
        Dim IDNR
        sql = "select * from " & tableNameFrom & " where nummer =" & FromNummer
        Set rs = openRecordset(sql, "")
        If rs.EOF Then
            convertFromTo = 0
            Exit Function
         Else
           IDNR = rs("Kundnr")
        End If
        rs.Close
        
        Dim nextRechnungNummer
        nextRechnungNummer = getNewVorgangNummer(ToOrder, IDNR)
     
        If ToOrder = VORGANG_TYP_LAU And FromOrder <> VORGANG_TYP_LAU Then  ' lieferanten Auftrag
            sql = "INSERT INTO " & tableNameTo & " ( Nummer, KundNr, Datum, MitarbeiterNr, LieferantNr, Notiz, Summe, Bezahlt, Ausgedrukt, anElba, ZahlungsBedungung, Woher, SummeMWST, SummeBrutto ) " & _
                      " SELECT " & nextRechnungNummer & " , " & NewKundNr & ", Date(), MitarbeiterNr, " & NewKundNr & ", Notiz, Summe, 0, 0, 0, ZahlungsBedungung, '" & FromOrder & FromNummer & "', SummeMWST, SummeBrutto " & _
                      " FROM " & tableNameFrom & _
                     " WHERE Nummer = " & FromNummer
        Else
            sql = "INSERT INTO " & tableNameTo & " ( Nummer, KundNr, Datum, MitarbeiterNr, LieferantNr, Notiz, Summe, Bezahlt, Ausgedrukt, anElba, ZahlungsBedungung, Woher, SummeMWST, SummeBrutto ) " & _
                      " SELECT " & nextRechnungNummer & " , " & NewKundNr & ", Date(), MitarbeiterNr, LieferantNr, Notiz, Summe, 0, 0, 0, ZahlungsBedungung, '" & FromOrder & FromNummer & "', SummeMWST, SummeBrutto " & _
                      " FROM " & tableNameFrom & _
                     " WHERE Nummer = " & FromNummer
        End If
        
        Call openRecordset(sql, "")
              
        'Positionen
          If ToOrder = VORGANG_TYP_LAU And FromOrder <> VORGANG_TYP_LAU Then   ' lieferanten Auftrag
                          sql = "INSERT INTO [" & tableNameToProducts & "] ( RechNr, ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, Herkunft, Incoterm,  Spezifikation ) " & _
                      " SELECT " & nextRechnungNummer & ", ArtNR, EKpreis, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation  " & _
                       " FROM [" & tableNameFromProducts & "] WHERE " & _
                       " RechNr=" & FromNummer
          Else
                sql = "INSERT INTO [" & tableNameToProducts & "] ( RechNr, ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation ) " & _
                      " SELECT " & nextRechnungNummer & ", ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation  " & _
                       " FROM [" & tableNameFromProducts & "] WHERE " & _
                       " RechNr=" & FromNummer
         End If
         
         
         
        'response.write SQL
        Call openRecordset(sql, "")
        
            sql = "INSERT INTO buchVorgaengeEigenschaften ( VorgangTyp, Nummer, Name, [Value] )" & _
            " SELECT '" & ToOrder & "', " & nextRechnungNummer & ", Name, [Value] " & _
            " FROM buchVorgaengeEigenschaften " & _
            " WHERE VorgangTyp='" & FromOrder & "'  AND Nummer=" & FromNummer & ";"
         Call openRecordset(sql, "")
         
        'set where the vorgang goes to
        sql = "UPDATE " & tableNameFrom & " SET Wohin = '" & ToOrder & nextRechnungNummer & "'" & _
                " WHERE Nummer = " & FromNummer
        'response.write SQL
        Call openRecordset(sql, "")
        'response.write "Converting was OK!"
        convertFromTo = nextRechnungNummer
End Function



'=======================================================
'=======================================================
Public Function getVorgangTableForType(ByVal Typ)
Select Case Typ
    Case "AN"
        getVorgangTableForType = "buchAngebot"
    Case "AU"
        getVorgangTableForType = "buchAuftrag"
    Case "RÜ"
        getVorgangTableForType = "buchRuestschein"
    Case "LI"
        getVorgangTableForType = "buchLieferschein"
    Case "AR"
        getVorgangTableForType = "buchRechnung"
    Case "RE"
        getVorgangTableForType = "buchRetourwaren"
    Case "GU"
        getVorgangTableForType = "buchGutschrift"
        
    Case VORGANG_TYP_LAU
        getVorgangTableForType = "buchLieferantAuftrag"
        
  End Select
End Function

'*****************************************************************
'*****************************************************************
Public Function getVorgangArtikelTableForType(ByVal Typ)
Select Case Typ
    Case "AN"
        getVorgangArtikelTableForType = "buchAngebot-Artikel"
    Case "AU"
        getVorgangArtikelTableForType = "buchAuftrag-Artikel"
    Case "RÜ"
        getVorgangArtikelTableForType = "buchRuestschein-Artikel"
    Case "LI"
        getVorgangArtikelTableForType = "buchLieferschein-Artikel"
    Case "AR"
        getVorgangArtikelTableForType = "buchRech-Artikel"
    Case "RE"
        getVorgangArtikelTableForType = "buchRetourwaren-Artikel"
    Case "GU"
        getVorgangArtikelTableForType = "buchGutschrift-Artikel"
  
    Case VORGANG_TYP_LAU
        getVorgangArtikelTableForType = "buchLieferantAuftrag-Artikel"
        
  End Select
End Function

'*****************************************************************
'*****************************************************************
Public Function getVarNameForType(ByVal Typ)
Select Case Typ
    Case "AN"
        getVarNameForType = "letzteAngebotNummer"
    Case "AU"
        getVarNameForType = "letzteAuftragNummer"
    Case "RÜ"
        getVarNameForType = "letzteRüstscheinNummer"
    Case "LI"
        getVarNameForType = "letzteLieferscheinNummer"
    Case "AR"
        getVarNameForType = "letzteRechnungsNummer"
    Case "RE"
        getVarNameForType = "letzteRetourwarenNummer"
    Case "GU"
        getVarNameForType = "letzteGutschriftNummer"
        
    Case VORGANG_TYP_LAU
        getVarNameForType = "letzteLieferantAuftragNummer"
        
  End Select
End Function

'=======================================================
'liefert den namen für den Ausdruck zurück
'=======================================================
Public Function getDruckForType(ByVal Typ)
Select Case Typ
    Case "AN"
        getDruckForType = "Angebot"
    Case "AU"
        getDruckForType = "Auftrag"
    Case "RÜ"
        getDruckForType = "Rüstschein"
    Case "LI"
        getDruckForType = "Lieferschein"
    Case "AR"
        getDruckForType = "Rechnung"
    Case "RE"
        getDruckForType = "Rutourwaren"
    Case "GU"
        getDruckForType = "Gutschrift"
        
        
    Case VORGANG_TYP_LAU
        getDruckForType = "Auftrag"
        
  End Select
End Function
 
 
'=======================================================
'get the next free vorgangnummer
'first looks if the kundenGruppe needs special number curcle and then get the new one from the free
'=======================================================
Public Function getNewVorgangNummer(ByVal Typ As String, ByVal IDNR As Long)
Dim Von, Bis, sql
Dim rs
Von = 0
Bis = 9999999

  'if kundengruppe defined
  Set rs = openRecordset("select VorgangNrKreisvon, VorgangNrKreisbis from [ofAdressen-KundenGruppen] where gruppe in (select kundengruppe from [ofadressen-settings]  where idnr = " & IDNR & ")", "")
  If Not rs.EOF Then 'kundengruppe is definiert
                  Von = rs("VorgangNrKreisvon")
                  Bis = rs("VorgangNrKreisbis")
                'End If
                Set rs = openRecordset("select * from " & getVorgangTableForType(Typ) & _
                 "  where nummer>=" & Von & " AND nummer<= " & Bis & " order by nummer desc", dbOpenDynaset)
                'rs.Sort = "nummer"
                Set rs = rs.openRecordset()
                    If rs.EOF Then
                       getNewVorgangNummer = Von
                    Else
                      'rs.MoveLast
                      getNewVorgangNummer = rs("Nummer") + 1
                    End If
                rs.Close
   Else
                'wenn keine gruppe definiert ' standart vorgang
                Dim letzteNummer
                Dim vname: vname = getVarNameForType(Typ)
                
                letzteNummer = varValue(vname)
                'Die Nummer erhöhen
                Call SETVARVALUE(vname, letzteNummer + 1)
                
                'prüfen ob die Nummer besetzt ist
                Set rs = openRecordset("select * from " & getVorgangTableForType(Typ) & " where nummer =" & (letzteNummer + 1), dbOpenDynaset)
                If rs.EOF Then
                    getNewVorgangNummer = letzteNummer + 1
                Else 'wieder erhöhen
                    getNewVorgangNummer = getNewVorgangNummer(Typ, IDNR)
                End If
                
    End If

End Function




