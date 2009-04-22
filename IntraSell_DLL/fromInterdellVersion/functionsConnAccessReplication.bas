Attribute VB_Name = "functionsConnAccessReplication"

Option Compare Database
Option Explicit
   
Private Function checkIfExists(filename) As Boolean
      Dim FileInQuestion As String
       FileInQuestion = dir(filename)
      If FileInQuestion = "" Then
          checkIfExists = False
      Else
          checkIfExists = True
      End If
End Function

 

Public Sub SynchronisationStart(dbNameMaster, dbNameToSynch)
  Dim curPath: curPath = dbFolder()
  dbNameToSynch = curPath & dbNameToSynch
  dbNameMaster = curPath & dbNameMaster
  
  Dim fs
  Set fs = CreateObject("Scripting.FileSystemObject")
  On Error Resume Next
  fs.deleteFile dbNameToSynch
  On Error GoTo 0
 
  If MsgBox("Get the online Database? Check settings in ftpDownload.bat!", vbYesNo) = vbYes Then
    SynchShell curPath & "ftpDownload.bat"
  End If
  
  While Not checkIfExists(dbNameToSynch)
    If MsgBox("Press a key when file " & dbNameToSynch & " is downlaoded!", vbRetryCancel) = vbCancel Then
       Exit Sub
    End If
    
  Wend
  Dim dbsMaster
  
  Set dbsMaster = DBEngine.Workspaces(0).OpenDatabase(dbNameMaster)
  dbsMaster.Synchronize dbNameToSynch
  
  If MsgBox("Send Database online? Check settings in ftpDownload.bat!", vbYesNo) = vbYes Then
     SynchShell curPath & "ftpUpload.bat"
  End If
  
  'MsgBox "Done"
End Sub



'braucht Verweis auf Microsoft Jet and Replication Object Library

Sub InternetSync(ByVal serverAddress As String, ByVal strLocalReplica As String, ByVal strServerReplica As String)
    ' Diese Prozedur führt mit Hilfe eines Internetservers eine Synchronisation
    ' der angegebenen Elemente einer Replikatgruppe durch. Vorher müssen
    ' Sie Ihren Internetserver mit Hilfe des Replikations-Managers
    ' konfigurieren.
    
    Dim repMaster  'As New JRO.Replica -tODO: remove coomment for ACCESS REPLICATION
    repMaster.ActiveConnection = strLocalReplica
    ' Synchronisieren der lokalen Datenbank mit den Replikat auf dem
    ' Internetserver. Das Target-Argument muss so geändert werden, dass es dem entsprechenden
    ' virtuellen Verzeichnis auf Ihrem Server entspricht.
    ' repMaster.Synchronize serverAddress & "/" & strServerReplica, jrSyncTypeImpExp, jrSyncModeInternet
    Dim jrSyncTypeImpExp, jrSyncModeInternet
     repMaster.Synchronize serverAddress, jrSyncTypeImpExp, jrSyncModeInternet
    Set repMaster = Nothing
    MsgBox "Synchronisierung Fertig!"
End Sub
