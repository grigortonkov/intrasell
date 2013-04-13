Attribute VB_Name = "FunctionsDEmoversion"
'Option Compare Database
Option Explicit

'Demoversion ist solange die Firma 'Ihre Firma' heisst

Const Demoversion = True
Const MAX_POSSIBLE_RECHNUNGEN = 100 'gerenzwert für die Demoversion
Const MAX_POSSIBLE_KUNDEN = 100 'gerenzwert für die Demoversion
Const CONST_TO_LICKEY = "KALAMARATONKOVGRIGOR" 'erweiterung für Licence key ' to avoid collisions for short company names

'=========================================================
' hier startet das programm!!!!!
'=========================================================
Public Function startIntraSell()

'check if DB connected
 Err.Clear
     On Error Resume Next
       DoCmd.OpenTable "ofVars"
       DoCmd.Close acTable, "ofvars"
      If Err.Number > 0 Then  ' error happened
                'Debug.Print err.Number
                'check if DB file exist
                Dim fso: Set fso = VBA.CreateObject("Scripting.FileSystemObject")
                Dim defaultDBFilename: defaultDBFilename = dbFolder() & "IntraSell_Daten_2.07_Daten.mdb"
                If fso.FileExists(defaultDBFilename) Then
                   Call fRefreshLinks(defaultDBFilename)
                Else
                   MsgBox "The file " & defaultDBFilename & " does not exist! You have to select the proper file!"
                   Call fRefreshLinks("")
                End If
      End If
   On Error GoTo 0
'end check


'check lizenz key
If Not islicenceKeyCorrect() Then ' lizenz nicht ok
        DoCmd.OpenForm "oflizenzierung"
        Call IsDemoVersionOver
Else
   If varvalue("adminpass") <> "" Then ' nur wenn dass passwort gesetzt ist!
        Dim Passwort
           Passwort = InputBox("Passwort (""123"" wenn das erste Mal hier):", "Passwort")
        If Passwort <> varvalue("adminpass") Then
          DoCmd.RunMacro "Quit"
        End If
   End If
End If 'lizenz ok

   If varvalue("Firma") = "Ihre Firma" Then
      MsgBox "Das is eine Shareware Version! " & Chr(13) & Chr(10) & _
                      "Wir bitten Sie höfflichst diese Software zu registrieren - www.vegsys.com." & Chr(13) & Chr(10) & _
                      "Viel Erfolg!"
      Call IsDemoVersionOver
   End If
   
   'Call checkBranche
   
End Function

'=========================================================
' Prüft ob die Demoversion abgelaufen ist
'=========================================================
Function IsDemoVersionOver()
   Dim rs As Recordset
   Dim demoIsOver As Boolean
   demoIsOver = False
   
   Set rs = CurrentDB.openRecordset("DEMOVERSION_COUNT_KUNDEN")
   If Not rs.EOF Then
      If rs("Sum") > MAX_POSSIBLE_KUNDEN Then
      demoIsOver = True
      End If
   End If
   rs.Close
   
   Set rs = CurrentDB.openRecordset("DEMOVERSION_COUNT_RECHNUNGEN")
   If Not rs.EOF Then
      If rs("Sum") > MAX_POSSIBLE_RECHNUNGEN Then
      demoIsOver = True
      End If
   End If
   rs.Close
   
   
   IsDemoVersionOver = demoIsOver
   
   If demoIsOver Then
        MsgBox "Sorry! Diese Demoversion ist Abgelaufen! Sie werden höflichst " & _
        " geboten diese Software zu bestellen. Informationen unter: http://intrasoft.get.to"
        DoCmd.Quit
   End If

End Function

'checks if the lizKey is correct
'licKey has 8 chars
'arFehRGR ist die code für "Ihre Firma"
Public Function islicenceKeyCorrect()
    Dim Firma, licKey, i
    Firma = varvalue("Firma")
    licKey = Trim(varvalue("Lizenzcode") & "")
    
    If Len(licKey) <> 8 Then
       'Call MsgBox("Die Lizenzcode hat 8 Stellen!", vbCritical)
       islicenceKeyCorrect = False
       Exit Function
    End If
    
    Dim lickeyCorrect
    lickeyCorrect = CONST_TO_LICKEY & Firma
    
    For i = 1 To 8 'jede 2 te buchstabe
       If Not Mid(licKey, i, 1) = Mid(lickeyCorrect, Len(lickeyCorrect) - (i - 1) * 2, 1) Then
         islicenceKeyCorrect = False
         Exit Function
       End If
       
    Next i
    islicenceKeyCorrect = True
End Function

'=========================================================
' generiert ein KEy nach Firmennamen
'=========================================================
Function keyGen(Firma)

Dim lickeyCorrect: lickeyCorrect = CONST_TO_LICKEY & Firma
    Dim licKey, i
        For i = 1 To 8 'jede 2 te buchstabe
                licKey = licKey & Mid(lickeyCorrect, Len(lickeyCorrect) - (i - 1) * 2, 1)
        Next i
    Debug.Print licKey
    keyGen = licKey
End Function


