Public Class ArtikelKategorien

    Private Sub Grartikel_kategorienBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Grartikel_kategorienBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.Grartikel_kategorienBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsArtikel)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub ArtikelKategorien_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Me.Grartikel_kategorienTableAdapter.Fill(Me.DsArtikel._grartikel_kategorien)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class