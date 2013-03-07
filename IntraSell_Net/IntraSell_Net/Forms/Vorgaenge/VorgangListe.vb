Imports IntraSell_DLL
Public Class VorgangListe

    Sub LoadData()
        Try
            Me.BuchVorgangListeTableAdapter.Fill(Me.DsVorgaenge.buchVorgangListe, Me.DatumVon.Value)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
    Private Sub KundenListe_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
 
        Try
            LoadFilter()
            LoadData()

            FillComboBox(Me.TypComboBox, "SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")
            FillComboBox(Me.StatusComboBox, "SELECT Status from buchVorgaengeStatus Group by Status", "Status")
            FillComboBox(Me.LandComboBox, "SELECT Name from grLand Order by Name", "Name")
            FillComboBox(Me.KundengruppeComboBox, "SELECT Gruppe from `ofAdressen-Kundengruppen` Order by Gruppe", "Gruppe")
            FillComboBox(Me.PreislisteComboBox, "SELECT PreislisteName FROM `grArtikel-VKPreisPerSelection` GROUP BY PreislisteName ORDER BY PreislisteName;", "PreislisteName")


            Me.TypComboBox.Text = ""
            Me.StatusComboBox.Text = ""
            Me.LandComboBox.Text = ""
            Me.KundengruppeComboBox.Text = ""
            Me.PreislisteComboBox.Text = ""

            LoadFilter()
            FilterButton_Click(Nothing, Nothing)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub TypComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles TypComboBox.SelectedIndexChanged
        Try
            If VarType(TypComboBox.SelectedValue) = VariantType.String Then
                FillComboBox(Me.StatusComboBox, "SELECT Status from buchVorgaengeStatus where VorgangTyp='" & TypComboBox.SelectedValue & "' Group by Status", "Status")
            End If
        Catch ex As Exception
        End Try
    End Sub

    Private Sub SaveFilter()
        Try
            SetVarValue(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.DatumVon.Name, Me.DatumVon.Value)
            SetVarValue(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.DatumUntil.Name, Me.DatumUntil.Value)
            SetVarValue(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.TypComboBox.Name, Me.TypComboBox.SelectedValue)
            SetVarValue(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.NummerTextBox.Name, Me.NummerTextBox.Text)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub LoadFilter()
        Try
            Me.DatumVon.Value = VarValue_Default(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.DatumVon.Name, Me.DatumVon.MinDate)
            Me.DatumUntil.Value = VarValue_Default(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.DatumUntil.Name, Me.DatumUntil.MaxDate)
            Me.TypComboBox.SelectedValue = VarValue_Default(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.TypComboBox.Name, Me.TypComboBox.SelectedValue)
            Me.NummerTextBox.Text = VarValue_Default(ModuleGlobals.MitarbeiterID & "_" & Me.Name & "_Filter_" & Me.NummerTextBox.Name, Me.NummerTextBox.Text)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'Filtern
    Private Sub FilterButton_Click(sender As System.Object, e As System.EventArgs) Handles FilterButton.Click
        Try
            LoadData()

            Dim filter As String = "1=1"

            'filter dataset 
            If Me.TypComboBox.Text.Length > 0 Then
                filter = filter & " and Typ Like '" + TypComboBox.SelectedValue + "%'"
            End If

            If Me.NummerTextBox.Text.Length > 0 Then
                filter = filter & " and Nummer = " & NummerTextBox.Text
            End If

            If Me.StatusComboBox.Text.Length > 0 Then
                filter = filter & " and Status Like '" + StatusComboBox.Text + "%'"
            End If

            ' If ArtikelControl1.ArtNr > 0 Then
            'filter = filter & " and ArtNr Like '" + ArtikelControl1.Text + "%'"
            'End If

            If AdressenControl1.IDNR > 0 Then
                filter = filter & " and KundNr = " + CStr(AdressenControl1.IDNR)
            End If

            If IsNumeric(SummeVonTextBox.Text) Then
                If Me.SummeVonTextBox.Text.Length > 0 Then
                    filter = filter & " and Summe >=" & SummeVonTextBox.Text
                End If
            End If

            If IsNumeric(SummeBisTextBox.Text) Then
                If Me.SummeBisTextBox.Text.Length > 0 Then
                    filter = filter & " and Summe <=  " + SummeBisTextBox.Text
                End If
            End If

            If Me.LandComboBox.Text.Length > 0 Then
                filter = filter & " and Land Like '" + LandComboBox.Text + "%'"
            End If

            If Me.PLZVonTextBox.Text.Length > 0 Then
                filter = filter & " and PLZ >= '" + PLZVonTextBox.Text + "%'"
            End If

            If Me.PLZBisTextBox.Text.Length > 0 Then
                filter = filter & " and PLZ <= '" + PLZBisTextBox.Text + "%'"
            End If

            If Me.KundengruppeComboBox.Text.Length > 0 Then
                filter = filter & " and Kundengruppe Like '" + KundengruppeComboBox.Text + "%'"
            End If

            If Me.PreislisteComboBox.Text.Length > 0 Then
                filter = filter & " and Preisliste Like '" + PreislisteComboBox.Text + "%'"
            End If

            If Me.BezahltCheckBox.CheckState = CheckState.Checked Then
                filter = filter & " and bezahlt=True"
            ElseIf Me.BezahltCheckBox.CheckState = CheckState.Unchecked Then
                filter = filter & " and bezahlt=False"
            End If

            If Me.AbgeschlossenCheckBox.CheckState = CheckState.Checked Then
                filter = filter & " and abgeschlossen=True"
            ElseIf Me.AbgeschlossenCheckBox.CheckState = CheckState.Unchecked Then
                filter = filter & " and abgeschlossen=False"
            End If

            If Me.AusgedrucktCheckBox.CheckState = CheckState.Checked Then
                filter = filter & " and ausgedruckt=True"
            ElseIf Me.AusgedrucktCheckBox.CheckState = CheckState.Unchecked Then
                filter = filter & " and ausgedruckt=False"
            End If


            If Me.MitarbeiterComboBox.IDNR > 0 Then
                filter = filter & " and MitarbeiterNr = '" & CStr(MitarbeiterComboBox.IDNR) & "'"
            End If

            If Not filter Is Nothing Then
                BuchVorgangListeBindingSource.Filter = filter
            Else
                BuchVorgangListeBindingSource.Filter = Nothing
            End If

            SaveFilter()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'KundenDetail öffnen 
    Private Sub VorgangListeDataGridView_RowHeaderMouseDoubleClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellMouseEventArgs) Handles VorgangListeDataGridView.RowHeaderMouseDoubleClick
        Try
            Dim fltr As String = "Nummer=" & VorgangListeDataGridView.SelectedRows(0).Cells(0).Value & " and Typ='" & VorgangListeDataGridView.SelectedRows(0).Cells(1).Value & "'"
            Vorgang.KundNr = VorgangListeDataGridView.SelectedRows(0).Cells(2).Value
            Vorgang.MdiParent = Me.MdiParent
            Vorgang.Show()
            Vorgang.FilterBy(fltr)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub OfAdressenlisteDataGridView_CellContentClick(sender As System.Object, e As System.Windows.Forms.DataGridViewCellEventArgs) Handles VorgangListeDataGridView.CellContentClick

    End Sub

    Private Sub DatumVon_ValueChanged(sender As System.Object, e As System.EventArgs) Handles DatumVon.ValueChanged
        LoadData()
    End Sub

    'Format 
    Private Sub DataGridView1_CellFormatting(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewCellFormattingEventArgs) Handles VorgangListeDataGridView.CellFormatting

        Const AbgeschlossenCheckBox_index As Integer = 10
        Const BezahltCheckBox_index As Integer = 8

        For Each dr As DataGridViewRow In VorgangListeDataGridView.Rows
            If dr.Cells(BezahltCheckBox_index).Value = True Then 'Abgeschlossen
                dr.DefaultCellStyle.BackColor = Color.LemonChiffon
            End If

            If dr.Cells(AbgeschlossenCheckBox_index).Value = True Then 'Abgeschlossen
                dr.DefaultCellStyle.BackColor = Color.Gray
            End If
        Next
    End Sub

End Class