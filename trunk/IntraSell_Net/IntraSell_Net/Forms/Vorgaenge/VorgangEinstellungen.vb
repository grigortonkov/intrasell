Public Class VorgangEinstellungen

    Private Sub BuchvorgangtypBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BuchvorgangtypBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.BuchvorgangtypBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsVorgaenge)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub VorgangEinstellungen_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.BuchvorgaengeausdruckeTableAdapter.Fill(Me.DsVorgaenge.buchvorgaengeausdrucke)
            Me.BuchvorgangeigenschaftTableAdapter.Fill(Me.DsVorgaenge.buchvorgangeigenschaft)
            Me.BuchvorgaengestatusTableAdapter.Fill(Me.DsVorgaenge.buchvorgaengestatus)
            Me.BuchvorgangtypTableAdapter.Fill(Me.DsVorgaenge.buchvorgangtyp)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class