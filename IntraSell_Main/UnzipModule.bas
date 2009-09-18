Attribute VB_Name = "UnzipModule"
Option Explicit

Public Type UNZIPnames
  uzFiles(0 To 99) As String
End Type

Public Type UNZIPCBChar
  ch(32800) As Byte
End Type

Public Type UNZIPCBCh
  ch(256) As Byte
End Type

'-- UNZIP32.DLL DCL Structure
Public Type DCLIST
  ExtractOnlyNewer  As Long    ' 1 = Extract Only Newer, Else 0
  SpaceToUnderScore As Long    ' 1 = Convert Space To Underscore, Else 0
  PromptToOverwrite As Long    ' 1 = Prompt To Overwrite Required, Else 0
  fQuiet            As Long    ' 2 = No Messages, 1 = Less, 0 = All
  ncflag            As Long    ' 1 = Write To Stdout, Else 0
  ntflag            As Long    ' 1 = Test Zip File, Else 0
  nvflag            As Long    ' 0 = Extract, 1 = List Zip Contents
  nUflag            As Long    ' 1 = Extract Only Newer, Else 0
  nzflag            As Long    ' 1 = Display Zip File Comment, Else 0
  ndflag            As Long    ' 1 = Honor Directories, Else 0
  noflag            As Long    ' 1 = Overwrite Files, Else 0
  naflag            As Long    ' 1 = Convert CR To CRLF, Else 0
  nZIflag           As Long    ' 1 = Zip Info Verbose, Else 0
  C_flag            As Long    ' 1 = Case Insensitivity, 0 = Case Sensitivity
  fPrivilege        As Long    ' 1 = ACL, 2 = Privileges
  Zip               As String  ' The Zip Filename To Extract Files
  ExtractDir        As String  ' The Extraction Directory, NULL If Extracting To Current Dir
End Type

'-- UNZIP32.DLL Userfunctions Structure
Public Type USERFUNCTION
  UZDLLPrnt     As Long     ' Pointer To Apps Print Function
  UZDLLSND      As Long     ' Pointer To Apps Sound Function
  UZDLLREPLACE  As Long     ' Pointer To Apps Replace Function
  UZDLLPASSWORD As Long     ' Pointer To Apps Password Function
  UZDLLMESSAGE  As Long     ' Pointer To Apps Message Function
  UZDLLSERVICE  As Long     ' Pointer To Apps Service Function (Not Coded!)
  TotalSizeComp As Long     ' Total Size Of Zip Archive
  TotalSize     As Long     ' Total Size Of All Files In Archive
  CompFactor    As Long     ' Compression Factor
  NumMembers    As Long     ' Total Number Of All Files In The Archive
  cchComment    As Integer  ' Flag If Archive Has A Comment!
End Type

'-- UNZIP32.DLL Version Structure
Public Type UZPVER
  structlen       As Long         ' Length Of The Structure Being Passed
  flag            As Long         ' Bit 0: is_beta  bit 1: uses_zlib
  beta            As String * 10  ' e.g., "g BETA" or ""
  date            As String * 20  ' e.g., "4 Sep 95" (beta) or "4 September 1995"
  zlib            As String * 10  ' e.g., "1.0.5" or NULL
  Unzip(1 To 4)   As Byte         ' Version Type Unzip
  zipinfo(1 To 4) As Byte         ' Version Type Zip Info
  os2dll          As Long         ' Version Type OS2 DLL
  windll(1 To 4)  As Byte         ' Version Type Windows DLL
End Type

'-- This Assumes UNZIP32.DLL Is In Your \Windows\System Directory!
Private Declare Function Wiz_SingleEntryUnzip Lib "unzip32.dll" _
  (ByVal ifnc As Long, ByRef ifnv As UNZIPnames, _
   ByVal xfnc As Long, ByRef xfnv As UNZIPnames, _
   dcll As DCLIST, Userf As USERFUNCTION) As Long

Private Declare Sub UzpVersion2 Lib "unzip32.dll" (uzpv As UZPVER)

