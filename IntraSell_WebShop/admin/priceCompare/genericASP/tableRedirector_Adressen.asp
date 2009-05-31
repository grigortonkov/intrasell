<!--#include file="../login.asp"-->   
<%
Dim whereClause: whereClause = " 1=1 "
If Request("IDNR") <> "" then whereClause = whereClause & " AND " & "IDNR=" & Request("IDNR") 
If Request("Firma") <> "" then whereClause = whereClause & " AND " & "FirmaLike '" & Request("Firma") & "'"
If Request("Name") <> "" then whereClause = whereClause & " AND " & "Name Like '" & Request("Name") & "'"
If Request("Strasse") <> "" then whereClause = whereClause & " AND " & "Strasse Like '" & Request("Strasse") & "'"
If Request("PLZ") <> "" then whereClause = whereClause & " AND " & "PLZ  In (Select IDNR From grPLZ Where PLZ = " & Request("PLZ") & ")"

Session("dbKeyFieldToInsert") = "IDNR"
' Query
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "ofAdressen"
Session("dbWhere") = whereClause '""
Session("dbGroupBy") = ""
Session("dbOrderBy") = ""
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 1
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList") = "111111111111111111111111111"
Session("dbDispView") = "111111111111111111111111111"
Session("dbDispEdit") = "011111111111111111111111111"
Session("dbSearchFields") = "111111111111111111111111111"
Session("dbFooter") = 0
Session("dbFont") = "Arial, Helvetica"
Session("dbFontSize") = 2
Session("dbBorderColor") = "#99CCCC"
Session("dbMenuColor") = "#99CCCC"
' Features
Session("dbDebug") = 1
Session("dbCanAdd") = 1
Session("dbExtraAdd") = 0
Session("dbCanEdit") = 1
Session("dbCanDelete") = 1
Session("dbConfirmDelete") = 1
' Defaults
' Do Not Change
Session("dbViewPath") = Request.ServerVariables("PATH_TRANSLATED")
Session("dbViewPage") = Request.ServerVariables("PATH_INFO")
Response.Redirect "../../client/intrasoft/genericasp/GenericList.asp"
%>