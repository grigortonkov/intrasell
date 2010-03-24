<%
    Dim httpReader
    httpReader = Server.CreateObject("Tonkov.aspHttp")
    Dim orderHTML : orderHTML = httpReader.getURL("http://www.google.at")
    Response.Write(orderHTML)
%>