Public Class Session

    Dim loading As Boolean = False
    Private Sub Session_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
 
        Try
            loading = True

            Me.GrbranchenTableAdapter.Fill(Me.DsBranchen.grbranchen)

            Me.MitarbeiterControl.IDNR = ModuleGlobals.MitarbeiterID
            Me.AdressenControl1.IDNR = ModuleGlobals.KundenIDNR
            Me.BrancheComboBox.SelectedValue = ModuleGlobals.Branche

            loading = False
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Session_GotFocus(sender As System.Object, e As System.EventArgs) Handles MyBase.Activated
        Try
            Session_Load(Nothing, Nothing)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BrancheComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles BrancheComboBox.SelectedIndexChanged
        Try
            If Not loading Then
                If Not Me.BrancheComboBox.SelectedValue Is Nothing Then
                    ModuleGlobals.Branche = Me.BrancheComboBox.SelectedValue
                End If
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class