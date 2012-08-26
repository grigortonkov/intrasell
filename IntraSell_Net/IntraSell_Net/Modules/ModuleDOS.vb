Option Strict Off
Option Explicit On

Module ModuleDOS



    Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" _
    (ByVal hwnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Integer) As Long

    '___________________________________

    'Then to open a file, say C:\Test.exe, run this:
    'ShellExecute 0, "open", "C:\Test.txt", vbNullString, "C:\Test", 5

    'The constants (which you can refer to by number or name) for the last argument are:
    'Open Normal:
    'WIN_NORMAL or 1
    'Open Maximized:
    'WIN_MAX or 2
    'Open Minimized:
    'WIN_MIN or 3


    'calls synchronously any programm
    Public Sub SynchShell(programm As String, Optional parameters As String = "")
        Dim lngRetCode As Long
        'DoCmd.Hourglass(True)
        Application.UseWaitCursor = True
 
        'Param 2 False means no windows visible
        'Param 3 True für Warten
        lngRetCode = CreateObject("WScript.Shell").Run(programm, False, True)
        'MsgBox programm & " finished execution!"
        'DoCmd.Hourglass(False)
        Application.UseWaitCursor = False
    End Sub


    Public Sub renameFile(ByVal oldfilename As String, ByVal newfilename As String)
        Dim fs
        fs = CreateObject("Scripting.FileSystemObject")
        Try
            Call fs.deleteFile(newfilename)
        Catch ex As Exception

        End Try

        Call fs.MoveFile(oldfilename, newfilename)
    End Sub


End Module
