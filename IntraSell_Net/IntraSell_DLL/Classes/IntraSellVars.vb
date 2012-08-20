Option Explicit On
Imports MySql.Data.MySqlClient
Public Class IntraSellVars

    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    Public CurrentDB As MySqlConnection

    Public Sub init(ByVal connString)
        functionsDB.ConnStringODBC = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
        functionsDB.connOpen()
        CurrentDB = functionsDB.CurrentDB
    End Sub

    Public Sub destroy()
        functionsDB.connClose()
    End Sub


    Public Function varValue(varName) As String
        'Dim rs As MySqlDataReader
        'rs = New MySqlDataReader
        'rs.Open("SELECT * FROM ofVars WHERE Name='" & varName & "'", CurrentDB)
        'If rs.EOF Then
        '    MsgBox("Fehler: Die Variable " & varName & " ist nicht vorhanden!")
        'Else
        '    varValue = rs.Fields("Wert")
        'End If
        Return FunctionsVars.VarValue(varName)
    End Function


    '********************************************************************
    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    '********************************************************************
    Public Function ExistsVarValue(ByVal varName As String) As Boolean
        ''response.write varname
        'Dim SQLString, rs As Recordset
        'SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
        'rs = CurrentDB.openRecordset(SQLString, dbOpenDynaset, dbSeeChanges)
        'EXISTSVARVALUE = Not rs.EOF
        'rs.Close()

        Return FunctionsVars.ExistsVarValue(varName)
    End Function


    '********************************************************************
    'AKTUALISIERT EINE VARIABLE IN DIE VARS TABELLE
    '********************************************************************
    Public Function SetVarValue(ByVal varName As String, ByVal varValue As Object)
        'Dim SQLString As String
        'SQLString = "UPDATE ofVars Set Wert = '" & varValue & "' WHERE Name='" & varName & "'"
        'CurrentDB.Execute(SQLString)
        'SETVARVALUE = varValue
        Return FunctionsVars.SetVarValue(varName, varValue)
    End Function



    'FÜGT EINE VARIABLE IN DIE VARS TABELLE EIN
    '********************************************************************
    Public Function InsertVarValue(ByVal varName As String, ByVal varValue As Object)
        ''DoCmd.SetWarnings False
        'Dim SQLString As String
        'SQLString = "INSERT INTO ofVars (Id, Name, Wert) VALUES (" & nextId("ofVars", "ID", , False) & ", '" & varName & "', '" & varValue & "')"
        'CurrentDB.Execute(SQLString)
        'INSERTVARVALUE = varValue
        ''DoCmd.SetWarnings True
        Return FunctionsVars.InsertVarValue(varName, varValue)
    End Function


    Public Function UseEAN() As Boolean
        If varValue("BenutzeEAN") = "TRUE" Then
            UseEAN = True
        Else
            UseEAN = False
        End If
    End Function

    Public Function firstRow(ByVal sql As String)
        'Dim rs As Recordset
        'rs = New Recordset
        'rs.Open(sql, CurrentDB)

        'If rs.EOF Then
        '    firstRow = ""
        'Else
        '    firstRow = rs.Fields(0)
        'End If
        'rs.Close()

        Return FunctionsVars.firstRow(sql)

    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN EINE TABELLE
    '********************************************************************
    Function TABLEVALUE(ByVal TableName, ByVal colname, ByVal varName, ByVal searchfield)
        'On Error Resume Next
        'Dim rs
        'If Trim(TableName & "") = "" Or Trim(colname & "") = "" Or Trim(varName & "") = "" Or Trim(searchfield & "") = "" Then
        '    TABLEVALUE = "Wrong usage! Die Variable " & varName & " ist nicht vorhanden!"
        '    Exit Function
        'End If
        'Dim SQLString
        'SQLString = "SELECT * FROM " & TableName & " WHERE " & colname & "=" & varName
        'rs = CurrentDB.openRecordset(SQLString)
        'If rs.EOF Then
        '    TABLEVALUE = "Die Variable " & varName & " ist nicht vorhanden!"
        'Else
        '    TABLEVALUE = rs(searchfield)
        'End If
        'rs.Close()
        Return FunctionsVars.TableValue(TableName, colname, varName, searchfield)
    End Function

    'Hauptfolder der IntraSell Daten Datei, auch für die Vorlagen interessasnt
    Function dbFolder() As String
        dbFolder = varValue("DB_FOLDER")
    End Function


    '********************************************************************
    ' generates nextId from Table and FieldName
    ' fileNames - array with filenames(normaly in the user's folder), if empty will be created an empty document
    ' return value is the new documentId
    '********************************************************************
    'returns the next value from the table and field
    'Update for MxSQL to get not duplicate KEY
    Public Function nextId(ByVal TableName As String, ByVal FieldName As String, Optional optionalWhere As String = "", Optional concurencyCheck As Boolean = True) As Long

        'Dim rs
        'Dim sql As String
        'Dim nID As Long

        'sql = "select  1+ max(" & FieldName & ") as m  from " & TableName
        'If optionalWhere <> "" Then sql = sql + " where " & optionalWhere

        'rs = CurrentDB.openRecordset(sql)
        'nID = 1
        'If Not rs.EOF Then
        '    If Not IsNull(rs("m")) Then
        '        nID = CLng(rs("m"))
        '        If Err.Number > 0 Then
        '            nID = 1
        '            'Exit Function
        '        End If
        '    Else 'is null
        '        nID = 1
        '    End If
        'End If
        'If concurencyCheck Then
        '    'check that do not colides with last called varvalues
        '    Dim varName As String : varName = "letzteNummer_" & TableName

        '    If Not EXISTSVARVALUE(varName) Then
        '        Call INSERTVARVALUE(varName, nID)
        '    Else
        '        If varValue(varName) = nID Then
        '            nID = nID + 1 'use next because other user has already used this ID
        '        End If

        '        Call SETVARVALUE(varName, nID)
        '    End If
        'End If
        'nextId = nID
        Return FunctionsVars.nextId(TableName, FieldName, optionalWhere, concurencyCheck)
    End Function



End Class
