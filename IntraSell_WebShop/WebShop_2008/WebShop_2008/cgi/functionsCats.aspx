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

 
%>