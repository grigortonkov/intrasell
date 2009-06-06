<!--#include virtual="/admin/login.asp"-->   
<%


Session("dbKeyFieldToInsert") = "ArtNr"

Dim whereClause
whereClause = "ArtNr>=1000"
if request("ArtNr") <> "" then  whereClause = whereClause  & " AND ArtNR=" & request("ArtNR")
if request("Bezeichnung") <> "" then  whereClause = whereClause  & " AND Bezeichnung Like '" & request("Bezeichnung") & "'"
if request("ArtKatNr") <> "" then  whereClause = whereClause  & " AND ArtKatNr=" & request("ArtKatNr")

' Query
Session("dbFields") = "*"
Session("dbRs") = "grArtikel"
Session("dbWhere") = whereClause
Session("dbGroupBy") = ""
Session("dbOrderBy") = ""
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 1
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList") = "111111111111111111111"
Session("dbDispView") = "111111111111111111111"
Session("dbDispEdit") = "111111111111111111111"
Session("dbSearchFields") = "1111111111111111111"
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
Response.Redirect "../../intrasoft/genericasp/GenericList.asp"
%>