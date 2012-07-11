Public Class Kundenliste

    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Try
            'TODO: This line of code loads data into the 'DsPLZ.grland' table. You can move, or remove it, as needed.
            Me.GrlandTableAdapter.Fill(Me.DsPLZ.grland)
            'TODO: This line of code loads data into the 'DsAdressen.Preislisten' table. You can move, or remove it, as needed.
            Me.PreislistenTableAdapter.Fill(Me.DsAdressen.Preislisten)
            'TODO: This line of code loads data into the 'DsAdressen.Kundengruppen' table. You can move, or remove it, as needed.
            Me.KundengruppenTableAdapter.Fill(Me.DsAdressen.Kundengruppen)

            Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)

            Me.LandComboBox.Text = ""
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

            If Me.LandComboBox.Text.Length > 0 Then
                filter = "Land Like '" + LandComboBox.Text + "%'"
            End If

            If Me.PLZVonTextBox.Text.Length > 0 Then
                filter = "PLZ >= '" + PLZVonTextBox.Text + "%'"
            End If
            If Me.PLZbisTextBox.Text.Length > 0 Then
                filter = "PLZ <= '" + PLZVonTextBox.Text + "%'"
            End If

            If Me.KundengruppeComboBox.Text.Length > 0 Then
                filter = "Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            End If

            If Me.PreislisteComboBox.Text.Length > 0 Then
                filter = "Preisliste Like '" + PreislisteComboBox.Text + "%'"
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
            Kunden.Show()
            Kunden.FilterBy("IDNR=" & OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
End Class