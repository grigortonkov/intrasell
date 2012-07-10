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
 
    Private Sub btnPLZ_Click(sender As System.Object, e As System.EventArgs) Handles btnPLZ.Click
        Try
            Dim plz As PLZSelector = New PLZSelector
            plz.txtOrt = Me.txtOrt
            plz.txtPLZ = Me.txtPLZ
            plz.txtLand = Me.txtland
            plz.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class