Imports IntraSell_DLL

Public Class Main

    Private Sub Main_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            writeLog("Start IntraSell")
            'Init Connection 
            conn = New MySql.Data.MySqlClient.MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
            'Login
            Login.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub KundenToolStripMenuItem1_Click(sender As System.Object, e As System.EventArgs) Handles KundenToolStripMenuItem1.Click
        Try
            Dim f As Kunden = New Kunden
            f.MdiParent = Me
            f.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub ListeToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ListeToolStripMenuItem.Click
        Try
            Dim f As Kundenliste = New Kundenliste
            f.MdiParent = Me
            f.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Liste2ToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles Liste2ToolStripMenuItem.Click
        Try
            Dim f As Artikel = New Artikel
            f.MdiParent = Me
            f.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub ArtikellisteToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ArtikellisteToolStripMenuItem.Click
        Dim f As Artikelliste = New Artikelliste
        f.MdiParent = Me
        f.Show()
    End Sub

    Private Sub FormKundenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FormKundenToolStripMenuItem.Click
        Try
            Dim f As FormKunden = New FormKunden
            f.MdiParent = Me
            f.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub VorgangToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles VorgangToolStripMenuItem.Click
        Try
            Vorgang.MdiParent = Me
            Vorgang.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub VorganglisteToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles VorganglisteToolStripMenuItem.Click
        Try
            VorgangListe.MdiParent = Me
            VorgangListe.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub ÜberIntraSellToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ÜberIntraSellToolStripMenuItem.Click
        Try
            About.MdiParent = Me
            About.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BeendenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles BeendenToolStripMenuItem.Click
        Try
            writeLog("Close IntraSell")
            Me.Close()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub SetupToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles SetupToolStripMenuItem.Click
        Try
            Log.MdiParent = Me
            Setup.MdiParent = Me
            Log.Show()
            Setup.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub EintellungenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles EintellungenToolStripMenuItem.Click
        Try
            Vars.MdiParent = Me
            Vars.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
