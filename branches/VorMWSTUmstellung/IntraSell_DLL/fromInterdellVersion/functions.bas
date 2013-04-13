Attribute VB_Name = "Functions"
Option Compare Database
Option Explicit
 
 
'=================================================================
'ALLGEMEINE FUNKTIONEN
'=================================================================

Public Function ConnStringIntraSellData()
  If UCase(varValue("DBTYPE")) = "ACCESS" Then
        ConnStringIntraSellData = "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & varValue("DB_DATA_FILENAME") & ";"
    Else
        ConnStringIntraSellData = varValue("DB_CONN_STRING")
    End If
End Function


Public Function makeSQLDate(ByVal dat As Date)
  makeSQLDate = "#" & Month(dat) & "/" & Day(dat) & "/" & Year(dat) & "#"
End Function


Public Function toSQLDate(da)
   toSQLDate = "#" & Month(da) & "/" & Day(da) & "/" & Year(da) & "#"
End Function



 'converts the string to date for sorting in the mask
Public Function toDateFormat(ByVal dateString) As Date
    toDateFormat = #1/1/1980#
    
    If dateString & "" <> "" Then
             toDateFormat = dateString
    End If
End Function



Public Function SaveCurrentRecord()
    On Error Resume Next
    DoCmd.DoMenuItem acFormBar, acRecordsMenu, acSaveRecord, , acMenuVer70
    
    If err.Number > 0 Then
       MsgBox err.Description, vbCritical
       err.Clear
    End If
    
    On Error GoTo 0
    
End Function


'Takes the current db folder
Function dbFolder()
    Dim dbfol, i
    For i = 0 To UBound(Split(CurrentDb.Name, "\")) - 1
       dbfol = dbfol & Split(CurrentDb.Name, "\")(i) & "\"
    Next
    dbFolder = dbfol
End Function

Public Function replaceString(ByVal expression As String, ByVal searchString As String, ByVal replacement As String) As String
    replaceString = Replace(expression, searchString, replacement)
End Function

Function splitString(ByVal expression)
    splitString = Split(expression)
End Function


'returns the next value from the table and field
'Update for MxSQL to get not duplicate KEY
Public Function nextId(ByVal TableName, ByVal FieldName, Optional optionalWhere As String = "", Optional concurencyCheck As Boolean = True) As Long

    Dim rs
    Dim sql As String
    Dim nID As Long
    
    sql = "select  1+ max(" & FieldName & ") as m  from " & TableName
    If optionalWhere <> "" Then sql = sql + " where " & optionalWhere
    
    Set rs = CurrentDb.openRecordset(sql)
    nID = 1
    If Not rs.EOF Then
            If Not IsNull(rs("m")) Then
                nID = CLng(rs("m"))
                If err.Number > 0 Then
                   nID = 1
                   'Exit Function
                End If
            Else 'is null
             nID = 1
            End If
    End If
    If concurencyCheck Then
            'check that do not colides with last called varvalues
            Dim varName As String: varName = "letzteNummer_" & TableName
            
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
     
End Function



Function isFormOpen(ByVal formName As String)
        isFormOpen = 0
        Dim i As Integer
        For i = 1 To Forms.Count
            If formName = Forms(i - 1).Name Then
                    isFormOpen = True
            End If
        Next
        
End Function
