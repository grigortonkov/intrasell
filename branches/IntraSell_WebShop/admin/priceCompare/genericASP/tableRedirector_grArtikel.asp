<!--#include file="../login.asp"-->
<%

Session("dbKeyFieldToInsert") = "ArtNr"
' Query
'Session("dbCombo17") = "TABLE,grArtikel-Kategorien,1,2,??,Unknown"
Session("dbCombo17") = "TABLE,viewCategoriesWithPath,1,2,??,Unknown"
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "grArtikel"
Session("dbWhere") = ""
if request("KatNr")<> "" then 
    Session("dbWhere") = "ArtKatNr=" & request("KatNr")
    Session("KatNr") = request("KatNr")
else
 if Session("KatNr")<>"" then 
    Session("dbWhere") = "ArtKatNr=" & Session("KatNr")
 else  
     response.write "Sie müssen die Kategorie eingeben!"
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
Session("dbDispList")     = "10011111000000101001111"
Session("dbDispView")     = "10011111000000101001111"
Session("dbDispEdit")     = "10011111000000101001111"
Session("dbSearchFields") = "10011111000000101001111"
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