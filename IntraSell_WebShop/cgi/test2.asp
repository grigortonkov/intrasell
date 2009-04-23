<%
Dim httpReader
Set httpReader = Server.CreateObject("Tonkov.aspHttp")
Dim orderHTML: orderHTML = httpReader.getURL ("http://www.google.at")
response.write orderHTML 
%>