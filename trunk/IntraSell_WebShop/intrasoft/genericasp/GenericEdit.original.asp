<!--#include file="GenericLanguage.asp" -->
<% 
' Generic Database - Edit Record
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
' 23 Jun 2000 - Fix for combo boxes when current record was originally created with a null value, suggested by John Pennington
'				Insert, get, update fixed for Access tablenames with spaces 
' 29 Feb 2000 - Preparation for release
'				Fix to caching
'				Unicode field types added
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

' Get info from Session vars (kinda like parameters)
strType = Trim(UCase(Session("dbType")))
strConn = Session("dbConn")
strTable = Session("dbRs")
strFields = Session("dbFields")
strDisplay = Session("dbDispEdit")
strKeyField = Session("dbKey")
strFont = Session("dbFont")
intFontSize = Session("dbFontSize")
strBorderColor = Session("dbBorderColor")
strMenuColor = Session("dbMenuColor")
strMenuTextColor = Session("dbMenuTextColor")
IsSubTable = Session("dbIsSubTable")

IsSearch = False
QUOTE = chr(34)
FormAction = "GenericEdit.asp"
Action = "GET"

' Language Translation
if txtUpdate = "" Then %>
<html><head><title>Error</title></head><body>GenericDB Language File Missing.<br>Find it at: <a href="http://www.ofific.org/Eli/ASP/"></a></body></html> <%
end if
SubmitValue = txtUpdate
CaseUpdateValue = UCase(Left(txtUpdate,3))
CaseAddValue = UCase(Left(txtAdd,3))

' Check and set fonts and colours
If Trim(strFont = "") Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strBorderColor) = "" Then strBorderColor = "#99CCCC"
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If Trim(strMenuTextColor) = "" Then strMenuTextColor = "Black"
if strFields = "" then strFields = "*"

If Request.QueryString("KEY").Count > 0 Then
	' Quick security check for Edit rights
	If Not(Session("dbCanEdit") = 1) Then
		Response.Clear
		Response.Redirect Session("dbViewPage")
	End If
	strKey = Request.QueryString("KEY")
	Session("dbcurKey") = strKey
	Action = "GET"
ElseIf Request.QueryString("CMD").Count > 0 Then
	strCMD = Request.QueryString("CMD")
	' Quick security check for Add rights
	Select Case strCmd
		Case "NEW"
			if (Session("dbCanAdd") = 1) Then 
				Action = "NEW"
				if NOT (Session("dbDispNew") & "x" = "x") then strDisplay = Session("dbDispNew")
			else
				Response.Clear
				Response.Redirect Session("dbViewPage")
			end if
		Case "SEARCH"
			Action = "Search"
			strDisplay = Session("dbSearchFields")	
			FormAction = "GenericSearchResult.asp?SearchAction=FULL"
			SubmitValue = txtSearch
			strKeyField = ""
			IsSearch = True
		End Select
Else
	Action = Left(UCase(Request.Form("Action")),3)
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
Set xrs = Nothing

' Load the results of the last form view (GET or UPDATE)
For x = 1 to intFieldCount
	aFields(x,4) = Request.Form(aFields(x,1))
Next 

