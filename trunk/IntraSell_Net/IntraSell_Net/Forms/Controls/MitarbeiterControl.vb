Imports IntraSell_DLL
Public Class MitarbeiterControl
    Public Const SQL = "SELECT IDNR, concat(IFNULL(concat(Name, ' '),''), IFNULL(Vorname,'')) as Namen " &
                       " FROM ofMitarbeiter where name is not null or Vorname is not null ORDER BY Name, Vorname"
    Private _IDNR As Integer

    Public Property IDNR() As Integer
        Get
            Return _IDNR
        End Get
        Set(value As Integer)
            _IDNR = value
            Me.MitarbeiterComboBox.SelectedValue = _IDNR
        End Set
    End Property

    Private Sub MitarbeiterControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.MitarbeiterComboBox, SQL, "Namen", "IDNR")
        Me.MitarbeiterComboBox.Text = ""
    End Sub

    Private Sub MitarbeiterSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles MitarbeiterSelectorButton.Click
        Try
            'AdressenSelector.Show()
            'AdressenSelector.AdressenComboBox = MitarbeiterComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub MitarbeiterComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles MitarbeiterComboBox.SelectedIndexChanged
        Try
            If VarType(MitarbeiterComboBox.SelectedValue) = VariantType.Integer Then
                IDNR = MitarbeiterComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
