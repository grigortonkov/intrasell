Imports IntraSell_DLL
Public Class ArtikelControl
    Public Const SQL = "SELECT ArtNr, concat(EAN, ' ', Bezeichnung) as Art FROM grArtikel ORDER BY EAN, Bezeichnung"
    Private _ArtNr As Integer
    Private _EAN As String
    Private _Bezeichnung As String

    Public Event ArtNrChanged(ByVal ArtNr As Integer) 'wenn der User einen neuen Artikel gewählt hat 
    Public Event ArtNrAdded(ByVal ArtNr As Integer) 'wenn mit dem '+' der user einen neuen Artikel eingefügt hat 

    Dim loading As Boolean = False

    Public Property ArtNr() As Integer
        Get
            Return _ArtNr
        End Get
        Set(value As Integer)
            _ArtNr = value
            loading = True
            Me.ArtikelComboBox.SelectedValue = _ArtNr
            loading = False
        End Set
    End Property

    Public ReadOnly Property EAN() As String
        Get
            Return _EAN
        End Get
       
    End Property

    Public ReadOnly Property Bezeichnung() As String
        Get
            Return _Bezeichnung
        End Get
    End Property

    Public Property ShowAddNew() As Boolean
        Get
            Return AddNewButton.Visible
        End Get
        Set(ByVal value As Boolean)
            AddNewButton.Visible = value
        End Set
    End Property

    Private Sub ArtikelControl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        loading = True
        FillComboBox(Me.ArtikelComboBox, SQL, "Art", "ArtNr")
        Me.ArtikelComboBox.Text = ""
        loading = False
    End Sub

    Private Sub ArtikelSelectorButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ArtikelSelectorButton.Click
        Try
            ArtikelSelector.Show()
            ArtikelSelector.ArtikelComboBox = ArtikelComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub ArtikelComboBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ArtikelComboBox.SelectedIndexChanged
        Try
            If loading Then Exit Sub
            If VarType(ArtikelComboBox.SelectedValue) = VariantType.Integer Then
                ArtNr = ArtikelComboBox.SelectedValue
                _EAN = firstRow("select ean from grArtikel where artnr = " & ArtNr)
                _Bezeichnung = firstRow("select Bezeichnung from grArtikel where artnr = " & ArtNr)

                If Not loading Then
                    RaiseEvent ArtNrChanged(ArtNr)
                End If
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
    Private Sub ArtikelComboBox_TextUpdate(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ArtikelComboBox.TextUpdate
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

    ''' <summary>
    ''' Add new Artikel
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Private Sub AddNewButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddNewButton.Click
        Try
            Dim a As Artikel = New Artikel
            a.BeginNewFlag = True
            a.ShowDialog()
            'hier wartet bis dialog fenster zu ist
            'If k.DialogResult = Windows.Forms.DialogResult.OK Then
            loading = True
            FillComboBox(Me.ArtikelComboBox, SQL, "Art", "ArtNr")
            Me.ArtNr = a.ArtNrTextBox.Text
            loading = False
            RaiseEvent ArtNrAdded(ArtNr)
            'end if

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
