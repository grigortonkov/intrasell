Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Public Class VorgangBar
    Inherits AbstractForm
    Implements InterfacePrintable

    Const BARGELD_GEGEBEN = "Bargeld_gegeben"
    Const BARGELD_RESTO = "Bargeld_resto"
    Const GUTSCHRIFT_BETRAG_EIGENSCHAFT = "Gutschrift_Betrag"


    Private _kundNr As Integer = Nothing

    Public Property KundNr As Integer
        Get
            Return _kundNr
        End Get
        Set(ByVal value As Integer)
            _kundNr = value
            'Me.AddNewButton.Enabled = KundNr > 0
        End Set
    End Property

    Private Function getVorgang() As dsVorgaenge.buchvorgangRow
        Dim vorgang As dsVorgaenge.buchvorgangRow = Nothing
        If Not BuchvorgangBindingSource.Current Is Nothing Then vorgang = BuchvorgangBindingSource.Current.row()
        Return vorgang
    End Function


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
            OpenAusdruck_inWord_XML("AR", getVorgang().Nummer, DEFAULT_WORD_VORLAGE_VORGANG, ModuleBuchVorgangXML.VIEWER_WORD, False, Nothing)
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
        Me.BuchvorgangTableAdapter.FillByKundNrDatum(Me.DsVorgaenge.buchvorgang, KundNr, Date.Today)
        Me.Buchvorgang_artikelTableAdapter.FillByKundNrDatum(Me.DsVorgaenge._buchvorgang_artikel, KundNr, Date.Today)
    End Sub

    ''' <summary>
    ''' Form Load
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub VorgangBar_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            KundNr = VarValue_Default("RECHNUNG_BAR_KUNDNR", firstRow("select min(idnr) from ofAdressen"))
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

    'Ein Neuer Vorgang vom Typ Starten 
    Public Sub BeginNewVorgang(ByVal VorgangTyp As String, ByVal KundNr As Integer)
        Try
            Me.GegebenBarTextbox.Text = "" 'clear last input
            Me.RestgeldTextbox.Text = "" 'clear last input

            Dim newRow As DataRowView = Me.BuchvorgangBindingSource.AddNew()
            Dim vorgangRow As dsVorgaenge.buchvorgangRow = newRow.Row
            vorgangRow.KundNr = KundNr
            vorgangRow.Typ = VorgangTyp
            vorgangRow.Nummer = IntraSellPreise.getNewVorgangNummer(VorgangTyp, KundNr)
            vorgangRow.Datum = DateTime.Today
            vorgangRow.MitarbeiterNr = ModuleGlobals.MitarbeiterID

            Me.KundNrAdressenControl.IDNR = KundNr
            Me.MitarbeiterNrComboBox.IDNR = ModuleGlobals.MitarbeiterID
            Me.NummerTextBox.Text = vorgangRow.Nummer
            Me.TypComboBox.SelectedValue = VorgangTyp
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
        BeginNewVorgang("AR", KundNr)
    End Sub

    Private Sub NeuerVorgangToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NeuerVorgangToolStripMenuItem.Click
        BeginNewVorgang("AR", KundNr)
    End Sub

    ''' <summary>
    ''' Zweiten ausdruck starten
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnZweiterAusdruck_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnZweiterAusdruck.Click
        'save record first
        Dim filename As String = OpenAusdruck_InWord_Filename_RTF(getVorgang().Typ, getVorgang().Nummer, "vorlagen\Vorlage_Rechnung.txt", True)
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
        If VorgangStorno(getVorgang().Typ, getVorgang().Nummer) Then
            Me.Close()
        End If
    End Sub
 
 

    ''' <summary>
    ''' Vorgang abschliessen
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub btnAbschliessen_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnAbschliessen.Click
        Try
            saveEdits()

            'abbuchen vom lager nur wenn noch nicht !
            If IsNull(Me.GegebenBarTextbox.Text) Or Me.GegebenBarTextbox.Text = NOT_AVAILABLE Then
                MsgBox("Gegeben Bar wurde nicht erfasst!")
                Exit Sub
            End If

            If Not Me.AbgeschlossenCheckBox.Checked Then
                Dim transaction As MySqlTransaction = CurrentDB.BeginTransaction()
                Try
                    If getVorgang().Typ = VarValue("VORGANG_TYP_FUER_LAGER_ABGANG") Then
                        Call lagerAusgang(getVorgang().Nummer, getVorgang().Typ, True)
                    End If

                    'If Me.txtVorgangType = "RE" Or Me.txtVorgangType = "RÜ" Then 'retourwaren oder rüestschein
                    '     Call lagerEingang(Me.Nummer, Me.txtVorgangType)
                    'End If

                    Call drucken_Click()
                    Call btnKassa_Click()


                    transaction.Commit()

                Catch ex As Exception
                    HandleAppError(ex)
                    transaction.Rollback()
                    Exit Sub
                End Try

                Me.AbgeschlossenCheckBox.Checked = True
                setButtons(True, True)
            Else
                MsgBox("Der Vorgang (Rechnung) wurde bereits abgeschlossen!", vbCritical)
            End If
            Me.btnNeu.Focus()
            'Call neueRechnung(Me.Caption)
            BeginNewVorgang("AR", KundNr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub drucken_Click()
        'save record first
        Dim filename As String
        filename = OpenAusdruck_InWord_Filename_RTF(getVorgang().Typ, getVorgang().Nummer, "vorlagen\Vorlage_Rechnung.txt", True)
        printFile(filename)
        RunSQL("update " & getVorgangTableForType(getVorgang().Typ) & " set ausgedruckt = -1 where Typ='" & getVorgang().Typ & "' and Nummer = " & getVorgang().Nummer)
        Me.AusgedrucktCheckBox.Checked = True
    End Sub

    Private Sub btnKassa_Click()
        If getVorgang().Typ = "AR" Then
            'If MsgBox("Betrag eingehoben?", vbYesNo) = vbYes Then
            'kassabuch eintrag
            Call makeKassaBuchEintrag(Now(), getVorgang().Typ, getVorgang().Typ & "-" & getVorgang().Nummer, getVorgang().SummeBrutto)
            RunSQL("update " & getVorgangTableForType(getVorgang().Typ) & " set bezahlt = -1 where Typ='" & getVorgang().Typ & "' and Nummer = " & getVorgang().Nummer)
            Me.BezahltCheckBox.Checked = True
            'End If
        End If
    End Sub

   

#Region "Menu"

    Private Sub AusdruckenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AusdruckenToolStripMenuItem.Click

    End Sub

#End Region

#Region "Position Tab"

    Private Sub AddNewButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) 'Handles AddNewButton.Click
        Try
            If IsNull(KundNr) Or Me.KundNr <= 0 Then Exit Sub

            'Kundenform öffnen um weitere zu definieren
            Dim k As Kunden = New Kunden
            k.FilterBy("IDNR=" & Me.KundNr)
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
            pos.Nummer = getVorgang().Nummer
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
            pos.Nummer = getVorgang().Nummer
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
        If Buchvorgang_artikelBindingSource.Current Is Nothing Then Exit Sub
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
                            getVorgang())
    End Sub

    Private Sub ArtNr_CalculatePreis()
        ModuleBuchVorgangForm.ArtNr_CalculatePreis(Buchvorgang_artikelBindingSource, KundNrAdressenControl)
    End Sub



    ''' <summary>
    ''' Buttons aktivieren / deaktivieren je nach Rechnungsstatus
    ''' </summary>
    ''' <param name="neu">Button Neu aktivieren oder nicht</param>
    ''' <param name="storno">Button Storno aktivieren oder nicht</param>
    ''' <remarks></remarks>
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

    ''' <summary>
    ''' Event abfangen und prüfen ob dieEingabe mehr als die Rechnungssumme ist
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub GegebenBarTextbox_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GegebenBarTextbox.TextChanged
        If BuchvorgangBindingSource.Current Is Nothing Then Exit Sub
        BuchvorgangBindingSource.EndEdit()
        Dim vorgang As dsVorgaenge.buchvorgangRow = BuchvorgangBindingSource.Current.row
        If Not (vorgang.IsSummeBruttoNull) Then
            If IsNumeric(Me.GegebenBarTextbox.Text) And IsNumeric(vorgang.SummeBrutto) Then
                RestgeldTextbox.Text = FormatCurrency(Decimal.Parse(Me.GegebenBarTextbox.Text) - vorgang.SummeBrutto, 2)
            End If
        End If
        setButtons(False, False)
    End Sub

    ''' <summary>
    ''' kopiert von msaccess intrasell
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub GegebenBar_AfterUpdate() Handles GegebenBarTextbox.Validated
        Dim vorgang As dsVorgaenge.buchvorgangRow = getVorgang()
        If Not IsNumeric(Me.GegebenBarTextbox.Text) Then Exit Sub
        Dim gegebenBar = Decimal.Parse(Me.GegebenBarTextbox.Text)
        Dim summeATSPlusMWST As Decimal = vorgang.SummeBrutto
        Dim Restgeld As Decimal

        If gegebenBar >= summeATSPlusMWST Then
            'Me.Restgeld = RoundUp(Me.GegebenBar - summeATSPlusMWST, 2)' bereits getan
            setVorgangEigenschaft(BARGELD_GEGEBEN, FormatNumber(gegebenBar, 2))
            setVorgangEigenschaft(BARGELD_RESTO, FormatNumber(RestgeldTextbox.Text, 2) & "")
        Else
            Restgeld = RoundUp(gegebenBar - summeATSPlusMWST, 2)
            MsgBox("Der Betrag muss mehr als die Rechnungssumme sein! Es felt: " & Math.Abs(Restgeld))
        End If

    End Sub


    Private Sub setVorgangEigenschaft(ByVal Name As String, ByVal Value As String)
        'Nach Eingabe in den Eigenschaften speichern
        Dim sql As String = "INSERT INTO buchVorgaengeEigenschaften ( VorgangTyp, Nummer, Name, [Value] )" & _
              " VALUES( '" & getVorgang().Typ & "', " & getVorgang().Nummer & ", '" & Name & "', '" & Value & "') "
        Call RunSQL(sql)
    End Sub

    Private Function getVorgangEigenschaft(ByVal Name As String)
        'Nach Eingabe in den Eigenschaften speichern
        Dim sql As String = "select [Value] from buchVorgaengeEigenschaften " & _
              " WHERE VorgangTyp =  '" & getVorgang().Typ & "' and Nummer =  " & getVorgang().Nummer & " and Name =  '" & Name & "'"
        Return firstRow(sql)
    End Function


End Class