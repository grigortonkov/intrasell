Partial Class dsEinstellungen
    Partial Class ofvarsDataTable

        Private Sub ofvarsDataTable_ofvarsRowChanging(sender As System.Object, e As ofvarsRowChangeEvent) Handles Me.ofvarsRowChanging

        End Sub

        Function ToBooleanString(ByRef w As Boolean) As String
            If w = "True" Then Return "True"
            If w = "Fasle" Then Return "False"
            Return "Null"
        End Function
    End Class

End Class
