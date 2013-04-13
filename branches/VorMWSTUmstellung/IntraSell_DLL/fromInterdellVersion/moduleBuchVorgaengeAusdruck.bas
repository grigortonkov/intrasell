Attribute VB_Name = "moduleBuchVorgaengeAusdruck"
Option Compare Database
Option Explicit

Const BEZEICHNUNG_LAENGE = 16

'=======================================================
'=======================================================
Function getRecSource(Vorgangtyp, Vorgang_Nummer)

 Dim VonForm, VonForm_Artikel
 VonForm = getVorgangTableForType(Vorgangtyp)
 VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
 
 getRecSource = "SELECT '" & Vorgangtyp & "'  as VorgangTyp, ofAdressen.Idnr, ofAdressen.Name & "" "" & ofAdressen.Vorname as Namen , ofAdressen.Firma, ofAdressen.Adresse, " & _
            " " & VonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort] AS plzort, " & _
            " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & VonForm & ".Datum, " & VonForm & ".Notiz, " & _
            " Sum([Stk]*[PreisEuro]) AS summeEuro, " & VonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & VonForm & ".Notiz, Woher, Wohin," & _
            " ofAdressen.Anrede , ofAdressen.Anrede + "" "" & ofAdressen.Titel as AnredeTitel, getLand(ofAdressen.Idnr) as land, getUID(ofAdressen.idnr) as uid, Tel, Email, " & VonForm & ".KundNr2" & _
            " FROM ((ofAdressen RIGHT JOIN " & VonForm & " ON ofAdressen.IDNR = " & VonForm & ".KundNr) " & _
            " LEFT JOIN grPLZ ON ofAdressen.PLZ = grPLZ.IdNr) INNER JOIN [" & VonForm_Artikel & "] " & _
            " ON " & VonForm & ".Nummer = [" & VonForm_Artikel & "].RechNr " & _
            " Where nummer=" & Vorgang_Nummer & "  " & _
            " GROUP BY '" & Vorgangtyp & "' , ofAdressen.Idnr, ofAdressen.Name & "" "" & ofAdressen.Vorname, ofAdressen.Firma, ofAdressen.Adresse, " & _
            " " & VonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort], " & VonForm & ".Datum, " & _
            " " & VonForm & ".Notiz, " & VonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode ,  " & VonForm & ".Notiz, Woher, Wohin," & _
            " ofAdressen.Anrede, ofAdressen.Anrede + "" "" & ofAdressen.Titel, getLand(ofAdressen.Idnr), getUID(ofAdressen.idnr), Tel, Email, " & VonForm & ".KundNr2;"
            
End Function

'=======================================================
' liefet den recordsource wenn eine weitere adresse verwendet wird
'=======================================================
Function getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer)

 Dim VonForm, VonForm_Artikel
 VonForm = getVorgangTableForType(Vorgangtyp)
 VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
 
 getRecSource_Weitere = "SELECT '" & Vorgangtyp & "'  as VorgangTyp, [ofAdressen-Weitere].Idnr, [ofAdressen-Weitere].Name & "" "" &   [OfAdressen-WEitere].Vorname as Namen, [ofAdressen-Weitere].Firma, [ofAdressen-Weitere].Adresse, " & _
            " " & VonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort] AS plzort, " & _
            " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & VonForm & ".Datum, " & VonForm & ".Notiz, " & _
            " Sum([Stk]*[PreisEuro]) AS summeEuro, " & VonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & VonForm & ".Notiz, Woher, Wohin," & _
            " [ofAdressen-Weitere].Anrede, getLand(" & VonForm & ".KundNr) as land, getUID(" & VonForm & ".KundNr) as uid, Tel, Email" & _
            " FROM (([ofAdressen-Weitere] RIGHT JOIN " & VonForm & " ON [ofAdressen-Weitere].IDNR = " & VonForm & ".KundNr)" & _
            " LEFT JOIN grPLZ ON [ofAdressen-Weitere].PLZ = grPLZ.IdNr) INNER JOIN [" & VonForm_Artikel & "] " & _
            " ON " & VonForm & ".Nummer = [" & VonForm_Artikel & "].RechNr " & _
            " Where nummer=" & Vorgang_Nummer & "  " & _
            " AND [ofAdressen-Weitere].Typ like '" & Vorgangtyp & "'" & _
            " GROUP BY '" & Vorgangtyp & "' , [ofAdressen-Weitere].Idnr, [ofAdressen-Weitere].Name & "" "" & [ofAdressen-weitere].vorname,  [ofAdressen-Weitere].Firma, [ofAdressen-Weitere].Adresse, " & _
            " " & VonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort], " & VonForm & ".Datum, " & _
            " " & VonForm & ".Notiz, " & VonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & VonForm & ".Notiz,Woher, Wohin," & _
            " [ofAdressen-Weitere].Anrede, getLand(" & VonForm & ".KundNr), getUID(" & VonForm & ".KundNr), Tel, Email;"
    Debug.Print getRecSource_Weitere
