Attribute VB_Name = "functionsLog"
Private vars As IntraSellVars
 
Sub writeLog(ByVal logEntry As String)
    Dim logfilename: logfilename = vars.varValue("LOG_FILENAME")
    Open logfilename For Append As #1
    Write #1, Now(), logEntry
    Close #1
End Sub


