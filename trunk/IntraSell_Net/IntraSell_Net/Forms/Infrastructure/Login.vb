Imports MySql.Data.MySqlClient
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
        If LoginUser(UsernameTextBox.Text, PasswordTextBox.Text) Then
            Me.Close()
        Else
            Me.UsernameTextBox.ForeColor = Color.IndianRed
            Me.PasswordTextBox.ForeColor = Me.UsernameTextBox.ForeColor
        End If
    End Sub

    Private Sub Cancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cancel.Click
        Me.Close()
        Application.Exit()
    End Sub

    Public Sub Login_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Try

            'command line arguments support e.g. username=ej password=ej
            If Environment.GetCommandLineArgs.Length = 2 Then
                Dim username As String = Environment.GetCommandLineArgs(1).Split("=")(2)
                Dim password As String = Environment.GetCommandLineArgs(2).Split("=")(2)
                ModuleGlobals.Username = username
                Me.PasswordTextBox.Text = password
                OK_Click(Nothing, Nothing)
            End If

        Catch ex As Exception
            writeLog("Startparameters sind nicht wie erwartet. Beispiel ""username=ej password=ej""")
        End Try
        'hide login window if no user in db with pwd 
        Dim rs As MySql.Data.MySqlClient.MySqlDataReader
        rs = openRecordset("select distinct passwort p from ofMitarbeiter")
        If rs.Read Then
            If rs.IsDBNull(0) Then
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

End Class
