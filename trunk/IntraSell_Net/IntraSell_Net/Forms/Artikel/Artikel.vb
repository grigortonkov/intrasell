Imports IntraSell_DLL

Public Class Artikel
    Implements InterfacePrintable

    'Die Datensätze filtern
    Public Sub FilterBy(ByVal Expression As String)
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


    Private Sub GrartikelBindingNavigatorSaveItem_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GrartikelBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrartikelBindingSource.EndEdit()
            'Me.TableAdapterManager.UpdateAll(Me.DsArtikel)
            Me.GrartikelTableAdapter.Update(Me.DsArtikel)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Artikel_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
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

    Public Sub Print(ByVal sender As Object) Implements InterfacePrintable.Print
        'TODO Implement
    End Sub

#Region "New"
    Dim AddingNewFlag As Boolean = False
    Private Sub BindingNavigatorAddNewItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        Try
            AddingNewFlag = True
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BindingSource_CurrentChanged(ByVal sender As System.Object, _
                              ByVal e As System.EventArgs) _
                              Handles GrartikelBindingSource.CurrentChanged
        Try
            If AddingNewFlag = True Then
                AddingNewFlag = False
                Me.ArtNrTextBox.Text = nextId("grArtikel", "ArtNr", , False)
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region



End Class