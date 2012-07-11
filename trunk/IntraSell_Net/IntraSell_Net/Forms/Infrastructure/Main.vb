Public Class Main

    Private Sub Main_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'Login
        Login.ShowDialog()
    End Sub


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

    Private Sub FormKundenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FormKundenToolStripMenuItem.Click
        Dim f As FormKunden = New FormKunden
        f.MdiParent = Me
        f.Show()
    End Sub

    Private Sub ÜberIntraSellToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ÜberIntraSellToolStripMenuItem.Click
        About.ShowDialog()
    End Sub


    Private Sub BeendenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles BeendenToolStripMenuItem.Click
        Me.Close()
    End Sub
End Class
