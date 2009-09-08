VERSION 5.00
Begin VB.MDIForm IntraSell 
   BackColor       =   &H8000000C&
   Caption         =   "IntraSell3 by grigor.tonkov@gmail.com: Save Time! Save Money!"
   ClientHeight    =   7890
   ClientLeft      =   165
   ClientTop       =   555
   ClientWidth     =   11445
   Icon            =   "IntraSell.frx":0000
   LinkTopic       =   "Form1"
   StartUpPosition =   2  'CenterScreen
   WindowState     =   2  'Maximized
   Begin VB.Menu Files 
      Caption         =   "&Datei"
      Begin VB.Menu Open 
         Caption         =   "&Oeffnen"
      End
      Begin VB.Menu Close 
         Caption         =   "&Schliessen"
      End
   End
   Begin VB.Menu Help 
      Caption         =   "&Hilfe"
      Begin VB.Menu CheckUpdates 
         Caption         =   "&Update"
      End
      Begin VB.Menu ISHomepage 
         Caption         =   "&Intrasell Homepage"
      End
   End
End
Attribute VB_Name = "IntraSell"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long

Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, _
     ByVal nCmdShow As Long) As Long
     
Private Declare Function FindWindow Lib "user32" _
 Alias "FindWindowA" (ByVal lpClassName As String, _
 ByVal lpWindowName As String) As Long
 
Private Declare Function GetWindow Lib "user32" _
 (ByVal hwnd As Long, ByVal wCmd As Long) As Long

Private Declare Function SetParent Lib "user32" _
 (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long

Private Declare Function ReleaseCapture Lib "user32" () As Long

Private Declare Function SendMessage Lib "user32" _
 Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, _
 ByVal wParam As Long, lParam As Any) As Long

Private Declare Function ShellExecute _
    Lib "shell32.dll" Alias "ShellExecuteA" ( _
    ByVal hwnd As Long, _
    ByVal lpOperation As String, _
    ByVal lpFile As String, _
    ByVal lpParameters As String, _
    ByVal lpDirectory As String, _
    ByVal nShowCmd As Long) As Long

Private mOldParent As Long

Private pMovable As Boolean

Dim dwReturn As Long
Dim oAccess As Access.Application

Const SW_HIDE = 0
Const SW_SHOWNORMAL = 1
Const SW_SHOWMINIMIZED = 2
Const SW_SHOWMAXIMIZED = 3

Public Function fAccessWindow(Optional Procedure As String, Optional SwitchStatus As Boolean, Optional StatusCheck As Boolean) As Boolean
If Procedure = "Hide" Then
    dwReturn = ShowWindow(Application.hWndAccessApp, SW_HIDE)
End If
If Procedure = "Show" Then
    dwReturn = ShowWindow(Application.hWndAccessApp, SW_SHOWMAXIMIZED)
End If
If Procedure = "Minimize" Then
    dwReturn = ShowWindow(Application.hWndAccessApp, SW_SHOWMINIMIZED)
End If
If SwitchStatus = True Then
    If IsWindowVisible(hWndAccessApp) = 1 Then
        dwReturn = ShowWindow(Application.hWndAccessApp, SW_HIDE)
    Else
        dwReturn = ShowWindow(Application.hWndAccessApp, SW_SHOWMAXIMIZED)
    End If
End If
If StatusCheck = True Then
    If IsWindowVisible(hWndAccessApp) = 0 Then
        fAccessWindow = False
    End If
    If IsWindowVisible(hWndAccessApp) = 1 Then
        fAccessWindow = True
    End If
End If
End Function

Private Sub CheckUpdates_Click()
    ' Old code in function begin
    ' NavigateURL "http://code.google.com/p/intrasell"
    ' Old code in function end

    Call UpdateIntraSell

End Sub


Private Sub ISHomepage_Click()
    'NavigateURL "http://www.griton.eu"
    ShellExecute 0, "OPEN", "http://www.griton.eu", vbNullString, vbNullString, SW_SHOWNORMAL
End Sub

Private Sub MDIForm_DblClick()
   'open DB
   Call openDatabase
End Sub

Private Sub MDIForm_Load()
On Error GoTo errLine
        
        Call CheckUpdates_Click
        
        Call ShowWindow(Me.hwnd, SW_SHOWMAXIMIZED)
        
        ' Start a new instance of Access for Automation:
        Set oAccess = New Access.Application
        
        ' Sasho begin
        ' set access low macro security
        If oAccess.Version >= "10" Then
           oAccess.AutomationSecurity = 1 ' msoAutomationSecurityLow
        End If
    
        ' hide ribbons in office 2007
        'If oAccess.Version >= "10" Then
        '    Dim xml As String: xml = "<customUI xmlns=""http://schemas.microsoft.com/office/2006/01/customui""><ribbon startFromScratch=""true""></ribbon></customUI>"
        '    oAccess.LoadCustomUI "HideRibbon", xml
        'End If
        
        oAccess.SetOption "ShowWindowsInTaskbar", False
        ' Call oAccess.CompactRepair(isFilename, App.Path & "\..\intrasell\IntraSell_3_CompactAndRepair.mdb")
        'Sasho end
        
        oAccess.Visible = True
       
        Call SetParent(oAccess.hWndAccessApp, Me.hwnd)
        Call ShowWindow(oAccess.hWndAccessApp, SW_SHOWMAXIMIZED)
        
        Call openDatabase
        
        Call ShowWindow(oAccess.hWndAccessApp, SW_HIDE)
        Call ShowWindow(oAccess.hWndAccessApp, SW_SHOWMAXIMIZED)

        Exit Sub
        
        'error
errLine:
        MsgBox "Error in MDIForm_Load" & Err.Description
        Err.Clear
        Exit Sub
        
End Sub

Public Function openDatabase()
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

Private Sub MDIForm_Unload(Cancel As Integer)
    Call Close_Click
End Sub

Private Sub Open_Click()
   Call openDatabase
End Sub

Public Sub Close_Click()
On Error GoTo errLine
    If Not IsNull(oAccess) Then
        Call oAccess.CloseCurrentDatabase
    End If
    
    Exit Sub

errLine:
    Debug.Print "Error in Close_Click" & Err.Description
    Err.Clear
    Exit Sub
End Sub

'Public Sub NavigateURL(ByVal URL As String)
'Dim File As String
'Dim fH   As Integer
'
'   ' Create a URLShortcut File so that the url.dll function OpenURL will work
'   File = App.Path & "\" & VBA.Format(Now, "HH_NN_SS") & ".URL"
'   fH = FreeFile
'   Open File For Output As #fH
'      Print #fH, "[InternetShortcut]"
'      Print #fH, "URL=" & URL
'   Close #fH
'
'   Shell "rundll32.exe url.dll, OpenURL " & File, 1
'
'   Kill File
'End Sub
