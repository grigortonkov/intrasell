Public Class FormKunden

    Private Sub OfAdressenBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OfAdressenBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.OfAdressenBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsAdressen)

    End Sub

    Private Sub FormKunden_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAdressen.ofadressen' table. You can move, or remove it, as needed.
        Me.OfadressenTableAdapter.Fill(Me.DsAdressen.ofadressen)

    End Sub
End Class