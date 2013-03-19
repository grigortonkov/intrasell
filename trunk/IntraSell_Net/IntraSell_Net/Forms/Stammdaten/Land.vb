Public Class Land

    Private Sub GrlandBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles GrlandBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrlandBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsPLZ)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Land_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try 
            Me.GrlandTableAdapter.Fill(Me.DsPLZ.grland)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class