Public Class Kundenliste

    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Try

            Me.GrlandTableAdapter.Fill(Me.DsPLZ.grland)
            Me.PreislistenTableAdapter.Fill(Me.DsAdressen.Preislisten)
            Me.KundengruppenTableAdapter.Fill(Me.DsAdressen.Kundengruppen)



            Me.LandComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""

            LoadData()
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
    Sub LoadData()
        Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)
    End Sub
    'Filtern
    Private Sub FilterButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            LoadData()

            Dim filter As String = Nothing


            'filter dataset 
            filter = "1=1 "

            If Me.txtFirmaName.Text.Length > 0 Then
                filter += " and ( Firma Like '" + txtFirmaName.Text + "%' or Name Like '" + txtFirmaName.Text + "%' or Vorname Like '" + txtFirmaName.Text + "%')"
            End If

            If Me.LandComboBox.Text.Length > 0 Then
                filter += " and Land Like '" + LandComboBox.Text + "%'"
            End If

            If Me.PLZVonTextBox.Text.Length > 0 Then
                filter += " and PLZ >= '" + PLZVonTextBox.Text + "%'"
            End If
            If Me.PLZBisTextBox.Text.Length > 0 Then
                filter += " and PLZ <= '" + PLZBisTextBox.Text + "%'"
            End If

            If Me.KundengruppeComboBox.Text.Length > 0 Then
                filter += " and Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            End If

            If Me.PreislisteComboBox.Text.Length > 0 Then
                filter += " and Preisliste Like '" + PreislisteComboBox.Text + "%'"
            End If

            If Not filter Is Nothing Then
                OfAdressenlisteBindingSource.Filter = filter
            Else
                OfAdressenlisteBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 
    'KundenDetail öffnen 
    Private Sub OfAdressenlisteDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles OfAdressenlisteDataGridView.RowHeaderMouseDoubleClick
        Try
            Kunden.MdiParent = Me.MdiParent
            Kunden.Show()
            Kunden.FilterBy("IDNR=" & OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
 

#Region "Anrufen"


    Private Sub NeuerAnrufToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles NeuerAnrufToolStripMenuItem.Click
        Try
            If OfAdressenlisteDataGridView.SelectedRows.Count <= 0 Then Exit Sub
            Dim IDNR As Integer = OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value
            Anruf.MdiParent = Me.MdiParent
            Anruf.Show()
            'Anruf.FilterBy("AdrNR=" & )
            Anruf.StarteAnruf(IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AnrufprotokollToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles AnrufprotokollToolStripMenuItem.Click
        Try
            If OfAdressenlisteDataGridView.SelectedRows.Count <= 0 Then Exit Sub
            Dim IDNR As Integer = OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value
            Anrufliste.MdiParent = Me.MdiParent
            Anrufliste.Show()
            Anrufliste.Anrufprotokoll(IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

End Class