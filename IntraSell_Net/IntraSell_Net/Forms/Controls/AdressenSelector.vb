Public Class AdressenSelector

    Public AdressenComboBox As ComboBox

    Private Sub PLZSelector_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try 
            Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub txtSuche_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtSuche.TextChanged
        Try
            'filter dataset 
            If txtSuche.Text.Length > 0 Then
                OfAdressenlisteBindingSource.Filter = "Firma like '%" + txtSuche.Text + "%' or Name Like '%" + txtSuche.Text + "%' or Adresse Like '%" + txtSuche.Text + "%' or Vorname Like '%" + txtSuche.Text + "%'"
            Else
                OfAdressenlisteBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnUebernehmen_Click(sender As System.Object, e As System.EventArgs) Handles btnUebernehmen.Click
        Try

            If Not AdressenComboBox Is Nothing Then
                AdressenComboBox.SelectedValue = Me.dgAdressen.SelectedRows(0).Cells(0).Value
            End If

            Me.Close()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 
    Private Sub btnDetails_Click(sender As System.Object, e As System.EventArgs) Handles btnDetails.Click
        Try
            Dim idnr = Me.dgAdressen.SelectedRows(0).Cells(0).Value
            Dim k As Kunden = New Kunden
            k.MdiParent = CType(Me, Form).MdiParent
            k.Show()
            k.FilterBy("IDNR=" & IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class