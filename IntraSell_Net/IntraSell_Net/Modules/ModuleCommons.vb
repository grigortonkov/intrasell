
Imports MySql.Data.MySqlClient

Module ModuleCommons
    'Fills one combo with result from query 
    Sub FillComboBox(ByRef combo As ComboBox, ByRef query As String, ByRef displayMember As String, Optional valueMember As String = Nothing)
        Dim conn As New MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)

        Dim strSQL As String = query '"SELECT * FROM Disk"
        Dim da As New MySqlDataAdapter(strSQL, conn)
        Dim ds As New DataSet
        da.Fill(ds, "t")

        With combo
            .DataSource = ds.Tables("t")
            .DisplayMember = displayMember '"Disk_Name"
            If valueMember Is Nothing Then
                .ValueMember = displayMember '"Disk_Key"
            Else
                .ValueMember = valueMember '"Disk_Key"
            End If

            .SelectedIndex = 0
        End With
    End Sub
End Module
