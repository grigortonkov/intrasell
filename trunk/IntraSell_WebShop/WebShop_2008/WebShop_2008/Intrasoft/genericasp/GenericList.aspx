<!--#include virtual="/intrasoft/menu.aspx"-->
<!--#include file="GenericLanguage.aspx" -->
<% 
' Generic Database - List Records
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Look out for:
' - Look out for: If two config files use the same dbRS, when jumping from one to the other the session vars won't be blanked.
' -	Why: Session vars are reset on opening a new config file. Does so using dbRS to see if a different recordset is being opended. 
' Revision History:
' 11 May 2000 - Moved SELECT statement before text handling if...then's so IMG and A tags display properly.
' 29 Feb 2000 - Preparation for release
'  9 Sep 1998 - First created or released

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
Dim strBorderColor, strMenuColor, strMenuTextColor

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


'Response.End
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
strMenuTextColor = Session("dbMenuTextColor")
Session("ErrorNumber") = 0

' Check and set fonts and colours
If Trim(strFont = "") Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strBorderColor) = "" Then strBorderColor = "#99CCCC"
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If Trim(strMenuTextColor) = "" Then strMenuTextColor = "Black"

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
	Case "MYSQL" 
		strsql = Replace(strsql,"[","`")
		strsql = Replace(strsql,"]","`")
End Select

'Response.Write strType & ":" &  strsql ': Response.End 

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

' Are totals required
If Trim(strTotalFields) = "" Then strTotalFields = String(intFieldCount,"0")

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
	Case "MYSQL" 
		strsql = Replace(strsql,"[","`")
		strsql = Replace(strsql,"]","`")
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
        <%= Session("dbTitle") %></title>
</head>
<% If Session("dbBodyTag") & "x" <> "x" Then 
	Response.Write "<body " & Session("dbBodyTag") & ">"
Else %>
<body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>">
    <% End If %>
    <%
' Header
If Session("dbHeader") = 1 Then %>
    <!--#include file="GenericHeader.aspx"-->
    <% End If %>
    <font size="2" face="<%=strFont%>">
        <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strBorderColor%>" width="100%">
            <tr>
                <td>
                    <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=strBorderColor%>">
                        <tr>
                            <td bgcolor="<%=strMenuColor%>" align="RIGHT" width="*">
                                <font size="3" face="<%=strFont%>" color="<%=strMenuTextColor%>">
                                    <% 		If Trim(Session("dbExitPage")) & "x" <> "x" Then %>
                                    <a href="<%=Session("dbGenericPath")%>GenericExit.aspx">
                                        <%=txtExit%></a>
                                    <% 		End If %>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=Session("dbGenericPath")%>GenericExit.asp?CMD='Reset'"><%=txtReset%></a>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=Session("dbGenericPath")%>GenericList.aspx"><%=txtRefresh%></a>
                                    <% 		If Session("dbDebug") = 1 Then %>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=Session("dbGenericPath")%>GenericInfo.aspx">db&nbsp;Info</a>
                                    <% 		End If
 		If Session("dbSearchAdvanced") = 1 Then %>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=strEditor%>?CMD=SEARCH"><%=txtAdvancedSearch%></a>
                                    <% 		End If
	 	If Session("dbCanAdd") = 1 Then %>
                                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=strEditor%>?CMD=NEW"><%=txtAddRecord%></a>
                                    <% End If %>
                            </td>
                        </tr>
                        <tr>
                            <td align="RIGHT" bgcolor="#FFFFFF">
                                <font size="5" face="<%=strFont%>"><strong><em>
                                    <%=Session("dbTitle")%></em></strong>
                            </td>
                        </tr>
                        <% 	If (Session("dbCanAdd") = 1) AND (Session("dbExtraAdd") = 1) Then %>
                        <tr>
                            <td bgcolor="<%=strMenuColor%>" align="LEFT" width="*">
                                <font size="3" face="<%=strFont%>"><a href="<%=Session("dbGenericPath")%><%=strEditor%>?CMD=NEW">
                                    <b>
                                        <%=txtAddRecord%></b></a>
                        </tr>
                        <% End If %>
                    </table>
                </td>
            </tr>
        </table>
        <p>
            <% 	If strSearchPos = "TOP" Then 
		DispSearch()
	End If %>
            <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strMenuColor%>">
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="2" border="0" width="100%">
                            <!-- BGCOLOR=<%=strMenuColor%> -->
                            <tr>
                                <% For x = 1 to intFieldCount
		' If the field is to be displayed then
		If Mid(strDisplay, x, 1) = "1" Then 
			strConn = "ORDER=" & x 
			' Don't display BLOB's as sortable, and a GROUP BY clause will throw sorting off (this is what sets intAllowSort)
			If (aFields(x,2) = 201) OR (intAllowSort = 0) Then %>
                                <th>
                                    <font size="<%=intFontSize%>" face="<%=strFont%>">
                                        <%=arrFieldNames(x-1)%>
                                </th>
                                <% 			Else %>
                                <th>
                                    <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="GenericList.asp?<%=strConn%>">
                                        <%=arrFieldNames(x-1)%></a>
                                </th>
                                <% 			End If
		End If
	Next %>
                            </tr>
                            <%
