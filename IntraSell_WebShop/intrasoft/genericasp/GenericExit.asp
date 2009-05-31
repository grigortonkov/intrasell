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
If (Session("dbDispList") & "x" = "x") or (Session("dbConn") & "x"  = "x") Then 
	Response.Clear %>
	<!--#include file="GenericError.asp"-->	
<% End If

doGoSub = False	' True if exiting to a subtable
doReset = False ' True if resetting to values from the config file

' Get the key value of the record to display
If Request.QueryString("KEY").Count > 0 Then
	dbGoSub = True
	strKey = Request.QueryString("KEY")
	' Suggested by Paul Reith:
	subkey=Request.querystring("KEY")
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
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn
strsql = "SELECT * FROM [" & strTable & "]"
Select Case strType
	Case "UDF" 
		strsql = "SELECT * FROM " & strTable
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
set xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open strsql, xConn
intFieldCount = xrs.Fields.Count
xrs.Close
Set xrs = Nothing
xConn.Close
Set xConn = Nothing

' Reset the Parameters
For x = 1 to intFieldCount
	if Session("dbCombo" & x) & "x" <> "x" then Session("dbCombo" & x) = Null
	if Session("dbDefault" & x) & "x" <> "x" then Session("dbDefault" & x) = Null
	if Session("dbURLfor" & x) & "x" <> "x" then Session("dbURLfor" & x) = Null
	if Session("dbEMailfor" & x) & "x" <> "x" then Session("dbEMailfor" & x) = Null
	if Session("dbUpdateField" & x) & "x" <> "x" then Session("dbUpdateField" & x) = Null
Next

' Reset the Parameters
For x = 1 to intFieldCount
	if NOT IsEmpty(Session("dbCombo" & x)) then Session("dbCombo" & x) = Null
	if NOT IsEmpty(Session("dbDefault" & x)) then Session("dbDefault" & x) = Null
	if NOT IsEmpty(Session("dbURLfor" & x)) then Session("dbURLfor" & x) = Null
	if NOT IsEmpty(Session("dbEMailfor" & x)) then Session("dbEMailfor" & x) = Null
	if NOT IsEmpty(Session("dbUpdateField" & x)) then Session("dbUpdateField" & x) = Null
Next

' Zero all settings
if NOT IsEmpty(Session("dbAddExtra")) then Session("dbAddExtra") = 0
if NOT IsEmpty(Session("dbBackText")) then Session("dbBackText")= ""
if NOT IsEmpty(Session("dbBodyTag")) then Session("dbBodyTag") = ""
if NOT IsEmpty(Session("dbBorderColor")) then Session("dbBorderColor") = ""
if NOT IsEmpty(Session("dbBodyTag")) then Session("dbBodyTag") = ""
if NOT IsEmpty(Session("dbBoolean")) then Session("dbBoolean") = ""
if NOT IsEmpty(Session("dbCanAdd")) then Session("dbCanAdd") = 0
if NOT IsEmpty(Session("dbCanEdit")) then Session("dbCanEdit") = 0
if NOT IsEmpty(Session("dbCanDelete")) then Session("dbCanDelete") = 0
if NOT IsEmpty(Session("dbConfirmDelete")) then Session("dbConfirmDelete") = 0
if NOT IsEmpty(Session("dbCSV")) then Session("dbCSV") = 0
if NOT IsEmpty(Session("dbCSVQuotes")) then Session("dbCSVQuotes") = 1
if NOT IsEmpty(Session("dbDispEdit")) then Session("dbDispEdit") = ""
if NOT IsEmpty(Session("dbDispList")) then Session("dbDispList")= ""
if NOT IsEmpty(Session("dbEditTemplate")) then Session("dbEditTemplate") = ""
if NOT IsEmpty(Session("dbDispNew")) then Session("dbDispNew") = ""
if NOT IsEmpty(Session("dbDispView")) then Session("dbDispView") = ""
if NOT IsEmpty(Session("dbFieldNames")) then Session("dbFieldNames") = ""
if NOT IsEmpty(Session("dbFields")) then Session("dbFields") = ""
if NOT IsEmpty(Session("dbGroupBy")) then Session("dbGroupBy") = ""
if NOT IsEmpty(Session("dbHaving")) then Session("dbHaving") = ""
if NOT IsEmpty(Session("dbOnlyAdd")) then Session("dbOnlyAdd") = 0
if NOT IsEmpty(Session("dbOnlyEdit")) then Session("dbOnlyEdit") = 0
if NOT IsEmpty(Session("dbFont")) then Session("dbFont") = ""
if NOT IsEmpty(Session("dbFontSize")) then Session("dbFontSize") = 2
if NOT IsEmpty(Session("dbFooter")) then Session("dbFooter") = 0
if NOT IsEmpty(Session("dbFormatDateTime")) then Session("dbFormatDateTime") = ""
if NOT IsEmpty(Session("dbHeader")) then Session("dbHeader") = 0
if NOT IsEmpty(Session("dbMenuColor")) then Session("dbMenuColor") = ""
if NOT IsEmpty(Session("dbMenuTextColor")) then Session("dbMenuTextColor") = ""
if NOT IsEmpty(Session("dbOrder")) then Session("dbOrder") = 0
if NOT IsEmpty(Session("dbOrderBy")) then Session("dbOrderBy") = ""
if NOT IsEmpty(Session("dbRecsPerPage")) then Session("dbRecsPerPage") = 0
if NOT IsEmpty(Session("dbRequiredFields")) then Session("dbRequiredFields") = ""
if NOT IsEmpty(Session("dbSearchAdvanced")) then Session("dbSearchAdvanced") = 0
if NOT IsEmpty(Session("dbSearchEnhanced")) then Session("dbSearchEnhanced") = 0
if NOT IsEmpty(Session("dbSearchFields")) then Session("dbSearchFields") = ""
if NOT IsEmpty(Session("dbStartRec")) then Session("dbStartRec") = 1
if NOT IsEmpty(Session("dbState")) then Session("dbState") = 1
if NOT IsEmpty(Session("dbTitle")) then Session("dbTitle") = ""
if NOT IsEmpty(Session("dbTotalFields")) then Session("dbTotalFields") = ""
if NOT IsEmpty(Session("dbViewTemplate")) then Session("dbViewTemplate") = ""
if NOT IsEmpty(Session("dbWhereOld")) then Session("dbWhereOld") = ""

If dbGoSub AND (Session("dbSubTable") & "x" <> "x") Then
	' If going to a sub-table
	arrSubTable = Split(Session("dbSubTable"),",")
	' Copy the dbSubTable parm and clear it so it doesn't think there are more below this one.
	Session("dbSubTableCopy") = Session("dbSubTable")
	Session("dbSubTable") = ""
	Session("dbIsSubTable") = True
	' Set the relation to the subtable
	Session("dbWhere") = QUOTE & arrSubTable(2) & " = " & strKey & QUOTE 
	strURL = arrSubTable(1)
	Response.Clear
	Response.Redirect strURL
Else
	If doReset Then ' reread the config file
		Response.Clear
		Response.Redirect Session("dbViewPage")
	Else ' exit GenericDB
		Session("dbIsSubTable") = False
		Session("dbSubTableCopy") = ""
		Session("dbLastRs") = ""
		Response.Clear
		Response.Redirect Session("dbExitPage")
	End If
End If
%>
