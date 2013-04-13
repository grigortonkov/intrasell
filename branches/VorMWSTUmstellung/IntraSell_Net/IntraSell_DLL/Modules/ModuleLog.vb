﻿Option Strict On
Option Explicit On

Imports System.Text
Imports System.IO
Imports IntraSell_DLL

Public Module ModuleLog
    Private LOG_FILENAME As String
    Public LogWindow As InterfaceLogger

    Public Sub Init(ByVal logFileName As String)
        'Init
        LOG_FILENAME = logFileName

        If IsNothing(LOG_FILENAME) Then
            Try
                LOG_FILENAME = VarValue_Default("LOG_FILENAME_NET", GetAppPath() & "\" & "IntraSell.log")
            Catch ex As Exception 'in case of DB connection problems 
                LOG_FILENAME = GetAppPath() + "IntraSell.log"
            End Try
        End If

    End Sub
    'Create Log Entry in IntraSell Log File
    Public Sub writeLog(ByVal logEntry As String)
        Try
            If IsNothing(LOG_FILENAME) Then
                Exit Sub
            End If

            Dim sb As StringBuilder = New StringBuilder()
            sb.AppendLine(Now() & ": " & logEntry)

            Using outfile As StreamWriter = New StreamWriter(LOG_FILENAME, True)
                Debug.WriteLine(sb.ToString())
                outfile.Write(sb.ToString())

                If Not LogWindow Is Nothing Then
                    LogWindow.WriteLine(sb.ToString())
                End If

            End Using
        Catch ex As Exception
            Debug.Print(ex.Message)
        End Try
    End Sub


End Module

