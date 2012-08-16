Imports ICSharpCode.SharpZipLib.Core
Imports ICSharpCode.SharpZipLib.Zip
Imports System.IO

Module ModuleTestUnzip
    'Sub Unzip0()

    '    'CreateEmptyZip("c:\testzip.zip")
    '    With CreateObject("Shell.Application")
    '        '.NameSpace("c:\testzip.zip").CopyHere("c:\test")
    '        Dim itms = .NameSpace("C:\\testzip.zip\\")
    '        .NameSpace("c:\\test\\").CopyHere(itms)
    '        ' .NameSpace("c:\testzip.zip").CopyHere .NameSpace(FolderName).items 'use this line if we want to zip all items in a folder into our zip file

    '        '.NameSpace("c:\test").CopyHere(.NameSpace("c:\testzip.zip").items)
    '    End With
    '    ' All done!
    'End Sub

    'Sub Unzip1()
    '    Dim FSO As Object
    '    Dim oApp As Object
    '    Dim Fname As Object
    '    Dim FileNameFolder As Object
    '    Dim DefPath As String
    '    Dim strDate As String

    '    Fname = "C:\\testzip.zip" 'Application.GetOpenFilename(filefilter:="Zip Files (*.zip), *.zip",  MultiSelect:=False)

    '    'Root folder for the new folder.
    '    'You can also use DefPath = "C:\Users\Ron\test\"
    '    DefPath = "C:" 'Application.DefaultFilePath
    '    If Right(DefPath, 1) <> "\" Then
    '        DefPath = DefPath & "\"
    '    End If

    '    'Create the folder name
    '    strDate = Format(Now, " dd-mm-yy")
    '    FileNameFolder = DefPath & "MyUnzipFolder " & strDate & "\"

    '    'Make the normal folder in DefPath
    '    MkDir(FileNameFolder)

    '    'Extract the files into the newly created folder
    '    oApp = CreateObject("Shell.Application")

    '    oApp.Namespace(FileNameFolder).CopyHere(oApp.Namespace(Fname).items)

    '    'If you want to extract only one file you can use this:
    '    'oApp.Namespace(FileNameFolder).CopyHere _
    '    'oApp.Namespace(Fname).items.Item("test.txt")

    '    MsgBox("You find the files here: " & FileNameFolder)

    '    On Error Resume Next
    '    FSO = CreateObject("scripting.filesystemobject")
    '    FSO.deletefolder(Environ("Temp") & "\Temporary Directory*", True)


    'End Sub

    Sub Unzip2()
        ExtractZipFile("C:\\testzip.zip", "", "c:\\test\\")
    End Sub

    Public Sub ExtractZipFile(archiveFilenameIn As String, password As String, outFolder As String)
        Dim zf As ZipFile = Nothing
        Try
            Dim fs As FileStream = File.OpenRead(archiveFilenameIn)
            zf = New ZipFile(fs)
            If Not [String].IsNullOrEmpty(password) Then    ' AES encrypted entries are handled automatically
                zf.Password = password
            End If
            For Each zipEntry As ZipEntry In zf
                If Not zipEntry.IsFile Then     ' Ignore directories
                    Continue For
                End If
                Dim entryFileName As [String] = zipEntry.Name
                ' to remove the folder from the entry:- entryFileName = Path.GetFileName(entryFileName);
                ' Optionally match entrynames against a selection list here to skip as desired.
                ' The unpacked length is available in the zipEntry.Size property.

                Dim buffer As Byte() = New Byte(4095) {}    ' 4K is optimum
                Dim zipStream As Stream = zf.GetInputStream(zipEntry)

                ' Manipulate the output filename here as desired.
                Dim fullZipToPath As [String] = Path.Combine(outFolder, entryFileName)
                Dim directoryName As String = Path.GetDirectoryName(fullZipToPath)
                If directoryName.Length > 0 Then
                    Directory.CreateDirectory(directoryName)
                End If

                ' Unzip file in buffered chunks. This is just as fast as unpacking to a buffer the full size
                ' of the file, but does not waste memory.
                ' The "Using" will close the stream even if an exception occurs.
                Using streamWriter As FileStream = File.Create(fullZipToPath)
                    StreamUtils.Copy(zipStream, streamWriter, buffer)
                End Using
            Next
        Finally
            If zf IsNot Nothing Then
                zf.IsStreamOwner = True     ' Makes close also shut the underlying stream
                ' Ensure we release resources
                zf.Close()
            End If
        End Try
    End Sub
End Module
