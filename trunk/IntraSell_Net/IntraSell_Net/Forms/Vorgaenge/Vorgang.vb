﻿Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Public Class Vorgang
    Implements InterfacePrintable

    Dim loading As Boolean = True

    Const COL_STK_INDEX As Integer = 3
    Const COL_ARTNR_INDEX As Integer = 4
    Const COL_BEZEICHNUNG_INDEX As Integer = 5
    Const COL_PREIS_NETTO_INDEX As Integer = 6
    Const COL_PREIS_BRUTTO_INDEX As Integer = 7
    Const COL_MWST_INDEX As Integer = 8
    Const COL_EKPREIS_INDEX As Integer = 9

    Public Property summeNetto As Integer
        Get
            Return Me.SummeTextBox.Text
        End Get
        Set(value As Integer)
            Me.SummeTextBox.Text = value
        End Set
    End Property

    Public Property MWST As Integer
        Get
            Return Me.SummeMWSTTextBox.Text
        End Get
        Set(value As Integer)
            Me.SummeMWSTTextBox.Text = value
        End Set
    End Property

    Public Property summeBrutto As Integer
        Get
            Return Me.SummeBruttoTextBox.Text
        End Get
        Set(value As Integer)
            Me.SummeBruttoTextBox.Text = value
        End Set
    End Property
    '


    'Die Datensätze filtern
    Public Sub FilterBy(Expression As String)
        Try
            Me.BuchvorgangBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub BuchvorgangBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BuchvorgangBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.BuchvorgangBindingSource.EndEdit()
            Me.Buchvorgang_artikelBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsVorgaenge)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub Rechnung_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            loading = True

            Me.BuchvorgangTableAdapter.Fill(Me.DsVorgaenge.buchvorgang)
            Me.Buchvorgang_artikelTableAdapter.Fill(Me.DsVorgaenge._buchvorgang_artikel)

            FillComboBox(Me.StatusComboBox, "select Status from buchVorgaengeStatus Group by Status", "Status")
            FillComboBox(Me.TypComboBox, "SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")
            FillComboBox(Me.WaehrungComboBox, "select zeichen from grWaehrung Group by zeichen", "zeichen")

            FillComboBox(Me.ZahlungsMethodeComboBox, "SELECT Methode FROM `ofAdressen-Zahlungsmethoden` WHERE IdNr in (select idnr from buchVorgang where nummer = " & Me.NummerTextBox.Text & ") ORDER BY Methode", "Methode")
            FillComboBox(Me.ZahlungsbedungungComboBox, "SELECT Methode FROM `ofAdressen-Zahlungsbedingungen` INNER JOIN grZahlungsbedingung ON  Bedingung = Nr " & _
                  " WHERE IdNr in (select idnr from buchVorgang where nummer = " & Me.NummerTextBox.Text & ") GROUP BY Methode", "Methode")
            FillComboBox(Me.TransportMethodeComboBox, "SELECT Methode FROM `ofAdressen-Transportmethoden` WHERE IdNr in (select idnr from buchVorgang where nummer = " & Me.NummerTextBox.Text & ") ORDER BY Methode", "Methode")

            loading = False
            'Add Handler 
            'Me.DataGridViewTextBoxColumnStk.
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub



    Private Sub BindingNavigatorAddNewItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        'neuen vorgang erstellen
        If MessageBox.Show("Wollen Sie einen neuen Vorgang erstellen?", "Vorgang erstellen", MessageBoxButtons.YesNo) = Windows.Forms.DialogResult.Yes Then
            'Nummer und Datum setzen 

        End If

    End Sub

    Private Sub AusgedrucktCheckBox_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles AusgedrucktCheckBox.CheckedChanged

    End Sub

    Public Sub Print(sender As Object) Implements InterfacePrintable.Print
        'Start printing for the Vorgang 
        OpenAusdruck_inWord(Me.TypComboBox.Text, Me.NummerTextBox.Text)
    End Sub

#Region "Events for the Artikel Grid"


    Private Sub Buchvorgang_artikelDataGridView_CellValueChanged(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles Buchvorgang_artikelDataGridView.CellValueChanged
        writeLog("Buchvorgang_artikelDataGridView_CellValueChanged")
        If loading Then Exit Sub

        loading = True
        ' e.RowIndex
        ' e.ColumnIndex
        If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "Stk" Then
            Recalculate()
        End If

        If Buchvorgang_artikelDataGridView.Columns(e.ColumnIndex).HeaderText = "ArtNr" Then
            ArtNr_CalculatePreis(Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_ARTNR_INDEX).Value, _
                                  Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_STK_INDEX).Value, _
                                  Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_NETTO_INDEX), _
            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX), _
            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_EKPREIS_INDEX))

            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_MWST_INDEX).Value = "10000"
            Buchvorgang_artikelDataGridView.Rows(e.RowIndex).Cells(COL_PREIS_BRUTTO_INDEX).Value = "10000"

            Recalculate()
        End If
        loading = False

    End Sub

    Private Sub Buchvorgang_artikelBindingSource_CurrentChanged(sender As System.Object, e As System.EventArgs) Handles Buchvorgang_artikelBindingSource.CurrentChanged
        writeLog("Buchvorgang_artikelBindingSource_CurrentChanged")
    End Sub

