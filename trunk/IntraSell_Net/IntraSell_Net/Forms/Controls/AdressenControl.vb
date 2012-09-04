Imports IntraSell_DLL
Public Class AdressenControl
    Private _IDNR As Integer

    Public Property IDNR() As Integer
        Get
            Return _IDNR
        End Get
        Set(value As Integer)
            _IDNR = value
            Me.AdressenComboBox.SelectedValue = _IDNR
        End Set
    End Property

    Private Sub AdressenControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.AdressenComboBox, "SELECT IDNR, concat(Firma, ', ', Name, ', ', Vorname) as Adr FROM ofAdressen ORDER BY Firma", "Adr", "IDNR")
        Me.AdressenComboBox.Text = ""
        'If _IDNR > 0 Then
        '    Me.AdressenComboBox.SelectedValue = _IDNR
        'End If
    End Sub

    Private Sub AdressenSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelSelectorButton.Click
        Try
            AdressenSelector.Show()
            AdressenSelector.AdressenComboBox = AdressenComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub AdressenComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles AdressenComboBox.SelectedIndexChanged
        Try
            If VarType(AdressenComboBox.SelectedValue) = VariantType.Integer Then
                IDNR = AdressenComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
