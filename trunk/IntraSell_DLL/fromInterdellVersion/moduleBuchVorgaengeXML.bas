Attribute VB_Name = "moduleBuchVorgaengeXML"
Option Explicit
Option Compare Database


Function XML2WORD() As String
    XML2WORD = dbFolder & "XML2WordGT\TestXML2Word.exe"
End Function

'Viewer = WORD
'Viewer = OUTLOOK
' Returns the filename of the XML File
Function OpenAusdruck_inWord_XML(ByVal VorgangNummer As Long, _
                            ByVal Vorgangtyp As String, _
                            ByVal VorlageFilename As String, _
                            ByVal Viewer As String, _
                            ByVal SofortSenden As Boolean, _
                            ByVal MailText As String) As String
Dim VonForm  As String
Dim VonForm_Artikel

 VonForm = getVorgangTableForType(Vorgangtyp)
 VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
 
 
    
    'jetzt XML erstellen
    Dim xml
        xml = "<DOCUMENT>"
        xml = xml & VorgangXML(VorgangNummer, Vorgangtyp)
        xml = xml & "</DOCUMENT>"
    
    Dim filename As String
    filename = dbFolder & "tmp\Vorgang_" & VonForm & "_" & Vorgangtyp & VorgangNummer & ".xml"
    
    Call saveXML(xml, filename)
    
    Dim resultFilenamePrefix: resultFilenamePrefix = "Vorgang_" & Vorgangtyp & VorgangNummer
    Dim resultFilename:
    resultFilename = dbFolder & "tmp\" & resultFilenamePrefix & "1.doc"
    
    
    'merge with word template
    Dim Vorlage  As String: Vorlage = dbFolder & VorlageFilename
    Dim exportPath: exportPath = dbFolder & "tmp\"
   ' Shell XML2WORD & " """ & filename & """ """ & vorlage & """ " & exportPath & " """ & resultFilenamePrefix & """", vbNormalFocus
    SynchShell XML2WORD & " """ & filename & """ """ & Vorlage & """ " & exportPath & " """ & resultFilenamePrefix & """"

    'rename file to remove the 1 at the end
  
    renameFile resultFilename, Replace(resultFilename, "1.doc", ".doc")
    resultFilename = Replace(resultFilename, "1.doc", ".doc")
    
    'print or send per email
    
    
    If False Then
        If MsgBox("Wurde die Datei  " & resultFilename & " erstellt ? " & Chr(13) & Chr(10) & _
                "Nach der Erstellung bitte af OK klicken!", vbYesNo) = vbNo Then
                Exit Function
        End If
    End If
           
            
    If Viewer = "WORD" Then
        DokumentInWordZeigen resultFilename
    End If
    
    If Viewer = "PDF" Then
        saveWordAsPDF resultFilename
    End If
    
    If Viewer = "OUTLOOK" Then
        Dim KundenEmail: KundenEmail = "" & getKundenEmail(Vorgangtyp, VorgangNummer)
        Dim MailBetreff: MailBetreff = getDruckForType(Vorgangtyp) & " #" & VorgangNummer
        mailWithOutlook MailBetreff, KundenEmail, resultFilename, MailText, "", SofortSenden
    End If
    
    OpenAusdruck_inWord_XML = filename
    
End Function

'Erstellt XML für einen Vorgang
Function VorgangXML(ByVal VorgangNummer As Long, ByVal Vorgangtyp As String) As String
    Dim xml As String
    Dim VonForm: VonForm = getVorgangTableForType(Vorgangtyp)
    Dim VonForm_Artikel: VonForm_Artikel = getVorgangArtikelTableForType(Vorgangtyp)
        
    Dim language_Code As String: language_Code = getLanguageForVorgang(Vorgangtyp, VorgangNummer)
    
        xml = xml & "<Vorgang>"
        
        xml = xml + QueryToXML("select * from " & VonForm & " anf where anf.Nummer=" & VorgangNummer)
        
        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_Adressfelder adr " & _
                    " where a.KundNr = adr.IDNR and a.Nummer=" & VorgangNummer, "Kunde")
                    
        'Lieferadresse
        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_Adressfelder adr " & _
                    " where a.KundNr2 = adr.IDNR and a.Nummer=" & VorgangNummer, "Lieferadresse")
                                        
        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_AdressfelderLieferant adr " & _
                    " where a.LieferantNr = adr.IDNR and a.Nummer=" & VorgangNummer, "Lieferant")
                                       
        xml = xml + QueryToXML("select adr.* from " & VonForm & " a, qry_AdressfelderMitarbeiter adr " & _
                    " where a.MitarbeiterNr = adr.IDNR and a.Nummer=" & VorgangNummer, "Mitarbeiter")
                              
        xml = xml + QueryToXML("select * from buchVorgaengeEigenschaften_Kreuztabelle where VorgangTyp='" & Vorgangtyp & "' and VorgangNummer=" & VorgangNummer, "Eigenschaften")
        
        xml = xml & "<Positionen>"
        
        xml = xml + QueryToXML("select p.Id , p.RechNr, p.ArtNR, p.PreisATS, p.PreisEuro, p.Stk, p.PreisATS_Brutto, p.ArtikelIdentifikation, " & _
                     " p.EKPreis, p.PreisATS*p.Stk as PreisSummeNetto, p.PreisATS_Brutto*p.Stk as PreisSummeBrutto, " & _
                     " getTranslationDok(""grArtikel"", [p].[ArtNr], ""Bezeichnung"", [p].[Bezeichnung], '" & language_Code & "') as Bezeichnung, " & _
                     " p.LieferantNR, p.PositionStatus, p.referenz, p.Packung, p.herkunft, p.Incoterm, " & _
                     " p.Spezifikation, " & _
                     " getTranslationDok(""grArtikel-Kategorien"", [k].[ArtKatNr], ""Name"", [k].[Name], '" & language_Code & "') as Kategorie " & _
                     " from [" & VonForm_Artikel & "] p, grArtikel a,  [grArtikel-Kategorien] k " & _
                     " where p.ArtNr=a.ArtNr and a.ArtKatNr=k.ArtKatNr and p.RechNr=" & VorgangNummer & _
                     " ORDER BY k.Name, [p].[Bezeichnung], p.ArtNr", "Position")
        
        xml = xml & "</Positionen>"
        
        xml = xml & "</Vorgang>"
        
        VorgangXML = xml
End Function

Public Sub DokumentInWordZeigen(ByVal Dateiname As String, Optional readonly As Boolean = True)

   Dim App 'As Application
   Set App = CreateObject("Word.Application")
   App.Visible = True
   App.Documents.Open filename:=Dateiname, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0
    If readonly Then
        App.ActiveDocument.Protect Password:="xxxqwe", NoReset:=False, Type:= _
        1, UseIRM:=False, EnforceStyleLock:=False
    End If

End Sub


Public Sub ProtectDocument(ByVal Dateiname As String)

   Dim App 'As Application
   Set App = CreateObject("Word.Application")
   App.Visible = True
   App.Documents.Open filename:=Dateiname, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0
   App.ActiveDocument.Protect Password:="xxxqwe", NoReset:=False, Type:= _
        1, UseIRM:=False, EnforceStyleLock:=False
   App.ActiveDocument.Save
   App.Quit

End Sub


'returns the filename of the html document
Public Function SaveWordAsHTML(ByVal filenameWordDoc As String) As String
   Dim App 'As Application
   Set App = CreateObject("Word.Application")
    App.Visible = True
    App.Documents.Open filename:=filenameWordDoc, ConfirmConversions:=False, readonly:=False, AddToRecentFiles:=False, Format:=0
    App.ActiveDocument.SaveAs filename:="c:\convert.htm", FileFormat:=8  'wdFormatHTML
      ', _
      '    LockComments:=False, Password:="", AddToRecentFiles:=True, WritePassword _
      '   :="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:=False, _
      '  SaveNativePictureFormat:=False, SaveFormsData:=False, SaveAsAOCELetter:= _
      '  False
      SaveWordAsHTML = "c:\convert.htm"
      App.Quit
End Function


