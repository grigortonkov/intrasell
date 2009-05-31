<!--#include file="../menu.asp"-->  
<!--#include file="GenericLanguage.asp" -->
<% 
' Generic Database - Delete Record
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
' 29 Feb 2000 - Preparation for release
'				Fix to caching
'  9 Sep 1998 - First created or released

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

' Check user rights
If Session("dbCanDelete") <> 1 Then
	Response.Clear
	Response.Redirect Session("dbViewPage")
End If

' Get info from Session vars (kinda like parameters)
strType = UCase(Session("dbType"))
strConn = Session("dbConn")
strFields = Session("dbFields")
strTable = Session("dbRs")
strDisplay = Session("dbDispView")
strKeyField = Session("dbKey")
strFont = Session("dbFont")
intFontSize = Session("dbFontSize")
strBorderColor = Session("dbBorderColor")
strMenuColor = Session("dbMenuColor")
strMenuTextColor = Session("dbMenuTextColor")
intConfirmDelete = Session("dbConfirmDelete")

if strFields = "" Then strFields = "*"

' If we don't get passed a key to delete or there's no unique key field defined then get out.
If (Request.QueryString("KEY").Count = 0) OR (strKeyField = "") Then
	Response.Clear
	Response.Redirect Session("dbViewPage")
Else
	strKey = Request.QueryString("KEY")
	Session("dbcurKey") = strKey
End If

DoConfirm = True
If Request.QueryString("CMD").Count > 0 Then
	' See if we need to confirm the deletion
	strCMD = Request.QueryString("CMD")
	If strCMD = "'CON'" Then DoConfirm = False
End If

' Open Connection to the database
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn

' Open Recordset and get the field info
strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
Select Case strType
	Case "UDF" 
		strsql = "SELECT " & strFields & " FROM " & strTable
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
set xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open strsql, xConn, 1, 2
intFieldCount = xrs.Fields.Count
Dim aFields()
ReDim aFields(intFieldCount,4)
For x = 1 to intFieldCount
	aFields(x, 1) = xrs.Fields(x-1).Name 
	aFields(x, 2) = xrs.Fields(x-1).Type 
	aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
Next 

xrs.Close
strsql = "SELECT " & strFields & " FROM [" & strTable & "]" & " WHERE [" & aFields(strKeyField,1) & "]" & "=" & strKey
If strType = "SQL" Then
	' Strip brackets for SQL
	strsql = Replace(strsql,"[","")
	strsql = Replace(strsql,"]","")
End If
If strType = "SQL" Then
	xrs.Open strsql, xConn, 2, 3, 1
Else
	xrs.Open strsql, xConn, 2, 3
End If

' Get the field contents
For x = 1 to intFieldCount
	aFields(x,4) = xrs(x-1)
Next 

' Check and set fonts and colours
If Trim(strFont = "") Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strBorderColor) = "" Then strBorderColor = "#99CCCC"
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If Trim(strMenuTextColor) = "" Then strMenuTextColor = "Black"

If (intConfirmDelete > 0) AND DoConfirm Then
' Prevent caching
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "Cache-Control", "must-revalidate"
Response.AddHeader "Cache-Control", "no-cache" %>
<HTML>
<HEAD>
	<TITLE><%=Session("dbTitle")%> - <%=txtDelete%></TITLE>
</HEAD>
<% If Session("dbBodyTag") & "x" = "x" then %>
<body
<% Else %>
<body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>"
<% End If %>
<% If Session("dbBodyTag") & "x" <> "x" Then Response.Write Session("dbBodyTag")%>
>
<FONT FACE="<%=strFont%>">
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%> WIDTH="100%">
<TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strBorderColor%>>
<TR><TD BGCOLOR=<%=strMenuColor%> ALIGN="RIGHT" WIDTH="*"><FONT SIZE="3" FACE="<%=strFont%>" COLOR="<%=strMenuTextColor%>">
		<A HREF="<%=Session("dbViewPage")%>"><%=txtBackToList%></A>
