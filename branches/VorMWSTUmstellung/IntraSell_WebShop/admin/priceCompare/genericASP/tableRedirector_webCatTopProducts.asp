<!--#include file="../login.asp"-->   
<%
' Query
'Session("dbCombo2") = "TABLE,grArtikel-Kategorien,1,2,??,Unknown"
Session("dbCombo2") = "TABLE,viewCategoriesWithPath,1,2,??,Unknown"
'Session("dbCombo3") = "TABLE,grArtikel,1,4,,,"

Session("dbFields") = "*"
Session("dbFieldsListView") = "*, (select category from viewCategories Where ArtKatNr=CatId) as Category, (Select bezeichnung from grArtikel where ArtNr=ProductId) as Pruduktbeiechnung"
Session("dbRs") = "webCatTopProducts"
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
Session("dbDispList") = "01111"
Session("dbDispView") = "011"
Session("dbDispEdit") = "011"
Session("dbSearchFields") = "011"
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