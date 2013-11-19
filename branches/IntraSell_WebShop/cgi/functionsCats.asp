<% @ LANGUAGE = VBScript.Encode%>
<%' @ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<%OPTION explicit%>

<!--#include file="../intrasoft/connOpen.asp"-->
<!--#include file="../intrasoft/functions.asp"-->
<!--#include file="../intrasoft/functionsGUI.asp"-->
<!--#include file="../intrasoft/functionsFAQ.asp"-->
<!--#include file="../intrasoft/functionsCache.asp"-->
<!--#include file="functionsCategories.asp"-->
<%

'start - rebuilding index for the categories - 
'- without the index no cat will be found ! 
 
objConnectionExecute("delete from webCatsIndex") 
call rebuildCats() ' start with main cat

'rebuild index for cat searching 
function rebuildCats()
	dim sql_, rs_ 
	sql_ = "select * from [grArtikel-Kategorien] order by artKAtNR"
	set rs_ = objConnectionExecute(sql_) 
    dim subCats 
	while not rs_.eof 
	    subCats = makeSubcategoriesList(rs_("ArtKatNr"),10)
   		sql_ = "insert into webCatsIndex (ArtKatNrPArent, ArtKatNr) select " & rs_("ArtKatNr") & ", ArtKatNr from [grArtikel-Kategorien] where ArtKatNr in (" & subCats &")"
   		response.write sql_ & "<br>":response.flush
   		objConnectionExecute(sql_) 
   		
   		rs_.moveNext 
	wend 
	rs_.close 
end function 
 
%>