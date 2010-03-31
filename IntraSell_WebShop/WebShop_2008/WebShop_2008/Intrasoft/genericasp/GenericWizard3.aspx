<%
    ' Generic Database - Config File Wizard - Screen 3
    ' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
    ' E-Mail: erobillard@ofifc.org
    ' URL: http://www.ofifc.org/Eli/ASP/
    ' Revision History:
    '  16 May 1999 - Created

    QUOTE = Chr(34)
    Rs = Session("Rs")
    Title = Session("Title")
    Fields = Session("Fields")
    Font = Session("Font")
    FontSize = Session("FontSize")
    BorderColor = Session("BorderColor")
    MenuColor = Session("MenuColor")

    ' Open Connection to the database
    xConn = Server.CreateObject("ADODB.Connection")
    xConn.Open(Session("dbConn"))

    ' Open Recordset and get the field info
    strsql = "SELECT " & Session("dbFields") & " FROM [" & Session("dbRs") & "]"
    Select Case dbType
        Case "UDF"
            strsql = "SELECT " & Session("dbFields") & " FROM " & Session("dbRs")
        Case "SQL"
            strsql = Replace(strsql, "[", "")
            strsql = Replace(strsql, "]", "")
        Case "MySQL"
            strsql = Replace(strsql, "[", "`")
            strsql = Replace(strsql, "]", "`")
    End Select
    xrs = Server.CreateObject("ADODB.Recordset")

    xrs.Open(strsql, xConn)
    intFieldCount = xrs.Fields.Count
    Dim aFields(), aFieldNames(), aFieldDefault(), aFieldDispList(), aFieldDispView(), aFieldDispEdit(), aFieldSearchable()
    ReDim aFields(intFieldCount, 3)
    ReDim aFieldNames(intFieldCount)
    ReDim aFieldDefault(intFieldCount)
    ReDim aFieldDispList(intFieldCount)
    ReDim aFieldDispView(intFieldCount)
    ReDim aFieldDispEdit(intFieldCount)
    ReDim aFieldSearchable(intFieldCount)
    dbNames = ""
    dbDispList = ""
    dbDispView = ""
    dbDispEdit = ""
    dbSearch = ""
    For x = 1 To intFieldCount
        aFields(x, 1) = xrs.Fields(x - 1).Name
        aFields(x, 2) = xrs.Fields(x - 1).Type
        aFields(x, 3) = xrs.Fields(x - 1).DefinedSize
        aFieldNames(x) = Request.Form("Desc" & x)
        aFieldDefault(x) = Request.Form("Default" & x)
        aFieldDispList(x) = Request.Form("DispList" & x)
        aFieldDispView(x) = Request.Form("DispView" & x)
        aFieldDispEdit(x) = Request.Form("DispEdit" & x)
        aFieldSearchable(x) = Request.Form("Searchable" & x)
        If x <> intFieldCount Then
            pad = ", "
        Else
            pad = ""
        End If
        If aFieldNames(x) & "x" <> "x" Then
            dbNames = dbNames & aFieldNames(x) & pad
        Else
            dbNames = dbNames & pad
        End If
        If aFieldDispList(x) = "On" Then
            dbDispList = dbDispList & "1"
        Else
            dbDispList = dbDispList & "0"
        End If
        If aFieldDispView(x) = "On" Then
            dbDispView = dbDispView & "1"
        Else
            dbDispView = dbDispView & "0"
        End If
        If aFieldDispEdit(x) = "On" Then
            dbDispEdit = dbDispEdit & "1"
        Else
            dbDispEdit = dbDispEdit & "0"
        End If
        If aFieldSearchable(x) = "On" Then
            dbSearch = dbSearch & "1"
        Else
            dbSearch = dbSearch & "0"
        End If
    Next
    Session("dbFieldNames") = dbNames
    Session("dbDispList") = dbDispList
    Session("dbDispView") = dbDispView
    Session("dbDispEdit") = dbDispEdit
    Session("dbSearchFields") = dbSearch
    Session("dbKey") = Request.Form("Key")
    Session("dbViewPath") = Request.ServerVariables("PATH_TRANSLATED")
    Session("dbViewPage") = Request.ServerVariables("PATH_INFO")
    Session("dbGenericPath") = "./"

    If Session("dbKey") + 1 = 1 Then Session("dbKey") = 0
    If Session("dbOrder") + 1 = 1 Then Session("dbOrder") = 0
    If Session("dbRecsPerPage") + 1 = 1 Then Session("dbRecsPerPage") = 0
    If Session("dbFooter") + 1 = 1 Then Session("dbFooter") = 0
    If Session("dbFontSize") + 1 = 1 Then Session("dbFontSize") = 0
    If Session("dbDebug") + 1 = 1 Then Session("dbDebug") = 0
    If Session("dbCanAdd") + 1 = 1 Then Session("dbCanAdd") = 0
    If Session("dbExtraAdd") + 1 = 1 Then Session("dbExtraAdd") = 0
    If Session("dbCanEdit") + 1 = 1 Then Session("dbCanEdit") = 0
    If Session("dbCanDelete") + 1 = 1 Then Session("dbCanDelete") = 0
    If Session("dbConfirmDelete") + 1 = 1 Then Session("dbConfirmDelete") = 0
    If Session("dbRecsPerPage") + 1 = 1 Then Session("dbRecsPerPage") = 0

    ' Create new file
    'outFilePath = GetFilePath(Session("dbViewPath")) & Session("dbFileName")
    'Set objFSO = CreateObject("Scripting.FileSystemObject")
    'Set objNewFile = objFSO.CreateTextFile(outFilePath)

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
    <title>
        <%=Title%></title>
