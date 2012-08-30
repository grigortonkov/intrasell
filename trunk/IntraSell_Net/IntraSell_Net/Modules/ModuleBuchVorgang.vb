Imports MySql.Data.MySqlClient
Imports IntraSell_DLL

Module ModuleBuchVorgang

    '    'Es wird ein neuer Vorgang angelegt
    '    Public Sub neueRechnung(ByVal formCaption As String)


    '        Dim frm As Form : frm = getFormByCaption(formCaption)

    '        If MsgBox("Wollen Sie eine/n " & getDruckForType(frm.txtVorgangType) & " anlegen?", vbYesNo, _
    '          "Neu" & getDruckForType(frm.txtVorgangType)) = vbYes Then

    '            frm.Rech_Artikel.Locked = False
    '            frm.Rech_Artikel.Enabled = True

    '            Dim rs As Recordset
    '            GoToRecord, , acNewRec


    '            'set Lieferant as Kunde
    '            If frm.txtVorgangType = "LAU" Then
    '                frm![LieferantNR] = Forms![lieferantenAdressen]![IDNR]
    '                frm![KundNr] = Forms![lieferantenAdressen]![IDNR]
    '            Else
    '                If isFormOpen("ofKunden") Then
    '                    Dim frmK As Form_ofKunden : frmK = getFormByName("ofKunden")
    '                    frm![KundNr] = frmK.IDNR 'Forms![ofKunden]![IDNR]
    '                    frmK.Status = "Kunde"
    '                Else
    '                    frm![KundNr] = 0
    '                End If
    '            End If

    '            frm!Nummer = IntraSellPreise.getNewVorgangNummer(frm.txtVorgangType, frm.KundNr)
    '            'Check if open vorgaenge
    '            Call openVorgänge(frm!KundNr, frm!Nummer, frm.txtVorgangType)

    '            'SAVE FORM
    '            Call SaveCurrentRecord()

    '            frm.ZahlungsBedungung.Requery()
    '            frm.TransportMethode.Requery()
    '            frm.ZahlungsMethode.Requery()

    '            'Setze die standart werte ( erste Zeile in Stammdaten)
    '            Dim txt
    '            txt = TABLEVALUE("grZahlungsbedingung", "Nr", TABLEVALUE("[ofAdressen-Zahlungsbedingungen]", "Idnr", frm.KundNr, "Bedingung"), "Methode")
    '            If InStr(txt, "Variable") < 1 Then frm!ZahlungsBedungung = txt ' setzen nur wenn vorhanden
    '            txt = TABLEVALUE("[ofAdressen-ZahlungsMethoden]", "Idnr", frm.KundNr, "Methode")
    '            If InStr(txt, "Variable") < 1 Then frm!ZahlungsMethode = txt
    '            txt = TABLEVALUE("[ofAdressen-TransportMethoden]", "Idnr", frm.KundNr, "Methode")
    '            If InStr(txt, "Variable") < 1 Then frm!TransportMethode = txt

    '        End If
    '        Call checkForStorno(frm.Form)

    '    End Sub


    Public frmCollection As New Collection


    ''=======================================================
    '' öffnet eine Übersicht mit den nicht abgeschlossenen Vorgänge um
    '' diese in einem neuen Vorgang zu umwandeln
    '' geeignet nur für die Benutzeroberfläche
    ''=======================================================
    'Sub openVorgänge(ByVal KundenNr, ByVal Nummer, ByVal formName)

    '    VorgängeSetup(formName, KundenNr)

    '    Dim rs As Recordset
    '    rs = CurrentDb.openRecordset("buchVorgaenge", dbOpenDynaset, dbSeeChanges)
    '    If Not rs.EOF Then
    '        OpenForm("buchVorgänge", acNormal, , "[IdNR] = " & KundenNr)
    '        Forms![buchVorgänge]![Nummer] = Nummer
    '        Forms![buchVorgänge]![Typ] = formName
    '        Forms![buchVorgänge]![listVorgang].Requery()
    '        'close the panel if there are no vorgange
    '    End If

    'End Sub
    '=======================================================
    'inserts the open (nicht benutzten) vorgange in die Tabelle buchVorgänge
    '=======================================================
    Private Sub FindeOffeneVorgaenge(Where As String, Typ As String, IDNR As String)

        Dim sql As String = " INSERT INTO buchVorgaenge (Typ, RechNr, KundNr, Datum, Summe, Bezahlt, Ausgedrukt, abgeschlossen )" & _
                " SELECT '" & Typ & "' AS t, Nummer, KundNr, Datum, Summe, Bezahlt, 0, 0 " & _
                " FROM " & Where & _
                " WHERE KundNr = " & IDNR & _
                " AND Wohin is Null AND abgeschlossen=0;"


        Call writeLog("TRY " & sql)
        RunSQL(sql)
        Call writeLog("TRY " & sql)

    End Sub

    '=======================================================
    ' setzt die mögliche umwandlungen fest
    ' was nach was konvertiert werden kann
    '=======================================================
    Public Sub VorgängeSetup(formName As String, IDNR As String)

        Dim query As String = "DELETE * FROM buchVorgaenge;"
        RunSQL(query)

        Select Case formName
            Case "AU"
                FindeOffeneVorgaenge("buchAngebot", "AN", IDNR)
            Case "RÜ"
                FindeOffeneVorgaenge("buchAngebot", "AN", IDNR)
                FindeOffeneVorgaenge("buchAuftrag", "AU", IDNR)
            Case "LI"
                FindeOffeneVorgaenge("buchAngebot", "AN", IDNR)
                FindeOffeneVorgaenge("buchAuftrag", "AU", IDNR)
                FindeOffeneVorgaenge("buchRuestschein", "RÜ", IDNR)
            Case "AR"
                FindeOffeneVorgaenge("buchAngebot", "AN", IDNR)
                FindeOffeneVorgaenge("buchAuftrag", "AU", IDNR)
                FindeOffeneVorgaenge("buchRuestschein", "RÜ", IDNR)
                FindeOffeneVorgaenge("buchLieferschein", "LI", IDNR)
            Case "RE"
                FindeOffeneVorgaenge("buchLieferschein", "LI", IDNR)
            Case "GU"
                FindeOffeneVorgaenge("buchRechnung", "AR", IDNR)
            Case "LAU"
                FindeOffeneVorgaenge("buchLieferantAuftrag", "LAU", IDNR)
        End Select

    End Sub



    '=======================================================
    '=======================================================
    Public Function setVorgangStatus(ByVal Vorgangtyp As String, ByVal VorgangNummer As Integer, ByVal Status As String) As Boolean

        'check if such a state exist


        Dim sql As String
        Dim rs As MySqlDataReader
        sql = "select id from buchVorgaengeStatus where vorgangtyp = '" & Vorgangtyp & "' and status = '" & Status & "'"
        rs = openRecordset(sql)
        If rs.Read Then
            MsgBox("Definieren Sie den Status '" & Status & "' in der buchVorgangStatus Tabelle!", vbExclamation)
        End If
        rs.Close()


        sql = "UPDATE " & getVorgangTableForType(Vorgangtyp) & " set status = '" & Status & "' where nummer=" & VorgangNummer

        Call writeLog("TRY " & sql)
        RunSQL(sql)
        Call writeLog("DONE " & sql)

        setVorgangStatus = True
    End Function

    ''=======================================================
    '' Sperrt die Editierung im Vorgang Fomrular
    ''=======================================================
    'Public Function checkForStorno(ByRef formVorgang As Form)

    '    'Logik:
    '    'AR darf wenn ausgedruckt nicht mehr verändert werden
    '    'Andere Vorgänge dürfen nachdem sie abgeschloßen sind nicht mehr verändert werden
    '    If IsNull(formVorgang![Nummer]) _
    '        Or formVorgang![checkbox_abgeschlossen] <> 0 _
    '        Or (formVorgang![checkBox_ausgedruckt] <> 0 And formVorgang![txtVorgangType] = VarValue("VORGANG_TYP_FUER_LAGER_ABGANG")) Then
    '        Debug.Print("Nur stornieren erlaubt!")
    '        formVorgang.Rech_Artikel.Locked = True
    '        formVorgang.Rech_Artikel.Enabled = False
    '        formVorgang.AllowEdits = False
    '        'formVorgang.cbVorgang.editable = True
    '        'formVorgang.Caption1.Caption = "Editieren nicht erlaubt"

    '    Else
    '        formVorgang.Rech_Artikel.Locked = False
    '        formVorgang.Rech_Artikel.Enabled = True
    '        formVorgang.AllowEdits = True
    '        'formVorgang.Caption1.Caption = "Editieren erlaubt"
    '    End If

    'End Function



    '==============================================================================
    ' storniert einen Vorgang
    ' die Nummer wird auch freigegeben und dann wieder verwendet, aber nur wenn das die letzte nummer ist
    '==============================================================================
    Public Function Storno(ByVal VorgangTyp As String, ByVal VorgangNummer As Integer) As Boolean

        Storno = False

        If IsNull(VorgangNummer) Then
            Exit Function
        End If


        Dim tr As MySqlTransaction = CurrentDB.BeginTransaction
        Try

            Dim sql As String
            Dim rs As MySqlDataReader

            sql = "select *  from " & getVorgangTableForType(VorgangTyp) & " where Typ='" & VorgangTyp & "' and nummer =" & VorgangNummer
            rs = openRecordset(sql)
            Dim Abgeschlossen, Bezahlt As Boolean
            If Not rs.Read Then
                Exit Function
            Else
                Abgeschlossen = rs("abgeschlossen")
                Bezahlt = rs("Bezahlt")
            End If
            rs.close()

            If MsgBox("Möchten Sie den Vorgang " & VorgangTyp & " - " & VorgangNummer & " stornieren?", vbYesNo) = vbYes Then


                If Abgeschlossen <> 0 Then 'abgeschlossen

                    If VorgangTyp = VarValue_Default("VORGANG_TYP_FUER_LAGER_ABGANG", "AR") Then 'Lieferschein
                        Call lagerEingang(VorgangNummer, VorgangTyp)
                    End If

                    If VorgangTyp = VarValue_Default("VORGANG_TYP_FUER_LAGER_EINGANG", "RÜ") Then
                        Call lagerAusgang(VorgangNummer, VorgangTyp)
                    End If

                    If VorgangTyp = "AR" And bezahlt Then
                        Call makeKassaBuchEintrag(Now(), VorgangTyp, VorgangTyp & "-" & VorgangNummer, -1 * getSummeVorgang(VorgangTyp, VorgangNummer))
                    End If
                End If


                'delete eigenschaften
                sql = "delete from [buchvorgaengeeigenschaften] where VorgangTyp='" & VorgangTyp & "' and Nummer =" & VorgangNummer
                RunSQL(sql)

                'delete pos
                sql = "delete from [" & getVorgangArtikelTableForType(VorgangTyp) & "] where Typ='" & VorgangTyp & "' and  Nummer =" & VorgangNummer
                RunSQL(sql)

                'delete vorgang
                sql = "delete from " & getVorgangTableForType(VorgangTyp) & " where Typ='" & VorgangTyp & "' and  Nummer =" & VorgangNummer
                RunSQL(sql)

               
                Storno = True
            End If
            tr.Commit()

        Catch ex As Exception
            writeLog("ERROR in storno " + ex.Message)
            tr.Rollback()
            MsgBox("Die Transaktion wurde abgebrochen!", vbExclamation)
        End Try

    End Function

    'liefert die Brutto summe eines vorganges
    Function getSummeVorgang(ByVal VorgangTyp As String, ByVal VorgangNummer As Integer) As Double
        Dim rs, sql
        sql = "Select Sum(Stk*Preis_Brutto) as Summe FROM [" & getVorgangArtikelTableForType(VorgangTyp) & "] " & _
              " where RechNr =" & VorgangNummer
        rs = openRecordset(sql)
        If rs.EOF Then
            getSummeVorgang = 0
        Else
            If IsNull(rs("Summe")) Then
                getSummeVorgang = 0
            Else
                getSummeVorgang = 0 + rs("Summe")
            End If
        End If
        rs.Close()
        rs = Nothing
    End Function


    Public Sub setSummeVorgang(ByVal Vorgangtyp As String, ByVal VorgangNummer As Integer, ByVal formCaption As String)

        If IsNull(VorgangNummer) Then Exit Sub


        Dim rs As MySqlDataReader, sql As String
        sql = "Select sum(RoundUp([Stk]*[PreisATS],2)) as Summe, sum(RoundUp([Stk]*[PreisATS_Brutto],2)) as Summe_Brutto " & _
        " FROM [" & getVorgangArtikelTableForType(Vorgangtyp) & "] where RechNr = " & VorgangNummer & ""
        rs = openRecordset(sql)
        If rs.Read Then


            If Not IsNull(rs("Summe")) Then

                Dim Summe As Double, SummeBrutto As Double, SummeMWST As Double
                Summe = rs("Summe")
                SummeBrutto = nvl(rs("Summe_Brutto"), 0)
                SummeMWST = nvl(rs("Summe_Brutto"), 0) - rs("Summe")

                If isFormOpenByCaption(formCaption) Then
                    Dim frm As Vorgang = Functions.getFormByCaption(formCaption)

                    If frm.summeNetto <> rs("Summe") Or IsNull(frm.summeNetto) Then
                        frm.summeNetto = rs("Summe")
                    End If

                    If frm.MWST <> nvl(rs("Summe_Brutto"), 0) - rs("Summe") Or IsNull(frm.MWST) Then
                        frm.MWST = nvl(rs("Summe_Brutto"), 0) - rs("Summe")
                    End If

                    If frm.summeBrutto <> rs("Summe_Brutto") Or IsNull(frm.summeBrutto) Then
                        frm.summeBrutto = rs("Summe_Brutto")
                    End If

                Else 'DB Update
                    sql = "update  [" & getVorgangTableForType(Vorgangtyp) & "] " & _
                      " set Summe =" & Replace(RoundUp(rs("Summe"), 2), ",", ".") & _
                      ", SummeMWST =" & Replace(RoundUp(nvl(rs("Summe_Brutto"), 0) - rs("Summe"), 2), ",", ".") & _
                      ", SummeBrutto =" & Replace(RoundUp(nvl(rs("Summe_Brutto"), 0), 2), ",", ".") & _
                      " where Nummer =" & VorgangNummer
                    'TODO: in MySQL ist der DS gesperrt und dadurch probleme
                    RunSQL(sql)
                End If

                setSummeVorgangWaehrung(Vorgangtyp, VorgangNummer, Summe, SummeBrutto, SummeMWST)

            End If
        End If
        rs.Close()
        rs = Nothing


    End Sub



    Private Sub setSummeVorgangWaehrung(ByVal VorgangTyp As String, ByVal VorgangNummer As Int16, _
                                        ByVal Summe As Decimal, ByVal SummeBrutto As Decimal, ByVal SummeMWST As Decimal)

        'pruefe ob DS existiert und sonst lege einen an für die EUR Berechnungen
        If VarValue_Default("WAEHRUNG_UMRECHNUNG", "false") = "false" Then
            Exit Sub
        End If


        Dim sql As String = "select * from buchvorgaengeWaehrung where vorgangTyp = '" + VorgangTyp + "' and Nummer =  " & VorgangNummer
        Dim rs As MySqlDataReader
        rs = openRecordset(sql)
        If rs.Read Then
            Dim kurs As String : kurs = InputBox("Bitte Wechselkurs zum EUR eingeben:", "Kurs", 1)


            sql = "Insert into buchvorgaengeWaehrung (VorgangTyp, Nummer, Wechselkurs, Waehrung) " & _
                  " values ( '" + VorgangTyp + "'," & VorgangNummer & "," & Replace(kurs, ",", ".") & ", 'EUR')"

        Else
            sql = "Update buchvorgaengeWaehrung a set " & _
                  " Summe = Wechselkurs * " & Replace(Summe, ",", ".") & _
                  ", SummeMWST = Wechselkurs * " & Replace(SummeMWST, ",", ".") & _
                  ", SummeBrutto = Wechselkurs * " & Replace(SummeBrutto, ",", ".") & _
                  " where id  = " & rs("ID")
        End If

        RunSQL(sql)

    End Sub


    Function nvl(param1 As Object, param2 As Object) As Object
        If IsNull(param1) Then
            nvl = param2
        Else
            nvl = param1
        End If
    End Function

    '    '=======================================================================
    '    'öffnet die maske buchRechnung (funktioniert für alle mögliche vorgänge)
    '    '=======================================================================
    '    Public Function openVorgangFunction(ByVal VorgangType As String, _
    '                                        ByVal IDNR As Integer, _
    '                                        Optional LieferantNR As Long = 0, _
    '                                        Optional ByVal formName As String = "buchRechnung")


    '        On Error GoTo Err_ntnRechnung_Click


    '        'OpenForm formName
    '        'Dim frm As Form: Set frm = Forms(formName)
    '        Dim frm As Object 'Form_buchRechnung

    '        If formName = "buchRechnungBar" Then
    '            frm = New Vorgang
    '        Else
    '            frm = New Vorgang
    '        End If


    '        frm.Caption = VorgangType & " fuer KDNR " & IDNR

    '        frm.RecordSource = getVorgangTableForType(VorgangType)
    '        frm.Rech_Artikel.Form.RecordSource = getVorgangArtikelTableForType(VorgangType)

    '        If formName <> "buchRechnungBar" Then
    '            frm.KundNr2.RowSource = "SELECT q.ID, [Firma] & "" "" & [Name] & "" "" & [Adresse] & "" "" & "" "" & [PLZ] & ""-"" & [Ort] AS Auswahl " & _
    '                                    " FROM qry_Adressfelder_und_Weitere q " & _
    '                                    " WHERE q.IDNR=" & IDNR & ";"

    '            frm.cbDateinameVorlage.RowSource = "SELECT a.Dateiname " & _
    '                            " FROM buchVorgaengeAusdrucke a LEFT JOIN buchVorgaengeAusdruckeLog l ON a.Dateiname = l.Dateiname " & _
    '                            " GROUP BY a.Dateiname, a.Bereich " & _
    '                            " HAVING a.Bereich = ""VORGANG_" & VorgangType & """" & _
    '                            " ORDER BY Count(l.ID) DESC , a.Dateiname;"

    '        End If

    '        If LieferantNR > 0 Then 'Im Lieferanten Modus
    '            frm.Filter = "LieferantNr=" & LieferantNR
    '        Else
    '            frm.Filter = "KundNr=" & IDNR
    '        End If

    '        frm.FilterOn = True



    '        frm.txtVorgangType = VorgangType

    '        frm.subformEigenschaften.Form.RecordSource = "select * from buchVorgaengeEigenschaften where vorgangtyp = '" & VorgangType & "'"
    '        frm.Status.RowSource = "SELECT Status FROM buchVorgaengeStatus  Where Vorgangtyp ='" & VorgangType & "'"

    '        frm.subformEigenschaften.Form.RecordSource = "select * from buchVorgaengeEigenschaften where vorgangtyp = '" & VorgangType & "'"

    '        If VorgangType = "LAU" Then  'Im Lieferanten Modus
    '            Dim f As Vorgang
    '            f = frm
    '            Call setInLAUMode(f)
    '        End If

    '        ''access stürzt ab
    '        'nach der ArtNr, EAN Sortieren
    '        ''frm.Rech_Artikel.Form.OrderBy = "Lookup_cbArtNr.EAN"
    '        ''frm.Rech_Artikel.Form.OrderByOn = True

    '        GoToRecord(acDataForm, formName, acLast)

    '        frm.Visible = True

    '        On Error GoTo errInCollection
    '        frmCollection.Add(frm, frm.Caption)
    '        On Error GoTo 0

    'errInCollection:
    '        frmCollection.Remove(frm.Caption)
    '        frmCollection.Add(frm, frm.Caption)

    '        Exit Function

    'Exit_ntnRechnung_Click:
    '        Exit Function

    'Err_ntnRechnung_Click:
    '        MsgBox(Err.Description)
    '        Resume Exit_ntnRechnung_Click
    '    End Function

    '    '=======================================================
    '    'öffnet die maske buchRechnung (für alle möglich vorgänge) und positioniert die maske an dem bestimmten vorgang
    '    '=======================================================
    '    Public Function openVorgangFunctionByNummer(ByVal VorgangType As String, ByVal Nummer As Integer) As Vorgang
    '        On Error GoTo Err_ntnRechnung_Click



    '        If Nummer < 1 Or VorgangType = "" Then
    '            MsgBox("Keine gültige Vorgangsnummer!", vbCritical)
    '            Exit Function
    '        End If

    '        ' OpenForm "buchRechnung"


    '        Dim frm As Vorgang = New Vorgang

    '        'Set frm = Forms("buchRechnung")
    '        frm.Caption = VorgangType & Nummer
    '        frm.txtVorgangType = VorgangType

    '        frm.RecordSource = getVorgangTableForType(VorgangType)
    '        frm.Rech_Artikel.Form.RecordSource = getVorgangArtikelTableForType(VorgangType)



    '        frm.KundNr2.RowSource = "SELECT q.ID, [Firma] & "" "" & [Name] & "" "" & [Adresse] & "" "" & "" "" & [PLZ] & ""-"" & [Ort] AS Auswahl " & _
    '                                " FROM qry_Adressfelder_und_Weitere q " & _
    '                                " WHERE q.IDNR=(select kundnr from " & getVorgangTableForType(VorgangType) & " where Nummer = " & Nummer & ");"

    '        frm.cbDateinameVorlage.RowSource = "SELECT a.Dateiname " & _
    '                        " FROM buchVorgaengeAusdrucke a LEFT JOIN buchVorgaengeAusdruckeLog l ON a.Dateiname = l.Dateiname " & _
    '                        " GROUP BY a.Dateiname, a.Bereich " & _
    '                        " HAVING a.Bereich = ""VORGANG_" & VorgangType & """" & _
    '                        " ORDER BY Count(l.ID) DESC , a.Dateiname;"


    '        frm.Filter = "Nummer=" & Nummer
    '        frm.FilterOn = True

    '        frm.txtVorgangType = VorgangType
    '        frm.Status.RowSource = "SELECT Status FROM buchVorgaengeStatus  Where Vorgangtyp ='" & VorgangType & "'"

    '        frm.subformEigenschaften.Form.RecordSource = "select * from buchVorgaengeEigenschaften where vorgangtyp = '" & VorgangType & "'"
    '        frm.cbDateinameVorlage.Requery()

    '        If VorgangType = "LAU" Then  'Im Lieferanten Modus
    '            Call setInLAUMode(frm)
    '        End If

    '        frm.Visible = True
    '        ''access stürzt ab
    '        'nach der ArtNr, EAN Sortieren
    '        ''frm.Rech_Artikel.Form.OrderBy = "Lookup_cbArtNr.EAN"
    '        ''frm.Rech_Artikel.Form.OrderByOn = True

    '        On Error GoTo errInCollection
    '        frmCollection.Add(frm, frm.Caption)
    '        On Error GoTo 0
    '        openVorgangFunctionByNummer = frm
    '        Exit Function

    'errInCollection:
    '        frmCollection.Remove(frm.Caption)
    '        frmCollection.Add(frm, frm.Caption)
    '        openVorgangFunctionByNummer = frm
    '        Exit Function

    'Exit_ntnRechnung_Click:
    '        Exit Function

    'Err_ntnRechnung_Click:
    '        MsgBox(Err.Description)
    '        Resume Exit_ntnRechnung_Click
    '    End Function

    '    Sub setInLAUMode(ByRef frm As Vorgang)
    '        frm.[buchAdresseKopf].LinkMasterFields = "LieferantNr"
    '        frm.[buchAdresseKopf].Form.RecordSource = "select * from qry_AdressfelderLieferant"
    '        frm.[buchAdresseKopf].Form.KundNr.RowSource = "SELECT IDNR, Firma FROM lieferantenAdressen"
    '        frm.[buchAdresseKopf].Form.KundNr.Requery()
    '    End Sub

    '    Public Function addVorgangEigenschaft(ByVal Vorgangtyp As String, _
    '     ByVal VorgangNummer As String, _
    '    ByVal Eigenschaft As String, _
    '    ByVal Wert As String)


    '        'fur interdel
    '        If UCase(Eigenschaft) = UCase("VerladeTag") Then

    '            OpenQuery("tradeBoard_GeschaefteEinstellen")
    '            'Geschaeft einstellen

    '        End If


    '        Dim sql As String
    '        sql = "INSERT INTO buchVorgaengeEigenschaften ( VorgangTyp, Nummer, Name, [Value] )" & _
    '             " values ('" & Vorgangtyp & "', " & VorgangNummer & ", '" & Eigenschaft & "', '" & Wert & "')"


    '        RunSQL(sql)






    '    End Function


    '    Public Sub setStandartBedingung(ByVal VorgangType As String, ByVal VorgangNummer As Integer, ByVal KundNr As String)


    '        Dim zb, zm, tm
    '        zb = TableValue("grZahlungsbedingung", "Nr", TableValue("[ofAdressen-Zahlungsbedingungen]", "Idnr", KundNr, "Bedingung"), "Methode")

    '        zm = TableValue("[ofAdressen-ZahlungsMethoden]", "Idnr", KundNr, "Methode")

    '        tm = TableValue("[ofAdressen-TransportMethoden]", "Idnr", KundNr, "Methode")

    '        If InStr(zb, "vorhanden") > 0 Then zb = ""
    '        If InStr(zm, "vorhanden") > 0 Then zm = ""
    '        If InStr(tm, "vorhanden") > 0 Then tm = ""

    '        Dim sql As String
    '        sql = "Update " & getVorgangTableForType(VorgangType) & " set ZahlungsBedungung='" & zb & "'," & _
    '        " Zahlungsmethode='" & zm & "', TransportMethode='" & tm & "'  where Nummer=" & VorgangNummer


    '        RunSQL(sql)


    '    End Sub


    '    Public Sub ArtikelAuflisten(Typ As String, Nummer As String)
    '        Dim Source

    '        Dim tbl As String : tbl = getVorgangArtikelTableForType(Typ)

    '        Source = " SELECT DISTINCTROW [ArtNR], " & _
    '                 " [Stk], [PreisATS], " & _
    '                 " [Bezeichnung], " & _
    '                 " [PreisATS_Brutto] FROM [" & tbl & "] WHERE RechNr = " & _
    '                   Nummer & ";"
    '        OpenForm("buchVorgänge-Uebersicht")
    '         Forms![buchVorgänge-Uebersicht]![listArtikel].ColumnWidths = "2cm;2cm;2cm;5cm;2cm;"
    '         Forms![buchVorgänge-Uebersicht]![listArtikel].RowSource = Source
    '         Forms![buchVorgänge-Uebersicht]![listArtikel].Requery
    '    End Sub


    Public Sub VorgangAbschliessen(Typ As String, Nummer As String)
        Try


            Dim Abgeschlossen As Boolean = firstRow("select abgeschlossen from " & getVorgangTableForType(Typ) & " where Typ='" & Typ & "' and Nummer = " & Nummer)

            If IsNull(Abgeschlossen) Or Abgeschlossen = 0 Then
                If Typ = VarValue_Default("VORGANG_TYP_FUER_LAGER_ABGANG", "AR") Then
                    Call lagerAusgang(Nummer, Typ)
                End If

                If Typ = VarValue_Default("VORGANG_TYP_FUER_LAGER_EINGANG", "RÜ") Then
                    Call lagerEingang(Nummer, Typ)
                End If

                RunSQL("update " & getVorgangTableForType(Typ) & " set abgeschlossen = -1 where Typ='" & Typ & "' and Nummer = " & Nummer)

                MsgBox("Der Vorgang (Rechnung) wurde erfolgreich abgeschlossen!")

            Else
                MsgBox("Der Vorgang (Rechnung) wurde bereits abgeschlossen!", vbCritical)
            End If


        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


End Module
