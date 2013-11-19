<!--#include virtual="/admin/login.asp"-->   
<%
' Query
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "ofDictionary"
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
Session("dbDispList") = "011111"
Session("dbDispView") = "011111"
Session("dbDispEdit") = "011111"
Session("dbSearchFields") = "011111"
Session("dbFooter") = 0
Session("dbFont") = "Arial, Helvetica"
Session("dbFontSize") = 2
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
Response.Redirect "../../intrasoft/genericasp/GenericList.asp"
%>