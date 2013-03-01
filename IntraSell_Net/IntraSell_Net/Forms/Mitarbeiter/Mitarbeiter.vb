Public Class Mitarbeiter

    Private Sub OfmitarbeiterBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles OfmitarbeiterBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.OfmitarbeiterBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsMitarbeiter)

    End Sub

    Private Sub Mitarbeiter_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsMitarbeiter.ofmitarbeiter' table. You can move, or remove it, as needed.
        Me.OfmitarbeiterTableAdapter.Fill(Me.DsMitarbeiter.ofmitarbeiter)

    End Sub
End Class