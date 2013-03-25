Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Public Class Vorgang
    Implements InterfacePrintable

    Dim loading As Boolean = True
    Const COL_ID_INDEX As Integer = 0
    Const COL_STK_INDEX As Integer = 3
    Const COL_ARTNR_COMBO_INDEX As Integer = 4
    Const COL_ARTNR_INDEX As Integer = 5
    Const COL_BEZEICHNUNG_INDEX As Integer = 6
    Const COL_PREIS_NETTO_INDEX As Integer = 7
    Const COL_PREIS_BRUTTO_INDEX As Integer = 8
    Const COL_MWST_INDEX As Integer = 9
    Const COL_EKPREIS_INDEX As Integer = 10

    Const DEFAULT_WORD_VORLAGE As String = "Vorlagen/Vorgang.dot"

    Private _kundNr As Integer = 0

    Public Property KundNr As Integer
        Get
            Return _kundNr
        End Get
        Set(ByVal value As Integer)
            _kundNr = value
        End Set
    End Property

    Public Property summeNetto As Integer
        Get
            Return Me.SummeTextBox.Text
        End Get
        Set(ByVal value As Integer)
            Me.SummeTextBox.Text = value
        End Set
    End Property

    Public Property MWST As Integer
        Get
            Return Me.SummeMWSTTextBox.Text
        End Get
        Set(ByVal value As Integer)
            Me.SummeMWSTTextBox.Text = value
        End Set
    End Property

    Public Property summeBrutto As Integer
        Get
            Return Me.SummeBruttoTextBox.Text
        End Get
        Set(ByVal value As Integer)
            Me.SummeBruttoTextBox.Text = value
        End Set
    End Property
    '


    'Die Datensätze filtern
    Public Sub FilterBy(ByVal Expression As String)
        Try
            Me.BuchvorgangBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub BuchvorgangBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BuchvorgangBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.BuchvorgangBindingSource.EndEdit()
            Me.Buchvorgang_artikelBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsVorgaenge)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Sub LadeKundenSpezifischeDaten(ByVal comp As String)

        Dim IDNR As String = Me.KundNrAdressenControl.IDNR : If IDNR Is Nothing Then IDNR = "-1"
        Dim VorgangNummer As String = Me.NummerTextBox.Text
        Dim VorgangTyp As String = Me.TypComboBox.SelectedValue
        If comp = "ZahlungsMethodeComboBox" Then
            FillComboBox(Me.ZahlungsMethodeComboBox, "SELECT Methode FROM `ofAdressen-Zahlungsmethoden` WHERE IdNr in (" & IDNR & ") " & _
                         " or IdNr in (select KundNr from buchVorgang where Typ='" & VorgangTyp & "' and nummer = " & VorgangNummer & ") ORDER BY Methode", "Methode")
        End If
        If comp = "ZahlungsbedingungComboBox" Then
            FillComboBox(Me.ZahlungsbedingungComboBox, "SELECT Methode FROM `ofAdressen-Zahlungsbedingungen` INNER JOIN grZahlungsbedingung ON Bedingung = Nr " & _
                          " WHERE IdNr in (" & IDNR & ") or IdNr in (select KundNr from buchVorgang where Typ='" & VorgangTyp & "' and nummer = " & VorgangNummer & ") GROUP BY Methode", "Methode")
        End If
        If comp = "TransportMethodeComboBox" Then
            FillComboBox(Me.TransportMethodeComboBox, "SELECT Methode FROM `ofAdressen-Transportmethoden` WHERE IdNr in (" & IDNR & ") or " & _
                         " IdNr in (select KundNr from buchVorgang where Typ='" & VorgangTyp & "' and nummer = " & VorgangNummer & ") ORDER BY Methode", "Methode")
        End If

    End Sub

    Private Sub Rechnung_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        Try
            loading = True

            Me.GrArtikellisteTableAdapter.Fill(Me.DsArtikel.grArtikelliste)
            Me.BuchvorgangTableAdapter.Fill(Me.DsVorgaenge.buchvorgang, kundNr)
            Me.Buchvorgang_artikelTableAdapter.Fill(Me.DsVorgaenge._buchvorgang_artikel, kundNr)

            FillComboBox(Me.StatusComboBox, "select Status from buchVorgaengeStatus Group by Status", "Status")
            FillComboBox(Me.TypComboBox, "select Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")
            FillComboBox(Me.WaehrungComboBox, "select zeichen from grWaehrung Group by zeichen", "zeichen")

            'LadeKundenSpezifischeDaten()
            'CheckAbgeschlossen()
            loading = False

            'Add Handler 
            'Me.DataGridViewTextBoxColumnStk.
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


