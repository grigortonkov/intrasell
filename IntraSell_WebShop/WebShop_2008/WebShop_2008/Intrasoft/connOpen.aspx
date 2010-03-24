<% 
  'Response.Write "open the DB conn..."
    ' Dim objConnection As Object
    objConnection = Server.CreateObject("adodb.connection")
    objConnection.open(Session("MyDSN"))
  'Response.end
 %>
