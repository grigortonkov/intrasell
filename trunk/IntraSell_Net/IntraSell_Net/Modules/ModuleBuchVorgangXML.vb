Option Explicit On
Imports IntraSell_DLL

Module ModuleBuchVorgangXML


    Function XML2WORD() As String
        XML2WORD = dbFolder & "..\components\XML2WordGT\TestXML2Word.exe"
    End Function

    'Viewer = WORD
    'Viewer = OUTLOOK
    ' Returns the filename of the XML File
    Function OpenAusdruck_inWord_XML(ByVal vorgangnummer As Long, _
                                ByVal Vorgangtyp As String, _
                                ByVal VorlageFilename As String, _
                                ByVal Viewer As String, _
                                ByVal SofortSenden As Boolean, _
                                ByVal MailText As String) As String
        Dim VonForm As String
        Dim VonForm_Artikel

        VonForm = getVorgangTableForType(Vorgangtyp)
        VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)



        'jetzt XML erstellen
        Dim xml
        xml = "<DOCUMENT>"
        xml = xml & VorgangXML(vorgangnummer, Vorgangtyp)
        xml = xml & "</DOCUMENT>"

        Dim fileName As String
        fileName = dbFolder & "tmp\Vorgang_" & VonForm & "_" & Vorgangtyp & vorgangnummer & ".xml"

        Call saveXML(xml, fileName)

        Dim resultFilenamePrefix : resultFilenamePrefix = "Vorgang_" & Vorgangtyp & vorgangnummer
        Dim resultFilename
        resultFilename = dbFolder & "tmp\" & resultFilenamePrefix & "1.doc"


        'merge with word template
        Dim Vorlage As String : Vorlage = dbFolder & VorlageFilename
        Dim exportPath : exportPath = dbFolder & "tmp\"

        'http://code.google.com/p/intrasell/issues/detail?id=91&q=interdel
        exportPath = VarValue_Default("SPEICHERPLATZ_VORGANG_" & Vorgangtyp, exportPath) 'hier kann der Administrator den Speicherplatz bestimmern

        ' Shell XML2WORD & " """ & filename & """ """ & vorlage & """ " & exportPath & " """ & resultFilenamePrefix & """", vbNormalFocus
        SynchShell(XML2WORD() & " """ & fileName & """ """ & Vorlage & """ " & exportPath & " """ & resultFilenamePrefix & """")

        'rename file to remove the 1 at the end

        resultFilename = Replace(resultFilename, dbFolder & "tmp\", exportPath)

        renameFile(resultFilename, Replace(resultFilename, "1.doc", ".doc"))
        resultFilename = Replace(resultFilename, "1.doc", ".doc")

        'print or send per email


        If False Then
            If MsgBox("Wurde die Datei  " & resultFilename & " erstellt ? " & Chr(13) & Chr(10) & _
                    "Nach der Erstellung bitte af OK klicken!", vbYesNo) = vbNo Then
                Exit Function
            End If
        End If


        If Viewer = "WORD" Then
            DokumentInWordZeigen(resultFilename)
        End If

        If Viewer = "PDF" Then
            saveWordAsPDF(resultFilename)
        End If

        If Viewer = "OUTLOOK" Then
            Dim KundenEmail As String = "" & getKundenEmail(Vorgangtyp, vorgangnummer)
            Dim MailBetreff As String = getDruckForType(Vorgangtyp) & " #" & vorgangnummer
            mailWithOutlook(MailBetreff, KundenEmail, resultFilename, MailText, "", SofortSenden)
        End If

        OpenAusdruck_inWord_XML = fileName

        'Save as document in DokSys if DokSys exists
        Call SaveDokumenteInDokSys(getVorgangTableForType(Vorgangtyp), vorgangnummer & "", fileName)
        Call SaveDokumenteInDokSys(getVorgangTableForType(Vorgangtyp), vorgangnummer & "", resultFilename & "")


    End Function

    'Erstellt XML für einen Vorgang
    Function VorgangXML(ByVal vorgangnummer As Long, ByVal Vorgangtyp As String) As String
        Dim xml As String
        Dim VonForm : VonForm = getVorgangTableForType(Vorgangtyp)
        Dim VonForm_Artikel : VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)

        Dim language_Code As String = getLanguageForVorgang(Vorgangtyp, vorgangnummer)

        xml = xml & "<Vorgang>"

        xml = xml + QueryToXML("select * from " & VonForm & " anf where anf.Nummer=" & vorgangnummer)

        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_Adressfelder adr " & _
                    " where a.KundNr = adr.IDNR and a.Nummer=" & vorgangnummer, "Kunde")
        'Kundeneinstellungen
        xml = xml + QueryToXML("select k.* from " & VonForm & " a, [ofadressen-settings] ks, buchfirmenkonto k " & _
                    " where a.KundNr = ks.IDNR and ks.Firmenkontoid = k.KontoId and a.Nummer=" & vorgangnummer, "UnsereBankVerbindung")

        'Lieferadresse
        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_Adressfelder adr " & _
                    " where a.KundNr2 = adr.IDNR and a.Nummer=" & vorgangnummer, "Lieferadresse")

        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_AdressfelderLieferant adr " & _
                    " where a.LieferantNr = adr.IDNR and a.Nummer=" & vorgangnummer, "Lieferant")

        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_AdressfelderMitarbeiter adr " & _
                    " where a.MitarbeiterNr = adr.IDNR and a.Nummer=" & vorgangnummer, "Mitarbeiter")

        xml = xml + QueryToXML("select * from buchVorgaengeEigenschaften_Kreuztabelle where VorgangTyp='" & Vorgangtyp & "' and VorgangNummer=" & vorgangnummer, "Eigenschaften")

        xml = xml & "<Positionen>"

        xml = xml + QueryToXML("select p.Id , p.RechNr, p.ArtNR, p.PreisATS, p.PreisEuro, p.Stk, p.PreisATS_Brutto, p.ArtikelIdentifikation, " & _
                     " p.EKPreis, round(p.PreisATS*p.Stk,2) as PreisSummeNetto, round(p.PreisATS_Brutto*p.Stk,2) as PreisSummeBrutto, " & _
                     " getTranslationDok(""grArtikel"", [p].[ArtNr], ""Bezeichnung"", [p].[Bezeichnung], '" & language_Code & "') as Bezeichnung, " & _
                     " p.LieferantNR, p.PositionStatus, p.referenz, p.Packung, p.herkunft, p.Incoterm, " & _
                     " p.Spezifikation, " & _
                     " getTranslationDok(""grArtikel-Kategorien"", [k].[ArtKatNr], ""Name"", [k].[Name], '" & language_Code & "') as Kategorie " & _
                     " from [" & VonForm_Artikel & "] p, grArtikel a,  [grArtikel-Kategorien] k " & _
                     " where p.ArtNr=a.ArtNr and a.ArtKatNr=k.ArtKatNr and p.RechNr=" & vorgangnummer & _
                     " ORDER BY k.Name, [p].[Bezeichnung], p.ArtNr", "Position")

        xml = xml & "</Positionen>"

        xml = xml & "</Vorgang>"

        VorgangXML = xml
    End Function

    Public Sub DokumentInWordZeigen(ByVal Dateiname As String, Optional ByVal read_only As Boolean = True)

        Dim App 'As Application
        App = CreateObject("Word.Application")
        App.Visible = True
        App.Documents.Open(fileName:=Dateiname, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0)
        If read_only Then
            App.ActiveDocument.Protect(Password:="xxxqwe", NoReset:=False, Type:= _
            1, UseIRM:=False, EnforceStyleLock:=False)
        End If

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
        Throw New NotImplementedException
    End Sub


End Module
