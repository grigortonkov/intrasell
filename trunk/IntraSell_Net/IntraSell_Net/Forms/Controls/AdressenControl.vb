Imports IntraSell_DLL
Public Class AdressenControl
    Public Const SQL = "SELECT IDNR, concat(IFNULL(concat(Firma, ', '),''), IFNULL(concat(Name, ', '),''), IFNULL(Vorname,'')) as Adr " &
                       " FROM ofAdressen where Firma is not null or name is not null or Vorname is not null ORDER BY Firma, Name, Vorname"
    Private _IDNR As Integer

    Public Property IDNR() As Integer
        Get
            Return _IDNR
        End Get
        Set(value As Integer)
            _IDNR = value
            Me.AdressenComboBox.SelectedValue = _IDNR
        End Set
    End Property

    Private Sub AdressenControl_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.AdressenComboBox, SQL, "Adr", "IDNR")
        Me.AdressenComboBox.Text = ""
    End Sub

    Private Sub AdressenSelectorButton_Click(sender As System.Object, e As System.EventArgs) Handles SelectorButton.Click
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
                IDNR = AdressenComboBox.SelectedValue
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'reload data 
    Public Shadows Sub Refresh()
        Parent.Refresh()
        FillComboBox(Me.AdressenComboBox, SQL, "Adr", "IDNR")
        Me.AdressenComboBox.Text = ""
    End Sub

    Private Sub AdressenComboBox_MouseDoubleClick(sender As System.Object, e As System.Windows.Forms.MouseEventArgs) Handles AdressenComboBox.MouseDoubleClick
        Try
            Dim k As Kunden = New Kunden
            k.MdiParent = CType(Me.Parent, Form).MdiParent
            k.Show()
            k.FilterBy("IDNR=" & IDNR)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
 
    Private Sub JumpButton_Click(sender As System.Object, e As System.EventArgs) Handles JumpButton.Click
        AdressenComboBox_MouseDoubleClick(Nothing, Nothing)
    End Sub
End Class
