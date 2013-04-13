<!--#include file="../login.asp"-->   
<%
' Query
Session("dbCombo2") = "TABLE,lieferantenAdressen,1,9,,,"
Session("dbCombo3") = "TABLE,viewCategoriesWithPath,1,2,??,Unknown"


Session("dbFields") = "*"
Session("dbFieldsListView") = "*, (select category from viewCategories Where viewCategories.ArtKatNr=priceCompareImpExCategoryMapping.ArtKatNr) as Category, (Select Firma from lieferantenAdressen where lieferantenAdressen.idnr=priceCompareImpExCategoryMapping.LieferantNr) as Firma"
Session("dbRs") = "priceCompareImpExCategoryMapping"
if request("LieferantNr") <> "" then 
	Session("dbWhere") = "LieferantNR="& request("LieferantNr")
        Session("LieferantNr") = request("LieferantNr")
else
	if Session("LieferantNr") <> "" then 
           Session("dbWhere") = "LieferantNR="& Session("LieferantNr")
        else 
           Session("dbWhere") = ""
        end if  
end if 

Session("dbGroupBy") = ""
Session("dbOrderBy") = ""
' Display
Session("dbEditTemplate") = ""
Session("dbViewTemplate") = ""
Session("dbBackText") = ""
Session("dbKey") = 1
Session("dbOrder") = 0
Session("dbRecsPerPage") = 20
Session("dbDispList") = "0111111"
Session("dbDispView") = "0111111"
Session("dbDispEdit") = "0111111"
Session("dbSearchFields") = "0111111"
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