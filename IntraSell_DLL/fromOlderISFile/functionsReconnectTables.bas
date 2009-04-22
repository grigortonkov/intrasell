Attribute VB_Name = "functionsReconnectTables"
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
    Set dbCurr = CurrentDB

If connectWithTable = "" Then
strMsg = "Do you wish to specify a different path for the Access Tables?"

If MsgBox(strMsg, vbQuestion + vbYesNo, "Alternate data source...") = vbYes Then
    strNewPath = fGetMDBName("Please select a new datasource")
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
                If Len(Dir(strDBPath)) = 0 Then
                    'File Doesn't Exist, call GetOpenFileName
                    strDBPath = fGetMDBName("'" & strDBPath & "' not found.")
                    If strDBPath = vbNullString Then
                        'user pressed cancel
                        Err.Raise cERR_USERCANCEL
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
                    MsgBox "Table '" & strTbl & "' was not found in the database" & _
                    vbCrLf & dbLink.Name & ". Couldn't refresh this link", _
                    vbCritical + vbOKOnly
                'err.Raise cERR_NOREMOTETABLE
            End If
        End If
    Next
    fRefreshLinks = True
    varRet = SysCmd(acSysCmdClearStatus)
    MsgBox "All Access tables were successfully reconnected.", vbInformation + vbOKOnly, "Success"
    
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
    Select Case Err
        Case 3059:

        Case cERR_USERCANCEL:
            MsgBox "No Database was specified, couldn't link tables.", _
                    vbCritical + vbOKOnly, _
                    "Error in refreshing links."
            Resume fRefreshLinks_End
        Case cERR_NOREMOTETABLE:
            MsgBox "Table '" & strTbl & "' was not found in the database" & _
                    vbCrLf & dbLink.Name & ". Couldn't refresh links", _
                    vbCritical + vbOKOnly, _
                    "Error in refreshing links."
            Resume fRefreshLinks_End
        Case Else:
            strMsg = "Error Information..." & vbCrLf & vbCrLf
            strMsg = strMsg & "Function: fRefreshLinks" & vbCrLf
            strMsg = strMsg & "Description: " & Err.Description & vbCrLf
            strMsg = strMsg & "Error #: " & Format$(Err.Number) & vbCrLf
            MsgBox strMsg, vbOKOnly + vbCritical, "Error"
            Resume fRefreshLinks_End
    End Select
End Function

Function fIsRemoteTable(dbRemote, strTbl As String) As Boolean
Dim tdf
    On Error Resume Next
    Set tdf = dbRemote.TableDefs(strTbl)
    fIsRemoteTable = (Err = 0)
    Set tdf = Nothing
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
    Set db = CurrentDB
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





