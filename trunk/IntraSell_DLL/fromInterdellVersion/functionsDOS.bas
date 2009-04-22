Attribute VB_Name = "functionsDOS"

Option Compare Database
Option Explicit



'calls synchronously any programm
Public Sub SynchShell(programm As String, Optional parameters As String = "")
 Dim lngRetCode As Long
 
   DoCmd.Hourglass True
  'Param 2 False means no windows visible
  'Param 3 True für Warten
   lngRetCode = CreateObject("WScript.Shell").Run(programm, False, True)
   'MsgBox programm & " finished execution!"
   DoCmd.Hourglass False
    
End Sub


Public Sub renameFile(ByVal oldfilename As String, ByVal newfilename As String)
  Dim fs
  Set fs = CreateObject("Scripting.FileSystemObject")
  On Error Resume Next
  Call fs.deleteFile(newfilename)
  On Error GoTo 0
  Call fs.MoveFile(oldfilename, newfilename)
  
  
End Sub
