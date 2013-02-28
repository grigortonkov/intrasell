Public Class Anrufliste

    Private Sub Anrufliste_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAnrufe.Anrufliste' table. You can move, or remove it, as needed.
        Me.AnruflisteTableAdapter.Fill(Me.DsAnrufe.Anrufliste)
        'TODO: This line of code loads data into the 'DsAnrufe.ofanrufe' table. You can move, or remove it, as needed.
        Me.OfanrufeTableAdapter.Fill(Me.DsAnrufe.ofanrufe)

        Try

            'Me.GrlandTableAdapter.Fill(Me.DsPLZ.grland)
            'Me.PreislistenTableAdapter.Fill(Me.DsAnrufe.Preislisten)
            'Me.KundengruppenTableAdapter.Fill(Me.DsAnrufe.Kundengruppen)



            Me.LandComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""

            'Me.OfAdressenlisteTableAdapter.Fill(Me.DsAnrufe.ofAdressenliste)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    'Filtern
    Private Sub AnrufButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            Dim filter As String = Nothing


            'filter dataset 
            filter = "1=1 "

            If AdressenControl1.IDNR > 0 Then
                filter = filter & " and AdrNr = " + CStr(AdressenControl1.IDNR)
            End If

            If Me.LandComboBox.Text.Length > 0 Then
                filter += " and Land Like '" + LandComboBox.Text + "%'"
            End If

            If Me.PLZVonTextBox.Text.Length > 0 Then
                filter += " and PLZ >= '" + PLZVonTextBox.Text + "%'"
            End If
            If Me.PLZBisTextBox.Text.Length > 0 Then
                filter += " and PLZ <= '" + PLZVonTextBox.Text + "%'"
            End If

            If Me.KundengruppeComboBox.Text.Length > 0 Then
                filter += " and Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            End If

            If Me.PreislisteComboBox.Text.Length > 0 Then
                filter += " and Preisliste Like '" + PreislisteComboBox.Text + "%'"
            End If

            If MitarbeiterControl.IDNR > 0 Then
                filter = filter & " and MitarbeiterNr = " + CStr(MitarbeiterControl.IDNR)
            End If

            If Not filter Is Nothing Then
                AnruflisteBindingSource.Filter = filter 
            Else
                AnruflisteBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 
    'KundenDetail öffnen 
    Private Sub OfAdressenlisteDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles OfAdressenlisteDataGridView.RowHeaderMouseDoubleClick
        Try
            Anruf.MdiParent = Me.MdiParent
            Anruf.Show()
            Anruf.FilterBy("AnrufNR=" & OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub OfAdressenlisteDataGridView_CellContentClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles OfAdressenlisteDataGridView.CellContentClick

    End Sub
End Class