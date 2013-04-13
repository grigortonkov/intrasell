<!--#include file="GenericLanguage.aspx" -->
<% 
' Generic Database - View Record using Custom Template
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Template File Syntax
' <BACK></BACK> - Create a Back link. 
' <EDIT></EDIT> - Create an Edit link. 
' <FIELD NAME="fldWhatever"> - Place the named field (i.e. fldWhatever)
' Only one of these tags (or a BACK or EDIT tag pair) may appear on any given line.
' HTML, HEAD, TITLE, and BODY tags are not required in the template file. If they appear, all
' but the <BODY> tag will be ignored. That way you can still set a background, trigger a java
' routine, whatever. Yes, client-side Javascript works in the template file for anything from 
' form validation to timers. You can't use ASP though, nothing parsed in the template is passed
' back through ASP filter, it is all written with Response.Write's straight to the browser. 

' Revision History:
' 29 Feb 2000 - Preparation for release
'				Fix to caching
'				Unicode field types added
' 21 Jul 1999 - Fixed problem of having NAME in the field name
' 15 Jul 1999 - Changed Replace parameters to case-insensitive (Str,Find,Repl,1,-1,1) 
' 14 Jul 1999 - Added Response.Clear before Redirect for boneheaded MSIE browsers
' 30 Jun 1999 - Language support
' 23 Jun 1999 - Option to strip #'s from hyperlink fields, search for *** and uncomment the code
'  4 May 1999 - First created or released

' Prevent caching
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "cache-control", "must-revalidate"
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"

 
QUOTE = chr(34)
LT = chr(60)
GT = chr(62)

' Quick security check
If Session("dbDispView") = "" Then
	Response.Clear
	Response.Redirect Session("dbViewPage")
End If

' Get info from Session vars 
strType = UCase(Session("dbType"))
strConn = Session("dbConn")
strTable = Session("dbRs")

' Is there a sub-table to display
If Not (Session("dbSubTable") = "") Then
	arrSubTable = Split(Session("dbSubTable"),",")
	IsSubTable = True
End If

' Check which editor to use for Add and Edit links
If Session("dbEditTemplate") & "x" = "x" Then
	strEditor = "GenericEdit.aspx"
Else 
	strEditor = "GenericCustomEdit.aspx"
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
%>
<html>
<head>
    <title>
        <%=Session("dbTitle")%>
        -
        <%=txtList%></title>
</head>
<body>
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

' Open the View Template File
strFileName = pathroot & Session("dbViewTemplate")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set ts = objFSO.OpenTextFile(strFileName,1,False,0)

' Parse the View Template File
While Not ts.AtEndOfStream
	strLine = ts.ReadLine
	strLineU = UCase(strLine)
	strLeft = ""
	strRight = ""
	strFieldName = ""
	SkipToNext = False
	' Strip out tags already written
	strLine = Replace(strLine, "<HTML>","")
	strLine = Replace(strLine, "<FORM>", "")
	strLine = Replace(strLine, "</FORM>", "")
	strLine = Replace(strLine, "</BODY>","")
	strLine = Replace(strLine, "</HTML>","")
	If Instr(1, strLineU, "<HEAD>") > 0 Then	' strip the header section
		While Instr(1, strLineU, "</HEAD>") = 0
			strLine = ts.ReadLine
			strLineU = UCase(strLine)
		Wend
		SkipToNext = True					
	End If
	If Not SkipToNext Then
		strLine = Replace(strLine, "<BACK>", "<A HREF=" & QUOTE & Session("dbViewPage") & QUOTE & ">", 1, -1, 1)
		strLine = Replace(strLine, "</BACK>", "</A>", 1, -1, 1)
		strLine = Replace(strLine, "<EDIT>", "<A HREF=" & QUOTE & Session("dbGenericPath") & strEditor & "?KEY=" & aFields(Session("dbKey"),4) & QUOTE & ">", 1, -1, 1)
		strLine = Replace(strLine, "</EDIT>", "</A>", 1, -1, 1)
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
				Response.Write "Error: " & strLine & "<br />"
			Else ' display the field
				If position < Len(RTrim(strLine)) Then ' get everything to the right
					strRight = Mid(strLine, position + 1)
					strLine = Left(strLine, position)
				End If
				' Strip everything except the values now -- NAME, etc.
				strLine = Replace(strLine,"<FIELD","", 1, -1, 1)
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
						Response.Write "Error: |" & strLine & "|<br />"
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
					Response.Write "Error: " & strFieldName & " is not a field in this table. "
				Else
					If Mid(strDisplay, x, 1) = "0" OR (strKeyField = x) Then
						' Do not display the field					
					Else
						' See if the field is an alias for another description (from dbCombo)
 						strCombo = "dbCombo" & CStr(x)
						If Trim(Session(strCombo)) & "x" = "x" Then
							' Get the value
							curVal = aFields(x,4)
							' Blank or null
							If IsNull(curVal) Then curVal = "&nbsp;"
							If Trim(curVal) & "x" = "x" Then curVal = "&nbsp;"
							' Password
							If UCase(Left(aFields(x,1),8)) = "PASSWORD" Then curVal = "*****"
							' Format the various field types
							Select Case aFields(x,2)
								case 6 ' Currency
									if NOT(curVal = "&nbsp;") then curval = FormatCurrency(curval,2,-1)
								case 7, 135 ' Date / Time
									if NOT(curVal = "&nbsp;") then curVal = FormatDateTime(curVal)
								case 11 ' Boolean
									If curVal Then
										curVal = txtTrue
									Else
										curVal = txtFalse
									End If
								case 129, 130, 200, 201, 202, 203 ' String and memo
									if NOT(curVal = "&nbsp;") then 
										curVal = replace(curVal,"<","&lt;")
										curVal = replace(curVal,">","&gt;")
										curVal = replace(curVal,chr(10),"&nbsp;<br />")
									end if
								End Select
							' Image
							If (UCase(Left(aFields(x,1),3)) = "IMG") Then curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & GT 
							' Check for E-mail address
							strContainsURL = "dbEMailfor" & CStr(x)
							If Session(strContainsURL) > 0 Then
								strURL = aFields(Session(strContainsURL),4)
								curVal = Replace(curVal,"mailto:","")
								If Trim(strURL) & "x" <> "x" Then curVal = "<A HREF=" & QUOTE & "MAILTO:" & strURL & QUOTE & ">" & curVal & "</A>"
							End If
							' Check for link
							strContainsURL = "dbURLfor" & CStr(x)
							If Session(strContainsURL) > 0 Then
								strURL = aFields(Session(strContainsURL),4)
								If Trim(strURL) & "x" <> "x" Then
									curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
