Imports ICSharpCode.SharpZipLib.Core
Imports ICSharpCode.SharpZipLib.Zip
Imports System.IO

Module ModuleUnzipTest
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

End Module
