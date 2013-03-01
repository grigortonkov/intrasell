Public Class Anruf
    'Implements InterfacePrintable


    Private Sub Anruf_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'TODO: This line of code loads data into the 'DsAnrufe.Anrufliste' table. You can move, or remove it, as needed.
        Me.AnruflisteTableAdapter.Fill(Me.DsAnrufe.Anrufliste)

    End Sub

    Private Sub AnruflisteBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles AnruflisteBindingNavigatorSaveItem.Click
        Try
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
        Me.TelTextBox.Text = "got number?"
    End Sub

    Private Sub StartStopButton_Click(sender As System.Object, e As System.EventArgs) Handles StartStopButton.Click
        If Me.StartStopButton.Text = "Start" Then
            Me.StartStopButton.Text = "Stop"
            BeginZeitDateTimePicker.Value = Date.Now
        Else
            Me.StartStopButton.Text = "Start"
            EndeZeitDateTimePicker.Value = Date.Now
        End If
    End Sub

    Private Sub NAnrufDateTimePicker_ValueChanged(sender As System.Object, e As System.EventArgs) Handles NAnrufDateTimePicker.ValueChanged
        NAnrufDateTimePicker.Format = DateTimePickerFormat.Short
    End Sub
End Class