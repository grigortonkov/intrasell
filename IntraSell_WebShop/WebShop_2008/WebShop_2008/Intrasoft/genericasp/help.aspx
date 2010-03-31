<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
<head>
    <title>GenericDB - Help</title>
</head>
<!-- <BODY> -->
<!--#include virtual="/eli/asp/header-sm.aspx"-->
<p>
    <font color="Navy">
        <h3>
            GenericDB Help - Jump to:</h3>
    </font>
    <p>
        <li><a href="help.aspx">The Config File</a>
            <li><a href="#quickref">Quick Reference</a>
                <li><a href="#ref">Unabridged Reference</a> (with explanations)
                    <li>Click <a href="GDBHelp.pdf">here</a> to download this Help reference in Adobe Acrobat
                        format.
                        <p>
                            <font color="Navy">
                                <h3>
                                    The Config File</h3>
                            </font>
                            <p>
                                The Config File is your interface to GenericDB. It contains the settings which guide
                                how GenericDB displays your data. This is a minimal Config File, see the Reference
                                sections below for syntax and explanations:
                                <blockquote>
                                    <p>
                                        <font color="Green" size="-1">&lt;%<br>
                                            ' Minimal interface to the Northwinds Employee table.
                                            <br>
                                            Session("dbGenericPath") = "/Eli/ASP/"<br>
                                            Session("dbExitPage") = "http://www.ofifc.org/Eli/ASP/GenericArticle.aspx"<br>
                                            Session("dbTitle") = "Northwinds Employee Table"<br>
                                            Session("dbConn") = "dbEli"<br>
                                            Session("dbRs") = "Employees"<br>
                                            Session("dbKey") = 1<br>
                                            Session("dbDispList") = "011101000000100010"<br>
                                            Session("dbViewPage") = Request.ServerVariables("PATH_INFO")<br>
                                            Response.Redirect Session("dbGenericPath") & "GenericList.aspx"<br>
                                            %&gt;</font>
                                        <p>
                                </blockquote>
                                <a name="quickref">
                                    <p>
                                </a><font color="Navy">
                                    <h3>
                                        Quick Reference</h3>
                                </font>
                                <p>
                                    <em><font size="-1"><font color="Red">**</font> Denotes a new or updated feature.</font></em>
                                    <table border="3">
                                        <tr>
                                            <th>
                                                Setting
                                            </th>
                                            <th>
                                                Description
                                            </th>
                                        </tr>
                                        <!-- 
<tr>
	<td><font color="Red">**</font> Session("") = </td>
	<td>()</td>
