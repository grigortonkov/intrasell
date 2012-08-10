Public Class ArtikelControl
    Public ArtNr As Integer

    Private Sub ArtikelControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.ArtikelComboBox, "SELECT ArtNr, concat(EAN, ' - ', Bezeichnung) as Art FROM grArtikel ORDER BY EAN", "Art", "ArtNr")
    End Sub

    Private Sub ArtikelSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelSelectorButton.Click
        Try
            ArtikelSelector.Show()
            ArtikelSelector.ArtikelComboBox = ArtikelComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub ArtikelComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles ArtikelComboBox.SelectedIndexChanged
        Try
            If VarType(ArtikelComboBox.SelectedValue) = VariantType.Integer Then
                ArtNr = ArtikelComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
