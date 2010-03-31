<%
    ' Generic Database - Config File Wizard - Screen 2
    ' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
    ' E-Mail: erobillard@ofifc.org
    ' URL: http://www.ofifc.org/Eli/ASP/
    ' Revision History:
    '  16 May 1999 - Created

    ' Read the form
    Session("dbEditTemplate") = Request.Form("EditTemplate")
    Session("dbViewTemplate") = Request.Form("ViewTemplate")
    Session("dbTitle") = Request.Form("Title")
    Session("dbExitPage") = Request.Form("ExitPage")
    Session("dbExitPageText") = Request.Form("ExitPageText")
    Session("dbType") = Request.Form("dbType")
    Session("dbConn") = Request.Form("DSN")
    Session("dbFields") = Request.Form("Fields")
    Session("dbRs") = Request.Form("Rs")
    Session("dbWhere") = Request.Form("Where")
    Session("dbGroupBy") = Request.Form("GroupBy")
    Session("dbOrderBy") = Request.Form("OrderBy")
    Session("dbCanAdd") = Request.Form("CanAdd")
    Session("dbExtraAdd") = Request.Form("ExtraAdd")
    Session("dbCanEdit") = Request.Form("CanEdit")
    Session("dbCanDelete") = Request.Form("CanDelete")
    Session("dbConfirmDelete") = Request.Form("ConfirmDelete")
    Session("dbDebug") = Request.Form("Debug")
    Session("dbRecsPerPage") = Request.Form("RecsPerPage")
    Session("dbFont") = Request.Form("Font")
    Session("dbFontSize") = Request.Form("FontSize")
    Session("dbBorderColor") = Request.Form("BorderColor")
    Session("dbMenuColor") = Request.Form("MenuColor")

    If Trim(Session("dbFields")) & "x" = "x" Then Session("dbFields") = "*"

    strConn = Session("dbConn")
    Rs = Session("dbRs")
    Title = Session("dbTitle")
    Fields = Session("dbFields")
    Font = Session("dbFont")
    FontSize = Session("dbFontSize")
    BorderColor = Session("dbBorderColor")
    MenuColor = Session("dbMenuColor")


    ' Open Connection to the database
    xConn = Server.CreateObject("ADODB.Connection")
    xConn.Open(strConn)

    ' Open Recordset and get the field info
    strsql = "SELECT " & Fields & " FROM [" & Rs & "]"
    Select Case dbType
        Case "UDF"
            strsql = "SELECT " & Fields & " FROM " & Rs
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
    Dim aFields(), aFieldNames(), aFieldDispList(), aFieldDispView(), aFieldDispEdit()
    ReDim aFields(intFieldCount, 3)
    ReDim aFieldNames(intFieldCount)
    ReDim aFieldDefault(intFieldCount)
    ReDim aFieldDispList(intFieldCount)
    ReDim aFieldDispView(intFieldCount)
    ReDim aFieldDispEdit(intFieldCount)
    For x = 1 To intFieldCount
        aFields(x, 1) = xrs.Fields(x - 1).Name
        aFields(x, 2) = xrs.Fields(x - 1).Type
        aFields(x, 3) = xrs.Fields(x - 1).DefinedSize
        aFieldNames(x - 1) = aFields(x, 1)
        aFieldDispList(x - 1) = 0
        aFieldDispView(x - 1) = 0
        aFieldDispEdit(x - 1) = 0
    Next
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
    <title>
        <%=Title%></title>
