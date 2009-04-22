Attribute VB_Name = "moduleMandant"
Option Compare Database
Option Explicit

'copies an empty database to a new file with extension (mandantname)
'this assures that the clients,
Sub openmandant(mandantName)
   Dim dbName, dbNameEmpty
   Dim cdIR: cdIR = "c:\"

   dbName = cdIR & "IntraSell_2.06_" & mandantName & ".mdb"
   dbNameEmpty = cdIR & "IntraSell_2.06.mdb"
   
   
   
   Dim fso: Set fso = VBA.CreateObject("Scripting.FileSystemObject")
   
   'check if hte base folder is preoper one
   If Not fso.FileExists(dbNameEmpty) Then
        cdIR = InputBox("Geben Sie das Verzeichnis wo sich die Datenbank befindet an! Bsp: c:\")
        dbName = cdIR & "IntraSell_2.06_" & mandantName & ".mdb"
        dbNameEmpty = cdIR & "IntraSell_2.06_empty.mdb"
   End If
   
   
   If Not fso.FileExists(dbName) Then
        If MsgBox("Mandant " & mandantName & " is not existing! Wollen Sie einen neuen Mandant erstellen?", vbYesNo) Then
            fso.Copyfile dbNameEmpty, dbName ' create new db
        Else 'nein will kein mandant
            Exit Sub ' do nothing
        End If
   End If
      
   ' mandant okay, db exists
    Dim stAppName: stAppName = "msaccess " & dbName
    Call Shell(stAppName, vbMaximizedFocus)
    Application.Quit
End Sub