</tr>
 -->
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbBodyTag") = "VLINK=#CC9999 ALINK=#CC9999
                                                LINK=#CC9999"
                                            </td>
                                            <td>
                                                (build a custom body tag)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbBorderColor") = "Navy"
                                                <td>
                                                    (colour to display table borders, defaults to #99CCCC.)
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbCanAdd") = 0
                                            </td>
                                            <td>
                                                (or 1, defaults to 0)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbCanDelete") = 0
                                                <td>
                                                    (or 1, defaults to 0)
                                                </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbCanEdit") = 0
                                            </td>
                                            <td>
                                                (or 1, defaults to 0)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbCombo<xx>") = "LIST, value1, desc1, value2, desc2,..."
                                            </td>
                                            <td>
                                                (values to store and descriptions to display in a pull-down/combo box)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbCombo&lt;x>") = "TABLE, tablename, RowForVal, RowForDesc, BlankVal, BlankDesc,
                                                WhereClause"
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbConfirmDelete") = 0
                                            </td>
                                            <td>
                                                (or 1, defaults to 0)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbConn") = "myDSN"
                                            </td>
                                            <td>
                                                (Data Source Name or DSN connection)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbDebug") = 0
                                            </td>
                                            <td>
                                                (or 1, defaults to 0)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbDefault&lt;x>") = &lt;value>
                                            </td>
                                            <td>
                                                (default value for field x, use any value appropriate for the field)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbDispEdit") = "0211"
                                            </td>
                                            <td>
                                                (field display settings for the edit screen. 2=Read-only, 1=Read/write, 0=Do not
                                                display. In the example, field 1 is not displayed, 2 is read-only, and 3 and 4 are
                                                editable.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbDispList") = "011101"
                                            </td>
                                            <td>
                                                (1's or 0's representing whether each field will/won't be displayed)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbDispNew") = "10010"
                                            </td>
                                            <td>
                                                (controls which fields are displayed when editing a new record, defaults to the
                                                value of dbDispEdit.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbDispView") = "011101"
                                            </td>
                                            <td>
                                                (1's or 0's representing whether each field will/won't be displayed)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbEditTemplate") = "tblEmployeesEdit.htm"
                                            </td>
                                            <td>
                                                (The Custom Edit Template file, to be found in the same directory as the Config
                                                File.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbEMailFor3") = 4
                                            </td>
                                            <td>
                                                (display field 3 as a link to the E-mail address stored in field 4)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbExitPage") = "http://www.home.com/myhomepage.htm"
                                            </td>
                                            <td>
                                                (URL of the page to exit to)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbExitPageText") = "Back to Main Menu"
                                            </td>
                                            <td>
                                                (text for the Exit link, defaults to "Back")
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbFields") = "field1, field2, field3"
                                            </td>
                                            <td>
                                                (SELECT clause or Field List, defaults to all fields)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbFieldNames") = "field1, field2, ..."
                                            </td>
                                            <td>
                                                (defaults to actual Field Names, can customize here)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbFont") = "Times New Roman"
                                            </td>
                                            <td>
                                                (font list, defaults to "Verdana, Arial, Helvetica")
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbFontSize") = 2
                                            </td>
                                            <td>
                                                (0 to 4, defaults to 2)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbFooter") = 0
                                            </td>
                                            <td>
                                                (or 1, defaults to 0)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbGenericPath") = "/mypath/"
                                            </td>
                                            <td>
                                                (relative path to the GenericDB files)<br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbGroupBy") = "field list"
                                            </td>
                                            <td>
                                                (a GROUP BY clause for SQL queries)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbHaving") = "Count(myField) > 1"
                                            </td>
                                            <td>
                                                (a HAVING clause for SQL queries)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbHeader") = 1
                                            </td>
                                            <td>
                                                (displays the contents of GenericHeader.asp as a header on each page, default is
                                                0.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbHidePageNumbers") = 1
                                            </td>
                                            <td>
                                                (suppresses Page Numbers, defaults to 0)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbKey") = 1
                                            </td>
                                            <td>
                                                (field number to use as the Key field, usually an Autonumber field)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbMenuColor") = "Navy"
                                            </td>
                                            <td>
                                                (Colour to display menus, defaults to #99CCCC.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbMenuTextColor") = "Navy"
                                            </td>
                                            <td>
                                                (change the color of menu text and links, default is black.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbOnlyAdd") = 1
                                            </td>
                                            <td>
                                                (returns to the dbExitPage after submitting the record, default is 0. See detailed
                                                notes below.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbOnlyEdit") = 1
                                            </td>
                                            <td>
                                                (returns to the dbExitPage after editing the record, sefault is 0. See detailed
                                                notes below.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbOrder") = 2
                                            </td>
                                            <td>
                                                (field number to sort by, make it negative to do the reverse sort)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbOrderBy") = "field1 DESC, field2 ASC, etc."
                                            </td>
                                            <td>
                                                (ORDER by clause)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbRecsPerPage") = 15
                                            </td>
                                            <td>
                                                (number to display per page, default is all)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbRequiredFields") = "011101"
                                            </td>
                                            <td>
                                                (1's or 0's representing whether a red <font color="Red">*</font> is displayed beside
                                                each field. Does not validate data, just displays the star.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbRs") = "mytable"
                                            </td>
                                            <td>
                                                (A table name or FROM clause)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbSearchAdvanced") = 1
                                            </td>
                                            <td>
                                                (activates an Advanced Search link which helps the user with a field-by-field search,
                                                default is 0.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <font color="Red">**</font> Session("dbSearchEnhanced") = 1
                                            </td>
                                            <td>
                                                (adds option below the regular search box for a user to search "any of these words"
                                                or "exact phrase", defaults to 0.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbSearchFields") = "011101"
                                            </td>
                                            <td>
                                                (1's or 0's representing whether each field will/won't be searched. Note: Only string
                                                and memo fields are searchable.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbSearchPos") = "TOP"
                                            </td>
                                            <td>
                                                (Position of the Search box, "top" or "bottom", defaults to bottom.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbStartRec") = 51
                                            </td>
                                            <td>
                                                (a record number to start the display at, default is 1)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbSubTable") = "Title, ConfigFile, LinkingField"
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbTitle") = "My Page Title"
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbTotalFields") = "00101"
                                            </td>
                                            <td>
                                                (Totals the specified fields at the bottom of each page, in this case fields 3 and
                                                5.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbType") = "Access"
                                            </td>
                                            <td>
                                                (or SQL or UDF, defaults to Access)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                ession("dbUpdateField&lt;x>") = &lt;value>
                                            </td>
                                            <td>
                                                (After updating a record, field x will be set to this value.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbURLfor3") = 4
                                            </td>
                                            <td>
                                                (display field 3 as a link to the URL stored in field 4)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbViewPage") = Request.ServerVariables("PATH_INFO")
                                            </td>
                                            <td>
                                                (DO NOT CHANGE)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbViewTemplate") = "tblEmployeesView.htm"
                                            </td>
                                            <td>
                                                (The Custom View Template file, to be found in the same directory as the Config
                                                File.)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Session("dbWhere") = "fruit='apples'"
                                            </td>
                                            <td>
                                                (a WHERE clause)
                                            </td>
                                        </tr>
                                    </table>
                                    <br>
                                    <br>
                                    <!-- Session("dbCanAdd") = 0|1<BR>
Session("dbCanDelete") = 0|1<BR>
Session("dbCanEdit") = 0|1<BR>
Session("dbCombo<xx>") = "LIST, &lt;value1>, &lt;desc1> [,&lt;value n>,&lt;desc n>]"<BR>
Session("dbCombo&lt;x>") = "TABLE, &lt;tablename>, &lt;RowForVal>, &lt;RowForDesc>, &lt;BlankVal>, &lt;BlankDesc>, &lt;WhereClause> "<BR>
Session("dbConfirmDelete") = &lt;0|1><BR>
Session("dbConn") = "&lt;DSN>"<BR>
Session("dbDebug") = &lt;0|1><BR>
Session("dbDefault&lt;x>") = &lt;value><BR>
Session("dbDispEdit") = "&lt;0|1>[&lt;0|1>]"<BR>
Session("dbDispList") = "&lt;0|1>[&lt;0|1>]"<BR>
Session("dbDispView") = "&lt;0|1>[&lt;0|1>]"<BR>
Session("dbExitPage") = "http://www.ofifc.org/Eli/"<BR>
Session("dbFields") = "EmployeeID, Title, UserLevel, ParkingPass"<BR>
Session("dbFieldNames") = "&lt;field1>[, &lt;field2>, &lt;field3>, ...]"<BR>
Session("dbFont") = "Arial, Helvetica"<BR>
Session("dbFontSize") = &lt;0-4><BR>
Session("dbFooter") = &lt;0|1><BR>
Session("dbGenericPath") = "&lt;mypath>"<BR>
Session("dbGroupBy") = ""<BR>
Session("dbKey") = &lt;Field#><BR>
Session("dbOrder") = &lt;Field#><BR>
Session("dbOrderBy") = "[Last Name] DESC, [First Name]"<BR>
Session("dbRecsPerPage") = 10<BR>
Session("dbRs") = "Employees"<BR>
Session("dbSearchFields") = "011100010010001000"<BR>
Session("dbStartRec") = &lt;Record#><BR>
Session("dbSubTable") = "Title, ConfigFile, LinkingField"<BR>
Session("dbSubTable") = "Access Log, tblAccessLog.asp, EmployeeID"<BR>
Session("dbTitle") = "Northwinds Employee Table"<BR>
Session("dbType") = "&lt;Access|SQL|UDF>"<BR>
Session("dbURLfor&lt;x>") = &lt;Field#><BR>
Session("dbViewPage") = Request.ServerVariables("PATH_INFO")<BR>
Session("dbWhere") = "&lt;WHERE clause#>"<BR> -->
                                    <a name="ref">
                                        <p>
                                    </a><font color="Navy">
                                        <h3>
                                            Unabridged Reference</h3>
                                    </font>
                                    <p>
                                        <p>
                                            <b>Session("dbBodyTag") = "VLINK=#CC9999 ALINK=#CC9999 LINK=#CC9999"</b><br>
                                            Define a custom body tag, including BACKGROUND, BGCOLOR, LINK colour tags (as above),
                                            and more. Often, single quotes are allowed around tags: Session("dbBodyTag") = "BACKGROUND='MYGIF.GIF'
                                            BGCOLOR='white'"
                                            <p>
                                                If you have trouble with this, spend a couple lines at the beginning of your config
                                                file building the body tag string of your dreams:<br>
                                                <font color="Green">QUOTE = chr(34)<br>
                                                    txtBodyTag = "BACKGROUND=" & QUOTE & "MYGIF.GIF" & QUOTE & " BGCOLOR=" & QUOTE &
                                                    "WHITE" & QUOTE<br>
                                                </font>and set: <font color="Green">Session("dbBodyTag") = txtBodyTag</font><br>
                                                <p>
                                                    <b>Session("dbBorderColor") = "Navy"</b><br>
                                                    Change the colour of the menu borders.
                                                    <p>
                                                        <b>Session("dbCanAdd") = 1</b><br>
                                                        Can the user add a record? 1 means yes, 0 means no.
                                                        <p>
                                                            <b>Session("dbCanDelete") = 1</b><br>
                                                            Can the user delete records? 1 means yes, 0 means no.
                                                            <p>
                                                                <b>Session("dbCanEdit") = 1</b><br>
                                                                Can the user edit records? 1 means yes, 0 means no.
                                                                <p>
                                                                    <b>Session("dbCombo<xx>") = "LIST, &lt;value1>, &lt;desc1> [, &lt;value2>, &lt;desc2>]"</b><br>
                                                                    <b>Example 1: Session("dbCombo11") = "LIST, ??, Unknown, CA, Canada, US, United States,
                                                                        DE, Denmark"</b><br>
                                                                    OR<br>
                                                                    <b>Session("dbCombo<xx>") = "TABLE, &lt;tablename>, &lt;RowForVal>, &lt;RowForDesc>,
                                                                        &lt;BlankVal>, &lt;BlankDesc>, &lt;WhereClause> "</b><br>
                                                                    <b>Example 2: Session("dbCombo3") = "TABLE, tlkpProvince, 1, 2, ??, Unknown, Country='Canada'"</b><br>
                                                                    Display a "pull-down" combo box to edit a field. Options will be drawn from either
                                                                    a list or a lookup table. Example 1 makes field eleven a combo box (hence dbCombo11)
                                                                    taking values from a list. Example 2 works on field three (dbCombo3) taking values
                                                                    from a table.<br>
                                                                    <li>LIST: The rest of the line is a list of paired values (like Canada, CA). The first
                                                                        of the pair is the value actually stored in the table, the second shows up on the
                                                                        screen in the pull-down.
                                                                        <li>TABLE: Parameters passed are the table name (which must be in the same database/connection/DSN
                                                                            as the table currently being displayed), the number of the field/row which contains
                                                                            the value you want stored, the number of the field/row which contains the text to
                                                                            display, the value to store when the field is blank, and the value to display when
                                                                            the field is blank. The final parameter is an optional WHERE clause (Country='Canada'
                                                                            in Example 2 above). If you include a WHERE clause it cannot contain commas.
                                                                            <p>
                                                                                <b>Session("dbConfirmDelete") = 1</b><br>
                                                                                0 = Don't confirm (default), 1 = Confirm deletions. A screen will be presented to
                                                                                the user to confirm that the record should be deleted. <b>
                                                                                    <p>
                                                                                    Session("dbConn") = "dsnNorthwinds"</b><br>
                                                                                The name of the ODBC System data source name (DSN) as it's set up on your server.
                                                                                If your data source requires a username and password, this string should have the
                                                                                following format:
                                                                                <br>
                                                                                "DSN=dbEli;UID=sa;Password=mypass"
                                                                                <p>
                                                                                    If you have an Access database without a DSN you can create a <b>DSN-less</b> connection
                                                                                    by using a string with the following format:
                                                                                    <br>
                                                                                    "DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=c:\database\mydata.mdb"
                                                                                    <p>
                                                                                        <b>
                                                                                            <p>
                                                                                            Session("dbDebug") = 1</b><br>
                                                                                        This value of 1 or 0 decides whether the link to the dbInfo page is shown. Once
                                                                                        you're done setting up the field display lists you will probably want to change
                                                                                        this to 0.
                                                                                        <p>
                                                                                            <b>Session("dbDefault6") = Date()</b><br>
                                                                                            <b>Session("dbDefault11") = "Canada"</b><br>
                                                                                            Use this format to set defaults for new records. The first example sets field 6's
                                                                                            default value to Date(). In the tblEmployees.asp example this sets HireDate to today's
                                                                                            date. The second sets the default value of field 11 (Country) to Canada.
                                                                                            <p>
                                                                                                <b>Session("dbDispEdit") = "011111111111111111"</b><br>
                                                                                                Sets which fields appear on the Edit page. Same format as dbDispList and dpDispView.
                                                                                                <p>
                                                                                                    <b>Session("dbDispList") = "0111010000001000"</b><br>
                                                                                                    This string of 1's and 0's decides which fields will be shown on the Lister page.
                                                                                                    1 means show, 0 means don't show. In this case we're displaying fields 2, 3, 4,
                                                                                                    6, and 13 as shown by the positions of the 1's. The best way to construct this string
                                                                                                    is to start it off with "11111", save it, open the Lister in your browser, head
                                                                                                    to the dbInfo page and read off the field list as you type the 1's and 0's into
                                                                                                    your editor.
                                                                                                    <p>
                                                                                                        <b>Session("dbDispNew") = "0111010111110111"</b><br>
                                                                                                        Sets which fields appear on the Edit screen when a new record is being created.
                                                                                                        If this is not set, the fields displayed will default to those set in dbDispEdit.
                                                                                                        <p>
                                                                                                            <b>Session("dbDispView") = "1111111111111111"</b><br>
                                                                                                            This string of 1's and 0's decides which fields will be shown on the Viewer page.
                                                                                                            It is formed the same way as Session("dbDispList"), above. Leaving it blank (Session("dbDispView")
                                                                                                            = "") will prevent the View links from being displayed.
                                                                                                            <p>
                                                                                                                <b>Session("dbEMailFor3") = 4</b> This setting displays a field as a link (in this
                                                                                                                case, field 3) using the E-mail address stored in another field (in this case, field
                                                                                                                4). If field 3 contains "Eli" and field 4 contains "erobillard@ofifc.org" this would
                                                                                                                display as: <a href="mailto:erobillard@ofifc.org">Eli</a>.
                                                                                                                <p>
                                                                                                                    <b>Session("dbEMailFor4") = 5</b><br>
                                                                                                                    This setting displays a field as a link using the E-Mail address stored in another
                                                                                                                    field. In this example, the 4th field (possibly the employee's name) will be displayed
                                                                                                                    as a link to the URL stored in field 5 (the employee's E-mail address).
                                                                                                                    <p>
                                                                                                                        <b>Session("dbExitPage") = "http://www.ofifc.org/Eli/"</b><br>
                                                                                                                        Each page has an "Exit" link and this is where you decide what page that link goes
                                                                                                                        to.
                                                                                                                        <p>
                                                                                                                            <b>Session("dbFields") = "EmployeeID, Title, UserLevel, ParkingPass"</b><br>
                                                                                                                            Sets the list of fields to display. That's right, you're no longer limited to selecting
                                                                                                                            all the fields. See the dbGroupBy setting below for a tip on how to use this to
                                                                                                                            build complex queries.
                                                                                                                            <p>
                                                                                                                                <b>Session("dbFieldNames") = "&lt;field1>[, &lt;field2>, &lt;field3>, ...]"</b><br>
                                                                                                                                <b>Session("dbFieldNames") = "EmployeeID, Last Name, First Name, Title"</b><br>
                                                                                                                                Set field names to use when displaying the data instead of the raw field names from
                                                                                                                                the database.
                                                                                                                                <p>
                                                                                                                                    <b>Session("dbFont") = "Arial, Helvetica"</b><br>
                                                                                                                                    Set the font used by GenericDB.
                                                                                                                                    <br>
                                                                                                                                    <p>
                                                                                                                                        <b>Session("dbFontSize") = 2</b><br>
                                                                                                                                        Set the font size used to display data.
                                                                                                                                        <p>
                                                                                                                                            <b>Session("dbFooter") = 1</b><br>
                                                                                                                                            Set this variable and modify the GenericFooter.asp file to include a standard footer
                                                                                                                                            on each page. Note that the extension of the footer file has changed from .inc to
                                                                                                                                            .asp in recent versions as a security precaution.
                                                                                                                                            <p>
                                                                                                                                                <b>Session("dbGenericPath") = "/Eli/ASP/"</b><br>
                                                                                                                                                The relative path of your Generic Database files (GenericList.asp, GenericEdit.asp,
                                                                                                                                                etc.) This path is used to build the links on the pages.
                                                                                                                                                <p>
                                                                                                                                                    <b>Session("dbGroupBy") = ""</b><br>
                                                                                                                                                    Sets a GROUP BY clause.
                                                                                                                                                    <p>
                                                                                                                                                        <b><em><font color="Green">Tip!</font></em></b> To execute a relational query (great
                                                                                                                                                        for building reports)
                                                                                                                                                        <ol>
                                                                                                                                                            <li>Build a SQL query in any SQL Query Editor. In Access, build your relational query
                                                                                                                                                                in design mode and then select the SQL view.
                                                                                                                                                                <li>Copy everything after <b>GROUP BY</b> into the <b>dbGroupBy</b> variable
                                                                                                                                                                    <li>Copy the text after <b>ORDER BY</b> into the <b>dbOrderBy</b> variable.
                                                                                                                                                                        <li>Copy the text after <b>WHERE</b> into the <b>dbWhere</b> variable.
                                                                                                                                                                            <li>Copy the text after <b>FROM</b> into the <b>dbRs</b> variable.
                                                                                                                                                                                <li>Copy the text after <b>SELECT</b> into the <b>dbFields</b> variable.
                                                                                                                                                                                    <li>Set dbCanEdit, dbCanAdd, and dbCanDelete to 0.
                                                                                                                                                                                        <li>
                                                                                                                                                            Set Session("dbType") = "UDF"
                                                                                                                                                        </ol>
                                                                                                                                                        <p>
                                                                                                                                                            <b><em><font color="Green">Note!</font></em></b> If your query JOINs two or more
                                                                                                                                                            tables then Edits, Adds and Deletes should always be disabled. Attempting these
                                                                                                                                                            operations will most likely generate errors.
                                                                                                                                                            <p>
                                                                                                                                                                <b>Session("dbHeader") = 1</b><br>
                                                                                                                                                                Set this variable and modify the GenericHeader.asp file to include a standard footer
                                                                                                                                                                on each page. Note that the extension of the header file has changed recently from
                                                                                                                                                                .inc to .asp as a security precaution.
                                                                                                                                                                <p>
                                                                                                                                                                    <b>Session("dbKey") = 1</b><br>
                                                                                                                                                                    A unique key field, in this case it is the first field in the table (Field 1) or
                                                                                                                                                                    the [Employee ID] field. This should always be a Counter or Auto-Number field. Why?
                                                                                                                                                                    It is the only way to guarantee a unique identifier for each record. Auto-Numbers
                                                                                                                                                                    should be assigned randomly if possible (this is an option in Access 97).
                                                                                                                                                                    <p>
                                                                                                                                                                        If you don't have a Key field then set this value to 0, but you will not be able
                                                                                                                                                                        to Edit or View records from the lister since there is no guaranteed unique key
                                                                                                                                                                        to load the pages. Note that the Key field is not editable in the GenericEdit screen
                                                                                                                                                                        to encourage the use of Counters and Auto-Numbers.
                                                                                                                                                                        <p>
                                                                                                                                                                            <b>Session("dbMenuTextColor") = "Navy"</b> Change the colour of text in the menu
                                                                                                                                                                            tables including the page title, field names, etc. Defaults to black.
                                                                                                                                                                            <p>
                                                                                                                                                                                <b>Session("dbOnlyAdd") = 1</b><br>
                                                                                                                                                                                To skip the lister and drop the user straight in to add a new record, use this switch.
                                                                                                                                                                                Requires changing the last line in the Config File to:<br>
                                                                                                                                                                                <font color="Green">Response.Redirect Session("dbGenericPath") & "GenericEdit.asp?CMD=NEW"</font><br>
                                                                                                                                                                                <p>
                                                                                                                                                                                    <b>Session("dbOnlyEdit") = 1</b><br>
                                                                                                                                                                                    To skip the Lister and drop the user straight in to edit a record, use this switch.
                                                                                                                                                                                    The Key value of the record must be set in a Sessin var before the config file is
                                                                                                                                                                                    loaded, and the last line in the Config File must be changed to:<br>
                                                                                                                                                                                    <font color="Green">Response.Redirect Session("dbGenericPath") & "GenericEdit.asp?KEY="
                                                                                                                                                                                        & Trim(Session("myKeyValue"))</font>
                                                                                                                                                                                    <p>
                                                                                                                                                                                        <b>Session("dbOrder") = 2</b><br>
                                                                                                                                                                                        <p>
                                                                                                                                                                                            The field to sort the records by. In this case we've chosen the second field (Field
                                                                                                                                                                                            2) or [Last Name].
                                                                                                                                                                                            <p>
                                                                                                                                                                                                <b>Session("dbOrderBy") = "[Last Name] DESC, [First Name]"</b><br>
                                                                                                                                                                                                Sets an ORDER BY clause. dbOrderBy uses a full string to set sort order as opposed
                                                                                                                                                                                                to dbOrder which only takes a single field number to sort on. Note that dbOrder
                                                                                                                                                                                                has precedence, if you have both variables set, dbOrderBy will be ignored. See Session("dbGroupBy")
                                                                                                                                                                                                above for a great tip to form a relational query using both dbGroupBy and dbOrderBy.
                                                                                                                                                                                                <p>
                                                                                                                                                                                                    <b>Session("dbRecsPerPage") = 10</b><br>
                                                                                                                                                                                                    Sets the number of records to show per page and displays Previous and Next buttons
                                                                                                                                                                                                    for navigation.
                                                                                                                                                                                                    <p>
                                                                                                                                                                                                        <b>Session("dbRs") = "Employees"</b><br>
                                                                                                                                                                                                        The name of the table in the ODBC datasource.
                                                                                                                                                                                                        <p>
                                                                                                                                                                                                            <b>Session("dbSearchAdvanced") = 1</b><br>
                                                                                                                                                                                                            This setting adds an "Advanced Search" link where the user can specify a field-by-field
                                                                                                                                                                                                            search of the recordset, including whether to AND or OR the search terms. Currently
                                                                                                                                                                                                            this feature does not support numeric or date fields. The default is 0.
                                                                                                                                                                                                            <p>
                                                                                                                                                                                                                <b>Session("dbSearchEnhanced") = 1</b><br>
                                                                                                                                                                                                                This setting enhances the regular search box (see dbSearchFields) on the Lister
                                                                                                                                                                                                                screen. The new options which appear below the searhc box allow the user to specify
                                                                                                                                                                                                                whether to match "any of these words" (search words are OR'ed), or "exact phrase"
                                                                                                                                                                                                                (search words are treated as a single string).
                                                                                                                                                                                                                <p>
                                                                                                                                                                                                                    <b>Session("dbSearchFields") = "011100010010001000"</b><br>
                                                                                                                                                                                                                    When this variable exists, a Search box appears on the List page. The 0's and 1's
                                                                                                                                                                                                                    determine which fields are searched, and are limited to string and memo fields for
                                                                                                                                                                                                                    now (no dates, no numbers, no greater than or less than, just text).
                                                                                                                                                                                                                    <p>
                                                                                                                                                                                                                        <b>Session("dbStartRec") = 1</b><br>
                                                                                                                                                                                                                        Indicates which record to begin displaying at. Useful to force GenericDB to start
                                                                                                                                                                                                                        at 1, or if for some reason you want to start from the middle. GenericDB is "smart"
                                                                                                                                                                                                                        enough to begin at 1 each time you use a different recordset, but if you have two
                                                                                                                                                                                                                        Config Files for different views of the same recordset, you may need to force it
                                                                                                                                                                                                                        to begin at 1.
                                                                                                                                                                                                                        <p>
                                                                                                                                                                                                                            <b>Session("dbSubTable") = "Title, ConfigFile, LinkingField"</b><br>
                                                                                                                                                                                                                            <b>Session("dbSubTable") = "Access Log, tblAccessLog.asp, EmployeeID"</b><br>
                                                                                                                                                                                                                            Allows sub-tables. This example presumes a table exists wshich contains access logs.
                                                                                                                                                                                                                            The title <b><em><font color="Green">Access Log</font></em></b> will be the displayed
                                                                                                                                                                                                                            on a link beside each user listed in the Lister, <font color="Green"><b><em>tblAccessLog.asp</em></b></font>
                                                                                                                                                                                                                            will be the asp file (use the same format as any other Config File but <b><u>NO dbWhere
                                                                                                                                                                                                                                setting</u></b> and your <b>dbExitPage</b> points back to the main table's config
                                                                                                                                                                                                                            file), and <font color="Green"><em><b>EmployeeID</em></b></font> is the key field
                                                                                                                                                                                                                            used to set the relationship. <b>
                                                                                                                                                                                                                                <p>
                                                                                                                                                                                                                                Session("dbTitle") = "Northwinds Employee Table"</b><br>
                                                                                                                                                                                                                            This is where you set your page's title.
                                                                                                                                                                                                                            <p>
                                                                                                                                                                                                                                <b>Session("dbType") = "Access"</b><br>
                                                                                                                                                                                                                                Possible values: SQL, Access, or UDF. Default is Access.<br>
                                                                                                                                                                                                                                This declares the type of database driver used on the host. Microsoft Access allows
                                                                                                                                                                                                                                spaces in table and field names and therefore requires [brackets] around table and
                                                                                                                                                                                                                                field names to identify where the names start and stop. SQL hosts do not allow spaces
                                                                                                                                                                                                                                and therefore don't know anything about the use of brackets around field names.
                                                                                                                                                                                                                                <p>
                                                                                                                                                                                                                                    In GenericDB all queries are built using the brackets, and setting this switch to
                                                                                                                                                                                                                                    "SQL" will have it strip the brackets out using the Replace() function.
                                                                                                                                                                                                                                    <p>
                                                                                                                                                                                                                                        The "UDF" option should be set for any query which uses a JOIN, or where the brackets
                                                                                                                                                                                                                                        you specify yourself are not to be tampered with when GenericDB forms the query.
                                                                                                                                                                                                                                        Brackets are neither added nor stripped, the query is submitted "as is."
                                                                                                                                                                                                                                        <p>
                                                                                                                                                                                                                                            <b>Session("dbURLfor2") = 20</b><br>
                                                                                                                                                                                                                                            This setting displays a field as a link using the URL stored in another field. In
                                                                                                                                                                                                                                            this example, the 2nd field will be displayed as a link to the URL stored in field
                                                                                                                                                                                                                                            20, which might be the employee's Home Page.
                                                                                                                                                                                                                                            <p>
                                                                                                                                                                                                                                                <b>Session("dbViewPage") = Request.ServerVariables("PATH_INFO")</b><br>
                                                                                                                                                                                                                                                You won't normally need to change this one, it gets the name and location of the
                                                                                                                                                                                                                                                current file (our tblEmployees.asp) for use in making the links on the pages. If
                                                                                                                                                                                                                                                you don't want these settings to be reloaded whenever the user pressed Refresh,
                                                                                                                                                                                                                                                you might change this line to:
                                                                                                                                                                                                                                                <p>
                                                                                                                                                                                                                                                    Session("dbViewPage") = Session("dbGenericPath") &amp; "GenericList.aspx"
                                                                                                                                                                                                                                                    <p>
                                                                                                                                                                                                                                                        That would cut this tblEmployees.asp file out of the loop once the Generic interface
                                                                                                                                                                                                                                                        got rolling.
                                                                                                                                                                                                                                                        <p>
                                                                                                                                                                                                                                                            <b>Session("dbWhere") = ""</b><br>
                                                                                                                                                                                                                                                            A SQL Where clause. Leave it empty to display all records. If we only wanted to
                                                                                                                                                                                                                                                            view Employees whose titles begin with "Sales" we would set this as Session("dbWhere")
                                                                                                                                                                                                                                                            = "Title LIKE 'Sales%'"
                                                                                                                                                                                                                                                            <p>
                                                                                                                                                                                                                                                                <!--#include virtual="/Eli/EliFooter.inc"-->
</BODY>
</html>
