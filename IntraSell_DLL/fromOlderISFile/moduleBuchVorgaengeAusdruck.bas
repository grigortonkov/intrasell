Attribute VB_Name = "moduleBuchVorgaengeAusdruck"
Option Compare Database
Option Explicit

Const BEZEICHNUNG_LAENGE = 70

'=======================================================
'=======================================================
Function getRecSource(VorgangTyp, Vorgang_Nummer)

 Dim vonForm, vonForm_Artikel
 vonForm = getVorgangTableForType(VorgangTyp)
 vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
 
 getRecSource = "SELECT '" & VorgangTyp & "'  as VorgangTyp, ofAdressen.Idnr, ofAdressen.Name & "" "" & ofAdressen.Vorname as Namen , ofAdressen.Firma, ofAdressen.Adresse, " & _
            " " & vonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort] AS plzort, " & _
            " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & vonForm & ".Datum, " & vonForm & ".Notiz, " & _
            " Sum([Stk]*[PreisEuro]) AS summeEuro, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz, Woher, Wohin," & _
            " ofAdressen.Anrede , getLand(ofAdressen.Idnr) as land, getUID(ofAdressen.idnr) as uid, Tel, Email" & _
            " FROM ((ofAdressen RIGHT JOIN " & vonForm & " ON ofAdressen.IDNR = " & vonForm & ".KundNr) " & _
            " LEFT JOIN grPLZ ON ofAdressen.PLZ = grPLZ.IdNr) INNER JOIN [" & vonForm_Artikel & "] " & _
            " ON " & vonForm & ".Nummer = [" & vonForm_Artikel & "].RechNr " & _
            " Where nummer=" & Vorgang_Nummer & "  " & _
            " GROUP BY '" & VorgangTyp & "' , ofAdressen.Idnr, ofAdressen.Name & "" "" & ofAdressen.Vorname, ofAdressen.Firma, ofAdressen.Adresse, " & _
            " " & vonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort], " & vonForm & ".Datum, " & _
            " " & vonForm & ".Notiz, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode ,  " & vonForm & ".Notiz, Woher, Wohin," & _
            " ofAdressen.Anrede, getLand(ofAdressen.Idnr), getUID(ofAdressen.idnr), Tel, Email;"
            
End Function

'=======================================================
' liefet den recordsource wenn eine weitere adresse verwendet wird
'=======================================================
Function getRecSource_Weitere(VorgangTyp, Vorgang_Nummer)

 Dim vonForm, vonForm_Artikel
 vonForm = getVorgangTableForType(VorgangTyp)
 vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
 
 getRecSource_Weitere = "SELECT '" & VorgangTyp & "'  as VorgangTyp, [ofAdressen-Weitere].Idnr, [ofAdressen-Weitere].Name & "" "" &   [OfAdressen-WEitere].Vorname as Namen, [ofAdressen-Weitere].Firma, [ofAdressen-Weitere].Adresse, " & _
            " " & vonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort] AS plzort, " & _
            " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & vonForm & ".Datum, " & vonForm & ".Notiz, " & _
            " Sum([Stk]*[PreisEuro]) AS summeEuro, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz, Woher, Wohin," & _
            " [ofAdressen-Weitere].Anrede, getLand(" & vonForm & ".KundNr) as land, getUID(" & vonForm & ".KundNr) as uid, Tel, Email" & _
            " FROM (([ofAdressen-Weitere] RIGHT JOIN " & vonForm & " ON [ofAdressen-Weitere].IDNR = " & vonForm & ".KundNr)" & _
            " LEFT JOIN grPLZ ON [ofAdressen-Weitere].PLZ = grPLZ.IdNr) INNER JOIN [" & vonForm_Artikel & "] " & _
            " ON " & vonForm & ".Nummer = [" & vonForm_Artikel & "].RechNr " & _
            " Where nummer=" & Vorgang_Nummer & "  " & _
            " AND [ofAdressen-Weitere].Typ like '" & VorgangTyp & "'" & _
            " GROUP BY '" & VorgangTyp & "' , [ofAdressen-Weitere].Idnr, [ofAdressen-Weitere].Name & "" "" & [ofAdressen-weitere].vorname,  [ofAdressen-Weitere].Firma, [ofAdressen-Weitere].Adresse, " & _
            " " & vonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort], " & vonForm & ".Datum, " & _
            " " & vonForm & ".Notiz, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz,Woher, Wohin," & _
            " [ofAdressen-Weitere].Anrede, getLand(" & vonForm & ".KundNr), getUID(" & vonForm & ".KundNr), Tel, Email;"
    Debug.Print getRecSource_Weitere
