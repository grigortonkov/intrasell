VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellVorgaengeAusdruck"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Private preise As IntraSellPreise
Private kundengruppe As IntraSellKundengruppe
Private vars As IntraSellVars

'konstanten
Const BEZEICHNUNG_LAENGE = 70

Public automatisch_speichern    As Boolean
Public dokument_in_word_oeffnen    As Boolean



'modulinitialisierung, unbedingt notwendig
Public Sub init(ByVal connString)

    functionsDB.ConnStringODBC = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
    functionsDB.connOpen
    Set CurrentDB = functionsDB.CurrentDB
    Set vars = New IntraSellVars
    Set preise = New IntraSellPreise
    Set kundengruppe = New IntraSellKundengruppe
    automatisch_speichern = False
    dokument_in_word_oeffnen = True
    vars.init (connString)
    
End Sub

'=======================================================
'=======================================================
Function getRecSource(Vorgangtyp, Vorgang_Nummer)

 Dim vonForm, vonForm_Artikel
 vonForm = preise.getVorgangTableForType(Vorgangtyp)
 vonForm_Artikel = preise.getVorgangArtikelTableForType(Vorgangtyp)
 
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
    'getLand(" & vonForm & ".KundNr), getUID(" & vonForm & ".KundNr),
End Function

Public Function getLand(ByVal Idnr) As String
getLand = vars.TABLEVALUE("grLand", "IDNR", Var.TABLEVALUE("ofAdressen", "Idnr", Idnr, "LAND"), "Name") & ""
End Function

Public Function getUID(ByVal Idnr) As String
getUID = vars.TABLEVALUE("ofAdressen", "Idnr", Idnr, "UID") & ""
End Function

'=======================================================
' prueft ob eine weitere adresse vorhanden ist
'=======================================================
Function checkIfWeitereVorhanden(ByVal Idnr, ByVal Vorgangtyp) As Boolean
checkIfWeitereVorhanden = False
    Dim rs, sql
    sql = "select * from [ofAdressen-Weitere] where idnr=" & Idnr & " AND typ like '" & Vorgangtyp & "'"
    Set rs = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    If Not rs.EOF Then
            checkIfWeitereVorhanden = True
    End If
    
End Function

