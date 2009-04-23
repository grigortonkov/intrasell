<!--#include file="../defaultHead.inc"-->
<%
'Objconnection.execute("delete from webSessions where SID=" & getSID())
call logOut
Response.Redirect "../../default.asp"
%>