#Region "New"

    Dim addingnewflag As Boolean = False
    Private Sub bindingnavigatoraddnewitem_click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        Try
            addingnewflag = True
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub bindingsource_currentchanged(ByVal sender As System.Object, _
                              ByVal e As System.EventArgs) _
                              Handles BuchvorgangBindingSource.CurrentChanged
        Try
            If addingnewflag = True Then
                BeginNew(False)
                addingnewflag = False
            End If

            'LadeKundenSpezifischeDaten()
            'CheckAbgeschlossen()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    'setzte die Vorgangnummer für neue 
    Private Sub TypComboBox_Leave(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TypComboBox.Leave
        If String.IsNullOrEmpty(Me.NummerTextBox.Text) Then
            Me.NummerTextBox.Text = IntraSellPreise.getNewVorgangNummer(Me.TypComboBox.SelectedValue, Me.KundNrAdressenControl.IDNR)
            Me.DatumDateTimePicker.Value = DateTime.Now
        End If
    End Sub

    Public Sub BeginNew(Optional ByVal addNew As Boolean = True)
        Try
            'neuen vorgang erstellen
            'If MessageBox.Show("Wollen Sie einen neuen Vorgang erstellen?", "Vorgang erstellen?", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.Yes Then
            'Else
            '    Return
            'End If
            If addNew Then Me.BuchvorgangBindingSource.AddNew()
            VorgangWizzard.ShowDialog()
            'die Werte Übernehmen 
            If VorgangWizzard.DialogResult = DialogResult.OK Then
                'refresh 

                Me.NummerTextBox.Text = VorgangWizzard.NummerTextBox.Text
                Me.TypComboBox.Text = VorgangWizzard.TypComboBox.Text
                Me.TypComboBox.SelectedValue = VorgangWizzard.TypComboBox.SelectedValue
                Me.KundNrAdressenControl.Refresh()
                Me.KundNrAdressenControl.IDNR = VorgangWizzard.KundNrAdressenControl.IDNR
                Me.DatumDateTimePicker.Value = VorgangWizzard.DatumDateTimePicker.Value
                Me.MitarbeiterNrComboBox.IDNR = ModuleGlobals.MitarbeiterID
                'folgende 3 zeilen damit die rows in artikel die parent typ und nummer übernehmen.
                Me.Validate()
                Me.BuchvorgangBindingSource.EndEdit()
                Me.Buchvorgang_artikelBindingSource.EndEdit()

            Else
                'cancel ?
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'Ein Neuer Vorgang vom Typ Starten 
    Public Sub BeginNewVorgang(ByVal VorgangTyp As String, ByVal KundNr As Integer)
        Try
            Me.BuchvorgangBindingSource.AddNew()

            Me.KundNrAdressenControl.IDNR = KundNr
            Me.TypComboBox.SelectedValue = VorgangTyp
            Me.NummerTextBox.Text = IntraSellPreise.getNewVorgangNummer(VorgangTyp, KundNr)
            Me.DatumDateTimePicker.Value = DateTime.Today
            Me.MitarbeiterNrComboBox.IDNR = ModuleGlobals.MitarbeiterID

            'folgende 3 zeilen damit die rows in artikel die parent typ und nummer übernehmen.
            Me.Validate()
            Me.BuchvorgangBindingSource.EndEdit()
            Me.Buchvorgang_artikelBindingSource.EndEdit()


        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#End Region


    Private Sub VorlageeditierenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VorlageeditierenToolStripMenuItem.Click
        Try
            DokumentInWordZeigen(GetAppPath() & DEFAULT_WORD_VORLAGE, False)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub AusdruckenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AusdruckenToolStripMenuItem.Click
        Try
            Print(sender)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Public Sub Print(ByVal sender As Object) Implements InterfacePrintable.Print
        Try
            'Start printing for the Vorgang 
            'OpenAusdruck_inWord(Me.TypComboBox.Text, Me.NummerTextBox.Text)
            OpenAusdruck_inWord_XML(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, DEFAULT_WORD_VORLAGE, ModuleBuchVorgangXML.VIEWER_WORD, False, Nothing)
            Me.AusgedrucktCheckBox.Checked = True
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub CheckAbgeschlossen()
        Try
            'Set true false depending on the abschliessen value 
            Dim enable As Boolean = Not Me.AbgeschlossenCheckBox.Checked

            '       Dim row = Me.BuchvorgangBindingSource.Position

            '        enable = Not Me.DsVorgaenge.Tables("buchVorgang").Rows(row).Item("abgeschlossen")

            Buchvorgang_artikelDataGridView.Enabled = enable
            KundNr2AdressenControl.Enabled = enable
            TabControl1.Enabled = enable
            WaehrungComboBox.Enabled = enable

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    Private Sub AbgeschlossenCheckBox_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AbgeschlossenCheckBox.CheckedChanged
        CheckAbgeschlossen()
    End Sub


    Private Sub StatusComboBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StatusComboBox.DropDown
        FillComboBox(Me.StatusComboBox, "select Status from buchVorgaengeStatus where VorgangTyp = '" & Me.TypComboBox.SelectedValue & "' Group by Status", "Status")
    End Sub

    Private Sub ZahlungsMethodeComboBox_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ZahlungsMethodeComboBox.DropDown
        LadeKundenSpezifischeDaten("ZahlungsMethodeComboBox")
    End Sub

    Private Sub ZahlungsbedingungComboBox_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ZahlungsbedingungComboBox.DropDown
        LadeKundenSpezifischeDaten("ZahlungsbedingungComboBox")
    End Sub

    Private Sub TransportMethodeComboBox_Enter(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TransportMethodeComboBox.DropDown
        LadeKundenSpezifischeDaten("TransportMethodeComboBox")
    End Sub

#Region "Events for the Artikel Grid"


    Private Sub Buchvorgang_artikelDataGridView_CellValueChanged(ByVal sender As System.Object, ByVal e As System.Windows.Forms.DataGridViewCellEventArgs) Handles Buchvorgang_artikelDataGridView.CellValueChanged
        Try


            'writeLog("Buchvorgang_artikelDataGridView_CellValueChanged")
            If loading Then Exit Sub

            loading = True

            setPosIDIfNotSet()
            ' e.RowIndex
            ' e.ColumnIndex
            If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "Stk" Then
                Recalculate()
            End If

            If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "Artikel" Then
                ArtNr_CalculatePreis(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_COMBO_INDEX).Value, _
                                     Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_STK_INDEX).Value, _
                                     Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_BEZEICHNUNG_INDEX), _
                                     Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_NETTO_INDEX), _
                                     Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX), _
                                     Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_MWST_INDEX), _
                                     Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_EKPREIS_INDEX))

                Recalculate()
            End If

            If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "ArtNr" Then
                ArtNr_CalculatePreis(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_INDEX).Value, _
                                      Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_STK_INDEX).Value, _
                                      Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_BEZEICHNUNG_INDEX), _
                                      Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_NETTO_INDEX), _
                Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX), _
                Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_MWST_INDEX), _
                Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_EKPREIS_INDEX))

                Recalculate()
            End If

            If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "Bezeichnung" Then

                bezeichnung_afterupdate(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_BEZEICHNUNG_INDEX), _
                                        Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_COMBO_INDEX), _
                                        Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_INDEX))

                'set Preise neu 
                ArtNr_CalculatePreis(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_INDEX).Value, _
                                      Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_STK_INDEX).Value, _
                                      Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_BEZEICHNUNG_INDEX), _
                                      Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_NETTO_INDEX), _
                Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX), _
                Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_MWST_INDEX), _
                Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_EKPREIS_INDEX))
                Recalculate()

            End If

            If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "Preis_Netto" Then
                Preis_Netto_AfterUpdate(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_INDEX).Value, _
                                            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_NETTO_INDEX), _
                                            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX), _
                                            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_MWST_INDEX))

                Recalculate()
            End If

            If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "Preis_Brutto" Then
                Preis_Brutto_AfterUpdate(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_INDEX).Value, _
                                            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_NETTO_INDEX), _
                                            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX), _
                                            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_MWST_INDEX))

                Recalculate()
            End If

            loading = False


        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    Private Sub setPosIDIfNotSet()
        'set Position 
        Dim rows As Integer = Buchvorgang_artikelDataGridView.RowCount
        If rows > 1 Then
            If IsNull(Buchvorgang_artikelDataGridView.Rows(rows - 2).Cells(COL_ID_INDEX).Value) Then
                Buchvorgang_artikelDataGridView.Rows(rows - 2).Cells(COL_ID_INDEX).Value = (rows - 1)
            End If
        End If
    End Sub


    Private Sub Recalculate()
        Try


            Dim summeNetto As Double = 0.0, summeBrutto As Double = 0.0, MWST As Double = 0.0
            Dim dg As DataGridView = Buchvorgang_artikelDataGridView
            'sum(RoundUp([Stk]*[PreisATS],2)) as Summe, sum(RoundUp([Stk]*[PreisATS_Brutto],2)) as Summe_Brutto

            Dim precision As Int16 = VarValue_Default("PREIS_GENAUIGKEIT", 2)
            With Buchvorgang_artikelDataGridView
                For counter = 1 To (.Rows.Count - 1)
                    'deposit = 0
                    'withdrawal = 0

                    Try
                        Dim stk As Double = 0, netto As Double = 0, brutto As Double = 0
                        stk = Double.Parse(dg.Rows(counter - 1).Cells(COL_STK_INDEX).Value)
                        netto = Double.Parse(dg.Rows(counter - 1).Cells(COL_PREIS_NETTO_INDEX).Value.ToString())
                        brutto = Double.Parse(dg.Rows(counter - 1).Cells(COL_PREIS_BRUTTO_INDEX).Value.ToString())

                        summeNetto += stk * netto
                        summeBrutto += stk * brutto

                    Catch ex As Exception
                        Exit Sub 'on any error 
                    End Try
                Next

            End With

            MWST = summeBrutto - summeNetto

            Me.SummeTextBox.Text = FormatCurrency(summeNetto, precision)
            Me.SummeBruttoTextBox.Text = FormatCurrency(summeBrutto, precision)
            Me.SummeMWSTTextBox.Text = FormatCurrency(MWST, precision)
        Catch ex As Exception
            HandleAppError(ex)
        End Try


    End Sub


