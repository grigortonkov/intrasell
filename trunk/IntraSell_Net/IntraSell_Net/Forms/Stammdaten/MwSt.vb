Public Class MwSt

    Private Sub GrmwstBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles GrmwstBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrmwstBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsStammdaten)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub MwSt_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Try
            Me.GrmwstTableAdapter.Fill(Me.DsStammdaten.grmwst)
            Me.GrlandTableAdapter.Fill(Me.DsStammdaten.grland)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class