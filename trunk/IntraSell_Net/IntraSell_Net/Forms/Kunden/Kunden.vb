Imports IntraSell_DLL

Public Class Kunden

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

#Region "Events "

    Private Sub Kunden_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load


        Try
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
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    Private Sub BindingNavigatorAddNewItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        Try
            'Me.IDNRTextBox.Text = nextId("ofAdressen", "IDNR", , )
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

   

    'Save Data 
    Private Sub OfAdressenBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles OfAdressenBindingNavigatorSaveItem.Click

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

#End Region


End Class