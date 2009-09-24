Attribute VB_Name = "functionsLog"
 
 
Public Sub writeLog(ByVal logEntry As String)
 On Error GoTo err
    Dim logfilename: logfilename = "update_debug.log"
    Open logfilename For Append As #10
    Write #10, Now(), logEntry
    Close #10
    Exit Sub
err:
    Exit Sub
End Sub


