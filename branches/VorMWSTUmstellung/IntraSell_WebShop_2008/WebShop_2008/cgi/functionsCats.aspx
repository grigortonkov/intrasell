<% @ LANGUAGE = VBScript.Encode%>
<%' @ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<%OPTION explicit%>
<!--#include file="../intrasoft/connOpen.aspx"-->
<!--#include file="../intrasoft/functions.aspx"-->
<!--#include file="../intrasoft/functionsGUI.aspx"-->
<!--#include file="../intrasoft/functionsFAQ.aspx"-->
<!--#include file="../intrasoft/functionsCache.aspx"-->
<!--#include file="functionsCategories.aspx"-->
<%

'start - rebuilding index for the categories - 
'- without the index no cat will be found ! 
 
objConnectionExecute("delete from webCatsIndex") 
call rebuildCats() ' start with main cat

 
%>