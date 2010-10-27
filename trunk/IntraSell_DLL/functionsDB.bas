Attribute VB_Name = "functionsDB"
  
Public ConnStringODBC As String
Public CurrentDB As Connection

'for compatibility reasons
Public Const dbOpenDynaset = 0
Public Const dbSeeChanges = 0

  
Public Sub connOpen()

   'Prevent 2 Times open connection
    If Not CurrentDB Is Nothing Then
        Exit Sub
    End If
    
    Set CurrentDB = New Connection
    CurrentDB.CursorLocation = adUseClient
    CurrentDB.Open ConnStringODBC
End Sub
 
Public Sub connClose()

    If CurrentDB Is Nothing Then
        Exit Sub
    End If

    CurrentDB.Close
    Set CurrentDB = Nothing
End Sub
 
 
Public Function openRecordset(ByVal sql As String, Optional something As Variant = 0, Optional unusedParameter As Variant = 0) As Recordset
 
    If InStr(ConnStringODBC, "MySQL") Then
      sql = Replace(sql, "[", "`")
      sql = Replace(sql, "]", "`")
      sql = Replace(sql, "Date()", "CURRENT_DATE")
      sql = Replace(sql, "Now()", "CURRENT_TIMESTAMP")
    End If
  
    If InStr(sql, "INSERT") > 0 Or InStr(sql, "UPDATE") > 0 Or InStr(sql, "DELETE") > 0 Then
          'DoCmd.SetWarnings False
          CurrentDB.Execute sql
          'DoCmd.SetWarnings True
          Exit Function
    End If
  
    Dim rs1 As Recordset
    Set rs1 = New Recordset
    rs1.Open sql, CurrentDB   ', dbOpenDynaset) ')
    Set openRecordset = rs1
End Function

 
