Imports IntraSell_DLL
Imports MySql.Data.MySqlClient
Imports System.Windows.Forms

Public Class VorgangWizzard
    Dim loading As Boolean = True
    Shared callingForm As Vorgang

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Try
            Me.NummerTextBox.Text = IntraSellPreise.getNewVorgangNummer(Me.TypComboBox.SelectedValue, Me.KundNrAdressenControl.IDNR)
            Me.DialogResult = System.Windows.Forms.DialogResult.OK
            Me.Close()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Cancel_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel_Button.Click
        Me.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Close()
    End Sub

    Private Sub VorgangWizzard_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            loading = True
            FillComboBox(Me.TypComboBox, "SELECT '' as Typ, '' as Bezeichnung union SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")
            Me.KundNrAdressenControl.IDNR = ModuleGlobals.KundenIDNR
            loading = False
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
 
    'setzte die Vorgangnummer für neue 
    Private Sub TypComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles TypComboBox.SelectedIndexChanged
        If loading Then Return
        Try
            If Not String.IsNullOrEmpty(Me.TypComboBox.SelectedValue) Then
                Me.DatumDateTimePicker.Value = DateTime.Now
                Me.OK_Button.Enabled = True
            Else 'disable
                Me.OK_Button.Enabled = False
            End If

            ' End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub KundeAnlegenButton_Click(sender As System.Object, e As System.EventArgs) Handles KundeAnlegenButton.Click
        Try
            Dim k As Kunden = New Kunden
            k.BeginNewFlag = True
            k.ShowDialog()
            'hier wartet bis dialog fenster zu ist
            'If k.DialogResult = Windows.Forms.DialogResult.OK Then
            Me.KundNrAdressenControl.Refresh()
            Me.KundNrAdressenControl.IDNR = k.IDNRTextBox.Text
            'Else 'cancel

            'End If


        Catch ex As Exception
            HandleAppError(ex)
        End Try
     
    End Sub
End Class
