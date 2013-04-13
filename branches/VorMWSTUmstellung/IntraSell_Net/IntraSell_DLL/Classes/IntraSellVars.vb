Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient
Public Class IntraSellVars

    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    Public CurrentDB As MySqlConnection

    Public Sub init(ByVal connString As String)
        If Not FunctionsDB.CurrentDB.State = ConnectionState.Open Then
            FunctionsDB.CurrentDB.ConnectionString = connString '"driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & databasePath & ";"
            FunctionsDB.connOpen()
        End If
    End Sub

    Public Sub destroy()
        functionsDB.connClose()
    End Sub


    Public Function varValue(varName As String) As String
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
    Public Function SetVarValue(ByVal varName As String, ByVal varValue As Object) As String
        Return FunctionsVars.SetVarValue(varName, CStr(varValue))
    End Function



    'FÜGT EINE VARIABLE IN DIE VARS TABELLE EIN
    '********************************************************************
    Public Function InsertVarValue(ByVal varName As String, ByVal varValue As Object) As String
        Return FunctionsVars.InsertVarValue(varName, CStr(varValue))
    End Function


    Public Function UseEAN() As Boolean
        Return varValue("BenutzeEAN") = "TRUE"
    End Function

    Public Function firstRow(ByVal sql As String) As Object
        Return FunctionsVars.firstRow(sql)
    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN EINE TABELLE
    '********************************************************************
    Function TABLEVALUE(ByVal TableName As String, ByVal colname As String, ByVal varName As String, ByVal searchfield As String) As String
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
        Return FunctionsVars.nextId(TableName, FieldName, optionalWhere, concurencyCheck)
    End Function



End Class
