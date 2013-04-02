Public Class Mitarbeiter
    Inherits AbstractForm


    Private Sub OfmitarbeiterBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.OfmitarbeiterBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsMitarbeiter)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Mitarbeiter_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.OfmitarbeiterTableAdapter.Fill(Me.DsMitarbeiter.ofmitarbeiter)
            ParentBindingNavigator.BindingSource = OfmitarbeiterBindingSource
            ds = DsMitarbeiter
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class