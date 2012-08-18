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
   
        Try

            FillComboBox(Me.LieferantNRComboBox, "SELECT IDNR, Firma FROM lieferantenAdressen order by Firma", "IDNR", "Firma")
            FillComboBox(Me.HerstellerNrComboBox, "SELECT IDNR, Firma FROM lieferantenAdressen order by Firma", "IDNR", "Firma")
            FillComboBox(Me.ArtKatNrComboBox, "SELECT artkatnr, name from `grArtikel-Kategorien` order by name asc", "Name", "ArtKatNr")

            Me.GrartikelTableAdapter.Fill(Me.DsArtikel.grartikel)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub SeriennummerCheckBox_CheckedChanged(sender As System.Object, e As System.EventArgs) Handles SeriennummerCheckBox.CheckedChanged

    End Sub

    Private Sub SeriennummerLabel_Click(sender As System.Object, e As System.EventArgs)

    End Sub
End Class