End Function

Public Function getLand(ByVal IDNR) As String
getLand = TABLEVALUE("grLand", "IDNR", TABLEVALUE("ofAdressen", "Idnr", IDNR, "LAND"), "Name") & ""
End Function

Public Function getUID(ByVal IDNR) As String
getUID = TABLEVALUE("ofAdressen", "Idnr", IDNR, "UID") & ""
End Function

'=======================================================
' prueft ob eine weitere adresse vorhanden ist
'=======================================================
Function checkIfWeitereVorhanden(ByVal IDNR, ByVal Vorgangtyp) As Boolean
checkIfWeitereVorhanden = False
    Dim rs, sql
    sql = "select * from [ofAdressen-Weitere] where idnr=" & IDNR & " AND typ like """ & Vorgangtyp & """"
    Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    If Not rs.EOF Then
            checkIfWeitereVorhanden = True
    End If
    
End Function

'=======================================================
' oeffnet den ausdruck mit access formular
'=======================================================
Public Sub OpenAusdruck(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
    Call OpenAusdruck_inAccess(Vorgangtyp, Vorgang_Nummer, FormatNummer)
End Sub




'=======================================================
' oeffnet den ausdruck mit access formular
'formatNummer = SILENT - kommen keine Fragen
'=======================================================
Public Sub OpenAusdruck_inAccess(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
 Dim recSource ' recordSource für den Ausdruck
 Dim Filter, reply, i
 Dim Vorgang_Name
 Dim VonForm, VonForm_Artikel
  
  
 VonForm = getVorgangTableForType(Vorgangtyp)
 VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
 Vorgang_Name = getDruckForType(Vorgangtyp)
 
 Debug.Print recSource
 reply = vbYes
 
 If FormatNummer <> "SILENT" Then
    If varValue("AnzahlAusdruecke") <> "1" Then
        reply = MsgBox("Wollen Sie " & varValue("AnzahlAusdruecke") & " Kopien ausdrucken?", vbYesNo)
     Else
        reply = vbYes
     End If
 End If
 
 If reply = vbYes Then

      recSource = getRecSource(Vorgangtyp, Vorgang_Nummer)

      Filter = "Nummer = " & Vorgang_Nummer
       

       'preview
        On Error Resume Next
        DoCmd.DeleteObject acQuery, "qryBuchRechArtikel"
        DoCmd.DeleteObject acQuery, "qryBuchRech"
        On Error GoTo 0
        
        CurrentDb.CreateQueryDef "qryBuchRechArtikel", "select * from [" & VonForm_Artikel & "] order by id"
        CurrentDb.CreateQueryDef "qryBuchRech", recSource
        
        

        Dim rsKunden As Recordset
        Set rsKunden = CurrentDb.openRecordset(recSource, dbOpenDynaset, dbSeeChanges)
        Dim kdnr: kdnr = 0
        If Not rsKunden.EOF Then
                 kdnr = rsKunden("idnr")
        End If
        Dim needs: needs = needsMWST(kdnr)
       
        If checkIfWeitereVorhanden(kdnr, Vorgangtyp) Then
             If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                        recSource = getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer)
                        DoCmd.DeleteObject acQuery, "qryBuchRech"
                        CurrentDb.CreateQueryDef "qryBuchRech", recSource
              End If
        End If
        
        
        DoCmd.OpenReport "buchRechnung", acViewPreview
        'set MWST Visible or invisible according the Kundengruppe
       
        'Reports![ buchRechnung].[Title] = "Dokument"
        Reports![buchRechnung]![mwstATS].Visible = needs
        Reports![buchRechnung]![summeATSBrutto].Visible = needs
        Reports![buchRechnung]![lblMWST].Visible = needs
        Reports![buchRechnung]![lblGesamtbetrag].Visible = needs
        'end set
        
        
        
        
        'DoCmd.Save acReport, "buchRechnung"
       
        If FormatNummer <> "SILENT" Then
                For i = 1 To varValue("AnzahlAusdruecke")
                            'preview
                             DoCmd.OpenReport "buchRechnung", acPreview, , Filter
                             'für Drucken
                             If MsgBox("Jetzt Ausdrucken?", vbYesNo) = vbYes Then
                                        DoCmd.OpenReport "buchRechnung", acNormal, , Filter
                              Else
                                       Exit Sub 'leave report opened
                             End If
                Next
       End If
       
        DoCmd.Close acReport, "buchRechnung"
       'Forms![buchRechnung]![checkBox_ausgedruckt] = True
       'DoCmd.Close acForm, "buchRechnung"
 End If
End Sub

'=================================================================
' oeffnet den ausdruck mit word formular
'=================================================================
Public Sub OpenAusdruck_inWord(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
   Call OpenAusdruck_inWord_Filename(Vorgangtyp, Vorgang_Nummer, FormatNummer, "Vorlage_Rechnung.doc")
End Sub
Public Sub OpenAusdruck_inWord_Filename(ByVal Vorgangtyp As String, _
                                        ByVal Vorgang_Nummer As String, _
                                        ByVal FormatNummer As String, _
                                        ByVal Dateiname As String)
   Dim App 'As Application
   Dim VorlageFilename
   Dim rs As Recordset
   Dim VonForm, VonForm_Artikel
   Dim sql
   Dim RsArt
   
   VonForm = getVorgangTableForType(Vorgangtyp)
   VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
   
   
   VorlageFilename = dbFolder() & Dateiname
   
   Set App = CreateObject("Word.Application")
   App.Visible = True
   
    App.Documents.Open filename:=VorlageFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0


    Set rs = CurrentDb.openRecordset(getRecSource(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
    

        
    
    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        On Error Resume Next
        App.Quit
        On Error GoTo 0
        Exit Sub
    End If
    
      If checkIfWeitereVorhanden(rs("idnr"), Vorgangtyp) And Vorgangtyp = "LI" Then
             If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                            Set rs = CurrentDb.openRecordset(getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
              End If
        End If
    
    
    Call replaceInWordOnce(App, "[Idnr]", rs("Idnr") & "")
    Call replaceInWordOnce(App, "[Kundennummer]", rs("Idnr") & "")
     
    Call replaceInWordOnce(App, "[firma]", rs("firma") & "")
    Call replaceInWordOnce(App, "[name]", rs("namen") & "")
    Call replaceInWordOnce(App, "[strasse]", rs("adresse") & "")
    Call replaceInWordOnce(App, "[plz ort]", rs("plzort") & "")

    Call replaceInWordOnce(App, "[Titel]", Vorgangtyp & "-" & Vorgang_Nummer)
    Call replaceInWordOnce(App, "[Datum]", rs("Datum") & "")
    Call replaceInWordOnce(App, "[Betreuer]", "")
    Call replaceInWordOnce(App, "[Email]", rs("Email") & "")
    
    Call replaceInWordOnce(App, "[Zahlungsbedingung]", rs("ZahlungsBedungung") & "")
    Call replaceInWordOnce(App, "[Zahlungsmethode]", rs("ZahlungsMethode") & "")
    Call replaceInWordOnce(App, "[Transportmethode]", rs("TransportMethode") & "")
    
 
    
    Call replaceInWordOnce(App, "[Netto]", FormatNumber(rs("summeATS"), 2))
    Call replaceInWordOnce(App, "[MWST]", FormatNumber(rs("summeATSBrutto") - rs("summeATS"), 2))
    Call replaceInWordOnce(App, "[Total]", FormatNumber(rs("summeATSBrutto"), 2))
    
    
    'PART II - Positionen

   sql = "select count(*) as pos from [" & VonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
   Set RsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   Dim Positionen
       Positionen = RsArt("pos")
   
  
  'copy the artikel line times as needed
    App.Selection.MoveUp Unit:=7, Count:=3
    App.Selection.Find.ClearFormatting
    App.Selection.Find.replacement.ClearFormatting
    With App.Selection.Find
        .Text = "[Stk]"
        .replacement.Text = "1"
        .Forward = True
        .Wrap = 1
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    
    
    Dim foundstk: foundstk = App.Selection.Find.execute
    App.Selection.EndKey Unit:=5, Extend:=1
    App.Selection.Copy
    Dim i
            If foundstk Then
                For i = 1 To Positionen
                   App.Selection.Paste
                Next i
            End If
  'replace artnr, preis etc.
  
     sql = "select [" & VonForm_Artikel & "].*, Beschreibung from [" & VonForm_Artikel & "],  grArtikel where [" & VonForm_Artikel & "].artnr = grArtikel.artnr and  rechnr=" & Vorgang_Nummer
    Debug.Print sql
    Set RsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   While Not RsArt.EOF
      Call replaceInWordOnce(App, "[Stk]", RsArt("Stk"))
      Call replaceInWordOnce(App, "[ArtNR]", RsArt("ArtNR"))
      Call replaceInWordOnce(App, "[Bezeichnung]", RsArt("Bezeichnung") & "")
      Call replaceInWordOnce(App, "[Beschreibung]", RsArt("Beschreibung") & "")
      Call replaceInWordOnce(App, "[Preis]", FormatNumber(RsArt("PreisATS"), 2))
      RsArt.MoveNext
   Wend
  
  'Eigenschaften
  
  sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & Vorgangtyp & "'"
  Dim rsEig As Recordset
  Set rsEig = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
  While Not rsEig.EOF
    Call replaceInWordOnce(App, "[" & rsEig("Name") & "]", rsEig("Value") & "")
    rsEig.MoveNext
  Wend
  
  
  
    Dim saveAsFilename: saveAsFilename = dbFolder() & Vorgangtyp & "_" & Vorgang_Nummer & ".doc"
    If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
      
            App.ActiveDocument.SaveAs filename:=saveAsFilename, FileFormat:= _
                0, LockComments:=False, Password:="", AddToRecentFiles:= _
                True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                SaveAsAOCELetter:=False
    End If
    
    On Error Resume Next ' vielleicht ist word bereits geschlossen
    App.Quit
    On Error GoTo 0
End Sub

'=================================================================
'=================================================================
Private Sub replaceInWordOnce(App, ByVal what As String, ByVal withValue As String)
On Error GoTo 1:
    App.Selection.MoveUp Unit:=7, Count:=4
    App.Selection.Find.ClearFormatting
    App.Selection.Find.replacement.ClearFormatting
    With App.Selection.Find
        .Text = what
        .replacement.Text = withValue
        .Forward = True
        .Wrap = 1
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
 
    
    App.Selection.Find.execute Replace:=1 'wdReplaceAll
Exit Sub
1:
Debug.Print "Cannot replace " & what
End Sub


'=================================================================
'erstellt eine WORD Datei mit den gegebenen Informationen
'=================================================================
Public Sub OpenKorrespondenz_inWord(ByVal IDNR As String, _
                                    ByVal Subjekt, _
                                    ByVal BriefText, _
                                    ByVal Datum, _
                                    ByVal printAndClose)
   Dim App 'As Application
   Dim VorlageFilename
   Dim rs As Recordset
   Dim VonForm, VonForm_Artikel
   Dim sql As String
   Dim RsArt
   
   
   VorlageFilename = dbFolder() & "Vorlage_Brief.doc"
   
   Set App = CreateObject("Word.Application")
  
    App.Visible = False
    App.Documents.Open filename:=VorlageFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0
    Set rs = CurrentDb.openRecordset("select * from qry_Adressfelder where idnr=" & IDNR, dbOpenDynaset, dbSeeChanges)
    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        On Error Resume Next
        App.Quit
        On Error GoTo 0
        Exit Sub
    End If
    
    
   
    Call replaceInWordOnce(App, "[IDNR]", rs("idnr") & "")
    Call replaceInWordOnce(App, "[Kundennummer]", rs("idnr") & "")
    Call replaceInWordOnce(App, "[firma]", rs("firma") & "")
    Call replaceInWordOnce(App, "[name]", rs("name") & "")
    Call replaceInWordOnce(App, "[strasse]", rs("adresse") & "")
    Call replaceInWordOnce(App, "[plz ort]", rs("plz") & " " & rs("ort") & "")
    Call replaceInWordOnce(App, "[plz]", rs("plz") & "")
    Call replaceInWordOnce(App, "[ort]", rs("ort") & "")
    Call replaceInWordOnce(App, "[Email]", rs("Email") & "")

    Call replaceInWordOnce(App, "[Titel]", "" & Subjekt)
    Call replaceInWordOnce(App, "[Datum]", Datum & "")
    Call replaceInWordOnce(App, "[Text]", "")
    App.Selection.TypeText BriefText & ""
    App.Visible = True
    Dim saveAsFilename: saveAsFilename = dbFolder() & "Korrespondenz_" & IDNR & "_" & Year(Date) & Month(Date) & Day(Date) & ".doc"
    If Not printAndClose Then
        If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
                App.ActiveDocument.SaveAs filename:=saveAsFilename, FileFormat:= _
                    0, LockComments:=False, Password:="", AddToRecentFiles:= _
                    True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                    False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                    SaveAsAOCELetter:=False
        End If
    Else ' print and do not close word
                App.ActiveDocument.SaveAs filename:=saveAsFilename, FileFormat:=0
                App.ActiveDocument.PrintOut
               
               'the word instance will not be closed
              Exit Sub
    End If
    
    On Error Resume Next ' vielleicht ist word bereits vom user geschlossen
    App.Quit
    On Error GoTo 0
   
End Sub




Public Function makeArtikelNummer(ArtNr1) As String
makeArtikelNummer = ArtNr1

    If UseEAN() Then
           Dim rs, sql
    
        sql = "select artnr,ean from grArtikel where artnr = " & ArtNr1
        Set rs = CurrentDb.openRecordset(sql)
        If Not rs.EOF Then
            If Not IsNull(rs("ean")) Then
                 makeArtikelNummer = rs("ean")
                End If
       End If
      End If

End Function

Function sendVorgang_Email(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
    Dim Subject
    Dim Email: Email = getKundenEmail(Vorgangtyp, Vorgang_Nummer)
   
   Call OpenAusdruck_inAccess(Vorgangtyp, Vorgang_Nummer, "SILENT")
   
   Dim EmailText
   Dim TextBaustein
   Dim sibject
   
   TextBaustein = "'TEXTBAUSTEIN_EMAIL_" & Vorgangtyp & "'"
   
   EmailText = TABLEVALUE("ofKorespondenz", "Subjekt", TextBaustein, "[TEXT]")
   Subject = getDruckForType(Vorgangtyp) & " Nr. " & Vorgang_Nummer
   
   On Error Resume Next
   DoCmd.SendObject acSendReport, "buchRechnung", , Email, , , Subject, EmailText
   On Error GoTo 0
   
End Function


Public Function getKundenEmail(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String)
   Dim Email
   Dim rsEmail
   Dim sql

   sql = "select Email from ofAdressen where idnr in (select KundNr from " & getVorgangTableForType(Vorgangtyp) & " WHERE Nummer = " & Vorgang_Nummer & ")"
   
   If Vorgangtyp = VORGANG_TYP_LAU Then
      sql = "select Email from lieferantenAdressen where idnr in (select LieferantNr from " & getVorgangTableForType(Vorgangtyp) & " WHERE Nummer = " & Vorgang_Nummer & ")"
   End If
   
   Set rsEmail = CurrentDb.openRecordset(sql)
   
   Email = "kunden Email"
   If Not rsEmail.EOF Then
     Email = rsEmail("Email")
   End If
   rsEmail.Close
   getKundenEmail = Email
End Function


'=================================================================
' oeffnet den ausdruck mit word formular
'=================================================================
Public Sub OpenAusdruck_inWord_RTF(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
   Call OpenAusdruck_InWord_Filename_RTF(Vorgangtyp, Vorgang_Nummer, FormatNummer, "Vorlage_Rechnung.rtf")
End Sub

'Hilfe Funktion
Function readFileContent(ByVal Dateiname As String, ByVal Positionen As Integer) As String
       'read RTF content
    Dim VorlageFilename As String: VorlageFilename = dbFolder() & Dateiname
    Dim fileText As String, fileContent As String, fileLine As String
    Dim i As Integer
    Open VorlageFilename For Input As #1
    While Not EOF(1)
            Input #1, fileLine
              If fileContent = "" Then
                fileContent = fileLine
              Else
                fileContent = fileContent & Chr(13) & Chr(10) & _
                              fileLine
              End If
              
              'add lines für jede Position
              If InStr(fileLine, "[ArtNR]") > 0 Or InStr(fileLine, "[EAN]") > 0 Then 'je das ist eine Position zeile
                For i = 1 To (Positionen - 1)
                    fileContent = fileContent & Chr(13) & Chr(10) & _
                                  fileLine
                Next
              End If
    Wend
    Close #1
    readFileContent = fileContent
End Function

'=================================================================
' Opens a textfle and replaces the tags with the informaiton from the database
' Used for HTML Outlookmails too !
' Liefert Dateiname der erstellten Datei retour
' silent = true -> File inWord öffnen
'=================================================================

Public Function OpenAusdruck_InWord_Filename_RTF( _
    ByVal Vorgangtyp As String, _
    ByVal Vorgang_Nummer As String, _
    ByVal FormatNummer As String, _
    ByVal Dateiname As String, _
    Optional Silent As Boolean = False)
    
   Dim App 'As Application
   
   Dim rs As Recordset
   Dim VonForm, VonForm_Artikel
   Dim sql
   Dim RsArt
   
   VonForm = getVorgangTableForType(Vorgangtyp)
   VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
   
   
   Set rs = CurrentDb.openRecordset(getRecSource(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
    

    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        Exit Function
    End If
    
    If checkIfWeitereVorhanden(rs("idnr"), Vorgangtyp) And Vorgangtyp = "LI" Then
           If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                          Set rs = CurrentDb.openRecordset(getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
            End If
    End If
    
  'Anzahl Positionen
   sql = "select count(*) as pos from [" & VonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
   Set RsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   Dim Positionen, i
       Positionen = RsArt("pos")
        
    
    
 
    
    
    'REPLACE CONTENT
    Dim fileContent As String: fileContent = readFileContent(Dateiname, Positionen)
    fileContent = Replace(fileContent, "[Idnr]", rs("Idnr") & "")
    fileContent = Replace(fileContent, "[Kundennummer]", rs("Idnr") & "")
     
    fileContent = Replace(fileContent, "[firma]", rs("firma") & "")
    fileContent = Replace(fileContent, "[name]", rs("namen") & "")
    fileContent = Replace(fileContent, "[strasse]", rs("adresse") & "")
    fileContent = Replace(fileContent, "[plz ort]", rs("plzort") & "")

    fileContent = Replace(fileContent, "[Titel]", Vorgangtyp & "-" & Vorgang_Nummer)
    fileContent = Replace(fileContent, "[Datum]", rs("Datum") & "")
    fileContent = Replace(fileContent, "[Betreuer]", "")
    fileContent = Replace(fileContent, "[Email]", rs("Email") & "")
    
    fileContent = Replace(fileContent, "[Zahlungsbedingung]", rs("ZahlungsBedungung") & "")
    fileContent = Replace(fileContent, "[Zahlungsmethode]", rs("ZahlungsMethode") & "")
    fileContent = Replace(fileContent, "[Transportmethode]", rs("TransportMethode") & "")
    
    fileContent = Replace(fileContent, "[Netto]", FormatNumber(rs("summeATS"), 2))
    fileContent = Replace(fileContent, "[MWST]", FormatNumber(rs("summeATSBrutto") - rs("summeATS"), 2))
    fileContent = Replace(fileContent, "[Total]", FormatNumber(rs("summeATSBrutto"), 2))
    

  'copy the artikel line times as needed

  
  Dim BEZ
    sql = "select [" & VonForm_Artikel & "].*, " & _
          "Beschreibung, EAN from [" & VonForm_Artikel & "],  grArtikel where [" & VonForm_Artikel & "].artnr = grArtikel.artnr " & _
          "and  rechnr=" & Vorgang_Nummer
    Debug.Print sql
    Set RsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    
   While Not RsArt.EOF
      fileContent = Replace(fileContent, "[Stk]", RsArt("Stk"), 1, 1)
      fileContent = Replace(fileContent, "[ArtNR]", RsArt("ArtNR"), 1, 1)
      fileContent = Replace(fileContent, "[EAN]", RsArt("EAN"), 1, 1)
      fileContent = Replace(fileContent, "[Bezeichnung]", pad(RsArt("Bezeichnung") & "", BEZEICHNUNG_LAENGE), 1, 1)
      fileContent = Replace(fileContent, "[Beschreibung]", RsArt("Beschreibung") & "", 1, 1)
      fileContent = Replace(fileContent, "[Preis]", FormatNumber(RsArt("PreisATS"), 2), 1, 1)
      fileContent = Replace(fileContent, "[PreisBrutto]", FormatNumber(RsArt("PreisATS_Brutto"), 2), 1, 1)
      RsArt.MoveNext
   Wend
  
  
  'set Eigenschaften
  sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & Vorgangtyp & "'"
  Dim rsEig As Recordset
  Set rsEig = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
  While Not rsEig.EOF
    fileContent = Replace(fileContent, "[" & rsEig("Name") & "]", rsEig("Value") & "")
    rsEig.MoveNext
  Wend
  
  
  
   'SAVE FILE
    Dim saveAsFilename: saveAsFilename = dbFolder() & Vorgangtyp & "_" & Vorgang_Nummer & "." & Right(Dateiname, 3)
   
        fileContent = Trim(fileContent)
        
        Open saveAsFilename For Output As #1
        Print #1, fileContent
        Close #1
        
       OpenAusdruck_InWord_Filename_RTF = saveAsFilename
       
       If Not Silent Then 'OPEN FILE IN WORD
            Set App = CreateObject("Word.Application")
            App.Visible = True
            App.Documents.Open filename:=saveAsFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False ', Format:=0
       End If
       
        'if send Email
        'acFormatDAP
        'acFormatHTML
        'acFormatRTF
        'acFormatTXT
        'acFormatXLS
        'DoCmd.SendObject acSendNoObject, , acFormatHTML, Email, , , Subject, "test", True, "c:\temp\temp\AR_200300004.htm"  'saveAsFilename
   
End Function


Function parseVorgangVorlage(ByVal Vorgangtyp As String, _
                      ByVal Vorgang_Nummer As String) As String

End Function

  'adds spaces to the required length
  Function pad(ByVal stringToPad As String, ByVal length As Integer)
    Dim i: i = 0
    If Len(stringToPad) < length Then
      Dim missingChars: missingChars = length - Len(stringToPad)
        For i = 1 To missingChars
            stringToPad = stringToPad & " "
        Next
        pad = stringToPad
     Else ' more the length signs
        pad = Left(stringToPad, length - 3) & "..."
     End If
     
  End Function
