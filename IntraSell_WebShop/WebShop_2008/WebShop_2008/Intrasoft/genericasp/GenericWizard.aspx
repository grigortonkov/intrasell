<%
    ' Generic Database - Config File Wizard 
    ' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
    ' E-Mail: erobillard@ofifc.org
    ' URL: http://www.ofifc.org/Eli/ASP/
    ' Revision History:
    '  16 May 1999 - Created
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
    <title>GenericDB Config File Wizard - Page 1</title>
</head>
<body>
    <hr noshade>
    <font face="Arial, Helvetica">
        <h2>
            GenericDB Configuration File Wizard - Page 1</h2>
        <%
            Session("dbGenericPath") = Request.ServerVariables("PATH_TRANSLATED")
            Session("dbThisPage") = Request.ServerVariables("PATH_INFO")
        %>
        <form action="GenericWizard2.aspx" method="POST">
        <table bgcolor="#99CCCC">
            <tr>
                <td align="RIGHT">
                    <font color="Red">** </font>Page Title:
                </td>
                <td>
                    <input type="Text" name="Title" size="30" maxlength="80"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    <font color="Red">** </font>Exit Link URL:
                </td>
                <td>
                    <input type="Text" name="ExitPage" value="http://" size="30" maxlength="80"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Exit Link Text:
                </td>
                <td>
                    <input type="Text" name="ExitPageText" value="Back" size="30" maxlength="80"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Data Source Type:
                </td>
                <td>
                    <select name="dbType" size="1">
                        <option selected value="ACCESS">MS-Access<option value="SQL">SQL<option value="UDF">
                        Other ODBC
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    <font color="Red">** </font>Data Source Name (DSN):
                </td>
                <td>
                    <input type="Text" name="DSN" size="30" maxlength="100"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    SELECT (Fields):
                </td>
                <td>
                    <input type="Text" name="Fields" value="*" size="30" maxlength="255">
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    <font color="Red">** </font>FROM (Recordset):
                </td>
                <td>
                    <input type="Text" name="Rs" value="" size="30" maxlength="255"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    WHERE (Condition):
                </td>
                <td>
                    <input type="Text" name="Where" value="" size="30" maxlength="60"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    GROUP BY:
                </td>
                <td>
                    <input type="Text" name="GroupBy" size="30" maxlength="60"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    ORDER BY:
                </td>
                <td>
                    <input type="Text" name="OrderBy" size="30" maxlength="60"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Allow New Records:
                </td>
                <td>
                    <select name="CanAdd" size="1">
                        <option selected value="1">Yes<option value="0">
                        No
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Allow Edits:
                </td>
                <td>
                    <select name="CanEdit" size="1">
                        <option selected value="1">Yes<option value="0">
                        No
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Allow Deletes:
                </td>
                <td>
                    <select name="CanDelete" size="1">
                        <option selected value="1">Yes<option value="0">
                        No
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Confirm Deletes:
                </td>
                <td>
                    <select name="ConfirmDelete" size="1">
                        <option selected value="1">Yes<option value="0">
                        No
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Extra Add Button:
                </td>
                <td>
                    <select name="ExtraAdd" size="1">
                        <option value="1">Yes<option selected value="0">
                        No
                    </select><br>
                    (Appears below the menu)
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Debug Screen Available (dbInfo):
                </td>
                <td>
                    <select name="Debug" size="1">
                        <option selected value="1">Yes<option value="0">
                        No
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Records to Display per Page:
                </td>
                <td>
                    <input type="Text" name="RecsPerPage" value="20" size="30" maxlength="5">
                    <i>0=All</i><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Template File for Editing:
                </td>
                <td>
                    <input type="Text" name="EditTemplate" value="" size="30" maxlength="80"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Template File for Viewing:
                </td>
                <td>
                    <input type="Text" name="ViewTemplate" value="" size="30" maxlength="80"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Base Font:
                </td>
                <td>
                    <input type="Text" name="Font" value="Arial, Helvetica" size="30" maxlength="32"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Base Font Size:
                </td>
                <td>
                    <select name="FontSize" size="1">
                        <option value="0">0
                            <option value="1">1
                                <option selected value="2">2
                                    <option value="3">3
                                        <option value="4">
                        4
                    </select><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Border Colour:
                </td>
                <td>
                    <input type="Text" name="BorderColor" value="#99CCCC" size="30" maxlength="32"><br>
                </td>
            </tr>
            <tr>
                <td align="RIGHT">
                    Menu Colour:
                </td>
                <td>
                    <input type="Text" name="MenuColor" value="#99CCCC" size="30" maxlength="32"><br>
                </td>
            </tr>
            <!-- <TR>
	<TD ALIGN="RIGHT">:</TD>
	<TD><INPUT TYPE="Text" NAME="" VALUE="" SIZE="30" MAXLENGTH="32"><BR></TD>
</TR>
 -->
            <tr>
                <td align="CENTER" colspan="2">
                    <input type="Submit" value="Next Page">
                </td>
            </tr>
        </table>
        <font color="Red">**</font> Indicates a <strong><em>required</em></strong> value.<br>
        </form>
        <hr noshade>
    </font>
</body>
</html>