</head>
<body>
    <font size="<%=FontSize%>" face="<%=Font%>">
        <h2>
            GenericDB Configuration File Wizard - Page 2</h2>
        <form action="GenericWizard3.aspx" method="POST">
        <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=BorderColor%>">
            <tr>
                <td>
                    <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=MenuColor%>">
                        <tr>
                            <td colspan="8" align="CENTER" bgcolor="<%=MenuColor%>">
                                <font size="<%=FontSize%>" face="<%=Font%>"><strong>-
                                    <%= Rs %>
                                    -</strong>
                            </td>
                        </tr>
                        <tr>
                            <th>
                            </th>
                            <th>
                            </th>
                            <th>
                            </th>
                            <th>
                            </th>
                            <th colspan="3" bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Display In
                            </th>
                            <th>
                            </th>
                        </tr>
                        <tr>
                            <th>
                                <font size="<%=FontSize%>" face="<%=Font%>">#
                            </th>
                            <th>
                                <font size="<%=FontSize%>" face="<%=Font%>">Field
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Display<br>As
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Default Value
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Primary<br>Key
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Lister
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Viewer
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Editor
                            </th>
                            <th bgcolor="White">
                                <font size="<%=FontSize%>" face="<%=Font%>">Searchable
                            </th>
                        </tr>
                        <%  For x = 1 To intFieldCount
                                If x Mod 2 = 0 Then
                                    bgcolor = "#FFFFCC"
                                Else
                                    bgcolor = "White"
                                End If%>
                        <tr>
                            <td height="0" bgcolor="<%= bgcolor %>" align="LEFT">
                                <font size="<%=FontSize%>" face="<%=Font%>">
                                    <%=x %>
                            </td>
                            <% 			aFields(x, 1) = xrs.Fields(x - 1).Name%>
                </td>
                <td height="0" bgcolor="<%= bgcolor %>" align="LEFT">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <%=aFields(x, 1)%>
                </td>
                <%			aFields(x, 2) = xrs.Fields(x - 1).Type%></TD>
                <td bgcolor="<%= bgcolor %>" align="LEFT">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <input type="Text" name="Desc<%=x%>" value="<%=aFieldNames(x-1)%>" size="20" maxlength="40">
                    </font>
                </td>
                <td bgcolor="<%= bgcolor %>" align="LEFT">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <%  ' Defaults
                            Select Case aFields(x, 2)
                                Case 2, 3, 6    ' 2 Byte Integer, 4 Byte Integer, Currency %>
                        <input type="Text" name="Default<%=x%>" value="0" size="20" maxlength="40">
                        <%		Case 11     ' Boolean True/False %>
                        <select name="Default<%=x%>" size="1">
                            <option value="'Yes'">Yes<option selected value="'No'">
                            No
                        </select>
                        <%		Case 135    ' Date / Time Stamp, usually created with the Now() function %>
                        <input type="Text" name="Default<%=x%>" value="" size="20" maxlength="40">
                        <%		Case 200, 201   ' String or Memo %>
                        <input type="Text" name="Default<%=x%>" value="''" size="20" maxlength="40">
                        <%	End Select%>
                    </font>
                </td>
                <td bgcolor="<%= bgcolor %>" align="CENTER">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <input type="Radio" value="<%= x %>" name="Key">
                    </font>
                </td>
                <td bgcolor="<%= bgcolor %>" align="CENTER">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <input type="Checkbox" name="DispList<%= x %>" value="On">
                    </font>
                </td>
                <td bgcolor="<%= bgcolor %>" align="CENTER">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <input type="Checkbox" checked name="DispView<%= x %>" value="On">
                    </font>
                </td>
                <td bgcolor="<%= bgcolor %>" align="CENTER">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <input type="Checkbox" checked name="DispEdit<%= x %>" value="On">
                    </font>
                </td>
                <td bgcolor="<%= bgcolor %>" align="CENTER">
                    <font size="<%=FontSize%>" face="<%=Font%>">
                        <% If aFields(x, 2) = 200 Or (aFields(x, 2) = 201) Then%>
                        <input type="Checkbox" checked name="Searchable<%= x %>" value="On">
                        <% Else%>
                        <input type="Hidden" name="Searchable<%=x%>" value="Off">No
                        <% End If%>
                    </font>
                </td>
            </tr>
            <%  Next
                xrs.Close()
                xrs = Nothing
                xConn.Close()
                xConn = Nothing
            %>
            <tr>
                <td align="CENTER" colspan="8">
                    <input type="Submit" value="Next Page">
                </td>
            </tr>
        </table>
        </TD></TR></TABLE>
        <p>
        </form>
        <hr noshade>
    </font>
</body>
</html>
