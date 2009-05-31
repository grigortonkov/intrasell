<%
' Generic Database - Config File Wizard 
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
'  16 May 1999 - Created
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE>GenericDB Config File Wizard - Page 1</TITLE>
</HEAD>

<BODY>
<HR NOSHADE>
<FONT Face="Arial, Helvetica">
<H2>GenericDB Configuration File Wizard - Page 1</H2>
<%
Session("dbGenericPath") = Request.ServerVariables("PATH_TRANSLATED")
Session("dbThisPage") = Request.ServerVariables("PATH_INFO")
%>
<FORM ACTION="GenericWizard2.asp" METHOD="POST">
<TABLE BGCOLOR="#99CCCC">
<TR>
	<TD ALIGN="RIGHT"><FONT COLOR="Red">** </FONT>Page Title:</TD>
	<TD><INPUT TYPE="Text" NAME="Title" SIZE="30" MAXLENGTH="80"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><FONT COLOR="Red">** </FONT>Exit Link URL:</TD>
	<TD><INPUT TYPE="Text" NAME="ExitPage" VALUE="http://" SIZE="30" MAXLENGTH="80"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Exit Link Text:</TD>
	<TD><INPUT TYPE="Text" NAME="ExitPageText" VALUE="Back" SIZE="30" MAXLENGTH="80"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Data Source Type:</TD>
	<TD ><SELECT NAME="dbType" SIZE="1">
		<OPTION SELECTED VALUE="ACCESS">MS-Access<OPTION VALUE="SQL">SQL<OPTION VALUE="UDF">Other ODBC</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><FONT COLOR="Red">** </FONT>Data Source Name (DSN):</TD>
	<TD><INPUT TYPE="Text" NAME="DSN" SIZE="30" MAXLENGTH="100"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">SELECT (Fields):</TD>
	<TD><INPUT TYPE="Text" NAME="Fields" VALUE="*" SIZE="30" MAXLENGTH="255"></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT"><FONT COLOR="Red">** </FONT>FROM (Recordset):</TD>
	<TD><INPUT TYPE="Text" NAME="Rs" VALUE="" SIZE="30" MAXLENGTH="255"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">WHERE (Condition):</TD>
	<TD><INPUT TYPE="Text" NAME="Where" VALUE="" SIZE="30" MAXLENGTH="60"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">GROUP BY:</TD>
	<TD><INPUT TYPE="Text" NAME="GroupBy" SIZE="30" MAXLENGTH="60"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">ORDER BY:</TD>
	<TD><INPUT TYPE="Text" NAME="OrderBy" SIZE="30" MAXLENGTH="60"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Allow New Records:</TD>
	<TD ><SELECT NAME="CanAdd" SIZE="1">
		<OPTION SELECTED VALUE="1">Yes<OPTION VALUE="0">No</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Allow Edits:</TD>
	<TD ><SELECT NAME="CanEdit" SIZE="1">
		<OPTION SELECTED VALUE="1">Yes<OPTION VALUE="0">No</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Allow Deletes:</TD>
	<TD ><SELECT NAME="CanDelete" SIZE="1">
		<OPTION SELECTED VALUE="1">Yes<OPTION VALUE="0">No</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Confirm Deletes:</TD>
	<TD ><SELECT NAME="ConfirmDelete" SIZE="1">
		<OPTION SELECTED VALUE="1">Yes<OPTION VALUE="0">No</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Extra Add Button:</TD>
	<TD ><SELECT NAME="ExtraAdd" SIZE="1">
		<OPTION VALUE="1">Yes<OPTION SELECTED VALUE="0">No</SELECT><BR>
		(Appears below the menu)
	</TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Debug Screen Available (dbInfo):</TD>
	<TD ><SELECT NAME="Debug" SIZE="1">
		<OPTION SELECTED VALUE="1">Yes<OPTION VALUE="0">No</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Records to Display per Page:</TD>
	<TD><INPUT TYPE="Text" NAME="RecsPerPage" VALUE="20" SIZE="30" MAXLENGTH="5"> <I>0=All</I><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Template File for Editing:</TD>
	<TD><INPUT TYPE="Text" NAME="EditTemplate" VALUE="" SIZE="30" MAXLENGTH="80"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Template File for Viewing:</TD>
	<TD><INPUT TYPE="Text" NAME="ViewTemplate" VALUE="" SIZE="30" MAXLENGTH="80"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Base Font:</TD>
	<TD><INPUT TYPE="Text" NAME="Font" VALUE="Arial, Helvetica" SIZE="30" MAXLENGTH="32"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Base Font Size:</TD>
	<TD ><SELECT NAME="FontSize" SIZE="1">
		<OPTION VALUE="0">0
		<OPTION VALUE="1">1
		<OPTION SELECTED VALUE="2">2
		<OPTION VALUE="3">3
		<OPTION VALUE="4">4
		</SELECT><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Border Colour:</TD>
	<TD><INPUT TYPE="Text" NAME="BorderColor" VALUE="#99CCCC" SIZE="30" MAXLENGTH="32"><BR></TD>
</TR>
<TR>
	<TD ALIGN="RIGHT">Menu Colour:</TD>
	<TD><INPUT TYPE="Text" NAME="MenuColor" VALUE="#99CCCC" SIZE="30" MAXLENGTH="32"><BR></TD>
</TR>
<!-- <TR>
	<TD ALIGN="RIGHT">:</TD>
	<TD><INPUT TYPE="Text" NAME="" VALUE="" SIZE="30" MAXLENGTH="32"><BR></TD>
</TR>
 -->
 <TR>
	<TD ALIGN="CENTER" COLSPAN=2><INPUT TYPE="Submit" VALUE="Next Page"></TD>
</TR>

</TABLE>
<FONT COLOR="Red">**</FONT> Indicates a <STRONG><EM>required</EM></STRONG> value.<BR>
</FORM>
<HR NOSHADE>
</FONT>

</BODY>
</HTML>