#End Region

    Private Sub Recalculate()
        With Buchvorgang_artikelDataGridView
            For counter = 1 To (.Rows.Count - 1)
                'deposit = 0
                'withdrawal = 0
                'balance = Integer.Parse(DataGridView1.Rows(counter - 1) _
                '    .Cells("Balance").Value.ToString())

                'If Not DataGridView1.Rows(counter) _
                '    .Cells("Deposits").Value Is Nothing Then

                '    ' Verify that the cell value is not an empty string. 
                '    If Not DataGridView1.Rows(counter) _
                '        .Cells("Deposits").Value.ToString().Length = 0 Then
                '        deposit = Integer.Parse(DataGridView1.Rows(counter) _
                '            .Cells("Deposits").Value.ToString())
                '    End If
                'End If

                'If Not DataGridView1.Rows(counter) _
                '    .Cells("Withdrawals").Value Is Nothing Then
                '    If Not DataGridView1.Rows(counter) _
                '        .Cells("Withdrawals").Value.ToString().Length = 0 Then
                '        withdrawal = Integer.Parse(DataGridView1.Rows(counter) _
                '            .Cells("Withdrawals").Value.ToString())
                '    End If
                'End If

                'DataGridView1.Rows(counter).Cells("Balance").Value = _
                '    (balance + deposit + withdrawal).ToString()
            Next
        End With
    End Sub




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
    Private Sub ArtNr_CalculatePreis(ArtNr As String, Stk As Double, _
                                     Preis_Netto As DataGridViewCell, Preis_Brutto As DataGridViewCell, EKPreis As DataGridViewCell)
        Try

            Dim KundNr As String = Me.KundNrAdressenControl.IDNR

            Dim rs As MySqlDataReader = openRecordset("select * from grArtikel where  ArtNr= " & ArtNr)

            Dim VKPreis As Double = 0
            If rs.Read Then VKPreis = rs("PreisATS")
            rs.Close()

            'try to get specialpreis

            Dim specialPreis As Double = getPreis(KundNr, ArtNr, Stk)
            If specialPreis >= 0 Then
                VKPreis = specialPreis
            End If

            If IsDBNull(Preis_Netto.Value) Then 'Or IsNull(Preis_Netto.Value) Preis_Netto.Value = "0" Or 
                Preis_Netto.Value = VKPreis
                Preis_Brutto.Value = calculateBruttoPreis(VKPreis, ArtNr, KundNr)
            End If

            If IsDBNull(EKPreis.Value) Then ' Or IsNull(EKPreis.Value) Or EKPreis.Value = 0
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

    '    Private Sub cbArtNr_AfterUpdate()
    '        ArtNr_updating = True
    '        Me.Zeitpunkt = Now()
    '        Me.ArtNr = Me.cbArtNR
    '        Me!PreisATS = 0 'set to 0 it will be calculated new in ArtNR_CalculatePreis
    '        Call ArtNr_AfterUpdate()
    '        Call Stk_AfterUpdate()
    '        Call ArtNR_CalculatePreis()
    '        ArtNr_updating = False
    '        Call UpdateVorgang()
    '    End Sub

    '    Private Sub ArtikelIdentifikation_AfterUpdate()

    '        If Me.ArtikelIdentifikation & "" <> "" Then
    '            If isBarcodeOK(Me.ArtikelIdentifikation, True) Then
    '                Me.cbArtNR = getArtNrFromBC(Me.ArtikelIdentifikation)
    '                Me.LieferantNR = getLieferantNrFromBC(Me.ArtikelIdentifikation)
    '                Call ArtNr_AfterUpdate()
    '            End If
    '        End If

    '    End Sub


    '    Private Sub Bezeichnung_AfterUpdate()

    '        Bezeichnung_updating = True
    '        Me.Zeitpunkt = Now()
    '        'Try to find art nr

    '        Dim sql, rs
    '        sql = "select * from grArtikel where Bezeichnung = '" & Replace(Me.Bezeichnung.Value, "'", "''") & "'"
    '        rs = CurrentDb.openRecordset(sql)
    '        If Not rs.EOF Then
    '            Me.ArtNr = rs("ArtNR")
    '            Me.cbArtNR = rs("ArtNR")
    '        Else
    '            Me.ArtNr = CONST_ARTNR_FREIER_ARTIKEL
    '        End If



    '        Me!PreisATS = 0 'set to 0 it will be calculated new in ArtNR_CalculatePreis
    '        Call ArtNr_AfterUpdate()
    '        Bezeichnung_updating = False
    '    End Sub


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

    '    Private Sub PreisATS_Brutto_AfterUpdate()
    '        PreisATS_Brutto = RoundUp(PreisATS_Brutto, VARVALUE_DEFAULT("PREIS_GENAUIGKEIT", 2) * 1)
    '        PreisATS = RoundUp(PreisATS_Brutto / (1 + getMWSTArtikel(ArtNr) / 100), VARVALUE_DEFAULT("PREIS_GENAUIGKEIT", 2) * 1)
    '        PreisATS_AfterUpdate()
    '        Me.PreisATS.Requery()
    '    End Sub

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


    '    Private Sub PreisATS_AfterUpdate()

    '        Preis_updating = True
    '        Me.Zeitpunkt = Now()
    '        Dim EuroKurs : EuroKurs = varValue("EuroKurs")
    '        Me!PreisATS = RoundUp(Me!PreisATS, VARVALUE_DEFAULT("PREIS_GENAUIGKEIT", 2) * 1)
    '        Me!PreisEuro = RoundUp(Me!PreisATS / EuroKurs, VARVALUE_DEFAULT("PREIS_GENAUIGKEIT", 2) * 1)
    '        Me!PreisATS_Brutto = RoundUp(calculateBruttoPreis(Me.PreisATS, ArtNr, Me.parent.[KundNr]), VARVALUE_DEFAULT("PREIS_GENAUIGKEIT", 2) * 1)
    '        Me.PreisEuro.Requery()
    '        Preis_updating = False
    '        Call UpdateVorgang()

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





End Class