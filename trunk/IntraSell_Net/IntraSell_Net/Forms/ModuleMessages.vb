Module ModuleMessages
    Public Sub HandleAppError(ByVal Err As Exception)
        UserMessage("Unerwarteter Fehler", Err.Message, MsgBoxStyle.Critical)
    End Sub

    Public Sub UserMessage(ByVal Title As String, ByVal Text As String, ByVal Type As MsgBoxStyle)
        MsgBox(Text, Type)
    End Sub
End Module
