﻿Imports IntraSell_DLL

Public Class ArtikelPreisregeln

    'Handle Errors old data in the table for example -1 in ArtKAtNr
    Private Sub DataGridView1_DataError(ByVal sender As Object, ByVal e As DataGridViewDataErrorEventArgs) Handles PreiseDataGridView.DataError

        writeLog("Error happened " & e.Context.ToString())

        If (e.Context = DataGridViewDataErrorContexts.Commit) _
            Then
            writeLog("Commit error")
        End If
        If (e.Context = DataGridViewDataErrorContexts.CurrentCellChange) Then
            writeLog("Cell change")
        End If
        If (e.Context = DataGridViewDataErrorContexts.Parsing) Then
            writeLog("parsing error")
        End If
        If (e.Context = _
            DataGridViewDataErrorContexts.LeaveControl) Then
            writeLog("leave control error")
        End If

        If (TypeOf (e.Exception) Is ConstraintException) Then
            Dim view As DataGridView = CType(sender, DataGridView)
            view.Rows(e.RowIndex).ErrorText = "an error"
            view.Rows(e.RowIndex).Cells(e.ColumnIndex) _
                .ErrorText = "an error"

            e.ThrowException = False
        End If
    End Sub

    Private Sub ArtikelPreise_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        Try
            'Fill grid combos first 
            FillComboBoxInDG(Me.IDNRColumn, AdressenControl.SQL, "Adr", "IDNR")
            FillComboBoxInDG(Me.ArtNrColumn, ArtikelControl.SQL, "Art", "ArtNR")
            FillComboBoxInDG(Me.ArtKatNrColumn, "SELECT artkatnr, name from `grArtikel-Kategorien` order by name asc", "Name", "ArtKatNr")
            FillComboBoxInDG(Me.PreislisteNameColumn, "SELECT PreislisteName FROM `grArtikel-VKPreisPerSelection` GROUP BY PreislisteName ORDER BY PreislisteName", "PreislisteName")

            'Fill grid data 
            Try
                Me.Grartikel_vkpreisperselectionTableAdapter.Fill(Me.DsPreise._grartikel_vkpreisperselection)
            Catch ex As Exception
                ' HandleAppError(ex)
            End Try
            'Me.GrArtikellisteTableAdapter.Fill(Me.DsArtikel.grArtikelliste)
            FillComboBox(Me.ArtKatNrComboBox, "SELECT artkatnr, name from `grArtikel-Kategorien` order by name asc", "Name", "ArtKatNr")
            FillComboBox(Me.PreislisteComboBox, "SELECT PreislisteName FROM `grArtikel-VKPreisPerSelection` GROUP BY PreislisteName ORDER BY PreislisteName", "PreislisteName")


            Me.ArtKatNrComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""


        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    'Filtern
    Private Sub FilterButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            Dim filter As String = Nothing


            'filter dataset 
            filter = "1=1 "

            If Me.ArtikelControl.ArtNr > 0 And IsNumeric(Me.ArtikelControl.ArtNr) Then
                filter += " and ArtNr = " + CStr(Me.ArtikelControl.ArtNr)
            End If

            If Me.BezeichnungTextBox.Text.Length > 0 Then
                filter += " and ( EAN Like '" + BezeichnungTextBox.Text + "%'  or Bezeichnung Like '" + BezeichnungTextBox.Text + "%' or Bezeichnung1 Like '" + BezeichnungTextBox.Text + "%' or Beschreibung Like '" + BezeichnungTextBox.Text + "%') "
            End If

            If Me.ArtKatNrComboBox.SelectedValue > 0 Then
                filter += " and ArtKatNr =  " & CStr(ArtKatNrComboBox.SelectedValue)
            End If


            If Me.AdressenControl1.IDNR > 0 Then
                filter += " and IDNR =  " & CStr(Me.AdressenControl1.IDNR)
            End If

            If Me.PreisVonTextBox.Text.Length > 0 And IsNumeric(PreisVonTextBox.Text) Then
                filter += " and VKPreis  >= " + PreisVonTextBox.Text + ""
            End If

            If Me.PreisBisTextBox.Text.Length > 0 And IsNumeric(PreisBisTextBox.Text) Then
                filter += " and VKPreis <= " + PreisVonTextBox.Text + ""
            End If

            If Me.LagerArtikelCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and ArtNr in ( Select a.ArtNr from grArtikel a where a.LagerArtikel = " + IIf(LagerArtikelCheckBox.CheckState = CheckState.Checked, "True", "False") & ")"
            End If

            If Me.SeriennummerCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and Seriennummer = " + IIf(SeriennummerCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.SetArtikelCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and SetArtikel = " + IIf(SetArtikelCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.ProduktAktivCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and ProduktAktiv = " + IIf(ProduktAktivCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.NichtBestellbarCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and NichtBestellbar = " + IIf(NichtBestellbarCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            If Me.ProduktAktivOnlineCheckBox.CheckState <> CheckState.Indeterminate Then
                filter += " and ProduktAktivOnline = " + IIf(ProduktAktivOnlineCheckBox.CheckState = CheckState.Checked, "True", "False")
            End If

            'If Me.KundengruppeComboBox.Text.Length > 0 Then
            '    filter = "Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            'End If

            'If Me.PreislisteComboBox.Text.Length > 0 Then
            '    filter = "Preisliste Like '" + PreislisteComboBox.Text + "%'"
            'End If

            If Not filter Is Nothing Then
                GrartikelvkpreisperselectionBindingSource.Filter = filter
            Else
                GrartikelvkpreisperselectionBindingSource.Filter = Nothing
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'KundenDetail öffnen 
    Private Sub OfAdressenlisteDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles PreiseDataGridView.RowHeaderMouseDoubleClick
        Try
            ' Artikel.MdiParent = Me.MdiParent
            ' Artikel.Show()
            'Artikel.FilterBy("ArtNR=" & OfAdressenlisteDataGridView.SelectedRows(0).Cells(0).Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    Private Sub BindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.GrartikelvkpreisperselectionBindingSource.EndEdit() 
            Me.Grartikel_vkpreisperselectionTableAdapter.Update(Me.DsPreise)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class