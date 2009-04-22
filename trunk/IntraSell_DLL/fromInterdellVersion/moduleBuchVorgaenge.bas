Attribute VB_Name = "moduleBuchVorgaenge"
Option Compare Database
Option Explicit
'=======================================================
' öffnet eine Übersicht mit den nicht abgeschlossenen Vorgänge um
' diese in einem neuen Vorgang zu umwandeln
' geeignet nur für die Benutzeroberfläche
'=======================================================
Sub openVorgänge(ByVal KundenNr, ByVal Nummer, ByVal formName)

  VorgängeSetup formName, KundenNr
 
  Dim rs As Recordset
  Set rs = CurrentDb.openRecordset("buchVorgaenge", dbOpenDynaset, dbSeeChanges)
  If Not rs.EOF Then
        DoCmd.OpenForm "buchVorgänge", acNormal, , "[IdNR] = " & KundenNr
        Forms![buchVorgänge]![Nummer] = Nummer
        Forms![buchVorgänge]![Typ] = formName
        Forms![buchVorgänge]![listVorgang].Requery
        'close the panel if there are no vorgange
   End If

End Sub
'=======================================================
'inserts the open (nicht benutzten) vorgange in die Tabelle buchVorgänge
'=======================================================
Private Sub insert(Where As String, Typ As String, IDNR)
        DoCmd.SetWarnings False
        Dim sql
        sql = " INSERT INTO buchVorgaenge (Typ, RechNr, KundNr, Datum, Summe, Bezahlt, Ausgedrukt, anElba )" & _
                " SELECT '" & Typ & "' AS t, Nummer, KundNr, Datum, Summe, Bezahlt, 0, 0 " & _
                " FROM " & Where & _
                " WHERE KundNr = " & IDNR & _
                " AND Wohin is Null AND anElba=0;"
        
        
        Call writeLog("TRY " & sql)
        DoCmd.RunSQL sql
        Call writeLog("TRY " & sql)
        
        DoCmd.SetWarnings True
End Sub
'=======================================================
'setzt die mögliche umwandlungen fest
' was nach was konvertiert werden kann ' siehe case klause
'=======================================================
Public Sub VorgängeSetup(formName, IDNR)
 Dim rs As Recordset
Dim query

DoCmd.SetWarnings False
query = "DELETE buchVorgaenge.* " & _
        " FROM buchVorgaenge;"
DoCmd.RunSQL query

Select Case formName
    Case "AU"
        insert "buchAngebot", "AN", IDNR
    Case "RÜ"
        insert "buchAngebot", "AN", IDNR
        insert "buchAuftrag", "AU", IDNR
    Case "LI"
        insert "buchAngebot", "AN", IDNR
        insert "buchAuftrag", "AU", IDNR
        insert "buchRuestschein", "RÜ", IDNR
    Case "AR"
        insert "buchAngebot", "AN", IDNR
        insert "buchAuftrag", "AU", IDNR
        insert "buchRuestschein", "RÜ", IDNR
        insert "buchLieferschein", "LI", IDNR
    Case "RE"
        insert "buchLieferschein", "LI", IDNR
    Case "GU"
        insert "buchRechnung", "AR", IDNR

    Case VORGANG_TYP_LAU
        insert "buchLieferantAuftrag", VORGANG_TYP_LAU, IDNR
        
  End Select
DoCmd.SetWarnings True
End Sub



'=======================================================
'=======================================================
Public Function setVorgangStatus(ByVal Vorgangtyp As String, ByVal VorgangNummer, ByVal Status) As Boolean

   'check if such a state exist
   
   
    Dim sql, rs
    sql = "select id from buchVorgaengeStatus where vorgangtyp = '" & Vorgangtyp & "' and status = '" & Status & "'"
    Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    If rs.EOF Then
         MsgBox "Definieren Sie Status " & Status & " in der buchVorgangStatus  Tabelle!", vbCritical
    End If
    rs.Close
    
    
     sql = "UPDATE " & getVorgangTableForType(Vorgangtyp) & " set status = '" & Status & "' where nummer=" & VorgangNummer
     DoCmd.SetWarnings False
     Call writeLog("TRY " & sql)
     DoCmd.RunSQL sql
     Call writeLog("DONE " & sql)
     DoCmd.SetWarnings True
     setVorgangStatus = True
