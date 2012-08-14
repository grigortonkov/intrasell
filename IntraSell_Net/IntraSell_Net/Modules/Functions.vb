Imports MySql.Data.MySqlClient
Module Functions


    'returns the next value from the table and field
    'Update for MxSQL to get not duplicate KEY
    Public Function nextId(ByVal TableName As String, ByVal FieldName As String, Optional optionalWhere As String = "", Optional concurencyCheck As Boolean = True) As Long

        Dim rs
        Dim sql As String
        Dim nID As Long

        sql = "select  1+ max(" & FieldName & ") as m  from " & TableName
        If optionalWhere <> "" Then sql = sql + " where " & optionalWhere

        rs = openRecordset(sql)
        nID = 1
        If Not rs.EOF Then
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

    End Function



End Module



