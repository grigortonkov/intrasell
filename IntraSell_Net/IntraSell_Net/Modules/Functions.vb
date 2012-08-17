﻿Imports MySql.Data.MySqlClient
Module Functions


    Function GetAppPath() As String
        Return Application.ExecutablePath.Replace("IntraSell_Net.EXE", "")
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

            If Not EXISTSVARVALUE(varName) Then
                Call INSERTVARVALUE(varName, nID)
            Else
                If varValue(varName) = nID Then
                    nID = nID + 1 'use next because other user has already used this ID
                End If

                Call SETVARVALUE(varName, nID)
            End If
        End If
        nextId = nID
        rs.Close()
    End Function


    'Problem: Access round is making round to even (not to the bigger)
    'This fuction makes to proper rounding
    'Example Format(1312.545,"#.00")
    ' is different than RoundUp(1312.545,2)

    Public Function RoundUp(ByVal what As Double, Optional Position As Integer = 0) As Double

        Dim formatExpression As String : formatExpression = Left("0000000000", Position)
        formatExpression = "#." & formatExpression
        RoundUp = Format(what, formatExpression)

    End Function




    Public Function makeSQLDate(ByVal dat As Date)
        makeSQLDate = "#" & Month(dat) & "/" & Microsoft.VisualBasic.Day(dat) & "/" & Year(dat) & "#"
    End Function


    Public Function toSQLDate(da)
        toSQLDate = "#" & Month(da) & "/" & Microsoft.VisualBasic.Day(da) & "/" & Year(da) & "#"
    End Function



    'converts the string to date for sorting in the mask
    Public Function toDateFormat(ByVal dateString) As Date
        toDateFormat = #1/1/1980#

        If dateString & "" <> "" Then
            toDateFormat = dateString
        End If
    End Function



    'Public Function SaveCurrentRecord()
    '    On Error Resume Next
    '    DoCmd.DoMenuItem(acFormBar, acRecordsMenu, acSaveRecord, , acMenuVer70)

    '    If err.Number > 0 Then
    '        MsgBox(err.Description, vbCritical)
    '        err.Clear()
    '    End If

    '    On Error GoTo 0

    'End Function


    ''Takes the current db folder
    'Function dbFolder()
    '    Dim dbfol, i
    '    For i = 0 To UBound(Split(CurrentDb.Name, "\")) - 1
    '        dbfol = dbfol & Split(CurrentDb.Name, "\")(i) & "\"
    '    Next
    '    dbFolder = dbfol
    'End Function

    Public Function replaceString(ByVal expression As String, ByVal searchString As String, ByVal replacement As String) As String
        replaceString = Replace(expression, searchString, replacement)
    End Function

    Function splitString(ByVal expression)
        splitString = Split(expression)
    End Function

     


    ''Prüft ob ein Formular offen ist oder nicht
    'Function isFormOpen(ByVal formName As String) As Boolean
    '    isFormOpen = False
    '    Dim i As Integer
    '    For i = 1 To Forms.Count
    '        If formName = Forms(i - 1).Name Then
    '            isFormOpen = True
    '        End If
    '    Next
    'End Function

    'Function getFormByName(ByVal formName As String) As Form

    '    Dim i As Integer
    '    For i = 1 To Forms.Count
    '        If formName = Forms(i - 1).Name Then
    '            getFormByName = Forms(i - 1)
    '            Exit Function
    '        End If
    '    Next
    '    getFormByName = Nothing
    'End Function

    ''Prüft ob ein Formular offen ist oder nicht
    'Function isFormOpenByCaption(ByVal formCaption As String) As Boolean
    '    isFormOpenByCaption = False
    '    Dim i As Integer
    '    For i = 1 To Forms.Count
    '        If formCaption = Forms(i - 1).Caption Then
    '            isFormOpenByCaption = True
    '        End If
    '    Next
    'End Function

    ''Prüft ob ein Formular offen ist oder nicht
    'Function getFormByCaption(ByVal formCaption As String) As Form

    '    Dim i As Integer
    '    For i = 1 To Forms.Count
    '        If formCaption = Forms(i - 1).Caption Then
    '            getFormByCaption = Forms(i - 1)
    '            Exit Function
    '        End If
    '    Next

    '    getFormByCaption = Nothing
    'End Function



    'Public Function openRecordset(sql, something)

    '    If InStr(sql, "INSERT") > 0 Or InStr(sql, "UPDATE") > 0 Or InStr(sql, "DELETE") > 0 Then
    '        DoCmd.SetWarnings(False)
    '        DoCmd.RunSQL(sql)
    '        DoCmd.SetWarnings(True)
    '        Exit Function
    '    End If

    '    err.Clear()
    '    On Error Resume Next
    '    Dim rs1

    '    rs1 = CurrentDb.openRecordset(sql) ', dbOpenDynaset) ')
    '    If err.Number = 3622 Then 'use identity column for replicated sql tables::You must use the dbSeeChanges option with OpenRecordset when accessing a SQL Server table that has an IDENTITY column.
    '        rs1 = CurrentDb.openRecordset(sql, , dbSeeChanges)
    '    End If
    '    openRecordset = rs1
    '    On Error GoTo 0
    'End Function


End Module



