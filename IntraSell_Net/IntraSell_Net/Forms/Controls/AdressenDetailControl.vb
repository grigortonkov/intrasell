Imports IntraSell_DLL
Public Class AdressenDetailControl
#Region "Properties"

    Public Property IDNR As String
        Get
            Return IDNRTextBox.Text
        End Get
        Set(value As String)
            IDNRTextBox.Text = value
        End Set
    End Property

    Public Property Status As String
        Get
            Return StatusComboBox.Text
        End Get
        Set(value As String)
            StatusComboBox.Text = value
        End Set
    End Property

    Public Property Branche As String
        Get
            Return BrancheComboBox.Text
        End Get
        Set(value As String)
            BrancheComboBox.Text = value
        End Set
    End Property

    Public Property Firma As String
        Get
            Return FirmaTextBox.Text
        End Get
        Set(value As String)
            FirmaTextBox.Text = value
        End Set
    End Property


    Public Property Briefanrede As String
        Get
            Return BriefanredeComboBox.Text
        End Get
        Set(value As String)
            BriefanredeComboBox.Text = value
        End Set
    End Property


    Public Property Anrede As String
        Get
            Return AnredeComboBox.Text
        End Get
        Set(value As String)
            AnredeComboBox.Text = value
        End Set
    End Property


    Public Property Titel As String
        Get
            Return TitelComboBox.Text
        End Get
        Set(value As String)
            TitelComboBox.Text = value
        End Set
    End Property

    Public Property NameFamilie As String
        Get
            Return NameTextBox.Text
        End Get
        Set(value As String)
            NameTextBox.Text = value
        End Set
    End Property

    Public Property Vorname As String
        Get
            Return VornameTextBox.Text
        End Get
        Set(value As String)
            VornameTextBox.Text = value
        End Set
    End Property

    Public Property Name1 As String
        Get
            Return Name1TextBox.Text
        End Get
        Set(value As String)
            Name1TextBox.Text = value
        End Set
    End Property



#End Region

    Private Sub Kunden_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try

            'Branche 
            FillComboBox(Me.BrancheComboBox, "select BrNr, Bezeichnung from grBranchen   order by Bezeichnung", "Bezeichnung", "BrNr")
            'Title
            FillComboBox(Me.TitelComboBox, "select Titel from ofAdressen group by Titel order by Titel", "Titel", "Titel")
            'anrede 
            FillComboBox(Me.AnredeComboBox, "select Anrede from grAnrede group by Anrede order by Anrede", "Anrede", "Anrede")
            'Briefanrede 
            FillComboBox(Me.BriefanredeComboBox, "select Briefanrede from grAnrede group by Briefanrede order by Briefanrede", "Briefanrede", "Briefanrede")
            'Satus 
            FillComboBox(Me.StatusComboBox, "select Status from ofAdressen group by Status order by Status", "Status", "Status")

            Me.GrlandTableAdapter.FillBy(Me.DsPLZ.grland)
            Me.GrLandPlzTableAdapter.Fill(Me.DsPLZ.grLandPlz)

            Me.OfAdressenTableAdapter.Fill(Me.DataSetKunden.ofadressen)

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    Private Sub ButtonPLZSelect_Click(sender As System.Object, e As System.EventArgs) Handles ButtonPLZSelect.Click
        Try
            Dim plz As PLZSelector = New PLZSelector
            plz.Ort = Me.OrtComboBox
            plz.PLZ = Me.PLZComboBox
            plz.Land = Me.LandComboBox
            plz.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub



    Private Sub PLZComboBox_Validating(sender As System.Object, e As System.ComponentModel.CancelEventArgs) Handles PLZComboBox.Validating
        Try
            Me.OrtComboBox.Text = firstRow("select Ort from grPLZ where PLZ ='" & PLZComboBox.Text & "'")
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub OrtComboBox_Validating(sender As System.Object, e As System.ComponentModel.CancelEventArgs) Handles OrtComboBox.Validating
        Try
            'Enter new PLZ + Ort if not Existing 
            Dim newValue As String = IntraSellKunden.getPLZCreateIfNeeded(Me.LandComboBox.SelectedValue, Me.OrtComboBox.Text, Me.PLZComboBox.Text)
            Me.GrLandPlzTableAdapter.Fill(Me.DsPLZ.grLandPlz)
            Me.PLZComboBox.SelectedValue = newValue

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

End Class
