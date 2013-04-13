<!--#include file="menu.asp"-->  
<html>
<head>
<link rel=stylesheet type="text/css" href="file://h:/xml/stylesheetForEmails.css" title="Style Sheet for DPEE">
<title>Query Tool</title>
</head>
<body>
<%
'dim objConnection
'Set objConnection=server.createobject("adodb.connection")
'    objConnection.Open "DSN=IPP;Uid=IPP;Pwd=sercon"
%>

<%

'===========================================================================
' General ASP Functions
' This is collection of usefull ASP functions and procedures.
' Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'
'============================================================================
' History
'____________________________________________________________________________
' DATE         WHAT
' 20-08-2002 Sub Row added toe the SELECT queries 
' 04-04-2002 Some comments and vars for showSQL and PageTitle
'____________________________________________________________________________

'**Start Encode**
%>

<!-- This page can handle all possible SQL queries-->
<%  
 Dim  delete_query, SQLString  , Export , Filename, rs, exportToFile, i, ShowSQL, PageTitle
 Dim showDelete
 
     delete_query = Request("delete_query")'is ispressed delete in the first column
     SQLString = Request("SQLString")'the sql select query 
     Export = request("Export") 'if export is clicked 
     Filename = request("Filename") 'the filename for export
     
     ShowSQL = request("ShowSQL")'if toe form for export and sql to be shown
     if ShowSQL = "" then ShowSQL = TRUE
     
     showDelete = request("showDelete")'if toe form for export and sql to be shown
     if showDelete = "" then showDelete = TRUE
      
     PageTitle = request("PageTitle") 'the page title for the result
     
         
     'response.write "delete_query=" & delete_query      
     if SQLString <>"" then 
       'Response.Write "Execute: " & SQLString
       Set rs = objConnection.Execute(SQLString) 
     end if 
     %>

<h1 align="center">
<%if len(PageTitle)<=0 then %>Query &amp; File Export Tool
<%else%>
<%=PageTitle%>
 <%end if %>
</h1>
<% if ShowSQL then %>
<form METHOD="POST" ACTION="runSQLSelect.asp" ENCTYPE="application/x-www-form-urlencoded">    
  <textarea NAME="SQLString" ROWS="6" COLS="100"><% 
  if SQLString <> "" THEN 
   Response.write SQLString 
   ELSE 
      if len(delete_query) > 0 THEN
       Response.write delete_query   
      ELSE
       Response.write "SELECT * FROM "
      END IF 
  END IF %>
  
  </textarea>
  <br>
  <%
  ''
  '' diese funktion erlaubt löschen von allen ausgew. sätze
  ''
  if InStr(ucase(SQLString) ,"FROM") > 0 and showDelete then %>
  <%dim deleteAllSQL: deleteAllSQL= "DELETE " &  mid(SQLString,InStr(ucase(SQLString) ,"FROM"))%>
  <font color=red>
  <a href="runSQlSelect.asp?SQLString=<%=deleteAllSQL%>"> DELETE ALL SELECTED ROWS!</a>   
  </font>
  <%end if%>
  <p>
  <input TYPE="submit" NAME=".submit" VALUE="<<< QUERY or EXPORT* >>>">&nbsp; Export to File:<input type="checkbox" name="Export" value="ON">
  Create File: <input type="text" name="Filename" size="37" value="export.txt"></p>
   </form>
   <p>* to export set Filename and click Export To File!</p>
  <%end if'show SQL%>
 
<%

     ' es handelt sich um SELECT Abfrage 
  if ucase(left(SQLString, 4)) = "SELE" THEN 
     'CREATE EXPORT FILE 
		exportToFile = false 
		if Ucase(request("Export"))="ON" then   exportToFile = true 
  
  'If Creation of export filename wished 
   if exportToFile  then 
   Dim fs, exportFile 
   		Set fs = CreateObject("Scripting.FileSystemObject")
   	    filename =Server.MapPath ("\") + "\" &  request("Filename")
   		'response.write  "Export to: " & filename 
   		Set exportFile = fs.CreateTextFile(filename , True)
   end if  
  'END CREATE EXPORT FILE 
          'response.write "Fields =" & rs.fields.count
 		   response.write "<table border =""1""><TR>"
 		   response.write "<Th>" 
 		   if showDelete then 
             response.write "Delete"     
           end if 
           response.write "</Th>"     
				for i = 1 TO rs.fields.count 
           		Response.write "<Th>" & rs.fields(i-1).name & " </Th>"
          		next 
 	   	   response.write "</TR>"

    Dim htmlline, fileLine, table_name
    Dim sumRow(100) 'max 20 fields  
    
    Dim alternateRowColor: alternateRowColor = "#FFFFFF"
 	while not rs.EOF 
 	
 	if alternateRowColor ="#FFFFCC" then 
 	   alternateRowColor = "#FFFFFF"
 	else 
 	   alternateRowColor = "#FFFFCC"
 	end if 
 			  htmlline = "<TR>"
              table_name = trim(right(SQLString,len(SQLSTRING) - instr(SQLString,"FROM") - 4))

              IF instr(table_name," ") > 0 THEN 
                table_name = left(table_name,instr(table_name," ")-1)
              END IF 
   
              delete_query = "DELETE%20FROM%20" & table_name & "%20WHERE%20" & _
                              trim(rs.fields(0).name) & "=" & trim(rs.fields(0).value)               
               htmlline = htmlline  & "<TD>" 
               if showDelete then 
               htmlline = htmlline  & "<A HREF=admin.asp?delete_query=" & delete_query & "> DELETE </A>"
               end if 
               htmlline = htmlline  & "</TD>"
  			  fileLine = "" 
  			   
           		for i = 1 TO rs.fields.count 
          			 htmlline = htmlline &  "<TD  bgcolor=""" & alternateRowColor & """>" & rs.fields(i-1).value & " </TD>"
          			 fileLine = fileLine   &  rs.fields(i-1).value & ";"
          			 if isnumeric(rs.fields(i-1)) then  sumRow(i) = sumRow(i) + rs.fields(i-1).value 
          		next 
          		          	
			htmlline = htmlline  &  "</TR>"
	
          	if exportToFile then 
          	   exportFile.WriteLine fileLine 
          	else 
          	   Response.write htmlline    
          	end if 
          		 		 			
        rs.movenext
 	WEND 
    'SHOW SUM ROW 
			if not exportToFile then 
				htmlline = "<tr><td bgcolor=""#FFFFAA"">SUM ROW</td>"
				   for i = 1 TO rs.fields.count 
				   if len(sumRow(i)) >10 then 'it is not number 
				    sumRow(i) =""
				   end if 
				   htmlline = htmlline &  "<Th bgcolor=""#FFFFAA""><p align=""right""><b>" & sumRow(i)  & "</b></Th>"
				   next 
				htmlline = htmlline &  "</tr>"
				Response.write htmlline   
			end if  
    'END SHOW SUM ROW 
    
  response.write "</table>"
  rs.close   
  set rs = nothing
 
		if exportToFile  then  
		%>
		 <font color="#008080">
		Export to file [<%=fileName%>] succeessfull! </font>
		<%
		exportFile.close   
		end if 'exportToFile

END IF 
%>
</body>
</html>


