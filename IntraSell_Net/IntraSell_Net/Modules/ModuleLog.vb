Imports System.Text
Imports System.IO

Module ModuleLog

    'Create Log Entry in IntraSell Log File
    Sub writeLog(ByVal logEntry As String)
        Dim logfilename As String = VarValue_Default("LOG_FILENAME_NET", Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments) + "\" + "IntraSell.log")
        Dim sb As StringBuilder = New StringBuilder()
        sb.AppendLine(Now() + ":" + logEntry)

        Using outfile As StreamWriter = New StreamWriter(logfilename, True)
            Debug.WriteLine(sb.ToString())
            outfile.WriteLine(sb.ToString())
        End Using

    End Sub


End Module
