<% @ LANGUAGE = VBScript.Encode%>
<%' @ LANGUAGE = VBScript.Encode  TRANSACTION = Required %>
<%OPTION explicit%>
<!--#include file="../intrasoft/connOpen.aspx"-->
<!--#include file="../intrasoft/functions.aspx"-->
<%
ObjConnectionExecute(" CREATE TABLE webProductsSendToFriend ( " & _ 
	" Id int, " & _ 
	" ArtNr int, " & _ 
	" FromEmail varchar (255) , " & _ 
	" ToEmail varchar (255) , " & _ 
	" EmailSubject varchar (255) , " & _ 
	" EmailText varchar (255) ," & _ 
	" DateCreation datetime)")
%>