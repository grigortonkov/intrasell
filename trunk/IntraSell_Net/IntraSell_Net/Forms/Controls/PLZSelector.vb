Public Class PLZSelector
    Public txtLand As TextBox
    Public txtPLZ As TextBox
    Public txtOrt As TextBox

    Private Sub PLZSelector_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.GrLandPlzTableAdapter.Fill(Me.DsPLZ.grLandPlz)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub txtSuche_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtSuche.TextChanged
        Try
            'filter dataset 
            If txtSuche.Text.Length > 0 Then
                GrLandPlzBindingSource.Filter = "Ort like '%" + txtSuche.Text + "%' or PLZ Like '%" + txtSuche.Text + "%'"
            Else
                GrLandPlzBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub btnUebernehmen_Click(sender As System.Object, e As System.EventArgs) Handles btnUebernehmen.Click
        Try

            If Not txtLand Is Nothing Then
                txtLand.Text = Me.dgPLZ.SelectedRows(0).Cells(4).Value
            End If

            If Not txtPLZ Is Nothing Then
                txtPLZ.Text = Me.dgPLZ.SelectedRows(0).Cells(2).Value
            End If

            If Not txtOrt Is Nothing Then
                txtOrt.Text = Me.dgPLZ.SelectedRows(0).Cells(3).Value
            End If

            Me.Close()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class