<% 
  'Response.Write "open the DB conn..."
  dim objConnection
  set objConnection=server.createobject("adodb.connection")
  objConnection.open Session ("MyDSN")
  'Response.end
 %>
