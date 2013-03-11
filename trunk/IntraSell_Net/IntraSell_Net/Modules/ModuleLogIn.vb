Option Strict On
Option Explicit On

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


    Public Function LoginUser(ByVal username As String, ByVal passwort As String) As Boolean
        Try
            'check if mitarbeiter login ok
            writeLog("Check user name and passwort.")

            Dim rs As MySqlDataReader
            Dim sql As String
            sql = "select IDNR from ofMitarbeiter where Username = '" & username & "' and Passwort = '" & passwort & "'"
            rs = openRecordset(sql)
            If rs.Read Then
                ModuleGlobals.MitarbeiterID = CInt(rs("IDNR"))
                rs.Close()
                Call saveLastUsername()
                'Die Einstellung für den User setzen falls noch nicht passiert
                VarValue_Default("LANGUAGE_DOK_" & ModuleGlobals.MitarbeiterID, "DEU")
                OpenForm("treeView")
                OpenForm("Main")

                'DoCmd.Close(acForm, "mainLogin")
                'Call executeMacro(ModuleGlobals.MitarbeiterID)
                Return True
                Exit Function
            End If
            rs.Close()

            'else admin login
            Return False
            writeLog("Login nicht erfolgreich für User " + username)
        Catch ex As Exception
            Return False
            HandleAppError(ex)
        End Try
    End Function

End Module