'argv
Public Type ZIPnames
    s(0 To 99) As String
End Type

'ZPOPT is used to set options in the zip32.dll
Private Type ZPOPT
    fSuffix As Long
    fEncrypt As Long
    fSystem As Long
    fVolume As Long
    fExtra As Long
    fNoDirEntries As Long
    fExcludeDate As Long
    fIncludeDate As Long
    fVerbose As Long
    fQuiet As Long
    fCRLF_LF As Long
    fLF_CRLF As Long
    fJunkDir As Long
    fRecurse As Long
    fGrow As Long
    fForce As Long
    fMove As Long
    fDeleteEntries As Long
    fUpdate As Long
    fFreshen As Long
    fJunkSFX As Long
    fLatestTime As Long
    fComment As Long
    fOffsets As Long
    fPrivilege As Long
    fEncryption As Long
    fRepair As Long
    flevel As Byte
    date As String ' 8 bytes long
    szRootDir As String ' up to 256 bytes long
End Type

Private Type ZIPUSERFUNCTIONS
    DLLPrnt As Long
    DLLPASSWORD As Long
    DLLCOMMENT As Long
    DLLSERVICE As Long
End Type

'Structure ZCL - not used by VB
'Private Type ZCL
'    argc As Long            'number of files
'    filename As String      'Name of the Zip file
'    fileArray As ZIPnames   'The array of filenames
'End Type

' Call back "string" (sic)
Private Type CBChar
    ch(4096) As Byte
End Type

'Local declares

Private uZipNumber As Integer
Private uZipMessage As String
Private uZipInfo As String
Private uVBSkip As Integer
Public msOutput As String

' Puts a function pointer in a structure
Function FnPtr(ByVal lp As Long) As Long
    FnPtr = lp
End Function

'-- Callback For UNZIP32.DLL - Receive Message Function
Public Sub UZReceiveDLLMessage(ByVal ucsize As Long, _
    ByVal csiz As Long, _
    ByVal cfactor As Integer, _
    ByVal mo As Integer, _
    ByVal dy As Integer, _
    ByVal yr As Integer, _
    ByVal hh As Integer, _
    ByVal mm As Integer, _
    ByVal c As Byte, ByRef fname As UNZIPCBCh, _
    ByRef meth As UNZIPCBCh, ByVal crc As Long, _
    ByVal fCrypt As Byte)

  Dim s0     As String
  Dim xx     As Long
  Dim strout As String * 80

  '-- Always Put This In Callback Routines!
  On Error Resume Next

  '------------------------------------------------
  '-- This Is Where The Received Messages Are
  '-- Printed Out And Displayed.
  '-- You Can Modify Below!
  '------------------------------------------------

  strout = Space(80)

  '-- For Zip Message Printing
  If uZipNumber = 0 Then
    Mid(strout, 1, 50) = "Filename:"
    Mid(strout, 53, 4) = "Size"
    Mid(strout, 62, 4) = "Date"
    Mid(strout, 71, 4) = "Time"
    uZipMessage = strout & vbNewLine
    strout = Space(80)
  End If

  s0 = ""

  '-- Do Not Change This For Next!!!
  For xx = 0 To 255
    If fname.ch(xx) = 0 Then Exit For
    s0 = s0 & Chr(fname.ch(xx))
  Next

  '-- Assign Zip Information For Printing
  Mid(strout, 1, 50) = Mid(s0, 1, 50)
  Mid(strout, 51, 7) = Right("        " & Str(ucsize), 7)
  Mid(strout, 60, 3) = Right("0" & Trim(Str(mo)), 2) & "/"
  Mid(strout, 63, 3) = Right("0" & Trim(Str(dy)), 2) & "/"
  Mid(strout, 66, 2) = Right("0" & Trim(Str(yr)), 2)
  Mid(strout, 70, 3) = Right(Str(hh), 2) & ":"
  Mid(strout, 73, 2) = Right("0" & Trim(Str(mm)), 2)

  ' Mid(strout, 75, 2) = Right(" " & Str(cfactor), 2)
  ' Mid(strout, 78, 8) = Right("        " & Str(csiz), 8)
  ' s0 = ""
  ' For xx = 0 To 255
  '     If meth.ch(xx) = 0 Then exit for
  '     s0 = s0 & Chr(meth.ch(xx))
  ' Next xx

  '-- Do Not Modify Below!!!
  uZipMessage = uZipMessage & strout & vbNewLine
  uZipNumber = uZipNumber + 1

