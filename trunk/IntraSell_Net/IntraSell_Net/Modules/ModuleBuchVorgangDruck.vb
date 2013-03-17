Option Explicit On
Imports MySql.Data.MySqlClient
Imports System.IO
Imports IntraSell_DLL

Module ModuleBuchVorgangDruck


    Const BEZEICHNUNG_LAENGE As Integer = 40
    Public selectedOfAdressenWeitereId As String 'ausgewählte adresse
    Public currentIDNR As String
 
    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="VorgangTyp"></param>
    ''' <param name="VorgangNummer"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getRecSource(VorgangTyp As String, VorgangNummer As Integer) As String

        'getRecSource = IntraSellVorgaengeAusdruck.getRecSource(Vorgangtyp, Vorgang_Nummer)
        'Exit Function

        Dim VonForm, VonForm_Artikel
        VonForm = getVorgangTableForType(VorgangTyp)
        VonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
        'getRecSource = IntraSellVorgaengeAusdruck.getRecSource(VorgangTyp, VorgangNummer)

        getRecSource = "SELECT '" & VorgangTyp & "'  as VorgangTyp, v.Nummer, a.Idnr, " & _
                        " concat(a.Name, ' ', a.Vorname) as Namen , a.Firma, a.Adresse,  (select concat(grPLZ.plz, ' ' , grPLZ.ort) from grPLZ WHERE a.PLZ = grPLZ.IdNr) AS PLZOrt, (select name from grLand where idnr = a.Land) as Land, a.UID, a.Tel, a.Email, " & _
                        " Sum(Stk*Preis_Netto) AS Summe, Sum(Stk*Preis_Brutto) AS SummeBrutto,  Sum(Stk*Preis_Brutto)-Sum(Stk*Preis_Netto) as SummeMWST , v.Datum," & _
                        " v.Notiz as Notiz,  v.KundNr, v.ZahlungsBedingung," & _
                        " v.Zahlungsmethode, v.TransportMethode,  v.Notiz, Woher, Wohin, a.Anrede , concat(a.Anrede,' ', a.Titel) as AnredeTitel," & _
                        " v.KundNr1, v.KundNr2" & _
                        " FROM ofAdressen as a RIGHT JOIN " & VonForm & " as v ON a.IDNR = v.KundNr" & _
                        " INNER JOIN `" & VonForm_Artikel & "` as va  ON v.Nummer = va.Nummer" & _
                        " LEFT JOIN `ofAdressen-Weitere` as a1 ON a1.IDNR = v.KundNr1 " & _
                        " LEFT JOIN `ofAdressen-Weitere` as a2 ON a1.IDNR = v.KundNr2 " & _
                        " WHERE v.nummer = " & VorgangNummer & "" & _
                        " GROUP BY  '" & VorgangTyp & "' , v.Nummer, a.Idnr, concat(a.Name, ' ', a.Vorname), a.Firma, a.Adresse," & _
                        " v.Datum, v.Notiz, v.KundNr, v.ZahlungsBedingung, v.Zahlungsmethode, v.TransportMethode ," & _
                        " v.Notiz, v.Woher, v.Wohin, a.Anrede, concat(a.Anrede,' ', a.Titel), a.Tel, a.Email, v.KundNr1, v.KundNr2;"

        Debug.Print("Print for SQL: " + getRecSource)
    End Function

    
    ''' <summary>
    ''' liefet den recordsource wenn eine weitere adresse verwendet wird
    ''' </summary>
    ''' <param name="Vorgangtyp"></param>
    ''' <param name="Vorgang_Nummer"></param>
    ''' <param name="selectedId"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function getRecSource_Weitere(ByVal Vorgangtyp, ByVal Vorgang_Nummer, ByVal selectedId)
        getRecSource_Weitere = IntraSellVorgaengeAusdruck.getRecSource_Weitere(Vorgangtyp, Vorgang_Nummer, selectedId)
        writeLog(getRecSource_Weitere)
    End Function


    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="tablename"></param>
    ''' <param name="where"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
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
        Dim rs As MySqlDataReader
        Dim Sql As String
        Sql = "select count(*) as cnt from [ofAdressen-Weitere] where idnr=" & IDNR & " AND Typ = '" & Vorgangtyp & "'"
        rs = openRecordset(sql)
        If rs.Read Then
            checkIfWeitereVorhanden = rs("cnt")
        Else
            checkIfWeitereVorhanden = 0
        End If
        rs.Close()
    End Function
 
    ''' <summary>
    ''' oeffnet den ausdruck mit word formular
    ''' </summary>
    ''' <param name="Vorgangtyp"></param>
    ''' <param name="Vorgang_Nummer"></param>
    ''' <remarks></remarks>
    Public Sub OpenAusdruck_inWord(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String)
        Call OpenAusdruck_inWord_Filename(Vorgangtyp, Vorgang_Nummer, "Vorlagen\\Vorlage_Rechnung.doc")
    End Sub

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="VorgangTyp"></param>
    ''' <param name="VorgangNummer"></param>
    ''' <param name="Dateiname"></param>
    ''' <param name="silent"></param>
    ''' <remarks></remarks>
    Public Sub OpenAusdruck_inWord_Filename(ByVal VorgangTyp As String, _
                                            ByVal VorgangNummer As String, _
                                            ByVal Dateiname As String, _
                                            Optional ByVal silent As Boolean = False)
        Dim App 'As Application
        Dim VorlageFilename

        Dim VonForm, VonForm_Artikel
        Dim sql As String

        Dim rs As MySqlDataReader
        Dim rsArt As MySqlDataReader

        VonForm = getVorgangTableForType(VorgangTyp)
        VonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)


        VorlageFilename = AppFolder() & Dateiname

        App = CreateObject("Word.Application")
        App.Visible = True

        App.Documents.Open(fileName:=VorlageFilename, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)

        sql = getRecSource(VorgangTyp, VorgangNummer)
        rs = openRecordset(sql)

        If Not rs.Read Then
            MsgBox("Es sind keine Daten vorhanden!", vbCritical)
            App.Quit()
            rs.Close()
            Exit Sub
        End If

        Dim idnr As String = rs("IDNR")
        rs.Close()


        If checkIfWeitereVorhanden(idnr, VorgangTyp) > 0 And VorgangTyp = "LI" Then
            If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
                Dim selectedIdNr As String = selectEineWeitereAdresse(VorgangTyp, VorgangNummer)
                sql = getRecSource_Weitere(VorgangTyp, VorgangNummer, selectedIdNr)
            End If
        End If


        rs.Close()
        rs = openRecordset(sql)
        If rs.Read Then

            Call replaceInWordOnce(App, "[Idnr]", rs("Idnr") & "")
            Call replaceInWordOnce(App, "[Kundennummer]", rs("Idnr") & "")

            Call replaceInWordOnce(App, "[firma]", rs("firma") & "")
            Call replaceInWordOnce(App, "[name]", rs("namen") & "")
            Call replaceInWordOnce(App, "[strasse]", rs("adresse") & "")
            Call replaceInWordOnce(App, "[plz ort]", rs("plzort") & "")

            Call replaceInWordOnce(App, "[Titel]", VorgangTyp & "-" & VorgangNummer)
            Call replaceInWordOnce(App, "[Datum]", rs("Datum") & "")
            Call replaceInWordOnce(App, "[Betreuer]", "")
            Call replaceInWordOnce(App, "[Email]", rs("Email") & "")

            Call replaceInWordOnce(App, "[Zahlungsbedingung]", rs("ZahlungsBedingung") & "")
            Call replaceInWordOnce(App, "[Zahlungsmethode]", rs("ZahlungsMethode") & "")
            Call replaceInWordOnce(App, "[Transportmethode]", rs("TransportMethode") & "")

            Call replaceInWordOnce(App, "[Netto]", FormatNumber(rs("Summe"), 2))
            Call replaceInWordOnce(App, "[MWST]", FormatNumber(rs("SummeMWST"), 2))
            Call replaceInWordOnce(App, "[Total]", FormatNumber(rs("SummeBrutto"), 2))
        End If

        rs.Close()

        'PART II - Positionen

        sql = "select count(*) as pos from [" & VonForm_Artikel & "] where Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "'"
        rsArt = openRecordset(sql)
        Dim Positionen
        If rsArt.Read Then

            Positionen = rsArt("pos")
            rsArt.Close()

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

            sql = "select [" & VonForm_Artikel & "].*, Beschreibung from [" & VonForm_Artikel & "],  grArtikel where [" & VonForm_Artikel & "].artnr = grArtikel.artnr " & _
                " and Nummer=" & VorgangNummer & " and Typ='" & VorgangTyp & "'"
            rsArt = openRecordset(sql)
            While rsArt.Read
                Call replaceInWordOnce(App, "[Stk]", rsArt("Stk"))
                Call replaceInWordOnce(App, "[ArtNR]", rsArt("ArtNR"))
                Call replaceInWordOnce(App, "[Bezeichnung]", rsArt("Bezeichnung") & "")
                Call replaceInWordOnce(App, "[Beschreibung]", rsArt("Beschreibung") & "")
                Call replaceInWordOnce(App, "[Preis]", FormatNumber(rsArt("Preis_Netto"), 2))
                Call replaceInWordOnce(App, "[Preis_Netto]", FormatNumber(rsArt("Preis_Netto"), 2))
                Call replaceInWordOnce(App, "[Preis_Brutto]", FormatNumber(rsArt("Preis_Brutto"), 2))
                Call replaceInWordOnce(App, "[MWST]", FormatNumber(rsArt("Mwst"), 2))
            End While
            rsArt.Close()

        End If
        rsArt.Close()
        'Eigenschaften

        sql = "select  * from buchVorgaengeEigenschaften where Nummer  = " & VorgangNummer & " and  vorgangtyp like '" & VorgangTyp & "'"
        Dim rsEig As MySqlDataReader
        rsEig = openRecordset(sql)
        While rsEig.Read
            Call replaceInWordOnce(App, "[" & rsEig("Name") & "]", rsEig("Value") & "")
        End While
        rsEig.Close()


        Dim saveAsFilename As String = AppFolder() & VorgangTyp & "_" & VorgangNummer & ".doc"
        If Not silent Then
            If MsgBox("Datei " & saveAsFilename & " speichern?", vbYesNo) = vbYes Then

                App.ActiveDocument.SaveAs(fileName:=saveAsFilename, FileFormat:= _
                    0, LockComments:=False, Password:="", AddToRecentFiles:= _
                    True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
                    False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
                    SaveAsAOCELetter:=False)

            End If
        Else
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

 
    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="App"></param>
    ''' <param name="what"></param>
    ''' <param name="withValue"></param>
    ''' <remarks></remarks>
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


 
    ''' <summary>
    ''' erstellt eine WORD Datei mit den gegebenen Informationen
    ''' </summary>
    ''' <param name="IDNR"></param>
    ''' <param name="Subjekt"></param>
    ''' <param name="BriefText"></param>
    ''' <param name="Datum"></param>
    ''' <param name="PrintAndClose"></param>
    ''' <remarks></remarks>
    Public Sub OpenKorrespondenz_inWord(ByVal IDNR As String, _
                                        ByVal Subjekt As String, _
                                        ByVal BriefText As String, _
                                        ByVal Datum As Date, _
                                        ByVal PrintAndClose As Boolean)
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
        If Not PrintAndClose Then
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

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="ArtNr1"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function makeArtikelNummer(ArtNr1 As Integer) As String
        makeArtikelNummer = ArtNr1

        If UseEAN() Then
            Dim rs As MySqlDataReader, sql

            sql = "select artnr, ean from grArtikel where artnr = " & ArtNr1
            rs = openRecordset(sql)
            If rs.Read Then
                If Not IsNull(rs("ean")) Then
                    makeArtikelNummer = rs("ean")
                End If
            End If
        End If

    End Function
 

    ''' <summary>
    ''' 
    ''' </summary>
    ''' <param name="VorgangTyp"></param>
    ''' <param name="VorgangNummer"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getKundenEmail(ByVal VorgangTyp As String, ByVal VorgangNummer As String)
        Dim Email As String
        Dim rsEmail As MySqlDataReader
        Dim sql As String

        sql = "select Email from ofAdressen where idnr in (select KundNr from " & getVorgangTableForType(VorgangTyp) & " WHERE Typ ='" & VorgangTyp & "' and Nummer = " & VorgangNummer & ")"

        If VorgangTyp = "LAU" Then
            sql = "select Email from lieferantenAdressen where idnr in (select LieferantNr from " & getVorgangTableForType(VorgangTyp) & " WHERE Nummer = " & VorgangNummer & ")"
        End If

        rsEmail = openRecordset(sql)

        Email = "kunden Email"
        If rsEmail.Read Then
            Email = rsEmail("Email")
        End If
        rsEmail.Close()
        getKundenEmail = Email
    End Function
 
    ''' <summary>
    ''' oeffnet den ausdruck mit Word Vorlage
    ''' </summary>
    ''' <param name="Vorgangtyp"></param>
    ''' <param name="Vorgang_Nummer"></param>
    ''' <param name="FormatNummer"></param>
    ''' <remarks></remarks>
    Public Sub OpenAusdruck_inWord_RTF(ByVal Vorgangtyp As String, ByVal Vorgang_Nummer As String, ByVal FormatNummer As String)
        Call OpenAusdruck_InWord_Filename_RTF(Vorgangtyp, Vorgang_Nummer, FormatNummer, "Vorlage_Rechnung.rtf")
    End Sub

    ''' <summary>
    ''' Hilfe Funktion
    ''' </summary>
    ''' <param name="Dateiname"></param>
    ''' <param name="Positionen"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
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

 
    ''' <summary>
    '''  Opens a textfle and replaces the tags with the informaiton from the database
    ''' Used for HTML Outlookmails too !
    ''' </summary>
    ''' <param name="Vorgangtyp"></param>
    ''' <param name="Vorgang_Nummer"></param>
    ''' <param name="Dateiname"></param>
    ''' <param name="Silent">true -> File inWord öffnen</param>
    ''' <returns>Liefert Dateiname der erstellten Datei retour</returns>
    ''' <remarks></remarks>
    Public Function OpenAusdruck_InWord_Filename_RTF( _
        ByVal Vorgangtyp As String, _
        ByVal Vorgang_Nummer As String, _
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
            Return False
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

        fileContent = Replace(fileContent, "[Zahlungsbedingung]", rs("ZahlungsBedingung") & "")
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

    ''' <summary>
    ''' adds spaces to the required length
    ''' </summary>
    ''' <param name="stringToPad"></param>
    ''' <param name="length"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
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

 
    ''' <summary>
    ''' Liefert die Auswahl einer weiteren Adresse
    ''' </summary>
    ''' <param name="Vorgangtyp"></param>
    ''' <param name="Vorgang_Nummer"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
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
