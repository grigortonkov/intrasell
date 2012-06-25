<!--#include virtual="/cgi/defaultHead.inc.aspx"-->
<%
    'Objconnection.execute("delete from webSessions where SID=" & getSID())
    Call logOut()
    Response.Redirect("../../default.aspx")
%>
