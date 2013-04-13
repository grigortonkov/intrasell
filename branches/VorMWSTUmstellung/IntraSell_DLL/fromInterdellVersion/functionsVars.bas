Attribute VB_Name = "functionsVars"
Option Compare Database
Option Explicit
Public Const NOT_AVAILABLE = "N/A"

Private Sub TEST()
  Dim s As IntraSellVars
  Set s = New IntraSellVars
  s.Init (ConnStringIntraSellData)
  MsgBox s.varValue("DOMAIN")
End Sub

'********************************************************************
'SUCHT EINE VARIABLE IN DER VARS TABELLE
'********************************************************************
Public Function varValue(ByVal varName As String)
   'response.write varname
   Dim SQLString, rs As Recordset
   SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
   Set rs = CurrentDb.openRecordset(SQLString, dbOpenDynaset, dbSeeChanges)
   If rs.EOF Then
       MsgBox "Die Variable " & varName & " ist nicht vorhanden!!!"
   Else
       varValue = rs.Fields("Wert")
   End If
   rs.Close
End Function

'********************************************************************
'SUCHT EINE VARIABLE IN DER VARS TABELLE
'********************************************************************
Public Function EXISTSVARVALUE(ByVal varName As String) As Boolean
   'response.write varname
   Dim SQLString, rs As Recordset
   SQLString = "SELECT * FROM ofVars WHERE Name='" & varName & "'"
   Set rs = CurrentDb.openRecordset(SQLString, dbOpenDynaset, dbSeeChanges)
    EXISTSVARVALUE = Not rs.EOF
    rs.Close
End Function


'********************************************************************
'AKTUALISIERT EINE VARIABLE IN DIE VARS TABELLE
'********************************************************************
Public Function SETVARVALUE(ByVal varName As String, ByVal varValue)
   DoCmd.SetWarnings False
   Dim SQLString As String
   SQLString = "UPDATE ofVars Set Wert = '" & varValue & "' WHERE Name='" & varName & "'"
   DoCmd.RunSQL SQLString
   SETVARVALUE = varValue
   DoCmd.SetWarnings True
End Function


'********************************************************************
'FÜGT EINE VARIABLE IN DIE VARS TABELLE EIN
'********************************************************************
Public Function INSERTVARVALUE(ByVal varName As String, ByVal varValue)
   DoCmd.SetWarnings False
   Dim SQLString As String
   SQLString = "INSERT INTO ofVars (Id, Name, Wert) VALUES (" & nextId("ofVars", "ID", , False) & ", '" & varName & "', '" & varValue & "')"
   DoCmd.RunSQL SQLString
   INSERTVARVALUE = varValue
   DoCmd.SetWarnings True
End Function


Public Function UseEAN() As Boolean
    If varValue("BenutzeEAN") = "TRUE" Then
        UseEAN = True
    Else
        UseEAN = False
    End If
End Function

Public Function getRS()
    DoCmd.OpenReport "buchRechnung", acViewPreview
End Function


Public Function firstRow(ByVal SQLString As String)
   
   firstRow = NOT_AVAILABLE 'N/A String
   
   Dim rs As Recordset
       
   On Error Resume Next
   Set rs = CurrentDb.openRecordset(SQLString)
  ' On Error GoTo 0
   If err.Number > 0 Then
      'MsgBox err.Description
      Debug.Print "Error in functionsVars:firstrow; SQLString = " & SQLString & err.Description
      err.Clear
      On Error GoTo 0
      Exit Function
   End If
   
   On Error GoTo 0
   If rs.EOF Then
     firstRow = ""
   Else
     firstRow = rs.Fields(0)
   End If
  rs.Close
End Function


'********************************************************************
'SUCHT EINE VARIABLE IN EINE TABELLE
'********************************************************************
Function TABLEVALUE(ByVal TableName, ByVal colName, ByVal varValue, ByVal searchField)
         On Error Resume Next
         Dim rs
         If Trim(TableName & "") = "" Or Trim(colName & "") = "" Or Trim(varValue & "") = "" Or Trim(searchField & "") = "" Then
            TABLEVALUE = "Wrong usage! Die Variable " & varValue & " ist nicht vorhanden!"
            On Error GoTo 0
            Exit Function
         End If
         
        Dim SQLString As String
        SQLString = "SELECT * FROM " & TableName & " WHERE " & colName & "=" & varValue
        Set rs = CurrentDb.openRecordset(SQLString)
        If rs.EOF Then
            TABLEVALUE = "Die Variable " & varValue & " ist nicht vorhanden!"
        Else
            TABLEVALUE = rs(searchField)
        End If
        rs.Close
        On Error GoTo 0
End Function