#End Region


#Region "Menu"

    Private Sub NeuerVorgangToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NeuerVorgangToolStripMenuItem.Click
        BeginNew()
    End Sub
    Private Sub AbschliessenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AbschliessenToolStripMenuItem.Click
        btnAbschliessen_Click()
    End Sub

    Private Sub StornoToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StornoToolStripMenuItem.Click
        btnStorno_Click()
    End Sub

    Private Sub ExportierenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExportierenToolStripMenuItem.Click
        OpenAusdruck_inWord_XML(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, Nothing, ModuleBuchVorgangXML.VIEWER_XML, False, Nothing)
    End Sub

    Private Sub KonvertierenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KonvertierenToolStripMenuItem.Click
        VorgangKonvertieren.Init(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, Me.KundNrAdressenControl.IDNR)
        VorgangKonvertieren.ShowDialog()
        If VorgangKonvertieren.DialogResult = Windows.Forms.DialogResult.OK Then
            Me.Close()
        End If
        VorgangKonvertieren.Dispose()
    End Sub

    Private Sub VorlagenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles VorlagenToolStripMenuItem.Click

        VorgangDruck.Init(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, Me.KundNrAdressenControl.IDNR)
        VorgangDruck.ShowDialog()
        VorgangDruck.Dispose()
    End Sub


    Private Sub SendeEmailToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SendeEmailToolStripMenuItem.Click
        'Call sendVorgang_Email(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text)
        OpenAusdruck_inWord_XML(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, DEFAULT_WORD_VORLAGE, ModuleBuchVorgangXML.VIEWER_OUTLOOK, False, Nothing)

    End Sub

    Private Sub KassaBuchungToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KassaBuchungToolStripMenuItem.Click
        btnKassa_Click()
    End Sub
#End Region


