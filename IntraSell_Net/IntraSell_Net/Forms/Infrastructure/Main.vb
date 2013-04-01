Imports IntraSell_DLL

Public Class Main

    Private Sub Main_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            ModuleLog.Init(Global.IntraSell_Net.My.MySettings.Default.LOG_FILENAME)

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

    Private Sub Main_Close(sender As System.Object, e As System.EventArgs) Handles MyBase.FormClosed
        Try
            StopIntraSell()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Function IsImplementedFrom(objectType As Type, intefaceType As Type) As Boolean
        For Each thisInterface As Type In objectType.GetInterfaces
            If thisInterface Is intefaceType Then
                Return True
            End If
        Next
        Return False
    End Function

    Private Sub SessionToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles SessionToolStripMenuItem.Click
        Try
            Session.MdiParent = Me
            Session.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#Region "Kunden"
    Private Sub NeuerKundeToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles NeuerKundeToolStripMenuItem.Click
        Try
            Dim f As Kunden = New Kunden
            f.MdiParent = Me
            f.Show()
            f.BeginNew()
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

    Private Sub KundengruppenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles KundengruppenToolStripMenuItem.Click
        Try
            Dim f As KundenGruppe = New KundenGruppe
            f.MdiParent = Me
            f.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#End Region

#Region "Artikel"


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

    Private Sub ArtikelEinheitenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelEinheitenToolStripMenuItem.Click
        Try
            Einheiten.MdiParent = Me
            Einheiten.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#End Region

#Region "Vorgang"


    Private Sub NeuerVorgangToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles NeuerVorgangToolStripMenuItem.Click
        Try
            Vorgang.MdiParent = Me
            Vorgang.Show()
            Vorgang.BeginNew()
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



    Private Sub VorgangEinstellungenToolStripMenuItem1_Click_1(sender As System.Object, e As System.EventArgs) Handles VorgangEinstellungenToolStripMenuItem1.Click
        Try
            VorgangEinstellungen.MdiParent = Me
            VorgangEinstellungen.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub VorgangEinstellungenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles VorgangEinstellungenToolStripMenuItem.Click
        Try
            VorgangBedingungen.MdiParent = Me
            VorgangBedingungen.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub MahnungenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles MahnungenToolStripMenuItem.Click
        Try
            MahnListe.MdiParent = Me
            MahnListe.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#End Region

#Region "Infrastructure"


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
            Log.MdiParent = Me
            Log.Show()
            UpdateIntraSell(False)
            ProcessAllSQLFiles()
            UpdateIntraSellForCustomer(False)
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
        Try
            System.Diagnostics.Process.Start("http://code.google.com/p/intrasell/w/list")
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub BugMeldenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles BugMeldenToolStripMenuItem.Click
        Try
            System.Diagnostics.Process.Start("http://code.google.com/p/intrasell/issues/list")
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#End Region

#Region "Drucken & Export"

    Private Sub Main_MdiChildActivate(sender As Object, e As System.EventArgs) Handles Me.MdiChildActivate

        If ActiveMdiChild Is Nothing Then
            Me.DruckenToolStripMenuItem.Enabled = False
            Me.ExportToolStripMenuItem.Enabled = False
        Else
            Me.DruckenToolStripMenuItem.Enabled = IsImplementedFrom(ActiveMdiChild.GetType, GetType(InterfacePrintable))
            Me.ExportToolStripMenuItem.Enabled = IsImplementedFrom(ActiveMdiChild.GetType, GetType(InterfaceExportableGrid))
        End If

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

    Private Sub ExportToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles ExportToolStripMenuItem.Click
        Try
            If Not ActiveMdiChild Is Nothing Then
                'Print the form in focus 
                Dim printable As InterfaceExportableGrid = Me.ActiveMdiChild
                printable.Export(Me)
            Else
                Me.ExportToolStripMenuItem.Enabled = False
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub



#End Region

#Region "Preise"



    Private Sub PreisregelnToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles PreisregelnToolStripMenuItem.Click
        Try
            ArtikelPreisregeln.MdiParent = Me
            ArtikelPreisregeln.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

#Region "Anrufe"


    Private Sub NeuerAnrufToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles NeuerAnrufToolStripMenuItem.Click
        Try
            Dim a As Anruf = New Anruf
            a.MdiParent = Me
            a.Show()
            a.StarteAnruf(ModuleGlobals.KundenIDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub ListeToolStripMenuItem1_Click(sender As System.Object, e As System.EventArgs) Handles ListeToolStripMenuItem1.Click
        Dim f As Anrufliste = New Anrufliste
        f.MdiParent = Me
        f.Show()
    End Sub

    Private Sub AnrufToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles AnrufToolStripMenuItem.Click
        Try
            Anruf.MdiParent = Me
            Anruf.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

#Region "Branche"


    Private Sub MitarbeiterToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles MitarbeiterToolStripMenuItem.Click
        Try
            Mitarbeiter.MdiParent = Me
            Mitarbeiter.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BranchenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BranchenToolStripMenuItem.Click
        Try
            Branche.MdiParent = Me
            Branche.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

#Region "Stammdaten"


    Private Sub ArtikelKategorienToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ArtikelKategorienToolStripMenuItem.Click
        Try
            ArtikelKategorien.MdiParent = Me
            ArtikelKategorien.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub LänderToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles LänderToolStripMenuItem.Click
        Try
            Land.MdiParent = Me
            Land.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub MwStToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles MwStToolStripMenuItem.Click
        Try
            MwSt.MdiParent = Me
            MwSt.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BankenToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles BankenToolStripMenuItem.Click
        Try
            Bank.MdiParent = Me
            Bank.Show()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

 

#End Region




End Class
