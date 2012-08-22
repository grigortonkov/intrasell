Imports IntraSell_DLL

Public Class Log
    Implements InterfaceLogger

    Public Sub WriteLine(s As String) Implements IntraSell_DLL.InterfaceLogger.WriteLine
        LogTextBox.AppendText(s)
    End Sub

    Private Sub Log_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        ModuleLog.LogWindow = Me 'say to logger that the window is ope and should write here 
    End Sub
 
End Class