Attribute VB_Name = "functionsConnMSSQL"

Option Compare Database
Option Explicit
 
Sub connectSQLServer()
  Dim odbc: odbc = InputBox("Enter ODBC Connection Name! It must be the same like the Database name!")
  ConnTablesFromSQLServer odbc
End Sub
 
'IMPORTS ALL SQL USER TABLES FROM AN ODBC Connects SQL database
Private Sub ConnTablesFromSQLServer(database) '(ByVal tableName As String, ByVal psUID As String, ByVal psPWD As String)
     database = database ' "TEMP" 'the same name like ODBC Name
     Dim TableName As String
     TableName = "sysobjects"
     
     Dim psUID, psPWD As String
     
     On Error Resume Next
     DoCmd.DeleteObject acTable, TableName
     On Error GoTo 0
     
     'connect sysobjects
     DoCmd.TransferDatabase acLink, "ODBC", "ODBC;DSN=" & database & ";UID=" & psUID & ";PWD=" & psPWD & ";LANGUAGE=us_english; " & _
            "DATABASE=" & database, acTable, TableName, TableName, , False
            
        'select all tables
        Dim sql, rs
        sql = "select name from sysobjects where xtype ='u'"
        Set rs = CurrentDb.openRecordset(sql)
        While Not rs.EOF
         On Error Resume Next
           ConnTableSingle database, rs("name"), psUID, psPWD
          
          If err.Number > 0 Then
                 MsgBox "Cannot connect " & rs("name")
                 err.Clear
          End If
          On Error GoTo 0
          
           rs.MoveNext
        Wend
        rs.Close
    
End Sub
 
Private Sub ConnTableSingle(ByVal database As String, ByVal TableName As String, ByVal psUID As String, ByVal psPWD As String)
     On Error Resume Next
     DoCmd.DeleteObject acTable, TableName
     On Error GoTo 0
     DoCmd.TransferDatabase acLink, "ODBC", "ODBC;DSN=" & database & ";UID=" & psUID & ";PWD=" & psPWD & ";LANGUAGE=us_english; " & _
            "DATABASE=" & database, acTable, TableName, TableName, , False
    
End Sub
 
 
 

'rund this function to rename all objects without the dbo
'use trusted sql connection
Sub renameTables()
Dim tDef As TableDef
  For Each tDef In CurrentDb.TableDefs
        If InStr(tDef.Name, "dbo_") > 0 Then
                tDef.Name = Mid(tDef.Name, 5)
        End If
  Next
End Sub




