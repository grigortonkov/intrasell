Attribute VB_Name = "functionsLog"
Option Compare Database

Sub writeLog(ByVal logEntry As String)
    Dim logfilename: logfilename = varValue("LOG_FILENAME")
    Open logfilename For Append As #1
    Write #1, Now(), logEntry
    Close #1
End Sub

