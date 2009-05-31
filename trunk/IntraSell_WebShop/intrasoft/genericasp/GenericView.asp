<!--#include file="GenericLanguage.asp" -->
<% 
' Generic Database - View Record
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
' 11 May 2000 - dbFormatDateTime: 0=General, 1=LongDate, 2=ShortDate, 3=LongTime, 4=hh:mm
'			  	Took out effects of dbMaxImageSize, should only use it in the Lister
' 29 Feb 2000 - Preparation for release
'  9 Sep 1998 - First created or released

' Prevent caching
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "cache-control", "must-revalidate"
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"

QUOTE = chr(34)
LT = chr(60)
GT = chr(62)

' Make sure we have an active session
If Session("dbRs") = "" Then
	Response.Clear
	Response.Redirect "GenericError.asp"
End If

' Check permissions
If Session("dbDispView") = "" Then
	Response.Clear
	Response.Redirect Session("dbViewPage")
End If

' Get info from Session vars 
strType = UCase(Session("dbType"))
strConn = Session("dbConn")
strTable = Session("dbRs")
strFormatDate = Session("dbFormatDateTime")
strFont = Session("dbFont")
intFontSize = Session("dbFontSize")
strBorderColor = Session("dbBorderColor")
strMenuColor = Session("dbMenuColor")
strMenuTextColor = Session("dbMenuTextColor")

' Is there a sub-table to display
If Not (Session("dbSubTable") = "") Then
	arrSubTable = Split(Session("dbSubTable"),",")
	IsSubTable = True
End If

' Check for and set default fonts / colors
If Trim(strFont) = "" Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strBorderColor) = "" Then strBorderColor = "#99CCCC"
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If Trim(strMenuTextColor) = "" Then strMenuTextColor = "Black"

' Check which editor to use for Add and Edit links
If Session("dbEditTemplate") & "x" = "x" Then
	strEditor = "GenericEdit.asp"
Else 
	strEditor = "GenericCustomEdit.asp"
End if

' Get the key value of the record to display	
If Request.QueryString("KEY").Count > 0 Then
	strKey = Request.QueryString("KEY")
	Session("dbcurKey") = strKey
Else
	Response.Clear
	Response.Redirect Session("dbViewPage")
End If

' Open Connection to the database
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn

' Get info from Session vars (kinda like parameters)
strTable = Session("dbRs")
strDisplay = Session("dbDispView")
strKeyField = Session("dbKey")
strFields = Session("dbFields")
if strFields = "" Then strFields = "*"

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
xrs.Open strsql, xConn
intFieldCount = xrs.Fields.Count
Dim aFields()
ReDim aFields(intFieldCount,4)

If Trim(Session("dbFieldNames")) & "x" = "x" Then
	ReDim arrFieldNames(intFieldCount)
	For x = 1 to intFieldCount
		aFields(x, 1) = xrs.Fields(x-1).Name 
		aFields(x, 2) = xrs.Fields(x-1).Type 
		aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
		arrFieldNames(x-1) = xrs.Fields(x-1).Name 
	Next 
Else
	For x = 1 to intFieldCount
		aFields(x, 1) = xrs.Fields(x-1).Name 
		aFields(x, 2) = xrs.Fields(x-1).Type 
		aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
	Next 
	arrFieldNames = Split(Session("dbFieldNames"), ",")
End If

xrs.Close
' Reopen the Recordset, this time use the parameters passed
strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
strsql = strsql & " WHERE [" & aFields(strKeyField,1) & "]" & "=" & strKey
Select Case strType
	Case "UDF" 
		strsql = "SELECT " & strFields & " FROM " & strTable
		strsql = strsql & " WHERE [" & aFields(strKeyField,1) & "]" & "=" & strKey
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
xrs.Open strsql, xConn

If xrs.EOF Then
	Response.Clear
	Response.Redirect Session("dbViewPage") 
End If
' Get the field contents
For x = 1 to intFieldCount
	aFields(x,4) = xrs(x-1)
Next 

xrs.Close
Set xrs = Nothing
xConn.Close
Set xConn = Nothing
' For settings not used, set to default values (i.e. "0000" or "111111")
if trim(strFormatDate) = "" then strFormatDate = String(intFieldCount,"0") %>

<HTML>
<HEAD>
	<TITLE><%=Session("dbTitle")%> - <%=txtView%></TITLE>
