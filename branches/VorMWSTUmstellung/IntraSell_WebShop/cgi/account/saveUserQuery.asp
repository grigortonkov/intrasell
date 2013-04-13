
<%
dim SQLString, SQLDescription
	SQLString = replace(Session("SQLString"),"""","~"): SQLString = replace(Session("SQLString"),"'","~")
	SQLDescription = cleanUserInput(Session("SQLDescription")) 
    Session("USERID") = getLOGIN()
    
if SQLString = "" or SQLDescription = "" then 
     'Response.Write "Es fehlen die Parameter SQLString=" &SQLDescription& " oder SQLDescription=" & SQLDescription &"!"
else
    
		if getLOGIN()&"" = "" then 
						Response.Write "<font color=red>" &  getTranslation("Sie sind nicht angemeldet!") & "</font><br>"
						'load login page
						accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
						Response.Write accountLoginPageHTML
		else 'logged
'Prüfung ob die Abfrage bereits gibt 
						SQL = "SELECT * FROM userQueries where SQLDescription='" & SQLDescription & "' and UserID=" & getLOGIN() 
						'response.write SQL
                        Dim rsPruef: set rsPruef = ObjConnectionExecute(SQL) 
                        if NOT rsPruef.EOF then 
                               message = getTranslation("Solche Abfrage wurde bereits gespeichert!")	
                        else 						
								SQL= "Insert into userQueries(QueryId, UserID, SQLString, SQLDescription) values ("
								SQL= SQL & nextId( "userQueries", "QueryId" )  & ", "
								SQL= SQL & getLOGIN() & ","   
								SQL= SQL & "'" & SQLString & "', "
								SQL= SQL & "'" & SQLDescription  & "')"
								objConnectionExecute (SQL)
								message = getTranslation("Ihre Abfrage wurde erfolgreich gespeichert!")	
						end if 	
						rsPruef.close
						Response.Write message & "<br><br><br>"
						Response.Write ListUserQueries()
		end if 				
end if
%>