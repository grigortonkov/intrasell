Imports IntraSell_Net

Public Class IntraSellConn
    Public client

    Sub OpenConn()
        Dim ta As dsAdressenTableAdapters.ofadressenTableAdapter = New dsAdressenTableAdapters.ofadressenTableAdapter
        Dim data As dsAdressen.ofadressenDataTable = New dsAdressen.ofadressenDataTable
        ta.Fill(data)
    End Sub

    Sub CloseConn()

    End Sub

End Class
