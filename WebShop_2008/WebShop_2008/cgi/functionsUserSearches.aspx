<script language="VB" runat="server">  


    ''' <summary>
    '''     'needs: 
    'Session("SQLString")
    'Session("SQLDescription")
    'SID
    ''' </summary>
    ''' <param name="SQLString"></param>
    ''' <param name="SQLDescription"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function saveSessionSearch(ByVal SQLString, ByVal SQLDescription)
        Dim SQL As String
        'response.Write "Save search!" 
        SQLString = Replace(SQLString, """", "~")
        SQLString = Replace(SQLString, "'", "~")
        SQLDescription = cleanUserInput(SQLDescription)
        Dim sid : sid = getSID()
    
        If SQLString = "" Or SQLDescription = "" Then
            'Response.Write "Es fehlen die Parameter SQLString=" & SQLDescription & " oder SQLDescription=" & SQLDescription & "!"
        Else
    
            If sid = "" Then
                Response.Write("<font color=red>" & getTranslation("Ihre Session ist abgelaufen!") & "</font><br />")
            Else 'sid ok
                'Prüfung ob die Abfrage bereits gibt 
                SQL = "SELECT * FROM userSearches where SQLDescription='" & SQLDescription & "' and SID=" & sid
                Dim rsPruef : rsPruef = ObjConnectionExecute(SQL)
                If Not rsPruef.EOF Then
                    message = getTranslation("Solche Abfrage wurde bereits gespeichert!")
                Else
                    SQL = "Insert into userSearches(QueryId, SID, SQLString, SQLDescription) values ("
                    SQL = SQL & nextId("userSearches", "QueryId") & ", "
                    SQL = SQL & getSID() & ","
                    SQL = SQL & "'" & SQLString & "', "
                    SQL = SQL & "'" & SQLDescription & "')"
                    objConnectionExecute(SQL)
                End If
                rsPruef.close()
            End If
        End If
    End Function


    Public Function ListUserSearches()
        Dim sql As String
        
        If Session("DbType") = "MySQL" Then
            sql = "select QueryId, SQLDescription, " & _
                 " concat('<a href=default.aspx?pageToShow=ShowUserSearch&action=run&queryId=' , queryId ,  '>" & _
                 " <font color=blue>Ergebnisliste zeigen</font></a>') as Aktion, " & _
                 " concat('<a href=default.aspx?pageToShow=ShowUserSearch&action=dilit&queryId=' , queryId ,  '>" & _
                 " <font color=red>Abfrage löschen</font></a>') as DelAktion " & _
                 " from userSearches where IntervalInDays<>0 and SID=" & getSID() & _
                 " ORDER BY CreatedOn desc "

        Else

            sql = "select QueryId, SQLDescription, " & _
                 "'<a href=default.aspx?pageToShow=ShowUserSearch&action=run&queryId=' & queryId &  '>" & _
                 " <font color=blue>Ergebnisliste zeigen</font></a>' as Aktion, " & _
                 "'<a href=default.aspx?pageToShow=ShowUserSearch&action=dilit&queryId=' & queryId &  '>" & _
                 " <font color=red>Abfrage löschen</font></a>' as DelAktion " & _
                 " from userSearches where IntervalInDays<>0 and SID=" & getSID() & _
                 " ORDER BY CreatedOn desc "
            'objConnectionExecute (SQL)
        End If
                
        ListUserSearches = sqlToHTML(sql, True, True)
    End Function

    'show only the last search 
    Public Function ListUserLastSearch()
        Dim sql As String
        If Session("DbType") = "MySQL" Then
            sql = "select '" & getTranslation("Ihre letzte Abfrage") & ":' as Description, concat('<b>',SQLDescription,'</b>'), " & _
                 "concat('<a href=default.aspx?pageToShow=ShowUserSearch&action=run&queryId=' , queryId ,  '>" & _
                 " <font color=blue>Ergebnisliste zeigen</font></a>') as Aktion " & _
                 " from userSearches where IntervalInDays<>0 and sId=" & getSID() & _
                 " ORDER BY CreatedOn desc " & _
                 " LIMIT 1"
        Else
            sql = "select '" & getTranslation("Ihre letzte Abfrage") & ":' as Description, SQLDescription, " & _
                 "'<a href=default.aspx?pageToShow=ShowUserSearch&action=run&queryId=' & queryId &  '>" & _
                 " <font color=blue>Ergebnisliste zeigen</font></a>' as Aktion " & _
                 " from userSearches where IntervalInDays<>0 and sId=" & getSID() & _
                 " ORDER BY CreatedOn desc "
            'objConnectionExecute (SQL)
        End If
                
        ListUserLastSearch = sqlToHTML(sql, True, True)
    End Function

</script>

