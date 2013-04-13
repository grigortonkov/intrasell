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

    ''' <summary>
    ''' Save Artikel
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub GrartikelBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrartikelBindingSource.EndEdit()
            Me.GrartikelTableAdapter.Update(Me.DsArtikel)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Artikel_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            ds = DsArtikel

            Try
                Me.Grartikel_kategorienTableAdapter.Fill(Me.DsArtikel._grartikel_kategorien)
                Me.GrartikelTableAdapter.Fill(Me.DsArtikel.grartikel)
            Catch ex As Exception
                HandleAppError(ex)
            End Try

            FillComboBox(Me.EinheitComboBox, "SELECT Einheit FROM grArtikel group by Einheit", "Einheit", "Einheit")
            FillComboBox(Me.LieferantNRComboBox, "SELECT IDNR, Firma FROM lieferantenAdressen order by Firma", "Firma", "IDNR")
            FillComboBox(Me.HerstellerNrComboBox, "SELECT IDNR, Firma FROM lieferantenAdressen order by Firma", "Firma", "IDNR")
            FillComboBox(Me.ArtKatNrComboBox, "SELECT artkatnr, name from `grArtikel-Kategorien` order by name asc", "Name", "ArtKatNr")

            Me.ParentBindingNavigator.BindingSource = Me.GrartikelBindingSource

            If BeginNewFlag Then
                BeginNew()
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Public Sub Print(ByVal sender As Object) Implements InterfacePrintable.Print
        'TODO Implement
    End Sub

#Region "New"

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

    Public Sub BeginNew()
        Try
            BindingNavigatorAddNewItem_Click(Nothing, Nothing)
            GrartikelBindingSource.AddNew()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region



    Private Sub PreisATSTextBox_TextChanged(sender As System.Object, e As System.EventArgs) Handles PreisATSTextBox.TextChanged
        Try
            Me.PreisATS_BruttoTextBox.Text = CDbl(PreisATSTextBox.Text) * (100 + CDbl(MWSTTextBox.Text)) / 100
        Catch ex As Exception

        End Try
    End Sub
End Class