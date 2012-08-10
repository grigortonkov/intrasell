Public Class VorgangListe

    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsVorgaenge.buchVorgangListe' table. You can move, or remove it, as needed.
        Me.BuchVorgangListeTableAdapter.Fill(Me.DsVorgaenge.buchVorgangListe)

        Try


            FillComboBox(Me.TypComboBox, "SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ") 
            FillComboBox(Me.StatusComboBox, "SELECT Status from buchVorgaengeStatus Group by Status", "Status")

            FillComboBox(Me.LandComboBox, "SELECT Name from grLand Order by Name", "Name")
            FillComboBox(Me.KundengruppeComboBox, "SELECT Gruppe from `ofAdressen-Kundengruppen` Order by Gruppe", "Gruppe")
            FillComboBox(Me.PreislisteComboBox, "SELECT PreislisteName FROM `grArtikel-VKPreisPerSelection` GROUP BY PreislisteName ORDER BY  PreislisteName;", "PreislisteName")
            'Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)

            Me.LandComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub TypComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles TypComboBox.SelectedIndexChanged
        Try
            If VarType(TypComboBox.SelectedValue) = VariantType.String Then
                FillComboBox(Me.StatusComboBox, "SELECT Status from buchVorgaengeStatus where VorgangTyp='" & TypComboBox.SelectedValue & "' Group by Status", "Status")
            End If
        Catch ex As Exception
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
                BuchVorgangListeBindingSource.Filter = filter
            Else
                BuchVorgangListeBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'KundenDetail öffnen 
    Private Sub OfAdressenlisteDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles VorgangListeDataGridView.RowHeaderMouseDoubleClick
        Try
            Dim fltr As String = "Nummer=" & VorgangListeDataGridView.SelectedRows(0).Cells(0).Value & " and Typ='" & VorgangListeDataGridView.SelectedRows(0).Cells(1).Value & "'"
            Vorgang.Show()
            Vorgang.FilterBy(fltr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub OfAdressenlisteDataGridView_CellContentClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles VorgangListeDataGridView.CellContentClick

    End Sub

End Class