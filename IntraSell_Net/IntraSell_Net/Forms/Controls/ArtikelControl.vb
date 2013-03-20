Imports IntraSell_DLL
Public Class ArtikelControl
    Public Const SQL = "SELECT ArtNr, concat(EAN, ' ', Bezeichnung) as Art FROM grArtikel ORDER BY EAN, Bezeichnung"
    Private _ArtNr As Integer

    Public Property ArtNr() As Integer
        Get
            Return _ArtNr
        End Get
        Set(value As Integer)
            _ArtNr = value
            Me.ArtikelComboBox.SelectedValue = _ArtNr
        End Set
    End Property

    Private Sub ArtikelControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.ArtikelComboBox, SQL, "Art", "ArtNr")
        Me.ArtikelComboBox.Text = ""
    End Sub

    Private Sub ArtikelSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelSelectorButton.Click
        Try
            ArtikelSelector.Show()
            ArtikelSelector.ArtikelComboBox = ArtikelComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub ArtikelComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles ArtikelComboBox.SelectedIndexChanged
        Try
            If VarType(ArtikelComboBox.SelectedValue) = VariantType.Integer Then
                ArtNr = ArtikelComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 

    ''' <summary>
    ''' Remove selected ArtNr (for Filters etc.)
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub ArtikelComboBox_TextUpdate(sender As System.Object, e As System.EventArgs) Handles ArtikelComboBox.TextUpdate
        Try
            If ArtikelComboBox.Text = "" Then
                ArtNr = Nothing
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub StammdatenToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StammdatenToolStripMenuItem.Click
        Try
            Dim k As Artikel = New Artikel
            k.MdiParent = Main
            k.Show()
            k.FilterBy("ArtNr=" & _ArtNr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