<% 		If (Session("dbCanEdit") = 1)  and Session("dbKey") > 0 Then %> 
		&nbsp;&nbsp;|&nbsp;&nbsp;	
		<A HREF="<%=Session("dbGenericPath")%>GenericEdit.asp?KEY=<%=aFields(Session("dbKey"),4)%>"><%=txtEdit%></A>
<% 		End If %>
<% 		If IsSubTable Then %> 
		&nbsp;&nbsp;|&nbsp;&nbsp;	
		<A HREF="<%=Session("dbGenericPath")%>GenericExit.asp?KEY=<%=aFields(Session("dbKey"),4)%>"><%=arrSubTable(0)%></A>
<% 		End If %>
	</TD>
</TR>
<TR><TD ALIGN="RIGHT" BGCOLOR=#FFFFFF ROWSPAN=2 WIDTH="1"><FONT SIZE="5" FACE="<%=strFont%>"><STRONG><EM><%=Session("dbTitle")%> - <%=txtDelete%></EM></STRONG></FONT> </TD></TR>
</TABLE></TD></TR></TABLE>

<P>
<CENTER>
<FONT SIZE="4" FACE="<%=strFont%>"><STRONG><EM><%=txtDeletePrompt%></EM></STRONG></FONT><BR>
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%>>
<TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strBorderColor%>>
<TR>
<TD BGCOLOR="#FFFFCC"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>"><A HREF="<%= Session("dbGenericPath") %>GenericDelete.asp?CMD='CON'&KEY=<%= strKey %>"><%=txtYes%></A></FONT></TD>
<TD BGCOLOR="#FFFFCC"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>"><A HREF="<%=Session("dbViewPage")%>"><STRONG><%=txtNo%></STRONG></A></FONT></TD>
</TR>
</TABLE></TD></TR></TABLE>

<P>
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%>>
<TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strBorderColor%>>
<% For x = 1 to intFieldCount 
	If Mid(strDisplay, x, 1) = "1" Then %>
		<TR BGCOLOR="#FFFFCC" ALIGN="LEFT">
		<TD><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>"><% Response.Write aFields(x,1) %></TD>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
<%			curVal = aFields(x,4)
			' Blank or null
			If IsNull(curVal) Then curVal = "&nbsp;"
			If Trim(curVal) & "x" = "x" Then curVal = "&nbsp;"
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
			If curVal <> "&nbsp;" then
				Select Case aFields(x,2)
					case 2, 3, 4, 5 ' Numbers
						curVal = "<div align=right>" & curVal & "</div>"
					case 6 ' Currency
						curval = "<div align=right>" & FormatCurrency(curval,2,-1) & "</div>"
					case 7, 135 ' Date / Time - Fixed for Null values by Elizabeth Robins
						if curval <> "&nbsp;" Then curVal = FormatDateTime(curVal)
					case 11 ' Boolean
						If curVal Then
							curVal = txtTrue
						Else
							curVal = txtFalse
						End If
					case 129, 130, 200, 201, 202, 203 ' String or Memo
						curVal = replace(curVal,"<","&lt;")
						curVal = replace(curVal,">","&gt;")
						curVal = replace(curVal,chr(10),"&nbsp;<br>")
				End Select
			end if
			Response.Write curVal %>
		</TD>
		</TR>
<% 		End If 
	Next 
	Set xrs = Nothing
	xConn.Close
	Set xConn = Nothing
Else
	If xrs.EOF Then
		Response.Clear
		Response.Redirect Session("dbViewPage")
	End If
	xrs.Delete
	xrs.Close
	Set xrs = Nothing
	xConn.Close
	Set xConn = Nothing
	Response.Clear
	Response.Redirect Session("dbViewPage")
End If
%>
</TABLE>
</TD></TR>
</TABLE>
</CENTER>
<% If Session("dbFooter") = 1 Then %>
<!--#include file="GenericFooter.asp"-->
<% End If %>
</BODY>
</HTML>


