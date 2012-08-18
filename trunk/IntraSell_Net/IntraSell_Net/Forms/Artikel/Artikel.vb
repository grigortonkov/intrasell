Public Class Artikel

    Private Sub GrartikelBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs)
        Me.Validate()
        Me.GrartikelBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsArtikel)

    End Sub


    Private Sub GrartikelBindingNavigatorSaveItem_Click_1(sender As System.Object, e As System.EventArgs) Handles GrartikelBindingNavigatorSaveItem.Click
        Me.Validate()
        Me.GrartikelBindingSource.EndEdit()
        Me.TableAdapterManager.UpdateAll(Me.DsArtikel)

    End Sub

    Private Sub Artikel_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsArtikel._grartikel_kategorien' table. You can move, or remove it, as needed.


        Try
            Me.Grartikel_kategorienTableAdapter.Fill(Me.DsArtikel._grartikel_kategorien)
            Me.GrartikelTableAdapter.Fill(Me.DsArtikel.grartikel)

            FillComboBox(Me.LieferantNRComboBox, "SELECT IDNR, Firma FROM lieferantenAdressen order by Firma", "Firma", "IDNR")
            FillComboBox(Me.HerstellerNrComboBox, "SELECT IDNR, Firma FROM lieferantenAdressen order by Firma", "Firma", "IDNR")
            FillComboBox(Me.ArtKatNrComboBox, "SELECT artkatnr, name from `grArtikel-Kategorien` order by name asc", "Name", "ArtKatNr")

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub SeriennummerCheckBox_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles SeriennummerCheckBox.CheckedChanged

    End Sub

    Private Sub SeriennummerLabel_Click(sender As System.Object, e As System.EventArgs)

    End Sub
End Class