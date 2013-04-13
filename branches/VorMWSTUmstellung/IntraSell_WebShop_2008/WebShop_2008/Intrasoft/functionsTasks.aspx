<!--#include file="functions.aspx"-->
<h1>
    Task Manager - by Grigor Tonkov</h1>
<%
'this collection of functions allows registering unregistering of tasks.
'Task is simply calling of certain asp file 
'it is resumed that this script is called periodically / every minute / 
'the tasks will be executed 
'WARNING: the asp files that are called mustn't be protected by IIS password !!! 

call executeAllOpenTasks()
%>


<script language="VB" runat="server"> 

    '======================================================================
    ' run this sql against your database 
    '======================================================================
    Function createTaskTable()
        Dim sql
        sql = "CREATE TABLE [Tasks] ([ID] [int] IDENTITY (1, 1) NOT NULL ,	[TaskName] [char] (50) NULL ,	[URLToCall] [char] (255) NOT NULL ,	[StartTime] [datetime] NULL ,	[LatestTime] [datetime] NULL ,	[RepeatIntervalInMinutes] [int] NOT NULL ,	[ResultOfLastExecution] [char] (255) NULL )"
    End Function

    '======================================================================
    ' returns the id of the new task 
    '======================================================================
    Function registerTask(ByVal urlToCall, ByVal atTime, ByVal optionalRepeatIntervalInMinutes)
        Dim nextID : nextID = nextID("TASKS", "id")
    End Function

    '======================================================================
    '======================================================================
    Function unregisterTask(ByVal urlToCall)
    End Function

    '======================================================================
    'execute all open tasks 
    '======================================================================
    Function executeAllOpenTasks()
        Dim sql, rs
        sql = "SELECT * FROM TASKS WHERE StartTime <= " & SQLNOW(0) & " AND LatestTime >=" & SQLNOW(0)
        rs = objConnection.execute(sql)
        If rs.eOF Then
            Response.Write("<br /><font color=""red""> No more tasks to execute!")
        End If
        While Not rs.EOF
            Call executeOneTask(rs("ID"))
            rs.moveNext()
        End While
        rs.close()
    End Function

    '======================================================================
    'executes one task only 
    '======================================================================
    Function executeOneTask(ByVal ID)
 
        Dim sql, rs
        sql = "SELECT * FROM TASKS WHERE id=" & ID
        rs = objConnection.execute(sql)
        If Not rsEOF Then
            Response.Write("<br />Execute task " & rs("TaskName") & " on " & rs("URLToCall")) : Response.Flush()
            Dim aspHttp : aspHttp = Server.CreateObject("Tonkov.ASPHttp")
     
     
            localFilename = Server.MapPath("../productImages/" & imageName)
            'Response.Write "getfile " & absoluteUrl & "," &localFilename
            Dim result : result = aspHttp.getURL(rs("URLToCall"))
            result = Replace(result, """", "") : result = Replace(result, "'", "")
            Dim newStartTime : newStartTime = rs("STARTTIME") + rs("RepeatIntervalInMinutes") / (24 * 60)
            If rs("RepeatIntervalInMinutes") > 0 Then 'new repeat on the interval 
                sql = "UPDATE TASKS SET STARTTIME=DATEADD(minute,RepeatIntervalInMinutes,STARTTIME), ResultOfLastExecution='" & Left(result, 255) & "' WHERE ID=" & ID
            Else 'no more repeats 
                sql = "UPDATE TASKS SET STARTTIME=LATESTTIME+1, ResultOfLastExecution='" & Left(result, 255) & "' WHERE ID=" & ID
            End If
            Response.Write(sql)
            Response.Write("Result was (only 255 chars)= " & Left(result, 255))
            objConnection.execute(sql)
    
            aspHttp = Nothing
     
        Else
            Response.Write("<br />Task not known. Id=" & ID)
        End If
 
    End Function

</script>

