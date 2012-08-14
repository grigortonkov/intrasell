Imports MySql.Data.MySqlClient

Module FunctionsVars

    Public Const NOT_AVAILABLE = "n/a"

    '    Private Sub TEST()
    '        Dim s As IntraSellVars
    '        s = New IntraSellVars
    '        s.Init(ConnStringIntraSellData)
    '        MsgBox(s.varValue("DOMAIN"))
    '    End Sub

    '********************************************************************
    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    '********************************************************************
    Public Function varValue(ByVal varName As String) As Object
        'response.write varname
        Dim SQLString As String, rs As MySqlDataReader
        SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
        rs = openRecordset(SQLString)
        If Not rs.Read Then
            MsgBox("Die Variable " & varName & " ist nicht vorhanden!", MsgBoxStyle.Exclamation)
            varValue = Nothing
        Else
            varValue = rs.GetString("Wert")
        End If
        rs.Close()
    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    '********************************************************************
    Public Function EXISTSVARVALUE(ByVal varName As String) As Boolean
        'response.write varname
        Dim SQLString As String
        Dim rs As MySqlDataReader
        SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
        rs = openRecordset(SQLString)
        EXISTSVARVALUE = Not rs.Read
        rs.Close()
    End Function


    '********************************************************************
    'AKTUALISIERT EINE VARIABLE IN DIE VARS TABELLE
    '********************************************************************
    Public Function SETVARVALUE(ByVal varName As String, ByVal varValue As String)
        If Not EXISTSVARVALUE(varName) Then
            Call INSERTVARVALUE(varName, varValue)
            SETVARVALUE = varValue
            Exit Function
        End If

        Dim SQLString As String
        SQLString = "UPDATE ofVars Set Wert = '" & varValue & "' WHERE Name='" & varName & "'"
        RunSQL(SQLString)
        SETVARVALUE = varValue

    End Function


    '********************************************************************
    'FÜGT EINE VARIABLE IN DIE VARS TABELLE EIN
    '********************************************************************
    Public Function INSERTVARVALUE(ByVal varName As String, ByVal varValue As String)

        Dim SQLString As String
        SQLString = "INSERT INTO ofVars (Id, Name, Wert) VALUES (" & nextId("ofVars", "ID", , False) & ", '" & varName & "', '" & varValue & "')"
        RunSQL(SQLString)
        INSERTVARVALUE = varValue

    End Function


    '********************************************************************
    'SUCHT EINE VAR OR INSERT/AKTUALISIERT IN DIE VARS TABELLE
    '********************************************************************
    Public Function VARVALUE_DEFAULT(ByVal varName As String, ByVal defaultValue As String)

        If Not EXISTSVARVALUE(varName) Then 'existiert nicht
            SETVARVALUE(varName, defaultValue)
            VARVALUE_DEFAULT = defaultValue
        Else
            VARVALUE_DEFAULT = varValue(varName)
        End If

    End Function

    Public Function UseEAN() As Boolean
        If varValue("BenutzeEAN") = "TRUE" Then
            UseEAN = True
        Else
            UseEAN = False
        End If
    End Function

    'Public Function getRS()
    '    DoCmd.OpenReport(varValue("MSACCESS_VORGANG_BERICHTNAME"), acViewPreview)
    'End Function


    Public Function firstRow(ByVal SQLString As String)

        firstRow = NOT_AVAILABLE 'N/A String

        Dim rs

        On Error Resume Next
        rs = openRecordset(SQLString)
        ' On Error GoTo 0
        If err.Number > 0 Then
            'MsgBox err.Description
            Debug.Print("Error in functionsVars:firstrow; SQLString = " & SQLString & err.Description)
            err.Clear()
            On Error GoTo 0
            Exit Function
        End If

        On Error GoTo 0
        If rs.EOF Then
            firstRow = ""
        Else
            firstRow = rs.Fields(0)
        End If
        rs.Close()
    End Function


    '********************************************************************
    'SUCHT EINE VARIABLE IN EINE TABELLE
    '********************************************************************
    Public Function TABLEVALUE(ByVal TableName As String, ByVal colName As String, ByVal varValue As String, ByVal searchField As String)

        Dim rs
        If Trim(TableName & "") = "" Or Trim(colName & "") = "" Or Trim(varValue & "") = "" Or Trim(searchField & "") = "" Then
            TABLEVALUE = "Wrong usage! Die Variable " & varValue & " ist nicht vorhanden!"
            Exit Function
        End If

        Dim SQLString As String
        SQLString = "SELECT * FROM " & TableName & " WHERE " & colName & "=" & varValue
        rs = openRecordset(SQLString)
        If rs.EOF Then
            TABLEVALUE = "Die Variable [" & varValue & "] ist nicht vorhanden!"
        Else
            TABLEVALUE = rs(searchField)
        End If
        rs.Close()
    End Function



End Module