'=======================================================
' oeffnet den ausdruck mit access formular
'=======================================================
Public Sub OpenAusdruck(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
Call OpenAusdruck_inAccess(Vorgangtyp, Vorgang_Nummer, formatNummer)
End Sub




'=======================================================
' oeffnet den ausdruck mit access formular
'formatNummer = SILENT - kommen keine Fragen
'=======================================================
Public Sub OpenAusdruck_inAccess(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
 Dim recSource ' recordSource für den Ausdruck
 Dim Filter, reply, i
 Dim Vorgang_Name
 Dim vonForm, vonForm_Artikel
  
  
 vonForm = preise.getVorgangTableForType(Vorgangtyp)
 vonForm_Artikel = preise.getVorgangArtikelTableForType(Vorgangtyp)
 Vorgang_Name = preise.getDruckForType(Vorgangtyp)
 
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
        
        CurrentDB.CreateQueryDef "qryBuchRechArtikel", "select * from [" & vonForm_Artikel & "] order by id"
        CurrentDB.CreateQueryDef "qryBuchRech", recSource
        
        

        Dim rsKunden As Recordset
        Set rsKunden = CurrentDB.openRecordset(recSource, dbOpenDynaset, dbSeeChanges)
        Dim kdnr: kdnr = 0
        If Not rsKunden.EOF Then
                 kdnr = rsKunden("idnr")
        End If
        Dim needs: needs = kundengruppe.needsMWST(kdnr)
       
        If checkIfWeitereVorhanden(kdnr, Vorgangtyp) Then
             If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                        recSource = getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer)
                        DoCmd.DeleteObject acQuery, "qryBuchRech"
                        CurrentDB.CreateQueryDef "qryBuchRech", recSource
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
                For i = 1 To vars.VarValue("AnzahlAusdruecke")
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
Public Sub OpenAusdruck_inWord(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
   Call OpenAusdruck_inWord_Filename(Vorgangtyp, Vorgang_Nummer, formatNummer, "Vorlage_Rechnung.doc")
End Sub
Public Sub OpenAusdruck_inWord_Filename(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String, ByVal Dateiname As String)
   Dim app 'As Application
   Dim vorlageFilename
   Dim rs As Recordset
   Dim vonForm, vonForm_Artikel
   Dim sql
   Dim rsArt
   
   vonForm = preise.getVorgangTableForType(Vorgangtyp)
   vonForm_Artikel = preise.getVorgangArtikelTableForType(Vorgangtyp)
   
   
   vorlageFilename = vars.dbFolder() & Dateiname
   
   Set app = CreateObject("Word.Application")
   app.Visible = True
   
    app.Documents.Open FileName:=vorlageFilename, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, Format:=0


    Set rs = openRecordset(getRecSource(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset)
    

        
    
    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        On Error Resume Next
        app.Quit
        Exit Sub
    End If
    
      If checkIfWeitereVorhanden(rs("idnr"), Vorgangtyp) And Vorgangtyp = "LI" Then
             If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                            Set rs = CurrentDB.openRecordset(getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
              End If
        End If
    
    
    Call replaceInWordOnce(app, "[Idnr]", rs("Idnr") & "")
    Call replaceInWordOnce(app, "[Kundennummer]", rs("Idnr") & "")
     
    Call replaceInWordOnce(app, "[firma]", rs("firma") & "")
    Call replaceInWordOnce(app, "[name]", rs("namen") & "")
    Call replaceInWordOnce(app, "[strasse]", rs("adresse") & "")
    Call replaceInWordOnce(app, "[plz ort]", rs("plzort") & "")

    Call replaceInWordOnce(app, "[Titel]", Vorgangtyp & "-" & Vorgang_Nummer)
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
   Set rsArt = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
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
    Set rsArt = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
   While Not rsArt.EOF
      Call replaceInWordOnce(app, "[Stk]", rsArt("Stk"))
      Call replaceInWordOnce(app, "[ArtNR]", rsArt("ArtNR"))
      Call replaceInWordOnce(app, "[Bezeichnung]", rsArt("Bezeichnung") & "")
      Call replaceInWordOnce(app, "[Beschreibung]", rsArt("Beschreibung") & "")
      Call replaceInWordOnce(app, "[Preis]", FormatNumber(rsArt("PreisATS"), 2))
      rsArt.MoveNext
   Wend
  
  'Eigenschaften
  
  sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & Vorgangtyp & "'"
  Dim rsEig As Recordset
  Set rsEig = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
  While Not rsEig.EOF
    Call replaceInWordOnce(app, "[" & rsEig("Name") & "]", rsEig("Value") & "")
    rsEig.MoveNext
  Wend
  
  
  
    Dim saveAsFilename: saveAsFilename = vars.dbFolder() & Vorgangtyp & "_" & Vorgang_Nummer & ".doc"
    If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
      
            app.ActiveDocument.SaveAs FileName:=saveAsFilename, FileFormat:= _
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
Public Sub OpenKorrespondenz_inWord(ByVal Idnr As String, ByVal Subjekt, ByVal BriefText, ByVal Datum, ByVal printAndClose)
   Dim app 'As Application
   Dim vorlageFilename
   Dim rs As Recordset
   Dim vonForm, vonForm_Artikel
   Dim sql
   Dim rsArt
   
   
   vorlageFilename = vars.dbFolder() & "Vorlage_Brief.doc"
   
   Set app = CreateObject("Word.Application")
  
    app.Visible = False
    app.Documents.Open FileName:=vorlageFilename, ConfirmConversions:=False, ReadOnly:=False, AddToRecentFiles:=False, Format:=0
    Set rs = CurrentDB.openRecordset("select * from qry_Adressfelder where idnr=" & Idnr, dbOpenDynaset, dbSeeChanges)
    
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
    Dim saveAsFilename: saveAsFilename = vars.dbFolder() & "Korrespondenz_" & Idnr & "_" & Year(Date) & Month(Date) & Day(Date) & ".doc"
    If Not printAndClose Then
        If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
                app.ActiveDocument.SaveAs FileName:=saveAsFilename, FileFormat:= _
                    0, LockComments:=False, Password:="", AddToRecentFiles:= _
                    True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                    False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                    SaveAsAOCELetter:=False
        End If
    Else ' print and do not close word
                app.ActiveDocument.SaveAs FileName:=saveAsFilename, FileFormat:=0
                app.ActiveDocument.PrintOut
               
               'the word instance will not be closed
              Exit Sub
    End If
    
    On Error Resume Next ' vielleicht ist word bereits vom user geschlossen
    App.Quit
    On Error GoTo 0
   
End Sub




Public Function makeArtikelNummer(ArtNr1) As String
makeArtikelNummer = ArtNr1

    If vars.UseEAN() Then
           Dim rs, sql
    
        sql = "select artnr,ean from grArtikel where artnr = " & ArtNr1
        Set rs = CurrentDB.openRecordset(sql)
        If Not rs.EOF Then
            If Not IsNull(rs("ean")) Then
                 makeArtikelNummer = rs("ean")
                End If
       End If
      End If

End Function

Function sendVorgang_Email(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal formatNummer As String)
    Dim Subject
    Dim Email: Email = getKundenEmail(Vorgangtyp, Vorgang_Nummer)
   
   Call OpenAusdruck_inAccess(Vorgangtyp, Vorgang_Nummer, "SILENT")
   
   Dim EmailText
   Dim TEXTBAUSTEIN
   Dim sibject
   
   TEXTBAUSTEIN = "'TEXTBAUSTEIN_EMAIL_" & Vorgangtyp & "'"
   
   EmailText = vars.TABLEVALUE("ofKorespondenz", "Subjekt", TEXTBAUSTEIN, "[TEXT]")
   Subject = preise.getDruckForType(Vorgangtyp) & " Nr. " & Vorgang_Nummer
   
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
   
   Set rsEmail = CurrentDB.openRecordset(sql)
   
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
   Dim vonForm, vonForm_Artikel
   Dim sql
   Dim rsArt
   
   vonForm = preise.getVorgangTableForType(Vorgangtyp)
   vonForm_Artikel = preise.getVorgangArtikelTableForType(Vorgangtyp)
   
   
   vorlageFilename = vars.dbFolder() & Dateiname
   Set rs = openRecordset(getRecSource(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
    

    
    If rs.EOF Then
        MsgBox "Die Daten sind nicht vorhanden!", vbCritical
        Exit Function
    End If
    
    If checkIfWeitereVorhanden(rs("idnr"), Vorgangtyp) And Vorgangtyp = "LI" Then
           If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
               Set rs = CurrentDB.openRecordset(getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer), dbOpenDynaset, dbSeeChanges)
           End If
    End If
    
  'Anzahl Positionen
   sql = "select count(*) as pos from [" & vonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
   Set rsArt = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
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
    
    fileContent = Replace(fileContent, "[Idnr]", rs("Idnr") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[Kundennummer]", rs("Idnr") & "", , , vbTextCompare)
     
    fileContent = Replace(fileContent, "[firma]", rs("firma") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[name]", rs("namen") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[strasse]", rs("adresse") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[plz ort]", rs("plzort") & "", , , vbTextCompare)

    fileContent = Replace(fileContent, "[Titel]", Vorgangtyp & "-" & Vorgang_Nummer, , , vbTextCompare)
    fileContent = Replace(fileContent, "[Datum]", rs("Datum") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[Betreuer]", "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[Email]", rs("Email") & "", , , vbTextCompare)
    
    fileContent = Replace(fileContent, "[Zahlungsbedingung]", rs("ZahlungsBedungung") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[Zahlungsmethode]", rs("ZahlungsMethode") & "", , , vbTextCompare)
    fileContent = Replace(fileContent, "[Transportmethode]", rs("TransportMethode") & "", , , vbTextCompare)
    
    fileContent = Replace(fileContent, "[Netto]", FormatNumber(rs("summeATS"), 2), , , vbTextCompare)
    fileContent = Replace(fileContent, "[MWST]", FormatNumber(rs("summeATSBrutto") - rs("summeATS"), 2), , , vbTextCompare)
    fileContent = Replace(fileContent, "[Total]", FormatNumber(rs("summeATSBrutto"), 2), , , vbTextCompare)
    

  'copy the artikel line times as needed
  Dim BEZ
    sql = "select [" & vonForm_Artikel & "].*, " & _
          "Beschreibung from [" & vonForm_Artikel & "],  grArtikel where [" & vonForm_Artikel & "].artnr = grArtikel.artnr " & _
          "and  rechnr=" & Vorgang_Nummer
    Debug.Print sql
    Set rsArt = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
    
   While Not rsArt.EOF
      fileContent = Replace(fileContent, "[Stk]", rsArt("Stk"), , -1, vbTextCompare)
      fileContent = Replace(fileContent, "[ArtNR]", rsArt("ArtNR"), , -1, vbTextCompare)
      fileContent = Replace(fileContent, "[Bezeichnung]", pad(rsArt("Bezeichnung") & "", BEZEICHNUNG_LAENGE), , -1, vbTextCompare)
      fileContent = Replace(fileContent, "[Beschreibung]", rsArt("Beschreibung") & "", , -1, vbTextCompare)
      fileContent = Replace(fileContent, "[Preis]", FormatNumber(rsArt("PreisATS"), 2), , -1, vbTextCompare)
      rsArt.MoveNext
   Wend
  
  
        'set Eigenschaften, wird nach [EigName] gesucht und mit Value ersetzt
        sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & Vorgangtyp & "'"
        Dim rsEig As Recordset
        Set rsEig = openRecordset(sql, dbOpenDynaset, dbSeeChanges)
        While Not rsEig.EOF
          fileContent = Replace(fileContent, "[" & rsEig("Name") & "]", rsEig("Value") & "", , , vbTextCompare)
          rsEig.MoveNext
        Wend
  
  
  
   'SAVE FILE
    Dim saveAsFilename: saveAsFilename = vars.dbFolder() & Vorgangtyp & "_" & Vorgang_Nummer & "." & Right(Dateiname, 3)
    Dim speichern As Boolean: speichern = True
    
    If Not automatisch_speichern Then
        If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbNo Then
            speichern = False
        End If
    End If
    
    If speichern Then
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


