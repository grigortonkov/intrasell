﻿Public Class Main


    Private Sub KundenToolStripMenuItem1_Click(sender As System.Object, e As System.EventArgs) Handles KundenToolStripMenuItem1.Click
        Dim f As Kunden = New Kunden
        f.MdiParent = Me
        f.Show()
    End Sub

    Private Sub ListeToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ListeToolStripMenuItem.Click
        Dim f As KundenListe = New KundenListe
        f.MdiParent = Me
        f.Show()

    End Sub

    Private Sub Liste2ToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles Liste2ToolStripMenuItem.Click
        'Dim f As KundenListe2 = New KundenListe2
        'f.MdiParent = Me
        'f.Show()
    End Sub
End Class
