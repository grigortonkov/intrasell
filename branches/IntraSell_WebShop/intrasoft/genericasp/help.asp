<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>GenericDB - Help</TITLE>
</HEAD>

<!-- <BODY> -->
<!--#include virtual="/eli/asp/header-sm.asp"-->

<P>
<FONT COLOR="Navy"><H3>GenericDB Help - Jump to:</H3></FONT>
<P>
<li><A HREF="help.asp">The Config File</A>
<li><A HREF="#quickref">Quick Reference</A>
<li><A HREF="#ref">Unabridged Reference</A> (with explanations)
<li>Click <a href="GDBHelp.pdf">here</a> to download this Help reference in Adobe Acrobat format.

<P>
<FONT COLOR="Navy"><H3>The Config File</H3></FONT>
<P>
The Config File is your interface to GenericDB. It contains the settings which guide how GenericDB displays your data. This is a minimal Config File, see the Reference sections below for syntax and explanations:

<BLOCKQUOTE><P>
<FONT COLOR="Green" SIZE=-1>&lt;%<BR>
	' Minimal interface to the Northwinds Employee table. <BR>
	Session("dbGenericPath") = "/Eli/ASP/"<BR>
	Session("dbExitPage") = "http://www.ofifc.org/Eli/ASP/GenericArticle.asp"<BR>
	Session("dbTitle") = "Northwinds Employee Table"<BR>
	Session("dbConn") = "dbEli"<BR>
	Session("dbRs") = "Employees"<BR>
	Session("dbKey") = 1<BR>
	Session("dbDispList") = "011101000000100010"<BR>
	Session("dbViewPage") = Request.ServerVariables("PATH_INFO")<BR>
	Response.Redirect Session("dbGenericPath") & "GenericList.asp"<BR>
%&gt;</FONT>
<P></BLOCKQUOTE>

<A NAME="quickref"><P></A>
<FONT COLOR="Navy"><H3>Quick Reference</H3></FONT>
<P>
<em><font size="-1"><font color="Red">**</font> Denotes a new or updated feature.</font></em>
<TABLE BORDER=3>
<TR>
	<TH>Setting</TH>
	<TH>Description</TH>
</TR>
<!-- 
<tr>
	<td><font color="Red">**</font> Session("") = </td>
	<td>()</td>
</tr>
 -->
<tr>
	<td><font color="Red">**</font> Session("dbBodyTag") = "VLINK=#CC9999 ALINK=#CC9999 LINK=#CC9999"</td>
	<td>(build a custom body tag)</td>
