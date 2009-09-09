Attribute VB_Name = "Update"
' =======================================================================
' MSG for translate - @ZIP se zamenq s imeto na faila avtomatichno, ne go mahai

Const MSG_TITLE = "IntraSell 4.0"
Const MSG_ERROR_UPDATETXT = "Datei update.txt wurde nicht gefunden. Stellen Sie sicher dass Sie mit Internet verbunden sind." 'Try later (not internet) or get contact with grigor.tonkov@gmail.com."
Const MSG_ERROR_ZIP_MISED = "Datei @ZIP fehlt."
Const MSG_PROMT_FOR_UPDATE = "Es gibt eine IntraSell Aktualisierung (@ZIP), wollen Sie die Dateien hereunterladen?"
Const MSG_UPDATE_COMPLETE = "Upgrade ist fertig. Nun können Sie mit Ihrer Arbeit fortfahren."
Const MSG_UPTODATE = "Zur Zeit gibt es keine Aktualiserungen."

'Const INTRASELL_UPDATE = "http://intrasell.googlecode.com/files/update.txt" 'From Downloads
Const INTRASELL_UPDATE = "http://intrasell.googlecode.com/svn/trunk/Upgrade/update.txt" ' From SVN
Const INTRASELL_BASE_URL = "http://intrasell.googlecode.com/svn/trunk/Upgrade/" ' "http://intrasell.googlecode.com/files/"
' =======================================================================

Private Declare Function URLDownloadToFile Lib "urlmon" _
   Alias "URLDownloadToFileA" _
  (ByVal pCaller As Long, _
   ByVal szURL As String, _
   ByVal szFileName As String, _
   ByVal dwReserved As Long, _
   ByVal lpfnCB As Long) As Long
   
Private Const ERROR_SUCCESS As Long = 0
Private Const BINDF_GETNEWESTVERSION As Long = &H10
Private Const INTERNET_FLAG_RELOAD As Long = &H80000000

Public Function DownloadFile(sSourceUrl As String, _
                             sLocalFile As String) As Boolean
  
  'Download the file. BINDF_GETNEWESTVERSION forces
  'the API to download from the specified source.
  'Passing 0& as dwReserved causes the locally-cached
  'copy to be downloaded, if available. If the API
  'returns ERROR_SUCCESS (0), DownloadFile returns True.
   DownloadFile = URLDownloadToFile(0&, _
                                    sSourceUrl, _
                                    sLocalFile, _
                                    BINDF_GETNEWESTVERSION, _
                                    0&) = ERROR_SUCCESS
   
End Function

Public Sub UpdateIntraSell(silentMode As Boolean)
On Error GoTo errLine

    Dim needUpdate As Boolean

    Dim ShellClass  As Shell32.Shell
    Dim Filesource  As Shell32.Folder
    Dim Filedest    As Shell32.Folder
    Dim fItem       As Shell32.FolderItem
    Dim Folderitems As Shell32.Folderitems
    
    Dim strLine As String
    Dim strfName As String
    Dim strfName1 As String
    Dim resultDownload As Boolean

    needUpdate = False
    
    If Dir(App.Path & "\archive", vbDirectory) = "" Then MkDir (App.Path & "\archive")
    
    resultDownload = DownloadFile(INTRASELL_UPDATE, App.Path & "\update.txt")
        
    If resultDownload Then
        Open App.Path & "\update.txt" For Input As #1
        Do While Not EOF(1)
            Line Input #1, strLine
            strfName1 = Replace(strLine, INTRASELL_BASE_URL, "")
            strfName = App.Path & "\" & strfName1
            If Dir(strfName) = "" Then
                needUpdate = True
                If MsgBox(Replace(MSG_PROMT_FOR_UPDATE, "@ZIP", strfName1), vbOKCancel, MSG_TITLE) = vbOK Then
                    ' download new update file
                    resultDownload = DownloadFile(strLine, strfName)
                    If resultDownload Then
                        ' close database
                        Call IntraSell.Close_Click
                    
                        ' create temp directory "update"
                        If Dir(App.Path & "\update", vbDirectory) = "" Then MkDir (App.Path & "\update")
                        
                        Set ShellClass = New Shell32.Shell
                        
                        ' unzip
                        Set Filesource = ShellClass.NameSpace(strfName)
                        Set Folderitems = Filesource.Items
                        Set Filedest = ShellClass.NameSpace(App.Path & "\update")
                        Call Filedest.CopyHere(Folderitems, 20)
                        
                        ' archive
                        If Dir(App.Path & "\archive\" & strfName1, vbDirectory) = "" Then MkDir (App.Path & "\archive\" & strfName1)
                        For Each fItem In Folderitems
                            If Dir(App.Path & "\" & fItem) <> "" Then
                                Call FileCopy(App.Path & "\" & fItem, App.Path & "\archive\" & strfName1 & "\" & fItem)
                            End If
                        Next
                        
                        ' copy new files
                        Set Filesource = ShellClass.NameSpace(App.Path & "\update")
                        Set Folderitems = Filesource.Items
                        Set Filedest = ShellClass.NameSpace(App.Path)
                        Call Filedest.CopyHere(Folderitems, 20)
    
                        FileSystem.Kill App.Path & "\update\*.*"
                        FileSystem.RmDir App.Path & "\update"
                        
                        MsgBox MSG_UPDATE_COMPLETE, , MSG_TITLE
                        
                        ' open database again
                        Call IntraSell.OpenDatabase
                    Else
                        MsgBox Replace(MSG_ERROR_ZIP_MISED, "@ZIP", strfName1), , MSG_TITLE
                    End If
                End If
            End If
        Loop
        
        If Not needUpdate Then
           Debug.Print MSG_UPTODATE
           If Not silentMode Then MsgBox MSG_UPTODATE, vbInformation, MSG_TITLE
        End If
        
        Close #1
        
        FileSystem.Kill App.Path & "\update.txt"
    Else
        MsgBox MSG_ERROR_UPDATETXT, vbCritical, MSG_TITLE
    End If
    
    Exit Sub

errLine:
    ' greshka izchistvat se nehstata
    If Dir(App.Path & "\update.txt") <> "" Then FileSystem.Kill App.Path & "\update.txt"
    If Dir(strfName) <> "" Then FileSystem.Kill strfName
    If Dir(App.Path & "\update", vbDirectory) <> "" Then
        Set Filesource = ShellClass.NameSpace(App.Path & "\update")
        Set Folderitems = Filesource.Items
        If Folderitems.Count <> 0 Then FileSystem.Kill App.Path & "\update\*.*"
        FileSystem.RmDir App.Path & "\update"
        
        If Dir(App.Path & "\archive\" & strfName1, vbDirectory) <> "" Then
            Set Filesource = ShellClass.NameSpace(App.Path & "\archive\" & strfName1)
            Set Folderitems = Filesource.Items
            If Folderitems.Count <> 0 Then FileSystem.Kill App.Path & "\archive\" & strfName1 & "\*.*"
            FileSystem.RmDir App.Path & "\archive\" & strfName1
        End If
    End If
    
    Set ShellClass = Nothing
    Set Filesource = Nothing
    Set Filedest = Nothing
    Set fItem = Nothing
    Set Folderitems = Nothing
    
    MsgBox "Error: " & Err.Description, vbCritical
    Err.Clear
End Sub
