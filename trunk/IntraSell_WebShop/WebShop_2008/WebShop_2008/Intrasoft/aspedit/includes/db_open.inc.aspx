<%
Dim Path as String = Server.MapPath("db/aspedit.mdb")
Dim DB = Server.CreateObject("ADODB.Connection")
DB.Open ("driver={Microsoft Access Driver (*.mdb)};dbq=" & Path)
%>