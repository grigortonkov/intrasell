Public Class Einheiten

    Private Sub Grartikel_einheitenBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles Grartikel_einheitenBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.Grartikel_einheitenBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsArtikel)

    End Sub

    Private Sub Einheiten_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsArtikel._grartikel_einheiten' table. You can move, or remove it, as needed.
        Me.Grartikel_einheitenTableAdapter.Fill(Me.DsArtikel._grartikel_einheiten)

    End Sub
End Class