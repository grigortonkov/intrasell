Imports IntraSell_DLL
Imports MySql.Data.MySqlClient
Imports System.Windows.Forms


Public Class VorgangDruck

    Const VAR_AUTOMATISCH_ABSCHLIESSEN As String = "AUTOMATISCH_ABSCHLIESSEN"
    Dim loading As Boolean = True

    Private _VorgangTyp, _VorgangNummer As String, _KundenNr As Integer

    Private Sub OK_Button_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK_Button.Click
        Dim Viewer As String = "WORD"
        If Me.WORD_RadioButton.Checked Then Viewer = "WORD"
        If Me.PDF_RadioButton.Checked Then Viewer = "PDF"
        If Me.EMAIL_RadioButton.Checked Then Viewer = "OUTLOOK"
        If Me.EMAILATTACHMENT_RadioButton.Checked Then Viewer = "OUTLOOK"
        If Me.XML_RadioButton.Checked Then Viewer = "XML"

        MergeVorlage(Viewer)
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
            FillComboBox(Me.TypComboBox, "SELECT '' as Typ, '' as Bezeichnung union SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")

            Me.TypComboBox.SelectedValue = _VorgangTyp
            Me.NummerTextBox.Text = _VorgangNummer
            Me.KundNrAdressenControl.IDNR = _KundenNr
            loading = False
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

        FillComboBox(Me.VorglageListBox, _
             " SELECT a.Dateiname, a.ID FROM buchVorgaengeAusdrucke a LEFT JOIN buchVorgaengeAusdruckeLog l ON a.Dateiname = l.Dateiname " & _
             " GROUP BY a.Dateiname, a.ID, a.Bereich " & _
             " HAVING a.Bereich = 'VORGANG_" & _VorgangTyp & "'" & _
             " ORDER BY Count(a.ID) DESC , a.Dateiname;", "Dateiname", "Id")
    End Sub



    'Option Compare Database
    'Option Explicit

    'Private Sub brnNeueVorlagen_Click()
    '    MsgBox("Bitte wenn Sie die Vorlagennamen ändern oder neue Vorlagen einfügen, stellen Sie sicher dass die entsprechende Vorlagen Dateien auch existieren!")
    '    DoCmd.OpenTable("buchVorgaengeAusdrucke")
    'End Sub


    'Viewer = WORD, OUTLOOK
    Sub MergeVorlage(ByVal Viewer As String)
        writeLog("mergeVorlage start. Viewer " + Viewer)
        Dim Dateiname As String = Me.VorglageListBox.SelectedItem("Dateiname")
        Dim VorlageId As String = Me.VorglageListBox.SelectedValue
        Dim Engine As String = firstRow("select engine from buchVorgaengeAusdrucke where Id = " & VorlageId)

        Dim Nummer = Me.NummerTextBox.Text
        Dim VorgangTyp = Me.TypComboBox.SelectedValue

        If IsNull(Dateiname) Or Dateiname = "" Then
            MsgBox("Wählen Sie bitte eine Vorlage aus!", vbCritical)
            Exit Sub
        Else

            If UCase(Engine).Contains("XML") Then
                Call OpenAusdruck_inWord_XML(VorgangTyp, Nummer, Dateiname, Viewer, SofortSenden_CheckBox.Checked, "Email text")
            End If

            'not supported 
            If UCase(Engine).Contains("RTF") Then
                Call OpenAusdruck_InWord_Filename_RTF(VorgangTyp, Nummer, Dateiname)
            End If

            'not supported 
            If UCase(Engine).Contains("WORD") Then
                Call OpenAusdruck_inWord_Filename(VorgangTyp, Nummer, Dateiname)
            End If

            Call writeLog(Dateiname)
        End If

    End Sub

 
    'Private Sub btnEmailAttachment_Click()
    '    'XML Engine Vorgänge können nur als Attachment geschickt werden
    '    mergeVorlage("OUTLOOK")
    'End Sub


    'Private Sub btnEmail_Click()
    '    Dim Dateiname : Dateiname = Me.cbDateiname
    '    'MsgBox UCase(Right(Dateiname, 3))
    '    If UCase(Right(Dateiname, 3)) = "HTM" Then
    '        Call sendAusdruckPerEmail(Me.Vorgangtyp, Me.Nummer, """" & Me!Vorgangtyp & """00/000000", Dateiname, Me.cbSofortSenden)
    '        Call writeLog(Dateiname, "Email")
    '    Else
    '        MsgBox("Das ist keine HTML Vorlage! Erstellen Sie eine HTML Vorlage !", vbCritical)
    '    End If
    'End Sub

    'Function writeLog(ByVal Vorlage As String, FunctionName As String) As Boolean
    '    Dim sql As String
    '    sql = "insert into buchVorgaengeAusdruckeLog (Dateiname, Funktion, GedrucktAm) values ('" & Vorlage & "','" & FunctionName & "', now())"
    '    DoCmd.SetWarnings(False)
    '    DoCmd.RunSQL(sql)
    '    DoCmd.SetWarnings(True)
    '    writeLog = True
    'End Function

 

    'Private Sub cbDateiname_DblClick(Cancel As Integer)
    '    If UCase(Right(cbDateiname, 3)) = "HTM" Then
    '        Call btnEmail_Click()
    '    Else
    '        Call btnDruck_Click()
    '    End If
    'End Sub

    'Public Sub VorgaengeAusdruck_automateDruck()
    '    Call cbDateiname_DblClick(False)
    'End Sub

    'Private Sub cbLanguageDok_Change()
    '    CURRENT_LANGUAGE_CODE = Me.cbLanguageDok
    'End Sub

    'Private Sub Vorgangtyp_Change()
    '    Debug.Print("OK")
    'End Sub

    Private Sub XMLFilename_Label_Click(sender As System.Object, e As System.EventArgs)

    End Sub

    Private Sub ButtonShowXML_Click(sender As System.Object, e As System.EventArgs)

    End Sub

    Private Sub VorglageListBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles VorglageListBox.SelectedIndexChanged
        Me.OK_Button.Enabled = VorglageListBox.SelectedIndex >= 0
    End Sub
End Class