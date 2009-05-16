VERSION 5.00
Begin VB.MDIForm IntraSell 
   BackColor       =   &H8000000C&
   Caption         =   "IntraSell3 by grigor.tonkov@gmail.com"
   ClientHeight    =   7890
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   11445
   Icon            =   "IntraSell.frx":0000
   LinkTopic       =   "Form1"
   StartUpPosition =   3  'Windows Default
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
      Begin VB.Menu ISHomepage 
         Caption         =   "Intrasell Homepage"
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


Private mOldParent As Long

Private WithEvents eForm As Form
Attribute eForm.VB_VarHelpID = -1

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

 

Private Sub MDIForm_Load()

On Error GoTo errLine
        
        Call ShowWindow(Me.hwnd, SW_SHOWMAXIMIZED)
        
        ' Start a new instance of Access for Automation:
        Set oAccess = New Access.Application
        oAccess.Visible = True
       
        Call SetParent(oAccess.hWndAccessApp, Me.hwnd)
        Call ShowWindow(oAccess.hWndAccessApp, SW_SHOWMAXIMIZED)
        
        Call Open_Click
        

Call ShowWindow(oAccess.hWndAccessApp, SW_HIDE)
Call ShowWindow(oAccess.hWndAccessApp, SW_SHOWMAXIMIZED)

        Exit Sub
        
        'error
errLine:
        MsgBox "Error in MDIForm_Load" & Err.Description
        Err.Clear
        Exit Sub
        
End Sub

Private Sub MDIForm_Unload(Cancel As Integer)
 Call Close_Click
End Sub

Private Sub Open_Click()
On Error GoTo errLine
    ' Open a database in exclusive mode:
    Dim isFilename As String
    isFilename = App.Path & "\..\intrasell\IntraSell_3.mdb"
    Call oAccess.OpenCurrentDatabase(filepath:=isFilename, Exclusive:=True, bstrPassword:="brunojj1")
    
     Exit Sub
        
        'error
errLine:
        MsgBox "Error in Open_Click" & Err.Description
        Err.Clear
        Exit Sub
        
End Sub

Private Sub Close_Click()
On Error GoTo errLine
   Call oAccess.CloseCurrentDatabase
   
 Exit Sub
        
        'error
errLine:
        MsgBox "Error in Close_Click" & Err.Description
        Err.Clear
        Exit Sub
        
        
End Sub