End Function

'=======================================================
'=======================================================
Public Function checkForStorno(ByRef formVorgang As Form)

     If formVorgang![checkBox_ausgedruckt] <> 0 Or formVorgang![checkbox_anElba] <> 0 Then
        If formVorgang![txtVorgangType] = varValue("VORGANG_TYP_FUER_LAGER_ABGANG") Then
            'MsgBox "Nur Storno erlaubt!"
            formVorgang.Rech_Artikel.Locked = True
            formVorgang.Rech_Artikel.Enabled = False
            formVorgang.AllowEdits = False
            formVorgang.Caption = "Editieren nicht erlaubt"
        End If
     Else
        formVorgang.Rech_Artikel.Locked = False
        formVorgang.Rech_Artikel.Enabled = True
        formVorgang.AllowEdits = True
        formVorgang.Caption = "Editieren erlaubt"
    End If
End Function



'=======================================================
' storniet einen Vorgang
' die nummer wird auch freigegeben und dann wieder verwendet, aber nur wenn das die letzte nummer ist
'=======================================================
Public Function storno(ByVal Vorgangtyp As String, ByVal VorgangNummer) As Boolean

If IsNull(VorgangNummer) Then
   Exit Function
End If


    storno = False
    Dim sql, rs
     sql = "select *  from " & getVorgangTableForType(Vorgangtyp) & " where nummer =" & VorgangNummer
     Set rs = CurrentDb.openRecordset(sql)
     Dim Abgeschlossen
     If rs.EOF Then
            Exit Function
      Else
           Abgeschlossen = rs("anElba")
     End If
     
    
   If MsgBox("Möchten Sie " & Vorgangtyp & " # " & VorgangNummer & " stornieren?", vbYesNo) = vbYes Then
      DoCmd.SetWarnings False
      
        If Abgeschlossen <> 0 Then 'abgeschlossen
        
               If Vorgangtyp = varValue("VORGANG_TYP_FUER_LAGER_ABGANG") Then 'Lierschein
                       Call lagerEingang(VorgangNummer, Vorgangtyp)
               End If
              
                'If VorgangTyp = "RE" Or VorgangTyp = "RÜ" Then 'retourwaren oder rüestschein
                '        Call lagerAusgang(vorgangNummer, VorgangTyp)
                'End If

                If Vorgangtyp = "AR" And rs("Bezahlt") Then
                        Call makeKassaBuchEintrag(Now(), Vorgangtyp, Vorgangtyp & "-" & VorgangNummer, -1 * getSummeVorgang(Vorgangtyp, VorgangNummer))
                End If
         End If


     
      DoCmd.SetWarnings False
      
      'delete eigenschaften
      sql = "delete from [buchvorgaengeeigenschaften] where VorgangTyp='" & Vorgangtyp & "' and  Nummer =" & VorgangNummer
      DoCmd.RunSQL sql
      
      'delete pos
      sql = "delete from [" & getVorgangArtikelTableForType(Vorgangtyp) & "] where RechNr =" & VorgangNummer
      DoCmd.RunSQL sql
      
      'delete vorgang
      sql = "delete from " & getVorgangTableForType(Vorgangtyp) & " where nummer =" & VorgangNummer
      DoCmd.RunSQL sql


      DoCmd.SetWarnings True
      storno = True
   End If

End Function

'liefert die Brutto summe eines vorganges
Function getSummeVorgang(ByVal Vorgangtyp As String, ByVal VorgangNummer) As Double
     Dim rs, sql
     sql = "Select Sum([Stk]*[PreisATS_Brutto]) as Summe FROM [" & getVorgangArtikelTableForType(Vorgangtyp) & "] " & _
           " where RechNr =" & VorgangNummer
     Set rs = CurrentDb.openRecordset(sql)
     If rs.EOF Then
           getSummeVorgang = 0
     Else
         If IsNull(rs("Summe")) Then
             getSummeVorgang = 0
         Else
             getSummeVorgang = 0 + rs("Summe")
         End If
     End If
     rs.Close
     Set rs = Nothing
End Function


