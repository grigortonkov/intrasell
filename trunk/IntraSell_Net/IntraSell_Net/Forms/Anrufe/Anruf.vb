Imports IntraSell_DLL
Public Class Anruf
    'Implements InterfacePrintable

    Private Sub Anruf_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            Me.AnruflisteTableAdapter.Fill(Me.DsAnrufe.Anrufliste)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#Region "New"


    'NEW
    Dim addingnewflag As Boolean = False
    Private Sub BindingNavigatorAddNewItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        'Reload 
        Me.AnruflisteTableAdapter.Fill(Me.DsAnrufe.Anrufliste)
        addingnewflag = True
    End Sub

    Private Sub AnruflisteBindingSource_currentchanged(ByVal sender As System.Object, _
                          ByVal e As System.EventArgs) _
                          Handles AnruflisteBindingSource.CurrentChanged
        Try
            If addingnewflag = True Then
                BeginNew()
                addingnewflag = False
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BeginNew()
        Try
            Me.MitarbeiterControl.IDNR = ModuleGlobals.MitarbeiterID
            Me.AdressenControl1.IDNR = Nothing
            Me.AdressenProfil1.IDNR = Nothing

            Me.BeginZeitDateTimePicker.Format = DateTimePickerFormat.Custom
            Me.BeginZeitDateTimePicker.CustomFormat = " "

            Me.EndeZeitDateTimePicker.Format = DateTimePickerFormat.Custom
            Me.EndeZeitDateTimePicker.CustomFormat = " "

            Me.NAnrufDateTimePicker.Format = DateTimePickerFormat.Custom
            Me.NAnrufDateTimePicker.CustomFormat = " "

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    'Starte Anruf für IDNR 
    Public Sub StarteAnruf(ByVal IDNR As Object)
        Try

            Me.AnruflisteBindingSource.AddNew()
            BeginNew()
            Me.AdressenControl1.IDNR = IDNR
            Me.AdressenProfil1.IDNR = IDNR


        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


#End Region
    'SAVE 
    Private Sub AnruflisteBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AnruflisteBindingNavigatorSaveItem.Click
        Try
            Me.AdressenProfil1.UpdateAll()

            Me.Validate()
            Me.AnruflisteBindingSource.EndEdit()
            Me.AnruflisteTableAdapter.Update(Me.DsAnrufe)

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'FILTER
    Public Sub FilterBy(ByVal Expression As Object)
        Try
            Me.AnruflisteBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub



    Private Sub StartStopButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles StartStopButton.Click
        If Me.StartStopButton.Text = "Start" Then
            Timer1.Start()

            Me.StartStopButton.Text = "Stop"
            BeginZeitDateTimePicker.Value = Date.Now
        Else
            Timer1.Stop()
            Me.StartStopButton.Text = "Start"
            EndeZeitDateTimePicker.Value = Date.Now
        End If
    End Sub

    Sub TimeTicks() Handles Timer1.Tick
        EndeZeitDateTimePicker.Value = Date.Now
    End Sub

    Private Sub NAnrufDateTimePicker_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles NAnrufDateTimePicker.ValueChanged
        NAnrufDateTimePicker.Format = DateTimePickerFormat.Short
    End Sub

    Private Sub BeginZeitDateTimePicker_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BeginZeitDateTimePicker.ValueChanged
        BeginZeitDateTimePicker.Format = DateTimePickerFormat.Time
    End Sub

    Private Sub EndeZeitDateTimePicker_ValueChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles EndeZeitDateTimePicker.ValueChanged
        EndeZeitDateTimePicker.Format = DateTimePickerFormat.Time
    End Sub

    Private Sub AdressenAnlageControl1_OnNewIdnrCreated(ByVal IDNR As System.Int32) Handles AdressenAnlageControl1.OnNewIdnrCreated
        Try
            'reload
            Me.AdressenControl1.Refresh()
            Me.AdressenControl1.IDNR = IDNR
            'Save Text 
            Me.NotizenTextBox.Text += vbNewLine & "Adresse:" & vbNewLine & AdressenAnlageControl1.AdresseTextBox.Text

            Me.FirmaTextBox.Text = firstRow("select firma from ofAdressen where idnr = " & IDNR)
            Me.AdresseTextBox.Text = firstRow("select adresse from ofAdressen where idnr = " & IDNR)
            Me.PLZTextBox.Text = firstRow("select PLZ from grPLZ where idnr in (select PLZ from ofAdressen where idnr = " & IDNR & ")")
            Me.OrtTextBox.Text = firstRow("select Ort from ofAdressen where idnr = " & IDNR)
            Me.TelTextBox.Text = firstRow("select Tel from ofAdressen where idnr = " & IDNR)
            Me.mobilTextBox.Text = firstRow("select Mobil from ofAdressen where idnr = " & IDNR)
            Me.EmailTextBox.Text = firstRow("select Email from ofAdressen where idnr = " & IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AngebotToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AngebotToolStripMenuItem.Click
        Try
            Dim v As Vorgang = New Vorgang
            v.MdiParent = Me.MdiParent
            v.Show()
            v.BeginNewVorgang("AN", Me.AdressenControl1.IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
 
    Private Sub ArchivierenToolStripButton_Click(sender As System.Object, e As System.EventArgs) Handles ArchivierenToolStripButton.Click
        Try
            Me.ArchiviertCheckBox.Checked = True
            AnruflisteTableAdapter.AnrufArchiviertQuery(True, CInt(Me.AnrufNrTextBox.Text))
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class