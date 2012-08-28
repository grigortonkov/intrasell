Imports IntraSell_DLL

Public Class Main

    Private Sub Main_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            writeLog("Start IntraSell")
            'Init Connection 
            FunctionsDB.CurrentDB = New MySql.Data.MySqlClient.MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
            'Start Module 
            StartIntraSell()

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
            About.Show()
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
            Setup.Show()
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

    Private Sub UpdateToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles UpdateToolStripMenuItem.Click
        Try
            UpdateIntraSell(False)
            ProcessAllSQLFiles()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub LogToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles LogToolStripMenuItem.Click
        Try
            Log.MdiParent = Me
            Log.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub WikiToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles WikiToolStripMenuItem.Click

    End Sub

    Private Sub DruckenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles DruckenToolStripMenuItem.Click
        Try
            If Not ActiveMdiChild Is Nothing Then
                'Print the form in focus 
                Dim printable As InterfacePrintable = Me.ActiveMdiChild
                printable.Print(Me)
            Else
                Me.DruckenToolStripMenuItem.Enabled = False
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Main_MdiChildActivate(sender As Object, e As System.EventArgs) Handles Me.MdiChildActivate

        If ActiveMdiChild Is Nothing Then
            Me.DruckenToolStripMenuItem.Enabled = False
        Else
            Me.DruckenToolStripMenuItem.Enabled = IsImplementedFrom(ActiveMdiChild.GetType, GetType(InterfacePrintable))
        End If

    End Sub

    Function IsImplementedFrom(objectType As Type, intefaceType As Type) As Boolean
        For Each thisInterface As Type In objectType.GetInterfaces
            If thisInterface Is intefaceType Then
                Return True
            End If
        Next
        Return False
    End Function

End Class
