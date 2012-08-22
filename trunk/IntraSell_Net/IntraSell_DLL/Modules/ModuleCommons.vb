
Imports MySql.Data.MySqlClient
Imports System.Windows.Forms

Public Module ModuleCommons
    'should be initilized by calling application. E.g.: 
    'ModuleCommons.conn = new  MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
    Public conn As New MySqlConnection ' (Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)

    'Return current Applikation Path for Exe, IntraSell
    Function GetAppPath(Optional exeFilename As String = "IntraSell_Net.EXE") As String
        Return Application.ExecutablePath.Replace(exeFilename, "")
    End Function


    'Proxy Function openRecordset  for easy conversion of old Access Code
    Public Function openRecordset(ByVal sql As String) As MySqlDataReader
        'writeLog("openRecordset for sql:" + sql)
        If Not conn.State = ConnectionState.Open Then
            conn.Open()
        End If

        Dim d As New MySqlCommand(sql, conn)
        Return d.ExecuteReader()

    End Function

    'Proxy Function RunSQL  for easy conversion of old Access Code
    Function RunSQL(ByVal sql As String) As Object
        writeLog("RunSQL for sql:" + sql)
        Dim d As New MySqlCommand(sql, conn)
        Return d.ExecuteScalar()

    End Function

    'Proxy Function IsNull for easy conversion of old VB 6 Code
    Function IsNull(ByRef any As VariantType) As Boolean
        Return IsNothing(any)
    End Function


    'New Function openDataTable  for easy conversion of old Access Code
    Function OpenDataTable(ByVal sql As String) As DataTable
        writeLog("openDataTable for sql:" + sql)
        Dim da As New MySqlDataAdapter(sql, conn)
        Dim ds As New DataSet
        Dim rs As DataTable
        da.Fill(ds, "t")
        rs = ds.Tables("t")
        Return rs

    End Function

    'Fills one combo with result from query 
    Public Sub FillComboBox(ByRef combo As ComboBox, ByRef query As String, ByRef displayMember As String, Optional valueMember As String = Nothing)
        Try


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

        Catch ex As Exception
            Debug.Write("Fehler in FillComboBox: " & ex.Message)
        End Try

    End Sub

    Sub OpenForm(ByRef formName As String)
        'TODO 
        writeLog("OpenForm für formName '" + formName + "' ist noch nicht implementiert!")
    End Sub

    'For MS Access easy conversion 
    Function Forms(ByRef formName As String) As Form
        'return the form by formName 
        writeLog("Forms(" + formName + ") Nicht implementiert!")
    End Function

    'Public Function testRS() As Object
    '    conn.Open()
    '    'response.write varname
    '    Dim SQLString As String, rs As MySqlDataReader
    '    SQLString = "SELECT Name, Wert FROM ofVars WHERE Name='ADMIN'"
    '    rs = openRecordset(SQLString)
    '    If rs.Read Then
    '        Return rs.GetString("Name")
    '    End If
    '    Return Nothing

    '    conn.Close()
    'End Function

End Module
