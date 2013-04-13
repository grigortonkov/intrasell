Public Class Vars
    Inherits AbstractForm

    Private Sub OfvarsBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try

            Me.Validate()
            Me.OfvarsBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsEinstellungen)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Vars_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.ParentBindingNavigator.BindingSource = OfvarsBindingSource
            ds = DsEinstellungen

            Me.OfvarsTableAdapter.Fill(Me.DsEinstellungen.ofvars)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub txtSuche_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtSuche.TextChanged
        Try
            'filter dataset 
            If txtSuche.Text.Length > 0 Then
                OfvarsBindingSource.Filter = "Name like '%" + txtSuche.Text + "%' or Wert Like '%" + txtSuche.Text + "%'"
            Else
                OfvarsBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class