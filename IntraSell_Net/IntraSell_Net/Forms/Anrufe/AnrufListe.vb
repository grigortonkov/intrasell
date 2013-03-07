Public Class Anrufliste

    Private Sub Anrufliste_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load


        Try
           
            LoadData()

            'Me.GrlandTableAdapter.Fill(Me.DsPLZ.grland)
            'Me.PreislistenTableAdapter.Fill(Me.DsAnrufe.Preislisten)
            'Me.KundengruppenTableAdapter.Fill(Me.DsAnrufe.Kundengruppen)



            Me.LandComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""

            'Me.OfAdressenlisteTableAdapter.Fill(Me.DsAnrufe.ofAdressenliste)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Sub LoadData()
        Me.AnruflisteTableAdapter.Fill(Me.DsAnrufe.Anrufliste)
        Me.OfanrufeTableAdapter.Fill(Me.DsAnrufe.ofanrufe)
    End Sub
    Public Sub FilterBy(Expression As Object)
        Try
            Me.AnruflisteBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Public Sub Anrufprotokoll(IDNR As Object)
        Try
            AdressenControl1.IDNR = IDNR
            Call AnrufButton_Click(Nothing, Nothing)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    'Filtern
    Private Sub AnrufButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            LoadData()

            Dim filter As String = Nothing


            'filter dataset 
            filter = "1=1 "

            If AdressenControl1.IDNR > 0 Then
                filter = filter & " and AdrNr = " + CStr(AdressenControl1.IDNR)
            End If

            If Me.LandComboBox.Text.Length > 0 Then
                filter += " and Land Like '" + LandComboBox.Text + "%'"
            End If

            If Me.PLZVonTextBox.Text.Length > 0 Then
                filter += " and PLZ >= '" + PLZVonTextBox.Text + "%'"
            End If

            If Me.PLZBisTextBox.Text.Length > 0 Then
                filter += " and PLZ <= '" + PLZBisTextBox.Text + "%'"
            End If

            If Me.KundengruppeComboBox.Text.Length > 0 Then
                filter += " and Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            End If

            If Me.PreislisteComboBox.Text.Length > 0 Then
                filter += " and Preisliste Like '" + PreislisteComboBox.Text + "%'"
            End If

            If MitarbeiterControl.IDNR > 0 Then
                filter = filter & " and MitarbeiterNr = " + CStr(MitarbeiterControl.IDNR)
            End If

            If Not filter Is Nothing Then
                AnruflisteBindingSource.Filter = filter
            Else
                AnruflisteBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 
    'KundenDetail öffnen 
    Private Sub OfAdressenlisteDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles OfAdressenlisteDataGridView.RowHeaderMouseDoubleClick
        Try
            Anruf.MdiParent = Me.MdiParent
            Anruf.Show()
            Anruf.FilterBy("AnrufNR=" & OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub OfAdressenlisteDataGridView_CellContentClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles OfAdressenlisteDataGridView.CellContentClick

    End Sub

    'Format 
    Private Sub DataGridView1_CellFormatting(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellFormattingEventArgs) Handles OfAdressenlisteDataGridView.CellFormatting

        Const NAnruf_index As Integer = 3

        For Each dr As DataGridViewRow In OfAdressenlisteDataGridView.Rows
            If Not IsDBNull(dr.Cells(NAnruf_index).Value) Then
                Dim nAnruf As Date = dr.Cells(NAnruf_index).Value

                'Anruf zu spät
                If nAnruf < DateAndTime.Today.AddDays(-1) Then
                    dr.DefaultCellStyle.BackColor = Color.Red
                End If

                'Heute Anrufen 
                If nAnruf > DateAndTime.Today.AddDays(-1) And nAnruf <= DateAndTime.Today Then 'Abgeschlossen
                    dr.DefaultCellStyle.BackColor = Color.Lime
                End If

                'Morgen anrufen 
                If nAnruf > DateAndTime.Today Then 'Zuzkunft 
                    dr.DefaultCellStyle.BackColor = Color.Wheat
                End If


            End If
        Next
    End Sub

End Class