Module Setup
    Sub SetUpMySqlServer()
        'START 
        'ASK User if Sure 
        'Download File from Repo 
        'Extract Files for MySQL Server 
        'Start MySQL Process 
        'Check if Connection is possible 
        'DONE




        'START 

        'Download File from Repo 
        DownloadFileDotNet("http://google.com", "C:\\google.txt")

        'Extract Files for MySQL Server 
        Dim mySqlZIP As String = "z:\\Business\\IntraSell_System\\IntraSell_Net\\MySql\\MySQL Server 5.1.zip"
        Const MYSQL_SETUP_FOLDER As String = "C:\\"
        Const MYSQL_PROCESS_NAME As String = MYSQL_SETUP_FOLDER & "MySQL Server 5.1\\startup.bat"

        If MsgBox("MySQL Server jetzt installieren?", vbYesNo) = vbYes Then
            ExtractZipFile(mySqlZIP, Nothing, MYSQL_SETUP_FOLDER)
        End If

        'Start MySQL Process 
        Shell(MYSQL_PROCESS_NAME, AppWinStyle.NormalFocus, True, 10)
        'Check if Connection is possible 
        ' wait 5 secs
        Threading.Thread.Sleep(5000)
        Try
            Dim gotConnection As Boolean = VarValue("ADMIN") = "WebShop"
            If gotConnection Then
                MsgBox("MySQL Verbindung ist OK!")
            End If
        Catch ex As Exception
            MsgBox("MySQL Verbindung konnte nicht hergestellt werden!", vbCritical)
        End Try
        'DONE

    End Sub
End Module
