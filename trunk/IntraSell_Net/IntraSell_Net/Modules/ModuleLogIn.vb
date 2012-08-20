Imports MySql.Data.MySqlClient
Imports System.IO
Imports IntraSell_DLL

Module ModuleLogIn
    Private Const LAST_USER_SETTINGS As String = "IntraSell_user.tmp"
    Dim upgradeCalled As Boolean

    Private Sub Form_Open(Cancel As Integer)
        upgradeCalled = False
        'load zuletzt angemeldeter benutzer
        readLastUsername()
    End Sub

    Public Sub saveLastUsername()
        Try
            writeLog("Set last username: " & ModuleGlobals.Username)
            Using outfile As StreamWriter = New StreamWriter(LAST_USER_SETTINGS, False)
                outfile.WriteLine(ModuleGlobals.Username)
            End Using
        Catch ex As Exception
            writeLog("Cannot set last username! Fehler: " & ex.Message)
        End Try
    End Sub


    Public Sub readLastUsername()
        Try
            writeLog("Get last username")
            Using infile As StreamReader = New StreamReader(LAST_USER_SETTINGS, True)
                ModuleGlobals.Username = infile.ReadLine()
            End Using
        Catch ex As Exception
            writeLog("Cannot get last username! Fehler: " & ex.Message)
        End Try
    End Sub



    'Private Sub Form_Timer()
    '    If upgradeCalled Then Exit Sub

    '    lblWhatToDo.Caption = "DB Aktualisierung wird durchgeführt ... bitte warten"
    '    Call doDBUpgrade()
    '    lblWhatToDo.Caption = "Bitte anmelden:"
    '    upgradeCalled = True
    'End Sub



End Module
