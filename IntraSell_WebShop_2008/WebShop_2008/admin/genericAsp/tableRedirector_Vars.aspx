<!--#include virtual="/admin/includeall.inc.aspx"-->
<%
'Response.Write "dbType=" & Session("dbType"): Response.End
' Query
Session("dbFields") = "*"
Session("dbRs") = "ofVars"
Session("dbWhere") = ""
Session("dbGroupBy") = ""
Session("dbOrderBy") = ""
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 1
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList") = "111"
Session("dbDispView") = "111"
Session("dbDispEdit") = "111"
Session("dbSearchFields") = "111"
Session("dbFooter") = 0
Session("dbFont") = "Arial, Helvetica"
Session("dbFontSize") = 2
Session("dbBorderColor") = "#99CCCC"
Session("dbMenuColor") = "#99CCCC"
' Features
Session("dbDebug") = 1
Session("dbCanAdd") = 1
Session("dbExtraAdd") = 1
Session("dbCanEdit") = 1
Session("dbCanDelete") = 1
Session("dbConfirmDelete") = 1
' Defaults
' Do Not Change
Session("dbViewPath") = Request.ServerVariables("PATH_TRANSLATED")
Session("dbViewPage") = Request.ServerVariables("PATH_INFO")
Response.Redirect ("../../intrasoft/genericasp/GenericList.aspx")
%>