Select Case Action
	Case CaseAddValue ' Insert the new record into the database
		' Data validation 
		For x = 1 to intFieldCount
			Select Case aFields(x, 2) 
				case 2, 3, 4, 5, 6, 17	' 2 Byte Integer, 4 Byte Integer, Currency, Byte
					tFLD = aFields(x,4)
					xInt = 0
					If IsNumeric(tFLD) Then 
						aFields(x,4) = tFLD
					Else
						aFields(x,4) = xInt
					End If
				Case 11 	' Boolean True/False
					If aFields(x,4) = "Yes" Then
						aFields(x,4) = True
					Else
						aFields(x,4) = False
					End If
				case 129, 130, 200, 201, 202, 203, 204 
				' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
					aFields(x,4) = Replace(aFields(x,4),chr(34),"&quot;")
					aFields(x,4) = Replace(aFields(x,4),"#include","")
					aFields(x,4) = Replace(aFields(x,4),"<","&lt;")
					aFields(x,4) = Replace(aFields(x,4),">","&gt;")
					tFLD = Trim(aFields(x,4))
					If tFLD & "x" = "x" Then tFLD = Null
					aFields(x,4) = tFLD
				Case 7, 135	' Date / Time Stamp, usually created with the Now() function
					If (aFields(x,4) & "x" = "x") OR NOT IsDate(aFields(x,4)) Then
						aFields(x,4) = Null
					Else
						aFields(x,4) = CDate(aFields(x,4))
					End If
			End Select
		Next
		
		Set xrs =  Server.CreateObject("ADODB.Recordset")
		if NOT((strType = "UDF") or (strType = "SQL")) then strTable = "[" & strTable & "]"
		' 2 for Open Dynamic, 3 for Optimistic Locking, 2 for Table
		xrs.Open strTable, xConn, 2, 3, 2
		xrs.AddNew

		' Store the values to the table
		For x = 1 to intFieldCount
			If x <> strKeyField Then xrs.Fields(x-1) = aFields(x,4)
		Next 

		On Error Resume Next
		xrs.Update
		' Call Error Handler if update bombs
		If Err.Number <> 0 Then
			Session("ErrNumber") = 99
			Session("ErrDesc") = Err.Description 
			Session("ErrSource") = Err.Source 
			Session("ErrLine") = Err.Line 
			Session("ErrMsg") = "Query: " & strsql
			Response.Clear
			Response.Redirect "GenericError.asp"
		End If
		
		xrs.Close
		Set xrs = Nothing
		xConn.Close
		Set xConn = Nothing
		Response.Clear
					
		if Session("dbOnlyAdd") = 1 Then Response.Redirect Session("dbExitPage")
		Response.Redirect Session("dbViewPage")

	Case "NEW": ' Load a blank form
		SUBMITVALUE = txtAdd

		' Initialize Fields
		For x = 1 to intFieldCount
			If strKeyField = aFields(x,1) Then
				' Don't try to change the counter
			Else
				' Check if a default has been specified
				strDefault = "dbDefault" & x
				If Session(strDefault) & "x" = "x" Then
					Select Case aFields(x, 2) 
						Case 2, 3, 4, 5, 6, 131 ' Numeric types
							aFields(x,4) = 0
						Case 11 ' Boolean True/False
							aFields(x,4) = "No"
						Case 129, 130, 200, 201, 202, 203, 204 ' String types
							aFields(x,4) = ""
						Case 17, 135 ' Date / Time Stamp
							aFields(x,4) = ""
					End Select
				Else
					aFields(x,4) = Session(strDefault)
				End If
				If IsSubTable Then
					arrSubTable = Split(Session("dbSubTableCopy"),",")
					' Suggested by Paul Reith:
					If Trim(aFields(x,1)) = Trim(arrSubTable(2)) Then aFields(x,4) = Session("dbsubkey")
				End If
			End If
		Next 

	Case "Search" ' Opening as a search, designed by Grant Wilson
		SUBMITVALUE = txtSearchSubmit
		' Initialize Fields
		For x = 1 to intFieldCount
			' Check if a default has been specified
				strDefault = "dbDefault" & x
				If Session(strDefault) & "x" = "x" Then
					Select Case aFields(x, 2) 
						Case 2, 3, 4, 5, 6, 131 ' Numeric types
							aFields(x,4) = 0
						Case 11 ' Boolean True/False
							aFields(x,4) = "No"
						Case 129, 130, 200, 201, 202, 203 ' String types
							aFields(x,4) = ""
						Case 7, 135 ' Date / Time Stamp
							aFields(x,4) = ""
					End Select
				Else
					aFields(x,4) = "" '**** No Session(strDefault)
				End If
		Next 

	Case "GET": ' Get a record to display
		strsql = "SELECT " & strFields & " FROM [" & strTable & "] WHERE [" & aFields(strKeyField,1) & "]=" & strKey 
		select case strType
			case "UDF" 
				strsql = "SELECT " & strFields & " FROM " & strTable & " WHERE " & aFields(strKeyField,1) & "=" & strKey 
			case "SQL" 
				strsql = Replace(strsql,"[","")
				strsql = Replace(strsql,"]","")
		end select
		set xrs = Server.CreateObject("ADODB.Recordset")
		xrs.Open strsql, xConn
		If xrs.EOF Then
			Response.Clear
			if (Session("dbOnlyAdd")=1) OR (Session("dbOnlyEdit")=1) then Response.Redirect Session("dbExitPage")
			Response.Redirect Session("dbViewPage")
		End If
		xrs.MoveFirst

		' Get the field contents
		For x = 1 to intFieldCount
			If aFields(x,2) = 11 Then
				If xrs(x-1) Then
					aFields(x,4) = "Yes"
				Else
					aFields(x,4) = "No"
				End If
			Else
				aFields(x,4) = xrs(x-1)
			End If
		Next 

		xrs.Close
		Set xrs = Nothing

	Case CaseUpdateValue: ' Update
		' Open record
		strsql = "SELECT " & strFields & " FROM [" & strTable & "] WHERE [" & aFields(strKeyField,1) & "]=" & Session("dbcurKey")
		select case strType
			case "UDF" 
				strsql = "SELECT " & strFields & " FROM " & strTable & " WHERE " & aFields(strKeyField,1) & "=" & Session("dbcurKey")
			case "SQL" 
				strsql = Replace(strsql,"[","")
				strsql = Replace(strsql,"]","")
		end select
		set xrs = Server.CreateObject("ADODB.Recordset")
		xrs.Open strsql, xConn, 1, 2

		If xrs.EOF Then
			Response.Clear
			Response.Redirect Session("dbViewPage")
		End If

		For x = 1 to intFieldCount
			If strKeyField = x Then
				' Don't try to change the counter
			Else
				' Check if a forced update value has been specified
				strDefault = "dbUpdateField" & x
				If Session(strDefault) & "x" = "x" Then
					Select Case aFields(x,2) 
						Case 2
						' 2 Byte Integer
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CInt(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 3
						' 4 Byte Integer
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CLng(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 4
						' Single-Precision Floating Point
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CSng(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 5, 6, 131
						' Double-Precision Floating Point, Currency, adNumeric
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CDbl(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 7, 135
						' Date / Time Stamp, usually created with the Now() function
							If IsDate(aFields(x,4)) Then
								xrs(x-1) = CDate(aFields(x,4))
							Else
								xrs(x-1) = Null
							End If
						Case 11
						' Boolean True/False
							tFLD = aFields(x,4)
							If tFLD = "Yes" Then
								xrs(x-1) = True
							Else
								xrs(x-1) = False
							End If
						Case 129, 130, 200, 201, 202, 203, 204
						' All string types
							tFLD = Trim(aFields(x,4))
							tFLD = Replace(tFLD,chr(34),"&quot;")
							tFLD = Replace(tFLD,"<","&lt;")
							tFLD = Replace(tFLD,">","&gt;")
							If Trim(tFLD) & "x" = "x" Then tFLD = Null
							Response.Write aFields(x,1)
							xrs(x-1) = tFLD
					End Select
				Else
					xrs(x-1) = Session(strDefault)
				End If
			End If
		Next
		xrs.Update
		xrs.Close
		Set xrs = Nothing
		xConn.Close
		Set xConn = Nothing
		Response.Clear

		If Session("dbOnlyEdit") = 1 then Response.Redirect Session("dbExitPage")
		Response.Redirect Session("dbViewPage")
End Select
%>
<HTML>
<HEAD>
	<TITLE><%=Session("dbTitle")%> - <%=txtEditMode%></TITLE>
</HEAD>
<% If Session("dbBodyTag") & "x" = "x" then %>
<body
<% Else %>
<body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>"
<% End If %>
<% If strBodyTag & "x" <> "x" Then response.Write strBodyTag%>
>
<!-- Header -->
<% If Session("dbHeader") = 1 Then %>
<!--#include file="GenericHeader.asp"-->
<% End If %>
<FONT SIZE=2 FACE="<%=strFont%>">
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 WIDTH="100%" BGCOLOR=<%=strBorderColor%>>
<TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH="100%" BGCOLOR=<%=strBorderColor%>>
<TR>
	<TD BGCOLOR=<%=strMenuColor%> ALIGN="RIGHT" WIDTH="*"><FONT SIZE="3" FACE="<%=strFont%>" COLOR="<%=strMenuTextColor%>">
<% if (Session("dbOnlyAdd")=1) OR (Session("dbOnlyEdit")=1) then 
		if Session("dbBackText") & "x" <> "x" then %>
			<A HREF="<%=Session("dbExitPage")%>"><%=Session("dbBackText")%></A>
		<% Else %>
			<A HREF="<%=Session("dbExitPage")%>"><%=txtBackToList%></A>
		<% End If %>
<% else %>
		<A HREF="<%=Session("dbViewPage")%>"><%=txtBackToList%></A>
<% end if %>
	</TD>
</TR>
<TR><TD ALIGN="RIGHT" BGCOLOR=#FFFFFF><FONT SIZE=5 FACE="<%=strFont%>"><STRONG><EM><%=Session("dbTitle")%> - <%if NOT IsSearch then Response.Write txtEditMode else Response.Write txtAdvancedSearch end if %></EM></STRONG></FONT> </TD></TR>
</TABLE></TD></TR></TABLE>

<!--webbot bot="HTMLMarkup" startspan -->
<FORM ACTION="<%=FormAction%>" METHOD=POST>
<INPUT TYPE="HIDDEN" NAME="SearchAction" VALUE="FULL">
<INPUT TYPE="SUBMIT" NAME="Action" VALUE="<%=SUBMITVALUE%>">
<P>
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=strMenuColor%>><TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH="100%" BGCOLOR=<%=strMenuColor%>>
<% 
For x = 1 to intFieldCount 
	If Mid(strDisplay, x, 1) = "0" OR (strKeyField = x) OR Mid(strDisplay, x, 1) = "2" Then
		If Mid(strDisplay, x, 1) = "2" Then %>
			<TR BGCOLOR="#FFFFCC" ALIGN="LEFT">
				<td><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>"><%=arrFieldNames(x-1)%></td>
				<td><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>"><%=aFields(x,4)%></td>
			</tr><INPUT TYPE="HIDDEN" NAME="<%=aFields(x,1)%>" VALUE="<%=aFields(x,4)%>">
<%		Else
			Response.Write "<INPUT TYPE=""HIDDEN"" NAME=" & QUOTE & aFields(x,1) & QUOTE & " VALUE=" & QUOTE & aFields(x,4) & QUOTE & ">"
		End If
	Else %>
	<TR BGCOLOR="#FFFFCC" ALIGN="LEFT">
		<TD><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<% Response.Write arrFieldNames(x-1)
				' Display a red * if the field is required
				If NOT (Session("dbRequiredFields") = "" OR Action = "SEARCH") Then
					If Mid(Session("dbRequiredFields"), x, 1) = "1" Then Response.Write "<font color=red>*</red>"
				End If %>
		</TD>
<% 		If aFields(x,1) = "Password" Then %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Password" NAME="<%=aFields(x,1)%>" VALUE="<%=aFields(x,4)%>" SIZE=40 MAXLENGTH="<%=aFields(x,3)%>"></TD>
<%		Else 
' <!-- Start -->
			strCombo = "dbCombo" & CStr(x)
			If Not(Trim(Session(strCombo)) & "x") = "x" Then
				arrCombo = Split(Session(strCombo),",") %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<SELECT NAME="<%=aFields(x,1)%>" SIZE="1">
<%				' List
				if Trim(Ucase(arrCombo(0))) = "LIST" then
					if IsSearch then %>
				<option value=" ">&nbsp; <%
					end if
					for y = 1 to UBound(arrCombo) Step 2
						arrCombo(y) = LTrim(arrCombo(y))
						arrCombo(y+1) = LTrim(arrCombo(y+1))
						select case aFields(x,2) 
							case 2, 3 
								If NOT IsNumeric(aFields(x,4)) then %>
				<option value="<%=arrCombo(y)%>"> <%=arrCombo(y+1)%> <%
								else %>
				<option value="<%=arrCombo(y)%>" <%if (aFields(x,4) & "x" <> "x") then if (CInt(arrCombo(y))=CInt(aFields(x,4))) then Response.Write" SELECTED" %>> <%=arrCombo(y+1)%> <%
								end if %>
<%							case 129, 130, 200, 201, 202, 203 %>
				<option value="<%=arrCombo(y)%>" <%if (aFields(x,4) & "x" <> "x") then if (CStr(arrCombo(y))=Cstr(aFields(x,4))) then Response.Write" SELECTED" %>> <%=arrCombo(y+1)%>
<%						end select
					next
				end if
				' TABLE 
				If (Trim(UCase(arrCombo(0))) = "TABLE") OR (Trim(UCase(arrCombo(0))) = "TBL") Then
					strComboTable = Trim(arrCombo(1))
					strComboValueFldNo = CInt(arrCombo(2))-1
					strComboDescFldNo = CInt(arrCombo(3))-1
					If UBound(arrCombo) >= 5 Then
						strComboValueDefault = Trim(arrCombo(4))
						strComboDescDefault = Trim(arrCombo(5))
					Else
						strComboValueDefault = ""
						strComboDescDefault = ""
					End if
					strsql = "SELECT * FROM [" & strComboTable & "]"
					If (UBound(arrCombo) >= 6) Then
						If NOT (Trim(arrCombo(6)) = "") Then
							' If a WHERE clause was included for the combo
							strsql = strsql & " WHERE " & Trim(arrCombo(6))
						End If
					End If
					If strType = "SQL" Then
						strsql = Replace(strsql,"[","")
						strsql = Replace(strsql,"]","")
					End If
					set tlkpRs = Server.CreateObject("ADODB.Recordset")
					tlkpRs.Open strsql, xConn, 2, 3 
					if IsSearch then %>
				<OPTION VALUE=" ">&nbsp;
<%					end if
					if LTrim(strComboValueDefault & strComboDescDefault & "x") <> "x" then %>
				<OPTION VALUE="<%=strComboValueDefault%>"><%=strComboDescDefault%>
<%					end if	
					while NOT tlkpRs.EOF %>
				<OPTION VALUE="<%=tlkpRs.Fields(strComboValueFldNo)%>" <% If tlkpRs.Fields(strComboValueFldNo)=aFields(x,4) Then Response.Write" SELECTED" %>> <%=tlkpRs.Fields(strComboDescFldNo)%>
<%							tlkpRs.MoveNext
					wend
					tlkpRs.Close
					Set tlkpRs = Nothing
				End If
				Response.Write "</SELECT></td>"
			Else
				Select Case aFields(x,2) 
					Case 2 ' 2-Byte Integer %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Text" NAME="<%= aFields(x,1) %>" VALUE="<%= aFields(x,4) %>" SIZE=10 MAXLENGTH=4></TD>
<% 					Case 3 ' 4-Byte Integer %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Text" NAME="<%= aFields(x,1) %>" VALUE="<%= aFields(x,4) %>" SIZE=10 MAXLENGTH=8></TD>
<% 					Case 4, 5, 131 ' Floating point %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Text" NAME="<%= aFields(x,1) %>" VALUE="<%= aFields(x,4) %>" SIZE=10 MAXLENGTH=8></TD>
<% 					Case 6 ' Currency %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">$
			<INPUT TYPE="Text" NAME="<%= aFields(x,1) %>" VALUE="<%= aFields(x,4) %>" SIZE=10 MAXLENGTH=8></TD>
<% 					Case 7, 135 ' Date / Time Stamp %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Text" NAME="<%= aFields(x,1) %>" VALUE="<%= aFields(x,4) %>" SIZE=40 MAXLENGTH=40></TD>
<% 					Case 11 	' Boolean True/False %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Radio" NAME="<%=aFields(x,1)%>" <% If aFields(x,4) = "Yes" Then %>CHECKED<% End If %> VALUE="Yes"><%=txtTrue%>
			<INPUT TYPE="Radio" NAME="<%=aFields(x,1)%>" <% If aFields(x,4) = "No" Then %>CHECKED<% End If %> VALUE="No"><%=txtFalse%>
					</TD>
<% 					case 17 ' 1-Byte Integer %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Text" NAME="<%= aFields(x,1) %>" VALUE="<%= aFields(x,4) %>" SIZE=10 MAXLENGTH=1></TD>
<% 					Case 129, 130, 200, 202 ' String %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<INPUT TYPE="Text" NAME="<%=aFields(x,1)%>" VALUE="<%=aFields(x,4)%>" SIZE=40 MAXLENGTH="<%=aFields(x,3)%>"> </TD>
<% 					Case 201, 203 ' Memo %>
		<TD BGCOLOR="White" ALIGN="LEFT"><FONT SIZE="<%=intFontSize%>" FACE="<%=strFont%>">
			<TEXTAREA NAME="<%=aFields(x,1)%>" COLS="50" ROWS="5" WRAP="VIRTUAL"><%=aFields(x,4)%></TEXTAREA></TD>
<% 				End Select 
			End If
 		End If
		If IsSearch= "True" Then  %>
		<td BGCOLOR="white" valign="center">
			<select name="<%=aFields(x,1)&x%>" size="1">
            <option value="AND NOT">AND NOT</option>
            <option selected value="AND">AND</option>
            <option value="OR">OR</option>
			</select></td>
<%		End If %>
	</TR>
<% 	End If
Next
xConn.Close
Set xConn = Nothing
%>
</TABLE></TD></TR></TABLE>
<P>
<INPUT TYPE="SUBMIT" NAME="Action" VALUE="<%=SUBMITVALUE%>">
</FORM>
<!--webbot bot="HTMLMarkup" endspan -->
<!-- Footer -->
<% If Session("dbFooter") = 1 Then %>
<!--#include file="GenericFooter.asp"-->
<% End If %>
</BODY>
</HTML>
