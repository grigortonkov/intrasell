Public Class PLZSelector
    Public Land As ComboBox
    Public PLZ As ComboBox
    Public Ort As ComboBox

 
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
            Dim r = Me.dgPLZ.SelectedRows(0)
            If Not Land Is Nothing Then
                Land.SelectedValue = r.Cells(4).Value
                Land.Text = r.Cells(1).Value
            End If

            If Not PLZ Is Nothing Then
                PLZ.Text = r.Cells(2).Value
                PLZ.SelectedValue = r.Cells(0).Value
            End If

            If Not Ort Is Nothing Then
                Ort.Text = r.Cells(3).Value
            End If

            Me.Close()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Label1_Click(sender As System.Object, e As System.EventArgs) Handles Label1.Click

    End Sub
End Class