<!--#include virtual="/admin/includeall.inc.aspx"-->
<%
' Query
Session("dbKeyFieldToInsert") = "ArtKatNr"

Session("dbFields") = "*"
Session("dbRs") = "grArtikel-Kategorien"
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
Session("dbDispList") = "111111111111"
Session("dbDispView") = "111111111111"
Session("dbDispEdit") = "111111111111"
Session("dbSearchFields") = "111111111111"
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
Response.Redirect ("../../intrasoft/genericasp/GenericList.aspx")
%>