Partial Class dsAdressen
    Partial Class ofadressenDataTable

        Private Sub ofadressenDataTable_ofadressenRowChanging(sender As System.Object, e As ofadressenRowChangeEvent) Handles Me.ofadressenRowChanging

        End Sub

    End Class

    Partial Class ofAdressenlisteDataTable

        Private Sub ofAdressenlisteDataTable_ColumnChanging(sender As System.Object, e As System.Data.DataColumnChangeEventArgs) Handles Me.ColumnChanging
            If (e.Column.ColumnName = Me.LandColumn.ColumnName) Then
                'Add user code here
            End If

        End Sub

    End Class

End Class
