Imports IntraSell_DLL
Public Class Anruf
    'Implements InterfacePrintable



    Private Sub Anruf_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAnrufe.Anrufliste' table. You can move, or remove it, as needed.
        Me.AnruflisteTableAdapter.Fill(Me.DsAnrufe.Anrufliste)

    End Sub

    Private Sub AnruflisteBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles AnruflisteBindingNavigatorSaveItem.Click
        Try
            Me.AdressenProfil1.UpdateAll()

            Me.Validate()
            Me.AnruflisteBindingSource.EndEdit()
            Me.AnruflisteTableAdapter.Update(Me.DsAnrufe)

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Public Sub FilterBy(Expression As Object)
        Try
            Me.AnruflisteBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'STarte Anruf für IDNR 
    Public Sub StarteAnruf(IDNR As Object)
        Try


            Me.AnruflisteBindingSource.AddNew()
            Me.AdressenControl1.IDNR = IDNR

            BindingNavigatorAddNewItem_Click(Nothing, Nothing)

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BeginZeitDateTimePicker_ValueChanged(sender As System.Object, e As System.EventArgs) Handles BeginZeitDateTimePicker.MouseDown
        ' BeginZeitDateTimePicker.Value = Date.Now
    End Sub

    Private Sub EndeZeitDateTimePicker_ValueChanged(sender As System.Object, e As System.EventArgs) Handles EndeZeitDateTimePicker.MouseDown
        ' EndeZeitDateTimePicker.Value = Date.Now
    End Sub

    Private Sub BindingNavigatorAddNewItem_Click(sender As System.Object, e As System.EventArgs) Handles AnruflisteBindingSource.AddingNew
        Try
            Me.MitarbeiterControl.IDNR = ModuleGlobals.MitarbeiterID
            Me.BeginZeitDateTimePicker.Value = DateTime.Now

            Me.NAnrufDateTimePicker.Format = DateTimePickerFormat.Custom
            Me.NAnrufDateTimePicker.CustomFormat = " "

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AdressenControl1_Load(sender As System.Object, e As System.EventArgs) Handles AdressenControl1.Leave

    End Sub

    Private Sub StartStopButton_Click(sender As System.Object, e As System.EventArgs) Handles StartStopButton.Click
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

    Private Sub NAnrufDateTimePicker_ValueChanged(sender As System.Object, e As System.EventArgs) Handles NAnrufDateTimePicker.ValueChanged
        NAnrufDateTimePicker.Format = DateTimePickerFormat.Short
    End Sub

    Private Sub AdressenAnlageControl1_OnNewIdnrCreated(IDNR As System.Int32) Handles AdressenAnlageControl1.OnNewIdnrCreated
        Try
            'reload
            Me.AdressenControl1.Refresh()
            Me.AdressenControl1.IDNR = IDNR
            'Save Text 
            Me.NotizenTextBox.Text += vbNewLine & "Adresse:" & vbNewLine & AdressenAnlageControl1.AdresseTextBox.Text

            Me.FirmaTextBox.Text = firstRow("select firma from ofAdressen where idnr = " & IDNR)
            Me.AdresseTextBox.Text = firstRow("select adresse from ofAdressen where idnr = " & IDNR)
            Me.PLZTextBox.Text = firstRow("select PLZ from ofAdressen where idnr = " & IDNR)
            Me.OrtTextBox.Text = firstRow("select Ort from ofAdressen where idnr = " & IDNR)
            Me.TelTextBox.Text = firstRow("select Tel from ofAdressen where idnr = " & IDNR)
            Me.mobilTextBox.Text = firstRow("select Mobil from ofAdressen where idnr = " & IDNR)
            Me.EmailTextBox.Text = firstRow("select Email from ofAdressen where idnr = " & IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AngebotToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles AngebotToolStripMenuItem.Click
        Try
            Dim v As Vorgang = New Vorgang
            v.MdiParent = Me.MdiParent
            v.Show()
            v.BeginNewVorgang("AN", Me.AdressenControl1.IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
End Class