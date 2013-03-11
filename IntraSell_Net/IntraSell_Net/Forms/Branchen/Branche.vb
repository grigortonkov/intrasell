Public Class Branche

    Private Sub GrbranchenBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GrbranchenBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrbranchenBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsBranchen)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Branche_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Me.GrbranchenTableAdapter.Fill(Me.DsBranchen.grbranchen)
            Me.GrbranchenkeywordsTableAdapter.Fill(Me.DsBranchen.grbranchenkeywords)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class