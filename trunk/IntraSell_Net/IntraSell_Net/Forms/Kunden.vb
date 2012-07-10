Public Class Kunden

    Private Sub Kunden_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Me.OfAdressenTableAdapter.Fill(Me.DataSetKunden.ofadressen)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub BindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try
            Me.OfAdressenTableAdapter.Update(Me.DataSetKunden)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
 
End Class