Public Sub setSummeVorgang(ByVal Vorgangtyp As String, ByVal VorgangNummer, Optional formName As String = "buchRechnung")
     Dim rs, sql
     sql = "Select sum([Stk]*[PreisATS]) as Summe, sum([Stk]*[PreisATS_Brutto]) as Summe_Brutto " & _
     " FROM [" & getVorgangArtikelTableForType(Vorgangtyp) & "] where RechNr =" & VorgangNummer
     Set rs = CurrentDb.openRecordset(sql)
     If Not rs.EOF Then
         If Not IsNull(rs("Summe")) Then
         
           If isFormOpen(formName) Then
                Forms(formName).summeATS = rs("Summe")
                Forms(formName).mwstATS = nvl(rs("Summe_Brutto"), 0) - rs("Summe")
                Forms(formName).summeATSPlusMWST = rs("Summe_Brutto")
           Else 'DB Update
               sql = "update  [" & getVorgangTableForType(Vorgangtyp) & "] " & _
                 " set Summe =" & Replace(Round(rs("Summe"), 2), ",", ".") & _
                 ", SummeMWST =" & Replace(Round(nvl(rs("Summe_Brutto"), 0) - rs("Summe"), 2), ",", ".") & _
                 ", SummeBrutto =" & Replace(Round(nvl(rs("Summe_Brutto"), 0), 2), ",", ".") & _
                 " where Nummer =" & VorgangNummer
                'TODO: in MySQL ist der DS gesperrt und dadurch probleme
                 CurrentDb.execute (sql)
            End If
           
         End If
     End If
     rs.Close
     Set rs = Nothing
End Sub

Function nvl(param1 As Variant, param2 As Variant) As Variant
  If IsNull(param1) Then
        nvl = param2
   Else
        nvl = param1
  End If
End Function

'=======================================================================
'öffnet die maske buchRechnung (funktioniert für alle mögliche vorgänge)
'=======================================================================
Public Function openVorgangFunction(ByVal VorgangType As String, _
                                    ByVal IDNR, _
                                    Optional LieferantNR As Long = 0, _
                                    Optional ByVal formName As String = "buchRechnung")

   
 On Error GoTo Err_ntnRechnung_Click
   
 
    DoCmd.OpenForm formName
    Dim frm As Form: Set frm = Forms(formName)
     
    frm.RecordSource = getVorgangTableForType(VorgangType)
    frm.Rech_Artikel.Form.RecordSource = getVorgangArtikelTableForType(VorgangType)
    
    If LieferantNR > 0 Then 'Im Lieferanten Modus
        frm.Filter = "LieferantNr=" & LieferantNR
    Else
        frm.Filter = "KundNr=" & IDNR
    End If
    
    frm.FilterOn = True
    
   
    
    frm.txtVorgangType = VorgangType
    
    frm.subformEigenschaften.Form.RecordSource = "select * from buchVorgaengeEigenschaften where vorgangtyp = '" & VorgangType & "'"
    frm.Status.RowSource = "SELECT Status FROM buchVorgaengeStatus  Where Vorgangtyp ='" & VorgangType & "'"

    frm.subformEigenschaften.Form.RecordSource = "select * from buchVorgaengeEigenschaften where vorgangtyp = '" & VorgangType & "'"
    
    If VorgangType = VORGANG_TYP_LAU Then  'Im Lieferanten Modus
        Call setinLAUMode
    End If
    
     DoCmd.GoToRecord acDataForm, formName, acLast
     
Exit_ntnRechnung_Click:
    Exit Function

Err_ntnRechnung_Click:
    MsgBox err.Description
    Resume Exit_ntnRechnung_Click
End Function

