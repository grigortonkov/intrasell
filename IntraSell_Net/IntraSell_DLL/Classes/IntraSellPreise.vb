Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient

Public Class IntraSellPreise

    Public CurrentDB As MySqlConnection

    Private vars As IntraSellVars
    Private kunden As IntraSellKunden

    Const VORGANG_TYP_LAU = "LAU"

    Public Sub init(ByVal connString As String)

        FunctionsDB.ConnStringODBC = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
        FunctionsDB.connOpen()
        CurrentDB = FunctionsDB.CurrentDB

        vars = New IntraSellVars
        vars.init(connString)

        kunden = New IntraSellKunden
        kunden.init(connString)

    End Sub

    Public Sub destroy()
        functionsDB.connClose()
        vars.destroy()
        vars = Nothing
        kunden.destroy()
        kunden = Nothing

    End Sub



    'THIS FUNCTIONS ARE COPIED IN THE WEBSHOP MODULE
    'PLEASE MAKE WHEN MAKING CHANGES HERE COPY THE MODULE TO THE WEB SHOP TOO


    '*****************************************************************
    ' more compilated function that calculates the price because of priority
    ' returns the special preis if defined
    ' when not defined returns 0
    '*****************************************************************
    Public Function getPreis(ByVal IdNr As Integer, ByVal ArtNr As Integer, ByVal Stk As Double) As Double
        'If IsNull(IdNr) Then IdNr = -1
        'If IsNull(ArtNr) Then getPreis = 0 : Exit Function
        Dim ArtKatNr As Integer
        getPreis = 0
        Dim sql As String, rs As MySqlDataReader

        sql = "select ArtKatNr from grArtikel where artNr = " & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        If Not rs.Read Then Return 0 : Exit Function

        ArtKatNr = CInt(rs("ArtKAtNR"))

        If IdNr = -1 Then ' user ist egal
            sql = " select vkpreis, aufschlagvkpreis, aufschlagekpreis from [grArtikel-VKPreisPerSelection] pl where " & _
                  "     (pl.ArtKatNr is null or pl.ArtKatNr =-1 or pl.ArtKatNr =" & ArtKatNr & ")" & _
                  " and (pl.ArtNr is null  or ArtNr =-1  or  artnr = " & ArtNr & ")" & _
                  " and (pl.StkAb<=" & Stk & ")" & _
                  " ORDER BY pl.Idnr desc, pl.ArtNr desc, pl.ArtKatNr desc, pl.preislistename desc, pl.StkAb desc"
        Else
            sql = " select vkpreis, aufschlagvkpreis, aufschlagekpreis from [grArtikel-VKPreisPerSelection] pl where " & _
                  " (pl.preislistename='' or pl.preislistename is null or pl.preislistename in (select preisliste from [ofAdressen-settings] where IdNR = " & IdNr & "))" & _
                  " and (pl.ArtKatNr is null or pl.ArtKatNr =-1 or pl.ArtKatNr =" & ArtKatNr & ")" & _
                  " and (pl.ArtNr is null  or ArtNr =-1  or  artnr = " & ArtNr & ")" & _
                  " and (pl.Idnr is null or pl.idnr = -1 or pl.idnr=" & IdNr & ")" & _
                  " and (pl.StkAb<=" & Stk & ")" & _
                  " ORDER BY pl.Idnr desc, pl.ArtNr desc, pl.ArtKatNr desc, pl.preislistename desc, pl.StkAb desc"
        End If

        rs = openRecordset_(sql, dbOpenDynaset)

        'if not found try with the super categery too
        'if rs.EOF

        If rs.Read Then
            'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
            getPreis = getBasisVKPreis(ArtNr)

            If CDbl(rs("vkpreis")) > 0 Then
                getPreis = CDbl(rs("vkpreis"))
                Exit Function
            End If

            If CDbl(rs("aufschlagvkpreis")) <> 0 Then
                getPreis = (CDbl(rs("aufschlagvkpreis")) + 1) * getBasisVKPreis(ArtNr)
                Exit Function
            End If

            If CDbl(rs("aufschlagekpreis")) <> 0 Then
                getPreis = (CDbl(rs("aufschlagekpreis")) + 1) * getEKPreis(ArtNr)
                Exit Function
            End If

        End If
        rs.Close()
        rs = Nothing
    End Function


    'Start Copy here to the end of module
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See www.vegsys.com for last changes.
    '===========================================================================

    '*****************************************************************
    ' returns the special preis if defined
    ' when not defined returns 0
    '*****************************************************************
    Private Function getSpecialPreis(ByVal IdNr As Integer, ByVal ArtNr As Integer) As Double
        getSpecialPreis = 0
        Dim sql As String, rs As MySqlDataReader
        sql = "select vkpreis from [grArtikel-VKPreisPerSelection] where preislistename in " & _
        " (select preisliste from [ofAdressen-settings] where IdNR = " & IdNr & ") and artnr = " & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        If rs.Read Then
            'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
            getSpecialPreis = CDbl(rs("vkpreis"))
        End If
        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    ' returns the  min or max and VK or EK PReis from LieferantenArtikelPreis
    '*****************************************************************
    Public Function getLieferantPreis(ByVal ArtNr As Integer, ByVal boolMinPreis As Boolean, ByVal boolVKPreis As Boolean) As Double
        getLieferantPreis = 0
        Dim sql As String, rs As MySqlDataReader

        If boolMinPreis Then
            sql = "select min(PreisField) as mPREIS from `lieferantenArtikel-Preise` where PreisField>0 and artikelnr = " & ArtNr
        Else
            sql = "select max(PreisField) as mPREIS from `lieferantenArtikel-Preise` where PreisField>0 and artikelnr = " & ArtNr
        End If

        If boolVKPreis Then sql = Replace(sql, "PreisField", "VKpreis") Else sql = Replace(sql, "PreisField", "EKpreis")

        rs = openRecordset_(sql, dbOpenDynaset)
        If rs.Read Then
            'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
            getLieferantPreis = CDbl(rs("mPREIS"))
        End If
        rs.Close()
        rs = Nothing
    End Function



    '*****************************************************************
    'gibt den VKpreis eines Artikels zurück, egal von besteller
    'falls aufschlag auf EKpreis nach Kategorie existiert dann wird es aufgeschlagen
    '*****************************************************************
    Private Function getBasisVKPreis(ByVal ArtNr As Integer) As Double
        Dim sql As String, rs As MySqlDataReader
        Dim ArtKatNr As Integer

        sql = "select ArtNR, ArtKatNR, PreisATS from grArtikel where artnr=" & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        getBasisVKPreis = 0

        If rs.Read Then
            ArtKatNr = CInt(rs("ArtKatNr"))
            Dim Aufschlag As Double = getAufschlagEKpreisKategorie(ArtKatNr)
            If Aufschlag <> 0 Then
                getBasisVKPreis = getEKPreis(ArtNr) * (1 + Aufschlag)
            Else
                If IsNull(rs("PreisATS")) Then
                    getBasisVKPreis = 0
                Else
                    getBasisVKPreis = CDbl(rs("PreisATS"))
                End If
            End If
        Else
            getBasisVKPreis = 0
        End If

        rs.Close()
        rs = Nothing

    End Function

    '*****************************************************************
    '*****************************************************************
    Public Function getEKPreis(ByVal ArtNr As Integer) As Double

        Dim sql As String, rs As MySqlDataReader

        sql = "select EKPreis from grArtikel where artnr=" & ArtNr
        rs = openRecordset_(sql)
        getEKPreis = 0
        If rs.Read Then
            If CDbl(rs("EKPreis")) <= 0 Then 'not defined
                getEKPreis = makeEKPreisVonLieferant(ArtNr)
            Else
                If IsNull(rs("EKPreis")) Then
                    getEKPreis = 0
                Else
                    getEKPreis = CDbl(rs("EKPreis"))
                End If
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function



    '*****************************************************************
    'liefert Bestpreis aus der lieferanten Preise Tabelle
    '*****************************************************************
    Function makeEKPreisVonLieferant(ByVal ArtNr As Integer) As Double
        makeEKPreisVonLieferant = 0
        If ArtNr & "" = "" Then Exit Function
        Dim sql As String, rs As MySqlDataReader
        sql = "select EKPreis from `lieferantenArtikel-Preise` " & _
              " where ekpreis>0 and artikelnr=" & ArtNr & _
              " ORDER BY Prioritaet, EKPreis"
        rs = openRecordset_(sql, dbOpenDynaset)
        makeEKPreisVonLieferant = 0
        If rs.Read Then
            If IsNull(rs("EKPreis")) Then
                makeEKPreisVonLieferant = 0
            Else
                makeEKPreisVonLieferant = CDbl(rs("EKPreis"))
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    'returns the name of the best lieferant
    '*****************************************************************
    Public Function getBestLieferant(ByVal ArtNr As Integer) As String
        Dim sql As String, rs As MySqlDataReader
        sql = "select artikelnr, LieferantNr, EKPreis from `lieferantenArtikel-Preise` " & _
              " where artikelnr=" & ArtNr & " ORDER BY prioritaet, EKPreis"
        rs = openRecordset_(sql, dbOpenDynaset)
        getBestLieferant = "n/a"
        If rs.Read Then
            sql = "select Firma from lieferantenAdressen where idnr=" & CStr(rs("LieferantNr"))
            rs = openRecordset_(sql, dbOpenDynaset)
            If rs.Read Then
                getBestLieferant = CStr(rs("Firma"))
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    'returns the lagerinfo of the best lieferant
    '*****************************************************************
    Public Function getLieferantLagerInfo(ByVal ArtNr As Integer) As String

        'If IsNull(ArtNr) Then Return "" : Exit Function
 
        Dim sql As String, rs As MySqlDataReader
        sql = "select ArtNr, Bezeichnung, Bezeichnung1 from grArtikel where artnr=" & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        If rs.Read Then
            If CStr(rs("Bezeichnung1")) & "" <> "" Then
                getLieferantLagerInfo = CStr(rs("Bezeichnung1"))
            End If
        End If

        sql = "select artikelnr, Lagerinfo from `lieferantenArtikel-Preise` " & _
              " where artikelnr=" & ArtNr & " ORDER BY prioritaet, EKPreis"
        rs = openRecordset_(sql, dbOpenDynaset)
        getLieferantLagerInfo = "n/a"

        If rs.Read Then
            getLieferantLagerInfo = CStr(rs("Lagerinfo"))
        End If

        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    '*****************************************************************
    Private Function getAufschlagEKpreisKategorie(ArtKatNr As Integer) As Double

        Dim sql As String, rs As MySqlDataReader

        sql = " select ArtKatNR, Aufschlag, ArtKatNrParent from [grArtikel-Kategorien] where " & _
              " ArtKatNr =" & ArtKatNr & _
              " and Aufschlag > 0 "

        rs = openRecordset_(sql, dbOpenDynaset)
        getAufschlagEKpreisKategorie = 0

        If rs.Read Then
            getAufschlagEKpreisKategorie = CDbl(rs("Aufschlag"))
        Else 'recursion
            If ArtKatNr > 0 Then 'take aufschlag from parent kategory
                sql = "select ArtKatNrParent from [grArtikel-Kategorien] where ArtKatNR =" & ArtKatNr
                rs = openRecordset_(sql, dbOpenDynaset)
                If rs.Read Then
                    getAufschlagEKpreisKategorie = getAufschlagEKpreisKategorie(CInt(rs("ArtKatNrParent")))
                End If
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function


    '*****************************************************************
    ' makeBruttoPreis for any preis without artnr
    '*****************************************************************
    Function makeBruttoPreis(ByVal Preis As Double, ByVal MwstGroup As Integer, ByVal Land As String) As Double
        ' Dim Land: Land = Session("LAND")
        If Land = "" Then Land = "AT"
        makeBruttoPreis = Preis * (1 + getVAT(Land, MwstGroup) / 100)
    End Function

    '*****************************************************************
    'need only the artNr AND Stk /for staffelung/ to create preis / +MWST, VAT/
    '*****************************************************************
    Function makeBruttoPreis2(ByVal ArtNr As Integer, ByVal Stk As Double, ByVal Land As String) As Double
        ' If Stk = "" Then Stk = 1
        Dim rs As MySqlDataReader
        rs = openRecordset_("select ArtNr, MWST from grArtikel where ArtNr=" & ArtNr, dbOpenDynaset)
        If Not rs.Read Then
            makeBruttoPreis2 = 0
        Else
            Dim preis1stk As Double = makeNettoPreis(ArtNr, Stk, 0)
            Return makeBruttoPreis(preis1stk, CInt(rs("MWST")), Land)
        End If
        rs.Close()
    End Function


    '*****************************************************************
    ' makeNettoPreis
    ' need only the artNr AND Stk /for staffelung/
    '*****************************************************************
    Function makeNettoPreis(ArtNr As Integer, Stk As Double, IdNr As Integer) As Double
        Dim sql As String, rs As MySqlDataReader
        Dim preisManyPieces As Double
        rs = openRecordset_("select * from grArtikel where ArtNr=" & ArtNr, dbOpenDynaset)
        If Not rs.Read Then
            makeNettoPreis = 0
        Else
            Dim preis1stk As Double = getPreis(IdNr, ArtNr, Stk) 'rs("PreisATS")
            sql = "select * from [grArtikel-Staffelpreise] Where ArtNr = " & ArtNr & " AND stkAb <" & Stk
            Dim rsRabatt = openRecordset_(sql, dbOpenDynaset)
            Dim prozent As Double = 0
            If rsRabatt.Read Then prozent = CDbl(rsRabatt("ProzentRabatt"))

            preisManyPieces = preis1stk * 100 / (100 + prozent)
            makeNettoPreis = preisManyPieces
        End If
        rs.Close()
    End Function


    '*****************************************************************
    ' getVAT
    ' MWSTGROUP -0, 1, or 2
    '*****************************************************************
    Function getVAT(Land As String, MwstGroup As Integer) As Double
        If Land = "" Then Land = "AT"
        Land = UCase(Land)
        Dim sql As String
        Dim rs As MySqlDataReader
        sql = "SELECT Land, Prozent FROM grMWST where Land='" & Land & "' AND MWSTGROUP=" & MwstGroup
        'Response.Write sql
        rs = openRecordset_(sql, dbOpenDynaset)
        If rs.Read Then
            getVAT = CDbl(rs("Prozent"))
        Else
            getVAT = 0.2
            'getVAT = "Error: Die MWST Information fehlt für Land [" & Land & "]!"
        End If
        rs.Close()
    End Function

    '*****************************************************************
    ' getVAT
    '*****************************************************************
    Function getClientLand(IdNr As Integer) As String
        getClientLand = CStr(vars.firstRow("select iso2 from ofAdressen a, grland l where  a.land = l.idnr and a.idnr=" & IdNr))
    End Function


    '*****************************************************************
    ' For example Converts one Auftrag to Rechnung
    ' returns the nummer of the created new OrderType or 0 of failed
    '*****************************************************************
    Public Function convertFromTo(ByVal VorgangTypVon As String, ByVal VorgangTypNach As String, ByVal VorgangNummerVon As Integer, ByVal NewKundNr As Integer) As String
        Dim benutzeTransaktion As Boolean
        benutzeTransaktion = False
        ' benutzeTransaktion = TRue -> es gibt Probleme mit MySQL DB und Binary Log Level Enabled
        Dim mysqltr As MySqlTransaction = Nothing
        Try

            Dim sql As String
            Dim rs As MySqlDataReader
            Dim tableNameFrom, tableNameFromProducts, tableNameTo, tableNameToProducts As String


            If benutzeTransaktion Then
                'CurrentDB.BeginTrans()
                mysqltr = conn.BeginTransaction
            End If


            tableNameFrom = getVorgangTableForType(VorgangTypVon)
            tableNameFromProducts = getVorgangArtikelTableForType(VorgangTypVon)

            tableNameTo = getVorgangTableForType(VorgangTypNach)
            tableNameToProducts = getVorgangArtikelTableForType(VorgangTypNach)

            Dim IdNr As Integer
            sql = "select * from " & tableNameFrom & " where nummer =" & VorgangNummerVon
            rs = openRecordset_(sql, "")
            If Not rs.Read Then
                convertFromTo = "0"
                Exit Function
            Else
                IdNr = CInt(rs("Kundnr"))
            End If
            rs.Close()

            Dim nextRechnungNummer As String = getNewVorgangNummer(VorgangTypNach, IdNr)

            If VorgangTypNach = VORGANG_TYP_LAU And VorgangTypVon <> VORGANG_TYP_LAU Then  ' lieferanten Auftrag
                sql = "INSERT INTO " & tableNameTo & " ( Nummer, KundNr, Datum, MitarbeiterNr, LieferantNr, Notiz, Summe, Bezahlt, Ausgedrukt, anElba, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, Woher, SummeMWST, SummeBrutto ) " & _
                      " SELECT " & nextRechnungNummer & " , " & NewKundNr & ", Date(), MitarbeiterNr, " & NewKundNr & ", Notiz, Summe, 0, 0, 0, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, '" & VorgangTypVon & VorgangNummerVon & "', SummeMWST, SummeBrutto " & _
                      " FROM " & tableNameFrom & _
                      " WHERE Nummer = " & VorgangNummerVon
            Else
                sql = "INSERT INTO " & tableNameTo & " ( Nummer, KundNr, Datum, MitarbeiterNr, LieferantNr, Notiz, Summe, Bezahlt, Ausgedrukt, anElba, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, Woher, SummeMWST, SummeBrutto ) " & _
                      " SELECT " & nextRechnungNummer & " , " & NewKundNr & ", Date(), MitarbeiterNr, LieferantNr, Notiz, Summe, 0, 0, 0, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, '" & VorgangTypVon & VorgangNummerVon & "', SummeMWST, SummeBrutto " & _
                      " FROM " & tableNameFrom & _
                      " WHERE Nummer = " & VorgangNummerVon
            End If

            Call openRecordset_(sql, "")

            'Positionen
            If VorgangTypNach = VORGANG_TYP_LAU And VorgangTypVon <> VORGANG_TYP_LAU Then   ' lieferanten Auftrag
                sql = "INSERT INTO [" & tableNameToProducts & "] ( RechNr, ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, Herkunft, Incoterm,  Spezifikation ) " & _
                       " SELECT " & nextRechnungNummer & ", ArtNR, EKpreis, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation  " & _
                       " FROM [" & tableNameFromProducts & "] WHERE " & _
                       " RechNr=" & VorgangNummerVon
            Else
                sql = "INSERT INTO [" & tableNameToProducts & "] ( RechNr, ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation ) " & _
                       " SELECT " & nextRechnungNummer & ", ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation  " & _
                       " FROM [" & tableNameFromProducts & "] WHERE " & _
                       " RechNr=" & VorgangNummerVon
            End If



            'response.write SQL
            Call openRecordset_(sql, "")

            sql = "INSERT INTO buchVorgaengeEigenschaften ( VorgangTyp, Nummer, Name, [Value] )" & _
                " SELECT '" & VorgangTypNach & "', " & nextRechnungNummer & ", Name, [Value] " & _
                " FROM buchVorgaengeEigenschaften " & _
                " WHERE VorgangTyp='" & VorgangTypVon & "'  AND Nummer=" & VorgangNummerVon & ";"
            Call openRecordset_(sql, "")

            'set where the vorgang goes to
            sql = "UPDATE " & tableNameFrom & " SET Wohin = '" & VorgangTypNach & nextRechnungNummer & "'" & _
                    " WHERE Nummer = " & VorgangNummerVon
            'response.write SQL
            Call openRecordset_(sql, "")
            'response.write "Converting was OK!"
            If benutzeTransaktion Then
                'CurrentDB.CommitTrans()
                mysqltr.Commit()
            End If

            convertFromTo = nextRechnungNummer

            Exit Function
        Catch ex As Exception

            MsgBox("Die Transaktion wurde storniert!" + Err.Description, vbCritical)
            If benutzeTransaktion Then
                ' CurrentDB.Rollback()
                mysqltr.Rollback()

            End If

        End Try
    End Function



    '=======================================================
    ' Since IS.NET we have only one table for all Types of Vorgänge
    '=======================================================
    Public Function getVorgangTableForType(ByVal Typ As String) As String
        Return "buchVorgang"
        'Select Case Typ
        '    Case "AN"
        '        getVorgangTableForType = "buchAngebot"
        '    Case "AU"
        '        getVorgangTableForType = "buchAuftrag"
        '    Case "RÜ"
        '        getVorgangTableForType = "buchRuestschein"
        '    Case "LI"
        '        getVorgangTableForType = "buchLieferschein"
        '    Case "AR"
        '        getVorgangTableForType = "buchRechnung"
        '    Case "RE"
        '        getVorgangTableForType = "buchRetourwaren"
        '    Case "GU"
        '        getVorgangTableForType = "buchGutschrift"

        '    Case VORGANG_TYP_LAU
        '        getVorgangTableForType = "buchLieferantAuftrag"
        'End Select
    End Function

    '=======================================================
    ' Since IS.NET we have only one table for all Types of Vorgänge
    '=======================================================
    Public Function getVorgangArtikelTableForType(ByVal Typ As String) As String
        Return "buchVorgang-Artikel"
        'Select Case Typ
        '    Case "AN"
        '        getVorgangArtikelTableForType = "buchAngebot-Artikel"
        '    Case "AU"
        '        getVorgangArtikelTableForType = "buchAuftrag-Artikel"
        '    Case "RÜ"
        '        getVorgangArtikelTableForType = "buchRuestschein-Artikel"
        '    Case "LI"
        '        getVorgangArtikelTableForType = "buchLieferschein-Artikel"
        '    Case "AR"
        '        getVorgangArtikelTableForType = "buchRech-Artikel"
        '    Case "RE"
        '        getVorgangArtikelTableForType = "buchRetourwaren-Artikel"
        '    Case "GU"
        '        getVorgangArtikelTableForType = "buchGutschrift-Artikel"

        '    Case VORGANG_TYP_LAU
        '        getVorgangArtikelTableForType = "buchLieferantAuftrag-Artikel"

        'End Select
    End Function

    '*****************************************************************
    'liefert den namen für den Ausdruck zurück
    '*****************************************************************
    Public Function getVarNameForType(ByVal Typ As String) As String
        Select Case Typ
            Case "AN"
                Return "letzteAngebotNummer"
            Case "AU"
                Return "letzteAuftragNummer"
            Case "RÜ"
                Return "letzteRüstscheinNummer"
            Case "LI"
                Return "letzteLieferscheinNummer"
            Case "AR"
                Return "letzteRechnungsNummer"
            Case "RE"
                Return "letzteRetourwarenNummer"
            Case "GU"
                Return "letzteGutschriftNummer"
            Case VORGANG_TYP_LAU
                Return "letzteLieferantAuftragNummer"
        End Select
    End Function

    '=======================================================
    'liefert den namen für den Ausdruck zurück
    '=======================================================
    Public Function getDruckForType(ByVal Typ As String) As String
        Select Case Typ
            Case "AN"
                getDruckForType = "Angebot"
            Case "AU"
                getDruckForType = "Auftrag"
            Case "RÜ"
                getDruckForType = "Rüstschein"
            Case "LI"
                getDruckForType = "Lieferschein"
            Case "AR"
                getDruckForType = "Rechnung"
            Case "RE"
                getDruckForType = "Rutourwaren"
            Case "GU"
                getDruckForType = "Gutschrift"
            Case VORGANG_TYP_LAU
                getDruckForType = "Auftrag"
        End Select
    End Function

    '=======================================================
    'get the next free vorgangnummer
    'first looks if the kundenGruppe needs special number curcle and then get the new one from the free
    '======================================================================================
    Public Function getNewVorgangNummer(ByVal Typ As String, ByVal IdNr As Integer) As String
        Dim von As Integer, bis As Integer

        Dim rs As MySqlDataReader
        von = 0
        bis = 9999999

        'if kundengruppe defined
        rs = openRecordset_("select VorgangNrKreisVon, VorgangNrKreisBis from [ofAdressen-KundenGruppen] where gruppe in (select kundengruppe from [ofadressen-settings]  where idnr = " & IdNr & ")", "")
        If rs.Read Then 'kundengruppe is definiert
            von = CInt(rs("VorgangNrKreisvon"))
            bis = CInt(rs("VorgangNrKreisbis"))
            'End If
            rs = openRecordset_("select * from " & getVorgangTableForType(Typ) & _
             "  where nummer>=" & von & " AND nummer<= " & bis & " order by nummer desc", dbOpenDynaset)
            'rs.Sort = "nummer"
            'Set rs = rs.openRecordset()
            If Not rs.Read Then
                getNewVorgangNummer = CStr(von)
            Else
                'rs.MoveLast
                getNewVorgangNummer = CStr(CInt(rs("Nummer")) + 1)
            End If
            rs.Close()
        Else
            'wenn keine gruppe definiert ' standart vorgang
            Dim letzteNummer As String
            Dim vname As String = getVarNameForType(Typ)

            letzteNummer = vars.varValue(vname)
            'Die Nummer erhöhen
            Call vars.SetVarValue(vname, CInt(letzteNummer) + 1)

            'prüfen ob die Nummer besetzt ist
            rs = openRecordset_("select * from " & getVorgangTableForType(Typ) & " where nummer =" & CStr(CInt(letzteNummer) + 1))
            If Not rs.Read Then
                getNewVorgangNummer = CStr(CInt(letzteNummer) + 1)
            Else 'wieder erhöhen
                getNewVorgangNummer = getNewVorgangNummer(Typ, IdNr)
            End If
            rs.Close()
        End If

    End Function

    '======================================================================================
    '======================================================================================
    Public Function getMWSTArtikel(ByVal ArtNr As String) As Double
        getMWSTArtikel = CDbl(vars.firstRow("select MWST from grArtikel where ArtNr=" & ArtNr))
    End Function

    '======================================================================================
    '======================================================================================
    Public Function calculateBruttoPreis(ByVal VKPreis As Double, ByVal ArtNr As String, ByVal IdNr As Integer) As Double
        If kunden.needsMWST(IdNr) Then
            calculateBruttoPreis = VKPreis * (1 + getMWSTArtikel(ArtNr) / 100)
        Else
            calculateBruttoPreis = VKPreis
        End If
    End Function

    '======================================================================================
    'Wrapper for the Function from Kunden Module
    '======================================================================================
    Public Function needsMWST(ByVal IdNr As Integer) As Boolean
        needsMWST = kunden.needsMWST(IdNr)
    End Function


End Class
