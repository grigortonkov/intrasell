Option Explicit On
Imports MySql.Data.MySqlClient
Imports System.IO
Imports IntraSell_DLL

Module ModuleBuchVorgangDruck


    Const BEZEICHNUNG_LAENGE = 40
    Public selectedOfAdressenWeitereId As String 'ausgewählte adresse
    Public currentIDNR As String

    '=======================================================
    '=======================================================
    Public Function getRecSource(VorgangTyp As String, VorgangNummer As Integer) As String

        'getRecSource = IntraSellVorgaengeAusdruck.getRecSource(Vorgangtyp, Vorgang_Nummer)
        'Exit Function

        Dim VonForm, VonForm_Artikel
        VonForm = getVorgangTableForType(VorgangTyp)
        VonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
        'getRecSource = IntraSellVorgaengeAusdruck.getRecSource(VorgangTyp, VorgangNummer)

        getRecSource = "SELECT '" & VorgangTyp & "'  as VorgangTyp, v.Nummer, a.Idnr, " & _
                        " concat(a.Name, ' ', a.Vorname) as Namen , a.Firma, a.Adresse,  (select concat(grPLZ.plz, ' ' , grPLZ.ort) from grPLZ WHERE a.PLZ = grPLZ.IdNr) AS PLZOrt, (select name from grLand where idnr = a.Land) as Land, a.UID, a.Tel, a.Email, " & _
                        " Sum(Stk*Preis_Netto) AS Summe, Sum(Stk*Preis_Brutto) AS SummeBrutto, v.Datum," & _
                        " v.Notiz as Notiz,  v.KundNr, v.ZahlungsBedungung," & _
                        " v.Zahlungsmethode, v.TransportMethode,  v.Notiz, Woher, Wohin, a.Anrede , concat(a.Anrede,' ', a.Titel) as AnredeTitel," & _
                        " v.KundNr1, v.KundNr2" & _
                        " FROM ofAdressen as a RIGHT JOIN " & VonForm & " as v ON a.IDNR = v.KundNr" & _
                        " INNER JOIN `" & VonForm_Artikel & "` as va  ON v.Nummer = va.Nummer" & _
                        " LEFT JOIN `ofAdressen-Weitere` as a1 ON a1.IDNR = v.KundNr1 " & _
                        " LEFT JOIN `ofAdressen-Weitere` as a2 ON a1.IDNR = v.KundNr2 " & _
                        " WHERE v.nummer = " & VorgangNummer & "" & _
                        " GROUP BY  '" & VorgangTyp & "' , v.Nummer, a.Idnr, concat(a.Name, ' ', a.Vorname), a.Firma, a.Adresse," & _
                        " v.Datum, v.Notiz, v.KundNr, v.ZahlungsBedungung, v.Zahlungsmethode, v.TransportMethode ," & _
                        " v.Notiz, v.Woher, v.Wohin, a.Anrede, concat(a.Anrede,' ', a.Titel), a.Tel, a.Email, v.KundNr1, v.KundNr2;"

        Debug.Print("Print for SQL: " + getRecSource)
    End Function

    '=======================================================
    ' liefet den recordsource wenn eine weitere adresse verwendet wird
    '=======================================================
    Function getRecSource_Weitere(ByVal Vorgangtyp, ByVal Vorgang_Nummer, ByVal selectedId)
        getRecSource_Weitere = IntraSellVorgaengeAusdruck.getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer, selectedId)
        writeLog(getRecSource_Weitere)
    End Function


    Function getRecSource_Address(tablename As String, where As String) As String
        Dim sql As String
        sql = "SELECT a.Vorname, a.Name, concat(a.Name, ' ', a.Vorname) as Namen , a.Firma, a.Adresse,  " & _
       " (select concat(grPLZ.plz, ' ' , grPLZ.ort) from grPLZ WHERE a.PLZ = grPLZ.IdNr) AS PLZOrt, " & _
       " (select name from grLand where idnr = a.Land) as Land, a.UID, a.Tel, a.Email, a.UID " & _
       " FROM " & tablename & " a WHERE " & where
        Return sql
    End Function

    Public Function getLand(ByVal IDNR) As String
        getLand = TableValue("grLand", "IDNR", TableValue("ofAdressen", "Idnr", IDNR, "LAND"), "Name") & ""
    End Function

    Public Function getUID(ByVal IDNR) As String
        getUID = TableValue("ofAdressen", "Idnr", IDNR, "UID") & ""
    End Function

    'Public Function getLand_new(ByVal IDNR) As String
    '    'Return IntraSellVorgaengeAusdruck.getLand(IDNR)
    'End Function

    'Public Function getUID_new(ByVal IDNR) As String
    '    'Return IntraSellVorgaengeAusdruck.getUID(IDNR)
    'End Function

    '=======================================================
    ' prueft ob eine weitere adresse vorhanden ist
    '=======================================================
    Function checkIfWeitereVorhanden(ByVal IDNR, ByVal Vorgangtyp) As Integer
        checkIfWeitereVorhanden = 0
        Dim rs, sql
        sql = "select count(*) as cnt from [ofAdressen-Weitere] where idnr=" & IDNR & " AND typ = '" & Vorgangtyp & "'"
        rs = openRecordset(sql)
        If Not rs.EOF Then
            checkIfWeitereVorhanden = rs("cnt")
        Else
            checkIfWeitereVorhanden = 0
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
        'Dim recSource ' recordSource für den Ausdruck
        'Dim Filter, reply, i
        'Dim Vorgang_Name
        'Dim VonForm, VonForm_Artikel


        'VonForm = getVorgangTableForType(Vorgangtyp)
        'VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
        'Vorgang_Name = getDruckForType(Vorgangtyp)

        'Debug.Print(recSource)
        'reply = vbYes

        'If FormatNummer <> "SILENT" Then
        '    If VarValue("AnzahlAusdruecke") <> "1" Then
        '        reply = MsgBox("Wollen Sie " & VarValue("AnzahlAusdruecke") & " Kopien ausdrucken?", vbYesNo)
        '    Else
        '        reply = vbYes
        '    End If
        'End If

        'If reply = vbYes Then

        '    recSource = getRecSource(Vorgangtyp, Vorgang_Nummer)

        '    Filter = "Nummer = " & Vorgang_Nummer


        '    'preview
        '    On Error Resume Next
        '    DoCmd.DeleteObject(acQuery, "qryBuchRechArtikel")
        '    DoCmd.DeleteObject(acQuery, "qryBuchRech")
        '    On Error GoTo 0

        '    CurrentDb.CreateQueryDef("qryBuchRechArtikel", "select * from [" & VonForm_Artikel & "] order by id")
        '    CurrentDb.CreateQueryDef("qryBuchRech", recSource)



        '    Dim rsKunden As Recordset
        '    rsKunden = CurrentDb.openRecordset(recSource, dbOpenDynaset, dbSeeChanges)
        '    Dim kdnr : kdnr = 0
        '    If Not rsKunden.EOF Then
        '        kdnr = rsKunden("idnr")
        '    End If
        '    Dim needs : needs = needsMWST(kdnr)

        '    If checkIfWeitereVorhanden(kdnr, Vorgangtyp) > 0 Then
        '        If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) = vbYes Then
        '            Dim selectedIdNr : selectedIdNr = selectEineWeitereAdresse(Vorgangtyp, Vorgang_Nummer)
        '            recSource = getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer, selectedIdNr)
        '            DoCmd.DeleteObject(acQuery, "qryBuchRech")
        '            CurrentDb.CreateQueryDef("qryBuchRech", recSource)
        '        End If
        '    End If


        '    DoCmd.OpenReport(VarValue("MSACCESS_VORGANG_BERICHTNAME"), acViewPreview)
        '    'set MWST Visible or invisible according the Kundengruppe

        '    'Reports![ buchRechnung].[Title] = "Dokument"
        '    Dim rpt As Report
        '    rpt = Reports(VarValue("MSACCESS_VORGANG_BERICHTNAME"))


        '    'Laut Eva Janout sollte auch für 0 % MWST Rechungen Gesamtbetrag kommen
        '    If False Then
        '        rpt![mwstATS].Visible = needs
        '        rpt![summeATSBrutto].Visible = needs
        '        rpt![lblMWST].Visible = needs
        '        rpt![lblGesamtbetrag].Visible = needs
        '    End If
        '    'end set

        '    '0 Prozent MWST Ausweisen!
        '    If Not needs Then
        '        rpt![lblMWST].Caption = "0% MwSt:"
        '        rpt![lblMWST].Visible = True
        '    End If


        '    'DoCmd.Save acReport, "buchRechnung"

        '    If FormatNummer <> "SILENT" Then
        '        For i = 1 To VarValue("AnzahlAusdruecke")
        '            'preview
        '            DoCmd.OpenReport(VarValue("MSACCESS_VORGANG_BERICHTNAME"), acPreview, , Filter)
        '            'für Drucken
        '            If MsgBox("Jetzt Ausdrucken?", vbYesNo) = vbYes Then
        '                DoCmd.OpenReport(VarValue("MSACCESS_VORGANG_BERICHTNAME"), acNormal, , Filter)
        '            Else
        '                Exit Sub 'leave report opened
        '            End If
        '        Next
        '    End If

        '    DoCmd.Close(acReport, VarValue("MSACCESS_VORGANG_BERICHTNAME"))
        '    'Forms![buchRechnung]![checkBox_ausgedruckt] = True
        '    'DoCmd.Close acForm, "buchRechnung"
        'End If
    End Sub

    '=================================================================
    ' oeffnet den ausdruck mit word formular
    '=================================================================
    Public Sub OpenAusdruck_inWord(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String)
        Call OpenAusdruck_inWord_Filename(Vorgangtyp, Vorgang_Nummer, "Vorlagen\\Vorlage_Rechnung.doc")
    End Sub

    Public Sub OpenAusdruck_inWord_Filename(ByVal Vorgangtyp As String, _
                                            ByVal Vorgang_Nummer As String, _
                                            ByVal Dateiname As String)
        Dim App 'As Application
        Dim VorlageFilename

        Dim VonForm, VonForm_Artikel
        Dim sql As String

        Dim rs As MySqlDataReader
        Dim rsArt As MySqlDataReader

        VonForm = getVorgangTableForType(Vorgangtyp)
        VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)


        VorlageFilename = AppFolder() & Dateiname

        App = CreateObject("Word.Application")
        App.Visible = True

        App.Documents.Open(fileName:=VorlageFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)

        sql = getRecSource(Vorgangtyp, Vorgang_Nummer)
        rs = openRecordset(sql)

        If Not rs.Read Then
            MsgBox("Es sind keine Daten vorhanden!", vbCritical)
            App.Quit()
            rs.Close()
            Exit Sub
        End If

        Dim idnr As String = rs("IDNR")
        rs.Close()


        If checkIfWeitereVorhanden(idnr, Vorgangtyp) > 0 And Vorgangtyp = "LI" Then
            If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                Dim selectedIdNr As String = selectEineWeitereAdresse(Vorgangtyp, Vorgang_Nummer)
                sql = getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer, selectedIdNr)
            End If
        End If


        rs.Close()
        rs = openRecordset(sql)


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
        rs.Close()

        'PART II - Positionen

        sql = "select count(*) as pos from [" & VonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
        rsArt = openRecordset(sql)
        Dim Positionen
        Positionen = rsArt("pos")


        'copy the artikel line times as needed
        App.Selection.MoveUp(Unit:=7, Count:=3)
        App.Selection.Find.ClearFormatting()
        App.Selection.Find.replacement.ClearFormatting()
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


        Dim foundstk : foundstk = App.Selection.Find.execute
        App.Selection.EndKey(Unit:=5, Extend:=1)
        App.Selection.Copy()
        Dim i
        If foundstk Then
            For i = 1 To Positionen
                App.Selection.Paste()
            Next i
        End If
        'replace artnr, preis etc.

        sql = "select [" & VonForm_Artikel & "].*, Beschreibung from [" & VonForm_Artikel & "],  grArtikel where [" & VonForm_Artikel & "].artnr = grArtikel.artnr and  rechnr=" & Vorgang_Nummer
        Debug.Print(sql)
        rsArt = openRecordset(sql)
        While rsArt.Read
            Call replaceInWordOnce(App, "[Stk]", rsArt("Stk"))
            Call replaceInWordOnce(App, "[ArtNR]", rsArt("ArtNR"))
            Call replaceInWordOnce(App, "[Bezeichnung]", rsArt("Bezeichnung") & "")
            Call replaceInWordOnce(App, "[Beschreibung]", rsArt("Beschreibung") & "")
            Call replaceInWordOnce(App, "[Preis]", FormatNumber(rsArt("PreisATS"), 2))
        End While
        rsArt.Close()
        'Eigenschaften

        sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & Vorgangtyp & "'"
        Dim rsEig As MySqlDataReader
        rsEig = openRecordset(sql)
        While rsEig.Read
            Call replaceInWordOnce(App, "[" & rsEig("Name") & "]", rsEig("Value") & "")

        End While
        rsEig.Close()


        Dim saveAsFilename As String = AppFolder() & Vorgangtyp & "_" & Vorgang_Nummer & ".doc"
        If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then

            App.ActiveDocument.SaveAs(fileName:=saveAsFilename, FileFormat:= _
                0, LockComments:=False, Password:="", AddToRecentFiles:= _
                True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                SaveAsAOCELetter:=False)

        End If

        On Error Resume Next ' vielleicht ist word bereits geschlossen
        App.Quit()
        On Error GoTo 0
    End Sub

    '=================================================================
    '=================================================================
    Private Sub replaceInWordOnce(App As Object, ByVal what As String, ByVal withValue As String)
        On Error GoTo 1
        App.Selection.MoveUp(Unit:=7, Count:=4)
        App.Selection.Find.ClearFormatting()
        App.Selection.Find.replacement.ClearFormatting()
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


        App.Selection.Find.execute(Replace:=1) 'wdReplaceAll
        Exit Sub
