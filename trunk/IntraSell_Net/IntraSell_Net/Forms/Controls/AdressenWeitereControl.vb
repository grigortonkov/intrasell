Imports IntraSell_DLL
Public Class AdressenWeitereControl
    Public Const SQL = "SELECT ID, IDNR, concat(IFNULL(concat(Firma, ', '),''), IFNULL(concat(Name, ', '),''), IFNULL(Vorname,'')) as Adr " &
                       " FROM `ofAdressen-Weitere` " & _
                       " where IDNR=:IDNR and (Firma is not null or name is not null or Vorname is not null)" & _
                       " ORDER BY Firma, Name, Vorname"

    Private SQLcurrent As String
    Private _ID As Integer

    Public Property ID() As Integer
        Get
            Return _ID
        End Get
        Set(value As Integer)
            _ID = value
            Me.AdressenComboBox.SelectedValue = _ID
        End Set
    End Property


    Private _IDNR As Integer


    Public Property IDNR() As Integer
        Get
            Return _IDNR
        End Get
        Set(value As Integer)
            _IDNR = value
            reloadCombo()
            'Me.AdressenComboBox.Text = ""
            If _ID > 0 Then
                Me.AdressenComboBox.SelectedValue = _ID
            End If
        End Set
    End Property

    Private Sub reloadCombo()
        If SQLcurrent <> Replace(SQL, ":IDNR", _IDNR) Then
            SQLcurrent = Replace(SQL, ":IDNR", _IDNR)
            FillComboBox(Me.AdressenComboBox, SQLcurrent, "Adr", "ID")
        End If
    End Sub
    Private Sub AdressenControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        reloadCombo()
        Me.AdressenComboBox.Text = ""
    End Sub

    Private Sub AdressenSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles ArtikelSelectorButton.Click
        Try
            AdressenSelector.Show()
            AdressenSelector.AdressenComboBox = AdressenComboBox
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub


    Private Sub AdressenComboBox_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles AdressenComboBox.SelectedIndexChanged
        Try
            If VarType(AdressenComboBox.SelectedValue) = VariantType.Integer Then
                ID = AdressenComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'reload data 
    Public Shadows Sub Refresh()
        Parent.Refresh()
        reloadCombo()
        Me.AdressenComboBox.Text = ""
    End Sub
 
End Class
