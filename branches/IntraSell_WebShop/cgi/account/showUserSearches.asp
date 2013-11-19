
<%

'Expected Params: 
'sidQueryId, Action or Nothing For List
 
dim sidQueryId, sidActionQuery
 
	sidQueryId = cleanUserInput(request("QueryId")) 
	sidActionQuery = cleanUserInput(request("Action")) 
       
if sidActionQuery = "dilit" and sidQueryId = "" then 
     Response.Write "Es fehlt ein Parameter sidQueryId=" & QueryId& "!"
end if 

'DELETE ACTION 
if sidActionQuery = "dilit" and sidQueryId <> "" then 
			SQL= "delete from userSearches where QueryId = " & sidQueryId & " and sId=" & getSID()
			objConnectionExecute (SQL)
			 Response.Write "Erfolgreich gelöscht wurde QueryId=" & sidQueryId& "!"
end if 


'UPDATE ACTION 
if sidActionQuery = "deactivate" and sidQueryId <> "" then 
			SQL= "update userQueries set IntervalInDays=0 where QueryId = " & sidQueryId & " and SId=" & getSID()
			objConnectionExecute (SQL)
			Response.Write getTranslation("Erfolgreich deaktiviert!") & " QueryId=" & sidQueryId
end if 

'UPDATE ACTION 
if sidActionQuery = "activate" and sidQueryId <> "" then 
			SQL= "update userQueries set IntervalInDays=1 where QueryId = " & sidQueryId & " and SId=" & getSID()
			objConnectionExecute (SQL)
			Response.Write getTranslation("Erfolgreich aktiviert!") & " QueryId=" & sidQueryId
end if 

'RUN ACTION 
if sidActionQuery = "run" and sidQueryId <> "" then 
			SQL= "select * from userSearches where QueryId = " & sidQueryId & " and SId=" & getSID()
			dim rsQ_sid: set rsQ_sid = objConnectionExecute (SQL)
			if not rsQ_sid.eof then 'erfolg 
			    dim wherePart_sid : wherePart_sid = replace(rsQ_sid("SQLString"),"~","'") 
			    dim whereDesc_sid : whereDesc_sid = replace(rsQ_sid("SQLDescription"),"~","'") 
				'Response.Write "Erfolgreich gezeigt wurde QueryId=" & sidQueryId& "!"
				Response.write makeProductListOnQuery(wherePart_sid, "", "", whereDesc_sid)	
			end if  
			
end if 
		
 
%>