</tr>
<TR>
	<TD>Session("dbBorderColor") = "Navy"
	<TD>(colour to display table borders, defaults to #99CCCC.)</TD>
</TR>
<TR>
	<TD>Session("dbCanAdd") = 0</TD>
	<TD>(or 1, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbCanDelete") = 0
	<TD>(or 1, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbCanEdit") = 0</TD>
	<TD>(or 1, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbCombo<xx>") = "LIST, value1, desc1, value2, desc2,..." </TD>
	<TD>(values to store and descriptions to display in a pull-down/combo box)</TD>
</TR>
<TR>
	<TD>Session("dbCombo&lt;x>") = "TABLE, tablename, RowForVal, RowForDesc, BlankVal, BlankDesc, WhereClause"</TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>Session("dbConfirmDelete") = 0</TD>
	<TD>(or 1, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbConn") = "myDSN"</TD>
	<TD>(Data Source Name or DSN connection)</TD>
</TR>
<TR>
	<TD>Session("dbDebug") = 0</TD>
	<TD>(or 1, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbDefault&lt;x>") = &lt;value> </TD>
	<TD>(default value for field x, use any value appropriate for the field)</TD>
</TR>
<TR>
	<TD>Session("dbDispEdit") = "0211" </TD>
	<TD>(field display settings for the edit screen. 2=Read-only, 1=Read/write, 0=Do not display. In the example, field 1 is not displayed, 2 is read-only, and 3 and 4 are editable.)</TD>
</TR>
<TR>
	<TD>Session("dbDispList") = "011101" </TD>
	<TD>(1's or 0's representing whether each field will/won't be displayed)</TD>
</TR>
<tr>
	<td><font color="Red">**</font> Session("dbDispNew") = "10010"</td>
	<td>(controls which fields are displayed when editing a new record, defaults to the value of dbDispEdit.)</td>
</tr>
<TR>
	<TD>Session("dbDispView") = "011101" </TD>
	<TD>(1's or 0's representing whether each field will/won't be displayed)</TD>
</TR>
<TR>
	<TD>Session("dbEditTemplate") = "tblEmployeesEdit.htm" </TD>
	<TD>(The Custom Edit Template file, to be found in the same directory as the Config File.)</TD>
</TR>
<TR>
	<TD>Session("dbEMailFor3") = 4</TD>
	<TD>(display field 3 as a link to the E-mail address stored in field 4)</TD>
</TR>
<TR>
	<TD>Session("dbExitPage") = "http://www.home.com/myhomepage.htm"</TD>
	<TD>(URL of the page to exit to)</TD>
</TR>
<TR>
	<TD>Session("dbExitPageText") = "Back to Main Menu"</TD>
	<TD>(text for the Exit link, defaults to "Back")</TD>
</TR>
<TR>
	<TD>Session("dbFields") = "field1, field2, field3" </TD>
	<TD>(SELECT clause or Field List, defaults to all fields)</TD>
</TR>
<TR>
	<TD>Session("dbFieldNames") = "field1, field2, ..." </TD>
	<TD>(defaults to actual Field Names, can customize here)</TD>
</TR>
<TR>
	<TD>Session("dbFont") = "Times New Roman" </TD>
	<TD>(font list, defaults to "Verdana, Arial, Helvetica")</TD>
</TR>
<TR>
	<TD>Session("dbFontSize") = 2</TD>
	<TD>(0 to 4, defaults to 2)</TD>
</TR>
<TR>
	<TD>Session("dbFooter") = 0</TD>
	<TD>(or 1, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbGenericPath") = "/mypath/" </TD>
	<TD>(relative path to the GenericDB files)<BR></TD>
</TR>
<TR>
	<TD>Session("dbGroupBy") = "field list" </TD>
	<TD>(a GROUP BY clause for SQL queries)</TD>
</TR>
<TR>
	<TD>Session("dbHaving") = "Count(myField) > 1" </TD>
	<TD>(a HAVING clause for SQL queries)</TD>
</TR>
<tr>
	<td><font color="Red">**</font> Session("dbHeader") = 1</td>
	<td>(displays the contents of GenericHeader.asp as a header on each page, default is 0.)</td>
</tr>
<TR>
	<TD>Session("dbHidePageNumbers") = 1</TD>
	<TD>(suppresses Page Numbers, defaults to 0)</TD>
</TR>
<TR>
	<TD>Session("dbKey") = 1</TD>
	<TD>(field number to use as the Key field, usually an Autonumber field)</TD>
</TR>
<TR>
	<TD>Session("dbMenuColor") = "Navy" </TD>
	<TD>(Colour to display menus, defaults to #99CCCC.)</TD>
</TR>
<tr>
	<td><font color="Red">**</font> Session("dbMenuTextColor") = "Navy"</td>
	<td>(change the color of menu text and links, default is black.</td>
</tr>
<tr>
	<td><font color="Red">**</font> Session("dbOnlyAdd") = 1</td>
	<td>(returns to the dbExitPage after submitting the record, default is 0. See detailed notes below.)</td>
</tr>
<tr>
	<td><font color="Red">**</font> Session("dbOnlyEdit") = 1</td>
	<td>(returns to the dbExitPage after editing the record, sefault is 0. See detailed notes below.)</td>
</tr>
<TR>
	<TD>Session("dbOrder") = 2</TD>
	<TD>(field number to sort by, make it negative to do the reverse sort)</TD>
</TR>
<TR>
	<TD>Session("dbOrderBy") = "field1 DESC, field2 ASC, etc." </TD>
	<TD>(ORDER by clause)</TD>
</TR>
<TR>
	<TD>Session("dbRecsPerPage") = 15</TD>
	<TD>(number to display per page, default is all)</TD>
</TR>
<TR>
	<TD>Session("dbRequiredFields") = "011101" </TD>
	<TD>(1's or 0's representing whether a red <font color="Red">*</font> is displayed beside each field. Does not validate data, just displays the star.)</TD>
</TR>
<TR>
	<TD>Session("dbRs") = "mytable"</TD>
	<TD>(A table name or FROM clause)</TD>
</TR>
<tr>
	<td><font color="Red">**</font> Session("dbSearchAdvanced") = 1</td>
	<td>(activates an Advanced Search link which helps the user with a field-by-field search, default is 0.)</td>
</tr>
<tr>
	<td><font color="Red">**</font> Session("dbSearchEnhanced") = 1</td>
	<td>(adds option below the regular search box for a user to search "any of these words" or "exact phrase", defaults to 0.)</td>
</tr>
<TR>
	<TD>Session("dbSearchFields") = "011101" </TD>
	<TD>(1's or 0's representing whether each field will/won't be searched. Note: Only string and memo fields are searchable.)</TD>
</TR>
<TR>
	<TD>Session("dbSearchPos") = "TOP" </TD>
	<TD>(Position of the Search box, "top" or "bottom", defaults to bottom.)</TD>
</TR>
<TR>
	<TD>Session("dbStartRec") = 51</TD>
	<TD>(a record number to start the display at, default is 1)</TD>
</TR>
<TR>
	<TD>Session("dbSubTable") = "Title, ConfigFile, LinkingField"</TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>Session("dbTitle") = "My Page Title"</TD>
	<TD>&nbsp;</TD>
</TR>
<TR>
	<TD>Session("dbTotalFields") = "00101" </TD>
	<TD>(Totals the specified fields at the bottom of each page, in this case fields 3 and 5.)</TD>
</TR>
<TR>
	<TD>Session("dbType") = "Access" </TD>
	<TD>(or SQL or UDF, defaults to Access)</TD>
</TR>
<TR>
	<TD>ession("dbUpdateField&lt;x>") = &lt;value> </TD>
	<TD>(After updating a record, field x will be set to this value.)</TD>
</TR>
<TR>
	<TD>Session("dbURLfor3") = 4</TD>
	<TD>(display field 3 as a link to the URL stored in field 4)</TD>
</TR>
<TR>
	<TD>Session("dbViewPage") = Request.ServerVariables("PATH_INFO")</TD>
	<TD>(DO NOT CHANGE)</TD>
</TR>
<TR>
	<TD>Session("dbViewTemplate") = "tblEmployeesView.htm" </TD>
	<TD>(The Custom View Template file, to be found in the same directory as the Config File.)</TD>
</TR>
<TR>
	<TD>Session("dbWhere") = "fruit='apples'" </TD>
	<TD>(a WHERE clause)</TD>
</TR>
</TABLE>
<BR>
<BR>

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


<A NAME="ref"><P></A>
<FONT COLOR="Navy"><H3>Unabridged Reference</H3></FONT>
<P>

<p><b>Session("dbBodyTag") = "VLINK=#CC9999 ALINK=#CC9999 LINK=#CC9999"</b><br>
Define a custom body tag, including BACKGROUND, BGCOLOR, LINK colour tags (as above), and more. Often, single quotes are allowed around tags:
Session("dbBodyTag") = "BACKGROUND='MYGIF.GIF' BGCOLOR='white'"
<p>
If you have trouble with this, spend a couple lines at the beginning of your config file building the body tag string of your dreams:<br><font color="Green">
QUOTE = chr(34)<br>
txtBodyTag = "BACKGROUND=" & QUOTE & "MYGIF.GIF" & QUOTE & " BGCOLOR=" & QUOTE & "WHITE" & QUOTE<br>
</font>
and set:
<font color="Green">Session("dbBodyTag") = txtBodyTag</font><br>

<p><b>Session("dbBorderColor") = "Navy"</b><br>
Change the colour of the menu borders.

<P><b>Session("dbCanAdd") = 1</b><BR>
Can the user add a record? 1 means yes, 0 means no. 

<P><b>Session("dbCanDelete") = 1</b><BR>
Can the user delete records? 1 means yes, 0 means no. 

<P><b>Session("dbCanEdit") = 1</b><BR>
Can the user edit records? 1 means yes, 0 means no. 

<p>
<b>Session("dbCombo<xx>") = "LIST, &lt;value1>, &lt;desc1> [, &lt;value2>, &lt;desc2>]"</b><BR>
<b>Example 1: Session("dbCombo11") = "LIST, ??, Unknown, CA, Canada, US, United States, DE, Denmark"</b><BR>
OR<BR>
<b>Session("dbCombo<xx>") = "TABLE, &lt;tablename>, &lt;RowForVal>, &lt;RowForDesc>, &lt;BlankVal>, &lt;BlankDesc>, &lt;WhereClause> "</b><BR>
<b>Example 2: Session("dbCombo3") = "TABLE, tlkpProvince, 1, 2, ??, Unknown, Country='Canada'"</b><BR>
Display a "pull-down" combo box to edit a field. Options will be drawn from either a list or a lookup table. Example 1 makes field eleven a combo box (hence dbCombo11) taking values from a list. Example 2 works on field three (dbCombo3) taking values from a table.<BR>
<li>LIST: The rest of the line is a list of paired values (like Canada, CA). The first of the pair is the value actually stored in the table, the second shows up on the screen in the pull-down.
<li>TABLE: Parameters passed are the table name (which must be in the same database/connection/DSN as the table currently being displayed), the number of the field/row which contains the value you want stored, the number of the field/row which contains the text to display, the value to store when the field is blank, and the value to display when the field is blank. The final parameter is an optional WHERE clause (Country='Canada' in Example 2 above). If you include a WHERE clause it cannot contain commas.

<P><b>Session("dbConfirmDelete") = 1</b><BR>
0 = Don't confirm (default), 1 = Confirm deletions. A screen will be presented to the user to confirm that the record should be deleted. 

<B><P>Session("dbConn") = "dsnNorthwinds"</B><BR>
The name of the ODBC System data source name (DSN) as it's set up on your server.
If your data source requires a username and password, this string should have the
following format: <BR>
"DSN=dbEli;UID=sa;Password=mypass"
<P>
If you have an Access database without a DSN you can create a <b>DSN-less</b> connection
by using a string with the following format: <BR>
"DRIVER={Microsoft Access Driver (*.mdb)}; DBQ=c:\database\mydata.mdb" 
<P>

<B><P>Session("dbDebug") = 1</B><BR>
This value of 1 or 0 decides whether the link to the dbInfo page is shown. Once you're done setting up the field display lists you will probably want to change this to 0. 

<P>
<b>Session("dbDefault6") = Date()</b><BR>
<b>Session("dbDefault11") = "Canada"</b><BR>
Use this format to set defaults for new records. The first example sets field 6's default value to Date(). In the tblEmployees.asp example this sets HireDate to today's date. The second sets the default value of field 11 (Country) to Canada.

<P><b>Session("dbDispEdit") = "011111111111111111"</b><BR>
Sets which fields appear on the Edit page. Same format as dbDispList and dpDispView.

<P><b>Session("dbDispList") = "0111010000001000"</b><BR>
This string of 1's and 0's decides which fields will be shown on the Lister page. 1 means show, 0 means don't show. In this case we're displaying fields 2, 3, 4, 6, and 13 as shown by the positions of the 1's. The best way to construct this string is to start it off with "11111", save it, open the Lister in your browser, head to the dbInfo page and read off the field list as you type the 1's and 0's into your editor. 

<P><b>Session("dbDispNew") = "0111010111110111"</b><BR>
Sets which fields appear on the Edit screen when a new record is being created. If this is not set, the fields displayed will default to those set in dbDispEdit. 

<P><b>Session("dbDispView") = "1111111111111111"</b><BR>
This string of 1's and 0's decides which fields will be shown on the Viewer page. It is formed the same way as Session("dbDispList"), above. Leaving it blank (Session("dbDispView") = "") will prevent the View links from being displayed.

<p><b>Session("dbEMailFor3") = 4</b>
This setting displays a field as a link (in this case, field 3) using the E-mail address stored in another field (in this case, field 4). If field 3 contains "Eli" and field 4 contains "erobillard@ofifc.org" this would display as: <a href="mailto:erobillard@ofifc.org">Eli</a>.

<P><b>Session("dbEMailFor4") = 5</b><BR>
This setting displays a field as a link using the E-Mail address stored in another field. In this example, the 4th field (possibly the employee's name) will be displayed as a link to the URL stored in field 5 (the employee's E-mail address). 

<P><b>Session("dbExitPage") = "http://www.ofifc.org/Eli/"</b><BR>
Each page has an "Exit" link and this is where you decide what page that link goes to. 

<P><b>Session("dbFields") = "EmployeeID, Title, UserLevel, ParkingPass"</b><BR>
Sets the list of fields to display. That's right, you're no longer limited to selecting all the fields. See the dbGroupBy setting below for a tip on how to use this to build complex queries.

<P><b>Session("dbFieldNames") = "&lt;field1>[, &lt;field2>, &lt;field3>, ...]"</b><BR>
<b>Session("dbFieldNames") = "EmployeeID, Last Name, First Name, Title"</b><BR>
Set field names to use when displaying the data instead of the raw field names from the database. 

<P><b>Session("dbFont") = "Arial, Helvetica"</b><BR>
Set the font used by GenericDB. <BR>

<P><b>Session("dbFontSize") = 2</b><br>
Set the font size used to display data. 

<P><b>Session("dbFooter") = 1</b><BR>
Set this variable and modify the GenericFooter.asp file to include a standard footer on each page. Note that the extension of the footer file has changed from .inc to .asp in recent versions as a security precaution. 

<P><B>Session("dbGenericPath") = "/Eli/ASP/"</B><BR>
The relative path of your Generic Database files (GenericList.asp, GenericEdit.asp, etc.) This path is used to build the links on the pages.

<P><b>Session("dbGroupBy") = ""</b><br>
Sets a GROUP BY clause.
<p>
<b><EM><FONT COLOR="Green">Tip!</FONT></EM></b> To execute a relational query (great for building reports)
	<OL>
		<LI>Build a SQL query in any SQL Query Editor. In Access, build your relational query in design mode and then select the SQL view. 
		<LI>Copy everything after <b>GROUP BY</b> into the <b>dbGroupBy</b> variable
		<LI>Copy the text after <b>ORDER BY</b> into the <b>dbOrderBy</b> variable.
		<LI>Copy the text after <b>WHERE</b> into the <b>dbWhere</b> variable.
		<LI>Copy the text after <b>FROM</b> into the <b>dbRs</b> variable.
		<LI>Copy the text after <b>SELECT</b> into the <b>dbFields</b> variable.
		<LI>Set dbCanEdit, dbCanAdd, and dbCanDelete to 0. 
		<LI>Set Session("dbType") = "UDF"
	</OL>
<p><b><EM><FONT COLOR="Green">Note!</FONT></EM></b> If your query JOINs two or more tables then Edits, Adds and Deletes should always be disabled. Attempting these operations will most likely generate errors.

<p><b>Session("dbHeader") = 1</b><br>
Set this variable and modify the GenericHeader.asp file to include a standard footer on each page. Note that the extension of the header file has changed recently from .inc to .asp as a security precaution. 

<p><B>Session("dbKey") = 1</B><BR>
A unique key field, in this case it is the first field in the table (Field 1) or the [Employee ID] field. This should always be a Counter or Auto-Number field. Why? It is the only way to guarantee a unique identifier for each record. Auto-Numbers should be assigned randomly if possible (this is an option in Access 97). 
<P>
If you don't have a Key field then set this value to 0, but you will not be able to Edit or View records from the lister since there is no guaranteed unique key to load the pages. Note that the Key field is not editable in the GenericEdit screen to encourage the use of Counters and Auto-Numbers. 

<p><b>Session("dbMenuTextColor") = "Navy"</b>
Change the colour of text in the menu tables including the page title, field names, etc. Defaults to black.

<p><b>Session("dbOnlyAdd") = 1</b><br>
To skip the lister and drop the user straight in to add a new record, use this switch. Requires changing the last line in the Config File to:<br>
<font color="Green">Response.Redirect Session("dbGenericPath") & "GenericEdit.asp?CMD=NEW"</font><br>

<p><b>Session("dbOnlyEdit") = 1</b><br>
To skip the Lister and drop the user straight in to edit a record, use this switch. The Key value of the record must be set in a Sessin var before the config file is loaded, and the last line in the Config File must be changed to:<br>
<font color="Green">Response.Redirect Session("dbGenericPath") & "GenericEdit.asp?KEY=" & Trim(Session("myKeyValue"))</font>

<P><b>Session("dbOrder") = 2</b><br>
<P>The field to sort the records by. In this case we've chosen the second field (Field 2) or [Last Name]. 

<P><b>Session("dbOrderBy") = "[Last Name] DESC, [First Name]"</b><br>
Sets an ORDER BY clause. dbOrderBy uses a full string to set sort order as opposed to dbOrder which only takes a single field number to sort on. Note that dbOrder has precedence, if you have both variables set, dbOrderBy will be ignored. See Session("dbGroupBy") above for a great tip to form a relational query using both dbGroupBy and dbOrderBy. 

<P><b>Session("dbRecsPerPage") = 10</b><BR>
Sets the number of records to show per page and displays Previous and  Next buttons for navigation.

<P><B>Session("dbRs") = "Employees"</B><BR>
The name of the table in the ODBC datasource. 

<p><b>Session("dbSearchAdvanced") = 1</b><br>
This setting adds an "Advanced Search" link where the user can specify a field-by-field search of the recordset, including whether to AND or OR the search terms. Currently this feature does not support numeric or date fields. The default is 0.

<p><b>Session("dbSearchEnhanced") = 1</b><br>
This setting enhances the regular search box (see dbSearchFields) on the Lister screen. The new options which appear below the searhc box allow the user to specify whether to match "any of these words" (search words are OR'ed), or "exact phrase" (search words are treated as a single string). 

<P><b>Session("dbSearchFields") = "011100010010001000"</b><BR>
When this variable exists, a Search box appears on the List page. The 0's and 1's determine which fields are searched, and are limited to string and memo fields for now (no dates, no numbers, no greater than or less than, just text). 

<P><b>Session("dbStartRec") = 1</b><BR>
Indicates which record to begin displaying at. Useful to force GenericDB to start at 1, or if for some reason you want to start from the middle. GenericDB is "smart" enough to begin at 1 each time you use a different recordset, but if you have two Config Files for different views of the same recordset, you may need to force it to begin at 1. 
	
<P><b>Session("dbSubTable") = "Title, ConfigFile, LinkingField"</b><BR>
<b>Session("dbSubTable") = "Access Log, tblAccessLog.asp, EmployeeID"</b><BR>

Allows sub-tables. This example presumes a table exists wshich contains access logs. The title <b><EM><FONT COLOR="Green">Access Log</FONT></EM></b> will be the displayed on a link beside each user listed in the Lister, <FONT COLOR="Green"><b><EM>tblAccessLog.asp</EM></b></FONT> will be the asp file (use the same format as any other Config File but <b><U>NO dbWhere setting</U></b> and your <b>dbExitPage</b> points back to the main table's config file), and <FONT COLOR="Green"><EM><b>EmployeeID</EM></b></FONT> is the key field used to set the relationship. 
	
<B><P>Session("dbTitle") = "Northwinds Employee Table"</B><BR>
This is where you set your page's title. 

<P><b>Session("dbType") = "Access"</b><br>
Possible values: SQL, Access, or UDF. Default is Access.<BR>
This declares the type of database driver used on the host. Microsoft Access allows spaces in table
and field names and therefore requires [brackets] around table and field names to identify where the
names start and stop. SQL hosts do not allow spaces and therefore don't know anything about the 
use of brackets around field names. 
<P>
In GenericDB all queries are built using the brackets, and setting this switch to "SQL" will have
it strip the brackets out using the Replace() function. 
<p>
The "UDF" option should be set for any query which uses a JOIN, or where the brackets you specify yourself are not to be tampered with when GenericDB forms the query. Brackets are neither added nor stripped, the query is submitted "as is."

<P><b>Session("dbURLfor2") = 20</b><BR>
This setting displays a field as a link using the URL stored in another field. In this example, the 2nd field will be displayed as a link to the URL stored in field 20, which might be the employee's Home Page. 

<P><b>Session("dbViewPage") = Request.ServerVariables("PATH_INFO")</b><BR>
You won't normally need to change this one, it gets the name and location of the current file (our tblEmployees.asp) for use in making the links on the pages. If you don't want these settings to be reloaded whenever the user pressed Refresh, you might change this line to: 
<P>Session("dbViewPage") = Session("dbGenericPath") &amp; "GenericList.asp"
<P>That would cut this tblEmployees.asp file out of the loop once the Generic interface got rolling. 

<P><B>Session("dbWhere") = ""</B><BR>
A SQL Where clause. Leave it empty to display all records. If we only wanted to view Employees whose titles begin with "Sales" we would set this as Session("dbWhere") = "Title LIKE 'Sales%'"

<P>
<!--#include virtual="/Eli/EliFooter.inc"-->
</BODY>
</HTML>