' *** Uncomment the following line to strip all #'s from Access hyperlink fields
'									curVal = Replace(curVal,"#","")
								End If
							Else
								If UCase(Left(curVal,7)) = "HTTP://" Then
									curVal = LT & "A HREF=" & QUOTE & curVal & QUOTE & GT & curVal & LT & "/A" & GT
' *** Uncomment the following line to strip all #'s from Access hyperlink fields
'									curVal = Replace(curVal,"#","")
								End If
							End If
							' Display it already
							Response.Write curVal 
						Else
							' Look up the value to display
							arrCombo = Split(Session(strCombo),",")
							' LIST
							If Trim(UCase(arrCombo(0))) = "LIST" Then
								For y = 1 to UBound(arrCombo) Step 2
									arrCombo(y) = LTrim(arrCombo(y))
									arrCombo(y+1) = LTrim(arrCombo(y+1))
									If arrCombo(y)=aFields(x,4) Then Response.Write arrCombo(y+1)
								Next
							End If
							' TABLE 
							If (Trim(UCase(arrCombo(0))) = "TABLE") OR (Trim(UCase(arrCombo(0))) = "TBL") Then
								strComboTable = Trim(arrCombo(1))
								strComboValueFldNo = CInt(arrCombo(2))-1
								strComboDescFldNo = CInt(arrCombo(3))-1
								strsql = "SELECT * FROM [" & strComboTable & "]"
								If strType = "SQL" Then
									strsql = Replace(strsql,"[","")
									strsql = Replace(strsql,"]","")
								End If

								set xConn = Server.CreateObject("ADODB.Connection")
								xConn.Open strConn
								set tlkpRs = Server.CreateObject("ADODB.Recordset")
								tlkpRs.Open strsql, xConn, 2, 3 
								Do While NOT tlkpRs.EOF
									If tlkpRs.Fields(strComboValueFldNo)=aFields(x,4) Then Response.Write tlkpRs.Fields(strComboDescFldNo)
									tlkpRs.MoveNext
								Loop
								tlkpRs.Close
								Set tlkpRs = Nothing
								xConn.Close
								set xConn = Nothing
							End If
						End If ' is the value an alias from a lookup table or list
			 		End If ' should the field be displayed
				End If ' is the field in the table
				' Display everything to the right of the field
				Response.Write strRight & chr(13)
			End If ' is the field tag properly terminated
		Else ' line does not contain a field
			Response.Write strLine & chr(13)
		End If ' does the line contain a field tag
	End If
Wend
    %>
    <p>
        <!-- Footer -->
        <% If Session("dbFooter") = 1 Then %>
        <!--#include file="GenericFooter.aspx"-->
        <% End If %>
</body>
</html>
