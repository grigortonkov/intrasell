Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient
Imports IntraSell_DLL

Module Functions


    Public Function ConnStringIntraSellData() As String
        Dim dbType As String : dbType = VarValue("DBTYPE")

        If UCase(dbType) = "ACCESS" Then
            Return "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & VarValue("DB_DATA_FILENAME") & ";"
        Else 'ODBC COnnection
            Return VarValue("DB_CONN_STRING")
        End If
    End Function


    'Problem: Access round is making round to even (not to the bigger)
    'This fuction makes to proper rounding
    'Example Format(1312.545,"#.00")
    ' is different than RoundUp(1312.545,2)

    Public Function RoundUp(ByVal what As Double, Optional Position As Integer = 0) As String

        Dim formatExpression As String = Left("0000000000", Position)
        formatExpression = "#." & formatExpression
        RoundUp = Format(what, formatExpression)

    End Function


    Public Function makeSQLDate(ByVal dat As Date) As String
        makeSQLDate = "#" & Month(dat) & "/" & Microsoft.VisualBasic.Day(dat) & "/" & Year(dat) & "#"
    End Function


    Public Function toSQLDate(da As Date) As String
        toSQLDate = "#" & Month(da) & "/" & Microsoft.VisualBasic.Day(da) & "/" & Year(da) & "#"
    End Function



    'converts the string to date for sorting in the mask
    Public Function toDateFormat(ByVal dateString As String) As Date
        toDateFormat = #1/1/1980#

        If dateString & "" <> "" Then
            toDateFormat = CDate(dateString)
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


    ''Takes the current app folder
    Public Function AppFolder() As String
        Return GetAppPath()
    End Function
    Public Function DbFolder() As String
        Return GetAppPath()
    End Function

    Public Function replaceString(ByVal expression As String, ByVal searchString As String, ByVal replacement As String) As String
        replaceString = Replace(expression, searchString, replacement)
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

    'Prüft ob ein Formular offen ist oder nicht
    Function isFormOpenByCaption(ByVal formCaption As String) As Boolean
        isFormOpenByCaption = False
        Dim i As Integer
        For i = 1 To Main.MdiChildren.Count
            If formCaption = Main.MdiChildren(i - 1).Text Then
                Return True
            End If
        Next
    End Function

    'Prüft ob ein Formular offen ist oder nicht
    Function getFormByCaption(ByVal formCaption As String) As Form

        Dim i As Integer
        For i = 1 To Main.MdiChildren.Count
            If formCaption = Main.MdiChildren(i - 1).Text Then
                getFormByCaption = Main.MdiChildren(i - 1)
                Exit Function
            End If
        Next

        getFormByCaption = Nothing
    End Function



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



