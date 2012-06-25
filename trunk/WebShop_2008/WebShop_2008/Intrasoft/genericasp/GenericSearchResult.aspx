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
    Response.AddHeader("cache-control", "must-revalidate")
    Response.AddHeader("cache-control", "private")
    Response.AddHeader("pragma", "no-cache")

    ' Get parameters
    strType = UCase(Session("dbType"))
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
    pSearch = Replace(pSearch, "'", "")
    pSearch = Replace(pSearch, " and ", " ")
    pSearch = Replace(pSearch, " or ", " ")

    ' Open Connection to the database
    xConn = Server.CreateObject("ADODB.Connection")
    xConn.Open(strConn)

    ' Open Recordset and get the field info
    strsql = "select " & strFields & " FROM [" & strTable & "]"
    Select Case strType
        Case "UDF"
            strsql = "select " & strFields & " FROM " & strTable
        Case "SQL"
            strsql = Replace(strsql, "[", "")
            strsql = Replace(strsql, "]", "")
    End Select

    If Not Trim(strGroupBy) = "" Then
        strsql = strsql & " GROUP BY " & strGroupBy
        intAllowSort = 0
    End If

    xrs = Server.CreateObject("ADODB.Recordset")
    xrs.Open(strsql, xConn)
    intFieldCount = xrs.Fields.Count
    strWhere = ""

    Dim aFields()
    ReDim aFields(intFieldCount, 4)
    If Trim(Session("dbFieldNames")) & "x" = "x" Then
        ReDim arrFieldNames(intFieldCount)
        For x = 1 To intFieldCount
            aFields(x, 1) = xrs.Fields(x - 1).Name
            aFields(x, 2) = xrs.Fields(x - 1).Type
            aFields(x, 3) = xrs.Fields(x - 1).DefinedSize
            arrFieldNames(x - 1) = xrs.Fields(x - 1).Name
        Next
    Else
        For x = 1 To intFieldCount
            aFields(x, 1) = xrs.Fields(x - 1).Name
            aFields(x, 2) = xrs.Fields(x - 1).Type
            aFields(x, 3) = xrs.Fields(x - 1).DefinedSize
        Next
        arrFieldNames = Split(Session("dbFieldNames"), ",")
    End If

    Select Case SearchAction
        Case "FULL"
            For x = 1 To intFieldCount
                aFields(x, 4) = Request(aFields(x, 1))
                State = Request(aFields(x, 1) & x)
                'Don't allow a 2 character search
                If Len(Trim(aFields(x, 4))) > 1 Then ' Add to WHERE clause
                    Select Case aFields(x, 2)
                        Case 2, 3, 4, 5, 6, 131 ' Integers
                            strWhere = strWhere & " ([" & aFields(x, 1) & "]=" & aFields(x, 4) & ") " & State
                        Case 11   ' Boolean True/False
                            If Not (Trim(aFields(x, 4)) = "DontCare") Then strWhere = strWhere & " ([" & aFields(x, 1) & "]=" & aFields(x, 4) & ") " & State
                        Case 129, 130, 200, 202 ' Strings
                            strWhere = strWhere & " ([" & aFields(x, 1) & "]='" & aFields(x, 4) & "') " & State
                        Case 201, 203 'Using LIKE for memo fields
                            strWhere = strWhere & " ([" & aFields(x, 1) & "] LIKE " & QUOTE & "%" & aFields(x, 4) & "%" & QUOTE & ") " & State
                            '					case 135, 11	' Dates: Currently Unused
                            '						strWhere = strWhere & " ([" & aFields(x,1) & "] between cDate('" & aFields(x,4) &  "') AND (cDate('" & aFields(x,4) & "')+1))" & State
                    End Select
                End If
            Next
            ' Strip extra condition term
            If Right(strWhere, 2) = "OR" Then strWhere = Left(strWhere, Len(strWhere) - 2)
            If Right(strWhere, 3) = "AND" Then strWhere = Left(strWhere, Len(strWhere) - 3)
            If Right(strWhere, 7) = "AND NOT" Then strWhere = Left(strWhere, Len(strWhere) - 7)

            If strType = "SQL" Then
                ' Strip brackets for SQL
                strWhere = Replace(strWhere, "[", "")
                strWhere = Replace(strWhere, "]", "")
            End If
        Case "SHORT"
            'Don't allow a one character search
            If Len(Trim(pSearch)) < 2 Then Response.Redirect("GenericList.aspx")

            Select Case strPhrase
                Case "EXACT"
                    For x = 1 To intFieldCount
                        Select Case xrs.Fields(x - 1).Type
                            Case 2, 3, 6    ' 2 Byte Integer, 4 Byte Integer, Currency
                                If Mid(SearchFields, x, 1) = "1" And IsNumeric(pSearch) Then strWhere = strWhere & " ([" & xrs.Fields(x - 1).Name & "] =" & pSearch & ") OR"
                            Case 129, 130, 200, 201, 202, 203 ' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
                                If Mid(SearchFields, x, 1) = "1" Then strWhere = strWhere & " ([" & xrs.Fields(x - 1).Name & "] LIKE " & QUOTE & "%" & pSearch & "%" & QUOTE & ") OR"
                                '				Case 135, 11 ' Dates: Currently unused
                                '					if Mid(SearchFields, x, 1) = "1" and isDate(pSearch) Then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] between cDate('" & pSearch &  "') AND (cDate('" & pSearch & "')+1))" & strBoolean
                        End Select
                    Next
                Case "OR"
                    For x = 1 To intFieldCount
                        arrSearchTerms = Split(pSearch, " ")
                        For Each SearchValue In arrSearchTerms
                            Select Case xrs.Fields(x - 1).Type
                                Case 2, 3, 6 ' 2 Byte Integer, 4 Byte Integer, Currency
                                    If Mid(SearchFields, x, 1) = "1" And IsNumeric(SearchValue) Then strWhere = strWhere & " ([" & xrs.Fields(x - 1).Name & "] =" & SearchValue & ") OR"
                                Case 129, 130, 200, 201, 202, 203 ' Char, WChar, VarChar, LongVarChar (Memo), VarWChar (Unicode String), LongVarWChar
                                    If Mid(SearchFields, x, 1) = "1" Then strWhere = strWhere & " ([" & xrs.Fields(x - 1).Name & "] LIKE " & QUOTE & "%" & SearchValue & "%" & QUOTE & ") OR"
                                    '					Case 135, 11 ' Dates: Currently unused
                                    '						if Mid(SearchFields, x, 1) = "1" and isDate(pSearch) Then strWhere = strWhere & " ([" & xrs.Fields(x-1).Name & "] between cDate('" & pSearch &  "') AND (cDate('" & pSearch & "')+1)) OR"
                            End Select
                        Next
                    Next
            End Select

            If Right(strWhere, 2) = "OR" Then strWhere = Left(strWhere, Len(strWhere) - 2)
            If Right(strWhere, 3) = "AND" Then strWhere = Left(strWhere, Len(strWhere) - 3)
            If strType = "SQL" Then
                ' Strip brackets for SQL
                strWhere = Replace(strWhere, "[", "")
                strWhere = Replace(strWhere, "]", "")
            End If
    End Select

    ' Set the state
    If (Trim(Session("dbWhere")) & "x" = "x") Or Session("dbState") = 2 Then
        ' if a where clause was not set in the config file, then ad hoc searches are allowed
        ' dbState= 1: Normal Operation; 2: Search, no previous Where, 3: Search, Where set in config
        Session("dbState") = 2
        Session("dbWhere") = strWhere
    Else
        Session("dbState") = 3
        If strWhere & "x" = "x" Then
            Session("dbWhere") = "(" & Session("dbWhere") & ")"
        Else
            Session("dbWhere") = "(" & Session("dbWhere") & ") AND (" & strWhere & ")"
        End If
    End If
    xrs.Close()
    xrs = Nothing

    Session("dbStartRec") = 1
    Response.Redirect("GenericList.aspx")
%>
