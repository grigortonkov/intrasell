VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "IntraSellDB"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Const DBTYPE_ACCESS = "ACCESS"
Const DBTYPE_MSSQL = "MSSQL"
Const DBTYPE_MYSQL = "MYSQL"


Public Sub init(ByVal connString)
    functionsDB.ConnStringODBC = connString
    functionsDB.connOpen
    Set CurrentDB = functionsDB.CurrentDB
End Sub

Public Sub destroy()
    functionsDB.connClose
End Sub

 Public Function openRecordset(ByVal sql As String) As Recordset
   Set openRecordset = functionsDB.openRecordset(sql, 0, 0)
 End Function
 
