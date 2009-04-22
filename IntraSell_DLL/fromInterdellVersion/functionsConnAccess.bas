Attribute VB_Name = "functionsConnAccess"

Option Compare Database
Option Explicit

'***************** Code Start ***************

'leave fRefreshLinks empty ="" if want the user to select by himself the data source
Function fRefreshLinks(ByVal connectWithTable) As Boolean
Dim strMsg As String, collTbls As Collection
Dim i As Integer, strDBPath As String, strTbl As String
Dim dbCurr, dbLink
Dim tdfLocal
Dim varRet As Variant
Dim strNewPath As String

Const cERR_USERCANCEL = vbObjectError + 1000
Const cERR_NOREMOTETABLE = vbObjectError + 2000

    On Local Error GoTo fRefreshLinks_Err

    'not used now
    'If connectWithTable = "" And MsgBox("Are you sure you want to reconnect all Access tables?", _
    '        vbQuestion + vbYesNo, "Please confirm...") = vbNo Then err.Raise cERR_USERCANCEL

    'First get all linked tables in a collection
    Set collTbls = fGetLinkedTables

    'now link all of them
    Set dbCurr = CurrentDb

If connectWithTable = "" Then
 

If MsgBox("Möchten Sie nun die MS Access Datei suchen? Standartname der MDB Datei lautet IntraSell_Nr_Daten.mdb.", _
        vbQuestion + vbYesNo, "Datenbank wählen") = vbYes Then
    strNewPath = fGetMDBName("Bitte eine Datei wählen:")
Else
    strNewPath = vbNullString
End If

Else
    strNewPath = connectWithTable
End If

    For i = collTbls.Count To 1 Step -1
        strDBPath = fParsePath(collTbls(i))
        strTbl = fParseTable(collTbls(i))
        varRet = SysCmd(acSysCmdSetStatus, "Now linking '" & strTbl & "'....")
        If Left$(strDBPath, 4) = "ODBC" Then
            'ODBC Tables
            'ODBC Tables handled separately
           ' Set tdfLocal = dbCurr.TableDefs(strTbl)
           ' With tdfLocal
           '     .Connect = pcCONNECT
           '     .RefreshLink
           '     collTbls.Remove (strTbl)
           ' End With
        Else
            If strNewPath <> vbNullString Then
                'Try this first
                strDBPath = strNewPath
            Else
                If Len(dir(strDBPath)) = 0 Then
                    'File Doesn't Exist, call GetOpenFileName
                    strDBPath = fGetMDBName("'" & strDBPath & "' not found.")
                    If strDBPath = vbNullString Then
                        'user pressed cancel
                        err.Raise cERR_USERCANCEL
                    End If
                End If
            End If

            'backend database exists
            'putting it here since we could have
            'tables from multiple sources
            Set dbLink = DBEngine(0).OpenDatabase(strDBPath)
            'check to see if the table is present in dbLink
            strTbl = fParseTable(collTbls(i))
            If fIsRemoteTable(dbLink, strTbl) Then
                'everything's ok, reconnect
                Set tdfLocal = dbCurr.TableDefs(strTbl)
                With tdfLocal
                    .Connect = ";Database=" & strDBPath
                    .RefreshLink
                    collTbls.Remove (.Name)
                End With
            Else
                    MsgBox "Die Tabelle '" & strTbl & "' wurde nicht gefunden! Datenbank " & _
                    vbCrLf & dbLink.Name & ".", _
                    vbCritical + vbOKOnly
                'err.Raise cERR_NOREMOTETABLE
            End If
        End If
    Next
    fRefreshLinks = True
    varRet = SysCmd(acSysCmdClearStatus)
    MsgBox "Fertig! Alle Tabellen wurden erneut verknüpft!", vbInformation + vbOKOnly, "Erfolg"
    
    'reset value
    Call SETVARVALUE("DB_DATA_FILENAME", strNewPath)
    
fRefreshLinks_End:
    Set collTbls = Nothing
    Set tdfLocal = Nothing
    Set dbLink = Nothing
    Set dbCurr = Nothing
    Exit Function
fRefreshLinks_Err:
    fRefreshLinks = False
    Select Case err
        Case 3059:

        Case cERR_USERCANCEL:
            MsgBox "Es wurde keine Datenbank übergeben.", _
                    vbCritical + vbOKOnly, _
                    "Error in refreshing links."
            Resume fRefreshLinks_End
        Case cERR_NOREMOTETABLE:
            MsgBox "Die Tabelle '" & strTbl & "' wurde nicht gefunden! Datenbankname: " & _
                    vbCrLf & dbLink.Name & ".", _
                    vbCritical + vbOKOnly, _
                    "Error in refreshing links."
            Resume fRefreshLinks_End
        Case Else:
            strMsg = "Error Information..." & vbCrLf & vbCrLf
            strMsg = strMsg & "Function: fRefreshLinks" & vbCrLf
            strMsg = strMsg & "Description: " & err.Description & vbCrLf
            strMsg = strMsg & "Error #: " & Format$(err.Number) & vbCrLf
            MsgBox strMsg, vbOKOnly + vbCritical, "Error"
            Resume fRefreshLinks_End
    End Select
End Function

Function fIsRemoteTable(dbRemote, strTbl As String) As Boolean
Dim tdf
    On Error Resume Next
    Set tdf = dbRemote.TableDefs(strTbl)
    fIsRemoteTable = (err = 0)
    Set tdf = Nothing
    On Error GoTo 0
End Function

Function fGetMDBName(strIn As String) As String
'Calls GetOpenFileName dialog
Dim strFilter As String

    strFilter = ahtAddFilterItem(strFilter, _
                    "Access Database(*.mdb;*.mda;*.mde;*.mdw) ", _
                    "*.mdb; *.mda; *.mde; *.mdw")
    strFilter = ahtAddFilterItem(strFilter, _
                    "All Files (*.*)", _
                    "*.*")

    fGetMDBName = ahtCommonFileOpenSave(Filter:=strFilter, _
                                OpenFile:=True, _
                                DialogTitle:=strIn, _
                                Flags:=ahtOFN_HIDEREADONLY)
End Function

Function fGetLinkedTables() As Collection
'Returns all linked tables
    Dim collTables As New Collection
    Dim tdf, db
    Set db = CurrentDb
    db.TableDefs.Refresh
    For Each tdf In db.TableDefs
        With tdf
            If Len(.Connect) > 0 Then
                If Left$(.Connect, 4) = "ODBC" Then
                '    collTables.Add Item:=.Name & ";" & .Connect, KEY:=.Name
                'ODBC Reconnect handled separately
                Else
                    collTables.Add Item:=.Name & .Connect, Key:=.Name
                End If
            End If
        End With
    Next
    Set fGetLinkedTables = collTables
    Set collTables = Nothing
    Set tdf = Nothing
    Set db = Nothing
End Function

Function fParsePath(strIn As String) As String
    If Left$(strIn, 4) <> "ODBC" Then
        fParsePath = Right(strIn, Len(strIn) _
                        - (InStr(1, strIn, "DATABASE=") + 8))
    Else
        fParsePath = strIn
    End If
End Function

Function fParseTable(strIn As String) As String
    fParseTable = Left$(strIn, InStr(1, strIn, ";") - 1)
End Function
'***************** Code End ***************



