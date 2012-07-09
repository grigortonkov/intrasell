Public Class KundenListe

    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DataSet1.ofAdressen' table. You can move, or remove it, as needed.
        Me.OfAdressenTableAdapter.Fill(Me.DataSetKunden.ofAdressen)

    End Sub
End Class