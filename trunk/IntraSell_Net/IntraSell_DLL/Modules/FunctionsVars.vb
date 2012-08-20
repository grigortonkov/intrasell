Imports MySql.Data.MySqlClient

Public Module FunctionsVars

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
    Public Function VarValue(ByVal varName As String) As Object
        'response.write varname
        Dim SQLString As String, rs As MySqlDataReader
        SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
        rs = openRecordset(SQLString)
        If Not rs.Read Then
            MsgBox("Die Variable " & varName & " ist nicht vorhanden!", MsgBoxStyle.Exclamation)
            VarValue = Nothing
        Else
            VarValue = rs.GetString("Wert")
        End If
        rs.Close()
    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    '********************************************************************
    Public Function ExistsVarValue(ByVal varName As String) As Boolean
        'response.write varname
        Dim SQLString As String
        Dim rs As MySqlDataReader
        SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
        rs = openRecordset(SQLString)
        ExistsVarValue = rs.Read
        rs.Close()
    End Function


    '********************************************************************
    'AKTUALISIERT EINE VARIABLE IN DIE VARS TABELLE
    '********************************************************************
    Public Function SetVarValue(ByVal varName As String, ByVal varValue As String)
        If Not ExistsVarValue(varName) Then
            Call InsertVarValue(varName, varValue)
            SetVarValue = varValue
            Exit Function
        End If

        Dim SQLString As String
        SQLString = "UPDATE ofVars Set Wert = '" & varValue & "' WHERE Name='" & varName & "'"
        RunSQL(SQLString)
        SetVarValue = varValue

    End Function


    '********************************************************************
    'FÜGT EINE VARIABLE IN DIE VARS TABELLE EIN
    '********************************************************************
    Public Function InsertVarValue(ByVal varName As String, ByVal varValue As String)

        Dim SQLString As String
        SQLString = "INSERT INTO ofVars (Id, Name, Wert) VALUES (" & nextId("ofVars", "ID", , False) & ", '" & varName & "', '" & varValue & "')"
        RunSQL(SQLString)
        InsertVarValue = varValue

    End Function


    '********************************************************************
    'SUCHT EINE VAR OR INSERT/AKTUALISIERT IN DIE VARS TABELLE
    '********************************************************************
    Public Function VarValue_Default(ByVal varName As String, ByVal defaultValue As String)

        If Not ExistsVarValue(varName) Then 'existiert nicht
            SetVarValue(varName, defaultValue)
            VarValue_Default = defaultValue
        Else
            VarValue_Default = VarValue(varName)
        End If

    End Function

    Public Function UseEAN() As Boolean
        If VarValue("BenutzeEAN") = "TRUE" Then
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

        rs = openRecordset(SQLString)
        ' On Error GoTo 0
        If Err.Number > 0 Then
            'MsgBox err.Description
            Debug.Print("Error in functionsVars:firstrow; SQLString = " & SQLString & Err.Description)
            Err.Clear()
            On Error GoTo 0
            Exit Function
        End If


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
    Public Function TableValue(ByVal TableName As String, ByVal colName As String, ByVal varValue As String, ByVal searchField As String)

        Dim rs
        If Trim(TableName & "") = "" Or Trim(colName & "") = "" Or Trim(varValue & "") = "" Or Trim(searchField & "") = "" Then
            TableValue = "Wrong usage! Die Variable " & varValue & " ist nicht vorhanden!"
            Exit Function
        End If

        Dim SQLString As String
        SQLString = "SELECT * FROM " & TableName & " WHERE " & colName & "=" & varValue
        rs = openRecordset(SQLString)
        If rs.EOF Then
            TableValue = "Die Variable [" & varValue & "] ist nicht vorhanden!"
        Else
            TableValue = rs(searchField)
        End If
        rs.Close()
    End Function


    'returns the next value from the table and field
    'Update for MxSQL to get not duplicate KEY
    Public Function nextId(ByVal TableName As String, ByVal FieldName As String, Optional optionalWhere As String = "", Optional concurencyCheck As Boolean = True) As Long

        Dim rs As MySqlDataReader
        Dim sql As String
        Dim nID As Long

        sql = "select  1+ max(" & FieldName & ") as m  from " & TableName
        If optionalWhere <> "" Then sql = sql + " where " & optionalWhere

        rs = openRecordset(sql)
        nID = 1
        If rs.Read Then
            If Not IsNull(rs("m")) Then
                nID = CLng(rs("m"))
                If Err.Number > 0 Then
                    nID = 1
                    'Exit Function
                End If
            Else 'is null
                nID = 1
            End If
        End If
        If concurencyCheck Then
            'check that do not colides with last called varvalues
            Dim varName As String : varName = "letzteNummer_" & TableName

            If Not ExistsVarValue(varName) Then
                Call InsertVarValue(varName, nID)
            Else
                If VarValue(varName) = nID Then
                    nID = nID + 1 'use next because other user has already used this ID
                End If

                Call SetVarValue(varName, nID)
            End If
        End If
        nextId = nID
        rs.Close()
    End Function

End Module
