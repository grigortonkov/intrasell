Imports IntraSell_DLL

Public Class Kunden
    Implements InterfacePrintable

    'Die Datensätze filtern
    Public Sub FilterBy(Expression As String)
        Try
            Me.ofAdressenBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub Rebind()
        Try
            'try to bind comboboxes 
            Me.FKofAdressenofadressensettingsBindingSource.ResetItem(0)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Public Sub Print(ByVal sender As Object) Implements InterfacePrintable.Print
        'Start printing 
        'TODO IMPLEMENT OpenAusdruck_inWord_XML(Me.IDNRTextBox.Text, "Vorlagen/0. BRIEF.dot", "WORD", False, Nothing)
    End Sub

    Sub BeginNew()
        Try
            BindingNavigatorAddNewItem_Click(Nothing, Nothing)
            ofAdressenBindingSource.AddNew()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#Region "Events "

    Private Sub Kunden_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try
            Me.AdressenDetailControl1.Init()
            Me.GrbranchenTableAdapter.Fill(Me.DsBranchen.grbranchen)
            Me.BuchvorgangtypTableAdapter.Fill(Me.DsVorgaenge.buchvorgangtyp)
            Me.GrtransportmethodeTableAdapter.Fill(Me.DsStammdaten.grtransportmethode)
            Me.GrzahlungsbedingungTableAdapter.Fill(Me.DsStammdaten.grzahlungsbedingung)
            Me.GrzahlungsmethodeTableAdapter.Fill(Me.DsStammdaten.grzahlungsmethode)

            'Satus 
            FillComboBox(Me.StatusComboBox, "select Status from ofAdressen group by Status order by Status", "Status", "Status")

            Me.GrlandTableAdapter.FillBy(Me.DsPLZ.grland)
            Me.GrLandPlzTableAdapter.Fill(Me.DsPLZ.grLandPlz)

            Me.OfAdressenTableAdapter.Fill(Me.DataSetKunden.ofadressen)
            Me.Ofadressen_settingsTableAdapter.Fill(Me.DataSetKunden._ofadressen_settings)
            Me.PreislistenTableAdapter.Fill(Me.DataSetKunden.Preislisten)
            Me.KundengruppenTableAdapter.Fill(Me.DataSetKunden.Kundengruppen)

            Me.Ofadressen_weitereTableAdapter.Fill(Me.DataSetKunden._ofadressen_weitere)

            Me.Ofadressen_zahlungsmethodenTableAdapter.Fill(Me.DataSetKunden._ofadressen_zahlungsmethoden)
            Me.Ofadressen_zahlungsbedingungenTableAdapter.Fill(Me.DataSetKunden._ofadressen_zahlungsbedingungen)
            Me.Ofadressen_transportmethodenTableAdapter.Fill(Me.DataSetKunden._ofadressen_transportmethoden)

            Rebind()

            Me.ParentBindingNavigator.BindingSource = Me.ofAdressenBindingSource


            If BeginNewFlag Then
                BeginNew()
            End If

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#Region "New"

    Private Sub BindingNavigatorAddNewItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        Try
            AddingNewFlag = True
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BindingSource_CurrentChanged(ByVal sender As System.Object, _
                              ByVal e As System.EventArgs) _
                              Handles ofAdressenBindingSource.CurrentChanged
        Try

            If AddingNewFlag = True Then
                AddingNewFlag = False
                Me.AdressenDetailControl1.IDNRTextBox.Text = nextId("ofAdressen", "IDNR", , False)
                Exit Sub
            End If

            Dim cur = ofAdressenBindingSource.Current.Row.IDNR
            If IsNumeric(cur) Then ModuleGlobals.KundenIDNR = cur

        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

    'Save Data 
    Private Shadows Sub BindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles OfAdressenBindingNavigatorSaveItem.Click

        Try
            Me.Validate()

            Me.Ofadressen_settingsBindingSource.EndEdit()
            Me.ofAdressenBindingSource.EndEdit()
            Me.FKofAdressenofadressensettingsBindingSource.EndEdit()
            Me.Ofadressen_weitereBindingSource.EndEdit()
            Me.Ofadressen_zahlungsbedingungenBindingSource.EndEdit()
            Me.Ofadressen_zahlungsmethodenBindingSource.EndEdit()
            Me.Ofadressen_transportmethodenBindingSource.EndEdit()

            Me.OfAdressenTableAdapter.Update(Me.DataSetKunden)
            Me.Ofadressen_settingsTableAdapter.Update(Me.DataSetKunden)
            Me.Ofadressen_weitereTableAdapter.Update(Me.DataSetKunden)
            Me.Ofadressen_zahlungsbedingungenTableAdapter.Update(Me.DataSetKunden)
            Me.Ofadressen_zahlungsmethodenTableAdapter.Update(Me.DataSetKunden)
            Me.Ofadressen_transportmethodenTableAdapter.Update(Me.DataSetKunden)

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

#End Region

#Region "Vorgaenge"

    Private Sub AlteVorgängeToolStripMenuItem_Click(sender As System.Object, e As System.EventArgs) Handles AlteVorgängeToolStripMenuItem.Click
        Try
            VorgangListe.MdiParent = Main
            VorgangListe.Show()            'VorgangListe.Filter()
            'VorgangListe.AdressenControl1.IDNR = ModuleGlobals.KundenIDNR
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub NeuerVorgangToolStripMenuItem1_Click(sender As System.Object, e As System.EventArgs) Handles NeuerVorgangToolStripMenuItem1.Click
        Try
            Dim v As Vorgang = New Vorgang
            v.MdiParent = Main
            v.Show()
            v.BeginNew()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region

#Region "Settings"
    Private Sub cbPreisliste_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbPreisliste.GotFocus
        CreateNewSettingsCurrentRow()
    End Sub

    Private Sub cbKundengruppe_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbKundengruppe.GotFocus
        CreateNewSettingsCurrentRow()
    End Sub

    Private Sub Language_codeComboBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Language_codeComboBox.GotFocus
        CreateNewSettingsCurrentRow()
    End Sub

    Private Sub FirmenKontoIdTextBox_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FirmenKontoIdTextBox.GotFocus
        CreateNewSettingsCurrentRow()
    End Sub


    Sub CreateNewSettingsCurrentRow()
        Try
            'create settings datarow 
            If Me.FKofAdressenofadressensettingsBindingSource.Current Is Nothing Then
                Me.DataSetKunden._ofadressen_settings.Add_ofadressen_settingsRow(Me.ofAdressenBindingSource.Current.row, Nothing, Nothing, Nothing, Nothing)
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
#End Region


    Private Sub AdresseWeitereButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles AdresseWeitereButton.Click 
        Try
            Dim a As AdresseWeitere = New AdresseWeitere
            a.StarteNeueAdresse(IDNR:=AdressenDetailControl1.IDNR, VorgangTyp:="LI")
            a.ShowDialog()
            'refresh data 
            Me.Ofadressen_weitereTableAdapter.Fill(Me.DataSetKunden._ofadressen_weitere)
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class