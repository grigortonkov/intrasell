'Module FunctionsOnStart

'    Public Const VARNAME_BRANCHE = "BRANCHE"
'    Public Const BACKEND_NAME = "IntraSell_Daten_2.mdb"
'    Public Const POSITION_DEALER As String = "Dealer_Logik_Deaktiviert" '"Dealer"
'    Public Const POSITION_ADMINISTRATOR = "Admin"

'    '=========================================================
'    ' hier startet das intrasell programm
'    '=========================================================
'    Public Function startIntraSell()
'        startIntraSell = 0 ' ok
'        'check if DB connected
'        err.Clear()
'        On Error Resume Next 'needed to open the tables

'        Dim rs
'        rs = openRecordset("ofVars")
'        'DoCmd.OpenTable "ofVars", acViewNormal, acReadOnly
'        'DoCmd.Close acTable, "ofvars"

'        If err.Number > 0 Then  ' error happened
'            'Debug.Print err.Number
'            'check if DB file exist and reconnect automatac, needed because after setup the backend is no different place
'            Dim fso : fso = VBA.CreateObject("Scripting.FileSystemObject")
'            Dim defaultDBFilename : defaultDBFilename = dbFolder() & BACKEND_NAME
'            If fso.FileExists(defaultDBFilename) Then
'                Call fRefreshLinks(defaultDBFilename)
'                DoCmd.OpenForm("ImpexDatenbank")
'            Else
'                MsgBox("The file " & defaultDBFilename & " does not exist! You have to select the proper database!")
'                DoCmd.OpenForm("ImpexDatenbank")
'                Exit Function
'            End If
'        End If
'        On Error GoTo 0
'        'end check


'        'check lizenz key
'        If Not islicenceKeyCorrect() Then ' lizenz nicht ok
'            DoCmd.OpenForm("oflizenzierung")
'            Call IsDemoVersionOver()
'        Else
'            If varValue("adminpass") <> "" Then ' nur wenn dass passwort gesetzt ist!
'                DoCmd.OpenForm("mainLogin")
'                'Dim Passwort
'                '   Passwort = InputBox("Bitte Passwort eingeben: " & Chr(13) & Chr(10) & "Tipp: Sie können ""123"" benutzen wenn Sie das erste Mal dieses Programm starten.", "Passwort")
'                'If Passwort <> varvalue("adminpass") Then
'                '  DoCmd.RunMacro "Quit"
'                'End If
'            Else 'keine Passwort anforderung im programm
'                DoCmd.OpenForm("TreeView")
'            End If
'        End If 'lizenz ok

'        If varValue("Firma") = "Ihre Firma" Then
'            MsgBox("Das is eine Shareware Version! " & Chr(13) & Chr(10) & _
'                            "Wir bitten Sie höfflichst diese Software zu registrieren - http://www.vegsys.com." & Chr(13) & Chr(10) & _
'                            "Viel Erfolg!")
'            Call IsDemoVersionOver() 'beendet das programm wenn zuviel eingegeben
'        End If

'        Call checkBranche()
'        '   DoCmd.OpenForm "TreeView" 'programm start formular

'    End Function


'    Public Function checkBranche()
'        Dim rs, sql
'        Dim Branche
'        Branche = varValue(VARNAME_BRANCHE)

'        If Branche = "" Or IsNull(Branche) Then  ' not set yet
'            'bestimmen Sie Ihre Branche
'            DoCmd.OpenForm("grBranche")
'        End If
'    End Function




'    Public Function setBranche(ByVal brancheId As String)
'        If MsgBox("Wollen Sie die Brancheneinstellungen übernehmen?", vbYesNo) = vbYes Then
'            Dim rs, sql
'            DoCmd.SetWarnings(False)


'            sql = "delete from  [grArtikel-KeyWords]  where ArtKatNr=0"
'            DoCmd.RunSQL(sql)

'            sql = "INSERT INTO [grArtikel-KeyWords] ( Name, [Order], enabled, ArtKatNr ) " & _
'                       " SELECT grBranchenKeyWords.Keyword, 1 , True, 0 " & _
'                       " FROM grBranchenKeyWords " & _
'                       " WHERE grBranchenKeyWords.BrNr=" & brancheId

'            'DoCmd.SetWarnings False
'            DoCmd.RunSQL(sql)
'            DoCmd.SetWarnings(True)

'            Call SETVARVALUE(VARNAME_BRANCHE, brancheId)
'        End If
'    End Function

'    'executes Macros defined for the mitarbeiter

'    Sub executeMacro(IDNR As Integer)
'        Dim Pos As String : Pos = "" & firstRow("select Position from ofMitarbeiter where idnr=" & IDNR)

'        If Pos = POSITION_DEALER Then
'            'hide Main Form
'            'Show Trading Form
'            Forms("Main").Visible = False
'            Forms("TreeView").Visible = False
'            DoCmd.OpenForm("tradeBoardForm")
'            DoCmd.Maximize()

'        End If

'    End Sub


'End Module
