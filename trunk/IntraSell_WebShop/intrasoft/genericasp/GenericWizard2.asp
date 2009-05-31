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
set xConn = Server.CreateObject("ADODB.Connection")
xConn.Open strConn

' Open Recordset and get the field info
strsql = "SELECT " & Fields & " FROM [" & Rs & "]"
Select Case dbType
	Case "UDF" 
		strsql = "SELECT " & Fields & " FROM " & Rs
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
End Select
set xrs = Server.CreateObject("ADODB.Recordset")

xrs.Open strsql, xConn
intFieldCount = xrs.Fields.Count
Dim aFields(), aFieldNames(), aFieldDispList(), aFieldDispView(), aFieldDispEdit()
ReDim aFields(intFieldCount,3)
ReDim aFieldNames(intFieldCount)
ReDim aFieldDefault(intFieldCount)
ReDim aFieldDispList(intFieldCount)
ReDim aFieldDispView(intFieldCount)
ReDim aFieldDispEdit(intFieldCount)
For x = 1 to intFieldCount
	aFields(x, 1) = xrs.Fields(x-1).Name 
	aFields(x, 2) = xrs.Fields(x-1).Type 
	aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
	aFieldNames(x-1) = aFields(x,1)
	aFieldDispList(x-1) = 0
	aFieldDispView(x-1) = 0	
	aFieldDispEdit(x-1) = 0	
Next 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<HTML>
<HEAD>
	<TITLE><%=Title%></TITLE>
</HEAD>
<BODY>
<FONT SIZE="<%=FontSize%>" FACE="<%=Font%>">
<H2>GenericDB Configuration File Wizard - Page 2</H2>

<FORM ACTION="GenericWizard3.asp" METHOD="POST">
<TABLE CELLPADDING=1 CELLSPACING=0 BORDER=0 BGCOLOR=<%=BorderColor%>>
<TR><TD>
<TABLE CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100% BGCOLOR=<%=MenuColor%>>
<TR><TD COLSPAN=8 ALIGN=CENTER BGCOLOR=<%=MenuColor%>><FONT SIZE=<%=FontSize%> FACE="<%=Font%>"><STRONG>- <%= Rs %> -</STRONG></TD></TR>
<TR>
	<TH></TH>
	<TH></TH>
	<TH></TH>
	<TH></TH>
	<TH COLSPAN=3 BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Display In</TH>
	<TH></TH>
</TR>
<TR>
	<TH><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">#</TH>
	<TH><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Field</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Display<BR>As</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Default Value</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Primary<BR>Key</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Lister</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Viewer</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Editor</TH>
	<TH BGCOLOR="White"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">Searchable</TH>
</TR>
<% For x = 1 to intFieldCount
	If x mod 2 = 0 Then
		bgcolor="#FFFFCC"
	Else
		bgcolor="White"
	End If %>
<TR>
	<TD HEIGHT=0 BGCOLOR=<%= bgcolor %> ALIGN="LEFT"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>"><%=x %></TD>
<% 			aFields(x, 1) = xrs.Fields(x-1).Name %></TD>
	<TD HEIGHT=0 BGCOLOR=<%= bgcolor %> ALIGN="LEFT">
		<FONT SIZE=<%=FontSize%> FACE="<%=Font%>"><%=aFields(x, 1)%></TD>
<%			aFields(x, 2) = xrs.Fields(x-1).Type %></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="LEFT"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
			<INPUT TYPE="Text" NAME="Desc<%=x%>" VALUE="<%=aFieldNames(x-1)%>" SIZE="20" MAXLENGTH="40">
		</FONT></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="LEFT"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
<%	' Defaults
	Select Case aFields(x,2)
		Case 2, 3, 6	' 2 Byte Integer, 4 Byte Integer, Currency %>
			<INPUT TYPE="Text" NAME="Default<%=x%>" VALUE="0" SIZE="20" MAXLENGTH="40">
<%		Case 11 	' Boolean True/False %>
			<SELECT NAME="Default<%=x%>" SIZE="1"><OPTION VALUE="'Yes'">Yes<OPTION SELECTED VALUE="'No'">No</SELECT>
<%		Case 135	' Date / Time Stamp, usually created with the Now() function %>
			<INPUT TYPE="Text" NAME="Default<%=x%>" VALUE="" SIZE="20" MAXLENGTH="40">
<%		Case 200, 201	' String or Memo %>
			<INPUT TYPE="Text" NAME="Default<%=x%>" VALUE="''" SIZE="20" MAXLENGTH="40">
<%	End Select %>
		</FONT></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="CENTER"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
			<INPUT TYPE="Radio" Value=<%= x %> NAME="Key">
		</FONT></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="CENTER"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
		<INPUT TYPE="Checkbox" NAME="DispList<%= x %>" VALUE="On">
		</FONT></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="CENTER"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
		<INPUT TYPE="Checkbox" CHECKED NAME="DispView<%= x %>" VALUE="On">
		</FONT></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="CENTER"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
		<INPUT TYPE="Checkbox" CHECKED NAME="DispEdit<%= x %>" VALUE="On">
		</FONT></TD>
	<TD BGCOLOR=<%= bgcolor %> ALIGN="CENTER"><FONT SIZE=<%=FontSize%> FACE="<%=Font%>">
		<% If aFields(x,2) = 200  OR (aFields(x,2) = 201) Then %>
			<INPUT TYPE="Checkbox" CHECKED NAME="Searchable<%= x %>" VALUE="On">
		<% Else %>
			<INPUT TYPE="Hidden" NAME="Searchable<%=x%>" VALUE="Off">No
		<% End If %>
		</FONT></TD>
</TR>
<% Next
xrs.Close
Set xrs = Nothing
xConn.Close
Set xConn = Nothing
%>
<TR>
	<TD ALIGN="CENTER" COLSPAN=8>
		<INPUT TYPE="Submit" VALUE="Next Page">
	</TD>
</TR>
</TABLE></TD></TR></TABLE>
<P>
</FORM>
<HR NOSHADE>
</FONT>
</BODY>
</HTML>
