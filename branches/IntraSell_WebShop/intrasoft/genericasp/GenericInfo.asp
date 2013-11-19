<!--#include file="GenericLanguage.asp" -->
<% 
' Generic Database - Information Page
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
' 29 Feb 2000 - Preparation for release
'  9 Sep 1998 - Last modified

' Prevent caching
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "cache-control", "must-revalidate"
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"

' Check for an active session
If Session("dbConn") = "" Then
	Response.Clear
	Response.Redirect "GenericError.asp"
End If

' Check for user rights
If Session("dbDebug") <> 1 Then
	Response.Clear
	Response.Redirect Session("dbViewPage")
End If

Dim strType, strConn, strTable, strFields, strDisplay, strKeyField, strGroupBy
Dim strFont, strFontSize, strBorderColor, strMenuColor
' Get info from Session vars 
strType = UCase(Session("dbType"))
strConn = Session("dbConn")
strTable = Session("dbRs")
strFields = Session("dbFields")
strDisplay = Session("dbDispView")
strKeyField = Session("dbKey")
strGroupBy = Session("dbGroupBy")
strFont = Session("dbFont")
intFontSize = Session("dbFontSize")
strBorderColor = Session("dbBorderColor")
strMenuColor = Session("dbMenuColor")
strMenuTextColor = Session("dbMenuTextColor")

' Open Connection to the database
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn

' Check and set fonts and colours
If Trim(strdbBorderColor) & "x" = "x" Then strdbBorderColor = "#99CCCC"
If Trim(strFont = "") Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If Trim(strMenuTextColor) = "" Then strMenuTextColor = "Black"
if Trim(strFields) = "" then strFields = "*"
%>
<HTML>
<HEAD>
	<TITLE>Generic View - Information</TITLE>
</HEAD>
<% If Session("dbBodyTag") & "x" = "x" then %>
<body
<% Else %>
<body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>"
<% End If %>
<% If Session("dbBodyTag") & "x" <> "x" Then Response.Write Session("dbBodyTag")%>
>
<FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">

<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%> WIDTH="100%"><TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strBorderColor%>>
<TR><TD BGCOLOR=<%=strMenuColor%> ALIGN="RIGHT" WIDTH="*"><FONT SIZE="3" FACE="<%=strFont%>" COLOR="<%=strMenuTextColor%>">
		<A HREF="<%=Session("dbGenericPath") & "GenericList.asp"%>"><%=txtBackToList%></A>
</TD></TR>
<TR><TD ALIGN="RIGHT" BGCOLOR=#FFFFFF ROWSPAN=2 WIDTH="1"><FONT SIZE=5 FACE="<%=strFont%>"><STRONG><EM><%=Session("dbTitle")%> - Information</EM></STRONG></FONT> </TD></TR>
</TABLE></TD></TR></TABLE>

Connection: <strong><%= strConn %></strong><p>
Query:<br>
SELECT <%= strFields %><br>
FROM <%= Session("dbRs") %><br>
WHERE <%= Session("dbWhere") %><br>
GROUP BY <%= strGroupBy %><br>
HAVING <%= Session("dbHaving") %><br>
ORDER BY <%= Session("dbOrderBy") %><p>

<%
' Open Recordset and get the field info
strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
Select Case strType
	Case "UDF" 
		strsql = "SELECT " & strFields & " FROM " & strTable
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
If Not Trim(strGroupBy) = "" Then strsql = strsql & " GROUP BY " & strGroupBy
set xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open strsql, xConn, 1, 2
intFieldCount = xrs.Fields.Count
Dim aFields()
ReDim aFields(intFieldCount,4) %>
<P>
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%>>
<TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strMenuColor%>>
<TR><TD COLSPAN=5 ALIGN=CENTER BGCOLOR=<%=strMenuColor%>><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>"><STRONG>- <%= strTable %> -</STRONG></TD></TR>
<TR>
	<TH><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>">#</TH>
	<TH><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>">Field</TH>
	<TH><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>">Type #</TH>
	<TH><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>">Type</TH>
	<TH><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>">Length</TH>
</TR>
<% For x = 1 to intFieldCount
	If x mod 2 = 0 Then
		bgcolor="#FFFFCC"
	Else
		bgcolor="White"
	End If %>
<TR>
	<TD HEIGHT=0 BGCOLOR=<%= bgcolor %> ALIGN="LEFT"><FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>"><%=x %></TD>
<% 			aFields(x, 1) = xrs.Fields(x-1).Name %>
	<TD HEIGHT=0 BGCOLOR=<%= bgcolor %> ALIGN="LEFT">
		<FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>"><%=aFields(x, 1)%></TD>
<%			aFields(x, 2) = xrs.Fields(x-1).Type %>
	<TD HEIGHT=0 BGCOLOR=<%= bgcolor %> ALIGN="LEFT">
		<FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>"><%=aFields(x, 2)%></TD>
<%			aFields(x, 3) = xrs.Fields(x-1).DefinedSize %>
	<TD HEIGHT=0 BGCOLOR=<%= bgcolor %> ALIGN="LEFT">
		<FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>">
<%			Select Case aFields(x,2) 
				Case 2	' 2-Byte Integer %>
			2-Byte Integer
<% 				Case 3 ' 4-Byte Integer %>
			4-Byte Integer
<% 				Case 4 ' 2-Byte Real %>
			2-Byte Real
<% 				Case 5 ' 4-Byte Real %>
			4-Byte Real
<% 				Case 6 ' Currency %>
			Currency
<% 				Case 7, 135 ' Date / Time Stamp %>
			Date / Time
<% 				Case 11 ' Boolean True/False %>
			True/False
<% 				Case 17 ' 1-Byte Integer %>
			Byte
<% 				Case 129 ' Char %>
			String (Char)
<% 				Case 130 ' Unicode String %>
			String (WChar)
<% 				Case 131 ' Numeric - A floating point type %>
			Numeric
<% 				Case 200 ' String %>
			String (VarChar)
<% 				Case 201 ' Memo %>
			Memo (LongVarChar)
<% 				Case 202 ' Unicode String %>
			Unicode String (VarWChar)
<% 				Case 203 ' Unicode String %>
			Unicode Memo (LongVarWChar)
<% 				Case 205 ' BLOB %>
			BLOB (Unsupported)
<% 			end Select %>
	</TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="LEFT">
		<FONT SIZE=<%=intFontSize%> FACE="<%=strFont%>"><%=aFields(x, 3)%></TD>
</TR>
<% Next %>
</TABLE></TD></TR></TABLE>
<P>
Current Order set by:<br>
<% If Session("dbOrder") > 0 Then %>
Session("dbOrder") = <STRONG><%= Session("dbOrder") %></STRONG>
<% Else  %>
Session("dbOrderBy") = <STRONG><%= Session("dbOrderBy") %></STRONG>
<% End If %>
<p>Cut and Paste the following to build a custom list of field names:<br>
Session("dbFieldNames") = "<%
For x = 1 to intFieldCount - 1
	Response.Write aFields(x, 1) & ", "
Next
Response.Write aFields(intFieldCount, 1) & chr(34)
' Close up shop
xrs.Close
Set xrs = Nothing
xConn.Close
Set xConn = Nothing
%>
<!-- Footer -->
<% If Session("dbFooter") = 1 Then %>
<!--#include file="GenericFooter.asp"-->
<% End If %>
</BODY>
</HTML>
