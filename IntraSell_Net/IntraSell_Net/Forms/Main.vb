Public Class Main

    Private Sub ListeToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ListeToolStripMenuItem.Click
        Dim f As KundenListe = New KundenListe
        f.MdiParent = Me
        f.Show()
    End Sub

    Private Sub KundenToolStripMenuItem1_Click(sender As System.Object, e As System.EventArgs) Handles KundenToolStripMenuItem1.Click
        Dim f As Kunden = New Kunden
        f.MdiParent = Me
        f.Show()
    End Sub
End Class
