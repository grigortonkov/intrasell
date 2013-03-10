Imports MySql.Data.MySqlClient
Imports IntraSell_DLL

Module ModuleLager

    Public Const LAGER_KOSTEN = "LK"
    Public Const LAGER_EINGANG = "LE"
    Public Const LAGER_AUSGANG = "LA"

    'Verbucht die Einträge von der Tabelle lagerLagerBuchung
    Public Sub buchen(ByVal cbDruckeBarcode As Boolean)

        Dim tr As MySqlTransaction = CurrentDB.BeginTransaction
        Try
            ' save current

            Dim rs As MySqlDataReader, sql As String

            sql = "select * from lagerLagerBuchung" ' where lagerort is not null"
            rs = openRecordset(sql)

            Dim typBuchung As Integer
            While rs.Read
                typBuchung = 0
                If rs("VorgangsTyp") = LAGER_EINGANG Then typBuchung = 1
                If rs("VorgangsTyp") = LAGER_AUSGANG Then typBuchung = -1


                If rs("VorgangsTyp") = LAGER_KOSTEN Then  'Lager Kosten
                    Call Lagerbuchung(rs("Vorgangsnummer"), _
                                        rs("Vorgangstyp"), _
                                        rs("ArtNR"), _
                                        0, _
                                        0, _
                                        rs("lagerOrt"), _
                                        0, _
                                        0, _
                                        0, _
                                        0, _
                                        rs("Ekpreis"), _
                                        rs("Datum"))

                Else
                    Call Lagerbuchung(rs("Vorgangsnummer"), _
                                 rs("Vorgangstyp"), _
                                 rs("ArtNR"), _
                                 rs("Ekpreis"), _
                                 typBuchung * rs("Stk"), _
                                 rs("lagerOrt"), _
                                 typBuchung * rs("GewichtBrutto"), _
                                 typBuchung * rs("GewichtNetto"), _
                                 typBuchung * rs("GewichtTara"), _
                                 typBuchung * rs("Einheiten"), _
                                 0, _
                                 rs("Datum"))

                End If

                If rs("LieferantNR") & "" <> "" Then
                    Call makeLieferantenPreis(rs("ArtNR"), rs("LieferantNr"), rs("Ekpreis"))


                    'GENERATE BARCODE FOR EVERY ITEM
                    If cbDruckeBarcode = True Then
                        Dim sqlBC

                        Dim i As Integer

                        For i = 1 To rs("Stk")
                            Dim Bezeichnung As String : Bezeichnung = firstRow("select bezeichnung from grArtikel where ArtNr = " & rs("ArtNR"))
                            Dim SerienNrOriginal
                            SerienNrOriginal = InputBox("Scannen Sie die Seriennummer für Item " & i & " mit der Bezeichnung '" & Bezeichnung & "' ein:", "Original Barcode")

                            sqlBC = "Insert into [grArtikel-ItemTrackingHistory] (Barcode, SerienNrOriginal, Vorgangstyp)" & _
                                    " values ('" & generateNewBarcode(rs("ArtNR"), rs("LieferantNr")) & "','" & SerienNrOriginal & "','LE')"
                            RunSQL(sqlBC)
                            'Insert in buchSeriennummer
                            sqlBC = "Insert into [buchSeriennummer] (ArtNr, SerienNr, Eingangsdatum, EkPreis, LagerOrt)" & _
                                    " values ('" & rs("ArtNR") & "','" & SerienNrOriginal & "'," & makeSQLDate(Date.Today) & " ," & Replace(rs("Ekpreis"), ",", ".") & ", " & rs("lagerOrt") & ")"
                            RunSQL(sqlBC)

                        Next
                        'PRINT
                        'TODO OpenReport("printBarcodes", acViewNormal, , "vorgangstyp='LE' and (Status='' or Status is null)")
                        'update SQL
                        sqlBC = "update [grArtikel-ItemTrackingHistory] set Status ='gedruckt' where vorgangstyp='LE' and (Status='' or Status is null)"
                        RunSQL(sqlBC)

                    End If
                    'END GENERATE

                End If

            End While


            sql = "delete  from lagerLagerBuchung" ' where lagerort is not null"
            RunSQL(sql)

            tr.Commit()
            MsgBox("Fertig!", vbInformation)
            Exit Sub
        Catch ex As Exception
            tr.Rollback()
            MsgBox("Die Transaktion wurde storniert!" + Err.Description, vbCritical)
        End Try
    End Sub


    Public Sub lagerEingang(ByVal VorgangNr As Integer, ByVal Vorgangtyp As String, Optional ByVal Silent As Boolean = False)
        Call lagerAusgangEingang(VorgangNr, Vorgangtyp, LAGER_EINGANG, Silent)
    End Sub


    'this fuction is called from form Lieferschein
    Public Sub lagerAusgang(ByVal RechNr As Integer, ByVal Vorgangtyp As String, Optional ByVal Silent As Boolean = False)
        Call lagerAusgangEingang(RechNr, Vorgangtyp, LAGER_AUSGANG, Silent)
    End Sub

    'Lagerbuchung Transaction
    'Transaktionsgesichert
    Public Sub lagerAusgangEingang(ByVal VorgangNummer As Integer, _
     ByVal VorgangTyp As String, _
     ByVal BewegungsTyp As String, _
     Optional ByVal Silent As Boolean = False)

        Dim trAlreadyCreated = False

        Dim tr As MySqlTransaction = Nothing
        Try
            CurrentDB.BeginTransaction()
        Catch ex As Exception
            If ex.Message.Contains("Nested transactions are not supported") Then
                trAlreadyCreated = True
            Else
                Throw ex
            End If
        End Try


        Try

            Call writeLog("BEGIN TRANSACTION")


            'lagerstand von den betroffenen Artikel aktualisieren
            Dim tableToUpdate = getVorgangArtikelTableForType(VorgangTyp)

            Dim Bewegung As Integer = -1
            If BewegungsTyp = LAGER_EINGANG Then Bewegung = 1


            Dim sql As String
            Dim rsCheck As MySqlDataReader
            'check if closed
            sql = "select abgeschlossen from " & getVorgangTableForType(VorgangTyp) & " where nummer=" & VorgangNummer & " and Typ='" & VorgangTyp & "'"


            rsCheck = openRecordset(sql)


            If Not rsCheck.Read Then ' error
                rsCheck.Close()
                Exit Sub
            Else
                If rsCheck("abgeschlossen") = True And BewegungsTyp = LAGER_AUSGANG Then
                    If Not Silent Then
                        MsgBox("Der Lagerbestand wurde bereits ausgebucht!", vbCritical)
                    End If
                    rsCheck.Close()
                    Exit Sub
                End If
            End If

            rsCheck.Close()
            rsCheck = Nothing


            'lagerstand von alle betroffenen artikeln aktualisieren
            Dim sqlL As String
            sqlL = "select [" & tableToUpdate & "].Id, [" & tableToUpdate & "].Stk, [" & tableToUpdate & "].ArtNr, ArtikelIdentifikation, LagerOrt, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten " & _
                                             "from [" & tableToUpdate & "]  LEFT JOIN [buchvorgang-artikeldetaillager] lb ON [" & tableToUpdate & "].ID = lb.ID " & _
                                             " Where Nummer = " & VorgangNummer & " and typ='" & VorgangTyp & "'"
            writeLog("Lagerbuchung: " & sqlL)
            Dim rsM As DataTable = openRecordsetInMemory(sqlL)

            For Each r In rsM.Rows


                'kalkulationen im lager basieren auf einstandspreise
                Dim Einstandspreis As String = Replace(getEinstandsPreis(r("ArtNr")), ",", ".")

                If r("LagerOrt") & "" <> "" Then
                    sql = " INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, " & IIf(Bewegung = -1, "PreisAusgang, Ausgang", "PreisEingang, Eingang") & ", Datum, " & _
                         " LagerOrt, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten)" & _
                         " SELECT """ & VorgangTyp & """, Nummer, [" & tableToUpdate & "].ArtNR, " & Einstandspreis & ", [" & tableToUpdate & "].Stk, Now(), " & _
                         " LagerOrt, " & Bewegung & "*GewichtBrutto, " & Bewegung & "*GewichtNetto, " & Bewegung & "*GewichtTara, " & Bewegung & "*Einheiten " & _
                         " FROM [" & tableToUpdate & "] LEFT JOIN [buchvorgang-artikeldetaillager] lb ON [" & tableToUpdate & "].ID = lb.ID" & _
                         " WHERE  [" & tableToUpdate & "].ArtNr = " & r("ArtNr") & " and Nummer =" & VorgangNummer & " and [" & tableToUpdate & "].id = " & r("Id")
                Else
                    sql = " INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, " & IIf(Bewegung = -1, "PreisAusgang, Ausgang", "PreisEingang, Eingang") & ", Datum)" & _
                         " SELECT """ & VorgangTyp & """, Nummer, [" & tableToUpdate & "].ArtNR, " & Einstandspreis & ", [" & tableToUpdate & "].Stk, Now() " & _
                         " FROM [" & tableToUpdate & "] LEFT JOIN lagerlagerbuchung ON [" & tableToUpdate & "].ID = lagerlagerbuchung.ID" & _
                         " WHERE  [" & tableToUpdate & "].ArtNr = " & r("ArtNr") & " and Nummer =" & VorgangNummer & " and [" & tableToUpdate & "].id = " & r("Id")
                End If

                Call writeLog("TRY " & sql)
                RunSQL(sql)
                Call writeLog("DONE " & sql)

                Call CreateLagerbestandAndIncrease(r("ArtNr"), _
                 Bewegung * r("Stk"), _
                 NVL(r("LagerOrt"), 0), _
                 Bewegung * NVL(r("GewichtBrutto"), 0), _
                 Bewegung * NVL(r("GewichtNetto"), 0), _
                 Bewegung * NVL(r("GewichtTara"), 0), _
                 Bewegung * NVL(r("Einheiten"), 0), _
                 0, 0)
                'Lagerbuchung detail löschen
                'DoCmd.RunSQL "delete from [buchvorgang-artikeldetaillager] where id = " & rs("Id")
                'make Barcodebewegung
                Call makeBCHistory(r("ArtikelIdentifikation") & "", VorgangTyp, VorgangNummer, IIf(Bewegung = -1, "Lagerausgang", "Lagereingang"))

                'buchSeriennummer aktualisieren (Item)
                If r("ArtikelIdentifikation") & "" <> "" Then
                    Dim feldName As String = "Unbekannt"
                    If VorgangTyp = "AN" Then feldName = "AngebotsNr"
                    If VorgangTyp = "AU" Then feldName = "AuftragsNr"
                    If VorgangTyp = "AR" Then feldName = "RechnungsNr"
                    If VorgangTyp = "RE" Then feldName = "RetourenNr"
                    If VorgangTyp = "LI" Then feldName = "LieferscheinNr"
                    If VorgangTyp = "RÜ" Then feldName = "RüstscheinNr"
                    Dim neuerLagerOrt As String
                    If Bewegung = -1 Then 'Ausgang - aber wir wissen nicht wohin
                        neuerLagerOrt = "Null"
                    Else 'beim storno
                        neuerLagerOrt = NVL(r("LagerOrt"), 0)
                    End If

                    sql = "Update buchSeriennummer set LagerOrt=" & neuerLagerOrt & ", " & feldName & "=" & VorgangNummer & " where SerienNr='" & r("ArtikelIdentifikation") & "'"
                    Call writeLog("TRY " & sql)
                    RunSQL(sql)
                    Call writeLog("DONE " & sql)

                End If

            Next


            'end transaction
            If Not trAlreadyCreated Then
                writeLog("COMMIT")
                tr.Commit()
            End If


            If Not Silent Then
                MsgBox("Der Lagerbestand wurde mit diesen Artikeln aktualisiert!")
            End If

            Exit Sub

        Catch ex As Exception
            tr.Rollback()
            Call writeLog("ROLLBACK " + Err.Description)
            MsgBox("Die Transaktion wurde storniert! " + vbCrLf + Err.Description, vbCritical)
        End Try

    End Sub


    'this function is called from lagerBuchung Form
    Public Sub Lagerbuchung(ByVal Vorgangsnummer As Integer, _
                            ByVal VorgangType As String, _
                            ByVal ArtNr As Integer, _
                            ByVal EKPreis As Decimal, _
                            ByVal Stk As Decimal, _
                            ByVal LagerOrt As String, _
                            ByVal GewichtBrutto As Decimal, _
                            ByVal GewichtNetto As Decimal, _
                            ByVal gewichttara As Decimal, _
                            ByVal einheiten As Decimal, _
                            ByVal LagerKosten As Decimal, _
                            ByVal Datum As Date)

        If IsNull(LagerOrt) Then
            MsgBox("Lagerort ist nicht definiert!", vbCritical)
        End If

        If IsNull(Vorgangsnummer) Or Vorgangsnummer = "" Then
            Exit Sub
        End If


        Dim sql As String
        If Stk >= 0 Then
            sql = "INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, PreisEingang, PreisAusgang, Eingang, Ausgang, Datum, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten, Lagerort, LagerKosten )" & _
           " VALUES ('" & VorgangType & "'," & Vorgangsnummer & "," & ArtNr & "," & Replace(EKPreis, ",", ".") & ",0, " & Replace(Stk, ",", ".") & ", 0, " & makeSQLDate(Datum) & ", " & Replace(GewichtBrutto, ",", ".") & ", " & Replace(GewichtNetto, ",", ".") & ", " & Replace(gewichttara, ",", ".") & ", " & Replace(einheiten, ",", ".") & ", " & LagerOrt & "," & Replace(LagerKosten, ",", ".") & ")"

        Else
            sql = "INSERT INTO [grArtikel-LagerBewegung] ( Vorgangstyp, Vorgangsnummer, ArtNr, PreisAusgang, PreisEingang, Ausgang, Eingang, Datum, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten, Lagerort)" & _
          " VALUES ('" & VorgangType & "'," & Vorgangsnummer & "," & ArtNr & "," & Replace(EKPreis, ",", ".") & ", 0, " & Replace(-1 * Stk, ",", ".") & ", 0, " & makeSQLDate(Datum) & ", " & Replace(-1 * GewichtBrutto, ",", ".") & ", " & Replace(-1 * GewichtNetto, ",", ".") & ", " & Replace(-1 * gewichttara, ",", ".") & ", " & Replace(-1 * einheiten, ",", ".") & ", " & LagerOrt & ")"
        End If

        Call writeLog("TRY" & sql)
        RunSQL(sql)
        Call writeLog("DONE " & sql)

        Dim AktuellerWert = getEinstandsPreis(ArtNr, LagerOrt)


        'lagerstand von den betroffenen artikeln aktualisieren
        Call CreateLagerbestandAndIncrease(ArtNr, _
                                           Stk, _
                                           LagerOrt, _
                                           GewichtBrutto, _
                                           GewichtNetto, _
                                           gewichttara, _
                                           einheiten, _
                                           AktuellerWert, _
                                           LagerKosten)

    End Sub


    'Einfache Lagerbuchung in Tabelle Lagerbestand
    Sub CreateLagerbestandAndIncrease(ByVal ArtNr As Integer, _
                                      ByVal Stk As Double, _
                                      ByVal LagerOrt As Integer, _
                                      ByVal GewichtBrutto As Decimal, _
                                      ByVal GewichtNetto As Decimal, _
                                      ByVal gewichttara As Decimal, _
                                      ByVal einheiten As Decimal, _
                                      ByVal AktuellerWert As Decimal, _
                                      ByVal LagerKosten As Decimal)

        Dim rsExistsLager As MySqlDataReader, sql As String
        'Dim AktuellerWert As Double 'kalkulieren Einstandspreis
        'AktuellerWert = getEinstandsPreis(ArtNR, LagerOrt)


        If LagerOrt < 0 Or IsNull(LagerOrt) Then LagerOrt = 0


        rsExistsLager = openRecordset("select ArtNr from [grArtikel-Lagerbestand] " & _
           " Where lagerOrt= " & LagerOrt & " and ArtNR = " & ArtNr)
        ' create new record 'Warning: the Update is done afterwards
        If Not rsExistsLager.Read Then 'no lagerbestand info
            rsExistsLager.Close()
            sql = "Insert Into [grArtikel-Lagerbestand] (Datum, ArtNR, LagerOrt, LagerBestand, ReserviertStk, MaxStk, GewichtBrutto, GewichtNetto, GewichtTara, Einheiten, AktuellerWert, LagerKosten) " & _
                  " values (Date(), " & ArtNr & " ," & LagerOrt & ",0 , 0, 0, 0, 0, 0, 0, 0, 0)"
            Call writeLog("TRY " & sql)
            RunSQL(sql)
            Call writeLog("DONE " & sql)
        Else
            rsExistsLager.Close()
        End If

        ' at the end
        sql = "UPDATE [grArtikel-Lagerbestand] Set " & _
        "  lagerBestand = lagerBestand + " & Replace(Stk, ",", ".") & _
        ", GewichtBrutto = GewichtBrutto + " & Replace(GewichtBrutto, ",", ".") & _
        ", GewichtNetto = GewichtNetto + " & Replace(GewichtNetto, ",", ".") & _
        ", GewichtTara = GewichtTara + " & Replace(gewichttara, ",", ".") & _
        ", Einheiten = Einheiten + " & Replace(einheiten, ",", ".") & _
        ", AktuellerWert = " & Replace(AktuellerWert, ",", ".") & _
        ", LagerKosten = LagerKosten + " & Replace(LagerKosten, ",", ".") & _
        " where  lagerOrt= " & LagerOrt & " and  ArtNr = " & ArtNr

        Call writeLog("TRY " & sql)
        RunSQL(sql)
        Call writeLog("DONE " & sql)


        'SET ARTIKEL NEU seit 2012
        'dasselbe für alle Unterartikel durchführen
        Dim sqlUnterArtikel As String = "select * from buchSetArtikel where UnterArtNr is not null and ArtNr=" & ArtNr
        Dim rsUnterArtikel As MySqlDataReader = openRecordset(sqlUnterArtikel)
        While rsUnterArtikel.Read
            Call CreateLagerbestandAndIncrease(rsUnterArtikel("UnterArtNr"), Stk * rsUnterArtikel("Stk"), LagerOrt, 0, 0, 0, 0, 0, 0)
        End While
        rsUnterArtikel.Close()

    End Sub

    Public Function maxBestand(ByVal real1, ByVal real2) As Double
        maxBestand = real2
        If real1 > real2 Then
            maxBestand = real1
        End If
    End Function

    'Liefert die Lagermenge in allen Läger
    Public Function getLagerBestandArtikel(ByVal ArtNr As Object) As Double

        If IsNull(ArtNr) Then
            getLagerBestandArtikel = 0 : Exit Function
        End If

        Dim rs As MySqlDataReader
        Dim sql As String
        sql = "select sum(lagerbestand) as lB from [grArtikel-Lagerbestand] where ArtNR = " & ArtNr
        rs = openRecordset(sql)
        If rs.Read And Not IsNull(rs("lB")) Then
            getLagerBestandArtikel = rs("lB")
        Else
            getLagerBestandArtikel = -9999999 'egal ' wird nicht lagerbestand geführt
        End If

        rs.Close()
        rs = Nothing

    End Function


    'Liefert die Lagermenge in bestimmten Lager an bestimmten DAtum
    Public Function getLagerBestandArtikelAnDatum( _
      ByVal ArtNr As Object, _
      ByVal LagerOrt As String, _
      ByVal Datum As Date, _
      ByVal ergebnisSpalte As String) As Double

        If IsNull(ArtNr) Then
            getLagerBestandArtikelAnDatum = 0 : Exit Function
        End If

        Dim rs As MySqlDataReader
        Dim sql As String
        sql = "select a." & ergebnisSpalte & " as lB from " & _
        " (SELECT   Sum([Eingang]-[Ausgang]) AS Bestand, Sum([grartikel-lagerbewegung].LagerKosten) AS LagerKosten, " & _
        " Sum([grartikel-lagerbewegung].Einheiten*iif(Ausgang>0,-1,1)) AS Einheiten, " & _
        " Sum([grartikel-lagerbewegung].GewichtBrutto*iif(Ausgang>0,-1,1)) AS GewichtBrutto, " & _
        " Sum([grartikel-lagerbewegung].GewichtNetto*iif(Ausgang>0,-1,1)) AS GewichtNetto, " & _
        " Sum([grartikel-lagerbewegung].GewichtTara*iif(Ausgang>0,-1,1)) AS GewichtTara " & _
        " FROM [grartikel-lagerbewegung] " & _
        " where ArtNR = " & ArtNr & " and LagerOrt = " & LagerOrt & " And Datum < " & toSQLDate(Datum) & _
        " GROUP BY  ArtNr,  Lagerort) a  "
        rs = openRecordset(sql)
        If rs.Read And Not IsNull(rs("lB")) Then
            getLagerBestandArtikelAnDatum = rs("lB")
        Else
            getLagerBestandArtikelAnDatum = 0 'egal ' wird nicht lagerbestand geführt
        End If

        rs.Close()
        rs = Nothing

    End Function





    'Liefert Einstandpreis pro Artikel, ohne Lagerberücksichtigung! nur Lagereingänge!
    Public Function getEinstandsPreis(ByVal ArtNr, Optional ByVal LagerOrt = 0) As Double
        If Not IsNumeric(ArtNr) Then
            getEinstandsPreis = 0
            Exit Function
        End If

        Dim rs As MySql.Data.MySqlClient.MySqlDataReader
        Dim Sql As String

        'IIf([Eingang] = 0, 1, [Eingang])

        'Methode I nur nach Lager Eingänge!
        getEinstandsPreis = getEKPreis(ArtNr)

        sql = " SELECT [grArtikel-LagerBewegung].ArtNr, " & _
        " Sum(( CASE [Eingang] WHEN 0 THEN 1 ELSE [Eingang] END  * [PreisEingang]-[Ausgang]*[PreisAusgang]))/Sum([Eingang]-[Ausgang]) AS DurchschnEKPreis, " & _
        " Sum(([Eingang]*[PreisEingang]))/Sum([Eingang]) AS DurchschnEKPreisNurEK, " & _
        " Sum([Eingang]-[Ausgang]) AS Bestand , " & _
        " Sum([Eingang]) AS BestandNurEK " & _
        " FROM [grArtikel-LagerBewegung] " & _
        " WHERE VorgangsTyp='LE' AND ArtNr = " & ArtNr

        If LagerOrt & "" <> "0" Then
            sql = sql & " AND LagerOrt = " & LagerOrt
        End If

        sql = sql & " GROUP BY [grArtikel-LagerBewegung].ArtNr"

        writeLog(sql)
        rs = openRecordset(sql)


        If rs.Read Then
            If rs("Bestand") <= 0 Then
                'If rs("BestandNurEK") > 0 Then
                '    getEinstandsPreis = RoundUp(rs("DurchschnEKPreisNurEK"), 2)
                'End If
            Else
                If IsNull(rs("DurchschnEKPreis")) Then
                    getEinstandsPreis = RoundUp(0, 2)
                Else
                    getEinstandsPreis = RoundUp(rs("DurchschnEKPreis"), 2)
                End If
            End If
        End If

        rs.Close()
        rs = Nothing
    End Function

    'Liefert Lagerkosten/Enstehungskosten pro Artikel je nach Lager für einen bestimmten Zeitraum
    Public Function getLagerKosten(ByVal ArtNr As Integer, ByVal LagerOrt As String, _
                                   ByVal FromDatum As Date, ByVal ToDatum As Date) As Double
        If Not IsNumeric(ArtNr) Then
            getLagerKosten = 0
            Exit Function
        End If

        Dim rs As MySqlDataReader, sql As String

        'Methode I nur nach Lagerkosten
        sql = " SELECT [grArtikel-LagerBewegung].ArtNr, " & _
        " Sum([PreisEingang]) AS LagerKosten, " & _
        " FROM [grArtikel-LagerBewegung] " & _
        " WHERE (VorgangsTyp=""" & LAGER_KOSTEN & """) AND ArtNr = " & ArtNr


        sql = sql & " AND LagerOrt = " & LagerOrt
        sql = sql & " AND Datum between " & toSQLDate(FromDatum) & " and " & toSQLDate(ToDatum)
        sql = sql & " GROUP BY [grArtikel-LagerBewegung].ArtNr"

        Debug.Print(sql)
        rs = openRecordset(sql)

        getLagerKosten = getEKPreis(ArtNr)

        If rs.Read Then
            getLagerKosten = RoundUp(rs("LagerKosten"), 2)
        End If

        rs.Close()
        rs = Nothing
    End Function


    ' erstellt eine Nachricht ja nachdem vorgangTyp
    Function checkVorgangForWarnings(ByVal Vorgangtyp As String, ByVal VorgangNummer As String) As String
        Dim sql As String, rs As MySqlDataReader

        checkVorgangForWarnings = ""
        If Vorgangtyp = "LI" Or Vorgangtyp = "AU" Then
            'ccheck if closed

            sql = "select abgeschlossen from " & getVorgangTableForType(Vorgangtyp) & " where nummer  = " & VorgangNummer
            rs = openRecordset(sql)
            If rs.Read Then
                If rs("abgeschlossen") <> 0 Then
                    checkVorgangForWarnings = "Abgeschlossen"
                    rs.Close()
                    Exit Function
                End If
            End If


            If Not checkIfVorgangLagerBestandOK(Vorgangtyp, VorgangNummer) Then
                checkVorgangForWarnings = "Lagerbest fehlt"
            Else
                checkVorgangForWarnings = "Lagerbest OK"
            End If
        End If

    End Function

    'prüft ob der lagerbestand ist genug um den auftrag zu akzeptieren
    Function checkIfVorgangLagerBestandOK(ByVal Vorgangtyp As String, ByVal VorgangNummer As String) As Boolean

        Dim sql As String, rs As MySqlDataReader

        sql = "SELECT [buchAuftrag-Artikel].RechNr FROM [buchAuftrag-Artikel] WHERE RechNr=" & VorgangNummer & " AND (((getlagerbestandartikel([ArtNr])-[Stk])<0))"
        rs = openRecordset(sql)
        If Not rs.Read Then
            checkIfVorgangLagerBestandOK = True
        Else
            checkIfVorgangLagerBestandOK = False
        End If

    End Function


    Public Function makeLieferantenPreis(ByVal ArtNr As Integer, ByVal LieferantNr As Integer, ByVal EKPreis As Decimal, Optional ByVal Bezeichnung As Object = "")
        makeLieferantenPreis = True
        Err.Clear()

        If LieferantNr < 1 Then Exit Function
        Dim rs As MySqlDataReader
        rs = openRecordset("select * ´lieferantenArtikel-Preise´ where ArtikelNr =" & ArtNr & " AND LieferantNr = " & LieferantNr)

        If Not rs.Read Then ' add new
            Dim PreisId As Integer = nextId("[lieferantenArtikel-Preise]", "PreisID")

            RunSQL("insert into [lieferantenArtikel-Preise] (PreisId, ArtikelNr, LieferantNR, EKPreis, Bezeichnung) " & _
            " values (" & PreisId & "," & ArtNr & "," & LieferantNr & "," & Replace(EKPreis, ",", ".") & ",'" & Bezeichnung & "')")

        Else ' update

            rs.Close()
            RunSQL("update [lieferantenArtikel-Preise] set EKPreis = " & Replace(EKPreis, ",", ".") & " where PreisId=" & rs("PreisID"))

        End If


    End Function



    Sub Umbuchen(ByVal LagerOrt_von As String, ByVal LagerOrt_Nach As String)

        If MsgBox("Wollen Sie diese Positionen umbuchen?", vbYesNo) = vbNo Then Exit Sub
        Dim tr As MySqlTransaction = CurrentDB.BeginTransaction
        Try


            ' save current
            ' Call SaveCurrentRecord()


            Dim rs As MySqlDataReader, sql
            Dim typBuchung : typBuchung = 1
            'If Ausgang Then typBuchung = -1

            sql = "select * from lagerLagerBuchung "
            rs = openRecordset(sql)

            While rs.Read
                'Ausgang vom Lager
                Call Lagerbuchung(rs("Vorgangsnummer"), _
                                    rs("Vorgangstyp"), _
                                    rs("ArtNR"), _
                                    rs("Ekpreis"), _
                                    -1 * rs("Stk"), _
                                     LagerOrt_von, _
                                    -1 * rs("GewichtBrutto"), _
                                    -1 * rs("GewichtNetto"), _
                                    -1 * rs("GewichtTara"), _
                                    -1 * rs("Einheiten"), _
                                    0, _
                                    rs("Datum"))
                'Eingang
                Call Lagerbuchung(rs("Vorgangsnummer"), _
                                    rs("Vorgangstyp"), _
                                    rs("ArtNR"), _
                                    rs("Ekpreis"), _
                                    rs("Stk"), _
                                    LagerOrt_Nach, _
                                    rs("GewichtBrutto"), _
                                    rs("GewichtNetto"), _
                                    rs("GewichtTara"), _
                                    rs("Einheiten"), _
                                    0, _
                                    rs("Datum"))

            End While


            sql = "delete from lagerLagerBuchung"
            RunSQL(sql)


            tr.Commit()

            MsgBox("Fertig!", vbInformation)
            Exit Sub

        Catch ex As Exception

            tr.Rollback()
            MsgBox("Die Transaktion wurde storniert!" + Err.Description, vbCritical)
        End Try
    End Sub

End Module
