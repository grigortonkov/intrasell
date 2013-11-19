<%
' Generic Database - Search, Build WHERE clause
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
' 29 Feb 2000 - Preparation for release
' 30 Nov 1998 - File created

' Prevent caching
Response.Buffer = True
Response.ExpiresAbsolute = Now() - 1
Response.AddHeader "cache-control", "must-revalidate"
Response.AddHeader "cache-control", "private"
Response.AddHeader "pragma", "no-cache"

' Get parameters
strType = Ucase(Session("dbType"))
strConn = Session("dbConn")
strTable = Session("dbRs")
strFields = Session("dbFields")
strGroupBy = Session("dbGroupBy")
SearchFields = Session("dbSearchFields")
pSearch = Request("strSearch")
SearchAction = Request("SearchAction")
strPhrase = Request("SearchPhrase")
numTerms = 1
QUOTE = "'"

' Remove unpleasant search terms
pSearch = Replace(pSearch,"'","")
pSearch = Replace(pSearch," and ", " ")
pSearch = Replace(pSearch," or ", " ")

' Open Connection to the database
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn

' Open Recordset and get the field info
strsql = "select " & strFields & " FROM [" & strTable & "]"
select case strType
	case "UDF" 
		strsql = "select " & strFields & " FROM " & strTable
	case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
end select

if Not Trim(strGroupBy) = "" then
	strsql = strsql & " GROUP BY " & strGroupBy
	intAllowSort = 0
end if	

set xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open strsql, xConn
intFieldCount = xrs.Fields.Count
strWhere = ""

Dim aFields()
ReDim aFields(intFieldCount,4)
if Trim(Session("dbFieldNames")) & "x" = "x" then
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
end if

select case SearchAction
	case "FULL"
		For x = 1 to intFieldCount
			aFields(x,4) = Request(aFields(x,1))
			State = Request(aFields(x,1)&x)
			'Don't allow a 2 character search
			if Len(Trim(aFields(x,4))) > 1 then ' Add to WHERE clause
				select case aFields(x, 2)
					case 2, 3, 4, 5, 6, 131 ' Integers
						strWhere = strWhere & " ([" & aFields(x,1) & "]=" & aFields(x,4) & ") " & State
					case 11   ' Boolean True/False
						if NOT(Trim(aFields(x,4))="DontCare") then strWhere = strWhere & " ([" & aFields(x,1) & "]=" & aFields(x,4) & ") " & State
					case 129, 130, 200, 202 ' Strings
						strWhere = strWhere & " ([" & aFields(x,1) & "]='" & aFields(x,4) & "') " & State 
					case 201, 203 'Using LIKE for memo fields
						strWhere = strWhere & " ([" & aFields(x,1) & "] LIKE " & QUOTE & "%" & aFields(x,4) & "%" & QUOTE & ") " & State
'					case 135, 11	' Dates: Currently Unused
'						strWhere = strWhere & " ([" & aFields(x,1) & "] between cDate('" & aFields(x,4) &  "') AND (cDate('" & aFields(x,4) & "')+1))" & State
				end select
			end if
		Next
		' Strip extra condition term
 		if Right(strWhere,2) = "OR" then strWhere = Left(strWhere, Len(strWhere)-2)
		if Right(strWhere,3) = "AND" then strWhere = Left(strWhere, Len(strWhere)-3)
		if Right(strWhere,7) = "AND NOT" then strWhere = Left(strWhere, Len(strWhere)-7)

		if strType = "SQL" then
			' Strip brackets for SQL
			strWhere = Replace(strWhere,"[","")
			strWhere = Replace(strWhere,"]","")
		end if
	case "SHORT"
		'Don't allow a one character search
		if Len(Trim(pSearch)) < 2 then Response.Redirect "GenericList.asp"

		select case strPhrase
		case "EXACT"
			For x = 1 to intFieldCount
			select case xrs.Fields(x-1).Type 
				case 2, 3, 6	' 2 Byte Integer, 4 Byte Integer, Currency
					if Mid(SearchFields, x, 1) = "1" and isNumeric(pSearch) then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] =" & pSearch & ") OR"
				case 129, 130, 200, 201, 202, 203 ' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
					if Mid(SearchFields, x, 1) = "1" then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] LIKE " & QUOTE & "%" & pSearch & "%" & QUOTE & ") OR" 
'				Case 135, 11 ' Dates: Currently unused
'					if Mid(SearchFields, x, 1) = "1" and isDate(pSearch) Then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] between cDate('" & pSearch &  "') AND (cDate('" & pSearch & "')+1))" & strBoolean
			end select	
			Next 
		case "OR"
			For x = 1 to intFieldCount
				arrSearchTerms = split(pSearch," ")
				for each SearchValue in arrSearchTerms
					select case xrs.Fields(x-1).Type
					case 2, 3, 6 ' 2 Byte Integer, 4 Byte Integer, Currency
						if Mid(SearchFields, x, 1) = "1" and isNumeric(SearchValue) then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] =" & SearchValue & ") OR"
					case 129, 130, 200, 201, 202, 203 ' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
						if Mid(SearchFields, x, 1) = "1" then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] LIKE " & QUOTE & "%" & SearchValue & "%" & QUOTE & ") OR" 
'					Case 135, 11 ' Dates: Currently unused
'						if Mid(SearchFields, x, 1) = "1" and isDate(pSearch) Then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] between cDate('" & pSearch &  "') AND (cDate('" & pSearch & "')+1)) OR"
					end select	
				next
			next 
	end select

	if Right(strWhere,2) = "OR" then strWhere = Left(strWhere, Len(strWhere)-2)
	if Right(strWhere,3) = "AND" then strWhere = Left(strWhere, Len(strWhere)-3)
	if strType = "SQL" then
		' Strip brackets for SQL
		strWhere = Replace(strWhere,"[","")
		strWhere = Replace(strWhere,"]","")
	end if
end select

' Set the state
if (Trim(Session("dbWhere")) & "x" = "x") OR Session("dbState") = 2 then
	' if a where clause was not set in the config file, then ad hoc searches are allowed
	' dbState= 1: Normal Operation; 2: Search, no previous Where, 3: Search, Where set in config
	Session("dbState") = 2
	Session("dbWhere") = strWhere
Else
	Session("dbState") = 3
	if strWhere & "x" = "x" then
		Session("dbWhere") = "(" & Session("dbWhere") & ")"
	else
		Session("dbWhere") = "(" & Session("dbWhere") & ") AND (" & strWhere & ")"
	end if
end if
xrs.Close
Set xrs = Nothing

Session("dbStartRec") = 1
Response.Redirect "GenericList.asp"
%>
