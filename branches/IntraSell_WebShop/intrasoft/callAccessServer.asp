
<%
DATABASEPATH = "D:\Business\IntraSoft\IntraSell\accessServer.mdb"	
Session ("MyDSN1")  = "driver={Microsoft Access Driver (*.mdb)};PASSWORD=;DBQ=" & DATABASEPATH & ";"
set objConnection1=server.createobject("adodb.connection")
objConnection1.open Session ("MyDSN1")
%>
<!--#include file="functions.asp"-->  
<%
function eval(message)
   objConnection1.execute("insert into webCommunication (message) values('" & message & "')")
   objConnection1.Close' //commit
   objConnection1.open Session ("MyDSN")
      
   dim sql, rs 
   sql = "select * from webCommunication where message like '" & message & "' and reply <> '' and reply is not null" 
   set rs = objConnection1.execute(sql) 
    
   Response.End
   
   while  rs.eof 'try again
      call Wait(0.001)
      Response.Write ".": Response.Flush
      objConnection1.Close
      objConnection1.open Session ("MyDSN")
      set rs = objConnection1.execute(sql) 
   wend 

   'results here 
   eval = rs("reply") 
   'delete 
   sql = "delete from webCommunication where message like '" & message & "' and reply <> '' and reply is not null" 
   set rs = objConnection1.execute(sql) 
 
end function 


for i = 1 to 10 
   Response.Write "Eval="&i: Response.Flush
   Response.write  " " & eval("1000+" & i ) & "<br>"
   Response.Flush 
next

%>