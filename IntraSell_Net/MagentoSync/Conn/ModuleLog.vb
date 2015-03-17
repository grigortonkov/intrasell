Imports IntraSell_DLL

Module ModuleLog
    Sub Init()
        Dim logfile = My.MySettings.Default.SyncFolder
        IntraSell_DLL.ModuleLog.Init("sync.log")
    End Sub

    Sub Log(ByRef logLine As String)
        'Debug.Print(Date.Now & ": " & logLine)
        Dim threadname = System.Threading.Thread.CurrentThread.ManagedThreadId & " " & System.Threading.Thread.CurrentThread.Name
        IntraSell_DLL.ModuleLog.writeLog(threadname & ": " & logLine)
        showLog(Date.Now & ": " & threadname & ": " & logLine)
    End Sub

    Sub Log(ByRef ex As Exception)
        Dim threadname = System.Threading.Thread.CurrentThread.ManagedThreadId & " " & System.Threading.Thread.CurrentThread.Name
        Debug.Print("Exception: " & ex.Message)
        Debug.Print("Exception Stack: " & ex.StackTrace)

        IntraSell_DLL.ModuleLog.writeLog(threadname & ": " & "Exception: " & ex.Message)
        IntraSell_DLL.ModuleLog.writeLog(threadname & ": " & "Exception Stack: " & ex.StackTrace)
        showLog(threadname & ": " & "Exception: " & ex.Message & " -> check the log file for details.")
    End Sub

    Sub showLog(line As String)
        FormStart.pushLog(line)
        FormStart.Refresh()
    End Sub
End Module
