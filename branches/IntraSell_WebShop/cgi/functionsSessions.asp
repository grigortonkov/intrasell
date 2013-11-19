<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================



'******************************************************************************
' createSession - function 
' needs the table webSessions in the database
'******************************************************************************
function  createSession()
	Dim sid
	
	''hidden because shown before html tag response.Write "<!--" 'start html kommentar um ev. getSID errors zu verstecken 
	Sid = getSID()
	''hidden because shown before html tag response.Write "-->" 
	if Sid = "" then 'generate new
	   createSession = createNewSession()
	end if
end function  

function createNewSession()
       Dim sid, SQL 
	   SID = NextId("webSessions", "SID")
	   SQL = "Insert Into webSessions (SID, IP, CreationDate, CreationTime) Values " & _ 
	         "(" & SID & ",'" & Request.ServerVariables("REMOTE_HOST") &  "'," & SQLNOW(0) & "," & SQLNOW(0) & ")"
	   objConnectionExecute SQL
	   Session("SID") = SID
	   createNewSession = sid
end function 

'******************************************************************************
' returns session id according the set session or by the IP adress
'******************************************************************************
function getSID()
  Dim sid 
  if Session("SID") <> "" then 
     sid = Session("SID")
  else 
     dim sql, rs 
     'Get one sesssion if ip matches in the 10 minutes last
     sql = "Select SID from webSessions " & _ 
           " where CreationTime>=(" & SQLNOW(-10*1/(24*60)) & ") and IP Like '" & _ 
           Request.ServerVariables("REMOTE_HOST") & "' " & _ 
           " and loggedOut=0 " & _ 
           " ORDER BY creationDate DESC"
          'Response.Write sql:Response.Flush
     set rs = objConnectionExecute(SQL)
     if not rs.EOF then
         sid = rs("SID")
         if showDebug() then Response.Write "<br><font color=red>Your Session is " & rs("SID") & "!</font>" 
     else 
         if showDebug() then Response.Write "<font color=red>Your Session is wrong! Please activate the cookies!</font>" 
     end if 
     rs.close
     set rs = nothing 
  end if 
  
  'set last time
  if sid <> "" then
      sql = "UPDATE webSessions SET lastregisteredTime = " & SQLNOW(0) & " WHERE SID=" & sid 
      objConnectionExecute(sql)
  end if  
  getSID = sid
end function


'******************************************************************************
' returns logged client id according the set session or by the IP adress
'******************************************************************************
function getLOGIN()
 Const LOG_IN = "LOG_IN"
 
  if Session(LOG_IN) <> "" then 
     getLOGIN = Session(LOG_IN)
  else 
     dim sql, rs 
     sql = "Select sid, kundenIdnr, ip from webSessions where CreationTime>=(" & SQLNOW(-0.05) & ") and IP Like '" & _
           Request.ServerVariables("REMOTE_HOST") & "' ORDER BY creationDate DESC"
     'Response.Write sql
     set rs = objConnectionExecute(SQL)
     if not rs.eOF then
       if rs("kundenIdnr")>0 then 'do not return 0 
         getLOGIN = rs("kundenIdnr")
       end if   
         if showDebug() then Response.Write "<font color=red>Your Session is " & rs("SID") & "!</font>" 
     else 
         if showDebug() then Response.Write "<font color=red>Your Session is wrong! Please activate the cookies!</font>" 
     end if 
     rs.close
     set rs = nothing 
  end if 
     
end function

function LogOut()
    Objconnection.execute("update webSessions set loggedOut=-1 where SID=" & getSID())
    Session("LOG_IN")= ""
    Session("SID")  = ""
end function 
%>