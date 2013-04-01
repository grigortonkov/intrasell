Imports IntraSell_DLL

Public Class Dashboard

    Private Sub KundenButton_Click(sender As System.Object, e As System.EventArgs) Handles KundenButton.Click
        Main.NeuerKundeToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub AngebotButton_Click(sender As System.Object, e As System.EventArgs) Handles AngebotButton.Click
        Main.NeuerVorgangToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub RechnungButton_Click(sender As System.Object, e As System.EventArgs) Handles RechnungButton.Click
        Main.NeuerVorgangToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub MahnungenButton_Click(sender As System.Object, e As System.EventArgs) Handles MahnungenButton.Click
        Main.MahnungenToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub AnrufenButton_Click(sender As System.Object, e As System.EventArgs) Handles AnrufenButton.Click
        Main.NeuerAnrufToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub ArtikelAnlegenButton_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelAnlegenButton.Click
        Main.ArtikelToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub Dashboard_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try

            Me.AnzahlAngeboteLabel.Text = "offene Angebote:" & firstRow("select count(*) from buchVorgang where Typ='AN'  and abgeschlossen=0")
            Me.AnzahlRechnungenLabel.Text = "offene Rechnungen:" & firstRow("select count(*) from buchVorgang where Typ='AR' and abgeschlossen=0")
            Me.AnzahlMahnugnenLabel.Text = "unbezahlte Rechn.:" & firstRow("select count(*) from buchVorgang where Typ='AR' and bezahlt=0")
            Me.AnzahlAnrufeLabel.Text = "Anrufe:" & firstRow("select count(*) from ofAnrufe")
            Me.AnzahlKundenLabel.Text = "Kunden:" & firstRow("select count(*) from ofAdressen")
            Me.ArtikelAnlegenLabel.Text = "Artikel:" & firstRow("select count(*) from grArtikel")
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AnzahlAngeboteLabel_Click(sender As System.Object, e As System.EventArgs) Handles AnzahlAngeboteLabel.Click
        Main.VorganglisteToolStripMenuItem_Click(Nothing, Nothing)
    End Sub

    Private Sub AnzahlRechnungenLabel_Click(sender As System.Object, e As System.EventArgs) Handles AnzahlRechnungenLabel.Click
        Main.VorganglisteToolStripMenuItem_Click(Nothing, Nothing)
    End Sub
 

    Private Sub AnzahlAnrufeLabel_Click(sender As System.Object, e As System.EventArgs) Handles AnzahlAnrufeLabel.Click
        Main.ListeToolStripMenuItem1_Click(Nothing, Nothing)
    End Sub

    Private Sub AnzahlKundenLabel_Click(sender As System.Object, e As System.EventArgs) Handles AnzahlKundenLabel.Click
        Main.ListeToolStripMenuItem_Click(Nothing, Nothing)
    End Sub


    Private Sub ArtikelAnlegenLabel_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelAnlegenLabel.Click
        Main.ArtikellisteToolStripMenuItem_Click(Nothing, Nothing)
    End Sub
End Class