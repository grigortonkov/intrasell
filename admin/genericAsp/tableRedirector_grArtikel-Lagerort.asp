<!--#include virtual="/admin/login.asp"-->   
<%
' Query
Session("dbKeyFieldToInsert") = "LagerNr"
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "grArtikel-Lagerort"
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
Session("dbDispList") = "11"
Session("dbDispView") = "11"
Session("dbDispEdit") = "11"
Session("dbSearchFields") = "11"
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