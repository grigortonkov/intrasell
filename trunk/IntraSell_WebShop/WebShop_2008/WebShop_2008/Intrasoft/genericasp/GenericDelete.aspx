<!--#include virtual="/intrasoft/menu.aspx"-->
<!--#include file="GenericLanguage.aspx" -->
<% 
' Generic Database - Delete Record
' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
' E-Mail: erobillard@ofifc.org
' URL: http://www.ofifc.org/Eli/ASP/
' Revision History:
' 29 Feb 2000 - Preparation for release
'				Fix to caching
'  9 Sep 1998 - First created or released
Dim arrSubTable
Dim curVal as String 

' Prevent caching
Response.Buffer = True
'Response.ExpiresAbsolute = Now() - 1
Response.AddHeader ("cache-control", "must-revalidate")
Response.AddHeader ("cache-control", "private")
Response.AddHeader ("pragma", "no-cache")

' Check for an active session
If Session("dbConn") = "" Then
	Response.Clear
	Response.Redirect ("GenericError.aspx")
End If

' Check user rights
If Session("dbCanDelete") <> 1 Then
	Response.Clear
	Response.Redirect (Session("dbViewPage"))
End If

' Get info from Session vars (kinda like parameters)
strType = UCase(Session("dbType"))
strConn = Session("dbConn")
strFields = Session("dbFields")
strTable = Session("dbRs")
strDisplay = Session("dbDispView")
strKeyField = Session("dbKey")
strFont = Session("dbFont")
intFontSize = Session("dbFontSize")
strBorderColor = Session("dbBorderColor")
strMenuColor = Session("dbMenuColor")
strMenuTextColor = Session("dbMenuTextColor")
dim intConfirmDelete = Session("dbConfirmDelete")

if strFields = "" Then strFields = "*"

' If we don't get passed a key to delete or there's no unique key field defined then get out.
'Response.write (strKeyField & Request.QueryString("KEY") Is Nothing) : Response.End
If (Request.QueryString("KEY") is Nothing) OR (strKeyField = "") Then
	Response.Clear
	Response.Redirect  (Session("dbViewPage"))
Else
	strKey = Request.QueryString("KEY")
	Session("dbcurKey") = strKey
End If

Dim DoConfirm as Boolean = True
If Not Request.QueryString("CMD") is Nothing Then
	' See if we need to confirm the deletion
	strCMD = Request.QueryString("CMD")
	If strCMD = "'CON'" Then DoConfirm = False
End If

' Open Connection to the database
xConn = Server.CreateObject("ADODB.Connection")
xConn.Open (strConn)

' Open Recordset and get the field info
strsql = "SELECT " & strFields & " FROM [" & strTable & "]"
Select Case strType
	Case "UDF" 
		strsql = "SELECT " & strFields & " FROM " & strTable
	Case "SQL" 
		strsql = Replace(strsql,"[","")
		strsql = Replace(strsql,"]","")
	Case "MYSQL" 
		strsql = Replace(strsql,"[","`")
		strsql = Replace(strsql,"]","`")
End Select
xrs = Server.CreateObject("ADODB.Recordset")
xrs.Open (strsql, xConn, 1, 2)
intFieldCount = xrs.Fields.Count
Dim aFields(,)
ReDim aFields(intFieldCount,4)
Dim x as integer
For x = 1 to intFieldCount
	aFields(x, 1) = xrs.Fields(x-1).Name 
	aFields(x, 2) = xrs.Fields(x-1).Type 
	aFields(x, 3) = xrs.Fields(x-1).DefinedSize 
Next 

xrs.Close
strsql = "SELECT " & strFields & " FROM [" & strTable & "]" & " WHERE [" & aFields(strKeyField,1) & "]" & "=" & strKey
If strType = "SQL" or strType = "MYSQL" Then
	' Strip brackets for SQL
	strsql = Replace(strsql,"[","")
	strsql = Replace(strsql,"]","")
 
End If
If strType = "SQL" or strType = "MYSQL" Then
	xrs.Open (strsql, xConn, 2, 3, 1)
Else
	xrs.Open (strsql, xConn, 2, 3)
End If

' Get the field contents
For x = 1 to intFieldCount
	aFields(x,4) = xrs(x-1).Value
Next 

' Check and set fonts and colours
If Trim(strFont = "") Then strFont = "Verdana, Arial, Helvetica"
If Not (intFontSize > 0) Then intFontSize = 2
If Trim(strBorderColor) = "" Then strBorderColor = "#99CCCC"
If Trim(strMenuColor) = "" Then strMenuColor = "#99CCCC"
If Trim(strMenuTextColor) = "" Then strMenuTextColor = "Black"

If (intConfirmDelete > 0) AND DoConfirm Then
' Prevent caching
Response.ExpiresAbsolute = Now().AddDays(-1)
Response.AddHeader ("Cache-Control", "must-revalidate")
Response.AddHeader ("Cache-Control", "no-cache")
 %>
<html>
<head>
    <title>
        <%=Session("dbTitle")%>
        -
        <%=txtDelete%></title>
