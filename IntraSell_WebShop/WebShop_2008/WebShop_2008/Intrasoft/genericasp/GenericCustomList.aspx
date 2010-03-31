<!--#include file="GenericLanguage.aspx" -->
<% 
' Generic Database - Customisable List Records
' Notice: (c) 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/

' Using This File: Scroll down and place your HTML code between appropriate 
' <!-- GDB CUSTOM SECTION #--> and <!-- END SECTION --> tags. 
' There are 7 sections. Lines that begin with SAMPLE can be removed. 
' Further Instructions are provided in the sections.

' Revision History:
' 29 Feb 2000 - Preparation for release
'				Fix to caching
' 27 Jul 1999 - First created 

On Error Resume Next

' Prevent caching
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "cache-control", "must-revalidate"
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"

Dim QUOTE, LT, GT
Dim strEditor, strType, strConn, strDisplay, strSearchFields 
Dim strFields, strTable, strWhere, strGroupBy, strOrderBy, strFieldNames, strFont
Dim intAllowSort, intOrderBy, intPrimary, intFontSize
Dim strBorderColor, strMenuColor

QUOTE = chr(34)
LT = chr(60)
GT = chr(62)
intAllowSort = 1
bgcolor="#FFFFCC"

' Check for parameters, if we jump in another direction we need to pass them on
strPassThru = "?"
if Request.QueryString("START").Count > 0 Then strPassThru = strPassThru & "START=" & Request.Querystring("START") & "&"
if Request.QueryString("ORDER").Count > 0 Then strPassThru = strPassThru & "ORDER=" & Request.Querystring("ORDER") & "&"
if strPassThru = "?" then 
	strPassThru = ""
else
	strPassThru = Left(strPassThru,Len(strPassThru)-1)
end if

' If a Template was identified, use the CustomList screen
if Not(Session("dbListTemplate") = "") Then
	Response.Clear
	Response.Redirect "GenericCustomList.aspx" & strPassthru
end If

' Quick security check, make sure we have an active session
If Session("dbRs") = "" Then
	Response.Clear
	Response.Redirect "GenericError.aspx"
End If

' Check which editor to use for Add and Edit links
If Session("dbEditTemplate") & "x" = "x" Then
	strEditor = "GenericEdit.aspx"
Else 
	strEditor = "GenericCustomEdit.aspx"
End if

' Check which viewer to use 
If Session("dbViewTemplate") & "x" = "x" Then
	strViewer = "GenericView.aspx"
Else 
	strViewer = "GenericCustomView.aspx"
End if

' If this is the first time through, blank the vars.
If Trim(Session("dbLastRs")) <> Trim(Session("dbRs")) Then 
	Session("dbLastRs") = Session("dbRs")
	Response.Clear
	Response.Redirect Session("dbGenericPath") & "GenericExit.asp?CMD='Reset'"
End If

' Get the settings from the Config File
strType = UCase(Session("dbType"))
strConn = Session("dbConn")
strDisplay = Session("dbDispList")
strSearchFields = Session("dbSearchFields")
strSearchPos = UCase(Trim(Session("dbSearchPos")))
strTotalFields = Session("dbTotalFields")
strFields = Session("dbFields")
strTable = Session("dbRs")
strWhere = Session("dbWhere")
strGroupBy = Session("dbGroupBy")
strHaving = Session("dbHaving")
strOrderBy = Session("dbOrderBy")
strFieldNames = Session("dbFieldNames")
intOrderBy = Session("dbOrder")
intPrimary = Session("dbKey")
strFont = Session("dbFont")
intFontSize = Session("dbFontSize")
intHidePageNumbers = Session("dbHidePageNumbers")
strBorderColor = Session("dbBorderColor")
strMenuColor = Session("dbMenuColor")
Session("ErrorNumber") = 0

' Check and set fonts and colours
If Trim(strFont = "") Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strBorderColor) = "" Then strBorderColor = "#99CCCC"
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If NOT (Trim(Session("dbExitPageText")) = "") Then txtExit = Session("dbExitPageText")
If strSearchPos <> "TOP" Then strSearchPos = "BOTTOM"

