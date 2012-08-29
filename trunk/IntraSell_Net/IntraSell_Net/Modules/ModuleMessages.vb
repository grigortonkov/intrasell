Module ModuleMessages
    Public Sub HandleAppError(ByVal Err As Exception)
        If Not Err Is Nothing Then
            UserMessage("Unerwarteter Fehler", Err.Message, MsgBoxStyle.Critical)
        End If
    End Sub

    Public Sub UserMessage(ByVal Title As String, ByVal Text As String, ByVal Type As MsgBoxStyle)
        MsgBox(Text, Type)
    End Sub
End Module
