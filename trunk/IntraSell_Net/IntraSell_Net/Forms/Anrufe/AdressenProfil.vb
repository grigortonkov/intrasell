Imports IntraSell_DLL
Imports IntraSell_Net.dsAdressenProfil
Imports MySql.Data.MySqlClient

Public Class AdressenProfil
    Private loaded As Boolean = False
    Private _IDNR As Integer
    'Dim PROFIL_EINZEHLHANDEL As String = "Sperrtag;Öffnungszeiten;Wasser;Strom;Anzahl EKW;Intervall;Turnus;LDF;Letzte Umsatz; Höchsts Umsatz;EK Sucht;EKW Verkauft;Stück;GS Länge;Name;Münzautomat;Hersteller;Raddurchmesser(mm);Marke;Nr;Liter;Farbe;Baujahr;Plastikfarbe;"
    Public Property IDNR() As Integer
        Get
            Return _IDNR
        End Get
        Set(ByVal value As Integer)
            _IDNR = value
            Me.Ofadressen_profilTableAdapter.Fill(Me.DsAdressenProfil._ofadressen_profil, _IDNR)
        End Set
    End Property

    Public Sub UpdateAll()
        Ofadressen_profilBindingNavigatorSaveItem_Click(Nothing, Nothing)
    End Sub


    Private Sub Ofadressen_profilBindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Ofadressen_profilBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.Ofadressen_profilBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsAdressenProfil)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub AdressenProfil_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        FillComboBox(Me.ComboBox1, "SELECT BrNr, Bezeichnung from grBranchen order by Bezeichnung", "Bezeichnung", "BrNR")
        loaded = True
    End Sub


    Private Sub ComboBox1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ComboBox1.SelectedValueChanged
        Try
            If Not loaded Then Exit Sub
            'PROFIL_EINZEHLHANDEL = VarValue_Default("PROFIL_EINZEHLHANDEL", PROFIL_EINZEHLHANDEL)
            Dim sql As String = "select Keyword, DefaultValue from grbranchenkeywords where brNr=" & ComboBox1.SelectedValue & " order by Id"
            Dim nextID1 As Integer = nextId("`ofAdressen-Profil`", "ID")
            Dim rs As MySqlDataReader = openRecordset(sql)

            While rs.Read
                Dim eigenschaft As String = rs("Keyword")

                'For Each eigenschaft As String In Split(PROFIL_EINZEHLHANDEL, ";")
                Dim row As _ofadressen_profilRow = DsAdressenProfil._ofadressen_profil.New_ofadressen_profilRow()
                row.ID = nextID1
                row.IDNR = _IDNR
                row.Name = rs("Keyword")
                If Not IsDBNull(rs("DefaultValue")) Then row.Wert = rs("DefaultValue")
                row.AngelegtAm = DateTime.Now
                nextID1 = nextID1 + 1
                DsAdressenProfil._ofadressen_profil.Add_ofadressen_profilRow(row)
            End While
            rs.Close()

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class