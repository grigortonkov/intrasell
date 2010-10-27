Attribute VB_Name = "AccessRintime"
'----------------------------------------------------------------------
'This procedure sets a module-level variable, objAccess, to refer to
'an instance of Microsoft Access. The code first tries to use GetObject
'to refer to an instance that might already be open and contains the
'specified database (dbpath). If the database is not already open in
'an instance of Microsoft Access, a new instance of the full version of
'Microsoft Access is opened. If the full version of Microsoft Access is
'not installed, the Shell() function starts a run-time instance of
'Microsoft Access. Once the instance is opened, you can use the
'CloseCurrentDatabase and OpenCurrentDatabase methods to work with other
'databases.
'----------------------------------------------------------------------
Sub OpenRunTime()
  Dim accpath As String, dbpath As String
  On Error Resume Next
  dbpath = App.Path & "\..\intrasell\dummy.mdb"
  dbpath = App.Path & "\..\intrasell\IntraSell_3.mdb"
  Set objAccess = GetObject(dbpath)
  If err <> 0 Then
    If Dir(dbpath) = "" Then 'dbpath is not valid
      MsgBox "Couldn't find database."
      Exit Sub
    Else  'The full version of Microsoft Access is not installed.
      accpath = "c:\Programme\Microsoft Office\Office12\MSAccess.exe"
      accpath = "C:\Program Files (x86)\Microsoft Office\Office12\MSAccess.exe"
      
      If Dir(accpath) = "" Then
         MsgBox "Couldn't find Microsoft Access."
         Exit Sub
      Else
         Shell pathname:=accpath & " " & Chr(34) & dbpath & Chr(34), _
           windowstyle:=6
         Do 'Wait for shelled process to finish
           err = 0
           Set objAccess = GetObject(dbpath)
               oAccess.AutomationSecurity = 1
            
            Call objAccess.OpenCurrentDatabase(filepath:=dbpath, Exclusive:=True, bstrPassword:="brunojj1")
           
         Loop While err <> 0
      End If
    End If
  End If
End Sub

