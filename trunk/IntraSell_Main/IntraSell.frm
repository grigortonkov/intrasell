VERSION 5.00
Begin VB.Form IntraSell 
   BackColor       =   &H80000018&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "IntraSell3 by grigor.tonkov@gmail.com: Save Time! Save Money!"
   ClientHeight    =   4470
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   9390
   Icon            =   "IntraSell.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   298
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   626
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   4200
      Top             =   240
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Run program IntraSell"
      Height          =   1215
      Left            =   7920
      MouseIcon       =   "IntraSell.frx":6852
      MousePointer    =   99  'Custom
      Picture         =   "IntraSell.frx":6C94
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   3120
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Check for updates"
      Height          =   1215
      Left            =   6360
      MouseIcon       =   "IntraSell.frx":6F9E
      MousePointer    =   99  'Custom
      Picture         =   "IntraSell.frx":73E0
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   3120
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      Caption         =   "IntraSell Homepage"
      Height          =   1215
      Left            =   4800
      MouseIcon       =   "IntraSell.frx":7822
      MousePointer    =   99  'Custom
      Picture         =   "IntraSell.frx":7C64
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   3120
      Width           =   1335
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Thank you for choosing IntraSell!"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000080&
      Height          =   2895
      Left            =   4800
      TabIndex        =   0
      Top             =   120
      Width           =   4455
      WordWrap        =   -1  'True
   End
   Begin VB.Line Line1 
      BorderColor     =   &H80000013&
      X1              =   296
      X2              =   296
      Y1              =   8
      Y2              =   288
   End
   Begin VB.Image Image1 
      Height          =   4500
      Index           =   0
      Left            =   0
      Picture         =   "IntraSell.frx":80A6
      Stretch         =   -1  'True
      Top             =   0
      Width           =   4500
   End
End
Attribute VB_Name = "IntraSell"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const LabelCaption = "Thank you for choosing IntraSell!"

Const MSG_OpenHomePage = "Open home page. Please wait..."

Const MSG_UpdateComplete = "Update complete!" & vbLf & "Run program now."
Const MSG_UpdateCheck = "Check for update. Please wait..."
Const MSG_UpdateError = "Error update! Check later."

Private Declare Function ShellExecute _
    Lib "shell32.dll" Alias "ShellExecuteA" ( _
    ByVal hwnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long
    
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, _
     ByVal nCmdShow As Long) As Long

Const SW_SHOWMAXIMIZED = 3

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

Dim CounterStart As Integer

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

Private Sub Command1_Click()
On Error Resume Next
    Timer1.Enabled = False
    Label1.Caption = LabelCaption & vbLf & vbLf & MSG_OpenHomePage
    ShellExecute 0, "OPEN", "http://www.griton.eu", vbNullString, vbNullString, 1
    Label1.Caption = LabelCaption
End Sub

Private Sub Command2_Click()
On Error GoTo errLine
    Dim resultDownload As Boolean
    
    ' "http://intrasell.googlecode.com/files/update.txt"
    Timer1.Enabled = False
    Label1.Caption = LabelCaption & vbLf & vbLf & MSG_UpdateCheck
    
    resultDownload = DownloadFile("http://intrasell.googlecode.com/files/update.txt", App.Path & "\update.txt")
        
    If resultDownload Then
        ' TODO Check update.txt and download and save new versions
        
        Label1.Caption = LabelCaption & vbLf & vbLf & MSG_UpdateComplete
    Else
        Label1.Caption = LabelCaption & vbLf & vbLf & MSG_UpdateError
    End If
    
    Command3.SetFocus
    
    Exit Sub

errLine:
    Label1.Caption = LabelCaption
    MsgBox "Error: " & Err.Description
    Err.Clear
End Sub

Private Sub Command3_Click()
On Error GoTo errLine
    Dim isFilename As String: isFilename = App.Path & "\..\intrasell\IntraSell_3.mdb"
    
    Dim oAccess As Access.Application
    Set oAccess = New Access.Application
    oAccess.Visible = True
    
    ' set access low macro security
    If oAccess.Version >= "10" Then
       oAccess.AutomationSecurity = 1 ' msoAutomationSecurityLow
    End If

    ' hide ribbons in office 2007
    'If oAccess.Version >= "10" Then
    '    Dim xml As String: xml = "<customUI xmlns=""http://schemas.microsoft.com/office/2006/01/customui""><ribbon startFromScratch=""true""></ribbon></customUI>"
    '    oAccess.LoadCustomUI "HideRibbon", xml
    'End If
    
    oAccess.SetOption "ShowWindowsInTaskbar", True
    ' Call oAccess.CompactRepair(isFilename, App.Path & "\..\intrasell\IntraSell_3_CompactAndRepair.mdb")
           
    Call oAccess.OpenCurrentDatabase(filepath:=isFilename, Exclusive:=True, bstrPassword:="brunojj1")
        
    Call ShowWindow(oAccess.hWndAccessApp, SW_SHOWMAXIMIZED)
    
    Unload Me
    
    Exit Sub
    
errLine:
        MsgBox "Error: " & Err.Description
        Err.Clear
End Sub

Private Sub Form_Load()
On Error Resume Next
    Label1.Caption = LabelCaption
    Command1.BackColor = Me.BackColor
    Command2.BackColor = Me.BackColor
    Command3.BackColor = Me.BackColor
    CounterStart = 11
End Sub

Private Function openDatabase()
On Error GoTo errLine
    ' Open a database in exclusive mode:
    Dim isFilename As String
    isFilename = App.Path & "\..\intrasell\IntraSell_3.mdb"
    
    Call oAccess.OpenCurrentDatabase(filepath:=isFilename, Exclusive:=True, bstrPassword:="brunojj1")
    
     Exit Function
        
errLine:
        MsgBox "Error in Open_Click" & Err.Description
        Err.Clear
        Exit Function
End Function

Private Sub Timer1_Timer()
On Error Resume Next
    CounterStart = CounterStart - 1
    Label1.Caption = LabelCaption & vbLf & vbLf & "Auto Star after: " & CounterStart
    If CounterStart = 0 Then
        Call Command3_Click
        Label1.Caption = LabelCaption
        Timer1.Enabled = False
    End If
End Sub
