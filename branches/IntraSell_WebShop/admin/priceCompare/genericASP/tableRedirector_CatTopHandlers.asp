<!--#include file="../login.asp"-->   
<%
' Query
Session("dbCombo2") = "TABLE,grArtikel-Kategorien,1,2,??,Unknown"
Session("dbCombo3") = "TABLE,lieferantenAdressen,1,9,,,IDNR IN (SELECT LieferantNr FROM priceCompareHaendler)"

Session("dbFieldsListView") = "*, (Select Firma from lieferantenAdressen Where IdNR=lieferantNr), (Select Category from [viewCategories] Where ArtKatNr = CatID)"
Session("dbFields") = "*"
Session("dbRs") = "priceCompareCatTopHandlers"
Session("dbWhere") = ""
Session("dbGroupBy") = ""
Session("dbOrderBy") = "CatId"
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 1
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList") = "011111"
Session("dbDispView") = "011111"
Session("dbDispEdit") = "011222"
Session("dbSearchFields") = "0111"
Session("dbFooter") = 0
Session("dbFont") = "Arial, Helvetica"
Session("dbFontSize") = 2
'Session("dbBorderColor") = "#99CCCC"
'Session("dbMenuColor") = "#99CCCC"
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