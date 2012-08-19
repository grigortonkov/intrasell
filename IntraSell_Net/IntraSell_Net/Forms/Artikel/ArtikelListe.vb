Public Class Artikelliste

    Private Sub ArtikelListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsArtikel.grArtikelliste' table. You can move, or remove it, as needed.
        Me.GrArtikellisteTableAdapter.Fill(Me.DsArtikel.grArtikelliste)

        Try
            FillComboBox(Me.ArtKatNrComboBox, "SELECT artkatnr, name from `grArtikel-Kategorien` order by name asc", "Name", "ArtKatNr")

            Me.ArtKatNrComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    'Filtern
    Private Sub FilterButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            Dim filter As String = Nothing


            'filter dataset 
            filter = "1=1 "

            If Me.ArtNrTextBox.Text.Length > 0 And IsNumeric(PreisBisTextBox.Text) Then
                filter += " and ArtNr = " + ArtNrTextBox.Text
            End If

            If Me.BezeichnungTextBox.Text.Length > 0 Then
                filter += " and (EAN Like '" + ArtKatNrComboBox.Text + "%'  or Bezeichnung Like '" + ArtKatNrComboBox.Text + "%' or Bezeichnung1 Like '" + ArtKatNrComboBox.Text + "%' or Beschreibung Like '" + ArtKatNrComboBox.Text + "%') "
            End If

            If Me.ArtKatNrComboBox.Text.Length > 0 Then
                filter += " and ArtKatNR = " + ArtKatNrComboBox.Text + ""
            End If

            If Me.PreisVonTextBox.Text.Length > 0 And IsNumeric(PreisVonTextBox.Text) Then
                filter += " and PreisATS >= " + PreisVonTextBox.Text + ""
            End If

            If Me.PreisBisTextBox.Text.Length > 0 And IsNumeric(PreisBisTextBox.Text) Then
                filter += " and PreisATS <= " + PreisVonTextBox.Text + ""
            End If

            If Me.LagerArtikelCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and LagerArtikel = " + IIf(LagerArtikelCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.SeriennummerCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and Seriennummer = " + IIf(SeriennummerCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.SetArtikelCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and SetArtikel = " + IIf(SetArtikelCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.ProduktAktivCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and ProduktAktiv = " + IIf(ProduktAktivCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.NichtBestellbarCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and NichtBestellbar = " + IIf(NichtBestellbarCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.ProduktAktivOnlineCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and ProduktAktivOnline = " + IIf(ProduktAktivOnlineCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            'If Me.KundengruppeComboBox.Text.Length > 0 Then
            '    filter = "Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            'End If

            'If Me.PreislisteComboBox.Text.Length > 0 Then
            '    filter = "Preisliste Like '" + PreislisteComboBox.Text + "%'"
            'End If

            If Not filter Is Nothing Then
                GrArtikellisteBindingSource.Filter = filter
            Else
                GrArtikellisteBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'KundenDetail öffnen 
    Private Sub OfAdressenlisteDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles OfAdressenlisteDataGridView.RowHeaderMouseDoubleClick
        Try
            Kunden.Show()
            Kunden.FilterBy("IDNR=" & OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
End Class