End Function

Public Function getLand(ByVal IdNr) As String
getLand = TABLEVALUE("grLand", "IDNR", TABLEVALUE("ofAdressen", "Idnr", IdNr, "LAND"), "Name") & ""
End Function

Public Function getUID(ByVal IdNr) As String
getUID = TABLEVALUE("ofAdressen", "Idnr", IdNr, "UID") & ""
End Function

'=======================================================
' prueft ob eine weitere adresse vorhanden ist
'=======================================================
Function checkIfWeitereVorhanden(ByVal IdNr, ByVal VorgangTyp) As Boolean
checkIfWeitereVorhanden = False
    Dim rs, sql
    sql = "select * from [ofAdressen-Weitere] where idnr=" & IdNr & " AND typ like """ & VorgangTyp & """"
    Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    If Not rs.EOF Then
            checkIfWeitereVorhanden = True
    End If
    
End Function

'=======================================================
' oeffnet den ausdruck mit access formular
'=======================================================
Public Sub OpenAusdruck(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
Call OpenAusdruck_inAccess(VorgangTyp, Vorgang_Nummer, formatNummer)
End Sub




'=======================================================
' oeffnet den ausdruck mit access formular
'formatNummer = SILENT - kommen keine Fragen
'=======================================================
Public Sub OpenAusdruck_inAccess(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
 Dim recSource ' recordSource für den Ausdruck
 Dim Filter, reply, i
 Dim Vorgang_Name
 Dim vonForm, vonForm_Artikel
  
  
 vonForm = getVorgangTableForType(VorgangTyp)
 vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
 Vorgang_Name = getDruckForType(VorgangTyp)
 
 Debug.Print recSource
 reply = vbYes
 
 If formatNummer <> "SILENT" Then
     reply = MsgBox("Wollen Sie " & varvalue("AnzahlAusdruecke") & " Kopien ausdrucken?", vbYesNo)
 End If
 
 If reply = vbYes Then

      recSource = getRecSource(VorgangTyp, Vorgang_Nummer)

      Filter = "Nummer = " & Vorgang_Nummer
       

       'preview
        On Error Resume Next
        DoCmd.DeleteObject acQuery, "qryBuchRechArtikel"
        DoCmd.DeleteObject acQuery, "qryBuchRech"
        On Error GoTo 0
        
        CurrentDb.CreateQueryDef "qryBuchRechArtikel", "select * from [" & vonForm_Artikel & "] order by id"
        CurrentDb.CreateQueryDef "qryBuchRech", recSource
        
        

        Dim rsKunden As Recordset
        Set rsKunden = CurrentDb.openRecordset(recSource, dbOpenDynaset, dbSeeChanges)
        Dim kdnr: kdnr = 0
        If Not rsKunden.EOF Then
                 kdnr = rsKunden("idnr")
        End If
        Dim needs: needs = needsMWST(kdnr)
       
        If checkIfWeitereVorhanden(kdnr, VorgangTyp) Then
             If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                        recSource = getRecSource_Weitere(VorgangTyp, Vorgang_Nummer)
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
       
        If formatNummer <> "SILENT" Then
                For i = 1 To varvalue("AnzahlAusdruecke")
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
Public Sub OpenAusdruck_inWord(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
   Call OpenAusdruck_inWord_Filename(VorgangTyp, Vorgang_Nummer, formatNummer, "Vorlage_Rechnung.doc")
End Sub
Public Sub OpenAusdruck_inWord_Filename(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String, ByVal Dateiname As String)
   Dim app 'As Application
   Dim vorlageFilename
   Dim rs As Recordset
   Dim vonForm, vonForm_Artikel
   Dim sql
   Dim rsArt
   
   vonForm = getVorgangTableForType(VorgangTyp)
   vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
   
   
   vorlageFilename = dbFolder() & Dateiname
   
   Set app = CreateObject("Word.Application")
   app.Visible = True
   
    app.Documents.Open fileName:=vorlageFilename, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, Format:=0


    Set rs = CurrentDb.openRecordset(getRecSource(VorgangTyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
    

        
    
    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        On Error Resume Next
        app.Quit
        Exit Sub
    End If
    
      If checkIfWeitereVorhanden(rs("idnr"), VorgangTyp) And VorgangTyp = "LI" Then
             If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                            Set rs = CurrentDb.openRecordset(getRecSource_Weitere(VorgangTyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
              End If
        End If
    
    
    Call replaceInWordOnce(app, "[Idnr]", rs("Idnr") & "")
    Call replaceInWordOnce(app, "[Kundennummer]", rs("Idnr") & "")
     
    Call replaceInWordOnce(app, "[firma]", rs("firma") & "")
    Call replaceInWordOnce(app, "[name]", rs("namen") & "")
    Call replaceInWordOnce(app, "[strasse]", rs("adresse") & "")
    Call replaceInWordOnce(app, "[plz ort]", rs("plzort") & "")

    Call replaceInWordOnce(app, "[Titel]", VorgangTyp & "-" & Vorgang_Nummer)
    Call replaceInWordOnce(app, "[Datum]", rs("Datum") & "")
    Call replaceInWordOnce(app, "[Betreuer]", "")
    Call replaceInWordOnce(app, "[Email]", rs("Email") & "")
    
    Call replaceInWordOnce(app, "[Zahlungsbedingung]", rs("ZahlungsBedungung") & "")
    Call replaceInWordOnce(app, "[Zahlungsmethode]", rs("ZahlungsMethode") & "")
    Call replaceInWordOnce(app, "[Transportmethode]", rs("TransportMethode") & "")
    
 
    
    Call replaceInWordOnce(app, "[Netto]", FormatNumber(rs("summeATS"), 2))
    Call replaceInWordOnce(app, "[MWST]", FormatNumber(rs("summeATSBrutto") - rs("summeATS"), 2))
    Call replaceInWordOnce(app, "[Total]", FormatNumber(rs("summeATSBrutto"), 2))
    
    
    'PART II - Positionen

   sql = "select count(*) as pos from [" & vonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
   Set rsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   Dim positionen
       positionen = rsArt("pos")
   
  
  'copy the artikel line times as needed
    app.Selection.MoveUp Unit:=7, Count:=3
    app.Selection.Find.ClearFormatting
    app.Selection.Find.replacement.ClearFormatting
    With app.Selection.Find
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
    
    
    Dim foundstk: foundstk = app.Selection.Find.Execute
    app.Selection.EndKey Unit:=5, Extend:=1
    app.Selection.Copy
    Dim i
            If foundstk Then
                For i = 1 To positionen
                   app.Selection.Paste
                Next i
            End If
  'replace artnr, preis etc.
  
     sql = "select [" & vonForm_Artikel & "].*, Beschreibung from [" & vonForm_Artikel & "],  grArtikel where [" & vonForm_Artikel & "].artnr = grArtikel.artnr and  rechnr=" & Vorgang_Nummer
    Debug.Print sql
    Set rsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   While Not rsArt.EOF
      Call replaceInWordOnce(app, "[Stk]", rsArt("Stk"))
      Call replaceInWordOnce(app, "[ArtNR]", rsArt("ArtNR"))
      Call replaceInWordOnce(app, "[Bezeichnung]", rsArt("Bezeichnung") & "")
      Call replaceInWordOnce(app, "[Beschreibung]", rsArt("Beschreibung") & "")
      Call replaceInWordOnce(app, "[Preis]", FormatNumber(rsArt("PreisATS"), 2))
      rsArt.MoveNext
   Wend
  
  'Eigenschaften
  
  sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & VorgangTyp & "'"
  Dim rsEig As Recordset
  Set rsEig = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
  While Not rsEig.EOF
    Call replaceInWordOnce(app, "[" & rsEig("Name") & "]", rsEig("Value") & "")
    rsEig.MoveNext
  Wend
  
  
  
    Dim saveAsFilename: saveAsFilename = dbFolder() & VorgangTyp & "_" & Vorgang_Nummer & ".doc"
    If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
      
            app.ActiveDocument.SaveAs fileName:=saveAsFilename, FileFormat:= _
                0, LockComments:=False, Password:="", AddToRecentFiles:= _
                True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                SaveAsAOCELetter:=False
    End If
    
    On Error Resume Next ' vielleicht ist word bereits geschlossen
    app.Quit
   
End Sub

'=================================================================
'=================================================================
Private Sub replaceInWordOnce(app, ByVal what As String, ByVal withValue As String)
On Error GoTo 1:
    app.Selection.MoveUp Unit:=7, Count:=4
    app.Selection.Find.ClearFormatting
    app.Selection.Find.replacement.ClearFormatting
    With app.Selection.Find
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
 
    
    app.Selection.Find.Execute Replace:=1 'wdReplaceAll
Exit Sub
1:
Debug.Print "Cannot replace " & what
End Sub


'=================================================================
'erstellt eine WORD Datei mit den gegebenen Informationen
'=================================================================
Public Sub OpenKorrespondenz_inWord(ByVal IdNr As String, ByVal Subjekt, ByVal BriefText, ByVal Datum, ByVal printAndClose)
   Dim app 'As Application
   Dim vorlageFilename
   Dim rs As Recordset
   Dim vonForm, vonForm_Artikel
   Dim sql
   Dim rsArt
   
   
   vorlageFilename = dbFolder() & "Vorlage_Brief.doc"
   
   Set app = CreateObject("Word.Application")
  
    app.Visible = False
    app.Documents.Open fileName:=vorlageFilename, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, Format:=0
    Set rs = CurrentDb.openRecordset("select * from qry_Adressfelder where idnr=" & IdNr, dbOpenDynaset, dbSeeChanges)
    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        On Error Resume Next
        app.Quit
        Exit Sub
    End If
    
    
   
    Call replaceInWordOnce(app, "[IDNR]", rs("idnr") & "")
    Call replaceInWordOnce(app, "[Kundennummer]", rs("idnr") & "")
    
    Call replaceInWordOnce(app, "[firma]", rs("firma") & "")
    Call replaceInWordOnce(app, "[name]", rs("name") & "")
    Call replaceInWordOnce(app, "[strasse]", rs("adresse") & "")
    Call replaceInWordOnce(app, "[plz ort]", rs("plz") & " " & rs("ort") & "")
    Call replaceInWordOnce(app, "[plz]", rs("plz") & "")
    Call replaceInWordOnce(app, "[ort]", rs("ort") & "")
    Call replaceInWordOnce(app, "[Email]", rs("Email") & "")

    Call replaceInWordOnce(app, "[Titel]", "" & Subjekt)
    Call replaceInWordOnce(app, "[Datum]", Datum & "")
    Call replaceInWordOnce(app, "[Text]", "")
    app.Selection.TypeText BriefText & ""
  
   app.Visible = True
    Dim saveAsFilename: saveAsFilename = dbFolder() & "Korrespondenz_" & IdNr & "_" & Year(Date) & Month(Date) & Day(Date) & ".doc"
    If Not printAndClose Then
        If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
                app.ActiveDocument.SaveAs fileName:=saveAsFilename, FileFormat:= _
                    0, LockComments:=False, Password:="", AddToRecentFiles:= _
                    True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                    False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                    SaveAsAOCELetter:=False
        End If
    Else ' print and do not close word
                app.ActiveDocument.SaveAs fileName:=saveAsFilename, FileFormat:=0
                app.ActiveDocument.PrintOut
               
               'the word instance will not be closed
              Exit Sub
    End If
    
    On Error Resume Next ' vielleicht ist word bereits geschlossen
    app.Quit
   
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

Function sendVorgang_Email(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
    Dim Subject
    Dim Email: Email = getKundenEmail(VorgangTyp, Vorgang_Nummer)
   
   Call OpenAusdruck_inAccess(VorgangTyp, Vorgang_Nummer, "SILENT")
   
   Dim EmailText
   Dim TEXTBAUSTEIN
   Dim sibject
   
   TEXTBAUSTEIN = "'TEXTBAUSTEIN_EMAIL_" & VorgangTyp & "'"
   
   EmailText = TABLEVALUE("ofKorespondenz", "Subjekt", TEXTBAUSTEIN, "[TEXT]")
   Subject = getDruckForType(VorgangTyp) & " Nr. " & Vorgang_Nummer
   
   On Error Resume Next
   DoCmd.SendObject acSendReport, "buchRechnung", , Email, , , Subject, EmailText
   
   
End Function


Public Function getKundenEmail(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String)
   Dim Email
   Dim rsEmail
   Dim sql

   sql = "select Email from ofAdressen where idnr in (select idnr from " & getVorgangTableForType(VorgangTyp) & " WHERE Nummer = " & Vorgang_Nummer & ")"
   
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
Public Sub OpenAusdruck_inWord_RTF(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
   Call OpenAusdruck_inWord_Filename_RTF(VorgangTyp, Vorgang_Nummer, formatNummer, "Vorlage_Rechnung.rtf")
End Sub

'=================================================================
'opens a textfle and replaces the tags with the informaiton form database
' userd for HTML Outlookmals too !
'=================================================================


Public Sub OpenAusdruck_inWord_Filename_RTF(ByVal VorgangTyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String, ByVal Dateiname As String)
   Dim app 'As Application
   Dim vorlageFilename
   Dim rs As Recordset
   Dim vonForm, vonForm_Artikel
   Dim sql
   Dim rsArt
   
   vonForm = getVorgangTableForType(VorgangTyp)
   vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
   
   
   vorlageFilename = dbFolder() & Dateiname
   Set rs = CurrentDb.openRecordset(getRecSource(VorgangTyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
    

    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        Exit Sub
    End If
    
    If checkIfWeitereVorhanden(rs("idnr"), VorgangTyp) And VorgangTyp = "LI" Then
           If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                          Set rs = CurrentDb.openRecordset(getRecSource_Weitere(VorgangTyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
            End If
    End If
    
  'Anzahl Positionen
   sql = "select count(*) as pos from [" & vonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
   Set rsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   Dim positionen, i
       positionen = rsArt("pos")
        
    
    
    'read RTF content
    Dim fileText, fileContent, fileLine
    Open vorlageFilename For Input As #1
    While Not EOF(1)
            Input #1, fileLine
              If fileContent = "" Then
                fileContent = fileLine
              Else
                fileContent = fileContent & Chr(13) & Chr(10) & _
                              fileLine
              End If
              
              'add lines für jede Position
              If InStr(fileLine, "[ArtNR]") > 0 Then 'je das ist eine Position zeile
                For i = 1 To (positionen - 1)
                    fileContent = fileContent & Chr(13) & Chr(10) & _
                                  fileLine
                Next
              End If
              
    Wend
    Close #1
    
    
    'REPALCE CONTENT
    
    fileContent = Replace(fileContent, "[Idnr]", rs("Idnr") & "")
    fileContent = Replace(fileContent, "[Kundennummer]", rs("Idnr") & "")
     
    fileContent = Replace(fileContent, "[firma]", rs("firma") & "")
    fileContent = Replace(fileContent, "[name]", rs("namen") & "")
    fileContent = Replace(fileContent, "[strasse]", rs("adresse") & "")
    fileContent = Replace(fileContent, "[plz ort]", rs("plzort") & "")

    fileContent = Replace(fileContent, "[Titel]", VorgangTyp & "-" & Vorgang_Nummer)
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
    sql = "select [" & vonForm_Artikel & "].*, " & _
          "Beschreibung from [" & vonForm_Artikel & "],  grArtikel where [" & vonForm_Artikel & "].artnr = grArtikel.artnr " & _
          "and  rechnr=" & Vorgang_Nummer
    Debug.Print sql
    Set rsArt = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    
   While Not rsArt.EOF
      fileContent = Replace(fileContent, "[Stk]", rsArt("Stk"), 1, 1)
      fileContent = Replace(fileContent, "[ArtNR]", rsArt("ArtNR"), 1, 1)
      fileContent = Replace(fileContent, "[Bezeichnung]", pad(rsArt("Bezeichnung") & "", BEZEICHNUNG_LAENGE), 1, 1)
      fileContent = Replace(fileContent, "[Beschreibung]", rsArt("Beschreibung") & "", 1, 1)
      fileContent = Replace(fileContent, "[Preis]", FormatNumber(rsArt("PreisATS"), 2), 1, 1)
      rsArt.MoveNext
   Wend
  
  
  'set Eigenschaften
  sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & VorgangTyp & "'"
  Dim rsEig As Recordset
  Set rsEig = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
  While Not rsEig.EOF
    fileContent = Replace(fileContent, "[" & rsEig("Name") & "]", rsEig("Value") & "")
    rsEig.MoveNext
  Wend
  
  
  
  'SAVE FILE
    Dim saveAsFilename: saveAsFilename = dbFolder() & VorgangTyp & "_" & Vorgang_Nummer & "." & Right(Dateiname, 3)
    If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
        fileContent = Trim(fileContent)
        
        Open saveAsFilename For Output As #1
        Print #1, fileContent
        Close #1
        
        
       'OPEN FILE IN WORD
       
       Set app = CreateObject("Word.Application")
       app.Visible = True
       app.Documents.Open fileName:=saveAsFilename, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False ', Format:=0
       
       'if send Email
       'acFormatDAP
        'acFormatHTML
        'acFormatRTF
        'acFormatTXT
        'acFormatXLS
       'DoCmd.SendObject acSendNoObject, , acFormatHTML, Email, , , Subject, "test", True, "c:\temp\temp\AR_200300004.htm"  'saveAsFilename

    End If
    
End Sub

  'adds spaces to the regquired length
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
