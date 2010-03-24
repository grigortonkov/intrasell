<!--#include virtual="/cgi/defaultHead.inc"-->
<%
    'Objconnection.execute("delete from webSessions where SID=" & getSID())
    Call logOut()
    Response.Redirect("../../default.asp")
%>
