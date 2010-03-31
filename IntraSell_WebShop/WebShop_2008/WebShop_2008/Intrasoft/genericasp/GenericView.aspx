<!--#include file="GenericLanguage.aspx" -->
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
    Response.AddHeader("cache-control", "must-revalidate")
    Response.AddHeader("cache-control", "private")
    Response.AddHeader("pragma", "no-cache")

    QUOTE = Chr(34)
    LT = Chr(60)
    GT = Chr(62)

    ' Make sure we have an active session
    If Session("dbRs") = "" Then
        Response.Clear()
        Response.Redirect("GenericError.aspx")
    End If

    ' Check permissions
    If Session("dbDispView") = "" Then
        Response.Clear()
        Response.Redirect(Session("dbViewPage"))
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
        arrSubTable = Split(Session("dbSubTable"), ",")
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
        strEditor = "GenericEdit.aspx"
    Else
        strEditor = "GenericCustomEdit.aspx"
    End If

    ' Get the key value of the record to display	
    If Request.QueryString("KEY").Count > 0 Then
        strKey = Request.QueryString("KEY")
        Session("dbcurKey") = strKey
    Else
        Response.Clear()
        Response.Redirect(Session("dbViewPage"))
    End If

    ' Open Connection to the database
    xConn = Server.CreateObject("ADODB.Connection")
    xConn.Open(strConn)

    ' Get info from Session vars (kinda like parameters)
    strTable = Session("dbRs")
    strDisplay = Session("dbDispView")
    strKeyField = Session("dbKey")
    strFields = Session("dbFields")
    If strFields = "" Then strFields = "*"

    ' Open Recordset and get the field info
    strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
    Select Case strType
        Case "UDF"
            strsql = "SELECT " & strFields & " FROM " & strTable
        Case "SQL"
            strsql = Replace(strsql, "[", "")
            strsql = Replace(strsql, "]", "")
        Case "MYSQL"
            strsql = Replace(strsql, "[", "`")
            strsql = Replace(strsql, "]", "`")
    End Select
    xrs = Server.CreateObject("ADODB.Recordset")
    xrs.Open(strsql, xConn)
    intFieldCount = xrs.Fields.Count
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

    xrs.Close()
    ' Reopen the Recordset, this time use the parameters passed
    strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
    strsql = strsql & " WHERE [" & aFields(strKeyField, 1) & "]" & "=" & strKey
    Select Case strType
        Case "UDF"
            strsql = "SELECT " & strFields & " FROM " & strTable
            strsql = strsql & " WHERE [" & aFields(strKeyField, 1) & "]" & "=" & strKey
        Case "SQL"
            strsql = Replace(strsql, "[", "")
            strsql = Replace(strsql, "]", "")
        Case "MYSQL"
            strsql = Replace(strsql, "[", "`")
            strsql = Replace(strsql, "]", "`")
    End Select
    xrs.Open(strsql, xConn)

    If xrs.EOF Then
        Response.Clear()
        Response.Redirect(Session("dbViewPage"))
    End If
    ' Get the field contents
    For x = 1 To intFieldCount
        aFields(x, 4) = xrs(x - 1)
    Next

    xrs.Close()
    xrs = Nothing
    xConn.Close()
    xConn = Nothing
    ' For settings not used, set to default values (i.e. "0000" or "111111")
if trim(strFormatDate) = "" then strFormatDate = String(intFieldCount,"0") %>
<html>
<head>
    <title>
        <%=Session("dbTitle")%>
        -
        <%=txtView%></title>