' Is a field list provided
If Trim(strFields) = "" Then
	strFields = "*"
	Session("dbFields") = "*"
End If	
' Is there a sub-table to display
If Not (Trim(Session("dbSubTable")) = "" ) Then
	arrSubTable = Split(Session("dbSubTable"),",")
	IsSubTable = True
End If
' Check for a limit on Records per Page
If Session("dbRecsPerPage") > 0 Then
	intDisplayRecs = Session("dbRecsPerPage")
Else
	intDisplayRecs = 10000
End If
' Check for a START parameter
If Request.QueryString("START").Count > 0 Then
	intStartRec = Request.QueryString("START")
	Session("dbStartRec") = intStartRec
Else
	' Check for a StartRec variable in the Config File
	If Session("dbStartRec") > 0 Then
		intStartRec = Session("dbStartRec")
	Else
		intStartRec = 1
	End If
End If
' Check for an Order parameter
If Request.QueryString("ORDER").Count > 0 Then
	' Check if an ASC/DESC toggle is required (- for desc, + for asc)
	if abs(intOrderBy) = abs(Request.QueryString("ORDER")) then
		intOrderBy = 0 - intOrderBy
	else
		intOrderBy = Request.QueryString("ORDER")
	end if
	Session("dbOrder") = intOrderBy
End If
'Set the last record to display
intStopRec = intStartRec + intDisplayRecs - 1

' Open Connection to the database
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn

' Build Query
strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
Select Case strType
	Case "UDF" 
		strsql = "SELECT " & strFields & " FROM " & strTable
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
If Not Trim(strGroupBy) = "" Then
	strsql = strsql & " GROUP BY " & strGroupBy
	intAllowSort = 0
End If	

' Open recordset
set xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open strsql, xConn
' Call Error Handler if query bombs
If Err.Number <> 0 Then
	Session("ErrNumber") = Err.Number
	Session("ErrDesc") = Err.Description 
	Session("ErrSource") = Err.Source 
	Session("ErrLine") = Err.Line 
	Session("ErrMsg") = "Query: " & strsql
	Response.Clear
	Response.Redirect "GenericError.aspx"
End If
intFieldCount = xrs.Fields.Count
Dim aFields()
ReDim aFields(intFieldCount,4)

' Get field info
If Trim(Session("dbFieldNames")) & "x" = "x" Then
	ReDim arrFieldNames(intFieldCount)
	For x = 1 to intFieldCount
		aFields(x, 1) = xrs.Fields(x-1).Name 
		aFields(x, 2) = xrs.Fields(x-1).Type 
		aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
		aFields(x, 4) = 0 ' For running totals (per dbTotalFields)
		arrFieldNames(x-1) = xrs.Fields(x-1).Name 
	Next 
Else
	For x = 1 to intFieldCount
		aFields(x, 1) = xrs.Fields(x-1).Name 
		aFields(x, 2) = xrs.Fields(x-1).Type 
		aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
		aFields(x, 4) = 0
	Next 
	arrFieldNames = Split(Session("dbFieldNames"), ",")
End If

xrs.Close
Set xrs = Nothing

' Reopen the Recordset, this time use the parameters passed
strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
Select Case strType
	Case "UDF" 
		strsql = "SELECT " & strFields & " FROM " & strTable
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
If (strWhere & "x") <> "x" Then	strsql = strsql & " WHERE " & strWhere
If NOT Trim(strGroupBy) = "" Then strsql = strsql & " GROUP BY " & strGroupBy
If NOT Trim(strHaving) = "" Then strsql = strsql & " HAVING " & strHaving
If intOrderBy <> 0 Then 
	if intOrderBy > 0 then 
		strsql = strsql & " ORDER BY [" & aFields(intOrderBy, 1) & "]"
	else
		strsql = strsql & " ORDER BY [" & aFields(abs(intOrderBy), 1) & "] DESC"
	end if	
Else
	' See if a dbOrderBy string was passed.
	If Trim(strOrderBy) & "x" <> "x" Then strsql = strsql & " ORDER BY " & strOrderBy
