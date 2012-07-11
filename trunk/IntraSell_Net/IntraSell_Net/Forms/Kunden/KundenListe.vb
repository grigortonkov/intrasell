Public Class Kundenliste

    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Try
            Me.OfAdressenlisteTableAdapter.Fill(Me.DsAdressen.ofAdressenliste)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub FilterButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click

    End Sub
End Class