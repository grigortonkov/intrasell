Imports System.Text
Imports System.IO
Imports IntraSell_DLL

Public Module ModuleLog
    Dim LOG_FILENAME As String

    'Create Log Entry in IntraSell Log File
    Public Sub writeLog(ByVal logEntry As String)
        'Init
        If IsNothing(LOG_FILENAME) Then
            Try
                LOG_FILENAME = VarValue_Default("LOG_FILENAME_NET", GetAppPath() + "\" + "IntraSell.log")
            Catch ex As Exception 'in case of DB connection problems 
                LOG_FILENAME = GetAppPath() + "IntraSell.log"
            End Try
        End If

        Dim sb As StringBuilder = New StringBuilder()
        sb.AppendLine(Now() + ": " + logEntry)

        Using outfile As StreamWriter = New StreamWriter(LOG_FILENAME, True)
            Debug.WriteLine(sb.ToString())
            outfile.Write(sb.ToString())
            'Log.WriteLine(sb.ToString())
        End Using

    End Sub


End Module

