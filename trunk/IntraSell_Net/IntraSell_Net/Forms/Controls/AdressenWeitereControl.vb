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


    Public Property ShowAddNew() As Boolean
        Get
            Return AddNewButton.Visible
        End Get
        Set(ByVal value As Boolean)
            AddNewButton.Visible = value
        End Set

    End Property

    Private Sub ReloadCombo()
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
        Try
            Parent.Refresh()
            ReloadCombo()
            Me.AdressenComboBox.Text = ""
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 
    Private Sub AddNewButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AddNewButton.Click
        Try
            Dim a As AdresseWeitere = New AdresseWeitere
            a.StarteNeueAdresse(IDNR:=IDNR, VorgangTyp:="LI")
            a.TypComboBox.SelectedValue = "LI"
            a.ShowDialog()
            'refresh data 
            FillComboBox(Me.AdressenComboBox, SQLcurrent, "Adr", "ID")
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