</head>
<%  If Session("dbBodyTag") & "x" = "x" Then%>
<body>
    <% Else%>
    <body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>">
        <% End If%>
        <% If Session("dbBodyTag") & "x" <> "x" Then Response.Write(Session("dbBodyTag"))%>
        <!-- Header -->
        <% If Session("dbHeader") = 1 Then%>
        <!--#include file="GenericHeader.aspx"-->
        <% End If%>
        <font size="<%=intFontSize%>" face="<%=strFont%>">
            <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strBorderColor%>" width="100%">
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=strBorderColor%>">
                            <tr>
                                <td bgcolor="<%=strMenuColor%>" align="RIGHT" width="*">
                                    <font size="3" face="<%=strFont%>" color="<%=strMenuTextColor%>"><a href="<%=Session("dbGenericPath")%>GenericList.aspx">
                                        <%=txtBackToList%></a>
                                        <% If (Session("dbCanEdit") = 1) And Session("dbKey") > 0 Then%>
                                        &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=Session("dbGenericPath")%><%=strEditor%>?KEY=<%=aFields(Session("dbKey"),4)%>"><%=txtEdit%></a>
                                        <%  End If
                                            If IsSubTable Then%>
                                        &nbsp;&nbsp;|&nbsp;&nbsp;<a href="<%=Session("dbGenericPath")%>GenericExit.asp?KEY=<%=aFields(Session("dbKey"),4)%>"><%=arrSubTable(0)%></a>
                                        <% End If%>
                                    </font>
                                </td>
                            </tr>
                            <tr>
                                <td align="RIGHT" bgcolor="#FFFFFF">
                                    <font size="5" face="<%=strFont%>"><strong><em>
                                        <%=Session("dbTitle")%>
                                        -
                                        <%=txtView%></em></strong></font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <p>
                <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strBorderColor%>">
                    <tr>
                        <td>
                            <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=strBorderColor%>">
                                <%  For x = 1 To intFieldCount
                                        If Mid(strDisplay, x, 1) = "1" Then%>
                                <tr bgcolor="#FFFFCC" align="LEFT">
                                    <td>
                                        <font size="<%=intFontSize%>" face="<%=strFont%>">
                                            <%=arrFieldNames(x-1)%></font>
                                    </td>
                                    <td bgcolor="White" align="LEFT">
                                        <font size="<%=intFontSize%>" face="<%=strFont%>">
                                            <%  curVal = aFields(x, 4)
                                                ' Blank / Null / Empty
                                                If IsNull(curVal) Or (Trim(curVal) & "x" = "x") Then curVal = "&nbsp;"
                                                ' Password
                                                If UCase(Left(aFields(x, 1), 8)) = "PASSWORD" Then curVal = "*****"
                                                ' Format the various field types
                                                Select Case aFields(x, 2)
                                                    Case 2, 3, 4, 5 ' Numbers
                                                        curVal = "<div align=right>" & curVal & "</div>"
                                                    Case 6 ' Currency
                                                        curval = "<div align=right>" & FormatCurrency(curval, 2, -1) & "</div>"
                                                    Case 7, 135 ' Date / Time - Fixed for Null values by Elizabeth Robins
                                                        If curVal <> "&nbsp;" Then curVal = FormatDateTime(curVal, Mid(strFormatDate, x, 1))
                                                    Case 11 ' Boolean
                                                        If curVal Then
                                                            curVal = txtTrue
                                                        Else
                                                            curVal = txtFalse
                                                        End If
                                                    Case 129, 130, 200, 201, 202, 203 ' String or Memo
                                                        curVal = Replace(curVal, "<", "&lt;")
                                                        curVal = Replace(curVal, ">", "&gt;")
                                                        curVal = Replace(curVal, Chr(10), "&nbsp;<br>")
                                                End Select
                                                ' Image
                                                If (UCase(Left(aFields(x, 1), 3)) = "IMG") Then curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & GT
                                                ' Check for E-mail address
                                                strContainsURL = "dbEMailfor" & CStr(x)
                                                If (Session(strContainsURL) > 0) Then
                                                    strURL = aFields(Session(strContainsURL), 4)
                                                    If Trim(strURL) & "x" <> "x" Then
                                                        strURL = Replace(strURL, "mailto:", "")
                                                        strURL = "mailto:" & LTrim(strURL)
                                                        curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
                                                    End If
                                                End If
                                                ' Check for hyperlink 
                                                strContainsURL = "dbURLfor" & CStr(x)
                                                If Session(strContainsURL) <> 0 Then
                                                    strURL = aFields(Session(strContainsURL), 4)
                                                    If strURL & "x" <> "x" Then
                                                        curVal = "<A HREF=" & QUOTE & strURL & QUOTE & ">" & curVal & "</A>"
                                                        ' *** Uncomment the following line to strip all #'s from hyperlink fields
                                                        '					curVal = Replace(curVal,"#","")
                                                    End If
                                                Else
                                                    If (UCase(Left(curVal, 7)) = "HTTP://") Then
                                                        curVal = LT & "A HREF=" & QUOTE & curVal & QUOTE & GT & curVal & LT & "/A" & GT
                                                        ' *** Uncomment the following line to strip all #'s from Access hyperlink fields
                                                        '					curVal = Replace(curVal,"#","")
                                                    End If
                                                End If
                                                Response.Write(curVal)%>
                                        </font>
                                    </td>
                                </tr>
                                <%  End If
                                Next%>
                            </table>
                        </td>
                    </tr>
                </table>
                <!-- Footer -->
                <% If Session("dbFooter") = 1 Then%>
                <!--#include file="GenericFooter.aspx"-->
                <% End If%>
        </font>
    </body>
</html>
