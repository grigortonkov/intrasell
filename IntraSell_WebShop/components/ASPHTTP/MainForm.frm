VERSION 5.00
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form MainForm 
   Caption         =   "MainForm"
   ClientHeight    =   1515
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3570
   LinkTopic       =   "Form1"
   ScaleHeight     =   1515
   ScaleWidth      =   3570
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton btnGetFile 
      Caption         =   "Test getFile"
      Height          =   495
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   1575
   End
   Begin VB.CommandButton btnTest 
      Caption         =   "Test getURL"
      Height          =   495
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
   Begin InetCtlsObjects.Inet InetConnection 
      Left            =   3000
      Top             =   480
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
End
Attribute VB_Name = "MainForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub btnGetFile_Click()
  Dim aspHttp  As Object
  Set aspHttp = CreateObject("Tonkov.ASPHttp")
  MsgBox aspHttp.GetFile("http://193.171.36.179/PriceCompare/isell_verysmall.gif", "c:\isell_verysmall.gif")
End Sub

Private Sub btnTest_Click()
  Dim aspHttp  As Object
  Set aspHttp = CreateObject("Tonkov.ASPHttp")
  MsgBox aspHttp.getURL("http://ww.yahoo.com")
    
End Sub


 
