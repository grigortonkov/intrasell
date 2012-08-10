Public Class AdressenControl
    Public IDNR As Integer

    Private Sub ArtikelControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.AdressenComboBox, "SELECT IDNR, concat(Firma, ', ', Name, ', ', Vorname) as Adr FROM ofAdressen ORDER BY Firma", "Adr", "IDNR")
        Me.AdressenComboBox.Text = ""
    End Sub

    Private Sub ArtikelSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelSelectorButton.Click
        Try
            AdressenSelector.Show()
            AdressenSelector.AdressenComboBox = AdressenComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub ArtikelComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles AdressenComboBox.SelectedIndexChanged
        Try
            If VarType(AdressenComboBox.SelectedValue) = VariantType.Integer Then
                IDNR = AdressenComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
