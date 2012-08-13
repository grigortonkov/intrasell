Public Class Vorgang

    'Die Datensätze filtern
    Public Sub FilterBy(Expression As String)
        Try
            Me.BuchvorgangBindingSource.Filter = Expression
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub
    Private Sub BuchvorgangBindingNavigatorSaveItem_Click(sender As System.Object, e As System.EventArgs) Handles BuchvorgangBindingNavigatorSaveItem.Click
        Try
            Me.Validate()
            Me.BuchvorgangBindingSource.EndEdit()
            Me.Buchvorgang_artikelBindingSource.EndEdit()
            Me.TableAdapterManager.UpdateAll(Me.DsVorgaenge)
        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub

    Private Sub Rechnung_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        Try

            Me.BuchvorgangTableAdapter.Fill(Me.DsVorgaenge.buchvorgang)
            Me.Buchvorgang_artikelTableAdapter.Fill(Me.DsVorgaenge._buchvorgang_artikel)

            FillComboBox(Me.StatusComboBox, "select Status from buchVorgaengeStatus Group by Status", "Status")
            FillComboBox(Me.TypComboBox, "SELECT Typ, Bezeichnung FROM buchVorgangTyp ORDER By Bezeichnung", "Bezeichnung", "Typ")

            FillComboBox(Me.ZahlungsMethodeComboBox, "SELECT Methode FROM `ofAdressen-Zahlungsmethoden` WHERE IdNr in (select idnr from buchVorgang where nummer = " & Me.NummerTextBox.Text & ") ORDER BY Methode", "Methode")
            FillComboBox(Me.ZahlungsbedungungComboBox, "SELECT Methode FROM `ofAdressen-Zahlungsbedingungen` INNER JOIN grZahlungsbedingung ON  Bedingung = Nr " & _
                  " WHERE IdNr in (select idnr from buchVorgang where nummer = " & Me.NummerTextBox.Text & ") GROUP BY Methode", "Methode")
            FillComboBox(Me.TransportMethodeComboBox, "SELECT Methode FROM `ofAdressen-Transportmethoden` WHERE IdNr in (select idnr from buchVorgang where nummer = " & Me.NummerTextBox.Text & ") ORDER BY Methode", "Methode")

        Catch ex As Exception
            HandleAppError(ex)
        End Try

    End Sub



    Private Sub BindingNavigatorAddNewItem_Click(sender As System.Object, e As System.EventArgs) Handles BindingNavigatorAddNewItem.Click
        'neuen vorgang erstellen

    End Sub
 
End Class