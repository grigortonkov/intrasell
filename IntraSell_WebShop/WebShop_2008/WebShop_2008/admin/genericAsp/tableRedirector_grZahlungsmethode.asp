<!--#include virtual="/admin/login.aspx"-->   
<%
' Query
Session("dbKeyFieldToInsert") = "Methode"
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "grZahlungsmethode"
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
Session("dbDispList") = "1"
Session("dbDispView") = "1"
Session("dbDispEdit") = "0"
Session("dbSearchFields") = "1"
Session("dbFooter") = 0
Session("dbFont") = "Arial, Helvetica"
Session("dbFontSize") = 2
''Session("dbBorderColor") = "#99CCCC"
''Session("dbMenuColor") = "#99CCCC"
' Features
Session("dbDebug") = 1
Session("dbCanAdd") = 1
Session("dbExtraAdd") = 0
Session("dbCanEdit") = 0
Session("dbCanDelete") = 1
Session("dbConfirmDelete") = 1
' Defaults
' Do Not Change
Session("dbViewPath") = Request.ServerVariables("PATH_TRANSLATED")
Session("dbViewPage") = Request.ServerVariables("PATH_INFO")
Response.Redirect "../../intrasoft/genericasp/GenericList.aspx"
%>