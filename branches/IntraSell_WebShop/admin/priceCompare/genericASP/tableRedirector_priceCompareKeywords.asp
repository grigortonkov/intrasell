<!--#include file="../login.asp"-->
<%
Dim ArtKatNr: ArtKatNr = request("ArtKatNr")
if ArtKatNr <> "" then Session("ArtKatNR") = ArtKatNr  else ArtKatNr = Session("ArtKatNR") 

' Query
Session("dbCombo1") =""
Session("dbCombo2") =""' "TABLE,viewCategoriesWithPath,1,2,??,Unknown"
Session("dbCombo3") =""' "TABLE,viewCategoriesWithPath,1,2,??,Unknown"
Session("dbFields") = "*"
Session("dbFieldsListView") = ""
Session("dbRs") = "priceCompareKeywords"
if ArtKatNr<>"" then  Session("dbWhere") = "ArtKatNr=" & ArtKatNr
Session("dbGroupBy") = ""
Session("dbOrderBy") = ""
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 1
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList")     = "1111111"
Session("dbDispView")     = "1111111"
Session("dbDispEdit")     = "1111111"
Session("dbSearchFields") = "1111111"
Session("dbFooter") = 0
Session("dbFont") = "Arial, Helvetica"
Session("dbFontSize") = 2
''Session("dbBorderColor") = "#99CCCC"
''Session("dbMenuColor") = "#99CCCC"
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