Public Class KundenGruppe
    Inherits AbstractForm

    Private Sub Ofadressen_kundengruppenBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try

            Me.Validate()
            Me.Ofadressen_kundengruppenBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsAdressen)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub KundenGruppe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.ParentBindingNavigator.BindingSource = Ofadressen_kundengruppenBindingSource
            ds = DsAdressen
            Me.Ofadressen_kundengruppenTableAdapter.Fill(Me.DsAdressen._ofadressen_kundengruppen)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class