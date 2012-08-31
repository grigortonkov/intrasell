Partial Class dsVorgaenge
 

    Partial Class _buchvorgang_artikelDataTable

        Private Sub _buchvorgang_artikelDataTable_ColumnChanging(sender As System.Object, e As System.Data.DataColumnChangeEventArgs) Handles Me.ColumnChanging
            If (e.Column.ColumnName = Me.ErstelltAmColumn.ColumnName) Then
                'Add user code here
            End If
        End Sub

    End Class

End Class
