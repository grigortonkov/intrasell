<script language="VB" runat="server"> 
    
    ''' <summary>
    ''' ShowUserQuery
    ''' </summary>
    ''' <remarks></remarks>
    Sub ShowUserQuery()

        'Expected Params: 
        'QueryID, Action or Nothing For List
        Dim accountLoginPageHTML As String
        
        Dim QueryId, ActionQuery
 
        QueryId = cleanUserInput(Request("QueryId"))
        ActionQuery = cleanUserInput(Request("Action"))
    
        Session("USERID") = getLOGIN()


        message = getTranslation("Ihre gespeicherte Abfragen")
        Response.Write(message & "<br />")
                
                
                    
        If ActionQuery = "dilit" And QueryId = "" Then
            Response.Write("Es fehlt ein Parameter QueryId=" & QueryId & "!")
        End If
        
        'DELETE ACTION 
        If ActionQuery = "dilit" And QueryId <> "" Then
            SQL = "delete from userQueries where QueryId = " & QueryId & " and UserId=" & getLOGIN()
            objConnectionExecute(SQL)
            Response.Write("Erfolgreich gelöscht wurde QueryId=" & QueryId & "!")
            
        End If


        'UPDATE ACTION 
        If ActionQuery = "deactivate" And QueryId <> "" Then
            SQL = "update userQueries set IntervalInDays=0 where QueryId = " & QueryId & " and UserId=" & getLOGIN()
            objConnectionExecute(SQL)
            Response.Write(getTranslation("Erfolgreich deaktiviert!") & " QueryId=" & QueryId)
        End If

        'UPDATE ACTION 
        If ActionQuery = "activate" And QueryId <> "" Then
            SQL = "update userQueries set IntervalInDays=1 where QueryId = " & QueryId & " and UserId=" & getLOGIN()
            objConnectionExecute(SQL)
            Response.Write(getTranslation("Erfolgreich aktiviert!") & " QueryId=" & QueryId)
        End If

        'RUN ACTION 
        If ActionQuery = "run" And QueryId <> "" Then
            SQL = "select * from userQueries where QueryId = " & QueryId & " and UserId=" & getLOGIN()
            Dim rsQ : rsQ = objConnectionExecute(SQL)
            If Not rsQ.eof Then 'erfolg 
                Dim wherePart : wherePart = Replace(rsQ("SQLString").Value, "~", "'")
                Dim whereDesc : whereDesc = Replace(rsQ("SQLDescription").Value, "~", "'")
                Response.Write("Erfolgreich gezeigt wurde QueryId=" & QueryId & "!")
                
                Response.Write(makeProductListOnQuery(wherePart, "", "", whereDesc))
            End If
            
        End If


        'LIST QUERIES  
        If getLOGIN() & "" = "" Then
            Response.Write("<font color=red>" & getTranslation("Sie sind nicht angemeldet!") & "</font><br />")
            'load login page
            accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
            Response.Write(accountLoginPageHTML)
        Else 'logged

            Response.Write(ListUserQueries())

        End If
    End Sub
    
    ''' <summary>
    ''' ListUserQueries
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function ListUserQueries()

        SQL = "select QueryId, SQLDescription, " & _
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
                
        ListUserQueries = sqlToHTML(SQL, True, True)
    End Function
</script>