End Sub

'-- Callback For UNZIP32.DLL - Print Message Function
Public Function UZDLLPrnt(ByRef fname As UNZIPCBChar, ByVal x As Long) As Long

  Dim s0 As String
  Dim xx As Long

  '-- Always Put This In Callback Routines!
  On Error Resume Next

  s0 = ""

  '-- Gets The UNZIP32.DLL Message For Displaying.
  For xx = 0 To x - 1
    If fname.ch(xx) = 0 Then Exit For
    s0 = s0 & Chr(fname.ch(xx))
  Next

  '-- Assign Zip Information
  If Mid$(s0, 1, 1) = vbLf Then s0 = vbNewLine ' Damn UNIX :-)
  uZipInfo = uZipInfo & s0

msOutput = uZipInfo
    
  UZDLLPrnt = 0

End Function

'-- Callback For UNZIP32.DLL - DLL Service Function
Public Function UZDLLServ(ByRef mname As UNZIPCBChar, ByVal x As Long) As Long

    Dim s0 As String
    Dim xx As Long
    
    '-- Always Put This In Callback Routines!
    On Error Resume Next
    
    s0 = ""
    '-- Get Zip32.DLL Message For processing
    For xx = 0 To x - 1
        If mname.ch(xx) = 0 Then Exit For
        s0 = s0 + Chr(mname.ch(xx))
    Next
    ' At this point, s0 contains the message passed from the DLL
    ' It is up to the developer to code something useful here :)
    UZDLLServ = 0 ' Setting this to 1 will abort the zip!

End Function

'-- Callback For UNZIP32.DLL - Password Function
Public Function UZDLLPass(ByRef p As UNZIPCBCh, _
  ByVal n As Long, ByRef m As UNZIPCBCh, _
  ByRef Name As UNZIPCBCh) As Integer

  Dim prompt     As String
  Dim xx         As Integer
  Dim szpassword As String

  '-- Always Put This In Callback Routines!
  On Error Resume Next

  UZDLLPass = 1

  If uVBSkip = 1 Then Exit Function

  '-- Get The Zip File Password
  szpassword = InputBox("Please Enter The Password!")

  '-- No Password So Exit The Function
  If szpassword = "" Then
    uVBSkip = 1
    Exit Function
  End If

  '-- Zip File Password So Process It
  For xx = 0 To 255
    If m.ch(xx) = 0 Then
      Exit For
    Else
      prompt = prompt & Chr(m.ch(xx))
    End If
  Next

  For xx = 0 To n - 1
    p.ch(xx) = 0
  Next

  For xx = 0 To Len(szpassword) - 1
    p.ch(xx) = Asc(Mid(szpassword, xx + 1, 1))
  Next

  p.ch(xx) = Chr(0) ' Put Null Terminator For C

  UZDLLPass = 0

End Function

'-- Callback For UNZIP32.DLL - Report Function To Overwrite Files.
'-- This Function Will Display A MsgBox Asking The User
'-- If They Would Like To Overwrite The Files.
Public Function UZDLLRep(ByRef fname As UNZIPCBChar) As Long

  Dim s0 As String
  Dim xx As Long

  '-- Always Put This In Callback Routines!
  On Error Resume Next

  UZDLLRep = 100 ' 100 = Do Not Overwrite - Keep Asking User
  s0 = ""

  For xx = 0 To 255
    If fname.ch(xx) = 0 Then xx = 99999 Else s0 = s0 & Chr(fname.ch(xx))
  Next

  '-- This Is The MsgBox Code
  xx = MsgBox("Overwrite " & s0 & "?", vbExclamation & vbYesNoCancel, _
              "VBUnZip32 - File Already Exists!")

  If xx = vbNo Then Exit Function

  If xx = vbCancel Then
    UZDLLRep = 104       ' 104 = Overwrite None
    Exit Function
  End If

  UZDLLRep = 102         ' 102 = Overwrite 103 = Overwrite All

