﻿Imports MySql.Data.MySqlClient
Imports IntraSell_DLL

Public Class Login

    ' TODO: Insert code to perform custom authentication using the provided username and password 
    ' (See http://go.microsoft.com/fwlink/?LinkId=35339).  
    ' The custom principal can then be attached to the current thread's principal as follows: 
    '     My.User.CurrentPrincipal = CustomPrincipal
    ' where CustomPrincipal is the IPrincipal implementation used to perform authentication. 
    ' Subsequently, My.User will return identity information encapsulated in the CustomPrincipal object
    ' such as the username, display name, etc.

    Private Sub OK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles OK.Click
        ModuleGlobals.Username = Me.UsernameTextBox.Text
        ModuleLogIn.saveLastUsername()
        LoginUser(UsernameTextBox.Text, PasswordTextBox.Text)
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Me.Close()
        Application.Exit()
    End Sub

    Private Sub Login_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        'hide login window if no user in db with pwd 
        Dim rs As MySql.Data.MySqlClient.MySqlDataReader
        rs = openRecordset("select distinct passwort p from ofMitarbeiter")
        If rs.Read Then
            If rs.IsDBNull("p") Then
                writeLog("Weiter ohne Anmedlung ...")
                rs.Close()
                Me.Close()
            End If
        Else
            writeLog("Weiter ohne Anmedlung ...")
            rs.Close()
            Me.Close()
        End If
        rs.Close()

        'Load last User name 
        'load zuletzt angemeldeter benutzer
        readLastUsername()
        Me.UsernameTextBox.Text = ModuleGlobals.Username
    End Sub


    Private Sub LoginUser(username As String, passwort As String)
        Try

            'check if mitarbeiter login ok

            writeLog("Check user name and passwort.")


            Dim rs As MySqlDataReader
            Dim sql As String
            sql = "select idnr from ofMitarbeiter where Username = '" & username & "' and Passwort = '" & passwort & "'"
            rs = openRecordset(sql)
            If rs.Read Then
                ModuleGlobals.MitarbeiterID = rs("IDNR")
                rs.Close()
                Call saveLastUsername()
                'Die Einstellung für den User setzen falls noch nicht passiert
                If VarValue("LANGUAGE_DOK_" & ModuleGlobals.MitarbeiterID) = "" Then
                    Call InsertVarValue("LANGUAGE_DOK_" & ModuleGlobals.MitarbeiterID, "ENG")
                End If

                OpenForm("treeView")
                OpenForm("Main")

                'DoCmd.Close(acForm, "mainLogin")
                'Call executeMacro(ModuleGlobals.MitarbeiterID)
                Me.Close()
                Exit Sub
            End If
            rs.Close()

            'else admin login
            writeLog("Admin mode")
            'If passwort & "" <> VarValue("adminpass") Then
            '    UsernameTextBox.ForeColor = Color.Red
            '    PasswordTextBox.ForeColor = Color.Red
            'Else
            '    OpenForm("Main")
            '    'DoCmd.Close(acForm, "mainLogin")
            'End If


        Catch ex As Exception
            HandleAppError(ex)
        End Try
    End Sub
End Class
