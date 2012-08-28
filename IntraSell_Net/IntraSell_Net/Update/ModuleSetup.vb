Option Strict On
Option Explicit On

Imports IntraSell_DLL

Module ModuleSetup
    Const MYSQL_SETUP_FOLDER As String = "C:\"
    Const MYSQL_PROCESS_NAME As String = MYSQL_SETUP_FOLDER & "MySQL Server 5.1\\startup.bat"

    '
    'Set Up neuen MySQL Server. 
    '
    'START 
    'ASK User if Sure 
    'Download File from Repo 
    'Extract Files for MySQL Server 
    'Start MySQL Process 
    'Check if Connection is possible 
    'DONE
    Function SetUpMySqlServer(Optional silent As Boolean = False) As Boolean 'True if Setup OK
        SetUpMySqlServer = False
        'START  
        writeLog("Setup MySQL START")

        'First Check if MySQL already running 
        writeLog("Check connection ...")
        Try
            Dim gotConnection As Boolean = VarValue("ADMIN") = "WebShop"
            If gotConnection Then
                If Not silent Then
                    MsgBox("MySQL Verbindung ist OK, Sie benötigen keine neue Installation!", vbExclamation)
                End If
                Exit Function
            End If
        Catch ex As Exception
            'continue 
        End Try

        'Extract Files for MySQL Server 
        Dim mySqlZIP As String
        mySqlZIP = GetAppPath() + "MySQL Server 5.1.zip"
        'Download File from Repo 

        'nicht herunterladen falls die DAtei existiert 
        If Not IO.File.Exists(mySqlZIP) Then
            writeLog("Download file from: " + INTRASELL_MYSQL_BINARIES)
            writeLog("Download file to: " + mySqlZIP)
            DownloadFile(INTRASELL_MYSQL_BINARIES, mySqlZIP)
        Else
            writeLog("File wurde bereits heruntergeladen " + mySqlZIP)
        End If

        If Not silent Then
            If MsgBox("Möchten Sie den MySQL Server jetzt installieren?", vbYesNo) = vbYes Then
                ExtractZipFile(mySqlZIP, Nothing, MYSQL_SETUP_FOLDER)
            End If
        Else
            ExtractZipFile(mySqlZIP, Nothing, MYSQL_SETUP_FOLDER)
        End If


        'Start MySQL Process 
        Shell(MYSQL_PROCESS_NAME, AppWinStyle.NormalFocus, True, 10)
        'Check if Connection is possible 
        ' wait 5 secs
        Threading.Thread.Sleep(5000)
        writeLog("Check connection ...")
        Try
            Dim gotConnection As Boolean = VarValue("ADMIN") = "WebShop"
            If gotConnection Then
                SetUpMySqlServer = True
                writeLog("Setup MySQL erfolgreich.")
                If Not silent Then
                    MsgBox("MySQL Verbindung ist OK!", MsgBoxStyle.OkOnly)
                End If

            End If
        Catch ex As Exception
            SetUpMySqlServer = False
            writeLog("Setup MySQL FAILED. Fehler: " + ex.Message)
            If Not silent Then
                MsgBox("MySQL Verbindung konnte nicht hergestellt werden!", vbCritical)
            End If
        End Try
        'DONE
        writeLog("Setup MySQL DONE")
    End Function
End Module
