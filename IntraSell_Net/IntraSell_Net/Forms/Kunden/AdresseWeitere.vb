Public Class AdresseWeitere

    Private Sub AdressenDetailControl1_Load(sender As System.Object, e As System.EventArgs) Handles AdressenDetailControl1.Load

    End Sub

    Private Sub Ofadressen_weitereBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles Ofadressen_weitereBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.Ofadressen_weitereBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsAdressen)

    End Sub

    Private Sub AdresseWeitere_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAdressen._ofadressen_weitere' table. You can move, or remove it, as needed.#
        Me.OfadressenTableAdapter.Fill(Me.DsAdressen.ofadressen)
        Me.Ofadressen_weitereTableAdapter.Fill(Me.DsAdressen._ofadressen_weitere)

    End Sub
End Class