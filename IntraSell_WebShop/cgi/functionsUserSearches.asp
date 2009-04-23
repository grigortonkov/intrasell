<%
'needs: 
'Session("SQLString")
'Session("SQLDescription")
'SID

function saveSessionSearch(byVal SQLString, byVal SQLDescription)
    'response.Write "Save search!" 
	SQLString = replace(SQLString,"""","~")
	SQLString = replace(SQLString,"'","~")
	SQLDescription = cleanUserInput(SQLDescription) 
dim sid: sid = getSID()
    
if SQLString = "" or SQLDescription = "" then 
     'Response.Write "Es fehlen die Parameter SQLString=" & SQLDescription & " oder SQLDescription=" & SQLDescription & "!"
else
    
		if sid = "" then 
						Response.Write "<font color=red>" &  getTranslation("Ihre Session ist abgelaufen!") & "</font><br>"
		else 'sid ok
'Prüfung ob die Abfrage bereits gibt 
						SQL = "SELECT * FROM userSearches where SQLDescription='" & SQLDescription & "' and SID=" & sid
                        Dim rsPruef: set rsPruef = ObjConnectionExecute(SQL) 
                        if NOT rsPruef.EOF then 
                               message = getTranslation("Solche Abfrage wurde bereits gespeichert!")	
                        else 						
								SQL = "Insert into userSearches(QueryId, SID, SQLString, SQLDescription) values ("
								SQL = SQL & nextId( "userSearches", "QueryId" )  & ", "
								SQL = SQL & getSID() & ","   
								SQL = SQL & "'" & SQLString & "', "
								SQL = SQL & "'" & SQLDescription  & "')"
								objConnectionExecute (SQL)								
						end if 	
						rsPruef.close
		end if 	
end if 					
end function


public function ListUserSearches()
 if Session("DbType")="MySQL" then
				SQL= "select QueryId, SQLDescription, " & _ 
				     " concat('<a href=default.asp?pageToShow=ShowUserSearch&action=run&queryId=' , queryId ,  '>" & _ 
				     " <font color=blue>Ergebnisliste zeigen</font></a>') as Aktion, " & _			     
				     " concat('<a href=default.asp?pageToShow=ShowUserSearch&action=dilit&queryId=' , queryId ,  '>" & _ 
				     " <font color=red>Abfrage löschen</font></a>') as DelAktion " & _ 
				     " from userSearches where IntervalInDays<>0 and SID=" & getSID() & _ 
				     " ORDER BY CreatedOn desc " 

else 

				SQL= "select QueryId, SQLDescription, " & _ 
				     "'<a href=default.asp?pageToShow=ShowUserSearch&action=run&queryId=' & queryId &  '>" & _ 
				     " <font color=blue>Ergebnisliste zeigen</font></a>' as Aktion, " & _			     
				     "'<a href=default.asp?pageToShow=ShowUserSearch&action=dilit&queryId=' & queryId &  '>" & _ 
				     " <font color=red>Abfrage löschen</font></a>' as DelAktion " & _ 
				     " from userSearches where IntervalInDays<>0 and SID=" & getSID() & _ 
				     " ORDER BY CreatedOn desc " 
				'objConnectionExecute (SQL)
end if 
				
				ListUserSearches = sqlToHTML(SQL,true,true)
end function 

'show only the last search 
public function ListUserLastSearch()
 if Session("DbType")="MySQL" then
				SQL= "select '" & getTranslation("Ihre letzte Abfrage") & ":' as Description, concat('<b>',SQLDescription,'</b>'), " & _ 
				     "concat('<a href=default.asp?pageToShow=ShowUserSearch&action=run&queryId=' , queryId ,  '>" & _ 
				     " <font color=blue>Ergebnisliste zeigen</font></a>') as Aktion " & _
				     " from userSearches where IntervalInDays<>0 and sId=" & getSID() & _ 
				     " ORDER BY CreatedOn desc " & _ 
				     " LIMIT 1"
else 
				SQL= "select '" & getTranslation("Ihre letzte Abfrage") & ":' as Description, SQLDescription, " & _ 
				     "'<a href=default.asp?pageToShow=ShowUserSearch&action=run&queryId=' & queryId &  '>" & _ 
				     " <font color=blue>Ergebnisliste zeigen</font></a>' as Aktion " & _ 
				     " from userSearches where IntervalInDays<>0 and sId=" & getSID() & _ 
				     " ORDER BY CreatedOn desc " 
				'objConnectionExecute (SQL)
end if 
				
				ListUserLastSearch = sqlToHTML(SQL,true,true)
end function 

%>