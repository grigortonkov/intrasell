Attribute VB_Name = "functionsDB"
  
Public ConnStringODBC As String
Public CurrentDB As Connection

'for compatibility reasons
Public Const dbOpenDynaset = 0
Public Const dbSeeChanges = 0

  
Public Sub connOpen()
        Set CurrentDB = New Connection
        CurrentDB.CursorLocation = adUseClient
        CurrentDB.Open ConnStringODBC
End Sub
 
Public Sub connClose()
        CurrentDB.Close
End Sub
 
 
 Public Function openRecordset(ByVal sql As String, Optional something As Variant = 0, Optional par2 As Variant = 0) As Recordset
 
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

 
