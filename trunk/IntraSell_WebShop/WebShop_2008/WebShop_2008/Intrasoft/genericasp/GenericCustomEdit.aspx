<!--#include file="GenericLanguage.aspx" -->
<% 
' Generic Database - Edit Record using Custom Template
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/GenericArticle.asp
' Template File Syntax
' <BACK></BACK> - Create a Back link. 
' <FIELD NAME="fldWhatever"> - Place the named field (i.e. fldWhatever)
' <SUBMIT> - Place the Submit button. 
' Only one of these tags (or the BACK tag pair) may appear on any given line.
' HTML, HEAD, TITLE, and BODY tags are not required in the template file. If they appear, all
' but the <BODY> tag will be ignored. That way you can still set a background, trigger a java
' routine, whatever. Yes, client-side Javascript works in the template file for anything from 
' form validation to timers. You can't use ASP though, nothing parsed in the template is passed
' back through ASP filter, it is all written with Response.Write's straight to the browser. 

' Revision History:
' 29 Feb 2000 - Preparation for release
'				Fix to caching
'				Unicode field types added
' 12 Oct 1999 - dbOnlyAdd = 1: Redirects to ExitPage after insertion
'				dbOnlyEdit = 1: As above, also changes Back button to Exit
' 21 Jul 1999 - Fixed problem of having NAME in the field name
' 15 Jul 1999 - Changed Replace parameters to case-insensitive (Str,Find,Repl,1,-1,1) 
' 14 Jul 1999 - Added Response.Clear before Redirect for boneheaded MSIE browsers
'				Also repaired boneheaded security hole.
'  6 Jul 1999 - " " kludge for Null strings removed thanks to Nicholas Neuberger
'  3 Jul 1999 - Unicode string vals
' 30 Jun 1999 - Language support
'				Can now safely store/retrieve double-quotes (")
'				Testing yet another FrontPage fix, this one by Scott Ostrum
'				Changed [SELECT *] to [SELECT" & strFields & "] in GET and UPD 
'				dbUpdateFieldX allows auto-updating a field to a predetermined value
' 15 Apr 1998 - First created or released

' Prevent caching
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "cache-control", "must-revalidate"
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"

' Check for an active session
If Session("dbConn") = "" Then 
	Response.Clear
	Response.Redirect "GenericError.aspx"
End If

' Get info from Session vars (kinda like parameters)
strType = Trim(UCase(Session("dbType")))
strConn = Session("dbConn")
strTable = Session("dbRs")
strFields = Session("dbFields")
strDisplay = Session("dbDispEdit")
strKeyField = Session("dbKey")
IsSubTable = Session("dbIsSubTable")

