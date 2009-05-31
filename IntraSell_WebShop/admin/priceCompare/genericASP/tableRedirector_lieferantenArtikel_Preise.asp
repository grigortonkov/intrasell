<!--#include file="../login.asp"-->   
<%
' Query
Session("dbFields") = "*"
Session("dbFieldsListView") = "*"
Session("dbRs") = "[lieferantenArtikelPreise]"
Session("dbWhere") = ""
if request("LieferantNr")<> "" then 
    Session("dbWhere") = "LieferantNr=" & request("LieferantNr")
    Session("LieferantNr") = request("LieferantNr")
else
 if Session("LieferantNr")<>"" then 
    Session("dbWhere") = "LieferantNr=" & Session("LieferantNr")
 else  
     respone.write "Sie müssen den LieferantNr eingeben!"
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
Session("dbDispList") = "011111111111"
Session("dbDispView") = "011111111111"
Session("dbDispEdit") = "011111111111"
Session("dbSearchFields") = "01111"
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