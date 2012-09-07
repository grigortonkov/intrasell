Option Explicit On
Option Strict Off

Imports IntraSell_DLL
Imports GriTon.XML2Word

Module ModuleBuchVorgangXML

    Const VIEWER_WORD As String = "WORD"
    Const VIEWER_XML As String = "XML"
    Const VIEWER_OUTLOOK As String = "OUTLOOK"
    Const VIEWER_PDF As String = "PDF"

    Function XML2WORD() As String
        XML2WORD = dbFolder & "..\components\XML2WordGT\TestXML2Word.exe"
    End Function

    ' Generates new MS Word File using XML2WORD
    ' Viewer = WORD, XML, OUTLOOK or PDF
    ' Returns the filename of the MS Word File
    Function OpenAusdruck_inWord_XML( _
                                ByVal VorgangTyp As String, _
                                ByVal VorgangNummer As Long, _
                                ByVal VorlageFilename As String, _
                                ByVal Viewer As String, _
                                ByVal SofortSenden As Boolean, _
                                ByVal MailText As String) As String

        Application.UseWaitCursor = True

        Dim VonForm As String = getVorgangTableForType(VorgangTyp)
        Dim VonForm_Artikel As String = getVorgangArtikelTableForType(VorgangTyp)
        Dim Data As String = VorgangXML(VorgangNummer, VorgangTyp)

        Dim ArchiveFilename As String = Nothing

        'jetzt XML erstellen

        Dim xml As String
        xml = "<DOCUMENT>" & vbCrLf
        xml = xml & data & vbCrLf
        xml = xml & "</DOCUMENT>"

        'Create TMP Folder 
        'Create Archive Folde if not et exiting 
        If Dir(GetAppPath() & "tmp", vbDirectory) = "" Then
            MkDir(GetAppPath() & "tmp")
        End If

        Dim FileNameXMLDoc As String = DbFolder() & "tmp\Vorgang_" & VonForm & "_" & VorgangTyp & VorgangNummer & ".xml"

        saveXML(xml, FileNameXMLDoc)

        If Not VorlageFilename Is Nothing Then
            Dim ResultFilenamePrefix As String = "Vorgang_" & VorgangTyp & VorgangNummer
            Dim ResultFilename As String = DbFolder() & "tmp\" & ResultFilenamePrefix & "1.doc"


            'merge with word template
            Dim Vorlage As String = DbFolder() & VorlageFilename
            Dim ExportPath As String = DbFolder() & "tmp\"

            ExportPath = VarValue_Default("SPEICHERPLATZ_VORGANG_" & VorgangTyp, ExportPath) 'hier kann der Administrator den Speicherplatz bestimmen

            CallXML2WORD(FileNameXMLDoc, Vorlage, ExportPath, ResultFilenamePrefix)

            'rename file to remove the 1 at the end
            ArchiveFilename = Replace(ResultFilename, DbFolder() & "tmp\", ExportPath)
            ArchiveFilename = Replace(ArchiveFilename, "1.doc", ".doc")
            'nur wenn die datei nicht vorher existiert 
            If Not FileIO.FileSystem.FileExists(ArchiveFilename) Then
                RenameFile(ResultFilename, ArchiveFilename)
            End If

        End If

        'print or send per email
        If Viewer = VIEWER_WORD Then
            If Not ArchiveFilename Is Nothing Then
                DokumentInWordZeigen(ArchiveFilename)
            End If

        ElseIf Viewer = VIEWER_PDF Then
            If Not ArchiveFilename Is Nothing Then
                SaveWordAsPDF(ArchiveFilename)
            End If
        ElseIf Viewer = VIEWER_OUTLOOK Then
            If Not ArchiveFilename Is Nothing Then
                Dim KundenEmail As String = "" & getKundenEmail(VorgangTyp, VorgangNummer)
                Dim MailBetreff As String = getDruckForType(VorgangTyp) & " #" & VorgangNummer
                mailWithOutlook(MailBetreff, KundenEmail, ArchiveFilename, MailText, "", SofortSenden)
            End If

        ElseIf Viewer = VIEWER_XML Then
            Shell(VarValue_Default("XMLVIEWER", "notepad.exe") & " " & FileNameXMLDoc)
        End If

        'Save as document in DokSys if DokSys exists
        Call SaveDokumenteInDokSys(VonForm, CStr(VorgangNummer), FileNameXMLDoc) 'XML output
        If Not ArchiveFilename Is Nothing Then
            Call SaveDokumenteInDokSys(VonForm, CStr(VorgangNummer), ArchiveFilename) 'Word output
        End If
        Application.UseWaitCursor = False

        OpenAusdruck_inWord_XML = ArchiveFilename
    End Function

    'Erstellt XML für einen Vorgang
    Public Function VorgangXML(ByVal VorgangNummer As Long, ByVal VorgangTyp As String) As String
        Try
            Application.UseWaitCursor = True

            Dim xml As String = ""
            Dim VonForm As String = getVorgangTableForType(VorgangTyp)
            Dim VonForm_Artikel As String = getVorgangArtikelTableForType(VorgangTyp)

            Dim language_Code As String = getLanguageForVorgang(VorgangTyp, VorgangNummer)

            xml = xml & "<Vorgang>"

            xml = xml + QueryToXML("select * from " & VonForm & " anf where anf.Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "'")

            'xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_Adressfelder adr " & _
            '            " where a.KundNr = adr.IDNR and a.Nummer=" & VorgangNummer, "Kunde")

            xml = xml + QueryToXML(getRecSource_Address("ofAdressen", "idnr in (select KundNr from  " & VonForm & " where Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "')"), "Kunde")



            'Kundeneinstellungen
            xml = xml + QueryToXML("select k.* from " & VonForm & " a, `ofadressen-settings` ks, buchfirmenkonto k " & _
                        " where a.KundNr = ks.IDNR and ks.Firmenkontoid = k.KontoId and a.Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "'", "UnsereBankVerbindung")

            'Lieferadresse
            'xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_Adressfelder adr " & _
            '            " where a.KundNr2 = adr.IDNR and a.Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "'", "Lieferadresse")
            'Erste / Rechnung Adresse abweichend von der ersten
            xml = xml + QueryToXML(getRecSource_Address("`ofAdressen-Weitere`", "ID in (select KundNr1 from  " & VonForm & " where Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "')"), "Rechnungadresse")
            'Zweite / Lieferadresse 
            xml = xml + QueryToXML(getRecSource_Address("`ofAdressen-Weitere`", "ID in (select KundNr2 from  " & VonForm & " where Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "')"), "Lieferadresse")


            'xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_AdressfelderLieferant adr " & _
            '            " where a.LieferantNr = adr.IDNR and a.Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "'", "Lieferant")
            xml = xml + QueryToXML(getRecSource_Address("lieferantenAdressen", "IDNR in (select LieferantNr from  " & VonForm & " where Nummer=" & VorgangNummer & " and Typ = '" & VorgangTyp & "')"), "Lieferant")


            xml = xml + QueryToXML("select adr.* from " & VonForm & " a, ofMitarbeiter adr " & _
                        " where a.MitarbeiterNr = adr.IDNR and a.Nummer=" & VorgangNummer & " and a.Typ = '" & VorgangTyp & "'", "Mitarbeiter")

            'xml = xml + QueryToXML("select * from buchVorgaengeEigenschaften_Kreuztabelle where VorgangTyp='" & VorgangTyp & "' and VorgangNummer=" & VorgangNummer, "Eigenschaften")

            xml = xml + QueryToXML("SELECT Name, Value FROM buchvorgaengeeigenschaften b where b.VorgangTyp='" & VorgangTyp & "' and b.Nummer=" & VorgangNummer, "Eigenschaften")


            xml = xml & "<Positionen>"

            'xml = xml + QueryToXML("select p.Id , p.RechNr, p.ArtNR, p.PreisATS, p.PreisEuro, p.Stk, p.PreisATS_Brutto, p.ArtikelIdentifikation, " & _
            '             " p.EKPreis, round(p.PreisATS*p.Stk,2) as PreisSummeNetto, round(p.PreisATS_Brutto*p.Stk,2) as PreisSummeBrutto, " & _
            '             " getTranslationDok(""grArtikel"", [p].[ArtNr], ""Bezeichnung"", [p].[Bezeichnung], '" & language_Code & "') as Bezeichnung, " & _
            '             " p.LieferantNR, p.PositionStatus, p.referenz, p.Packung, p.herkunft, p.Incoterm, " & _
            '             " p.Spezifikation, " & _
            '             " getTranslationDok(""grArtikel-Kategorien"", [k].[ArtKatNr], ""Name"", [k].[Name], '" & language_Code & "') as Kategorie " & _
            '             " from [" & VonForm_Artikel & "] p, grArtikel a,  [grArtikel-Kategorien] k " & _
            '             " where p.ArtNr=a.ArtNr and a.ArtKatNr=k.ArtKatNr and p.RechNr=" & VorgangNummer & " and p.Typ = '" & VorgangTyp & "'" & _
            '             " ORDER BY k.Name, [p].[Bezeichnung], p.ArtNr", "Position")


            xml = xml + QueryToXML("select p.*, round(p.Preis_Netto*p.Stk,2) as PreisSummeNetto, round(p.Preis_Brutto*p.Stk,2) as PreisSummeBrutto, " & _
                 " round(p.Preis_Brutto*p.Stk,2) - round(p.Preis_Netto*p.Stk,2) as PreisSummeMWST, " & _
                 " k.Name as Kategorie " & _
                 " from `" & VonForm_Artikel & "` p, grArtikel a,  `grArtikel-Kategorien` k " & _
                 " where p.ArtNr=a.ArtNr and a.ArtKatNr=k.ArtKatNr and p.Nummer=" & VorgangNummer & " and p.Typ = '" & VorgangTyp & "'" & _
                 " ORDER BY p.Id, k.Name, p.Bezeichnung, p.ArtNr", "Position")

            xml = xml & "</Positionen>"

            xml = xml & "</Vorgang>"

            VorgangXML = xml
            Application.UseWaitCursor = False
        Catch ex As Exception
            HandleAppError(ex)
            Application.UseWaitCursor = False
        End Try

    End Function

    Private Sub CallXML2WORD(XMLFilename As String, WordTemplateFilename As String, GenerationPath As String, ResultPraefix As String)
        Try
            Application.UseWaitCursor = True
            Dim xml2Word As XML2WORD = New XML2WORD()
            xml2Word.XMLFile = XMLFilename
            xml2Word.WordTemplate = WordTemplateFilename
            xml2Word.Path = GetAppPath() & "\tmp\" 'where to generate the files 
            xml2Word.DocumentPrefix = ResultPraefix
            xml2Word.Execute(Nothing, False) 'Word is invisible and closed at the end 
            Application.UseWaitCursor = False
        Catch ex As Exception
            Application.UseWaitCursor = False
            HandleAppError(ex)
        End Try
    End Sub

    Public Sub DokumentInWordZeigen(ByVal Dateiname As String, Optional ByVal read_only As Boolean = True)
        Try
            Dim App 'As Application
            App = CreateObject("Word.Application")
            App.Visible = True
            App.Documents.Open(fileName:=Dateiname, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)
            If read_only Then
                App.ActiveDocument.Protect(Password:="xxxqwe", NoReset:=False, Type:= _
                1, UseIRM:=False, EnforceStyleLock:=False)
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Public Sub ProtectDocument(ByVal Dateiname As String)

        Dim App 'As Application
        App = CreateObject("Word.Application")
        App.Visible = True
        App.Documents.Open(fileName:=Dateiname, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)
        App.ActiveDocument.Protect(Password:="xxxqwe", NoReset:=False, Type:= _
             1, UseIRM:=False, EnforceStyleLock:=False)
        App.ActiveDocument.Save()
        App.Quit()

    End Sub


    'returns the filename of the html document
    Public Function SaveWordAsHTML(ByVal filenameWordDoc As String) As String
        Dim App 'As Application
        App = CreateObject("Word.Application")
        App.Visible = True
        App.Documents.Open(fileName:=filenameWordDoc, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)
        App.ActiveDocument.SaveAs(fileName:="c:\convert.htm", FileFormat:=8)  'wdFormatHTML
        ', _
        '    LockComments:=False, Password:="", AddToRecentFiles:=True, WritePassword _
        '   :="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
        '  SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
        '  False
        SaveWordAsHTML = "c:\convert.htm"
        App.Quit()
    End Function

    Private Sub SaveDokumenteInDokSys(p1 As Object, p2 As String, fileName As String)
        'Throw New NotImplementedException
    End Sub


End Module
