<script language="VB" runat="server">  

    '=================================================================
    ' oeffnet den ausdruck mit ms word RTF formular
    ' Voraussetzung eine Vorlage im Folder: /skins/skin" & SkinNumber & "/emails/Vorlage_Rechnung.rtf
    '=================================================================
    Public Sub OpenAusdruck_inWord_RTF(ByVal VorgangTyp, ByVal Vorgang_Nummer)
        Dim fname : fname = Server.MapPath("/skins/skin" & SkinNumber & "/emails/Vorlage_Rechnung.rtf")
        If showDebug() Then Response.Write("<br>Vorlage:" & fname)
        'Datei erstellen 
        Dim newFName : newFName = OpenAusdruck_inWord_Filename_RTF(VorgangTyp, Vorgang_Nummer, fname)
   
        'link dem Requester geben!
        Response.Write("<br>")
        Response.Write(getTranslation("Ihr/e Angebot/Auftrag/Rechnung wurde erfolgreich erstellt!"))
        Response.Write("<br>")
        Response.Write("<a target=_new href='/logFiles/" & newFName & "'> ANSEHEN & DRUCKEN</a>")
        Response.Redirect("/logFiles/" & newFName)
   
    End Sub

    '=======================================================
    '=======================================================
    Function getRecSource(ByVal VorgangTyp, ByVal Vorgang_Nummer)

        Dim vonForm, vonForm_Artikel
        vonForm = getVorgangTableForType(VorgangTyp)
        vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
 
 
        If dbtype = "SQL" Or dbtype = "MySQL" Then
            getRecSource = "SELECT '" & VorgangTyp & "'  as VorgangTyp, ofAdressen.Idnr, concat(ofAdressen.Name, ' ', Vorname) as Namen , Firma, Adresse, " & _
                     " " & vonForm & ".Nummer, concat([grPLZ].[plz], ' ' , [grPLZ].[ort]) AS plzort, [grPLZ].[plz] as PLZ, [grPLZ].[ort] as Ort, " & _
                     " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & vonForm & ".Datum, " & vonForm & ".Notiz, " & _
                     " Sum([Stk]*[PreisEuro]) AS summeEuro, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz, Woher, Wohin," & _
                     " Anrede , Tel, Email, KundNr2" & _
                     " FROM ((ofAdressen RIGHT JOIN " & vonForm & " ON ofAdressen.IDNR = " & vonForm & ".KundNr) " & _
                     " LEFT JOIN grPLZ ON ofAdressen.PLZ = grPLZ.IdNr) INNER JOIN [" & vonForm_Artikel & "] " & _
                     " ON " & vonForm & ".Nummer = [" & vonForm_Artikel & "].RechNr " & _
                     " Where Nummer=" & Vorgang_Nummer & "  " & _
                     " GROUP BY ofAdressen.Idnr, ofAdressen.Name, Vorname, Firma, Adresse, " & _
                     " " & vonForm & ".Nummer, [grPLZ].[plz], [grPLZ].[ort], " & vonForm & ".Datum, " & _
                     " " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode ,  " & vonForm & ".Notiz, Woher, Wohin," & _
                     " Anrede, Tel, Email, KundNr2"
        Else 'ACCESS
            getRecSource = "SELECT '" & VorgangTyp & "'  as VorgangTyp, ofAdressen.Idnr, ofAdressen.Name & ' ' & Vorname as Namen , Firma, Adresse, " & _
                      " " & vonForm & ".Nummer, [grPLZ].[plz] & ' ' & [grPLZ].[ort] AS plzort, [grPLZ].[plz] as PLZ, [grPLZ].[ort] as Ort, " & _
                      " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & vonForm & ".Datum, " & vonForm & ".Notiz, " & _
                      " Sum([Stk]*[PreisEuro]) AS summeEuro, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz, Woher, Wohin," & _
                      " Anrede , Tel, Email, KundNr2" & _
                      " FROM ((ofAdressen RIGHT JOIN " & vonForm & " ON ofAdressen.IDNR = " & vonForm & ".KundNr) " & _
                      " LEFT JOIN grPLZ ON ofAdressen.PLZ = grPLZ.IdNr) INNER JOIN [" & vonForm_Artikel & "] " & _
                      " ON " & vonForm & ".Nummer = [" & vonForm_Artikel & "].RechNr " & _
                      " Where Nummer=" & Vorgang_Nummer & "  " & _
                      " GROUP BY '" & VorgangTyp & "' , ofAdressen.Idnr, ofAdressen.Name & ' ' & Vorname, Firma, Adresse, " & _
                      " " & vonForm & ".Nummer, [grPLZ].[plz] & ' ' & [grPLZ].[ort], [grPLZ].[ort], [grPLZ].[PLZ], " & vonForm & ".Datum, " & _
                      " " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode ,  " & vonForm & ".Notiz, Woher, Wohin," & _
                      " Anrede, Tel, Email, KundNr2"
        End If
    End Function

    '=======================================================
    ' liefet den recordsource wenn eine weitere adresse verwendet wird
    '=======================================================
    Function getRecSource_Weitere(ByVal VorgangTyp, ByVal Vorgang_Nummer)
        getRecSource_Weitere = IntraSellVorgaengeAusdruck().getRecSource_Weitere(VorgangTyp, Vorgang_Nummer)
        'Dim vonForm, vonForm_Artikel
        'vonForm = getVorgangTableForType(VorgangTyp)
        'vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)
 
        ' getRecSource_Weitere = "SELECT '" & VorgangTyp & "'  as VorgangTyp, [ofAdressen-Weitere].Idnr, [ofAdressen-Weitere].Name & "" "" &   [OfAdressen-WEitere].Vorname as Namen, [ofAdressen-Weitere].Firma, [ofAdressen-Weitere].Adresse, " & _
        '            " " & vonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort] AS plzort, " & _
        '            " Sum([Stk]*[PreisATS]) AS summeATS, Sum([Stk]*[PreisATS_Brutto]) AS summeATSBrutto, " & vonForm & ".Datum, " & vonForm & ".Notiz, " & _
        '            " Sum([Stk]*[PreisEuro]) AS summeEuro, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz, Woher, Wohin," & _
        '            " [ofAdressen-Weitere].Anrede, Tel, Email" & _
        '            " FROM (([ofAdressen-Weitere] RIGHT JOIN " & vonForm & " ON [ofAdressen-Weitere].IDNR = " & vonForm & ".KundNr)" & _
        '            " LEFT JOIN grPLZ ON [ofAdressen-Weitere].PLZ = grPLZ.IdNr) INNER JOIN [" & vonForm_Artikel & "] " & _
        '            " ON " & vonForm & ".Nummer = [" & vonForm_Artikel & "].RechNr " & _
        '            " Where nummer=" & Vorgang_Nummer & "  " & _
        '            " AND [ofAdressen-Weitere].Typ like '" & VorgangTyp & "'" & _
        '            " GROUP BY '" & VorgangTyp & "' , [ofAdressen-Weitere].Idnr, [ofAdressen-Weitere].Name & "" "" & [ofAdressen-weitere].vorname,  [ofAdressen-Weitere].Firma, [ofAdressen-Weitere].Adresse, " & _
        '            " " & vonForm & ".Nummer, [grPLZ].[plz] & "" "" & [grPLZ].[ort], " & vonForm & ".Datum, " & _
        '            " " & vonForm & ".Notiz, " & vonForm & ".KundNr, ZahlungsBedungung, Zahlungsmethode, TransportMethode,  " & vonForm & ".Notiz,Woher, Wohin," & _
        '            " [ofAdressen-Weitere].Anrede, Tel, Email"
        '    Debug.Print getRecSource_Weitere
    End Function

    Public Function getLand(ByVal Idnr)
        getLand = TABLEVALUE("grLand", "IDNR", TABLEVALUE("ofAdressen", "Idnr", Idnr, "LAND"), "Name") & ""
    End Function

    Public Function getUID(ByVal Idnr)
        getUID = TABLEVALUE("ofAdressen", "Idnr", Idnr, "UID") & ""
    End Function

 
    ''' <summary>
    ''' prueft ob eine weitere adresse vorhanden ist
    ''' </summary>
    ''' <param name="Idnr"></param>
    ''' <param name="VorgangTyp"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function checkIfWeitereVorhanden(ByVal Idnr, ByVal VorgangTyp)
        checkIfWeitereVorhanden = False
        Dim rs, sql
        sql = "select * from [ofAdressen-Weitere] where idnr=" & Idnr & " AND typ like '" & VorgangTyp & "'"
        rs = openRecordset(sql, dbOpenDynaset)
        If Not rs.EOF Then
            checkIfWeitereVorhanden = True
        End If
    End Function


    ''' <summary>
    ''' makeArtikelNummer
    ''' </summary>
    ''' <param name="ArtNr1"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function makeArtikelNummer(ByVal ArtNr1) As String
        makeArtikelNummer = ArtNr1
        If UseEAN() Then
            Dim rs
            Dim sql As String
    
            sql = "select artnr,ean from grArtikel where artnr = " & ArtNr1
            rs = openRecordset(sql, dbOpenDynaset)
            If Not rs.EOF Then
                If Not (rs("ean").Value) Is Nothing Then
                    makeArtikelNummer = rs("ean").Value
                End If
            End If
        End If
    End Function



    '=================================================================
    'opens a textfle and replaces the tags with the informaiton form database
    ' userd for HTML Outlookmals too !
    '=================================================================
    Public Function OpenAusdruck_inWord_Filename_RTF(ByVal VorgangTyp, ByVal Vorgang_Nummer, ByVal Dateiname)
        Dim app 'As Application
        Dim vorlageFilename As String
        Dim rs 'As Recordset
        Dim vonForm As String, vonForm_Artikel As String
        Dim sql As String
        Dim rsArt
   
        vonForm = getVorgangTableForType(VorgangTyp)
        vonForm_Artikel = getVorgangArtikelTableForType(VorgangTyp)

        vorlageFilename = Dateiname
        rs = openRecordset(getRecSource(VorgangTyp, Vorgang_Nummer), dbOpenDynaset)
    
        If rs.EOF Then
            MsgBox("Die Daten sind nicht vorhanden!", "vbCritical")
            Exit Function
        End If
    
        If checkIfWeitereVorhanden(rs("idnr").Value, VorgangTyp) And VorgangTyp = "LI" Then
            'If MsgBox("Es sind weitere Adressdaten vorhanden! Möchten Sie diese verwenden?", vbYesNo) Then
            rs = ObjConnectionExecute(getRecSource_Weitere(VorgangTyp, Vorgang_Nummer))
            'End If
        End If
    
        'Anzahl Positionen
        sql = "select count(*) as pos from [" & vonForm_Artikel & "] where rechnr=" & Vorgang_Nummer
        rsArt = openRecordset(sql, dbOpenDynaset)
        Dim positionen As Integer, i As Integer : positionen = rsArt("pos").Value
       
        'read RTF content
        Dim fileText As String, fileContent As String, fileLine As String
        fileText = readTextFile(Dateiname)
    
        'convert fileText to fileContent
        For Each fileLine In Split(fileText, Chr(13) & Chr(10))
            If fileContent = "" Then
                fileContent = fileLine
            Else
                fileContent = fileContent & Chr(13) & Chr(10) & fileLine
            End If
        
            'add lines for every Position
            If InStr(fileLine, "[ArtNr]") > 0 Or InStr(fileLine, "[EAN]") > 0 Then 'das ist eine Positionszeile
                For i = 1 To (CInt(positionen) - 1)
                    fileContent = fileContent & Chr(13) & Chr(10) & fileLine
                Next
            End If
        Next
    
    
    
        'REPLACE CONTENT
    
        fileContent = Replace(fileContent, "[Idnr]", rs("Idnr").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Kundennummer]", rs("Idnr").Value & "", 1, 1)
  
        'Rechnungsadresse 
        fileContent = Replace(fileContent, "[Firma]", rs("firma").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Name]", rs("namen").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Strasse]", rs("adresse").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[plz ort]", rs("plzort").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[PLZ]", rs("plz").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Ort]", rs("ort").Value & "", 1, 1)

        'Lieferadresse 
        If rs("kundnr2").Value & "" <> "" Then
            Dim addressType As String : addressType = "LI"
            Dim sqlLI As String
            sqlLI = "Select a.*, p.* from [ofAdressen-Weitere] a, grPLZ p where a.PLZ=p.IDNR and a.typ= '" & addressType & "' and a.ID=" & rs("kundnr2").Value
            Dim rsLI
            'Response.Write sqlLI 
            rsLI = objConnectionExecute(sqlLI)
            If Not rsLI.EOF Then
                fileContent = Replace(fileContent, "[Lieferadresse_Firma]", rsLI("firma").Value & "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_Name]", rsLI("name").Value & " " & rsLI("vorname").Value & "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_Strasse]", rsLI("adresse").Value & "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_plz ort]", rsLI("plz").Value & " " & rsLI("ort").Value & "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_PLZ]", rsLI("plz").Value & "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_Ort]", rsLI("ort").Value & "", 1, 1)
            Else
                fileContent = Replace(fileContent, "[Lieferadresse_Firma]", "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_Name]", "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_Strasse]", "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_plz ort]", "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_PLZ]", "", 1, 1)
                fileContent = Replace(fileContent, "[Lieferadresse_Ort]", "", 1, 1)
            End If
        End If
    
        fileContent = Replace(fileContent, "[Titel]", VorgangTyp & "-" & Vorgang_Nummer, 1, 1)
        fileContent = Replace(fileContent, "[Datum]", rs("Datum").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Betreuer]", "")
        fileContent = Replace(fileContent, "[Email]", rs("Email").Value & "", 1, 1)
    
        fileContent = Replace(fileContent, "[Zahlungsbedingung]", rs("ZahlungsBedungung").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Zahlungsmethode]", rs("ZahlungsMethode").Value & "", 1, 1)
        fileContent = Replace(fileContent, "[Transportmethode]", rs("TransportMethode").Value & "", 1, 1)
    
        fileContent = Replace(fileContent, "[Netto]", FormatNumber(rs("summeATS").Value, 2), 1, 1)
        fileContent = Replace(fileContent, "[MWST]", FormatNumber(CDbl(rs("summeATSBrutto").Value) - CDbl(rs("summeATS").Value), 2), 1, 1)
        fileContent = Replace(fileContent, "[Total]", FormatNumber(rs("summeATSBrutto").Value, 2), 1, 1)

        'copy the artikel line times as needed

        Dim Bez As String
        sql = "select [" & vonForm_Artikel & "].*, " & _
              " Beschreibung, EAN from [" & vonForm_Artikel & "],  grArtikel where [" & vonForm_Artikel & "].artnr = grArtikel.artnr " & _
              " and rechnr=" & Vorgang_Nummer & _
              " order by ID"
        Const BEZEICHNUNG_LAENGE = 50
        rsArt = openRecordset(sql, dbOpenDynaset)
        While Not rsArt.EOF
            fileContent = Replace(fileContent, "[Stk]", rsArt("Stk").Value, 1, 1)
            fileContent = Replace(fileContent, "[ArtNr]", rsArt("ArtNR").Value, 1, 1)
            fileContent = Replace(fileContent, "[EAN]", rsArt("EAN").Value, 1, 1)
            fileContent = Replace(fileContent, TAG_BEZEICHNUNG, pad(rsArt("Bezeichnung").Value, BEZEICHNUNG_LAENGE) & "", 1, 1)
            fileContent = Replace(fileContent, TAG_BESCHREIBUNG, rsArt("Beschreibung").Value & "", 1, 1)
            'korrektur für mecom - Preis ist der Stk*VKPReis
            fileContent = Replace(fileContent, "[Preis]", FormatNumber(CDbl(rsArt("PreisATS").Value) * CDbl(rsArt("Stk").Value), 2), 1, 1)
            rsArt.MoveNext()
        End While
  
  
        'set Eigenschaften
        sql = "select * from buchVorgaengeEigenschaften where Nummer  = " & Vorgang_Nummer & " and  vorgangtyp like '" & VorgangTyp & "'"
        Dim rsEig ' As Recordset
        rsEig = openRecordset(sql, dbOpenDynaset)
        While Not rsEig.EOF
            fileContent = Replace(fileContent, "[" & rsEig("Name").Value & "]", rsEig("Value").Value & "")
            rsEig.MoveNext()
        End While
  

        'SAVE FILE IN LOG FOLDER (WITH WRITE OPTIONS)
        Dim saveAsFilename : saveAsFilename = VorgangTyp & "_" & Vorgang_Nummer & "." & Right(Dateiname, 3)
        Call writeFile(saveAsFilename, fileContent)
        OpenAusdruck_inWord_Filename_RTF = saveAsFilename
    End Function
  
  
</script>

