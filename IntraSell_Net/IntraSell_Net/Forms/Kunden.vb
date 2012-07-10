Public Class Kunden

    Private Sub Kunden_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Me.OfAdressenTableAdapter.Fill(Me.DataSetKunden.ofAdressen)
    End Sub

    Private Sub BindingNavigatorDeleteItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorDeleteItem.Click

    End Sub

    Private Sub ToolStripButton1_Click(sender As System.Object, e As System.EventArgs) Handles ToolStripButton1.Click
        Me.OfAdressenTableAdapter.Update2(Me.txtFirma.Text, Me.txtFirma.Text, Me.txtIDNR.Text)
    End Sub
End Class