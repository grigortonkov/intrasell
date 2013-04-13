Imports IntraSell_DLL
Imports MySql.Data.MySqlClient
Imports System.Windows.Forms


Public Class VorgangKonvertieren

    Const VAR_AUTOMATISCH_ABSCHLIESSEN As String = "AUTOMATISCH_ABSCHLIESSEN"
    Dim loading As Boolean = True

    Private _VorgangTyp, _VorgangNummer As String, _KundenNr As Integer

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        KonvertiereVorgang()
        Me.DialogResult = System.Windows.Forms.DialogResult.OK
        Me.Close()
    End Sub

    Private Sub Cancel_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel_Button.Click
        Me.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.Close()
    End Sub

    Private Sub VorgangKonvertieren_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try
            loading = True
            Me.CheckBoxAbschliessen.Checked = VarValue_Default(VAR_AUTOMATISCH_ABSCHLIESSEN, "true")

            FillComboBox(Me.TypComboBox, "SELECT '' as Typ, '' as Bezeichnung union SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")
            FillComboBox(Me.TypNachComboBox, "SELECT '' as Typ, '' as Bezeichnung union SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")

            Me.TypComboBox.SelectedValue = _VorgangTyp
            Me.NummerTextBox.Text = _VorgangNummer
            Me.KundNrAdressenControl.IDNR = _KundenNr
            Me.KundNrNachAdressenControl.IDNR = _KundenNr
            loading = False
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    'setzte die Vorgangnummer für neue 
    Private Sub TypNachComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles TypNachComboBox.SelectedIndexChanged
        If loading Then Return
        Try

            If Not String.IsNullOrEmpty(Me.TypNachComboBox.SelectedValue) Then
                Me.NummerNachTextBox.Text = IntraSellPreise.getNewVorgangNummer(Me.TypComboBox.SelectedValue, Me.KundNrAdressenControl.IDNR)
                Me.OK_Button.Enabled = True
            Else 'disable
                Me.OK_Button.Enabled = False
            End If

            ' End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Sub KonvertiereVorgang()
        Try
            Dim isP As IntraSellPreise = IntraSellPreise()

            'abschliessen
            If Me.CheckBoxAbschliessen.Checked Then
                VorgangAbschliessen(Me.TypComboBox.SelectedValue, Me.NummerTextBox.Text, True)
            End If
            'end if

            Dim newNummer As String = isP.convertFromTo(Me.TypComboBox.SelectedValue, Me.TypNachComboBox.SelectedValue, Me.NummerTextBox.Text, Me.KundNrNachAdressenControl.IDNR)
            'DoCmd.Close(acForm, Me.Name)
            'DoCmd.Close(acForm, "buchRechnung")
            Call openVorgangFunctionByNummer(Me.TypNachComboBox.SelectedValue, newNummer)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub KundNrAdressenControl_Load(sender As System.Object, e As System.EventArgs) Handles KundNrAdressenControl.Load

    End Sub

    Sub Init(VorgangTyp As String, VorgangNummer As String, KundenNr As String)
        _VorgangTyp = VorgangTyp
        _VorgangNummer = VorgangNummer
        _KundenNr = KundenNr
    End Sub

End Class
