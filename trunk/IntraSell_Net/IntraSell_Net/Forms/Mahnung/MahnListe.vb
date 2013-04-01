Imports IntraSell_DLL
Public Class MahnListe
    Implements InterfacePrintable

    Const MahnstufeSoll_index As Integer = 1
    Const RechnungNummer_index As Integer = 2


    Sub LoadData()
        Try
            BuchvorgangTableAdapter.FillByMahnstufe(Me.DsMahnungen.buchvorgang)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Try
            LoadFilter()
            LoadData()

            ' FillComboBox(Me.MahnstufeComboBox, "SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")

            LoadFilter()
            FilterButton_Click(Nothing, Nothing)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    Private Sub SaveFilter()
        Try

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub LoadFilter()
        Try

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'Filtern
    Private Sub FilterButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            'zu langsam
            'LoadData()

            Dim filter As String = "1=1"

            'filter dataset 
            If Me.MahnstufeComboBox.Text.Length > 0 Then
                filter = filter & " and Typ Like '" + MahnstufeComboBox.SelectedValue + "%'"
            End If


            If Not filter Is Nothing Then
                BuchvorgangBindingSource.Filter = filter
            Else
                BuchvorgangBindingSource.Filter = Nothing
            End If

            SaveFilter()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'KundenDetail öffnen 
    Private Sub VorgangListeDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles VorgangListeDataGridView.RowHeaderMouseDoubleClick
        Try
            Dim vorg As dsMahnungen.buchvorgangRow = BuchvorgangBindingSource.Current.row
            Dim fltr As String = "Nummer=" & vorg.Nummer & " and Typ='" & vorg.Typ & "'"
            Vorgang.KundNr = vorg.KundNr
            Vorgang.MdiParent = Me.MdiParent
            Vorgang.Show()
            Vorgang.FilterBy(fltr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    'Format 
    Private Sub DataGridView1_CellFormatting(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellFormattingEventArgs) Handles VorgangListeDataGridView.CellFormatting

        For Each dr As DataGridViewRow In VorgangListeDataGridView.Rows
            Try
                'If dr.Cells(BezahltCheckBox_index).Value = True Then 'Abgeschlossen
                'dr.DefaultCellStyle.BackColor = Color.LemonChiffon
                'End If

                ' If dr.Cells(AbgeschlossenCheckBox_index).Value = True Then 'Abgeschlossen
                ' dr.DefaultCellStyle.BackColor = Color.Gray
                ' End If
                Dim RechNummer As String = dr.Cells(RechnungNummer_index).Value
                Dim MahnstufeSoll As String = CalculateMahnStufe(RechNummer)

                dr.Cells(MahnstufeSoll_index).Value = MahnstufeSoll

                If MahnstufeSoll = MAHNSTUFE_1 Then
                    dr.DefaultCellStyle.BackColor = Color.Yellow
                End If
                If MahnstufeSoll = MAHNSTUFE_2 Then
                    dr.DefaultCellStyle.BackColor = Color.Red
                End If
                If MahnstufeSoll = MAHNSTUFE_3 Then
                    dr.DefaultCellStyle.BackColor = Color.DarkRed
                End If

            Catch ex As Exception
                HandleAppError(ex)
            End Try
        Next
    End Sub


    Private Sub MahnstufeSetzenButton_Click(sender As System.Object, e As System.EventArgs) Handles MahnstufeSetzenButton.Click
        Try
            Dim vorgang As dsMahnungen.buchvorgangRow = BuchvorgangBindingSource.Current.row
            ModuleMahnwesen.SetzeMahnStufe(vorgang.Nummer, MahnstufeComboBox.Text)
            MsgBox("Die Mahnstufe wurde gesetzt!")
            LoadData()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    ''' <summary>
    ''' Setzt die Buttons aktiv oder nicht je nach Auswahl 
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub SetButtons()
        Try
            Me.MahnbriefButton.Enabled = Not BuchvorgangBindingSource.Current Is Nothing
            Me.KassaButton.Enabled = Not BuchvorgangBindingSource.Current Is Nothing
            Me.MahnstufeSetzenButton.Enabled = Me.MahnstufeComboBox.Text.Length > 0 And Not BuchvorgangBindingSource.Current Is Nothing
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub MahnstufeComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles MahnstufeComboBox.TextChanged
        SetButtons()
    End Sub


#Region "Print"


    Public Sub Print(sender As Object) Implements InterfacePrintable.Print
        Try
            'Start printing for the Vorgang 
            Dim vorgang As dsMahnungen.buchvorgangRow = BuchvorgangBindingSource.Current.row
            OpenAusdruck_inWord_XML(vorgang.Typ, vorgang.Nummer, DEFAULT_WORD_VORLAGE_MAHNUNG, ModuleBuchVorgangXML.VIEWER_WORD, False, Nothing)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub VorgangListeDataGridView_SelectionChanged(sender As System.Object, e As System.EventArgs) Handles VorgangListeDataGridView.SelectionChanged
        SetButtons()
    End Sub

    Private Sub MahnbriefButton_Click(sender As System.Object, e As System.EventArgs) Handles MahnbriefButton.Click
        Print(Nothing)
    End Sub
#End Region



    Private Sub KassaButton_Click(sender As System.Object, e As System.EventArgs) Handles KassaButton.Click
        Try
            'Start printing for the Vorgang 
            Dim vorgang As dsMahnungen.buchvorgangRow = BuchvorgangBindingSource.Current.row
            Call KassaBuchung(vorgang.Typ, vorgang.Nummer, vorgang.SummeBrutto)
            LoadData()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class