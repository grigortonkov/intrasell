<!--#include file="functions.asp"-->  
<h1>Task Manager - by Grigor Tonkov</h1>

<%
'this collection of functions allows registering unregistering of tasks.
'Task is simply calling of certain asp file 
'it is resumed that this script is called periodically / every minute / 
'the tasks will be executed 
'WARNING: the asp files that are called mustn't be protected by IIS password !!! 

call executeAllOpenTasks()




'======================================================================
' run this sql against your database 
'======================================================================
function createTaskTable()
   dim sql 
   sql = "CREATE TABLE [Tasks] ([ID] [int] IDENTITY (1, 1) NOT NULL ,	[TaskName] [char] (50) NULL ,	[URLToCall] [char] (255) NOT NULL ,	[StartTime] [datetime] NULL ,	[LatestTime] [datetime] NULL ,	[RepeatIntervalInMinutes] [int] NOT NULL ,	[ResultOfLastExecution] [char] (255) NULL )" 
end function 

'======================================================================
' returns the id of the new task 
'======================================================================
function registerTask(byVal urlToCall, byVal atTime, byVal optionalRepeatIntervalInMinutes)
dim nextID: nextId = nextId("TASKS","id")
end function  

'======================================================================
'======================================================================
function unregisterTask(byVal urlToCall)
end function  

'======================================================================
'execute all open tasks 
'======================================================================
function executeAllOpenTasks()
 dim sql, rs 
 sql = "SELECT * FROM TASKS WHERE StartTime <= " & SQLNOW(0) &  " AND LatestTime >="  & SQLNOW(0)
 set rs = objConnection.execute(sql) 
 if rs.eOF then 
    Response.Write "<br><font color=""red""> No more tasks to execute!" 
 end if 
 while not rs.EOF
   call executeOneTask(rs("ID"))
   rs.moveNext  
 wend 
 rs.close 
end function 

'======================================================================
'executes one task only 
'======================================================================
function executeOneTask(byVal ID)
 
 dim sql, rs 
 sql = "SELECT * FROM TASKS WHERE id="  & ID 
  set rs = objConnection.execute(sql) 
 if NOT rsEOF then 
     Response.Write "<br>Execute task " & rs("TaskName") & " on " & rs("URLToCall"):Response.Flush
     dim aspHttp: set aspHttp = Server.CreateObject("Tonkov.ASPHttp")
     
     
    localFilename =  Server.MapPath("../productImages/" & imageName)   
    'Response.Write "getfile " & absoluteUrl & "," &localFilename
    dim result: result = aspHttp.getURL(rs("URLToCall"))
    result = replace(result,"""","") : result = replace(result,"'","") 
    dim newStartTime: newStartTime = rs("STARTTIME")+rs("RepeatIntervalInMinutes")/(24*60)
    if rs("RepeatIntervalInMinutes")>0 then 'new repeat on the interval 
    sql = "UPDATE TASKS SET STARTTIME=DATEADD(minute,RepeatIntervalInMinutes,STARTTIME), ResultOfLastExecution='" &  left(result,255) & "' WHERE ID=" & ID 
    else 'no more repeats 
    sql = "UPDATE TASKS SET STARTTIME=LATESTTIME+1, ResultOfLastExecution='" &  left(result,255) & "' WHERE ID=" & ID 
    end if 
    Response.Write sql
    Response.Write "Result was (only 255 chars)= " & left(result,255)
    objConnection.execute(sql) 
    
    set aspHttp = nothing 
     
 else 
     Response.Write "<br>Task not known. Id=" &  ID 
 end if 
 
end function 


%>







