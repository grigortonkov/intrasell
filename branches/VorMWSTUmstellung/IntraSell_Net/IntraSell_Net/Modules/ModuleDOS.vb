Option Strict Off
Option Explicit On

Imports System.IO

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

    ' Renames the file
    ' ceates the folder of the new filename if not existing 

    Public Sub RenameFile(ByVal oldfilename As String, ByVal newfilename As String)
        'FileSystem.Rename(oldfilename, newfilename)
        Dim fs = CreateObject("Scripting.FileSystemObject")
        Try
            If fs.FileExists(newfilename) Then
                Call fs.deleteFile(newfilename) 'Try to delete existing file first 
            End If
        Catch ex As Exception
            HandleAppError(ex)
        End Try
        Threading.Thread.Sleep(3000) 'warte 3 sek. bis die datei von ms word freigegeben wurde 
        Try
            Call fs.MoveFile(oldfilename, newfilename)
        Catch ex As System.IO.DirectoryNotFoundException 'cannot move because the folder doesnt exist 

            Dim directoryName As String = Path.GetDirectoryName(newfilename)
            If directoryName.Length > 0 Then
                Directory.CreateDirectory(directoryName)
            End If

            Call fs.MoveFile(oldfilename, newfilename)
        End Try
    End Sub


    Public Function KillFolder(ByVal FullPath As String) As Boolean

        '******************************************
        'PURPOSE: DELETES A FOLDER, INCLUDING ALL SUB-
        '         DIRECTORIES, FILES, REGARDLESS OF THEIR
        '         ATTRIBUTES

        'PARAMETER: FullPath = FullPath of Folder to Delete

        'RETURNS:   True is successful, false otherwise

        'REQUIRES:  'VB6
        'Reference to Microsoft Scripting Runtime
        'Caution in use for obvious reasons

        'EXAMPLE:   'KillFolder("D:\MyOldFiles")

        '******************************************
        Try


            Dim oFso = CreateObject("Scripting.FileSystemObject")

            'deletefolder method does not like the "\"
            'at end of fullpath

            If Right(FullPath, 1) = "\" Then FullPath = Left(FullPath, Len(FullPath) - 1)

            If oFso.FolderExists(FullPath) Then

                'Setting the 2nd parameter to true
                'forces deletion of read-only files
                oFso.DeleteFolder(FullPath, True)

                KillFolder = Err.Number = 0 And oFso.FolderExists(FullPath) = False
            End If
            Return (True)
        Catch ex As Exception
            Return (False)
        End Try
    End Function


    '====================================================
    ' ListFilesInFolder
    '====================================================
    Public Function ListFilesInFolder(ByVal SourceFolderName As String, ByVal IncludeSubfolders As Boolean, Optional ByVal fileType As String = "sql") As String
        ' lists information about the files in SourceFolder
        ' example: ListFilesInFolder "C:\FolderName\", True
        Dim FSO 'As Scripting.FileSystemObject
        Dim SourceFolder 'As Scripting.Folder
        Dim SubFolder 'As Scripting.Folder
        Dim FileItem 'As Scripting.File
        Dim allFiles As String = ""


        FSO = CreateObject("Scripting.FileSystemObject")
        SourceFolder = FSO.GetFolder(SourceFolderName)

        For Each FileItem In SourceFolder.Files
            If Right(FileItem.Name, Len(fileType)) = fileType Then
                allFiles = allFiles & FileItem.Name & ";"
            End If

        Next FileItem
        If IncludeSubfolders Then
            For Each SubFolder In SourceFolder.SubFolders
                ListFilesInFolder(SubFolder.Path, True)
            Next SubFolder
        End If
        'Columns("A:H").AutoFit
        FileItem = Nothing
        SourceFolder = Nothing
        FSO = Nothing
        ListFilesInFolder = allFiles
    End Function


End Module
