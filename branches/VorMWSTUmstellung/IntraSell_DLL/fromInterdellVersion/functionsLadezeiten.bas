Attribute VB_Name = "functionsLadezeiten"
Option Compare Database

Public Sub openLadezeiten(IDNR As String)
        On Error GoTo Err_btnLadezeiten_Click
        
            Dim stDocName As String
            Dim stLinkCriteria As String
        
            stDocName = "transportladezeiten"
            
            stLinkCriteria = "[IDNR]=" & IDNR
            DoCmd.OpenForm stDocName, , , stLinkCriteria
        Forms("transportLadezeiten").filterIDNR = IDNR
        
Exit_btnLadezeiten_Click:
            Exit Sub
        
Err_btnLadezeiten_Click:
            MsgBox err.Description
            Resume Exit_btnLadezeiten_Click
    
End Sub