'=======================================================
'öffnet die maske buchRechnung (für alle möglich vorgänge) und positioniert die maske an dem bestimmten vorgang
'=======================================================
Public Function openVorgangFunctionByNummer(ByVal VorgangType As String, ByVal Nummer)
On Error GoTo Err_ntnRechnung_Click
    If Nummer < 1 Or VorgangType = "" Then
        MsgBox "Keine gültige Vorgangnummer!", vbCritical
        Exit Function
    End If

    DoCmd.OpenForm "buchRechnung"
    Forms![buchRechnung].RecordSource = getVorgangTableForType(VorgangType)
    Forms![buchRechnung].Rech_Artikel.Form.RecordSource = getVorgangArtikelTableForType(VorgangType)
    
    Forms![buchRechnung].Filter = "Nummer=" & Nummer
    Forms![buchRechnung].FilterOn = True
    
    Forms![buchRechnung].txtVorgangType = VorgangType
    Forms![buchRechnung].Status.RowSource = "SELECT Status FROM buchVorgaengeStatus  Where Vorgangtyp ='" & VorgangType & "'"
    
    Forms![buchRechnung].subformEigenschaften.Form.RecordSource = "select * from buchVorgaengeEigenschaften where vorgangtyp = '" & VorgangType & "'"
    Forms![buchRechnung].cbDateinameVorlage.Requery
    
    If VorgangType = VORGANG_TYP_LAU Then  'Im Lieferanten Modus
        Call setinLAUMode
    End If
    
    

      
Exit_ntnRechnung_Click:
    Exit Function

Err_ntnRechnung_Click:
    MsgBox err.Description
    Resume Exit_ntnRechnung_Click
End Function

Sub setinLAUMode()
        Forms![buchRechnung].[buchAdresseKopf].LinkMasterFields = "LieferantNr"
        Forms![buchRechnung].[buchAdresseKopf].Form.RecordSource = "select * from qry_AdressfelderLieferant"
        Forms![buchRechnung].[buchAdresseKopf].Form.KundNr.RowSource = "SELECT IDNR, Firma FROM lieferantenAdressen"
        Forms![buchRechnung].[buchAdresseKopf].Form.KundNr.Requery
End Sub

Public Function addVorgangEigenschaft(ByVal Vorgangtyp As String, _
ByVal VorgangNummer As String, _
ByVal Eigenschaft As String, _
ByVal Wert As String)

Dim sql As String
 sql = "INSERT INTO buchVorgaengeEigenschaften ( VorgangTyp, Nummer, Name, [Value] )" & _
      " values ('" & Vorgangtyp & "', " & VorgangNummer & ", '" & Eigenschaft & "', '" & Wert & "')"
            
 DoCmd.SetWarnings False
 DoCmd.RunSQL sql
 DoCmd.SetWarnings True
End Function


Public Sub setStandartBedingung(ByVal VorgangType As String, ByVal Nummer, ByVal KundNr As String)

     
      Dim zb, zm, tm
          zb = TABLEVALUE("grZahlungsbedingung", "Nr", TABLEVALUE("[ofAdressen-Zahlungsbedingungen]", "Idnr", KundNr, "Bedingung"), "Methode")
  
          zm = TABLEVALUE("[ofAdressen-ZahlungsMethoden]", "Idnr", KundNr, "Methode")
         
          tm = TABLEVALUE("[ofAdressen-TransportMethoden]", "Idnr", KundNr, "Methode")
     
         If InStr(zb, "vorhanden") > 0 Then zb = ""
         If InStr(zm, "vorhanden") > 0 Then zm = ""
         If InStr(tm, "vorhanden") > 0 Then tm = ""
          
          Dim sql As String
          sql = "Update " & getVorgangTableForType(VorgangType) & " set ZahlungsBedungung='" & zb & "'," & _
          " Zahlungsmethode='" & zm & "', TransportMethode='" & tm & "'  where Nummer=" & Nummer
          
          DoCmd.SetWarnings False
          DoCmd.RunSQL sql
          DoCmd.SetWarnings True
          
 End Sub


Public Sub ArtikelAuflisten(Typ As String, Nummer As String)
        Dim Source
      
        Dim tbl As String: tbl = getVorgangArtikelTableForType(Typ)
     
        Source = " SELECT DISTINCTROW [ArtNR], " & _
                 " [Stk], [PreisATS], " & _
                 " [Bezeichnung], " & _
                 " [PreisATS_Brutto] FROM [" & tbl & "] WHERE RechNr = " & _
                   Nummer & ";"
         DoCmd.OpenForm "buchVorgänge-Uebersicht"
         Forms![buchVorgänge-Uebersicht]![listArtikel].ColumnWidths = "2cm;2cm;2cm;5cm;2cm;"
         Forms![buchVorgänge-Uebersicht]![listArtikel].RowSource = Source
         Forms![buchVorgänge-Uebersicht]![listArtikel].Requery
End Sub



