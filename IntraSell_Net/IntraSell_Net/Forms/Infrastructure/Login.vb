Imports MySql.Data.MySqlClient

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
        'Load last User name 
        'load zuletzt angemeldeter benutzer
        readLastUsername()
        Me.UsernameTextBox.Text = ModuleGlobals.Username
    End Sub


    Private Sub LoginUser(username As String, passwort As String)
        'check if mitarbeiter login ok

        writeLog("Check user name and passwort.")


        Dim rs As MySqlDataReader
        Dim sql As String
        sql = "select idnr from ofMitarbeiter where Username = '" & username & "' and Passwort = '" & passwort & "'"
        rs = openRecordset(sql)
        If rs.Read Then
            Call saveLastUsername()
            'Die Einstellung für den User setzen falls noch nicht passiert
            If VarValue("LANGUAGE_DOK_" & rs("IDNR")) = "" Then
                Call InsertVarValue("LANGUAGE_DOK_" & rs("IDNR"), "ENG")
            End If

            OpenForm("treeView")
            OpenForm("Main")
            ModuleGlobals.MitarbeiterID = rs("IDNR")
            'DoCmd.Close(acForm, "mainLogin")
            Call executeMacro(ModuleGlobals.MitarbeiterID)
            Exit Sub
        End If
        rs.Close()

        'else admin login
        writeLog("Admin mode")
        If passwort & "" <> VarValue("adminpass") Then
            UsernameTextBox.ForeColor = Color.Red
            PasswordTextBox.ForeColor = Color.Red
        Else
            OpenForm("Main")
            'DoCmd.Close(acForm, "mainLogin")
        End If
    End Sub
End Class
