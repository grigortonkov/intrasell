<% 
    ' Generic Database - Exit 
    ' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
    ' E-Mail: erobillard@ofifc.org
    ' URL: http://www.ofifc.org/Eli/ASP/
    ' Revision History:
    ' 29 Feb 2000 - Preparation for release
    '				Only blank session vars if they exist (with NOT IsEmpty())
    ' 30 Nov 1998 - First created or released

    Response.Buffer = True
    ' Quick security check, make sure we have an active session
    If (Session("dbDispList") & "x" = "x") Or (Session("dbConn") & "x" = "x") Then
        Response.Clear()%>
<!--#include file="GenericError.aspx"-->
<%  End If

    doGoSub = False ' True if exiting to a subtable
    doReset = False ' True if resetting to values from the config file

    ' Get the key value of the record to display
    If Request.QueryString("KEY").Count > 0 Then
        dbGoSub = True
        strKey = Request.QueryString("KEY")
        ' Suggested by Paul Reith:
        subkey = Request.QueryString("KEY")
        Session("dbsubkey") = subkey
        Session("dbcurKey") = strKey
    End If

    ' See if this is a reset or an exit
    If Request.QueryString("CMD").Count > 0 Then
        ' Reset is the only parameter right now
        strCmd = Request.QueryString("CMD")
        doReset = True
    End If

    ' Get the parameters set in the Config File
    strType = UCase(Session("dbType"))
    strConn = Session("dbConn")
    strTable = Session("dbRs")

    ' Open Recordset and get the field count
    xConn = Server.CreateObject("ADODB.Connection")
    xConn.Open(strConn)
    strsql = "SELECT * FROM [" & strTable & "]"
    Select Case strType
        Case "UDF"
            strsql = "SELECT * FROM " & strTable
        Case "SQL"
            strsql = Replace(strsql, "[", "")
            strsql = Replace(strsql, "]", "")
        Case "MYSQL"
            strsql = Replace(strsql, "[", "`")
            strsql = Replace(strsql, "]", "`")
    End Select
    xrs = Server.CreateObject("ADODB.Recordset")
    xrs.Open(strsql, xConn)
    intFieldCount = xrs.Fields.Count
    xrs.Close()
    xrs = Nothing
    xConn.Close()
    xConn = Nothing

    ' Reset the Parameters
    For x = 1 To intFieldCount
        If Session("dbCombo" & x) & "x" <> "x" Then Session("dbCombo" & x) = Null
        If Session("dbDefault" & x) & "x" <> "x" Then Session("dbDefault" & x) = Null
        If Session("dbURLfor" & x) & "x" <> "x" Then Session("dbURLfor" & x) = Null
        If Session("dbEMailfor" & x) & "x" <> "x" Then Session("dbEMailfor" & x) = Null
        If Session("dbUpdateField" & x) & "x" <> "x" Then Session("dbUpdateField" & x) = Null
    Next

    ' Reset the Parameters
    For x = 1 To intFieldCount
        If Not IsEmpty(Session("dbCombo" & x)) Then Session("dbCombo" & x) = Null
        If Not IsEmpty(Session("dbDefault" & x)) Then Session("dbDefault" & x) = Null
        If Not IsEmpty(Session("dbURLfor" & x)) Then Session("dbURLfor" & x) = Null
        If Not IsEmpty(Session("dbEMailfor" & x)) Then Session("dbEMailfor" & x) = Null
        If Not IsEmpty(Session("dbUpdateField" & x)) Then Session("dbUpdateField" & x) = Null
    Next

    ' Zero all settings
    If Not IsEmpty(Session("dbAddExtra")) Then Session("dbAddExtra") = 0
    If Not IsEmpty(Session("dbBackText")) Then Session("dbBackText") = ""
    If Not IsEmpty(Session("dbBodyTag")) Then Session("dbBodyTag") = ""
    If Not IsEmpty(Session("dbBorderColor")) Then Session("dbBorderColor") = ""
    If Not IsEmpty(Session("dbBodyTag")) Then Session("dbBodyTag") = ""
    If Not IsEmpty(Session("dbBoolean")) Then Session("dbBoolean") = ""
    If Not IsEmpty(Session("dbCanAdd")) Then Session("dbCanAdd") = 0
    If Not IsEmpty(Session("dbCanEdit")) Then Session("dbCanEdit") = 0
    If Not IsEmpty(Session("dbCanDelete")) Then Session("dbCanDelete") = 0
    If Not IsEmpty(Session("dbConfirmDelete")) Then Session("dbConfirmDelete") = 0
    If Not IsEmpty(Session("dbCSV")) Then Session("dbCSV") = 0
    If Not IsEmpty(Session("dbCSVQuotes")) Then Session("dbCSVQuotes") = 1
    If Not IsEmpty(Session("dbDispEdit")) Then Session("dbDispEdit") = ""
    If Not IsEmpty(Session("dbDispList")) Then Session("dbDispList") = ""
    If Not IsEmpty(Session("dbEditTemplate")) Then Session("dbEditTemplate") = ""
    If Not IsEmpty(Session("dbDispNew")) Then Session("dbDispNew") = ""
    If Not IsEmpty(Session("dbDispView")) Then Session("dbDispView") = ""
    If Not IsEmpty(Session("dbFieldNames")) Then Session("dbFieldNames") = ""
    If Not IsEmpty(Session("dbFields")) Then Session("dbFields") = ""
    If Not IsEmpty(Session("dbGroupBy")) Then Session("dbGroupBy") = ""
    If Not IsEmpty(Session("dbHaving")) Then Session("dbHaving") = ""
    If Not IsEmpty(Session("dbOnlyAdd")) Then Session("dbOnlyAdd") = 0
    If Not IsEmpty(Session("dbOnlyEdit")) Then Session("dbOnlyEdit") = 0
    If Not IsEmpty(Session("dbFont")) Then Session("dbFont") = ""
    If Not IsEmpty(Session("dbFontSize")) Then Session("dbFontSize") = 2
    If Not IsEmpty(Session("dbFooter")) Then Session("dbFooter") = 0
    If Not IsEmpty(Session("dbFormatDateTime")) Then Session("dbFormatDateTime") = ""
    If Not IsEmpty(Session("dbHeader")) Then Session("dbHeader") = 0
    If Not IsEmpty(Session("dbMenuColor")) Then Session("dbMenuColor") = ""
    If Not IsEmpty(Session("dbMenuTextColor")) Then Session("dbMenuTextColor") = ""
    If Not IsEmpty(Session("dbOrder")) Then Session("dbOrder") = 0
    If Not IsEmpty(Session("dbOrderBy")) Then Session("dbOrderBy") = ""
    If Not IsEmpty(Session("dbRecsPerPage")) Then Session("dbRecsPerPage") = 0
    If Not IsEmpty(Session("dbRequiredFields")) Then Session("dbRequiredFields") = ""
    If Not IsEmpty(Session("dbSearchAdvanced")) Then Session("dbSearchAdvanced") = 0
    If Not IsEmpty(Session("dbSearchEnhanced")) Then Session("dbSearchEnhanced") = 0
    If Not IsEmpty(Session("dbSearchFields")) Then Session("dbSearchFields") = ""
    If Not IsEmpty(Session("dbStartRec")) Then Session("dbStartRec") = 1
    If Not IsEmpty(Session("dbState")) Then Session("dbState") = 1
    If Not IsEmpty(Session("dbTitle")) Then Session("dbTitle") = ""
    If Not IsEmpty(Session("dbTotalFields")) Then Session("dbTotalFields") = ""
    If Not IsEmpty(Session("dbViewTemplate")) Then Session("dbViewTemplate") = ""
    If Not IsEmpty(Session("dbWhereOld")) Then Session("dbWhereOld") = ""

    If dbGoSub And (Session("dbSubTable") & "x" <> "x") Then
        ' If going to a sub-table
        arrSubTable = Split(Session("dbSubTable"), ",")
        ' Copy the dbSubTable parm and clear it so it doesn't think there are more below this one.
        Session("dbSubTableCopy") = Session("dbSubTable")
        Session("dbSubTable") = ""
        Session("dbIsSubTable") = True
        ' Set the relation to the subtable
        Session("dbWhere") = QUOTE & arrSubTable(2) & " = " & strKey & QUOTE
        strURL = arrSubTable(1)
        Response.Clear()
        Response.Redirect(strURL)
    Else
        If doReset Then ' reread the config file
            Response.Clear()
            Response.Redirect(Session("dbViewPage"))
        Else ' exit GenericDB
            Session("dbIsSubTable") = False
            Session("dbSubTableCopy") = ""
            Session("dbLastRs") = ""
            Response.Clear()
            Response.Redirect(Session("dbExitPage"))
        End If
    End If
%>
