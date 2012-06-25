VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "ASPHttp"
Attribute VB_GlobalNameSpace = True
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

' ASPHttp is DLL with function
' Tonkov.aspHttp.callURL ("http://server/page.htm")
'
'
' Copyright Grigor TONKOV 2001 (R)
'
Dim frm As MainForm


' return the text representation of URL call
'
Public Function getURL(ByVal url As String) As String
 'CREATE COMPONENTS
 Dim result
  If frm Is Nothing Then
    Set frm = New MainForm
  End If
  
  'CALL URL
  result = frm.InetConnection.OpenURL(url)
  getURL = result
  
  
 'UNLOAD COMPONENTS
  frm.InetConnection.Cancel
  Unload frm
  
End Function



' gets an file from internet by http protocol
' Copyright Grigor TONKOV 2001 (R)
'
' s - ursl of file
' d - physical filename the file to be saved on
'
Public Function GetFile(ByVal s As String, ByVal d As String)
  If frm Is Nothing Then
    Set frm = New MainForm
  End If
  
    Debug.Print s, d
    Dim x() As Byte
    frm.InetConnection.url = s
    'Inet1.UserName = Text2.Text
    'Inet1.Password = Text3.Text
    x = frm.InetConnection.OpenURL(, icByteArray)
    Open d For Binary Access Write As #1
    Put #1, , x()
    Close #1
    'MsgBox "Ready!"

 'UNLOAD COMPONENTS
  frm.InetConnection.Cancel
  Unload frm
  GetFile = True
End Function

