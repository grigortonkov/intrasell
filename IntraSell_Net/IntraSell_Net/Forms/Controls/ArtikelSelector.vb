Public Class ArtikelSelector
    Public txtEAN As TextBox
    Public txtBezeichnung As TextBox
    Public txtArtNr As TextBox
    Public ArtikelComboBox As ComboBox

    Private Sub PLZSelector_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsArtikel.grartikel' table. You can move, or remove it, as needed.
        Me.GrartikelTableAdapter.Fill(Me.DsArtikel.grartikel)
        Try
            Me.GrartikelTableAdapter.Fill(Me.DsArtikel.grartikel)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub txtSuche_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtSuche.TextChanged
        Try
            'filter dataset 
            If txtSuche.Text.Length > 0 Then
                GrartikelBindingSource.Filter = "EAN like '%" + txtSuche.Text + "%' or Bezeichnung Like '%" + txtSuche.Text + "%'"
            Else
                GrartikelBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnUebernehmen_Click(sender As System.Object, e As System.EventArgs) Handles btnUebernehmen.Click
        Try

            If Not txtArtNr Is Nothing Then
                txtArtNr.Text = Me.dgArtikel.SelectedRows(0).Cells(0).Value
            End If

            If Not txtEAN Is Nothing Then
                txtEAN.Text = Me.dgArtikel.SelectedRows(0).Cells(1).Value
            End If

            If Not txtBezeichnung Is Nothing Then
                txtBezeichnung.Text = Me.dgArtikel.SelectedRows(0).Cells(2).Value
            End If

            If Not ArtikelComboBox Is Nothing Then
                ArtikelComboBox.SelectedValue = Me.dgArtikel.SelectedRows(0).Cells(0).Value
            End If

            Me.Close()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnDetails_Click(sender As System.Object, e As System.EventArgs) Handles btnDetails.Click
        Try
            Dim idnr = Me.dgArtikel.SelectedRows(0).Cells(0).Value
            Dim k As Artikel = New Artikel
            k.MdiParent = CType(Me, Form).MdiParent
            k.Show()
            k.FilterBy("ArtNr=" & idnr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class