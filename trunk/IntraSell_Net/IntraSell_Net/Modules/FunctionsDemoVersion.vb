﻿'Module FunctionsDemoVersion

'    'Demoversion ist solange die Firma 'Ihre Firma' heisst

'    Const Demoversion = True
'    Const MAX_POSSIBLE_RECHNUNGEN = 100 'gerenzwert für die Demoversion
'    Const MAX_POSSIBLE_KUNDEN = 100 'gerenzwert für die Demoversion
'    Const CONST_TO_LICKEY = "KALAMARATONKOVGRIGOR" 'erweiterung für Licence key ' to avoid collisions for short company names



'    '=========================================================
'    ' Prüft ob die Demoversion abgelaufen ist
'    ' das programm erlaubt max MAX_POSSIBLE_RECHNUNGEN und MAX_POSSIBLE_KUNDEN
'    '=========================================================
'    Function IsDemoVersionOver()
'        Dim rs
'        Dim demoIsOver As Boolean
'        demoIsOver = False


'        rs = openRecordset("DEMOVERSION_COUNT_KUNDEN")
'        If Not rs.EOF Then
'            If rs("Sum") > MAX_POSSIBLE_KUNDEN Then
'                demoIsOver = True
'            End If
'        End If
'        rs.Close()

'        rs = openRecordset("DEMOVERSION_COUNT_RECHNUNGEN")
'        If Not rs.EOF Then
'            If rs("Sum") > MAX_POSSIBLE_RECHNUNGEN Then
'                demoIsOver = True
'            End If
'        End If
'        rs.Close()


'        If (Date.Today > #12/12/2013#) Then
'            demoIsOver = True
'        End If


'        IsDemoVersionOver = demoIsOver


'        If demoIsOver Then
'            MsgBox("Sorry! Diese Demoversion ist Abgelaufen! Sie werden höflichst " & _
'            " geboten diese Software zu bestellen. Informationen unter: http://code.google.com/p/intrasell/")
'            'DoCmd.Quit()
'            Application.Exit()
'        End If

'    End Function

'    'checks if the lizKey is correct
'    'licKey has 8 chars
'    'arFehRGR ist die code für "Ihre Firma"
'    Public Function islicenceKeyCorrect()
'        Dim Firma, licKey, i
'        Firma = varValue("Firma")
'        licKey = Trim(varValue("Lizenzcode") & "")

'        If Len(licKey) <> 8 Then
'            'Call MsgBox("Die Lizenzcode hat 8 Stellen!", vbCritical)
'            islicenceKeyCorrect = False
'            Exit Function
'        End If

'        Dim lickeyCorrect
'        lickeyCorrect = CONST_TO_LICKEY & Firma

'        For i = 1 To 8 'jede 2 te buchstabe
'            If Not Mid(licKey, i, 1) = Mid(lickeyCorrect, Len(lickeyCorrect) - (i - 1) * 2, 1) Then
'                islicenceKeyCorrect = False
'                Exit Function
'            End If

'        Next i
'        islicenceKeyCorrect = True



'        If Date.Today > #12/12/2014# Then
'            islicenceKeyCorrect = False
'        End If

'    End Function

'    '=========================================================
'    ' generiert ein KEy nach Firmennamen
'    '=========================================================
'    Function keyGen(Firma)

'        Dim lickeyCorrect As String = CONST_TO_LICKEY & Firma
'        Dim licKey, i
'        For i = 1 To 8 'jede 2 te buchstabe
'            licKey = licKey & Mid(lickeyCorrect, Len(lickeyCorrect) - (i - 1) * 2, 1)
'        Next i
'        Debug.Print(licKey)
'        keyGen = licKey
'    End Function

'End Module