intCount = 0
intActual = 0
Do While (NOT xrs.EOF) AND (intCount < intStopRec)
	intCount = intCount + 1
	If Cint(intCount) >= Cint(intStartRec) Then 
		intActual = intActual + 1 %>
                            <tr>
                                <%
		x = 0
		For Each xField in xrs.Fields
			x = x + 1
			curVal = xField.Value
			' Every other line will have a shaded background
			If intCount mod 2 = 0 Then
				bgcolor="#FFFFCC"
			Else
				bgcolor="White"
			End If
			' If on the Key field, build the link used to load the Viewer, Editor, or Deleter
			If x = CInt(intPrimary) Then
				Session("zcurTable") = strTable
				Session("zcurDisplay") = strDisplay
				Session("zcurKeyField") = aFields(x,1)
				strLink = "KEY=" & xField.Value
			End If
			If Mid(strDisplay, x, 1) = "1" Then %>
                                <td bgcolor="<%= bgcolor %>" align="LEFT" valign="TOP">
                                    <font size="<%=intFontSize%>" face="<%=strFont%>">
                                        <%				' Empty / Null / Blank
				If IsNull(curVal) OR (Trim(curVal) & "x" = "x") Then 
					curVal = "&nbsp;"
				Else
					If (Mid(strTotalFields, x, 1) = "1") AND IsNumeric(curVal) Then aFields(x,4) = aFields(x,4) + curVal
				End If
				Select Case aFields(x,2)
					case 2, 3, 17  ' Integers
						curVal = "<div align=right>" & curVal & "</div>"
					case 4, 5 ' Reals
						curVal = "<div align=right>" & curVal & "</div>"
					Case 6 ' Currency
						curval = "<div align=right>" & FormatCurrency(curval,2,-1) & "</div>"
					Case 11 ' Boolean
						If curVal Then
							curVal = txtTrue
						Else
							curVal = txtFalse
						End If
					Case 7, 135 ' Date / Time: 0=General, 1=LongDate, 2=ShortDate, 3=LongTime, 4=hh:mm
						if curVal <> "&nbsp;" then curVal = FormatDateTime(curVal, 1)
					Case 130, 201, 202, 203, 204 ' String or Memo
						curVal = replace(curVal,"<","&lt;")
						curVal = replace(curVal,">","&gt;")
						curVal = replace(curVal,chr(10),"&nbsp;<br>")
				End Select
				' Password
				If UCase(Left(aFields(x,1),8)) = "PASSWORD" Then curVal = "*****"
				' Image
				If (UCase(Left(aFields(x,1),3)) = "IMG") Then
					If Session("dbMaxImageSize") = 0 Then
						curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & GT 
					Else 
						curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & " WIDTH=" & QUOTE & Session("dbMaxImageSize") & QUOTE & GT 
					End If
				End If
				' Check for E-mail address
				strContainsURL = "dbEMailfor" & CStr(x)
				If (Session(strContainsURL) > 0) Then
					strURL = xrs(aFields(Session(strContainsURL),1))
					If Trim(strURL) & "x" <> "x" Then
						strURL = Replace(strURL,"mailto:","")
						strURL = "mailto:" & LTrim(strURL)
						curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
					End If
				End If
				' Check for hyperlink
				strContainsURL = "dbURLfor" & CStr(x)
				If Session(strContainsURL) > 0 Then
					strURL = xrs(aFields(Session(strContainsURL),1))
					If strURL & "x" <> "x" Then
						curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
						' *** Uncomment the following line to strip all #'s from hyperlink fields
						'curVal = Replace(curVal,"#","")
					End If
				Else
					If (UCase(Left(curVal,7)) = "HTTP://") Then
						curVal = LT & "A HREF=" & QUOTE & curVal & QUOTE & GT & curVal & LT & "/A" & GT
						' *** Uncomment the following line to strip all #'s from Access hyperlink fields
						' curVal = Replace(curVal,"#","")
					End If
 				End If
				Response.Write curVal %>&nbsp;
                                </td>
                                <% 			
			End If 
		Next 

		If IsSubTable Then %>
                                <td bgcolor="<%= bgcolor %>" align="CENTER">
                                    <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="<%=Session("dbGenericPath")%>GenericExit.asp?<%=strLink%>">
                                        <%=arrSubTable(0)%></a>
                                </td>
                                <%		End if
		If (Session("dbDispView") <> "")  and Session("dbKey") > 0 Then %>
                                <td bgcolor="<%= bgcolor %>" align="CENTER">
                                    <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="<%=Session("dbGenericPath")&strViewer%>?<%=strLink%>">
                                        <%=txtView%></a>
                                </td>
                                <% 		End If 
		If (Session("dbCanEdit") = 1)  and Session("dbKey") > 0 Then %>
                                <td bgcolor="<%= bgcolor %>" align="CENTER">
                                    <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="<%=Session("dbGenericPath")%><%=strEditor%>?<%=strLink%>">
                                        <%=txtEdit%></a>
                                </td>
                                <% 		End If 
		If (Session("dbCanDelete") = 1)  and Session("dbKey") > 0 Then %>
                                <td bgcolor="<%= bgcolor %>" align="CENTER">
                                    <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="<%= Session("dbGenericPath") %>GenericDelete.asp?<%= strLink %>">
                                        <%=txtDelete%></a>
                                </td>
                                <%		End If %>
                            </tr>
                            <%	End If
	xrs.MoveNext