End If
If strType = "SQL" Then
	' SQL databases do not allow spaces or brackets in table or field names
	strsql = Replace(strsql,"[","")
	strsql = Replace(strsql,"]","")
End If
set xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open strsql, xConn, 1, 2 
' Call Error Handler if query bombs
If Err.Number <> 0 Then
	Session("ErrNumber") = Err.Number
	Session("ErrDesc") = Err.Description 
	Session("ErrSource") = Err.Source 
	Session("ErrLine") = Err.Line 
	Session("ErrMsg") = "Query: " & strsql
	Response.Clear
	Response.Redirect "GenericError.aspx"
End If
intTotalRecs = xrs.RecordCount
%>
<html>
<head>
    <title>
        <%=Session("dbTitle")%></title>
</head>
<!-- GDB CUSTOM SECTION 1: BODY Tag
Place any custom body tags in the following line (BACKGROUND, BGCOLOR, etc.) -->
<body>
    <!-- END SECTION 1: BODY Tag -->
    <!-- GDB CUSTOM SECTION 2: Links to cut and paste
The following links can be cut and pasted anywhere on your page. To change link text, change the
word(s) just before the </A> tag.

EXIT LINK:
<A HREF="<%=Session("dbGenericPath")%>GenericExit.aspx">Exit</A>
RESET LINK:
<A HREF="<%=Session("dbGenericPath")%>GenericExit.asp?CMD='Reset'">Reset</A>
REFRESH LINK:
<A HREF="<%=Session("dbGenericPath")%>GenericList.aspx">Refresh</A>
DBINFO (This page is designed for administrators, please use with care):
<A HREF="<%=Session("dbGenericPath")%>GenericInfo.aspx">dbInfo</A>
ADD RECORD:
<A HREF="<%=Session("dbGenericPath")%><%=strEditor%>?CMD=NEW">Add Record</A>
SEARCH BOX (the following code must be enclosed in <% %> tags:
<% DispSearch() %>
END SECTION: Links to cut and paste -->
    <!-- GDB CUSTOM SECTION 3: Page title, headings, introductory text, etc. -->
    SAMPLE Title<p>
        <!-- END SECTION: Page title, headings, introductory text, etc. -->
        <!-- GDB CUSTOM SECTION 4: Formatting before field display
The following code will introduce your fields. Open TABLE tags here, display column headings, etc. -->
        SAMPLE Record:<p>
            <!-- END SECTION -->
            <%
intCount = 0
intActual = 0
Do While (NOT xrs.EOF) AND (intCount < intStopRec)
	intCount = intCount + 1
	If Cint(intCount) >= Cint(intStartRec) Then 
		intActual = intActual + 1
		x = 0
		For Each xField in xrs.Fields
			x = x + 1
			' If on the Key field, build the link used to load the Viewer, Editor, or Deleter
			If x = CInt(intPrimary) Then
				Session("zcurTable") = strTable
				Session("zcurDisplay") = strDisplay
				Session("zcurKeyField") = aFields(x,1)
				strLink = "KEY=" & xField.Value
			End If 
		Next 
	End If %>
            <!-- GDB CUSTOM SECTION 5: Field display
Insert fields and formatting here. Refer to each field like this:
<%=xrs("FieldName")%>
At the end of each record, GDB can also display View, Edit, and Delete links. To place these, 
cut and paste the following:
VIEW:
<A HREF="<%=Session("dbGenericPath")&strViewer%>?<%=strLink%>">View</A>
EDIT:
<A HREF="<%=Session("dbGenericPath")%><%=strEditor%>?<%=strLink%>">Edit</A>
DELETE:
<A HREF="<%= Session("dbGenericPath") %>GenericDelete.asp?<%= strLink %>">Delete</A>
-->
            SAMPLE Field
            <%=xrs("FieldName")%>
            <!-- END SECTION: Field display -->
            <%	' Do not change the following
xrs.MoveNext
Loop %>
            <!-- GDB CUSTOM SECTION 6: After last record
Close any tables used to display data, etc. 
The Previous and Next Page links are still to come, this is not quite the page footer yet. -->
            SAMPLE End of Records
            <!-- END SECTION: After last record -->
            <%' Find out if there should be Backward or Forward Buttons on the table.
intPageDisp = False
If 	intStartRec = 1 Then
	isPrev = False
Else
	isPrev = True
	PrevStart = intStartRec - intDisplayRecs
	If PrevStart < 1 Then PrevStart = 1 %>
            <hr size="1">
            <strong><a href="GenericList.asp?START=<%=PrevStart%>">[&lt;&lt;&nbsp;<%=txtPreviousPage%>]</a></strong></FONT>
            <%
End If

' Display Page numbers
If (intHidePageNumbers = 0) AND (isPrev OR (NOT xrs.EOF)) Then
	If (NOT isPrev) Then Response.Write "<HR SIZE=1>"
	x = 1
	y = 1
	While x <= intTotalrecs
		If CInt(intStartRec) = CInt(x) Then %>
            <strong><font color="Green">
                <%=y%></font></strong>
            <% 		Else %>
            <strong><a href="GenericList.asp?START=<%=x%>">
                <%=y%></a></strong>
            <%		End If
		x = x + intDisplayRecs
		y = y + 1
	Wend
End If

' Next link
If NOT xrs.EOF Then
	NextStart = intStartRec + intDisplayRecs
	isMore = True %>
            <strong><a href="GenericList.asp?START=<%=NextStart%>">[<%=txtNextPage%>&nbsp;&gt;&gt;]</a></strong>
            <% Else
	isMore = False
End If %>
            <hr size="1">
            <% If intStopRec > intCount Then intStopRec = intCount
Response.Write txtRecords & " " & intStartRec & " " & txtTo & " " & intStopRec & " " & txtOf & " " & intTotalRecs
' Close recordset and connection
xrs.Close
Set xrs = Nothing
xConn.Close
Set xConn = Nothing %>
            </FONT>
            <p>
                <% 	If strSearchPos = "BOTTOM" Then 
		DispSearch()
	End If %>
                <!-- GDB CUSTOM SECTION 7: Footer
Close any tables used to display data, etc. 
The Previous and Next Page links are still to come, this is not quite the page footer yet. -->
                SAMPLE Footer
                <!-- END SECTION: Footer -->
</body>
<%
Function DispSearch

If strSearchFields & "x" <> "x" Then
	' If in a search, ask for a reset before another search.
	If Session("dbState") = 3 Then %>
<table cellpadding="1" cellspacing="0" border="0" bgcolor="#99CCCC">
    <tr>
        <td>
            <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="#99CCCC">
                <form action="GenericSearchResult.aspx" method="POST">
                <tr>
                    <td height="0" bgcolor="WHITE" align="LEFT">
                        <font size="2" face="<%=strFont%>"><a href="<%=Session("dbGenericPath")%>GenericExit.asp?CMD='Reset'">
                            <%=txtReset%></a>
                            <%=txtSearchFailMsgB%>
                    </td>
                </tr>
                </form>
            </table>
        </td>
    </tr>
</table>
<% 	Else %>
<table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strBorderColor%>">
    <tr>
        <td>
            <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=strBorderColor%>">
                <form action="GenericSearchResult.aspx" method="POST">
                <tr>
                    <td height="0" bgcolor="WHITE" align="LEFT">
                        <font size="2" face="<%=strFont%>">
                            <%=txtSearchFor%>
                    </td>
                    <td height="0" bgcolor="WHITE" align="LEFT">
                        <font size="2" face="<%=strFont%>">
                            <input type="Text" name="strSearch" size="40">
                    </td>
                    <td height="0" bgcolor="WHITE" align="LEFT">
                        <font size="2" face="<%=strFont%>">
                            <input type="Submit" name="Submit" value="<%=txtSearchSubmit%>">
                    </td>
                </tr>
                </form>
            </table>
        </td>
    </tr>
</table>
<p>
    <%	End If
End If
End Function
    %>
</html>
