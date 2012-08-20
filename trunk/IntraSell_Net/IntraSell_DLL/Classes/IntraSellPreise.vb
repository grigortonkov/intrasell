Option Explicit On
Imports MySql.Data.MySqlClient
Public Class IntraSellPreise

    Public CurrentDB As MySqlConnection

    Private vars As IntraSellVars
    Private kunden As IntraSellKunden

    Const VORGANG_TYP_LAU = "LAU"

    Public Sub init(ByVal connString)

        functionsDB.ConnStringODBC = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
        functionsDB.connOpen()
        CurrentDB = functionsDB.CurrentDB

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
    Public Function getPreis(ByVal IdNr, ByVal ArtNr, ByVal Stk) As Double
        If IsNull(IdNr) Then IdNr = -1
        If IsNull(ArtNr) Then getPreis = 0 : Exit Function
        Dim ArtKatNr
        getPreis = 0
        Dim sql, rs

        sql = "select ArtKatNr from grArtikel where artNr = " & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        If rs.EOF Then getPreis = 0 : Exit Function

        ArtKatNr = rs("ArtKAtNR")

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

        If Not rs.EOF Then
            'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
            getPreis = getBasisVKPreis(ArtNr)

            If rs("vkpreis") > 0 Then
                getPreis = rs("vkpreis")
                Exit Function
            End If

            If rs("aufschlagvkpreis") <> 0 Then
                getPreis = (rs("aufschlagvkpreis") + 1) * getBasisVKPreis(ArtNr)
                Exit Function
            End If

            If rs("aufschlagekpreis") <> 0 Then
                getPreis = (rs("aufschlagekpreis") + 1) * getEKPreis(ArtNr)
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
    Private Function getSpecialPreis(ByVal IdNr, ByVal ArtNr) As Double
        getSpecialPreis = 0
        Dim sql, rs
        sql = "select vkpreis from [grArtikel-VKPreisPerSelection] where preislistename in " & _
        " (select preisliste from [ofAdressen-settings] where IdNR = " & IdNr & ") and artnr = " & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        If Not rs.EOF Then
            'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
            getSpecialPreis = rs("vkpreis")
        End If
        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    ' returns the  min or max and VK or EK PReis from LieferantenArtikelPreis
    '*****************************************************************
    Public Function getLieferantPreis(ByVal ArtNr, ByVal boolMinPreis, ByVal boolVKPreis) As Double
        getLieferantPreis = 0
        Dim sql, rs

        If boolMinPreis Then
            sql = "select min(PreisField) as mPREIS from [lieferantenArtikel-Preise] where PreisField>0 and artikelnr = " & ArtNr
        Else
            sql = "select max(PreisField) as mPREIS from [lieferantenArtikel-Preise] where PreisField>0 and artikelnr = " & ArtNr
        End If

        If boolVKPreis Then sql = Replace(sql, "PreisField", "VKpreis") Else sql = Replace(sql, "PreisField", "EKpreis")

        rs = openRecordset_(sql, dbOpenDynaset)
        If Not rs.EOF Then
            'MsgBox "Für diesen Kunden ist ein anderer Preis definiert! VKpreis=" & rs("vkpreis")
            getLieferantPreis = rs("mPREIS")
        End If
        rs.Close()
        rs = Nothing
    End Function



    '*****************************************************************
    'gibt den VKpreis eines Artikels zurück, egal von besteller
    'falls aufschlag auf EKpreis nach Kategorie existiert dann wird es aufgeschlagen
    '*****************************************************************
    Private Function getBasisVKPreis(ByVal ArtNr) As Double
        Dim sql, rs, ArtKatNr

        sql = "select ArtNR, ArtKatNR, PreisATS from grArtikel where artnr=" & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        getBasisVKPreis = 0

        If Not rs.EOF Then
            ArtKatNr = rs("ArtKatNR")
            Dim Aufschlag : Aufschlag = getAufschlagEKpreisKategorie(ArtKatNr)
            If Aufschlag <> 0 Then
                getBasisVKPreis = getEKPreis(ArtNr) * (1 + Aufschlag)
            Else
                If IsNull(rs("PreisATS")) Then
                    getBasisVKPreis = 0
                Else
                    getBasisVKPreis = rs("PreisATS")
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
    Public Function getEKPreis(ByVal ArtNr) As Double
        Dim sql, rs

        sql = "select EKPreis from [grArtikel] where artnr=" & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        getEKPreis = 0
        If Not rs.EOF Then
            If rs("EKPreis") <= 0 Then 'not defined
                getEKPreis = makeEKPreisVonLieferant(ArtNr)
            Else
                If IsNull(rs("EKPreis")) Then
                    getEKPreis = 0
                Else
                    getEKPreis = rs("EKPreis")
                End If
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function



    '*****************************************************************
    'liefert Bestpreis aus der lieferanten Preise Tabelle
    '*****************************************************************
    Function makeEKPreisVonLieferant(ByVal ArtNr) As Double
        makeEKPreisVonLieferant = 0
        If ArtNr & "" = "" Then Exit Function
        Dim sql, rs
        sql = "select EKPreis from [lieferantenArtikel-Preise] " & _
              " where ekpreis>0 and artikelnr=" & ArtNr & _
              " ORDER BY Prioritaet, EKPreis"
        rs = openRecordset_(sql, dbOpenDynaset)
        makeEKPreisVonLieferant = 0
        If Not rs.EOF Then
            If IsNull(rs("EKPreis")) Then
                makeEKPreisVonLieferant = 0
            Else
                makeEKPreisVonLieferant = rs("EKPreis")
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    'returns the name of the best lieferant
    '*****************************************************************
    Public Function getBestLieferant(ByVal ArtNr) As String
        Dim sql, rs
        sql = "select artikelnr, LieferantNr, EKPreis from [lieferantenArtikel-Preise] " & _
              " where artikelnr=" & ArtNr & " ORDER BY prioritaet, EKPreis"
        rs = openRecordset_(sql, dbOpenDynaset)
        getBestLieferant = "n/a"
        If Not rs.EOF Then
            sql = "select Firma from lieferantenAdressen where idnr=" & rs("LieferantNr")
            rs = openRecordset_(sql, dbOpenDynaset)
            If Not rs.EOF Then
                getBestLieferant = rs("Firma")
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    'returns the lagerinfo of the best lieferant
    '*****************************************************************
    Public Function getLieferantLagerInfo(ByVal ArtNr) As String

        If IsNull(ArtNr) Then
            getLieferantLagerInfo = ""
            Exit Function
        End If

        Dim sql, rs
        sql = "select ArtNr, Bezeichnung, Bezeichnung1 from [grArtikel] where artnr=" & ArtNr
        rs = openRecordset_(sql, dbOpenDynaset)
        If Not rs.EOF Then
            If rs("Bezeichnung1") & "" <> "" Then
                getLieferantLagerInfo = rs("Bezeichnung1")
            End If
        End If

        sql = "select artikelnr, Lagerinfo from [lieferantenArtikel-Preise] " & _
              " where artikelnr=" & ArtNr & " ORDER BY prioritaet, EKPreis"
        rs = openRecordset_(sql, dbOpenDynaset)
        getLieferantLagerInfo = "n/a"

        If Not rs.EOF Then
            getLieferantLagerInfo = rs("Lagerinfo")
        End If

        rs.Close()
        rs = Nothing
    End Function

    '*****************************************************************
    '*****************************************************************
    Private Function getAufschlagEKpreisKategorie(ArtKatNr) As Double
        Dim sql, rs
        sql = " select ArtKatNR, Aufschlag, ArtKatNrParent from [grArtikel-Kategorien] where " & _
              " ArtKatNr =" & ArtKatNr & _
              " and Aufschlag > 0 "

        rs = openRecordset_(sql, dbOpenDynaset)

        If Not rs.EOF Then
            getAufschlagEKpreisKategorie = rs("Aufschlag")
        Else 'recursion
            If ArtKatNr > 0 Then 'take aufschlag from parent kategory
                sql = "select ArtKatNrParent from [grArtikel-Kategorien] where ArtKatNR =" & ArtKatNr
                rs = openRecordset_(sql, dbOpenDynaset)
                If Not rs.EOF Then
                    getAufschlagEKpreisKategorie = getAufschlagEKpreisKategorie(rs("ArtKatNrParent"))
                End If
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function


    '*****************************************************************
    ' makeBruttoPreis for any preis without artnr
    '*****************************************************************
    Function makeBruttoPreis(ByVal Preis, ByVal MwstGroup, ByVal Land) As Double
        ' Dim Land: Land = Session("LAND")
        If Land = "" Then Land = "AT"
        makeBruttoPreis = Preis * (1 + getVAT(Land, MwstGroup) / 100)
    End Function

    '*****************************************************************
    'need only the artNr AND Stk /for staffelung/ to create preis / +MWST, VAT/
    '*****************************************************************
    Function makeBruttoPreis2(ByVal ArtNr, ByVal Stk, ByVal Land)
        If Stk = "" Then Stk = 1
        Dim sql, rs, preisManyPieces
        rs = openRecordset_("select ArtNr, MWST from grArtikel where ArtNr=" & ArtNr, dbOpenDynaset)
        If rs.EOF Then
            makeBruttoPreis2 = 0
        Else
            Dim preis1stk : preis1stk = makeNettoPreis(ArtNr, Stk, 0)
            makeBruttoPreis2 = makeBruttoPreis(preis1stk, rs("MWST"), Land)
        End If
        rs.Close()
    End Function


    '*****************************************************************
    ' makeNettoPreis
    ' need only the artNr AND Stk /for staffelung/
    '*****************************************************************
    Function makeNettoPreis(ArtNr, Stk, IdNr) As Double
        Dim sql, rs, preisManyPieces
        rs = openRecordset_("select * from grArtikel where ArtNr=" & ArtNr, dbOpenDynaset)
        If rs.EOF Then
            makeNettoPreis = 0
        Else
            Dim preis1stk : preis1stk = getPreis(IdNr, ArtNr, Stk) 'rs("PreisATS")
            sql = "select * from [grArtikel-Staffelpreise] Where ArtNr = " & ArtNr & " AND stkAb <" & Stk
            Dim rsRabatt = openRecordset_(sql, dbOpenDynaset)
            Dim prozent : prozent = 0
            If rsRabatt.Read Then prozent = rsRabatt("ProzentRabatt")


            preisManyPieces = preis1stk * 100 / (100 + prozent)
            makeNettoPreis = preisManyPieces
        End If
        rs.Close()
    End Function


    '*****************************************************************
    ' getVAT
    ' MWSTGROUP -0, 1, or 2
    '*****************************************************************
    Function getVAT(Land, MwstGroup) As String
        If Land = "" Then Land = "AT"
        Land = UCase(Land)
        Dim sql, rs
        sql = "SELECT Land, Prozent FROM grMWST where Land='" & Land & "' AND MWSTGROUP=" & MwstGroup
        'Response.Write sql
        rs = openRecordset_(sql, dbOpenDynaset)
        If Not rs.EOF Then
            getVAT = rs("Prozent")
        Else
            getVAT = 206
            getVAT = "Error: Die MWST Information fehlt für Land [" & Land & "]!"

        End If
        rs.Close()
    End Function

    '*****************************************************************
    ' getVAT
    '*****************************************************************
    Function getClientLand(IdNr) As String
        getClientLand = vars.firstRow("select iso2 from ofAdressen a, grland l where  a.land = l.idnr and a.idnr=" & IdNr)
        Exit Function
        '
        Dim plzLAND, clientPLZ
        plzLAND = vars.TABLEVALUE("ofAdressen", "IDNR", IdNr, "LAND")
        'response.write "PLZLand =" & PLZLand
        If plzLAND = 43 Then getClientLand = "AT"
        If plzLAND = 49 Then getClientLand = "DE"
        If plzLAND = 359 Then getClientLand = "BG"
        If plzLAND = 1 Then getClientLand = "US"
    End Function


    '*****************************************************************
    ' For example Converts one Auftrag to Rechnung
    ' returns the nummer of the created new OrderType or 0 of failed
    '*****************************************************************
    Public Function convertFromTo(ByVal FromOrder, ByVal ToOrder, ByVal fromNummer, ByVal NewKundNr) As String
        Dim benutzeTransaktion As Boolean
        benutzeTransaktion = False
        ' benutzeTransaktion = TRue -> es gibt Probleme mit MySQL DB und Binary Log Level Enabled
        Dim mysqltr As MySqlTransaction
        Try


            Dim sql
            Dim rs As MySqlDataReader
            Dim tableNameFrom, tableNameFromProducts, tableNameTo, tableNameToProducts


            If benutzeTransaktion Then
                'CurrentDB.BeginTrans()
                mysqltr = conn.BeginTransaction
            End If


            tableNameFrom = getVorgangTableForType(FromOrder)
            tableNameFromProducts = getVorgangArtikelTableForType(FromOrder)

            tableNameTo = getVorgangTableForType(ToOrder)
            tableNameToProducts = getVorgangArtikelTableForType(ToOrder)

            Dim IdNr
            sql = "select * from " & tableNameFrom & " where nummer =" & fromNummer
            rs = openRecordset_(sql, "")
            If Not rs.Read Then
                convertFromTo = 0
                Exit Function
            Else
                IdNr = rs("Kundnr")
            End If
            rs.Close()

            Dim nextRechnungNummer
            nextRechnungNummer = getNewVorgangNummer(ToOrder, IdNr)

            If ToOrder = VORGANG_TYP_LAU And FromOrder <> VORGANG_TYP_LAU Then  ' lieferanten Auftrag
                sql = "INSERT INTO " & tableNameTo & " ( Nummer, KundNr, Datum, MitarbeiterNr, LieferantNr, Notiz, Summe, Bezahlt, Ausgedrukt, anElba, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, Woher, SummeMWST, SummeBrutto ) " & _
                      " SELECT " & nextRechnungNummer & " , " & NewKundNr & ", Date(), MitarbeiterNr, " & NewKundNr & ", Notiz, Summe, 0, 0, 0, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, '" & FromOrder & fromNummer & "', SummeMWST, SummeBrutto " & _
                      " FROM " & tableNameFrom & _
                      " WHERE Nummer = " & fromNummer
            Else
                sql = "INSERT INTO " & tableNameTo & " ( Nummer, KundNr, Datum, MitarbeiterNr, LieferantNr, Notiz, Summe, Bezahlt, Ausgedrukt, anElba, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, Woher, SummeMWST, SummeBrutto ) " & _
                      " SELECT " & nextRechnungNummer & " , " & NewKundNr & ", Date(), MitarbeiterNr, LieferantNr, Notiz, Summe, 0, 0, 0, ZahlungsBedungung, TransportMethode, Zahlungsmethode, KundNr2, '" & FromOrder & fromNummer & "', SummeMWST, SummeBrutto " & _
                      " FROM " & tableNameFrom & _
                      " WHERE Nummer = " & fromNummer
            End If

            Call openRecordset_(sql, "")

            'Positionen
            If ToOrder = VORGANG_TYP_LAU And FromOrder <> VORGANG_TYP_LAU Then   ' lieferanten Auftrag
                sql = "INSERT INTO [" & tableNameToProducts & "] ( RechNr, ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, Herkunft, Incoterm,  Spezifikation ) " & _
                       " SELECT " & nextRechnungNummer & ", ArtNR, EKpreis, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation  " & _
                       " FROM [" & tableNameFromProducts & "] WHERE " & _
                       " RechNr=" & fromNummer
            Else
                sql = "INSERT INTO [" & tableNameToProducts & "] ( RechNr, ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation ) " & _
                       " SELECT " & nextRechnungNummer & ", ArtNR, PreisATS, PreisEuro, Stk, PreisATS_Brutto, ArtikelIdentifikation, EKpreis, LieferantNr, Bezeichnung, Packung, herkunft, Incoterm,  Spezifikation  " & _
                       " FROM [" & tableNameFromProducts & "] WHERE " & _
                       " RechNr=" & fromNummer
            End If



            'response.write SQL
            Call openRecordset_(sql, "")

            sql = "INSERT INTO buchVorgaengeEigenschaften ( VorgangTyp, Nummer, Name, [Value] )" & _
                " SELECT '" & ToOrder & "', " & nextRechnungNummer & ", Name, [Value] " & _
                " FROM buchVorgaengeEigenschaften " & _
                " WHERE VorgangTyp='" & FromOrder & "'  AND Nummer=" & fromNummer & ";"
            Call openRecordset_(sql, "")

            'set where the vorgang goes to
            sql = "UPDATE " & tableNameFrom & " SET Wohin = '" & ToOrder & nextRechnungNummer & "'" & _
                    " WHERE Nummer = " & fromNummer
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
    '=======================================================
    Public Function getVorgangTableForType(ByVal Typ) As String
        Select Case Typ
            Case "AN"
                getVorgangTableForType = "buchAngebot"
            Case "AU"
                getVorgangTableForType = "buchAuftrag"
            Case "RÜ"
                getVorgangTableForType = "buchRuestschein"
            Case "LI"
                getVorgangTableForType = "buchLieferschein"
            Case "AR"
                getVorgangTableForType = "buchRechnung"
            Case "RE"
                getVorgangTableForType = "buchRetourwaren"
            Case "GU"
                getVorgangTableForType = "buchGutschrift"

            Case VORGANG_TYP_LAU
                getVorgangTableForType = "buchLieferantAuftrag"

        End Select
    End Function

    '*****************************************************************
    '*****************************************************************
    Public Function getVorgangArtikelTableForType(ByVal Typ) As String
        Select Case Typ
            Case "AN"
                getVorgangArtikelTableForType = "buchAngebot-Artikel"
            Case "AU"
                getVorgangArtikelTableForType = "buchAuftrag-Artikel"
            Case "RÜ"
                getVorgangArtikelTableForType = "buchRuestschein-Artikel"
            Case "LI"
                getVorgangArtikelTableForType = "buchLieferschein-Artikel"
            Case "AR"
                getVorgangArtikelTableForType = "buchRech-Artikel"
            Case "RE"
                getVorgangArtikelTableForType = "buchRetourwaren-Artikel"
            Case "GU"
                getVorgangArtikelTableForType = "buchGutschrift-Artikel"

            Case VORGANG_TYP_LAU
                getVorgangArtikelTableForType = "buchLieferantAuftrag-Artikel"

        End Select
    End Function

    '*****************************************************************
    'liefert den namen für den Ausdruck zurück
    '*****************************************************************
    Public Function getVarNameForType(ByVal Typ) As String
        Select Case Typ
            Case "AN"
                getVarNameForType = "letzteAngebotNummer"
            Case "AU"
                getVarNameForType = "letzteAuftragNummer"
            Case "RÜ"
                getVarNameForType = "letzteRüstscheinNummer"
            Case "LI"
                getVarNameForType = "letzteLieferscheinNummer"
            Case "AR"
                getVarNameForType = "letzteRechnungsNummer"
            Case "RE"
                getVarNameForType = "letzteRetourwarenNummer"
            Case "GU"
                getVarNameForType = "letzteGutschriftNummer"

            Case VORGANG_TYP_LAU
                getVarNameForType = "letzteLieferantAuftragNummer"

        End Select
    End Function

    '=======================================================
    'liefert den namen für den Ausdruck zurück
    '=======================================================
    Public Function getDruckForType(ByVal Typ) As String
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
    Public Function getNewVorgangNummer(ByVal Typ, ByVal IdNr) As String
        Dim von, bis, sql
        Dim rs
        von = 0
        bis = 9999999

        'if kundengruppe defined
        rs = openRecordset_("select VorgangNrKreisVon, VorgangNrKreisBis from [ofAdressen-KundenGruppen] where gruppe in (select kundengruppe from [ofadressen-settings]  where idnr = " & IdNr & ")", "")
        If Not rs.EOF Then 'kundengruppe is definiert
            von = rs("VorgangNrKreisvon")
            bis = rs("VorgangNrKreisbis")
            'End If
            rs = openRecordset_("select * from " & getVorgangTableForType(Typ) & _
             "  where nummer>=" & von & " AND nummer<= " & bis & " order by nummer desc", dbOpenDynaset)
            'rs.Sort = "nummer"
            'Set rs = rs.openRecordset()
            If rs.EOF Then
                getNewVorgangNummer = von
            Else
                'rs.MoveLast
                getNewVorgangNummer = rs("Nummer") + 1
            End If
            rs.Close()
        Else
            'wenn keine gruppe definiert ' standart vorgang
            Dim letzteNummer
            Dim vname : vname = getVarNameForType(Typ)

            letzteNummer = vars.varValue(vname)
            'Die Nummer erhöhen
            Call vars.SETVARVALUE(vname, letzteNummer + 1)

            'prüfen ob die Nummer besetzt ist
            rs = openRecordset_("select * from " & getVorgangTableForType(Typ) & " where nummer =" & (letzteNummer + 1), dbOpenDynaset)
            If rs.EOF Then
                getNewVorgangNummer = letzteNummer + 1
            Else 'wieder erhöhen
                getNewVorgangNummer = getNewVorgangNummer(Typ, IdNr)
            End If

        End If

    End Function

    '======================================================================================
    '======================================================================================
    Public Function getMWSTArtikel(ByVal ArtNr As String) As String
        getMWSTArtikel = vars.firstRow("select MWST from grArtikel where ArtNr=" & ArtNr)
    End Function

    '======================================================================================
    '======================================================================================
    Public Function calculateBruttoPreis(ByVal VKPreis As Double, ByVal ArtNr As String, ByVal IdNr As String) As Double
        If kunden.needsMWST(IdNr) Then
            calculateBruttoPreis = VKPreis * (1 + getMWSTArtikel(ArtNr) / 100)
        Else
            calculateBruttoPreis = VKPreis
        End If
    End Function

    '======================================================================================
    'Wrapper for the Function from Kunden Module
    '======================================================================================
    Public Function needsMWST(ByVal IdNr) As Boolean
        needsMWST = kunden.needsMWST(IdNr)
    End Function


End Class
