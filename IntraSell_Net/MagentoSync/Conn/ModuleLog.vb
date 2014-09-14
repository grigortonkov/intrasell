Imports IntraSell_DLL

Module ModuleLog
    Sub Init()
        Dim logfile = My.MySettings.Default.SyncFolder
        IntraSell_DLL.ModuleLog.Init("sync.log")
    End Sub

    Sub Log(ByRef logLine As String)
        'Debug.Print(Date.Now & ": " & logLine)
        IntraSell_DLL.ModuleLog.writeLog(logLine)
        showLog(Date.Now & ": " & logLine)
    End Sub

    Sub Log(ByRef ex As Exception)

        Debug.Print("Exception: " & ex.Message)
        Debug.Print("Exception Stack: " & ex.StackTrace)

        IntraSell_DLL.ModuleLog.writeLog("Exception: " & ex.Message)
        IntraSell_DLL.ModuleLog.writeLog("Exception Stack: " & ex.StackTrace)
        showLog("Exception: " & ex.Message)
      
    End Sub

    Sub showLog(line As String)
        FormStart.pushLog(line)
        FormStart.Refresh()
    End Sub
End Module
