Imports IntraSell_DLL
Public Class AdresseWeitere

    Private Sub Ofadressen_weitereBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Ofadressen_weitereBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.Ofadressen_weitereBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsAdressen)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Sub LoadData(ByVal IDNR As Integer)
        Try
            Me.OfAdressenTableAdapter.FillByIDNR(Me.DsAdressen.ofadressen, IDNR)
            Me.Ofadressen_weitereTableAdapter.FillByIDNR(Me.DsAdressen._ofadressen_weitere, IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Public Sub StarteNeueAdresse(ByVal IDNR As Integer, ByVal VorgangTyp As String)
        Try
            LoadData(IDNR)
            Me.Ofadressen_weitereBindingSource.AddNew()
            Me.Ofadressen_weitereBindingSource.Current.Row.IDNR = IDNR
            Me.Ofadressen_weitereBindingSource.Current.Row.Typ = VorgangTyp
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub AdresseWeitere_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            AdressenDetailControl.Init()
            'folgende DAten sind nicht aktiviert für weitere adressen
            AdressenDetailControl.BriefanredeComboBox.Enabled = False
            AdressenDetailControl.StatusComboBox.Enabled = False
            AdressenDetailControl.GeburtstagDateTimePicker.Enabled = False
            AdressenDetailControl.Tel2TextBox.Enabled = False
            AdressenDetailControl.Fax2TextBox.Enabled = False

            FillComboBox(Me.TypComboBox, "SELECT '' as Typ, '' as Bezeichnung union SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class