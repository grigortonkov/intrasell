Public Class VorgangBedingungen


    Private Sub VorgangBedingungen_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.GrtransportmethodeTableAdapter.Fill(Me.DsStammdaten.grtransportmethode)
            Me.GrzahlungsmethodeTableAdapter.Fill(Me.DsStammdaten.grzahlungsmethode)
            Me.GrzahlungsbedingungTableAdapter.Fill(Me.DsStammdaten.grzahlungsbedingung)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#Region "Save"
    Private Sub GrzahlungsbedingungBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles GrzahlungsbedingungBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrzahlungsbedingungBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsStammdaten)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BindingNavigatorSaveItem1_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorSaveItem1.Click
        Try
            Me.Validate()
            Me.GrzahlungsmethodeBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsStammdaten)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BindingNavigatorSaveItem2_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorSaveItem2.Click
        Try
            Me.Validate()
            Me.GrtransportmethodeBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsStammdaten)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region
End Class