Public Class Bank

    Private Sub GrbankenBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles GrbankenBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.GrbankenBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsStammdaten)

    End Sub

    Private Sub Bank_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsStammdaten.grbanken' table. You can move, or remove it, as needed.
        Me.GrbankenTableAdapter.Fill(Me.DsStammdaten.grbanken)

    End Sub
End Class