<script language="VB" runat="server">  
    Sub saveUserQuery()  
        Dim SQLString As String, SQLDescription As String
        Dim sql As String
        Dim accountLoginPageHTML As String
        
    
        SQLString = Replace(Session("SQLString"), """", "~")
        SQLString = Replace(Session("SQLString"), "'", "~")
        SQLDescription = cleanUserInput(Session("SQLDescription"))
        Session("USERID") = getLOGIN()
    
        If SQLString = "" Or SQLDescription = "" Then
            'Response.Write "Es fehlen die Parameter SQLString=" &SQLDescription& " oder SQLDescription=" & SQLDescription &"!"
        Else
    
            If getLOGIN() & "" = "" Then
                Response.Write("<font color=red>" & getTranslation("Sie sind nicht angemeldet!") & "</font><br />")
                'load login page
                accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
                Response.Write(accountLoginPageHTML)
            Else 'logged
                'Prüfung ob die Abfrage bereits gibt 
                sql = "SELECT * FROM userQueries where SQLDescription='" & SQLDescription & "' and UserID=" & getLOGIN()
                'response.write SQL
                Dim rsPruef : rsPruef = ObjConnectionExecute(sql)
                If Not rsPruef.EOF Then
                    message = getTranslation("Solche Abfrage wurde bereits gespeichert!")
                Else
                    sql = "Insert into userQueries(QueryId, UserID, SQLString, SQLDescription) values ("
                    sql = sql & nextId("userQueries", "QueryId") & ", "
                    sql = sql & getLOGIN() & ","
                    sql = sql & "'" & SQLString & "', "
                    sql = sql & "'" & SQLDescription & "')"
                    objConnectionExecute(sql)
                    message = getTranslation("Ihre Abfrage wurde erfolgreich gespeichert!")
                End If
                rsPruef.close()
                Response.Write(message & "<br /><br /><br />")
                Response.Write(ListUserQueries())
            End If
        End If
    End Sub
</script>

