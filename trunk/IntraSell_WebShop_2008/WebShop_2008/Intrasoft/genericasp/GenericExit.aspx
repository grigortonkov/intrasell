<!--#include virtual="/intrasoft/menu.aspx"-->
<!--#include file="GenericLanguage.aspx" -->
<% 
    ' Generic Database - Exit 
    ' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
    ' E-Mail: erobillard@ofifc.org
    ' URL: http://www.ofifc.org/Eli/ASP/
    ' Revision History:
    ' 29 Feb 2000 - Preparation for release
    '				Only blank session vars if they exist (with NOT IsNothing())
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
    If not Request.QueryString("KEY") is nothing Then
        dbGoSub = True
        strKey = Request.QueryString("KEY")
        ' Suggested by Paul Reith:
        subkey = Request.QueryString("KEY")
        Session("dbsubkey") = subkey
        Session("dbcurKey") = strKey
    End If

    ' See if this is a reset or an exit
    If not Request.QueryString("CMD") is Nothing Then
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
    Dim x as Integer
    For x = 1 To intFieldCount
        If Session("dbCombo" & x) & "x" <> "x" Then Session("dbCombo" & x) = Nothing
        If Session("dbDefault" & x) & "x" <> "x" Then Session("dbDefault" & x) = Nothing
        If Session("dbURLfor" & x) & "x" <> "x" Then Session("dbURLfor" & x) = Nothing
        If Session("dbEMailfor" & x) & "x" <> "x" Then Session("dbEMailfor" & x) = Nothing
        If Session("dbUpdateField" & x) & "x" <> "x" Then Session("dbUpdateField" & x) = Nothing
    Next

    ' Reset the Parameters
    For x = 1 To intFieldCount
        If Not IsNothing(Session("dbCombo" & x)) Then Session("dbCombo" & x) = Nothing
        If Not IsNothing(Session("dbDefault" & x)) Then Session("dbDefault" & x) = Nothing
        If Not IsNothing(Session("dbURLfor" & x)) Then Session("dbURLfor" & x) = Nothing
        If Not IsNothing(Session("dbEMailfor" & x)) Then Session("dbEMailfor" & x) = Nothing
        If Not IsNothing(Session("dbUpdateField" & x)) Then Session("dbUpdateField" & x) = Nothing
    Next

    ' Zero all settings
    If Not IsNothing(Session("dbAddExtra")) Then Session("dbAddExtra") = 0
    If Not IsNothing(Session("dbBackText")) Then Session("dbBackText") = ""
    If Not IsNothing(Session("dbBodyTag")) Then Session("dbBodyTag") = ""
    If Not IsNothing(Session("dbBorderColor")) Then Session("dbBorderColor") = ""
    If Not IsNothing(Session("dbBodyTag")) Then Session("dbBodyTag") = ""
    If Not IsNothing(Session("dbBoolean")) Then Session("dbBoolean") = ""
    If Not IsNothing(Session("dbCanAdd")) Then Session("dbCanAdd") = 0
    If Not IsNothing(Session("dbCanEdit")) Then Session("dbCanEdit") = 0
    If Not IsNothing(Session("dbCanDelete")) Then Session("dbCanDelete") = 0
    If Not IsNothing(Session("dbConfirmDelete")) Then Session("dbConfirmDelete") = 0
    If Not IsNothing(Session("dbCSV")) Then Session("dbCSV") = 0
    If Not IsNothing(Session("dbCSVQuotes")) Then Session("dbCSVQuotes") = 1
    If Not IsNothing(Session("dbDispEdit")) Then Session("dbDispEdit") = ""
    If Not IsNothing(Session("dbDispList")) Then Session("dbDispList") = ""
    If Not IsNothing(Session("dbEditTemplate")) Then Session("dbEditTemplate") = ""
    If Not IsNothing(Session("dbDispNew")) Then Session("dbDispNew") = ""
    If Not IsNothing(Session("dbDispView")) Then Session("dbDispView") = ""
    If Not IsNothing(Session("dbFieldNames")) Then Session("dbFieldNames") = ""
    If Not IsNothing(Session("dbFields")) Then Session("dbFields") = ""
    If Not IsNothing(Session("dbGroupBy")) Then Session("dbGroupBy") = ""
    If Not IsNothing(Session("dbHaving")) Then Session("dbHaving") = ""
    If Not IsNothing(Session("dbOnlyAdd")) Then Session("dbOnlyAdd") = 0
    If Not IsNothing(Session("dbOnlyEdit")) Then Session("dbOnlyEdit") = 0
    If Not IsNothing(Session("dbFont")) Then Session("dbFont") = ""
    If Not IsNothing(Session("dbFontSize")) Then Session("dbFontSize") = 2
    If Not IsNothing(Session("dbFooter")) Then Session("dbFooter") = 0
    If Not IsNothing(Session("dbFormatDateTime")) Then Session("dbFormatDateTime") = ""
    If Not IsNothing(Session("dbHeader")) Then Session("dbHeader") = 0
    If Not IsNothing(Session("dbMenuColor")) Then Session("dbMenuColor") = ""
    If Not IsNothing(Session("dbMenuTextColor")) Then Session("dbMenuTextColor") = ""
    If Not IsNothing(Session("dbOrder")) Then Session("dbOrder") = 0
    If Not IsNothing(Session("dbOrderBy")) Then Session("dbOrderBy") = ""
    If Not IsNothing(Session("dbRecsPerPage")) Then Session("dbRecsPerPage") = 0
    If Not IsNothing(Session("dbRequiredFields")) Then Session("dbRequiredFields") = ""
    If Not IsNothing(Session("dbSearchAdvanced")) Then Session("dbSearchAdvanced") = 0
    If Not IsNothing(Session("dbSearchEnhanced")) Then Session("dbSearchEnhanced") = 0
    If Not IsNothing(Session("dbSearchFields")) Then Session("dbSearchFields") = ""
    If Not IsNothing(Session("dbStartRec")) Then Session("dbStartRec") = 1
    If Not IsNothing(Session("dbState")) Then Session("dbState") = 1
    If Not IsNothing(Session("dbTitle")) Then Session("dbTitle") = ""
    If Not IsNothing(Session("dbTotalFields")) Then Session("dbTotalFields") = ""
    If Not IsNothing(Session("dbViewTemplate")) Then Session("dbViewTemplate") = ""
    If Not IsNothing(Session("dbWhereOld")) Then Session("dbWhereOld") = ""



    If dbGoSub And (Session("dbSubTable") & "x" <> "x") Then
        ' If going to a sub-table
        Dim arrSubTable = Split(Session("dbSubTable"), ",")
        ' Copy the dbSubTable parm and clear it so it doesn't think there are more below this one.
        Session("dbSubTableCopy") = Session("dbSubTable")
        Session("dbSubTable") = ""
        Session("dbIsSubTable") = True
        ' Set the relation to the subtable
        Session("dbWhere") = QUOTE & arrSubTable(2) & " = " & strKey & QUOTE
        Dim strURL = arrSubTable(1)
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
