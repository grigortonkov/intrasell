Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient
Public Class IntraSellDB
    Const DBTYPE_ACCESS = "ACCESS"
    Const DBTYPE_MSSQL = "MSSQL"
    Const DBTYPE_MYSQL = "MYSQL"


    Public Sub init(ByVal connString As String)
        FunctionsDB.ConnStringODBC = connString
        FunctionsDB.connOpen()
        CurrentDB = FunctionsDB.CurrentDB
    End Sub

    Public Sub destroy()
        FunctionsDB.connClose()
    End Sub

    Public Function openRecordset(ByVal sql As String) As MySqlDataReader
        openRecordset = FunctionsDB.openRecordset_(sql, 0, 0)
    End Function


End Class
