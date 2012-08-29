﻿Option Strict On
Option Explicit On

Imports MySql.Data.MySqlClient
Public Module FunctionsDB
    'should be initilized by calling application. E.g.: 
    'ModuleCommons.conn = new  MySqlConnection(Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
    Public CurrentDB As New MySqlConnection ' (Global.IntraSell_Net.My.MySettings.Default.intrasell_daten_2_ConnectionString)
    'Public ConnStringODBC As String
    'Public CurrentDB As MySqlConnection

    'for compatibility reasons
    Public Const dbOpenDynaset = 0
    Public Const dbSeeChanges = 0


    Public Sub connOpen()
        'Prevent 2 Times open connection
        If Not CurrentDB Is Nothing Then
            Exit Sub
        End If

        CurrentDB = New MySqlConnection
        'CurrentDB.CursorLocation = adUseClient
        'CurrentDB.ConnectionString = ConnStringODBC
        CurrentDB.Open()
    End Sub

    Public Sub connClose()

        If CurrentDB Is Nothing Then
            Exit Sub
        End If

        CurrentDB.Close()
        CurrentDB = Nothing
    End Sub

    Public Sub FixAccessSQL(ConnString As String, ByRef sql As String)

        'If InStr(ConnString, "MySQL") > 0 Then
        sql = Replace(sql, "[", "`")
        sql = Replace(sql, "]", "`")
        sql = Replace(sql, "Date()", "CURRENT_DATE")
        sql = Replace(sql, "Now()", "CURRENT_TIMESTAMP")
        'End If

    End Sub

    Public Function openRecordset_(ByVal sql As String, Optional something As Object = 0, Optional unusedParameter As Object = 0) As MySqlDataReader

        FixAccessSQL(CurrentDB.ConnectionString, sql)

        If InStr(sql, "INSERT") > 0 Or InStr(sql, "UPDATE") > 0 Or InStr(sql, "DELETE") > 0 Then
            'DoCmd.SetWarnings False
            Dim cmd As MySqlCommand = CurrentDB.CreateCommand()
            cmd.CommandText = sql
            cmd.ExecuteNonQuery()
            'DoCmd.SetWarnings True
            Return Nothing
            Exit Function
        End If

        Dim d As New MySqlCommand(sql, CurrentDB)
        Return d.ExecuteReader()

        'Dim rs1 As MySqlDataReader = New MySqlDataReader(sql)
        'rs1.Open(sql, CurrentDB)   ', dbOpenDynaset) ')
        'openRecordset = rs1
    End Function



End Module