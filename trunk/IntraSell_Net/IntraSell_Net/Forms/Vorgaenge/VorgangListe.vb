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

            Me.TypComboBox.Text = ""
            Me.StatusComboBox.Text = ""
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
            Dim filter As String = "1=1"


            'filter dataset 
            If Me.TypComboBox.Text.Length > 0 Then
                filter = filter & " and Typ = '" + TypComboBox.Text + "%'"
            End If

            If Me.NummerTextBox.Text.Length > 0 Then
                filter = filter & " and Nummer Like '" + NummerTextBox.Text + "%'"
            End If

            If Me.StatusComboBox.Text.Length > 0 Then
                filter = filter & " and Status Like '" + StatusComboBox.Text + "%'"
            End If

            If ArtikelControl1.ArtNr > 0 Then
                filter = filter & " and ArtNr Like '" + ArtikelControl1.Text + "%'"
            End If

            If AdressenControl1.IDNR > 0 Then
                filter = filter & " and KundNr = " + CStr(AdressenControl1.IDNR)
            End If

            If Me.LandComboBox.Text.Length > 0 Then
                filter = filter & " and Land Like '" + LandComboBox.Text + "%'"
            End If

            If Me.PLZVonTextBox.Text.Length > 0 Then
                filter = filter & " and PLZ >= '" + PLZVonTextBox.Text + "%'"
            End If
            If Me.PLZBisTextBox.Text.Length > 0 Then
                filter = filter & " and PLZ <= '" + PLZVonTextBox.Text + "%'"
            End If

            If Me.KundengruppeComboBox.Text.Length > 0 Then
                filter = filter & " and Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            End If

            If Me.PreislisteComboBox.Text.Length > 0 Then
                filter = filter & " and Preisliste Like '" + PreislisteComboBox.Text + "%'"
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