</head>
<% If Session("dbBodyTag") & "x" = "x" then %>
<body>
    <% Else %>
    <body alink="<%=strMenuTextColor%>" vlink="<%=strMenuTextColor%>" link="<%=strMenuTextColor%>">
        <% End If %>
        <% If Session("dbBodyTag") & "x" <> "x" Then Response.Write (Session("dbBodyTag"))%>
        <font face="<%=strFont%>">
            <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strBorderColor%>" width="100%">
                <tr>
                    <td>
                        <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=strBorderColor%>">
                            <tr>
                                <td bgcolor="<%=strMenuColor%>" align="RIGHT" width="*">
                                    <font size="3" face="<%=strFont%>" color="<%=strMenuTextColor%>"><a href="<%=Session("dbViewPage")%>">
                                        <%=txtBackToList%></a>
                                        <% 		If (Session("dbCanEdit") = 1)  and Session("dbKey") > 0 Then %>
                                        &nbsp;&nbsp;|&nbsp;&nbsp; <a href="<%=Session("dbGenericPath")%>GenericEdit.asp?KEY=<%=aFields(Session("dbKey"),4)%>">
                                            <%=txtEdit%></a>
                                        <% 		End If %>
                                        <% 		If IsSubTable Then %>
                                        &nbsp;&nbsp;|&nbsp;&nbsp; <a href="<%=Session("dbGenericPath")%>GenericExit.asp?KEY=<%=aFields(Session("dbKey"),4)%>">
                                            <%=arrSubTable(0)%></a>
                                        <% 		End If %>
                                </td>
                            </tr>
                            <tr>
                                <td align="RIGHT" bgcolor="#FFFFFF" rowspan="2" width="1">
                                    <font size="5" face="<%=strFont%>"><strong><em>
                                        <%=Session("dbTitle")%>
                                        -
                                        <%=txtDelete%></em></strong></font>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <p>
                <center>
                    <font size="4" face="<%=strFont%>"><strong><em>
                        <%=txtDeletePrompt%></em></strong></font><br />
                    <table cellpadding="1" cellspacing="0" border="0" bgcolor="<%=strBorderColor%>">
                        <tr>
                            <td>
                                <table cellpadding="2" cellspacing="2" border="0" width="100%" bgcolor="<%=strBorderColor%>">
                                    <tr>
                                        <td bgcolor="#FFFFCC">
                                            <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="<%= Session("dbGenericPath") %>GenericDelete.aspx?CMD='CON'&KEY=<%= strKey %>">
                                                <%=txtYes%></a></font>
                                        </td>
                                        <td bgcolor="#FFFFCC">
                                            <font size="<%=intFontSize%>" face="<%=strFont%>"><a href="<%=Session("dbViewPage")%>">
                                                <strong>
                                                    <%=txtNo%></strong></a></font>
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
                                        <% For x = 1 to intFieldCount 
	If Mid(strDisplay, x, 1) = "1" Then %>
                                        <tr bgcolor="#FFFFCC" align="LEFT">
                                            <td>
                                                <font size="<%=intFontSize%>" face="<%=strFont%>">
                                                    <% Response.Write (aFields(x,1)) %>
                                            </td>
                                            <td bgcolor="White" align="LEFT">
                                                <font size="<%=intFontSize%>" face="<%=strFont%>">
                                                    <%			curVal = aFields(x,4)
			' Blank or null
			If IsNothing(curVal) Then curVal = "&nbsp;"
			If Trim(curVal) & "x" = "x" Then curVal = "&nbsp;"
			' Password
			If UCase(Left(aFields(x,1),8)) = "PASSWORD" Then curVal = "*****"
			' Image
			If (UCase(Left(aFields(x,1),3)) = "IMG") Then
				If Session("dbMaxImageSize") = 0 Then
					curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & GT 
				Else 
					curVal = LT & "IMG SRC=" & QUOTE & curVal & QUOTE & " WIDTH=" & QUOTE & Session("dbMaxImageSize") & QUOTE & GT 
				End If
			End If		
			If curVal <> "&nbsp;" then
				Select Case aFields(x,2)
					case 2, 3, 4, 5 ' Numbers
						curVal = "<div align=right>" & curVal & "</div>"
					case 6 ' Currency
						curval = "<div align=right>" & FormatCurrency(curval,2,-1) & "</div>"
					case 7, 135 ' Date / Time - Fixed for Null values by Elizabeth Robins
						if curval <> "&nbsp;" Then curVal = FormatDateTime(curVal)
					case 11 ' Boolean
						If curVal Then
							curVal = txtTrue
						Else
							curVal = txtFalse
						End If
					case 129, 130, 200, 201, 202, 203 ' String or Memo
						curVal = replace(curVal,"<","&lt;")
						curVal = replace(curVal,">","&gt;")
						curVal = replace(curVal,chr(10),"&nbsp;<br />")
				End Select
			end if
			Response.Write (curVal) %>
                                            </td>
                                        </tr>
                                        <% 		End If 
	Next 
	xrs = Nothing
	xConn.Close
    xConn = Nothing
Else
	If xrs.EOF Then
		Response.Clear
		Response.Redirect (Session("dbViewPage"))
	End If
	xrs.Delete
	xrs.Close
	xrs = Nothing
	xConn.Close
	xConn = Nothing
	Response.Clear
	Response.Redirect (Session("dbViewPage"))
End If
                                        %>
                                    </table>
                                </td>
                            </tr>
                        </table>
                </center>
                <% If Session("dbFooter") = 1 Then %>
                <!--#include file="GenericFooter.aspx"-->
                <% End If %>
    </body>
</html>