#Region "buchRechnung old code"

    'Option Compare Database
    'Option Explicit

    '    Const CONST_ARTNR_FREIER_ARTIKEL = 1000

    '    Private Sub Bezahlt_AfterUpdate()
    '        If Me.Bezahlt = True Then
    '            Call btnKassa_Click()
    '        End If
    '    End Sub

    '    'Erstellt eine neue Rechnung mirnur eine Position für die Akontobezahlung
    '    Private Sub btnAkonto_Click()
    '        On Error GoTo err
    '        Dim isP As IntraSell.IntraSellPreise
    '        isP = IntraSellPreise
    '        Dim Typ As String : Typ = Me.txtVorgangType
    '        Dim Nummer As String : Nummer = Me.Nummer
    '        Dim ArtNr As String : ArtNr = CONST_ARTNR_FREIER_ARTIKEL

    '        Dim betragAkonto As String : betragAkonto = InputBox("Geben Sie bitte den Betrag ein:", "Betrag")
    '        If Not IsNumeric(betragAkonto) Then
    '            MsgBox(betragAkonto & " ist keine Zahl!", vbExclamation)
    '            Exit Sub
    '        End If

    '        Dim betragAkontoNetto As String : betragAkontoNetto = RoundUp(betragAkonto / (1 + getMWSTArtikel(ArtNr) / 100), VARVALUE_DEFAULT("PREIS_GENAUIGKEIT", 2) * 1)



    '        Dim newNummer As String
    '        newNummer = isP.convertFromTo("AR", "AR", Me.Nummer & "", Me.KundNr & "")

    '        Dim sql As String
    '        sql = "delete from [buchRech-Artikel] where rechnr = " & newNummer
    '        DoCmd.SetWarnings(False)
    '        DoCmd.RunSQL(sql)

    '        'Akonto position erfasen
    '        betragAkontoNetto = Replace(betragAkontoNetto, ",", ".")
    '        betragAkonto = Replace(betragAkonto, ",", ".")
    '        sql = "insert into [buchRech-Artikel] (rechNr, ArtNr, Bezeichnung, PreisATS, PreisATS_Brutto, Stk) " & _
    '              " values (" & newNummer & ", " & ArtNr & ", ""Akonto für Rechnung " & Nummer & """," & betragAkontoNetto & "," & betragAkonto & ", 1)"
    '        DoCmd.RunSQL(sql)
    '        DoCmd.SetWarnings(True)

    '        setSummeVorgang(Typ, newNummer, "")

    '        Call openVorgangFunctionByNummer(Typ, newNummer)

    '        Exit Sub
    'err:
    '        MsgBox("Ein unerwarteter Fehler ist passiert!" + err.Description, vbCritical)

    '    End Sub

    '    Private Sub btnCalcSheet_Click()

    '        ' If Me.MitarbeiterEK = 0 Or Me.MitarbeiterEK & "" = "" Then
    '        '     MsgBox "Mitarbeiter EK wurde noch  nicht gewählt!"
    '        '     Exit Sub
    '        ' End If


    '        'If Me.MitarbeiterVK = 0 Or Me.MitarbeiterVK & "" = "" Then
    '        '     MsgBox "Mitarbeiter VK wurde noch nicht gewählt!"
    '        '     Exit Sub
    '        ' End If


    '        DoCmd.OpenForm("calcSheet", , , "VorgangTyp='" & Me.txtVorgangType & "' and AuftragNr=" & Me.Nummer)
    '        Forms("calcSheet").AuftragNrSel = Me.Nummer
    '        Forms("calcSheet").Vorgangtyp = Me.txtVorgangType

    '    End Sub

    Private Sub btnKassa_Click()
        Dim tr As MySqlTransaction = Nothing
        Try

            Dim VorgangTyp As String = Me.TypComboBox.SelectedValue
            If VorgangTyp = "AR" And Not Me.BezahltCheckBox.Checked Then
                If MsgBox("Haben Sie den Betrag in der Höhe von " & Me.SummeBruttoTextBox.Text & " eingehoben?", vbYesNo) = vbYes Then
                    tr = CurrentDB.BeginTransaction
                    'Me.Bezahlt = True
                    RunSQL("update " & getVorgangTableForType(VorgangTyp) & " set bezahlt = -1 where Typ='" & VorgangTyp & "' and  Nummer=" & Me.NummerTextBox.Text)
                    'kassabuch
                    Call makeKassaBuchEintrag(Now(), VorgangTyp, VorgangTyp & "-" & Me.NummerTextBox.Text, Me.SummeBruttoTextBox.Text)
                    Me.BezahltCheckBox.Checked = True
                    tr.Commit()
                End If

            Else
                If Not VorgangTyp = "AR" Then
                    MsgBox("Die Funktion ist nur für Rechnungen vorgesehen.", vbInformation)
                End If
            End If

        Catch ex As Exception
            If Not tr Is Nothing Then tr.Rollback()
            HandleAppError(ex)
        End Try
    End Sub

    '    Private Sub btnKonvertieren_Click()
    '        DoCmd.OpenForm("buchVorgaengeKonvertieren")
    '        Forms("buchVorgaengeKonvertieren").txtVorgangTypFrom = Me.txtVorgangType
    '        Forms("buchVorgaengeKonvertieren").txtVorgangNummerFrom = Me.Nummer
    '        Forms("buchVorgaengeKonvertieren").KundNr = Me.KundNr

    '        If Me.txtVorgangType = "AR" Then
    '            Forms("buchVorgaengeKonvertieren").cbVorgangAbschliessen = 0
    '        End If

    '    End Sub

    '    Private Sub btnMore_Click()
    '        If Me.btnMore.Caption = "+" Then
    '            showMore(True)
    '     Me.[Rech-Artikel].Width = 24000
    '            Me.btnMore.Caption = "-"

    '        Else
    '            showMore(False)
    '     Me.[Rech-Artikel].Width = 11640
    '            Me.btnMore.Caption = "+"
    '        End If
    '    End Sub

    '    Private Sub showMore(show As Boolean)
    '            Call showMoreFields(Me.[Rech-Artikel].Form, True)

    '        btnAbschliessen.Visible = show
    '        btnKassa.Visible = show
    '        btnStorno.Visible = show
    '        btnOffeneVorgänge.Visible = show
    '        btnKonvertieren.Visible = show
    '        drucken.Visible = show
    '        btn_BankBeleg.Visible = show
    '        btnToWord.Visible = show
    '        btnVorlagen.Visible = show
    '        btn_Aufklebar.Visible = show
    '        cbDateinameVorlage.Visible = Not show

    '    End Sub

    '    Private Sub btnMoreEigenschaften_Click()
    '        DoCmd.OpenForm("buchVorgaengeEigenschaften", , , "VorgangTyp='" & Me.txtVorgangType & "' and Nummer=" & Me.Nummer)
    '    End Sub



    '    Private Sub btnTransportAuftrag_Click()
    '        'Dim frmName As String: frmName = "transportAuftrag"
    '        'DoCmd.OpenForm frmName, , , "AuftragNr=" & Me.Nummer
    '        'Forms(frmName).AuftragNr = Me.Nummer
    '        openCreateTA(Me.Nummer)
    '    End Sub

    '    Private Sub btnVorlagen_Click()

    '        DoCmd.OpenForm("buchVorgaengeAusdruck")
    '        Forms("buchVorgaengeAusdruck").RecordSource = Me.RecordSource
    '        Forms("buchVorgaengeAusdruck").Vorgangtyp = Me.txtVorgangType
    '        Forms("buchVorgaengeAusdruck").Filter = "Nummer = " & Me.Nummer
    '        Forms("buchVorgaengeAusdruck").FilterOn = True
    '        Forms("buchVorgaengeAusdruck").cbDateiname.Requery()
    '    End Sub

    '    Private Sub cbDateinameVorlage_Click()
    '        'automatisierungsfunction
    '        Call btnVorlagen_Click() 'offnet auswahl form
    '        'simuliert click
    '        Forms("buchVorgaengeAusdruck").cbDateiname = Me.cbDateinameVorlage
    '        'druckt

    '        'Call Forms("buchVorgaengeAusdruck").VorgaengeAusdruck_automateDruck
    '        'If err.Number > 0 Then
    '        '    MsgBox err.Description & " in modul cbDateinameVorlage_DblClick"
    '        '    err.Clear
    '        'End If
    '        'On Error GoTo 0
    '    End Sub


    '    Private Sub cbDateinameVorlage_DblClick(Cancel As Integer)
    '        'this functions is not used , because on click is overriding it
    '        'automatisierungsfunction
    '        Call btnVorlagen_Click() 'offnet auswahl form
    '        'simuliert click
    '        Forms("buchVorgaengeAusdruck").cbDateiname = Me.cbDateinameVorlage
    '        'druckt
    '        On Error Resume Next
    '        Call Forms("buchVorgaengeAusdruck").VorgaengeAusdruck_automateDruck()
    '        If err.Number > 0 Then
    '            MsgBox(err.Description & " in modul cbDateinameVorlage_DblClick")
    '            err.Clear()
    '        End If
    '        On Error GoTo 0

    '    End Sub

    '    Private Sub cbVorgang_Change()


    '        If Me.cbVorgang = "DRUCK" Then  ';Ausdrucken;
    '            Call drucken_Click()
    '        End If

    '        If Me.cbVorgang = "DRUCK_WORD" Then  ';Ausdrucken mit Word;
    '            Call btnToWord_Click()
    '        End If

    '        If Me.cbVorgang = "SERIENDRUCK" Then  ';Ausdrucken mit Word;
    '            DoCmd.OpenForm("buchVorgaengeAusdruckSerie")
    '            Forms("buchVorgaengeAusdruckSerie").Nummer = Me.Nummer
    '            Forms("buchVorgaengeAusdruckSerie").Vorgangtyp = Me.txtVorgangType
    '        End If

    '        If Me.cbVorgang = "VORLAGEN" Then  ';Ausdruck mit Vorlage;
    '            Call btnVorlagen_Click()
    '        End If

    '        If Me.cbVorgang = "DRUCKADRKLEBER" Then  ';Ausdruck Adresskleber;
    '            Call btn_Aufklebar_Click()
    '        End If

    '        If Me.cbVorgang = "DRUCK_ZAHLSCHEIN" Then  ';Ausdruck Zahlschein;
    '            Call btn_BankBeleg_Click()
    '        End If

    '        If Me.cbVorgang = "ABSCH" Then  ';Abschliessen;
    '            Call btnAbschliessen_Click()
    '        End If

    '        If Me.cbVorgang = "VORG" Then  ';offene Vorgänge;
    '            Call btnOffeneVorgänge_Click()
    '        End If

    '        If Me.cbVorgang = "STORNO" Then  ';Sortnieren;
    '            Call btnStorno_Click()
    '            Exit Sub
    '        End If

    '        If Me.cbVorgang = "KASSA" Then  ';Kassa buchen;
    '            Call btnKassa_Click()
    '        End If

    '        If Me.cbVorgang = "KONVERT" Then  ';Konvertieren
    '            Call btnKonvertieren_Click()
    '        End If

    '        If Me.cbVorgang = "SENDMAIL" Then  ';Konvertieren
    '            Call btnSendMail_Click()
    '        End If

    '        If Me.cbVorgang = "GLS" Then  ';Konvertieren
    '            Call transferQuery("_export_GLS_File", varValue("GLS_EXPORT_FILENAME"))
    '        End If




    '    End Sub


    '    Private Sub cbVorgang_Enter()
    '        Me.AllowEdits = True
    '    End Sub

    '    Private Sub Datum_DblClick(Cancel As Integer)
    '        DoCmd.OpenForm("Kalender")
    '        Forms("Kalender").fieldToUpdate = Me.Datum
    '    End Sub

    '    Private Sub Form_Activate()
    '        Call translate(Me.Name)
    '    End Sub

    '    Private Sub btn_Aufklebar_Click()

    '        DoCmd.OpenReport("rpt_Abkleber", acViewPreview, , "IDNR= " & Me.KundNr)
    '    End Sub

    '    Private Sub btn_BankBeleg_Click()
    '        DoCmd.OpenReport("rpt_BankBeleg", acViewPreview, , "Nummer= " & Me.Nummer)
    '    End Sub

    Private Sub btnAbschliessen_Click()
        If VorgangAbschliessen(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text) Then
            'Event einfügen
            Me.AbgeschlossenCheckBox.Checked = True
            EventErstellen("Mitarbeiter " & ModuleGlobals.MitarbeiterID & " hat eine Rechnung für " & summeNetto & " € abgeschloßen.")
        End If
    End Sub


    '    Private Sub btnAbschliessenUndSchliessen_Click()
    '        Call btnAbschliessen_Click()
    '        DoCmd.Close(acForm, Me.Name)
    '    End Sub

    '    Private Sub btnabgeschlossen_Click()
    'Call sendabgeschlossen(Me!abgeschlossen, Me![Rech-Artikel].Form![summeATSPlusMWST], Me.KundNr, Me.Nummer)
    '    End Sub



    '    Private Sub setStatus(IDNR As Integer)

    '        Dim rs As Recordset
    '        rs = CurrentDb.openRecordset("ofAdresse", dbOpenDynaset, dbSeeChanges)

    '        rs.FindFirst("IDNR = " & IDNR)

    '        rs.Edit()
    '        rs!Status = "Kunde"
    '        rs.Update()


    '    End Sub

    '    Private Sub btnChangeZB_Click()
    '        Me.ZahlungsBedingung.RowSource = "Select methode, nr from grZahlungsbedingung"
    '        Me.ZahlungsMethode.RowSource = "Select methode from grZahlungsmethode"
    '        Me.TransportMethode.RowSource = "Select methode from grTransportMethode"
    '        Me.ZahlungsBedingung.Requery()
    '        Me.ZahlungsMethode.Requery()
    '        Me.TransportMethode.Requery()
    '    End Sub

    '    Private Sub btnNeueRechnung_Click()
    '        Call neueRechnung(Me.Caption)
    '        Me.Rech_Artikel.Requery() 'for access 2010
    '        On Error GoTo exit1
    '        DoCmd.GoToRecord(acDataForm, Me.Name, acPrevious)
    '        DoCmd.GoToRecord(acDataForm, Me.Name, acNext)
    'exit1:
    '    End Sub




    '    Private Sub btnOffeneVorgänge_Click()
    '        openVorgänge(Me.KundNr, Me.Nummer, Me.txtVorgangType)
    '        On Error Resume Next
    '        Forms![buchVorgänge]![btnÜnernehmen].Visible = False
    '        Forms![buchVorgänge]![btnAbbrechen].Visible = False
    '        On Error GoTo 0
    '    End Sub

    Private Sub btnStorno_Click()

        If VorgangStorno(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text) Then
            Me.Close()
        End If

    End Sub

    '    Private Sub btnSuchen_Click()
    '        DoCmd.OpenForm("buchRechnungListe")
    '        Forms("buchRechnungListe").RecordSource = Me.RecordSource
    '    End Sub

    '    Private Sub btnVorcherige_Click()
    '        On Error GoTo Err_btnVorcherige_Click

    '        DoCmd.GoToRecord, , acPrevious

    'Exit_btnVorcherige_Click:
    '        Exit Sub

    'Err_btnVorcherige_Click:
    '        'Me.Caption = err.Description
    '        Debug.Print(err.Description)
    '        Resume Exit_btnVorcherige_Click

    '    End Sub



    '    Private Sub drucken_Click()
    '        'save record first
    '        SaveCurrentRecord()
    '        Call OpenAusdruck(Me.txtVorgangType, Me.Nummer, """" & Me.txtVorgangType & """00/000000")
    '        'Me![checkBox_ausgedruckt] = True
    '        DoCmd.SetWarnings(False)
    '        DoCmd.RunSQL("update " & getVorgangTableForType(Me.txtVorgangType) & " set ausgedruckt = -1 where Nummer = " & Me.Nummer)
    '        DoCmd.SetWarnings(True)

    '        'Wenn es eine Rechnung ist dann auch als closed kennzeichnen
    '        'If Me.txtVorgangType = "AR" Then
    '        '   Me.checkbox_abgeschlossen = True
    '        'End If

    '    End Sub

    '    Private Sub Form_Close()
    '        DoCmd.Close(acForm, "buchVorgänge")
    '    End Sub





    '    Private Sub Form_Current()
    '        If Me.KundNr >= 0 Then
    '            If Not needsMWST(Me.KundNr) Then
    '                Me.txtMessages = "Die Rechnung hat keine MWST!"
    '            End If
    '        End If
    '        Call checkForStorno(Me.Form)
    '        Call initDokSys()
    '        'record source
    '        Me.ZahlungsBedingung.RowSource = "SELECT grZahlungsbedingung.Methode,  IdNr FROM [ofAdressen-Zahlungsbedingungen] INNER JOIN grZahlungsbedingung ON [ofAdressen-Zahlungsbedingungen].Bedingung = grZahlungsbedingung.Nr " & _
    '        " GROUP BY grZahlungsbedingung.Methode, [ofAdressen-Zahlungsbedingungen].IdNr HAVING ((([ofAdressen-Zahlungsbedingungen].IdNr)=" & Me.KundNr & "));"
    '        Me.ZahlungsBedingung.Requery()

    '        Me.ZahlungsMethode.RowSource = "SELECT  Methode FROM [ofAdressen-Zahlungsmethoden] GROUP BY  Methode,  IdNr " & _
    '        " HAVING IDNR   = " & Me.KundNr & "  ORDER BY  Methode;"
    '        Me.ZahlungsMethode.Requery()

    '        Me.TransportMethode.RowSource = "SELECT t1.Methode, t1.IdNr FROM [ofAdressen-Transportmethoden] AS t1 GROUP BY t1.Methode, t1.IdNr " & _
    '        " HAVING t1.IDNR  = " & Me.KundNr & " ORDER BY t1.Methode;"
    '        Me.TransportMethode.Requery()

    '        If Me.txtVorgangType = "AR" Then
    '            btnKassa.Visible = True
    '            btnAkonto.Visible = True
    '        Else
    '            btnKassa.Visible = False
    '            btnAkonto.Visible = False
    '        End If

    '    End Sub



    '    Private Sub initDokSys()
    '        On Error GoTo err1
    '        'Dokumente init
    '        Dim f As Form
    '        f = Me.AddIn_DokSys_Sub.Form
    '        Call f.InitForm(getVorgangTableForType(Me.txtVorgangType.Value), Me.Nummer.Value)
    '        Exit Sub

    'err1:
    '        'do nothing
    '    End Sub

    '    Private Sub Form_Open(Cancel As Integer)
    '        Call checkForStorno(Me.Form)
    '        If varValue("STORNO_BUTTON") = "FALSE" Then
    '            btnStorno.Visible = False
    '        End If

    '    End Sub

    '    Private Sub Form_Timer()
    '        'Call checkForStorno(Me.Form)
    '    End Sub



    '    Private Sub KundNr2_Enter()
    '        Me.KundNr2.Requery()
    '    End Sub

    '    Public Sub lblNeuBerechnen_Click()
    '        On Error Resume Next ' dont show data ws changed by another user
    '        setSummeVorgang(Me.txtVorgangType, Me.Nummer, Me.Name)
    '        Me.Requery()
    '        On Error GoTo 0
    '    End Sub

    '    Private Sub nächste_Click()
    '        On Error GoTo Err_btnVorcherige_Click

    '        DoCmd.GoToRecord, , acNext

    'Exit_btnVorcherige_Click:
    '        Exit Sub

    'Err_btnVorcherige_Click:
    '        'Me.Caption = err.Description
    '        Debug.Print(err.Description)
    '        Resume Exit_btnVorcherige_Click
    '    End Sub



    '    Private Sub Notiz_Dirty(Cancel As Integer)
    '        Dim freieZeichen As Integer
    '        freieZeichen = 2000 - Len(Notiz & "")
    '        Me.Caption1.Caption = freieZeichen & " Zeichen frei."
    '    End Sub


    '    Private Sub NotizIntern_Dirty(Cancel As Integer)
    '        Dim freieZeichen As Integer
    '        freieZeichen = 2000 - Len(NotizIntern & "")
    '        Me.Caption1.Caption = freieZeichen & " Zeichen frei."
    '    End Sub

    '    Private Sub Notizextern_Dirty(Cancel As Integer)
    '        Dim freieZeichen As Integer
    '        freieZeichen = 2000 - Len(NotizExtern & "")
    '        Me.Caption1.Caption = freieZeichen & " Zeichen frei."
    '    End Sub


    '    Private Sub Nummer_DblClick(Cancel As Integer)
    '        MsgBox(Nummer)
    '    End Sub
    '    Private Sub openVorg_Click()
    '        On Error GoTo Err_openVorg_Click

    '        Dim stDocName As String
    '        Dim stLinkCriteria As String

    '        stDocName = "buchVorgänge"

    '        stLinkCriteria = "[IDNR]=" & Me![KundNr]
    '        DoCmd.OpenForm(stDocName, , , stLinkCriteria)




    'Exit_openVorg_Click:
    '        Exit Sub

    'Err_openVorg_Click:
    '        MsgBox(err.Description)
    '        Resume Exit_openVorg_Click

    '    End Sub




    '    Private Sub Waehrung_AfterUpdate()
    '        'pruefe ob DS existiert und sonst lege einen an für die EUR Berechnungen
    '        Dim kurs As String : kurs = InputBox("Bitte Wechselkurs zum EUR eingeben:", "Kurs", 1)
    '        Dim sql As String : sql = "select * from buchvorgaengeWaehrung where vorgangTyp = '" + Me.txtVorgangType + "' and Nummer =  " & Me.Nummer
    '        Dim rs As Recordset
    '        rs = CurrentDb.openRecordset(sql)
    '        If rs.EOF Then
    '            sql = "insert into buchvorgaengeWaehrung (VorgangTyp, Nummer, Wechselkurs, Waehrung) " & _
    '                  " values ( '" + Me.txtVorgangType + "'," & Me.Nummer & "," & Replace(kurs, ",", ".") & ", 'EUR')"

    '        Else
    '            sql = "update buchvorgaengeWaehrung set Wechselkurs = " & Replace(kurs, ",", ".") & _
    '                  " where id  = " & rs("ID")
    '        End If
    '        DoCmd.SetWarnings(False)
    '        DoCmd.RunSQL(sql)
    '        DoCmd.SetWarnings(True)

    '    End Sub

    '    Private Sub Woher_DblClick(Cancel As Integer)
    '        On Error Resume Next
    '        If IsNumeric(Right(Left(Me.Woher, 3), 1)) Then
    '            Call openVorgangFunctionByNummer(Left(Me.Woher, 2), Mid(Me.Woher, 3))
    '        Else 'Typ with 3 letters
    '            Call openVorgangFunctionByNummer(Left(Me.Woher, 3), Mid(Me.Woher, 4))
    '        End If
    '        On Error GoTo 0
    '    End Sub

    '    Private Sub Wohin_DblClick(Cancel As Integer)
    '        On Error Resume Next
    '        If IsNumeric(Right(Left(Me.Wohin, 3), 1)) Then
    '            Call openVorgangFunctionByNummer(Left(Me.Wohin, 2), Mid(Me.Wohin, 3))
    '        Else 'Typ with 3 letters
    '            Call openVorgangFunctionByNummer(Left(Me.Wohin, 3), Mid(Me.Wohin, 4))
    '        End If
    '        On Error GoTo 0
    '    End Sub

    '    Private Sub ZahlungsBedingung_Click()
    '        ZahlungsBedingung.Requery()
    '    End Sub
    '    Private Sub btnToWord_Click()
    '        OpenAusdruck_inWord(Me.txtVorgangType, Me.Nummer, """" & Me.txtVorgangType & """00/000000")
    '    End Sub


    '    'VERLADETAG

    '    Private Sub VerladeTag_AfterUpdate()
    '        Call btnVerladeTag_Click()
    '    End Sub

    '    Private Sub VerladeTag_DblClick(Cancel As Integer)
    '        DoCmd.OpenForm("Kalender")
    '        Forms("Kalender").fieldToUpdate = Me.VerladeTag
    '    End Sub

    '    Private Sub btnVerladeTag_Click()
    '        ' Me.VerladeTag = InputBox("Verladetag:")
    '        If (Me.VerladeTag <> "") Then
    '            Call addVorgangEigenschaft(Me.txtVorgangType.Value, Me.Nummer.Value, "Verladetag", Me.VerladeTag)
    '        End If
    '    End Sub





