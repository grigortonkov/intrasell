Public Class KundenListe2

    Private Sub KunddenListe2_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAdressen2.ofAdressen' table. You can move, or remove it, as needed.
        Me.OfAdressenTableAdapter.Fill(Me.DsAdressen2.ofAdressen)

    End Sub
End Class