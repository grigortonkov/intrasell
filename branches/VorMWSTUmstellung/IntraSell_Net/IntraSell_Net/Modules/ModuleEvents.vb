Option Strict On
Option Explicit On

Imports IntraSell_DLL

Module ModuleEvents

    Public Sub EventErstellen(ByVal nachricht As String)

        RunSQL("insert into ofEvents ( Nachricht) values ('" & nachricht & "')")

    End Sub

End Module
