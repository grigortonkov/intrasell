<!--#include file="../login.asp"-->   
<%
' Query
Session("dbKeyFieldToInsert") = "Anrede"
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "grAnrede"
Session("dbWhere") = ""
Session("dbGroupBy") = ""
Session("dbOrderBy") = ""
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 0
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList") = "111"
Session("dbDispView") = "111"
Session("dbDispEdit") = "111"
Session("dbSearchFields") = "111"
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
Response.Redirect "../../client/intrasoft/genericasp/GenericList.asp"
%>