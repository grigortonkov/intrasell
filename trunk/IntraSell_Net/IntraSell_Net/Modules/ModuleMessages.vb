Imports IntraSell_DLL
 
Module ModuleMessages
    Public Sub HandleAppError(ByVal Err As Exception, Optional Hilfe As String = Nothing)
        If Not Err Is Nothing Then
            If Hilfe Is Nothing Then
                UserMessage("Unerwarteter Fehler", Err.Message, MsgBoxStyle.Critical)
            Else
                UserMessage("Unerwarteter Fehler", Hilfe & vbCrLf & Err.Message, MsgBoxStyle.Critical)
                writeLog("Hilfe: " + Hilfe)
            End If

            writeLog("Application Error: " + Err.Message)
            writeLog("Stacktrace: " + Err.StackTrace)
        End If
    End Sub

    Public Sub UserMessage(ByVal Title As String, ByVal Text As String, ByVal Type As MsgBoxStyle)
        MsgBox(Text, Type)
    End Sub
End Module
