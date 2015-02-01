﻿Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Public Class VorgangBar
    Inherits AbstractForm
    Implements InterfacePrintable


    Private _kundNr As Integer = 0

    Public Property KundNr As Integer
        Get
            Return _kundNr
        End Get
        Set(ByVal value As Integer)
            _kundNr = value
            'Me.AddNewButton.Enabled = KundNr > 0
        End Set
    End Property


    ''' <summary>
    ''' Die Datensätze filtern
    ''' </summary>
    ''' <param name="Expression"></param>
    ''' <remarks></remarks>
    Public Sub FilterBy(ByVal Expression As String)
        Try
            Me.BuchvorgangBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    ''' <summary>
    ''' Save edits
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub BuchvorgangBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Call saveEdits()
    End Sub

    Sub saveEdits()
        Try
            Me.Validate()
            Me.BuchvorgangBindingSource.EndEdit()
            Me.Buchvorgang_artikelBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsVorgaenge)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Public Sub Print(ByVal sender As Object) Implements InterfacePrintable.Print
        Try
            saveEdits()
            'Start printing for the Vorgang 
            'OpenAusdruck_inWord(Me.TypComboBox.Text, Me.NummerTextBox.Text)
            OpenAusdruck_inWord_XML("AR", Me.NummerTextBox.Text, DEFAULT_WORD_VORLAGE_VORGANG, ModuleBuchVorgangXML.VIEWER_WORD, False, Nothing)
            Me.AusgedrucktCheckBox.Checked = True
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    ''' <summary>
    ''' Alte Rechnungen mit dem selben Datum laden
    ''' </summary>
    ''' <remarks></remarks>
    Sub alteBarRechnungenLaden()
        Me.BuchvorgangTableAdapter.Fill(Me.DsVorgaenge.buchvorgang, KundNr)
        Me.Buchvorgang_artikelTableAdapter.Fill(Me.DsVorgaenge._buchvorgang_artikel, KundNr)
    End Sub

    ''' <summary>
    ''' Form Load
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub VorgangBar_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            kundNr = VarValue_Default("RECHNUNG_BAR_KUNDNR", "0")
            Loading = True
            ds = DsVorgaenge
            'Me.KundNrAdressenControl.ShowAddNew = True
            'Me.KundNr2AdressenControl.ShowAddNew = True
            'Me.ArtikelControl1.ShowAddNew = True

            Me.GrArtikellisteTableAdapter.Fill(Me.DsArtikel.grArtikelliste)

            'FillComboBox(Me.StatusComboBox, "select Status from buchVorgaengeStatus Group by Status", "Status")
            FillComboBox(Me.TypComboBox, "select Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")
            FillComboBox(Me.WaehrungComboBox, "select zeichen from grWaehrung Group by zeichen", "zeichen")

            'LadeKundenSpezifischeDaten()
            'CheckAbgeschlossen()
            Loading = False

            setButtons(True, False)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub



    ''' <summary>
    ''' Zweiten ausdruck starten
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnZweiterAusdruck_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnZweiterAusdruck.Click
        'save record first
        Dim filename As String = OpenAusdruck_InWord_Filename_RTF(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, "vorlagen\Vorlage_Rechnung.txt", True)
        printFile(filename)
        Me.AusgedrucktCheckBox.Checked = True
    End Sub

    ''' <summary>
    ''' Vorgang Form schliessen
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnStorno_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnStorno.Click
        If VorgangStorno(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text) Then
            Me.Close()
        End If
    End Sub
 

    Private Sub btnAbschliessen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAbschliessen.Click
        btnAbschliessen_Click()
    End Sub

    Private Sub deleteme_btnAbschliessen_Click()
        If VorgangAbschliessen(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text) Then
            'Event einfügen
            Me.AbgeschlossenCheckBox.Checked = True
            EventErstellen("Mitarbeiter " & ModuleGlobals.MitarbeiterID & " hat eine Rechnung für " & Me.SummeTextBox.Text & " € abgeschloßen.")
        End If
    End Sub

    Private Sub btnAbschliessen_Click()
        Try
            saveEdits()

            'abbuchen vom lager nur wenn noch nicht !
            If IsNull(Me.GegebenBarTextbox.Text) Or Me.GegebenBarTextbox.Text = NOT_AVAILABLE Then
                MsgBox("Gegeben Bar wurde nicht erfasst!")
                Exit Sub
            End If

            If Not Me.AbgeschlossenCheckBox.Checked Then

                If Me.TypComboBox.SelectedValue = VarValue("VORGANG_TYP_FUER_LAGER_ABGANG") Then
                    Call lagerAusgang(Me.NummerTextBox.Text, TypComboBox.SelectedValue, True)
                End If

                'If Me.txtVorgangType = "RE" Or Me.txtVorgangType = "RÜ" Then 'retourwaren oder rüestschein
                '     Call lagerEingang(Me.Nummer, Me.txtVorgangType)
                'End If

                Call drucken_Click()
                Call btnKassa_Click()

                Me.AbgeschlossenCheckBox.Checked = True
                setButtons(True, True)
            Else
                MsgBox("Der Vorgang (Rechnung) wurde bereits abgeschlossen!", vbCritical)
            End If
            Me.btnNeu.Focus()
            'Call neueRechnung(Me.Caption)
            BeginNewVorgang("AR", 0)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub drucken_Click()
        'save record first
        Dim filename As String
        filename = OpenAusdruck_InWord_Filename_RTF(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, "vorlagen\Vorlage_Rechnung.txt", True)
        printFile(filename)
        Me.AusgedrucktCheckBox.Checked = True
    End Sub

    Private Sub btnKassa_Click()
        If Me.TypComboBox.SelectedValue = "AR" Then
            'If MsgBox("Betrag eingehoben?", vbYesNo) = vbYes Then
            'kassabuch eintrag
            Call makeKassaBuchEintrag(Now(), Me.TypComboBox.SelectedValue, Me.TypComboBox.SelectedValue & "-" & Me.NummerTextBox.Text, Me.SummeBruttoTextBox.Text)
            Me.BezahltCheckBox.Checked = True
            'End If
        End If
    End Sub




    Public Sub deleteme_BeginNew(Optional ByVal addNew As Boolean = True)
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
                'Me.TypComboBox.SelectedValue = VorgangWizzard.TypComboBox.SelectedValue
                'Me.KundNrAdressenControl.Refresh()
                'Me.KundNrAdressenControl.IDNR = VorgangWizzard.KundNrAdressenControl.IDNR
                'Me.KundNr = VorgangWizzard.KundNrAdressenControl.IDNR
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

            setButtons(False, False)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnNeu_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNeu.Click
        BeginNewVorgang("AR", 0)
    End Sub

    Private Sub NeuerVorgangToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NeuerVorgangToolStripMenuItem.Click
        BeginNewVorgang("AR", 0)
    End Sub



    Private Sub AusdruckenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AusdruckenToolStripMenuItem.Click

    End Sub

 

#Region "Position Tab"
   
    Private Sub AddNewButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles AddNewButton.Click
        Try
            If IsNull(kundNr) Or Me.kundNr <= 0 Then Exit Sub

            'Kundenform öffnen um weitere zu definieren
            Dim k As Kunden = New Kunden
            k.FilterBy("IDNR=" & Me.kundNr)
            k.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnNeuePosition_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNeuePosition.Click
        Try
            Dim newPosition As DataRowView = Buchvorgang_artikelBindingSource.AddNew()
            'Buchvorgang_artikelBindingSource.Current.row.ID = Me.Buchvorgang_artikelDataGridView.RowCount - 1
            ArtikelControl1.ArtNr = Nothing


            Dim pos As dsVorgaenge._buchvorgang_artikelRow = newPosition.Row
            pos.ID = Me.Buchvorgang_artikelDataGridView.RowCount - 1
            pos.Typ = "AR"
            pos.Nummer = Me.NummerTextBox.Text
            'pos.ArtNr = Me.ArtikelControl1.ArtNr
            'pos.Bezeichnung = Me.ArtikelControl1.ArtNr
            'pos.Preis_Netto = Me.Preis_NettoTextBox.Text
            'pos.Preis_Brutto = Me.Preis_BruttoTextBox.Text
            setButtons(False, False)
            Me.ArtikelControl1.Focus()

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub NeuePositionButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles NeuePositionButton.Click
        Try
            Buchvorgang_artikelBindingSource.AddNew()
            Buchvorgang_artikelBindingSource.Current.row.ID = Me.Buchvorgang_artikelDataGridView.RowCount - 1
            ArtikelControl1.ArtNr = Nothing
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    ''' <summary>
    ''' Artikel Nummer wurde geändert
    ''' </summary>
    ''' <param name="newArtNr"></param>
    ''' <remarks></remarks>
    Private Sub ArtNr_Changed(ByVal newArtNr As Object) Handles ArtikelControl1.ArtNrChanged
        Try
            'neue position starten wenn noch keine angefangen wurde
            If Buchvorgang_artikelBindingSource.Current Is Nothing Then
                NeuePositionButton_Click(Nothing, Nothing)
            End If

            Dim pos As dsVorgaenge._buchvorgang_artikelRow = Buchvorgang_artikelBindingSource.Current.row
            pos.ArtNr = newArtNr
            pos.Stk = 1
            pos.Typ = "AR"
            pos.Nummer = Me.NummerTextBox.Text
            'entferne alte Daten falls vorhanden  (Änderung der Artikel Nummer)
            pos.Bezeichnung = ""
            pos.Preis_Netto = Nothing
            pos.MWST = Nothing
            pos.Preis_Brutto = Nothing

            recalculatePosition()
            Me.StkTextBox.Focus()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub StkTextBox_Validated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StkTextBox.Validated
        If Buchvorgang_artikelBindingSource.Current Is Nothing Then Exit Sub
        Dim pos As dsVorgaenge._buchvorgang_artikelRow = Buchvorgang_artikelBindingSource.Current.row
        If Not pos Is Nothing Then
            pos.Preis_Netto = Nothing
            pos.MWST = Nothing
            pos.Preis_Brutto = Nothing
            recalculatePosition()
        End If
    End Sub

    Private Sub Preis_NettoTextBox_Validated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Preis_NettoTextBox.Validated
        Dim pos As dsVorgaenge._buchvorgang_artikelRow = Buchvorgang_artikelBindingSource.Current.row
        If Not pos Is Nothing Then
            pos.MWST = Nothing
            pos.Preis_Brutto = Nothing
            recalculatePosition()
        End If
    End Sub
 

    'Private Sub Preis_BruttoTextBox_Validated(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Preis_BruttoTextBox.Validated
    '    recalculatePosition()
    'End Sub

    Sub recalculatePosition()
        Try
            ArtNr_CalculatePreis()
            Recalculate()
            Buchvorgang_artikelDataGridView.Refresh()
            Buchvorgang_artikelBindingSource.EndEdit()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Preis_BruttoTextBox_Validated(ByVal newArtNr As String) Handles ArtikelControl1.ArtNrAdded
        Try
            'Reload der Liste mit Artikeln
            Me.GrArtikellisteTableAdapter.Fill(Me.DsArtikel.grArtikelliste)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

    Private Sub Recalculate()
        ModuleBuchVorgangForm.Recalculate(Buchvorgang_artikelDataGridView, _
                            SummeTextBox, _
                            SummeBruttoTextBox, _
                            SummeMWSTTextBox)
    End Sub

    Private Sub ArtNr_CalculatePreis()
        ModuleBuchVorgangForm.ArtNr_CalculatePreis(Buchvorgang_artikelBindingSource, KundNrAdressenControl)
    End Sub


    Sub setButtons(ByVal neu As Boolean, ByVal storno As Boolean)
        Dim vorgang As dsVorgaenge.buchvorgangRow = Nothing
        If Not BuchvorgangBindingSource.Current Is Nothing Then vorgang = BuchvorgangBindingSource.Current.row()
        Me.btnNeu.Enabled = neu
        Me.btnStorno.Enabled = storno
        Me.btnAbschliessen.Enabled = False
        Me.btnZweiterAusdruck.Enabled = Me.AbgeschlossenCheckBox.Checked
        Me.btnNeuePosition.Enabled = Not Me.AbgeschlossenCheckBox.Checked
        Me.PanelPosition.Enabled = Not Me.AbgeschlossenCheckBox.Checked
        Me.GegebenBarTextbox.Enabled = Not Me.AbgeschlossenCheckBox.Checked

        If Not vorgang Is Nothing Then
            If Not (vorgang.IsSummeBruttoNull) Then
                If IsNumeric(Me.GegebenBarTextbox.Text) And IsNumeric(vorgang.SummeBrutto) Then
                    If (Decimal.Parse(Me.GegebenBarTextbox.Text) >= vorgang.SummeBrutto) Then
                        Me.btnAbschliessen.Enabled = True
                    End If
                End If
            End If
        Else 'kein vorgang exisitert
            Me.btnStorno.Enabled = False
            Me.btnAbschliessen.Enabled = False
            Me.btnZweiterAusdruck.Enabled = False
            Me.btnNeuePosition.Enabled = False
            Me.PanelPosition.Enabled = False
            Me.GegebenBarTextbox.Enabled = False
        End If


    End Sub

    Private Sub GegebenBarTextbox_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GegebenBarTextbox.TextChanged
        BuchvorgangBindingSource.EndEdit()
        Dim vorgang As dsVorgaenge.buchvorgangRow = BuchvorgangBindingSource.Current.row
        If Not (vorgang.IsSummeBruttoNull) Then
            If IsNumeric(Me.GegebenBarTextbox.Text) And IsNumeric(vorgang.SummeBrutto) Then
                RestgeldTextbox.Text = FormatCurrency(Decimal.Parse(Me.GegebenBarTextbox.Text) - vorgang.SummeBrutto, 2)
            End If
        End If
        setButtons(False, False)
    End Sub
End Class