End Function

'-- ASCIIZ To String Function
Public Function szTrim(szString As String) As String
    
    Dim pos As Integer
    Dim ln  As Integer
    
    pos = InStr(szString, Chr(0))
    ln = Len(szString)
    
    Select Case pos
        Case Is > 1
            szTrim = Trim(Left(szString, pos - 1))
        Case 1
            szTrim = ""
        Case Else
            szTrim = Trim(szString)
    End Select

End Function


Public Function VBUnzip(ByRef sZipFileName, ByRef sUnzipDirectory As String, _
    ByRef iExtractNewer As Integer, _
    ByRef iSpaceUnderScore As Integer, _
    ByRef iPromptOverwrite As Integer, _
    ByRef iQuiet As Integer, _
    ByRef iWriteStdOut As Integer, _
    ByRef iTestZip As Integer, _
    ByRef iExtractList As Integer, _
    ByRef iExtractOnlyNewer As Integer, _
    ByRef iDisplayComment As Integer, _
    ByRef iHonorDirectories As Integer, _
    ByRef iOverwriteFiles As Integer, _
    ByRef iConvertCR_CRLF As Integer, _
    ByRef iVerbose As Integer, _
    ByRef iCaseSensitivty As Integer, _
    ByRef iPrivilege As Integer) As Long


On Error GoTo vbErrorHandler

    
    Dim lRet As Long
    
    Dim UZDCL As DCLIST
    Dim UZUSER As USERFUNCTION
    Dim UZVER As UZPVER
    Dim uExcludeNames As UNZIPnames
    Dim uZipNames     As UNZIPnames
    
    msOutput = ""
    
    uExcludeNames.uzFiles(0) = vbNullString
    uZipNames.uzFiles(0) = vbNullString
    
    uZipNumber = 0
    uZipMessage = vbNullString
    uZipInfo = vbNullString
    uVBSkip = 0
    
    With UZDCL
        .ExtractOnlyNewer = iExtractOnlyNewer
        .SpaceToUnderScore = iSpaceUnderScore
        .PromptToOverwrite = iPromptOverwrite
        .fQuiet = iQuiet
        .ncflag = iWriteStdOut
        .ntflag = iTestZip
        .nvflag = iExtractList
        .nUflag = iExtractNewer
        .nzflag = iDisplayComment
        .ndflag = iHonorDirectories
        .noflag = iOverwriteFiles
        .naflag = iConvertCR_CRLF
        .nZIflag = iVerbose
        .C_flag = iCaseSensitivty
        .fPrivilege = iPrivilege
        .Zip = sZipFileName
        .ExtractDir = sUnzipDirectory
    End With
    
    With UZUSER
        .UZDLLPrnt = FnPtr(AddressOf UZDLLPrnt)
        .UZDLLSND = 0&
        .UZDLLREPLACE = FnPtr(AddressOf UZDLLRep)
        .UZDLLPASSWORD = FnPtr(AddressOf UZDLLPass)
        .UZDLLMESSAGE = FnPtr(AddressOf UZReceiveDLLMessage)
        .UZDLLSERVICE = FnPtr(AddressOf UZDLLServ)
    End With
    
    With UZVER
        .structlen = Len(UZVER)
        .beta = Space$(9) & vbNullChar
        .date = Space$(19) & vbNullChar
        .zlib = Space$(9) & vbNullChar
    End With
    
    UzpVersion2 UZVER
    
    lRet = Wiz_SingleEntryUnzip(0, uZipNames, 0, uExcludeNames, UZDCL, UZUSER)
    VBUnzip = lRet
    

    Exit Function

vbErrorHandler:
    Err.Raise Err.Number, "CodeModule::VBUnzip", Err.Description

End Function