#End Region


#Region "buchRechArtikel old code"




    'Option Compare Database
    'Option Explicit

    '    Const CONST_ARTNR_FREIER_ARTIKEL = 1000

    '    Dim ArtNr_updating As Boolean
    '    Dim Bezeichnung_updating As Boolean
    '    Dim Stk_updating As Boolean
    '    Dim Preis_updating As Boolean
    '    Dim fVerwandteArtikel As Form_buchRechArtikelVerwandte





    '    Private Sub btnArtikelDetail_Click()
    '        If IsNull(Me.ArtNr) Then
    '            Exit Sub
    '        Else
    '            DoCmd.OpenForm("artikelArtikel", , , "ArtNr=" & Me.ArtNr)
    '        End If
    '    End Sub


    '    Private Sub Form_Open(Cancel As Integer)

    '        ArtNr_updating = False
    '        Bezeichnung_updating = False
    '        Stk_updating = False
    '        Preis_updating = False
    '        prepareArtNrAuswahl(Me.cbArtNR)

    '    End Sub


    '    '================================================================================================
    '    'PREIS; STK; ARTNR UPDATE !
    '    '================================================================================================

    '    Private Sub ArtNr_AfterUpdate()
    '        Dim rs As Recordset
    '        Dim rsArt As Recordset
    '        Dim SQLString As String

    '        rs = CurrentDb.openRecordset("buchSeriennummer", dbOpenDynaset, dbSeeChanges)
    '        rsArt = CurrentDb.openRecordset("grArtikel", dbOpenDynaset, dbSeeChanges)

    '        rsArt.FindFirst("ArtNr = " & Me.ArtNr.Value)

    '        If rsArt.nomatch Then
    '            Call Stk_AfterUpdate()
    '            Exit Sub
    '        End If


    '        Call Stk_AfterUpdate()
    '        Call ArtNR_CalculatePreis()

    '        Dim neueBezeichnung As Object : neueBezeichnung = TABLEVALUE("grArtikel", "ArtNR", Me.ArtNr, "Bezeichnung")

    '        If IsNull(Me.Bezeichnung) Or Me.Bezeichnung <> neueBezeichnung Then
    '            If Not Bezeichnung_updating Then
    '                If Not IsNull(neueBezeichnung) Then
    '                    Me.Bezeichnung = neueBezeichnung
    '                End If
    '            End If
    '        End If



    '        If rsArt!Seriennummer Then 'needs serial number
    '            Dim findSerNr
    'findAgain:
    '            findSerNr = InputBox("Serienummer erforderlich:", "Bitte Artikel-Seriennummer eingeben", , 100, 100)
    '            On Error GoTo nomatch
    '            rs.FindFirst("SerienNr = '" & findSerNr & "'")

    '            If rs.nomatch Then
    'nomatch:
    '                MsgBox("Diese Seriennummer ist nicht im Bestand. " & Chr(13) & Chr(10) & _
    '                       "Im Artikelmanager können Sie Seriennummer vergeben.", vbInformation)

    '                ' GoTo findAgain
    '            Else
    '                On Error GoTo 0
    '                rs.Edit()

    '                If parent.txtVorgangType = "AN" Then rs!AngebotsNr = Me.RechNr
    '                If parent.txtVorgangType = "AU" Then rs!AuftragsNr = Me.RechNr
    '                If parent.txtVorgangType = "AR" Then rs!RechnungsNr = Me.RechNr
    '                If parent.txtVorgangType = "RE" Then rs!RetourwarenNr = Me.RechNr
    '                If parent.txtVorgangType = "LI" Then rs!LieferscheinNr = Me.RechNr
    '                If parent.txtVorgangType = "RÜ" Then rs!RüstscheinNr = Me.RechNr

    '                rs!EKPreis = Me.EKPreis
    '                rs!VKPreis = Me.PreisATS
    '                rs.Update()

    '            End If
    '            If Not IsNull(findSerNr) And Not findSerNr = "" Then
    '                Me.ArtikelIdentifikation = findSerNr
    '            End If
    '        End If

    '    End Sub


    '    'update preise
    Private Sub ArtNr_CalculatePreis(ByVal ArtNr As String, ByVal Stk As Double, _
                                     ByVal Bezeichnung As DataGridViewCell, _
                                     ByVal Preis_Netto As DataGridViewCell, _
                                     ByVal Preis_Brutto As DataGridViewCell, _
                                     ByVal MWST As DataGridViewCell, _
                                     ByVal EKPreis As DataGridViewCell)
        Try

            Dim KundNr As String = Me.KundNrAdressenControl.IDNR

            Dim rs As MySqlDataReader = openRecordset("select * from grArtikel where ArtNr= " & ArtNr)

            Dim VKPreis As Double = 0
            If rs.Read Then
                VKPreis = rs("PreisATS")
                If IsDBNull(Bezeichnung.Value) Then
                    Bezeichnung.Value = rs("Bezeichnung")
                End If
            End If

            rs.Close()

            'try to get specialpreis

            Dim specialPreis As Double = getPreis(KundNr, ArtNr, Stk)
            If specialPreis > 0 Then
                VKPreis = specialPreis
            End If

            Dim notDefined As Boolean = False
            If IsNull(Preis_Netto.Value) Then 'Or IsNull(Preis_Netto.Value) Preis_Netto.Value = "0" Or 
                notDefined = True
            ElseIf Preis_Netto.Value = 0 Then
                notDefined = True
            End If

            If notDefined Then
                Preis_Netto.Value = VKPreis
                Preis_Brutto.Value = calculateBruttoPreis(VKPreis, ArtNr, KundNr)
                MWST.Value = Preis_Brutto.Value - Preis_Netto.Value
            End If

            notDefined = False
            If IsNull(EKPreis.Value) Then ' Or IsNull(EKPreis.Value) Or EKPreis.Value = 0
                notDefined = True
            ElseIf EKPreis.Value = 0 Then
                notDefined = True
            End If

            If notDefined Then
                EKPreis.Value = getEKPreis(ArtNr)
            End If

            Exit Sub
        Catch ex As Exception
            MsgBox(Err.Description, vbCritical)
        End Try
    End Sub


    '    Private Sub ArtikelIdentifikation_Exit(Cancel As Integer)

    '        If Me.parent.Name = "buchRechnungBar" Then 'goto new line
    '            DoCmd.GoToRecord, , acNext
    '            DoCmd.GoToControl("Stk")
    '        End If

    '    End Sub

    'Private Sub cbArtNr_AfterUpdate()
    '    ArtNr_updating = True
    '    Me.Zeitpunkt = Now()
    '    Me.ArtNr = Me.cbArtNR
    '    Me!PreisATS = 0 'set to 0 it will be calculated new in ArtNR_CalculatePreis
    '    Call ArtNr_AfterUpdate()
    '    Call Stk_AfterUpdate()
    '    Call ArtNR_CalculatePreis()
    '    ArtNr_updating = False
    '    Call UpdateVorgang()
    'End Sub

    '    Private Sub ArtikelIdentifikation_AfterUpdate()

    '        If Me.ArtikelIdentifikation & "" <> "" Then
    '            If isBarcodeOK(Me.ArtikelIdentifikation, True) Then
    '                Me.cbArtNR = getArtNrFromBC(Me.ArtikelIdentifikation)
    '                Me.LieferantNR = getLieferantNrFromBC(Me.ArtikelIdentifikation)
    '                Call ArtNr_AfterUpdate()
    '            End If
    '        End If

    '    End Sub


    Private Sub bezeichnung_afterupdate(ByVal inBezeichnung As DataGridViewCell,
                                        ByVal outArtNrCombo As DataGridViewCell,
                                        ByVal outArtNr As DataGridViewCell)

        'bezeichnung_updating = True
        'Me.zeitpunkt = now()
        ''try to find art nr

        Dim sql As String, rs As MySqlDataReader
        sql = "select * from grartikel where bezeichnung like '%" & Replace(inBezeichnung.Value, "%'", "''") & "'"
        rs = openRecordset(sql)
        If rs.Read Then
            outArtNrCombo.Value = rs("artnr")
            outArtNr.Value = rs("artnr")
            'Else
            'Me.artnr = const_artnr_freier_artikel
        End If
        rs.Close()


        'Me!preisats = 0 'set to 0 it will be calculated new in artnr_calculatepreis
        'Call artnr_afterupdate()
        'bezeichnung_updating = False
    End Sub


    '    Private Sub Stk_AfterUpdate()
    '        Stk_updating = True
    '        Me.Zeitpunkt = Now()

    '        Dim lagerAmount
    '        Dim formRechnung As Form '_buchRechnung
    '        formRechnung = parent

    '        'added 05.07.2004
    '        If Not IsNull(Me.ArtNr) Then
    '            Call ArtNR_CalculatePreis()
    '        End If

    '        If Not IsNull(formRechnung) Then ' only for rechnungen
    '            lagerAmount = getLagerBestandArtikel(Me.ArtNr)
    '            If lagerAmount > -9999999 And lagerAmount < Stk Then
    '                'MsgBox "Der Lagerbestand wird erschöpft! Derzeit sind nur " & lagerAmount & " Stk. verfühgbar!", vbInformation
    '            End If
    '        End If
    '        Stk_updating = False
    '        If Not IsNull(Me.ArtNr) And Not IsNull(Me.Bezeichnung) And Not IsNull(Me.PreisATS) Then
    '            Call UpdateVorgang()
    '        End If

    '    End Sub

    '    Private Sub btnRabatt_Click()
    '        Dim Rabatt
    '        Rabatt = InputBox("Rabatt in %:", "Rabatt", 0)
    '        If Rabatt <> 0 Then
    '            Me.PreisATS = PreisATS - PreisATS * Rabatt / 100
    '            Call PreisATS_AfterUpdate()
    '        End If
    '    End Sub

    Private Sub Preis_Netto_AfterUpdate(ByVal ArtNr As String, _
                                            ByVal Preis_Netto As DataGridViewCell, _
                                            ByVal Preis_Brutto As DataGridViewCell, _
                                            ByVal MWST As DataGridViewCell)

        'Preis_updating = True
        'Me.Zeitpunkt = Now()
        'Dim EuroKurs : EuroKurs = VarValue("EuroKurs")
        Preis_Netto.Value = RoundUp(Preis_Netto.Value, VarValue_Default("PREIS_GENAUIGKEIT", 2) * 1)
        'Me!PreisEuro = RoundUp(Preis_Netto.Value / EuroKurs, VarValue_Default("PREIS_GENAUIGKEIT", 2) * 1)
        Preis_Brutto.Value = RoundUp(calculateBruttoPreis(Preis_Netto.Value, ArtNr, Me.KundNrAdressenControl.IDNR), _
                                     VarValue_Default("PREIS_GENAUIGKEIT", 2) * 1)
        MWST.Value = Preis_Brutto.Value - Preis_Netto.Value
        'Me.PreisEuro.Requery()
        'Preis_updating = False
        'Call UpdateVorgang()

    End Sub

    Private Sub Preis_Brutto_AfterUpdate(ByVal ArtNr As String, _
                                            ByVal Preis_Netto As DataGridViewCell, _
                                            ByVal Preis_Brutto As DataGridViewCell, _
                                            ByVal MWST As DataGridViewCell)
        MWST.Value = getMWSTArtikel(ArtNr)
        Preis_Brutto.Value = RoundUp(Preis_Brutto.Value, VarValue_Default("PREIS_GENAUIGKEIT", 2) * 1)
        Preis_Netto.Value = RoundUp(Preis_Brutto.Value / (1 + MWST.Value / 100), _
                                    VarValue_Default("PREIS_GENAUIGKEIT", 2) * 1)
        'PreisATS_AfterUpdate()
        'Me.PreisATS.Requery()
    End Sub

    '    '================================================================================================
    '    'END PREIS; STK; ARTNR UPDATE !
    '    '================================================================================================

    '    Private Sub btnArtikelSuche_Click()
    '        DoCmd.OpenForm("buchRech-ArtikelSuche")
    '        Forms("buchRech-ArtikelSuche").callingForm = Me.Form
    '    End Sub

    '    Private Sub btnOpenVerwandteArtikel_Click()
    '        On Error GoTo err
    '        If fVerwandteArtikel Is Nothing Then
    '            fVerwandteArtikel = New Form_buchRechArtikelVerwandte
    '            fVerwandteArtikel.callingForm = Me.Form
    '            fVerwandteArtikel.Visible = True
    '        End If

    '        fVerwandteArtikel.txtSuchbegriff = Me.ArtNr
    '        Call fVerwandteArtikel.setSuchbegriff()
    '        Exit Sub
    'err:
    '        fVerwandteArtikel = Nothing
    '        btnOpenVerwandteArtikel_Click()
    '    End Sub

    '    Public Sub addPosition(newArtNr As Object)
    '        DoCmd.GoToRecord(acDataForm, Me.Name, acNewRec)
    '        Me.ArtNr = newArtNr
    '    End Sub

    '    Private Sub Bezeichnungsfeld68_DblClick(Cancel As Integer)
    '        addPosition(1)
    '    End Sub

    '    Private Sub btnDetail_Click()
    '        DoCmd.OpenForm("buchRech-ArtikelDetail")
    '        Forms("buchRech-ArtikelDetail").RecordSource = Me.RecordSource
    '        Forms("buchRech-ArtikelDetail").Filter = "ID=" & Me.ID
    '        Forms("buchRech-ArtikelDetail").FilterOn = True
    '        Forms("buchRech-ArtikelDetail").Vorgangtyp = "AU"
    '    End Sub


    '    Private Sub cbArtNr_DblClick(Cancel As Integer)
    '        If IsNull(Me.ArtNr) Then
    '            Exit Sub
    '        End If
    '        DoCmd.OpenForm("artikelArtikel", , , "ArtNr=" & Me.ArtNr)
    '    End Sub

    '    Private Sub Form_Activate()
    '        Call translate(Me.Name)
    '    End Sub





    '    Private Sub btnDelete_Click()
    '        On Error GoTo Err_btnDelete_Click


    '        DoCmd.DoMenuItem(acFormBar, acEditMenu, 8, , acMenuVer70)
    '        DoCmd.DoMenuItem(acFormBar, acEditMenu, 6, , acMenuVer70)

    'Exit_btnDelete_Click:
    '        Exit Sub

    'Err_btnDelete_Click:
    '        MsgBox(err.Description)
    '        Resume Exit_btnDelete_Click

    '    End Sub


    '    Sub UpdateVorgang()
    '        If Not Stk_updating And Not ArtNr_updating And Not Bezeichnung_updating And Not Preis_updating Then
    '            'Exit Sub 'disable da ein update im form passiert und immer auf die erste position springt
    '            'set must fields of not yet set
    '            If IsNull(Me.Bezeichnung) Then Me.Bezeichnung = "-"
    '            SaveCurrentRecord()
    '            Call setSummeVorgang(parent.txtVorgangType, parent.Nummer, Me.parent.Caption)
    '        End If
    '    End Sub

#End Region


    Private Sub ArtikelstammToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ArtikelstammToolStripMenuItem.Click
        Try
            Dim _ArtNr = Buchvorgang_artikelBindingSource.Current.row.ArtNr
            Dim k As Artikel = New Artikel
            k.MdiParent = Main
            k.Show()
            k.FilterBy("ArtNr=" & _ArtNr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AddNewButton_Click(sender As System.Object, e As System.EventArgs) Handles AddNewButton.Click
        Try
            'Kundenform öffnenum weitere zu definieren
            Dim k As Kunden = New Kunden
            k.FilterBy("IDNR=" & Me.KundNr)
            k.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub NeuePositionButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NeuePositionButton.Click
        Try
            Me.Buchvorgang_artikelBindingSource.AddNew()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub StkTextBox_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StkTextBox.Validated
        loading = False
        Buchvorgang_artikelDataGridView_CellValueChanged(Nothing, Nothing)
    End Sub
End Class