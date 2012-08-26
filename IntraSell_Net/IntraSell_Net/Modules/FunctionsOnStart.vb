Option Strict On
Option Explicit On

Imports IntraSell_DLL
Imports MySql.Data.MySqlClient

Module FunctionsOnStart

    Public Const VARNAME_BRANCHE = "BRANCHE"
    Public Const POSITION_DEALER As String = "Dealer_Logik_Deaktiviert" '"Dealer"
    Public Const POSITION_ADMINISTRATOR = "Admin"

    '=========================================================
    ' hier startet das intrasell programm
    '=========================================================
    Public Sub StartIntraSell()

        'check if DB connected
        Dim rs As MySqlDataReader
        Try
            rs = openRecordset("select 1 from ofVars")
            'DoCmd.OpenTable "ofVars", acViewNormal, acReadOnly
            'DoCmd.Close acTable, "ofvars"
            rs.Close()
        Catch ex As Exception
            'Debug.Print err.Number
            'check if DB file exist and reconnect automatac, needed because after setup the backend is no different place
            'Dim fso : fso = VBA.CreateObject("Scripting.FileSystemObject")
            'Dim defaultDBFilename : defaultDBFilename = DbFolder() & BACKEND_NAME
            'If fso.FileExists(defaultDBFilename) Then
            '    Call fRefreshLinks(defaultDBFilename)
            '    DoCmd.OpenForm("ImpexDatenbank")
            'Else
            '    MsgBox("The file " & defaultDBFilename & " does not exist! You have to select the proper database!")
            '    DoCmd.OpenForm("ImpexDatenbank")
            '    Exit Sub
            'End If
            MsgBox(ex.Message, vbCritical)
            Setup.ShowDialog()
        End Try
        'end check


        'check lizenz key
        If Not islicenceKeyCorrect() Then ' lizenz nicht ok
            OpenForm("oflizenzierung")
            Call IsDemoVersionOver()
        Else
            If VarValue("adminpass") <> "" Then ' nur wenn dass passwort gesetzt ist!
                OpenForm("mainLogin")
                'Dim Passwort
                '   Passwort = InputBox("Bitte Passwort eingeben: " & Chr(13) & Chr(10) & "Tipp: Sie können ""123"" benutzen wenn Sie das erste Mal dieses Programm starten.", "Passwort")
                'If Passwort <> varvalue("adminpass") Then
                '  DoCmd.RunMacro "Quit"
                'End If
            Else 'keine Passwort anforderung im programm
                OpenForm("TreeView")
            End If
        End If 'lizenz ok

        'If VarValue("Firma") = "Ihre Firma" Then
        '    MsgBox("Das is eine Shareware Version! " & Chr(13) & Chr(10) & _
        '                    "Wir bitten Sie höfflichst diese Software zu registrieren - http://www.vegsys.com." & Chr(13) & Chr(10) & _
        '                    "Viel Erfolg!")
        '    Call IsDemoVersionOver() 'beendet das programm wenn zuviel eingegeben
        'End If

        Call checkBranche()
        '   DoCmd.OpenForm "TreeView" 'programm start formular

    End Sub


    Public Sub CheckBranche()
        '        Dim rs, sql
        '        Dim Branche
        '        Branche = varValue(VARNAME_BRANCHE)

        '        If Branche = "" Or IsNull(Branche) Then  ' not set yet
        '            'bestimmen Sie Ihre Branche
        '            DoCmd.OpenForm("grBranche")
        '        End If
    End Sub



    Public Sub SetBranche(ByVal brancheId As String)
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
    End Sub

    '    'executes Macros defined for the mitarbeiter

    Sub ExecuteMacro(IDNR As Integer)
        Dim Pos As String = CStr(firstRow("select Position from ofMitarbeiter where idnr=" & CStr(IDNR)))
        If Pos = POSITION_DEALER Then
            'hide Main Form
            'Show Trading Form
            'Forms("Main").Visible = False
            'Forms("TreeView").Visible = False
            'DoCmd.OpenForm("tradeBoardForm")
            'DoCmd.Maximize()
        End If
    End Sub


End Module
