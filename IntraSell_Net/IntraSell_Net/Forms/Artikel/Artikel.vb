Public Class Artikel

    'Die Datensätze filtern
    Public Sub FilterBy(Expression As String)
        Try
            Me.GrartikelBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
    'Private Sub GrartikelBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs)
    '    Try
    '        Me.Validate()
    '        Me.GrartikelBindingSource.EndEdit()
    '        Me.TableAdapterManager.UpdateAll(Me.DsArtikel)
    '    Catch ex As Exception
    '        HandleAppError(ex)
    '    End Try
    'End Sub


    Private Sub GrartikelBindingNavigatorSaveItem_Click_1(sender As System.Object, e As System.EventArgs) Handles GrartikelBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrartikelBindingSource.EndEdit()
            'Me.TableAdapterManager.UpdateAll(Me.DsArtikel)
            Me.GrartikelTableAdapter.Update(Me.DsArtikel)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Artikel_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
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

 
End Class