Loop 

' Do we need to display a Totals row
y = false
For x = intFieldCount to 1 Step -1
	If (Mid(strDisplay, x, 1) = "1") AND Mid(strTotalFields, x, 1) = "1" Then y = True
	If (Mid(strDisplay, x, 1) = "1") Then z = x		' z=first field displayed
Next
If y Then 
	For x = 1 to intFieldCount
		if x = z then %>
                            <tr>
                                <td bgcolor="<%=bgcolor%>" align="RIGHT">
                                    <font size="<%=intFontSize%>" face="<%=strFont%>"><strong>
                                        <%=txtTotal%></strong>
                                </td>
                                <%		else
			If (Mid(strDisplay, x, 1) = "1") Then 
				If Mid(strTotalFields, x, 1) = "1" Then 
					Response.Write "<TD BGCOLOR=" & bgcolor & "><FONT SIZE=" & intFontSize & " FACE=" & QUOTE & strFont & QUOTE & "><STRONG>" & aFields(x,4) & "</FONT></STRONG></TD>"
				Else
					Response.Write "<TD BGCOLOR=" & bgcolor & ">&nbsp;</TD>"
				End If
			End If
		end if
	Next 
	Response.Write "</TR>"
End If %>
                        </table>
                    </td>
                </tr>
            </table>
            <font size="<%=intFontSize%>" face="<%=strFont%>">
                <%
' If no recs returned during a Search. . .
If (intTotalRecs = 0) AND (Session("dbState") >= 2) Then %>
                <p>
                    <%=txtSearchFailMsgA%>
                    <a href="<%=Session("dbGenericPath")%>GenericExit.asp?CMD='Reset'">
                        <%=txtReset%></a>
                    <%=txtSearchFailMsgB%><p>
                        <%
End If
' Find out if there should be Backward or Forward Buttons on the table.
intPageDisp = False
If 	intStartRec = 1 Then
	isPrev = False
Else
	isPrev = True
	PrevStart = intStartRec - intDisplayRecs
	If PrevStart < 1 Then PrevStart = 1 %>
                        <hr size="1">
                        <strong><a href="GenericList.asp?START=<%=PrevStart%>">[&lt;&lt;&nbsp;<%=txtPreviousPage%>]</a></strong>
            </font>
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
    </font>
    <p>
        <% 	If strSearchPos = "BOTTOM" Then 
		DispSearch()
	End If %>
        <!-- Main Body End -->
        <!-- Footer -->
        <% If Session("dbFooter") = 1 Then %>
        <!--#include file="GenericFooter.aspx"-->
        <% End If %>
</body>
</html>
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
                <input type="Hidden" name="SearchAction" value="SHORT">
                <tr>
                    <td height="0" bgcolor="WHITE" align="LEFT">
                        <font size="2" face="<%=strFont%>">
                            <%=txtSearchFor%>
                            <font size="2" face="<%=strFont%>">
                                <input type="Text" name="strSearch" size="40">
                                <% If Session("dbSearchEnhanced") = 1 then%>
                    </td>
                </tr>
                <tr>
                    <td height="0" bgcolor="WHITE" align="right">
                        <font size="2" face="<%=strFont%>">
                            <input type="Radio" name="SearchPhrase" value="OR" checked><%=txtAnyofthesewords%>
                            <input type="Radio" name="SearchPhrase" value="EXACT"><%=txtExactPhrase%>
                            <% Else %>
                            <input type="Hidden" name="SearchPhrase" value="OR">
                            <% End If %>
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
