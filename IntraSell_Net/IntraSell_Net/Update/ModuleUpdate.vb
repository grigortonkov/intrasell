Option Explicit On

Imports IntraSell_DLL
Imports System.IO

Module ModuleUpdate
    ' =======================================================================
    ' MSG for translate - @ZIP se zamenq s imeto na faila avtomatichno, ne go mahai

    Const MSG_TITLE As String = "IntraSell 4.0"
    Const MSG_ERROR_UPDATETXT As String = "Datei update.txt wurde nicht gefunden. Stellen Sie sicher dass Sie mit Internet verbunden sind." 'Try later (not internet) or get contact with grigor.tonkov@gmail.com."
    Const MSG_ERROR_ZIP_MISED As String = "Die Datei @ZIP fehlt."
    Const MSG_PROMT_FOR_UPDATE As String = "Es gibt eine IntraSell Aktualisierung, wollen Sie die Dateien hereunterladen?" & vbCrLf & "File: (@ZIP)"
    Const MSG_UPDATE_COMPLETE As String = "Upgrade ist fertig. Nun konnen Sie mit Ihrer Arbeit fortfahren."
    Const MSG_UPTODATE As String = "Zur Zeit gibt es keine Aktualiserungen."

    'Const INTRASELL_UPDATE = "http://intrasell.googlecode.com/files/update.txt" 'From Downloads
    Const INTRASELL_UPDATE As String = "http://intrasell.googlecode.com/svn/trunk/Upgrade/update.txt" ' From SVN
    Const INTRASELL_UPDATE_DLL As String = "http://intrasell.googlecode.com/svn/trunk/Upgrade/Unzip32.dll" ' From SVN
    Const INTRASELL_BASE_URL As String = "http://intrasell.googlecode.com/svn/trunk/Upgrade/"
    Public Const INTRASELL_MYSQL_BINARIES As String = "http://intrasell.googlecode.com/svn/trunk/IntraSell_Net/MySql/MySQL Server 5.1.zip" ' From SVN

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

    Public Function DownloadFile(ByVal sSourceUrl As String, ByVal sLocalFile As String) As Boolean
        Try
            Call writeLog("DownloadFile start")
            Call writeLog("sSourceUrl:" & sSourceUrl)
            Call writeLog("sLocalFile:" & sLocalFile)
            Dim _WebClient As New System.Net.WebClient()
            ' Downloads the resource with the specified URI to a local file.
            _WebClient.DownloadFile(sSourceUrl, sLocalFile)
            Call writeLog("DownloadFile end")
            Return True
        Catch _Exception As Exception
            ' Error
            Return False
            Console.WriteLine("Exception caught in process: {0}", _Exception.ToString())
        End Try

    End Function

    'Update IntraSell 
    'Download update.txt, parse the files do download andd update them 
    Public Sub UpdateIntraSell(silentMode As Boolean)

        Dim updateTxtlokal As String = GetAppPath() & "update.txt"
        Dim updateFolder As String = GetAppPath() & "update"
        Dim showUpgradeMsg As Boolean = False
        Try
            Call writeLog("UpdateIntraSell start")

            Dim oUnZip As UnzipFiles = New UnzipFiles

            Dim needUpdate As Boolean

            Dim strLine As String = ""
            Dim strfName As String
            Dim strfName1 As String
            Dim resultDownload As Boolean

            needUpdate = False

            'Dim fso As New FileSystemObject
            Dim fld As System.IO.Directory
            Dim fItem As String

            'Create Archive Folde if not et exiting 
            If Dir(GetAppPath() & "archive", vbDirectory) = "" Then
                MkDir(GetAppPath() & "archive")
            End If



            resultDownload = DownloadFile(INTRASELL_UPDATE, updateTxtlokal)
            Call writeLog("update.txt downloaded")

            If resultDownload Then

                Using updateFile As StreamReader = New StreamReader(updateTxtlokal)


                    'Open App.Path & "\update.txt" For Input As #11
                    Call writeLog("update.txt opened")
                    While updateFile.Peek() >= 0
                        strLine = updateFile.ReadLine

                        'Line Input #11, strLine
                        strfName1 = Replace(strLine, INTRASELL_BASE_URL, "")
                        strfName = GetAppPath() & strfName1
                        If Dir(strfName) = "" Then
                            needUpdate = True
                            If Not MsgBox(Replace(MSG_PROMT_FOR_UPDATE, "@ZIP", strfName1), vbOKCancel, MSG_TITLE) = vbOK Then
                                Exit Sub
                            Else
                                ' download new update file
                                Call writeLog("start download of " & strfName)
                                resultDownload = DownloadFile(strLine, strfName)
                                Call writeLog("end download of " & strfName)
                                Call writeLog("resultDownload= " & resultDownload)

                                If resultDownload Then

                                    Call writeLog("create update folder")
                                    ' create temp directory "update"
                                    If Dir(updateFolder, vbDirectory) = "" Then
                                        MkDir(updateFolder)
                                    End If
                                    '' unzip
                                    '' check dll exists, if not exists download
                                    'If Dir(App.Path & "\Unzip32.dll") = "" Then
                                    '    rUnzipDLL = DownloadFile(INTRASELL_UPDATE_DLL, App.Path & "\Unzip32.dll")
                                    'End If

                                    'Call writeLog("register unzip dll")

                                    Call writeLog("unzip")
                                    With oUnZip
                                        .ZipFileName = strfName
                                        .ExtractDir = updateFolder
                                        .OverWriteFiles = True
                                        ' Keep Directory Structure of Zip ?
                                        .HonorDirectories = False
                                        ' Unzip and Display any errors as required
                                        If oUnZip.Unzip(strfName, updateFolder) <> 0 Then
                                            MsgBox(oUnZip.GetLastMessage())
                                        End If
                                    End With

                                    ' archive & copy new file
                                    Dim backUpFolder As String = GetAppPath() & "archive\" & strfName1
                                    If Dir(backUpFolder, vbDirectory) = "" Then MkDir(backUpFolder)

                                    For Each fItem In System.IO.Directory.EnumerateFiles(updateFolder)
                                        Dim fItemName As String = Replace(fItem, updateFolder & "\", "")  ' = System.IO.File(fItem)
                                        If Dir(GetAppPath() & fItemName) <> "" Then
                                            Call writeLog("archive files: " & fItemName)
                                            Call FileCopy(GetAppPath() & fItemName, GetAppPath() & "archive\" & strfName1 & "\" & fItemName)
                                        End If
                                        Call writeLog("copy files: " & fItemName)
                                        Call FileCopy(updateFolder & "\" & fItemName, GetAppPath() & fItemName)
                                    Next

                                    FileSystem.Kill(updateFolder & "\*.*")
                                    FileSystem.RmDir(updateFolder)
                                    showUpgradeMsg = True

                                Else
                                    writeLog(Replace(MSG_ERROR_ZIP_MISED, "@ZIP", strfName1))
                                    If Not silentMode Then
                                        MsgBox(Replace(MSG_ERROR_ZIP_MISED, "@ZIP", strfName1), vbCritical, MSG_TITLE)
                                    End If
                                End If
                            End If
                        End If
                    End While

                    'fso = Nothing
                    fld = Nothing
                    fItem = Nothing

                    oUnZip = Nothing

                    If Not needUpdate Then
                        Call writeLog(MSG_UPTODATE)
                        Debug.Print(MSG_UPTODATE)
                        If Not silentMode Then
                            MsgBox(MSG_UPTODATE, vbInformation, MSG_TITLE)
                        End If
                    End If

                    updateFile.Close()
                End Using

                FileSystem.Kill(GetAppPath() & "update.txt")
                If Not silentMode Then
                    If showUpgradeMsg Then
                        MsgBox(MSG_UPDATE_COMPLETE, vbInformation, MSG_TITLE)
                    End If
                End If
            Else
                Call writeLog(MSG_ERROR_UPDATETXT)
                If Not silentMode Then
                    MsgBox(MSG_ERROR_UPDATETXT, vbCritical, MSG_TITLE)
                End If
            End If

            Exit Sub

        Catch err As Exception

            Call writeLog("UpdateIntraSell errLine:" + err.Message)

            If Not silentMode Then
                MsgBox("Unerwarteter Fehler:" & err.Message, vbCritical, MSG_TITLE)
            End If

            'If Dir(strfName) <> "" Then FileSystem.Kill(strfName)

            'fld = fso.GetFolder(App.Path & "\update")
            'fld.Delete(True)

            'fld = fso.GetFolder(App.Path & "\archive\" & strfName1)
            'fld.Delete(True)

            'If Dir(App.Path & "\update.txt") <> "" Then FileSystem.Kill(App.Path & "\update.txt")

            'fso = Nothing
            'fld = Nothing
            'fItem = Nothing
        End Try
    End Sub

End Module