</HEAD>
<% If Session("dbBodyTag") & "x" = "x" then %>
<body
<% Else %>
<body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>"
<% End If %>
<% If Session("dbBodyTag") & "x" <> "x" Then Response.Write Session("dbBodyTag")%>
>
<!-- Header -->
<% If Session("dbHeader") = 1 Then %>
<!--#include file="GenericHeader.asp"-->
<% End If %>
<FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">

<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%> WIDTH="100%"><TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strBorderColor%>>
<TR><TD BGCOLOR=<%=strMenuColor%> ALIGN="RIGHT" WIDTH="*"><FONT SIZE="3" FACE="<%=strFont%>" COLOR="<%=strMenuTextColor%>">
		<A HREF="<%=Session("dbGenericPath")%>GenericList.asp"><%=txtBackToList%></A>
<% If (Session("dbCanEdit") = 1)  and Session("dbKey") > 0 Then %> 
		&nbsp;&nbsp;|&nbsp;&nbsp;<A HREF="<%=Session("dbGenericPath")%><%=strEditor%>?KEY=<%=aFields(Session("dbKey"),4)%>"><%=txtEdit%></A>
<% End If 
If IsSubTable Then %> 
		&nbsp;&nbsp;|&nbsp;&nbsp;<A HREF="<%=Session("dbGenericPath")%>GenericExit.asp?KEY=<%=aFields(Session("dbKey"),4)%>"><%=arrSubTable(0)%></A>
<% End If %>
	</FONT></TD>
</TR>
<TR><TD ALIGN="RIGHT" BGCOLOR=#FFFFFF><FONT SIZE=5 FACE="<%=strFont%>"><STRONG><EM><%=Session("dbTitle")%> - <%=txtView%></EM></STRONG></FONT> </TD></TR>
</TABLE></TD></TR></TABLE>

<P>
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strBorderColor%>><TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=strBorderColor%>>
<% 	For x = 1 to intFieldCount 
	If Mid(strDisplay, x, 1) = "1" Then %>
	<TR BGCOLOR="#FFFFCC" ALIGN="LEFT">
		<TD><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>"><%=arrFieldNames(x-1)%></FONT></TD>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
<%			curVal = aFields(x,4)
			' Blank / Null / Empty
			If IsNull(curVal) OR (Trim(curVal) & "x" = "x") Then curVal = "&nbsp;"
			' Password
			If UCase(Left(aFields(x,1),8)) = "PASSWORD" Then curVal = "*****"
			' Format the various field types
			Select Case aFields(x,2)
				case 2, 3, 4, 5 ' Numbers
					curVal = "<div align=right>" & curVal & "</div>"
				case 6 ' Currency
					curval = "<div align=right>" & FormatCurrency(curval,2,-1) & "</div>"
				case 7, 135 ' Date / Time - Fixed for Null values by Elizabeth Robins
					if curVal <> "&nbsp;" then curVal = FormatDateTime(curVal, Mid(strFormatDate, x, 1))
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
			' Image
			If (UCase(Left(aFields(x,1),3)) = "IMG") Then curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & GT 
			' Check for E-mail address
			strContainsURL = "dbEMailfor" & CStr(x)
			If (Session(strContainsURL) > 0) Then
				strURL = aFields(Session(strContainsURL),4)
				If Trim(strURL) & "x" <> "x" Then
					strURL = Replace(strURL,"mailto:","")
					strURL = "mailto:" & LTrim(strURL)
					curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
				End If
			End If
			' Check for hyperlink 
			strContainsURL = "dbURLfor" & CStr(x)
			If Session(strContainsURL) <> 0 Then
				strURL = aFields(Session(strContainsURL),4)
				If strURL & "x" <> "x" Then
					curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
' *** Uncomment the following line to strip all #'s from hyperlink fields
'					curVal = Replace(curVal,"#","")
				End If
			Else
				If (UCase(Left(curVal,7)) = "HTTP://") Then
					curVal = LT & "A HREF=" & QUOTE & curVal & QUOTE & GT & curVal & LT & "/A" & GT
' *** Uncomment the following line to strip all #'s from Access hyperlink fields
'					curVal = Replace(curVal,"#","")
				End If
			End If
			Response.Write curVal %>
		</FONT></TD>
	</TR>
<% End If
Next %>
</TABLE></TD></TR></TABLE>

<!-- Footer -->
<% If Session("dbFooter") = 1 Then %>
<!--#include file="GenericFooter.asp"-->
<% End If %>
</FONT>
</BODY>
</HTML>
