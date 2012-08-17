Option Explicit On
Module ModuleUpdate
    ' =======================================================================
    ' MSG for translate - @ZIP se zamenq s imeto na faila avtomatichno, ne go mahai

    Const MSG_TITLE = "IntraSell 4.0"
    Const MSG_ERROR_UPDATETXT = "Datei update.txt wurde nicht gefunden. Stellen Sie sicher dass Sie mit Internet verbunden sind." 'Try later (not internet) or get contact with grigor.tonkov@gmail.com."
    Const MSG_ERROR_ZIP_MISED = "Datei @ZIP fehlt."
    Const MSG_PROMT_FOR_UPDATE = "Es gibt eine IntraSell Aktualisierung (@ZIP), wollen Sie die Dateien hereunterladen?"
    Const MSG_UPDATE_COMPLETE = "Upgrade ist fertig. Nun konnen Sie mit Ihrer Arbeit fortfahren."
    Const MSG_UPTODATE = "Zur Zeit gibt es keine Aktualiserungen."

    'Const INTRASELL_UPDATE = "http://intrasell.googlecode.com/files/update.txt" 'From Downloads
    Const INTRASELL_UPDATE = "http://intrasell.googlecode.com/svn/trunk/Upgrade/update.txt" ' From SVN
    Const INTRASELL_UPDATE_DLL = "http://intrasell.googlecode.com/svn/trunk/Upgrade/Unzip32.dll" ' From SVN
    Const INTRASELL_BASE_URL = "http://intrasell.googlecode.com/svn/trunk/Upgrade/"
    Public Const INTRASELL_MYSQL_BINARIES = "http://intrasell.googlecode.com/svn/trunk/IntraSell_Net/MySql/MySQL Server 5.1.zip" ' From SVN

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

    '    Public Function DownloadFile(sSourceUrl As String, _
    '                                 sLocalFile As String) As Boolean

    '        On Error GoTo err
    '        Call writeLog("DownloadFile start")
    '        Call writeLog("sSourceUrl:" & sSourceUrl)
    '        Call writeLog("sLocalFile:" & sLocalFile)
    '        'Download the file. BINDF_GETNEWESTVERSION forces
    '        'the API to download from the specified source.
    '        'Passing 0& as dwReserved causes the locally-cached
    '        'copy to be downloaded, if available. If the API
    '        'returns ERROR_SUCCESS (0), DownloadFile returns True.
    '        DownloadFile = URLDownloadToFile(0&, _
    '                                         sSourceUrl, _
    '                                         sLocalFile, _
    '                                         BINDF_GETNEWESTVERSION, _
    '                                         0&) = ERROR_SUCCESS



    '        Call writeLog("DownloadFile end")
    '        Exit Function
    'err:
    '        DownloadFile = False
    '        Call writeLog("DownloadFile error:" & Err.Description)


    '    End Function

    Public Sub DownloadFile(ByVal sSourceUrl As String, ByVal sLocalFile As String)
        Try
            Call writeLog("DownloadFile start")
            Call writeLog("sSourceUrl:" & sSourceUrl)
            Call writeLog("sLocalFile:" & sLocalFile)
            Dim _WebClient As New System.Net.WebClient()
            ' Downloads the resource with the specified URI to a local file.
            _WebClient.DownloadFile(sSourceUrl, sLocalFile)
            Call writeLog("DownloadFile end")
        Catch _Exception As Exception
            ' Error
            Console.WriteLine("Exception caught in process: {0}", _Exception.ToString())
        End Try

    End Sub


    '    Public Sub UpdateIntraSell(silentMode As Boolean)
    '        On Error GoTo errLine

    '        Call writeLog("UpdateIntraSell start")

    '        Dim rUnzipDLL As Boolean

    '        Dim oUnZip As UnzipFiles
    '        oUnZip = New UnzipFiles

    '        Dim needUpdate As Boolean

    '        Dim strLine As String
    '        Dim strfName As String
    '        Dim strfName1 As String
    '        Dim resultDownload As Boolean

    '        needUpdate = False

    '        Dim fso As New FileSystemObject
    '        Dim fld As Folder
    '        Dim fItem As File

    '        If Dir(App.Path & "\archive", vbDirectory) = "" Then MkDir(App.Path & "\archive")

    '        resultDownload = DownloadFile(INTRASELL_UPDATE, App.Path & "\update.txt")
    '        Call writeLog("update.txt downloaded")

    '        If resultDownload Then
    '        Open App.Path & "\update.txt" For Input As #11
    '            Call writeLog("update.txt opened")
    '            Do While Not EOF(11)
    '            Line Input #11, strLine
    '                strfName1 = Replace(strLine, INTRASELL_BASE_URL, "")
    '                strfName = App.Path & "\" & strfName1
    '                If Dir(strfName) = "" Then
    '                    needUpdate = True
    '                    If Not MsgBox(Replace(MSG_PROMT_FOR_UPDATE, "@ZIP", strfName1), vbOKCancel, MSG_TITLE) = vbOK Then
    '                        Exit Sub
    '                    Else
    '                        ' download new update file
    '                        Call writeLog("start download of " & strfName)
    '                        resultDownload = DownloadFile(strLine, strfName)
    '                        Call writeLog("end download of " & strfName)
    '                        Call writeLog("resultDownload= " & resultDownload)

    '                        If resultDownload Then
    '                            Call writeLog("create update folder")
    '                            ' create temp directory "update"
    '                            If Dir(App.Path & "\update", vbDirectory) = "" Then
    '                                MkDir(App.Path & "\update")
    '                            End If
    '                            ' unzip
    '                            ' check dll exists, if not exists download
    '                            If Dir(App.Path & "\Unzip32.dll") = "" Then
    '                                rUnzipDLL = DownloadFile(INTRASELL_UPDATE_DLL, App.Path & "\Unzip32.dll")
    '                            End If

    '                            Call writeLog("register unzip dll")

    '                            Call writeLog("unzip")
    '                            With oUnZip
    '                                .ZipFileName = strfName
    '                                .ExtractDir = App.Path & "\update"
    '                                .OverWriteFiles = True
    '                                ' Keep Directory Structure of Zip ?
    '                                .HonorDirectories = False
    '                                ' Unzip and Display any errors as required
    '                                If .Unzip <> 0 Then
    '                                    MsgBox.GetLastMessage()
    '                                End If
    '                            End With

    '                            ' archive & copy new file
    '                            If Dir(App.Path & "\archive\" & strfName1, vbDirectory) = "" Then MkDir(App.Path & "\archive\" & strfName1)
    '                            fld = fso.GetFolder(App.Path & "\update")
    '                            For Each fItem In fld.Files
    '                                If Dir(App.Path & "\" & fItem.Name) <> "" Then
    '                                    Call writeLog("archive files: " & fItem.Name)
    '                                    Call FileCopy(App.Path & "\" & fItem.Name, App.Path & "\archive\" & strfName1 & "\" & fItem.Name)
    '                                End If
    '                                Call writeLog("copy files: " & fItem.Name)
    '                                Call FileCopy(App.Path & "\update\" & fItem.Name, App.Path & "\" & fItem.Name)
    '                            Next

    '                            FileSystem.Kill(App.Path & "\update\*.*")
    '                            FileSystem.RmDir(App.Path & "\update")

    '                            MsgBox(MSG_UPDATE_COMPLETE, vbInformation, MSG_TITLE)
    '                        Else
    '                            MsgBox(Replace(MSG_ERROR_ZIP_MISED, "@ZIP", strfName1), vbCritical, MSG_TITLE)
    '                        End If
    '                    End If
    '                End If
    '            Loop

    '            fso = Nothing
    '            fld = Nothing
    '            fItem = Nothing

    '            oUnZip = Nothing

    '            If Not needUpdate Then
    '                Call writeLog(MSG_UPTODATE)
    '                Debug.Print(MSG_UPTODATE)
    '                If Not silentMode Then
    '                    MsgBox(MSG_UPTODATE, vbInformation, MSG_TITLE)
    '                End If
    '            End If

    '        Close #11

    '            FileSystem.Kill(App.Path & "\update.txt")
    '        Else
    '            Call writeLog(MSG_ERROR_UPDATETXT)
    '            If Not silentMode Then
    '                MsgBox(MSG_ERROR_UPDATETXT, vbCritical, MSG_TITLE)
    '            End If
    '        End If

    '        Exit Sub

    'errLine:
    '        Call writeLog("UpdateIntraSell errLine:" + Err.Description)

    '        If Not silentMode Then
    '            MsgBox("Unerwarteter Fehler:" & Err.Description, vbCritical, MSG_TITLE)
    '        End If

    '        If Dir(strfName) <> "" Then FileSystem.Kill(strfName)

    '        fld = fso.GetFolder(App.Path & "\update")
    '        fld.Delete(True)

    '        fld = fso.GetFolder(App.Path & "\archive\" & strfName1)
    '        fld.Delete(True)

    '        If Dir(App.Path & "\update.txt") <> "" Then FileSystem.Kill(App.Path & "\update.txt")

    '        fso = Nothing
    '        fld = Nothing
    '        fItem = Nothing
    '    End Sub

End Module
