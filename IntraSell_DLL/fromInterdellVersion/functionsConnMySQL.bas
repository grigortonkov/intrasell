Attribute VB_Name = "functionsConnMySQL"
Option Compare Database
Option Explicit
Public Sub connectMySQLServer()
  Dim odbc: odbc = InputBox("Enter ODBC Connection Name! It must be the same like the Database name!", , "intrasell_daten_2")
  ConnTablesFromMySQLServer odbc
End Sub


'IMPORTS ALL ACCESS TABLES FROM AN ODBC Connects SQL database
Private Sub ConnTablesFromMySQLServer(databaseFilename)  '(ByVal tableName As String, ByVal psUID As String, ByVal psPWD As String)
    Dim database As String
    Dim TableName As String
    Dim psUID As String
    Dim psPWD As String
    
     database = databaseFilename ' "TEMP" 'the same name like ODBC Name
     TableName = "tables"
     
     On Error Resume Next
     DoCmd.DeleteObject acTable, TableName
     On Error GoTo 0
     
     'connect sysobjects
     DoCmd.TransferDatabase acLink, "ODBC", "ODBC;DSN=" & database & ";UID=" & psUID & ";PWD=" & psPWD & ";LANGUAGE=us_english; " & _
            "DATABASE=information_schema", acTable, TableName, TableName, , False
            
        'select all tables
        Dim sql, rs
        sql = "select table_name from tables where table_schema ='" & database & "'"
        Set rs = CurrentDb.openRecordset(sql)
        While Not rs.EOF
           ConnTableSingleMySQL database, rs("table_name"), psUID, psPWD
           rs.MoveNext
        Wend
        rs.Close
    
End Sub
 
Private Sub ConnTableSingleMySQL(ByVal database As String, ByVal TableName As String, ByVal psUID As String, ByVal psPWD As String)
     On Error Resume Next
     DoCmd.DeleteObject acTable, TableName
     On Error GoTo 0
     DoCmd.TransferDatabase acLink, "ODBC", "ODBC;DSN=" & database & ";UID=" & psUID & ";PWD=" & psPWD & ";LANGUAGE=us_english; " & _
            "DATABASE=" & database, acTable, TableName, TableName, , False
    
End Sub
 

