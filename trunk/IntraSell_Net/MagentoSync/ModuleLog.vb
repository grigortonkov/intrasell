Module ModuleLog
    Sub Log(ByRef logLine As String)
        Debug.Print(Date.Now & ":" & logLine)
    End Sub
    Sub Log(ByRef ex As Exception)
        Debug.Print("Exception: " & ex.Message)
        Debug.Print("Exception Stack: " & ex.StackTrace)
    End Sub
End Module