QUOTE = chr(34)
SubmitValue = "Update"
Action = "GET"

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
	' Quick security check for Add rights
	If Not(Session("dbCanAdd") = 1) Then 
		Response.Clear
		Response.Redirect Session("dbViewPage")
	End If

	strCMD = Request.QueryString("CMD")
	If strCMD = "NEW" Then Action = "NEW"
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
	Case "ADD" ' Insert the new record into the database
		' Data validation 
		For x = 1 to intFieldCount
			Select Case aFields(x, 2) 
				Case 2, 3, 4, 5, 6, 17' 2 Byte Integer, 4 Byte Integer, Currency
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
				Case 129, 130, 200, 201, 202, 204 ' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
				' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
					tFLD = Trim(aFields(x,4))
					' Replace tag chars to secure against malicious html
					tFLD = Replace(tFLD, "<", "&lt;")
					tFLD = Replace(tFLD, ">", "&gt;")
					If tFLD & "x" = "x" Then tFLD = Null
					aFields(x,4) = tFLD
				Case 7, 135	' Date / Time 
					If (aFields(x,4) & "x" = "x") OR NOT IsDate(aFields(x,4)) Then
						aFields(x,4) = Null
					Else
						aFields(x,4) = CDate(aFields(x,4))
					End If
			End Select
		Next
		Set xrs =  Server.CreateObject("ADODB.Recordset")

		' 2 for Open Dynamic, 3 for Optimistic Locking, 2 for Table
		xrs.Open strTable, xConn, 2, 3, 2
		xrs.AddNew
		For x = 1 to intFieldCount
			If x <> strKeyField Then xrs.Fields(x-1) = aFields(x,4)	
		Next 

		xrs.Update
		xrs.Close
		Set xrs = Nothing
		xConn.Close
		Set xConn = Nothing
		Response.Clear

		if Session("dbOnlyAdd") = 1 Then Response.Redirect Session("dbExitPage")
		Response.Redirect Session("dbViewPage")
				
	Case "NEW": ' Load a blank form

		SUBMITVALUE = "Add"
		' Initialize Fields
		For x = 1 to intFieldCount
			If strKeyField = aFields(x,1) Then
				' Don't try to change the counter
			Else
				' Check if a default has been specified
				strDefault = "dbDefault" & x
				If Session(strDefault) & "x" = "x" Then
					Select Case aFields(x, 2) 
						Case 2, 3, 4, 5, 6, 131	' Numeric types
							aFields(x,4) = 0
						Case 11 	' Boolean True/False
							aFields(x,4) = "No"
						Case 129, 200, 201, 202, 203	' String types
							aFields(x,4) = ""
						Case 135	' Date / Time Stamp
							aFields(x,4) = ""
					End Select
				Else
					aFields(x,4) = Session(strDefault)
				End If
				If IsSubTable Then
					arrSubTable = Split(Session("dbSubTableCopy"),",")
					If Trim(aFields(x,1)) = Trim(arrSubTable(2)) Then aFields(x,4) = Session("dbcurKey")
				End If
			End If
		Next 

	Case "GET": ' Get a record to display
		strsql = "SELECT " & strFields & " FROM [" & strTable & "] WHERE [" & aFields(strKeyField,1) & "]=" & strKey
		If strType = "SQL" Then
			' SQL databases do not allow spaces or brackets in table or field names
			strsql = Replace(strsql,"[","")
			strsql = Replace(strsql,"]","")
		End If
		set xrs = Server.CreateObject("ADODB.Recordset")
		xrs.Open strsql, xConn
		xrs.MoveFirst
		If xrs.EOF Then
			Response.Clear
			Response.Redirect Session("dbViewPage")
		End If
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

	Case "UPD": ' Update
		' Open record
		strsql = "SELECT " & strFields & " FROM [" & strTable & "] WHERE [" & aFields(strKeyField,1) & "]=" & Session("dbcurKey")
		If strType = "SQL" Then
			strsql = Replace(strsql,"[","")
			strsql = Replace(strsql,"]","")
		End If
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
						Case 2, 17 ' 2 Byte Integer
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CInt(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 3 ' 4 Byte Integer
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CLng(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 4 ' Single-Precision Floating Point
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CSng(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 5, 6, 131 ' Double-Precision Floating Point, Currency, adNumeric
							tFLD = aFields(x,4)
							If IsNumeric(tFLD) Then 
								xrs(x-1) = CDbl(tFLD)
							Else
								xrs(x-1) = 0
							End If
						Case 11 ' Boolean True/False
							tFLD = aFields(x,4)
							If tFLD = "Yes" Then
								xrs(x-1) = True
							Else
								xrs(x-1) = False
							End If
						Case 129, 130, 200, 201, 202, 203 ' String types
							aFields(x,4) = Replace(aFields(x,4),chr(34),"&quot;")
							tFLD = Trim(aFields(x,4))
							If tFLD & "x" = "x" Then tFLD = Null
							xrs(x-1) = tFLD
						Case 7, 135 ' Date / Time 
							If IsDate(aFields(x,4)) Then
								xrs(x-1) = CDate(aFields(x,4))
							Else
								xrs(x-1) = Null
							End If
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
<html>
<head>
    <title>
        <%=Session("dbTitle")%>
        -
        <%=txtEditMode%></title>
</head>
<body>
    <!--webbot bot="HTMLMarkup" startspan -->
    <form action="GenericCustomEdit.aspx" method="POST">
    <%
Dim SkipToNext
Dim pathroot, strFileName, strLine, strLineU, strLeft, strRight, strFieldName
Dim position, x, i 
Dim ts

' Use the path of the config file to form the path to the template file
' pathroot = Session("dbViewPage")
pathroot = Session("dbViewPath")
For i = len(pathroot) to 1 Step -1
	If mid(pathroot,i,1) = "\" then ' cut the filename, leave the path
		pathroot = mid(pathroot,1,i)
		Exit For
	End If
Next

' Open the Edit Template File
strFileName = pathroot & Session("dbEditTemplate")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set ts = objFSO.OpenTextFile(strFileName,1,False,0)

' Parse the Edit Template File
While Not ts.AtEndOfStream
	strLine = ts.ReadLine
	strLineU = UCase(strLine)
	strLeft = ""
	strRight = ""
	strFieldName = ""
	SkipToNext = False
	' Strip out tags already written
	strLine = Replace(strLine, "<HTML>","",1,-1,1)
	strLine = Replace(strLine, "<FORM>", "",1,-1,1)
	strLine = Replace(strLine, "</FORM>", "",1,-1,1)
	strLine = Replace(strLine, "</BODY>","",1,-1,1)
	strLine = Replace(strLine, "</HTML>","",1,-1,1)
	If Instr(1, strLineU, "<HEAD>") > 0 Then	' strip the header section
		While Instr(1, strLineU, "</HEAD>") = 0
			strLine = ts.ReadLine
			strLineU = UCase(strLine)
		Wend
		SkipToNext = True					
	End If
	If Not SkipToNext Then
		if (Session("dbOnlyAdd")=1) OR (Session("dbOnlyEdit")=1) then 
			strLine = Replace(strLine, "<BACK>", "<A HREF=" & QUOTE & Session("dbExitPage") & QUOTE & ">",1,-1,1)
			strLine = Replace(strLine, "</BACK>", "</A>",1,-1,1)
 		else 
			strLine = Replace(strLine, "<BACK>", "<A HREF=" & QUOTE & Session("dbViewPage") & QUOTE & ">",1,-1,1)
			strLine = Replace(strLine, "</BACK>", "</A>",1,-1,1)
		end if 
		strLine = Replace(strLine, "<BACK>", "<A HREF=" & QUOTE & Session("dbViewPage") & QUOTE & ">",1,-1,1)
		strLine = Replace(strLine, "</BACK>", "</A>",1,-1,1)
		strLine = Replace(strLine, "<SUBMIT>", "<FONT SIZE=3><INPUT TYPE=" & QUOTE & "SUBMIT" & QUOTE & " NAME=" & QUOTE & "Action" & QUOTE & " VALUE=" & QUOTE & SUBMITVALUE & QUOTE & "></FONT>",1,-1,1)
		position = Instr(1, strLineU, "<FIELD")
		If position > 0 Then ' the line contains a Field
			If position > 1 Then ' first display everything to the left of the field
				strLeft = Left(strLine, position - 1)
				strLine = Mid(strLine, position)
				strLineU = UCase(strLine)
				Response.Write strLeft
			End If
			' Find the end of the tag
			position = Instr(1, strLine, ">")
			If position = 0 Then ' the tag isn't properly terminated
				Response.Write "Error: " & strLine & "<BR>"
			Else ' display the field
				If position < Len(RTrim(strLine)) Then ' get everything to the right
					strRight = Mid(strLine, position + 1)
					strLine = Left(strLine, position)
				End If
				' Strip everything except the values now -- NAME, etc.
				strLine = Replace(strLine,"<FIELD","",1,-1,1)
				strLine = Replace(strLine,">","")
				strLine = Replace(strLine, chr(34), "")	' quotes
				strLine = LTrim(strLine)
				While Len(strLine) > 0	' parse the values 
					if UCase(Left(strLine,4)) = "NAME" Then
						strLine = Mid(strLine,5)
						strLine = Replace(strLine,"=","")
						strLine = LTrim(strLine)
						strLineU = UCase("strLine")
						position = Instr(1, strLine, " ")
						if position = 0 Then 
							strFieldName = UCase(RTrim(strLine))
							strLine = ""
						else
							strFieldName = UCase(Left(strLine, position - 1))
							strLine = Mid(strLine, position + 1)
						end if
					else ' there's only NAME to check, if it's not there then something's wrong
						Response.Write "Error: |" & strLine & "|<BR>"
						strLine = ""
					end if
				Wend
				' Go find the ordinal position of the field in the table structure
				x = 0
				y = 0
				While y <= UBound(aFields)
					If UCase(aFields(y, 1)) = strFieldName Then x = y
					y = y + 1
				Wend
				if x = 0 Then
					Response.Write "Error: " & strFieldName & " is not a field in this table."
				Else
	' Display the field
	If Mid(strDisplay, x, 1) = "0" OR (strKeyField = x) OR Mid(strDisplay, x, 1) = "2" Then
		If Mid(strDisplay, x, 1) = "2" Then
			Response.Write aFields(x,4)
			Response.Write "<INPUT TYPE=""HIDDEN"" NAME=" & QUOTE & aFields(x,1) & QUOTE & " VALUE=" & QUOTE & aFields(x,4) & QUOTE & ">"
		Else
			Response.Write "<INPUT TYPE=""HIDDEN"" NAME=" & QUOTE & aFields(x,1) & QUOTE & " VALUE=" & QUOTE & aFields(x,4) & QUOTE & ">"
		End If
	Else 
 		If aFields(x,1) = "Password" Then %>
    <input type="Password" name="<%=aFields(x,1)%>" value="<%=aFields(x,4)%>" size="40"
        maxlength="<%=aFields(x,3)%>">
    <%		Else 
			Select Case aFields(x,2) 
				Case 2 ' 2-Byte Integer
    %>
    <input type="Text" name="<%= aFields(x,1) %>" value="<%= aFields(x,4) %>" size="10"
        maxlength="4">
    <% 				Case 3 ' 4-Byte Integer 
    %>
    <input type="Text" name="<%= aFields(x,1) %>" value="<%= aFields(x,4) %>" size="10"
        maxlength="8">
    <% 				Case 4, 5, 131 ' Floating point
    %>
    <input type="Text" name="<%= aFields(x,1) %>" value="<%= aFields(x,4) %>" size="10"
        maxlength="8">
    <% 				Case 6 ' Currency
    %>
    <input type="Text" name="<%= aFields(x,1) %>" value="<%= aFields(x,4) %>" size="10"
        maxlength="8">
    <% 				Case 7, 135 ' Date / Time Stamp, usually created with the Now() function
<% 				Case 11 	' Boolean True/False %>
    <input type="Radio" name="<%=aFields(x,1)%>" <% If aFields(x,4) = "Yes" Then %>CHECKED<% End If %>
        value="Yes"><%=txtTrue%>
    <input type="Radio" name="<%=aFields(x,1)%>" <% If aFields(x,4) = "No" Then %>CHECKED<% End If %>
        value="No"><%=txtFalse%>
    <% 				Case 17 ' 1-Byte Integer %>
    <input type="Text" name="<%= aFields(x,1) %>" value="<%= aFields(x,4) %>" size="10"
        maxlength="1">
    <% 				Case 129, 130, 200, 202 ' String
    %>
    <% 						strCombo = "dbCombo" & CStr(x)
						If Trim(Session(strCombo)) & "x" = "x" Then
    %>
    <input type="Text" name="<%=aFields(x,1)%>" value="<%=aFields(x,4)%>" size="40" maxlength="<%=aFields(x,3)%>">
    <%						Else
							arrCombo = Split(Session(strCombo),",") %>
    <select name="<%=aFields(x,1)%>" size="1">
        <%							' LIST
							If Trim(UCase(arrCombo(0))) = "LIST" Then
								For y = 1 to UBound(arrCombo) Step 2
									arrCombo(y) = LTrim(arrCombo(y))
									arrCombo(y+1) = LTrim(arrCombo(y+1)) %>
        <option value="<%= arrCombo(y) %>" <% If arrCombo(y)=aFields(x,4) Then Response.Write" SELECTED" %>>
            <%=arrCombo(y+1)%>
            <%								Next
							End If
							' TABLE 
							If (Trim(UCase(arrCombo(0))) = "TABLE") OR (Trim(UCase(arrCombo(0))) = "TBL") Then
								strComboTable = Trim(arrCombo(1))
								strComboValueFldNo = CInt(arrCombo(2))-1
								strComboDescFldNo = CInt(arrCombo(3))-1
								strComboValueDefault = Trim(arrCombo(4))
								strComboDescDefault = Trim(arrCombo(5))
								strsql = "SELECT * FROM [" & strComboTable & "]"
								' Check for a a WHERE clause 
								If (UBound(arrCombo) >= 6) Then
									If NOT (Trim(arrCombo(6)) = "") Then
										strsql = strsql & " WHERE " & Trim(arrCombo(6))
									End If
								End If
								If strType = "SQL" Then
									strsql = Replace(strsql,"[","")
									strsql = Replace(strsql,"]","")
								End If
								set tlkpRs = Server.CreateObject("ADODB.Recordset")
								tlkpRs.Open strsql, xConn, 2, 3 %>
            <option value="<%=strComboValueDefault%>">
                <%=strComboDescDefault%>
                <%								Do While NOT tlkpRs.EOF %>
                <option value="<%=tlkpRs.Fields(strComboValueFldNo)%>" <% If tlkpRs.Fields(strComboValueFldNo)=aFields(x,4) Then Response.Write" SELECTED" %>>
                    <%=tlkpRs.Fields(strComboDescFldNo)%>
                    <%									tlkpRs.MoveNext
								Loop

								tlkpRs.Close
								Set tlkpRs = Nothing
							End If
							Response.Write "</SELECT>"
						End If
 				Case 201, 203 ' Memo %>
                    <textarea name="<%=aFields(x,1)%>" cols="50" rows="5" wrap="VIRTUAL"><%=aFields(x,4)%></textarea>
                    <% 			End Select 
 		End If
	End If
				' Display everything to the right of the field
				Response.Write strRight & chr(13)
				End If					
			End If
		Else ' line does not contain a field
			Response.Write strLine & chr(13)
		End If
	End If
Wend

xConn.Close
Set xConn = Nothing
                    %>
                    <p>
                        <font size="3">
                            <input type="SUBMIT" name="Action" value="<%=SUBMITVALUE%>"></font>
    </form>
    <!--webbot bot="HTMLMarkup" endspan -->
    <!-- Footer -->
    <% If Session("dbFooter") = 1 Then %>
    <!--#include file="GenericFooter.aspx"-->
    <% End If %>
</body>
</html>
