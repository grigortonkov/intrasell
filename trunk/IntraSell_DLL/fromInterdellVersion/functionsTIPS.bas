Attribute VB_Name = "functionsTIPS"
Option Compare Database
Option Explicit

Function TipText(TipName As String)
  Dim sql
  sql = "SELECT * FROM ofTips WHERE DoNotShowAnymore = false AND TipName Like '" & TipName & "'"
  Dim rs As Recordset
  Set rs = CurrentDb.openRecordset(sql, dbOpenDynaset, dbSeeChanges)
  
  If Not rs.EOF Then
     'MsgBox rs.Fields("Description")
     DoCmd.OpenForm "ofTips", , , "TipId=" & rs.Fields("TipId")
     
  End If
  
  rs.Close
  Set rs = Nothing
  
End Function