</head>
<body>
    <%
        ' Write the file
        Response.Write("&lt;" & "% ' GenericDB Config File " & "<BR>")
        Response.Write("' Title: " & Session("dbTitle") & "<BR>")
        Response.Write("' Recordset: " & Session("dbRs") & "<BR>")

        Response.Write("" & "<BR>")
        Response.Write("' Application " & "<BR>")
        Response.Write("Session(" & QUOTE & "dbGenericPath" & QUOTE & ") = " & QUOTE & GetFilePath(Session("dbViewPage")) & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbExitPage" & QUOTE & ") = " & QUOTE & Session("dbExitPage") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbTitle" & QUOTE & ") = " & QUOTE & Session("dbTitle") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbType" & QUOTE & ") = " & QUOTE & Session("dbType") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbConn" & QUOTE & ") = " & QUOTE & Session("dbConn") & QUOTE & "<BR>")

        Response.Write("" & "<BR>")
        Response.Write("' Query" & "<BR>")
        Response.Write("Session(" & QUOTE & "dbFields" & QUOTE & ") = " & QUOTE & Session("dbFields") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbRs" & QUOTE & ") = " & QUOTE & Session("dbRs") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbWhere" & QUOTE & ") = " & QUOTE & Session("dbWhere") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbGroupBy" & QUOTE & ") = " & QUOTE & Session("dbGroupBy") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbOrderBy" & QUOTE & ") = " & QUOTE & Session("dbOrderBy") & QUOTE & "<BR>")

        Response.Write("" & "<BR>")
        Response.Write("' Display" & "<BR>")
        Response.Write("Session(" & QUOTE & "dbEditTemplate" & QUOTE & ") = " & QUOTE & Session("dbEditTemplate") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbViewTemplate" & QUOTE & ") = " & QUOTE & Session("dbViewTemplate") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbBackText" & QUOTE & ") = " & QUOTE & Session("dbBackText") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbFieldNames" & QUOTE & ") = " & QUOTE & Session("dbFieldNames") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbKey" & QUOTE & ") = " & Session("dbKey") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbOrder" & QUOTE & ") = " & Session("dbOrder") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbRecsPerPage" & QUOTE & ") = " & Session("dbRecsPerPage") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbDispList" & QUOTE & ") = " & QUOTE & Session("dbDispList") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbDispView" & QUOTE & ") = " & QUOTE & Session("dbDispView") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbDispEdit" & QUOTE & ") = " & QUOTE & Session("dbDispEdit") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbSearchFields" & QUOTE & ") = " & QUOTE & Session("dbSearchFields") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbFooter" & QUOTE & ") = " & Session("dbFooter") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbFont" & QUOTE & ") = " & QUOTE & Session("dbFont") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbFontSize" & QUOTE & ") = " & Session("dbFontSize") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbBorderColor" & QUOTE & ") = " & QUOTE & Session("dbBorderColor") & QUOTE & "<BR>")
        Response.Write("Session(" & QUOTE & "dbMenuColor" & QUOTE & ") = " & QUOTE & Session("dbMenuColor") & QUOTE & "<BR>")

        Response.Write("" & "<BR>")
        Response.Write("' Features" & "<BR>")
        Response.Write("Session(" & QUOTE & "dbDebug" & QUOTE & ") = " & Session("dbDebug") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbCanAdd" & QUOTE & ") = " & Session("dbCanAdd") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbExtraAdd" & QUOTE & ") = " & Session("dbExtraAdd") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbCanEdit" & QUOTE & ") = " & Session("dbCanEdit") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbCanDelete" & QUOTE & ") = " & Session("dbCanDelete") & "<BR>")
        Response.Write("Session(" & QUOTE & "dbConfirmDelete" & QUOTE & ") = " & Session("dbConfirmDelete") & "<BR>")

        Response.Write("" & "<BR>")
        Response.Write("' Defaults" & "<BR>")
        For x = 1 To intFieldCount
            If (aFieldDefault(x) & "x" <> "x") And (aFieldDefault(x) <> "''") And (aFieldDefault(x) <> "0") Then
                Response.Write("Session(" & QUOTE & "dbDefault" & x & QUOTE & ") = " & aFieldDefault(x) & "<BR>")
            End If
        Next

        Response.Write("" & "<BR>")
        Response.Write("' Do Not Change" & "<BR>")
        Response.Write("Session(" & QUOTE & "dbViewPath" & QUOTE & ") = Request.ServerVariables(" & QUOTE & "PATH_TRANSLATED" & QUOTE & ")" & "<BR>")
        Response.Write("Session(" & QUOTE & "dbViewPage" & QUOTE & ") = Request.ServerVariables(" & QUOTE & "PATH_INFO" & QUOTE & ")" & "<BR>")
        Response.Write("Response.Redirect Session(" & QUOTE & "dbGenericPath" & QUOTE & ") & " & QUOTE & "GenericList.aspx" & QUOTE & "<BR>")

        Response.Write("" & "<BR>")
        Response.Write("%" & ">" & "<BR>")
        'objNewFile.Close
        'Set objNewFile = Nothing
    %>
</body>
</html>
<%
Function GetFilePath(strFilePath)
    Dim pathroot
    Dim i
    pathroot = strFilePath
    For i = len(pathroot) To 1 Step -1
        If (mid(pathroot, i, 1) = "\") Or (mid(pathroot, i, 1) = "/") Then ' cut the filename, leave the path
            pathroot = mid(pathroot, 1, i)
            Exit For
        End If
    Next
    GetFilePath = pathroot
End Function
%>