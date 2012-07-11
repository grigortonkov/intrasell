﻿Public Class Kunden


    Private Sub Rebind()
        'try to bind comboboxes 
        Me.FKofAdressenofadressensettingsBindingSource.ResetItem(0)
    End Sub

#Region "Events "

    Private Sub Kunden_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
          Try
            Me.OfAdressenTableAdapter.Fill(Me.DataSetKunden.ofadressen)
            Me.Ofadressen_settingsTableAdapter.Fill(Me.DataSetKunden._ofadressen_settings)
            Me.PreislistenTableAdapter.Fill(Me.DataSetKunden.Preislisten)
            Me.KundengruppenTableAdapter.Fill(Me.DataSetKunden.Kundengruppen)
            Me.GrLandPlzTableAdapter.Fill(Me.DsPLZ.grLandPlz)
            Rebind()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

    'Save Data 
    Private Sub BindingNavigatorSaveItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BindingNavigatorSaveItem.Click
        Try
            Me.Validate()

            Me.Ofadressen_settingsBindingSource.EndEdit()
            Me.ofAdressenBindingSource.EndEdit()
            Me.FKofAdressenofadressensettingsBindingSource.EndEdit()

            Me.OfAdressenTableAdapter.Update(Me.DataSetKunden)
            Me.Ofadressen_settingsTableAdapter.Update(Me.DataSetKunden)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub


    Private Sub btnPLZ_Click(sender As System.Object, e As System.EventArgs) Handles btnPLZ.Click
        Try
            Dim plz As PLZSelector = New PLZSelector
            plz.txtOrt = Me.txtOrt
            plz.txtPLZ = Me.txtPLZ
            plz.txtLand = Me.txtland
            plz.ShowDialog()
        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub

#End Region

    Private Sub cbPreisliste_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbPreisliste.SelectedIndexChanged

    End Sub

    Private Sub cbKundengruppe_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles cbKundengruppe.SelectedIndexChanged

    End Sub

    Private Sub FillToolStripButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FillToolStripButton.Click
        Try
            Me.GrLandPlzTableAdapter.Fill(Me.DsPLZ.grLandPlz)
        Catch ex As System.Exception
            System.Windows.Forms.MessageBox.Show(ex.Message)
        End Try

    End Sub
End Class