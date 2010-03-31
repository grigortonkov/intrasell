Path:<%Response.Write(Server.MapPath(".."))%>
<br>
PATH_TRANSLATED:
<%=Request.ServerVariables("PATH_TRANSLATED")%>
<br>
URL:<%=Request.ServerVariables("SERVER_NAME")%>
<%=Request.ServerVariables("URL")%>
