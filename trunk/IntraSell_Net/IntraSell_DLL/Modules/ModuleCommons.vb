Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient
Imports System.Windows.Forms

Public Module ModuleCommons
  
    Public appPath As String = Nothing 'Set by UnitTests 

    'Return current Applikation Path for Exe, IntraSell
    Function GetAppPath(Optional exeFilename As String = "IntraSell_Net.exe") As String
        If appPath Is Nothing Then
            If Not Application.ExecutablePath.ToLower().Contains("IntraSell_Net.exe".ToLower()) Then
                Throw New Exception("If you run from different Application, please set ModuleCommons.appPath to your Path." & vbCrLf & _
                                    "Current path:" + Application.ExecutablePath)
            End If
            Return Application.ExecutablePath.ToLower().Replace(exeFilename.ToLower(), "")
        Else
            Return appPath
        End If
    End Function


    'Proxy Function openRecordset  for easy conversion of old Access Code
    Public Function openRecordset(ByVal sql As String) As MySqlDataReader
        FixAccessSQL(CurrentDB.ConnectionString, sql)

        'writeLog("openRecordset for sql:" + sql)
        If Not CurrentDB.State = ConnectionState.Open Then
            CurrentDB.Open()
        End If

        Dim d As New MySqlCommand(sql, CurrentDB)
        Return d.ExecuteReader()

    End Function

    Public Function openRecordsetInMemory(ByVal sql As String) As DataTable
        FixAccessSQL(CurrentDB.ConnectionString, sql)

        'writeLog("openRecordset for sql:" + sql)
        If Not CurrentDB.State = ConnectionState.Open Then
            CurrentDB.Open()
        End If

        Dim d As New MySqlCommand(sql, CurrentDB)
        Dim da As New MySqlDataAdapter(d)
        Dim ds As DataSet = New DataSet("t")
        da.Fill(ds, "t")
        Return ds.Tables("t")
    End Function


    'Proxy Function RunSQL  for easy conversion of old Access Code
    Function RunSQL(ByVal sql As String) As Object
        writeLog("RunSQL for sql:" + sql)
        FixAccessSQL(CurrentDB.ConnectionString, sql)
        Dim d As New MySqlCommand(sql, CurrentDB)
        Return d.ExecuteScalar()

    End Function



    'New Function openDataTable  for easy conversion of old Access Code
    Function OpenDataTable(ByVal sql As String) As DataTable
        writeLog("openDataTable for sql:" + sql)
        FixAccessSQL(CurrentDB.ConnectionString, sql)
        Dim da As New MySqlDataAdapter(sql, CurrentDB)
        Dim ds As New DataSet
        Dim rs As DataTable
        da.Fill(ds, "t")
        rs = ds.Tables("t")
        Return rs

    End Function

    'Fills one combo or list with result from query 
    Public Sub FillComboBox(ByRef combo As ListControl, ByRef query As String, ByRef displayMember As String, Optional valueMember As String = Nothing)
        Try

            Dim strSQL As String = query '"SELECT * FROM Disk"
            Dim da As New MySqlDataAdapter(strSQL, CurrentDB)
            Dim ds As New DataSet
            da.Fill(ds, "t")
            'clear all items first 
            'If Not combo.DataSource Is Nothing Then
            '    combo.DataSource = Nothing
            'End If
            With combo
                .DataSource = ds.Tables("t")
                .DisplayMember = displayMember '"Disk_Name"
                If valueMember Is Nothing Then
                    .ValueMember = displayMember '"Disk_Key"
                Else
                    .ValueMember = valueMember '"Disk_Key"
                End If

                .SelectedIndex = -1
            End With

        Catch ex As Exception
            Debug.Write("Fehler in FillComboBox: " & ex.Message)
        End Try

    End Sub


    Public Sub FillComboBoxInDG(ByRef combo As DataGridViewComboBoxColumn, ByRef query As String, ByRef displayMember As String, Optional valueMember As String = Nothing)
        Try

            Dim strSQL As String = query
            Dim da As New MySqlDataAdapter(strSQL, CurrentDB)
            Dim ds As New DataSet
            da.Fill(ds, "t")
            'clear all items first 
            'If Not combo.DataSource Is Nothing Then
            '    combo.DataSource = Nothing
            'End If
            With combo
                .DataSource = ds.Tables("t")
                .DisplayMember = displayMember '"Disk_Name"
                If valueMember Is Nothing Then
                    .ValueMember = displayMember '"Disk_Key"
                Else
                    .ValueMember = valueMember '"Disk_Key"
                End If

                '.SelectedIndex = -1
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
        Return Nothing
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