1:
        Debug.Print("Cannot replace " & what)
    End Sub


    '=================================================================
    'erstellt eine WORD Datei mit den gegebenen Informationen
    '=================================================================
    Public Sub OpenKorrespondenz_inWord(ByVal IDNR As String, _
                                        ByVal Subjekt As String, _
                                        ByVal BriefText As String, _
                                        ByVal Datum As Date, _
                                        ByVal printAndClose As Boolean)
        Dim App 'As Application
        Dim VorlageFilename
        Dim rs As MySqlDataReader
        Dim VonForm, VonForm_Artikel
        Dim sql As String
        Dim RsArt


        VorlageFilename = DbFolder() & "Vorlage_Brief.doc"

        App = CreateObject("Word.Application")

        App.Visible = False
        App.Documents.Open(fileName:=VorlageFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)
        rs = openRecordset("select * from qry_Adressfelder where idnr=" & IDNR)

        If Not rs.Read Then
            MsgBox("Die Daten sind nicht vorhanden!", vbCritical)
            On Error Resume Next
            App.Quit()
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
        App.Selection.TypeText(BriefText & "")
        App.Visible = True
        Dim saveAsFilename As String = AppFolder() & "Korrespondenz_" & IDNR & "_" & Year(Today) & Month(Today) & (Today) & ".doc"
        If Not printAndClose Then
            If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then
                App.ActiveDocument.SaveAs(fileName:=saveAsFilename, FileFormat:= _
                    0, LockComments:=False, Password:="", AddToRecentFiles:= _
                    True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                    False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                    SaveAsAOCELetter:=False)
            End If
        Else ' print and do not close word
            App.ActiveDocument.SaveAs(fileName:=saveAsFilename, FileFormat:=0)
            App.ActiveDocument.PrintOut()

            'the word instance will not be closed
            Exit Sub
        End If

        On Error Resume Next ' vielleicht ist word bereits vom user geschlossen
        App.Quit()
        On Error GoTo 0

    End Sub




    Public Function makeArtikelNummer(ArtNr1 As Integer) As String
        makeArtikelNummer = ArtNr1

        If UseEAN() Then
            Dim rs As MySqlDataReader, sql

            sql = "select artnr,ean from grArtikel where artnr = " & ArtNr1
            rs = openRecordset(sql)
            If rs.Read Then
                If Not IsNull(rs("ean")) Then
                    makeArtikelNummer = rs("ean")
                End If
            End If
        End If

    End Function

    Function sendVorgang_Email(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
        Dim Subject
        Dim Email : Email = getKundenEmail(Vorgangtyp, Vorgang_Nummer)

        Call OpenAusdruck_inAccess(Vorgangtyp, Vorgang_Nummer, "SILENT")

        Dim EmailText
        Dim TextBaustein
        'Dim sibject

        TextBaustein = "'TEXTBAUSTEIN_EMAIL_" & Vorgangtyp & "'"

        EmailText = TableValue("ofKorespondenz", "Subjekt", TextBaustein, "[TEXT]")
        Subject = getDruckForType(Vorgangtyp) & " Nr. " & Vorgang_Nummer

        'TODO
        MsgBox("Not implemented!")
        'DoCmd.SendObject(acSendReport, VarValue("MSACCESS_VORGANG_BERICHTNAME"), , Email, , , Subject, EmailText)

    End Function


    Public Function getKundenEmail(ByVal VorgangTyp As String, ByVal VorgangNummer As String)
        Dim Email
        Dim rsEmail
        Dim sql

        sql = "select Email from ofAdressen where idnr in (select KundNr from " & getVorgangTableForType(VorgangTyp) & " WHERE Nummer = " & VorgangNummer & ")"

        If VorgangTyp = "LAU" Then
            sql = "select Email from lieferantenAdressen where idnr in (select LieferantNr from " & getVorgangTableForType(VorgangTyp) & " WHERE Nummer = " & VorgangNummer & ")"
        End If

        rsEmail = openRecordset(sql)

        Email = "kunden Email"
        If Not rsEmail.EOF Then
            Email = rsEmail("Email")
        End If
        rsEmail.Close()
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
        Dim VorlageFilename As String = DbFolder() & Dateiname
        Dim fileContent As String = "", fileLine As String = ""
        Dim i As Integer
        Using infile As StreamReader = New StreamReader(VorlageFilename)


            'Open VorlageFilename For Input As #1
            While fileLine = infile.ReadLine

                If fileContent = "" Then
                    fileContent = fileLine
                Else
                    fileContent = fileContent & Chr(13) & Chr(10) & fileLine
                End If

                'add lines für jede Position
                If InStr(fileLine, "[ArtNR]") > 0 Or InStr(fileLine, "[EAN]") > 0 Then 'je das ist eine Position zeile
                    For i = 1 To (Positionen - 1)
                        fileContent = fileContent & Chr(13) & Chr(10) & _
                            fileLine
                    Next
                End If
            End While
        End Using

        readFileContent = fileContent
    End Function

    '=================================================================
    ' Opens a textfle and replaces the tags with the informaiton from the database
    ' Used for HTML Outlookmails too !
    ' Liefert Dateiname der erstellten Datei retour
    ' silent = true -> File inWord öffnen
    '=================================================================
    'TODO: converted but never tested -> create unit test
    Public Function OpenAusdruck_InWord_Filename_RTF( _
        ByVal Vorgangtyp As String, _
        ByVal Vorgang_Nummer As String, _
        ByVal FormatNummer As String, _
        ByVal Dateiname As String, _
        Optional Silent As Boolean = False)

        Dim App 'As Application

        Dim rs As MySqlDataReader
        Dim VonForm, VonForm_Artikel
        Dim sql
        Dim RsArt

        VonForm = getVorgangTableForType(Vorgangtyp)
        VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
 
        rs = openRecordset(getRecSource(Vorgangtyp, Vorgang_Nummer))
 
        If Not rs.Read Then
            MsgBox("Es sind keine Daten vorhanden!", vbCritical)
            Exit Function
        End If

        If checkIfWeitereVorhanden(rs("idnr"), Vorgangtyp) > 0 And Vorgangtyp = "LI" Then
            If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) = vbYes Then
                Dim selectedIdNr As String : selectedIdNr = selectEineWeitereAdresse(Vorgangtyp, Vorgang_Nummer)
                Dim sql1 As String : sql1 = getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer, selectedIdNr)
                rs = openRecordset(sql1)
            End If
        End If

        'Anzahl Positionen
        sql = "select count(*) as pos from [" & VonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
        RsArt = openRecordset(sql)
        Dim Positionen
        Positionen = RsArt("pos")






        'REPLACE CONTENT
        Dim fileContent As String : fileContent = readFileContent(Dateiname, Positionen)
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

        sql = "select [" & VonForm_Artikel & "].*, " & _
              "Beschreibung, EAN from [" & VonForm_Artikel & "],  grArtikel where [" & VonForm_Artikel & "].artnr = grArtikel.artnr " & _
              "and  rechnr=" & Vorgang_Nummer
        Debug.Print(sql)
        RsArt = openRecordset(sql)

        While Not RsArt.EOF
            fileContent = Replace(fileContent, "[Stk]", RsArt("Stk"), 1, 1)
            fileContent = Replace(fileContent, "[ArtNR]", RsArt("ArtNR"), 1, 1)
            fileContent = Replace(fileContent, "[EAN]", RsArt("EAN"), 1, 1)
            fileContent = Replace(fileContent, "[Bezeichnung]", pad(RsArt("Bezeichnung") & "", BEZEICHNUNG_LAENGE), 1, 1)
            fileContent = Replace(fileContent, "[Beschreibung]", RsArt("Beschreibung") & "", 1, 1)
            fileContent = Replace(fileContent, "[Preis]", FormatNumber(RsArt("Preis_Netto"), 2), 1, 1)
            fileContent = Replace(fileContent, "[PreisBrutto]", FormatNumber(RsArt("Preis_Brutto"), 2), 1, 1)
            RsArt.MoveNext()
        End While


        'set Eigenschaften
        sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & Vorgangtyp & "'"
        Dim rsEig As MySqlDataReader
        rsEig = openRecordset(sql)
        While rsEig.Read
            fileContent = Replace(fileContent, "[" & rsEig("Name") & "]", rsEig("Value") & "")
        End While
        rsEig.Close()


        'SAVE FILE
        Dim saveAsFilename As String = DbFolder() & Vorgangtyp & "_" & Vorgang_Nummer & "." & Right(Dateiname, 3)

        fileContent = Trim(fileContent)
        Using outfile As StreamWriter = New StreamWriter(saveAsFilename, True)
            outfile.Write(fileContent)
            outfile.Close()
        End Using
        'Open saveAsFilename For Output As #1
        'Print #1, fileContent
        'Close #1

        OpenAusdruck_InWord_Filename_RTF = saveAsFilename

        If Not Silent Then 'OPEN FILE IN WORD
            App = CreateObject("Word.Application")
            App.Visible = True
            App.Documents.Open(fileName:=saveAsFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False) ', Format:=0
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
        Dim i : i = 0
        If Len(stringToPad) < length Then
            Dim missingChars : missingChars = length - Len(stringToPad)
            For i = 1 To missingChars
                stringToPad = stringToPad & " "
            Next
            pad = stringToPad
        Else ' more the length signs
            pad = Left(stringToPad, length - 3) & "..."
        End If

    End Function


    'Liefert die Auswahl einer weiteren Adresse
    Public Function selectEineWeitereAdresse(Vorgangtyp, Vorgang_Nummer) As Integer
        Dim VonForm As String = getVorgangTableForType(Vorgangtyp)

        'Falls mehrere weitere adressen vom gleichen Vorgangtyp definiert sind dann abfragen welche zu verwenden ist
        Dim IDNR As String = TableValue(VonForm, "Nummer", Vorgang_Nummer, "KundNr")

        selectEineWeitereAdresse = IDNR

        Dim sqlMehrereWeitereAdressen As String = "select * from [ofAdressen-Weitere] where idnr = " & IDNR & " and Typ like '" & Vorgangtyp & "'"
        Dim rsMehrereWeitereAdressen As MySqlDataReader = openRecordset(sqlMehrereWeitereAdressen)

        Dim RecordCount = 0
        While rsMehrereWeitereAdressen.Read
            RecordCount += 1
        End While


        If RecordCount = 1 Then
            selectEineWeitereAdresse = rsMehrereWeitereAdressen("ID")
        ElseIf RecordCount > 1 Then
            currentIDNR = IDNR
            OpenForm("ofAdressen-WeitereAuswahl")
            selectEineWeitereAdresse = selectedOfAdressenWeitereId ' Forms("ofAdressen-WeitereAuswahl").selectedId
        End If

    End Function

    Private Function DoCmd() As Object
        Throw New NotImplementedException
    End Function

End Module
