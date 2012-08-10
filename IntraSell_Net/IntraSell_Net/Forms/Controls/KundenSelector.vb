﻿Public Class AdressenSelector

    Public KundenComboBox As ComboBox

    Private Sub PLZSelector_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAdressen.ofAdressenliste' table. You can move, or remove it, as needed.
        Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)
        'TODO: This line of code loads data into the 'DsArtikel.grartikel' table. You can move, or remove it, as needed.
        Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)
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
                OfAdressenlisteBindingSource.Filter = "Firma like '%" + txtSuche.Text + "%' or Name Like '%" + txtSuche.Text + "%' or Name1 Like '%" + txtSuche.Text + "%' or Vorname Like '%" + txtSuche.Text + "%'"
            Else
                OfAdressenlisteBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnUebernehmen_Click(sender As System.Object, e As System.EventArgs) Handles btnUebernehmen.Click
        Try

            If Not KundenComboBox Is Nothing Then
                KundenComboBox.SelectedValue = Me.dgAdressen.SelectedRows(0).Cells(0).Value
            End If

            Me.Close()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class