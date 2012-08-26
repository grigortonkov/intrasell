Option Strict Off
Option Explicit On

Public Class UnzipFiles

    Public Enum ZMessageLevel
        All = 0
        Less = 1
        NoMessages = 2
    End Enum
    Public Enum ZExtractType
        Extract = 0
        ListContents = 1
    End Enum
    Public Enum ZPrivilege
        Ignore = 0
        ACL = 1
        Privileges = 2
    End Enum

    Private miExtractNewer As Integer  ' 1 = Extract Only Newer, Else 0
    Private miSpaceUnderScore As Integer  ' 1 = Convert Space To Underscore, Else 0
    Private miPromptOverwrite As Integer  ' 1 = Prompt To Overwrite Required, Else 0
    Private miQuiet As ZMessageLevel  ' 2 = No Messages, 1 = Less, 0 = All
    Private miWriteStdOut As Integer  ' 1 = Write To Stdout, Else 0
    Private miTestZip As Integer  ' 1 = Test Zip File, Else 0
    Private miExtractList As ZExtractType  ' 0 = Extract, 1 = List Contents
    Private miExtractOnlyNewer As Integer  ' 1 = Extract Only Newer, Else 0
    Private miDisplayComment As Integer  ' 1 = Display Zip File Comment, Else 0
    Private miHonorDirectories As Integer  ' 1 = Honor Directories, Else 0
    Private miOverWriteFiles As Integer  ' 1 = Overwrite Files, Else 0
    Private miConvertCR_CRLF As Integer  ' 1 = Convert CR To CRLF, Else 0
    Private miVerbose As Integer  ' 1 = Zip Info Verbose
    Private miCaseSensitivity As Integer  ' 1 = Case Insensitivity, 0 = Case Sensitivity
    Private miPrivilege As ZPrivilege  ' 1 = ACL, 2 = Privileges, Else 0
    Private msZipFileName As String   ' The Zip File Name
    Private msExtractDir As String   ' Extraction Directory, Null If Current Directory

    Private msOutput As String ' Mesages during extraction 


    Public Property ExtractNewer() As Boolean
        Get
            ExtractNewer = miExtractNewer = 1
        End Get
        Set(value As Boolean)
            miExtractNewer = IIf(value, 1, 0)
        End Set
    End Property


    Public Property SpaceToUnderScore() As Boolean
        Get
            SpaceToUnderScore = miSpaceUnderScore = 1
        End Get
        Set(value As Boolean)
            miSpaceUnderScore = IIf(value, 1, 0)
        End Set
    End Property


    Public Property PromptOverwrite() As Boolean
        Get
            PromptOverwrite = miPromptOverwrite = 1
        End Get
        Set(value As Boolean)
            miPromptOverwrite = IIf(value, 1, 0)
        End Set
    End Property


    Public Property MessageLevel() As ZMessageLevel
        Get
            MessageLevel = miQuiet
        End Get
        Set(value As ZMessageLevel)
            miQuiet = value
        End Set
    End Property


    Public Property WriteToStdOut() As Boolean
        Get
            WriteToStdOut = miWriteStdOut = 1
        End Get
        Set(value As Boolean)
            miWriteStdOut = IIf(value, 1, 0)
        End Set
    End Property




    Public Property TestZip() As Boolean
        Get
            TestZip = miTestZip = 1
        End Get
        Set(value As Boolean)
            miTestZip = IIf(value, 1, 0)
        End Set
    End Property


    Public Property ExtractList() As ZExtractType
        Get
            ExtractList = miExtractList
        End Get
        Set(value As ZExtractType)
            miExtractList = value
        End Set
    End Property


    Public Property ExtractOnlyNewer() As Boolean
        Get
            ExtractOnlyNewer = miExtractOnlyNewer = 1
        End Get
        Set(value As Boolean)
            miExtractOnlyNewer = IIf(value, 1, 0)
        End Set
    End Property


    Public Property DisplayComment() As Boolean
        Get
            DisplayComment = miDisplayComment = 1
        End Get
        Set(value As Boolean)
            miDisplayComment = IIf(value, 1, 0)
        End Set
    End Property



    Public Property HonorDirectories() As Boolean
        Get
            HonorDirectories = miHonorDirectories = 1
        End Get
        Set(value As Boolean)
            miHonorDirectories = IIf(value, 1, 0)
        End Set
    End Property



    Public Property OverWriteFiles() As Boolean
        Get
            OverWriteFiles = miOverWriteFiles = 1
        End Get
        Set(value As Boolean)
            miOverWriteFiles = IIf(value, 1, 0)
        End Set
    End Property



    Public Property ConvertCRtoCRLF() As Boolean
        Get
            ConvertCRtoCRLF = miConvertCR_CRLF = 1
        End Get
        Set(value As Boolean)
            miConvertCR_CRLF = IIf(value, 1, 0)
        End Set
    End Property



    Public Property Verbose() As Boolean
        Get
            Verbose = miVerbose = 1
        End Get
        Set(value As Boolean)
            miVerbose = IIf(value, 1, 0)
        End Set
    End Property


    Public Property CaseSensitive() As Boolean
        Get
            CaseSensitive = miCaseSensitivity = 1
        End Get
        Set(value As Boolean)
            miCaseSensitivity = IIf(value, 1, 0)
        End Set
    End Property


    Public Property Privilege() As ZPrivilege
        Get
            Privilege = miPrivilege
        End Get
        Set(value As ZPrivilege)
            miPrivilege = value
        End Set
    End Property


    Public Property ZipFileName() As String
        Get
            ZipFileName = msZipFileName
        End Get
        Set(value As String)
            msZipFileName = value
        End Set
    End Property



    Public Property ExtractDir() As String
        Get
            ExtractDir = msExtractDir
        End Get
        Set(value As String)
            msExtractDir = value
        End Set
    End Property

    'Returns <> 0 if Ok 
    Public Function Unzip(Optional sZipFileName As String = "", Optional sExtractDir As String = "") As Long

        Try

            Dim lRet As Long

            If Len(sZipFileName) > 0 Then
                msZipFileName = sZipFileName
            End If

            If Len(sExtractDir) > 0 Then
                msExtractDir = sExtractDir
            End If

            ExtractZipFile(sZipFileName, Nothing, sExtractDir)

            'lRet = VBUnzip(msZipFileName, msExtractDir, miExtractNewer, _
            '    miSpaceUnderScore, miPromptOverwrite, CInt(miQuiet), _
            '    miWriteStdOut, miTestZip, CInt(miExtractList), _
            '    miExtractOnlyNewer, miDisplayComment, miHonorDirectories, _
            '    miOverWriteFiles, miConvertCR_CRLF, miVerbose, _
            '    miCaseSensitivity, CInt(miPrivilege))

            Unzip = lRet
            Return 0


        Catch ex As Exception
            msOutput = Err.Description
            Return -1
            Err.Raise(Err.Number, "CGUnZipFiles::Unzip", Err.Description)
        End Try
    End Function
    'Original Code 
    '    Public Function Unzip(Optional sZipFileName As String = "", Optional sExtractDir As String = "") As Long

    '        On Error GoTo vbErrorHandler

    '        Dim lRet As Long

    '        If Len(sZipFileName) > 0 Then
    '            msZipFileName = sZipFileName
    '        End If

    '        If Len(sExtractDir) > 0 Then
    '            msExtractDir = sExtractDir
    '        End If


    '        lRet = VBUnzip(msZipFileName, msExtractDir, miExtractNewer, _
    '            miSpaceUnderScore, miPromptOverwrite, CInt(miQuiet), _
    '            miWriteStdOut, miTestZip, CInt(miExtractList), _
    '            miExtractOnlyNewer, miDisplayComment, miHonorDirectories, _
    '            miOverWriteFiles, miConvertCR_CRLF, miVerbose, _
    '            miCaseSensitivity, CInt(miPrivilege))

    '        Unzip = lRet

    '        Exit Function

    'vbErrorHandler:
    '        Err.Raise(Err.Number, "CGUnZipFiles::Unzip", Err.Description)

    '    End Function

    Public Sub New()
        miExtractNewer = 0
        miSpaceUnderScore = 0
        miPromptOverwrite = 0
        miQuiet = ZMessageLevel.NoMessages
        miWriteStdOut = 0
        miTestZip = 0
        miExtractList = ZExtractType.Extract
        miExtractOnlyNewer = 0
        miDisplayComment = 0
        miHonorDirectories = 1
        miOverWriteFiles = 1
        miConvertCR_CRLF = 0
        miVerbose = 0
        miCaseSensitivity = 1
        miPrivilege = ZPrivilege.Ignore
    End Sub

    Public Function GetLastMessage() As String
        GetLastMessage = msOutput
    End Function

End Class
