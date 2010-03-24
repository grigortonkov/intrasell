<%

'Expected Params: 
'QueryID, Action or Nothing For List
 
dim QueryId, ActionQuery
 
	QueryId = cleanUserInput(request("QueryId")) 
	ActionQuery = cleanUserInput(request("Action")) 
	
    Session("USERID") = getLOGIN()


  message = getTranslation("Ihre gespeicherte Abfragen")		
  Response.Write message & "<br>"
                
                
                    
if ActionQuery = "dilit" and QueryId = "" then 
     Response.Write "Es fehlt ein Parameter QueryId=" & QueryId& "!"
end if 
'DELETE ACTION 
if ActionQuery = "dilit" and QueryId <> "" then 
			SQL= "delete from userQueries where QueryId = " & QueryId & " and UserId=" & getLOGIN()
			objConnectionExecute (SQL)
			 Response.Write "Erfolgreich gelöscht wurde QueryId=" & QueryId& "!"
end if 


'UPDATE ACTION 
if ActionQuery = "deactivate" and QueryId <> "" then 
			SQL= "update userQueries set IntervalInDays=0 where QueryId = " & QueryId & " and UserId=" & getLOGIN()
			objConnectionExecute (SQL)
			Response.Write getTranslation("Erfolgreich deaktiviert!") & " QueryId=" & QueryId
end if 

'UPDATE ACTION 
if ActionQuery = "activate" and QueryId <> "" then 
			SQL= "update userQueries set IntervalInDays=1 where QueryId = " & QueryId & " and UserId=" & getLOGIN()
			objConnectionExecute (SQL)
			Response.Write getTranslation("Erfolgreich aktiviert!") & " QueryId=" & QueryId
end if 

'RUN ACTION 
if ActionQuery = "run" and QueryId <> "" then 
			SQL= "select * from userQueries where QueryId = " & QueryId & " and UserId=" & getLOGIN()
			dim rsQ: set rsQ = objConnectionExecute (SQL)
			if not rsQ.eof then 'erfolg 
			    dim wherePart : wherePart = replace(rsQ("SQLString"),"~","'") 
			    dim whereDesc : whereDesc = replace(rsQ("SQLDescription"),"~","'") 
				Response.Write "Erfolgreich gezeigt wurde QueryId=" & QueryId& "!"
				
				Response.write makeProductListOnQuery(wherePart, "", "", whereDesc)	
			end if  
			
end if 


'LIST QUERIES  
if getLOGIN()&"" = "" then 
				Response.Write "<font color=red>" &  getTranslation("Sie sind nicht angemeldet!") & "</font><br>"
				'load login page
				accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
				Response.Write accountLoginPageHTML
else 'logged

                response.Write  ListUserQueries() 

end if 				
 
 
public function ListUserQueries()

				SQL= "select QueryId, SQLDescription, " & _ 
				     "'<a href=default.aspx?pageToShow=ShowUserQuery&action=run&queryId=' & queryId &  '>" & _ 
				     " <font color=blue>Ergebnisliste zeigen</font></a>' as Aktion, " & _
				     "'<a href=default.aspx?pageToShow=ShowUserQuery&action=deactivate&queryId=' & queryId &  '>" & _ 
				     " <font color=black>Autoemail deaktivieren</font></a>' as AutomatischeEmail, " & _  				     
				     "'<a href=default.aspx?pageToShow=ShowUserQuery&action=dilit&queryId=' & queryId &  '>" & _ 
				     " <font color=red>Abfrage löschen</font></a>' as DelAktion " & _ 
				     "from userQueries where IntervalInDays<>0 and UserId=" & getLOGIN() & _
				     " UNION " & _ 
				     "select QueryId, SQLDescription, " & _ 
				     "'<a href=default.aspx?pageToShow=ShowUserQuery&action=run&queryId=' & queryId &  '>" & _ 
				     " <font color=blue>Ergebnisliste zeigen</font></a>' as Aktion, " & _
				     "'<a href=default.aspx?pageToShow=ShowUserQuery&action=activate&queryId=' & queryId &  '>" & _ 
				     " <font color=green>Autoemail aktivieren</font></a>' as AutomatischeEmail, " & _  				     
				     "'<a href=default.aspx?pageToShow=ShowUserQuery&action=dilit&queryId=' & queryId &  '>" & _ 
				     " <font color=red>Abfrage löschen</font></a>' as DelAktion " & _ 
				     "from userQueries where IntervalInDays=0 and UserId=" & getLOGIN()
				'objConnectionExecute (SQL)
				
				ListUSerQueries = sqlToHTML(SQL,true,true)
end function 
%>
