<%

    'Expected Params: 
    'sidQueryId, Action or Nothing For List
 
    Dim sidQueryId, sidActionQuery
 
    sidQueryId = cleanUserInput(Request("QueryId"))
    sidActionQuery = cleanUserInput(Request("Action"))
       
    If sidActionQuery = "dilit" And sidQueryId = "" Then
     Response.Write "Es fehlt ein Parameter sidQueryId=" & QueryId& "!"
    End If

    'DELETE ACTION 
    If sidActionQuery = "dilit" And sidQueryId <> "" Then
        SQL = "delete from userSearches where QueryId = " & sidQueryId & " and sId=" & getSID()
        objConnectionExecute(SQL)
			 Response.Write "Erfolgreich gelöscht wurde QueryId=" & sidQueryId& "!"
    End If


    'UPDATE ACTION 
    If sidActionQuery = "deactivate" And sidQueryId <> "" Then
        SQL = "update userQueries set IntervalInDays=0 where QueryId = " & sidQueryId & " and SId=" & getSID()
        objConnectionExecute(SQL)
        Response.Write(getTranslation("Erfolgreich deaktiviert!") & " QueryId=" & sidQueryId)
    End If

    'UPDATE ACTION 
    If sidActionQuery = "activate" And sidQueryId <> "" Then
        SQL = "update userQueries set IntervalInDays=1 where QueryId = " & sidQueryId & " and SId=" & getSID()
        objConnectionExecute(SQL)
        Response.Write(getTranslation("Erfolgreich aktiviert!") & " QueryId=" & sidQueryId)
    End If

    'RUN ACTION 
    If sidActionQuery = "run" And sidQueryId <> "" Then
        SQL = "select * from userSearches where QueryId = " & sidQueryId & " and SId=" & getSID()
        Dim rsQ_sid : rsQ_sid = objConnectionExecute(SQL)
        If Not rsQ_sid.eof Then 'erfolg 
            Dim wherePart_sid : wherePart_sid = Replace(rsQ_sid("SQLString"), "~", "'")
            Dim whereDesc_sid : whereDesc_sid = Replace(rsQ_sid("SQLDescription"), "~", "'")
            'Response.Write "Erfolgreich gezeigt wurde QueryId=" & sidQueryId& "!"
            Response.Write(makeProductListOnQuery(wherePart_sid, "", "", whereDesc_sid))
        End If
			
    End If
		
 
%>
