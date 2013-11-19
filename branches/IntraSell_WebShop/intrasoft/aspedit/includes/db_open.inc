<%
Path = Server.MapPath("db/aspedit.mdb")
Set DB=Server.CreateObject("ADODB.Connection")
DB.Open "driver={Microsoft Access Driver (*.mdb)};dbq="&Path
%>