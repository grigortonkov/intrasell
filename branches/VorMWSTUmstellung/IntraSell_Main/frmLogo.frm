VERSION 5.00
Begin VB.Form frmLogo 
   BackColor       =   &H80000018&
   BorderStyle     =   0  'None
   Caption         =   "IntraSell"
   ClientHeight    =   4050
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6780
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4050
   ScaleWidth      =   6780
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   4920
      Top             =   360
   End
   Begin VB.Image Image1 
      Height          =   4335
      Left            =   0
      Picture         =   "frmLogo.frx":0000
      Top             =   0
      Width           =   6495
   End
End
Attribute VB_Name = "frmLogo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private counter As Integer

Private Sub Form_Load()
    counter = 0
End Sub

Private Sub Timer1_Timer()
    If counter >= 3 Then
        Timer1.Enabled = False
        IntraSell.Show
        Unload Me
    End If
    counter = counter + 1
End Sub
