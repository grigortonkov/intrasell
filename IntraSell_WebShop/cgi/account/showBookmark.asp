

<%

   if getLOGIN() = "" then 
      Response.Write getTranslation("Sie sind nicht angemeldet!")
      'request("nextPageToShow") = "warenkorbStep1"
   else 'logged 
   

   if request("action") = "dilete" then 
      SQL = "delete from UserBookmarks " & _ 
            " WHERE UserId=" & getLOGIN() & " and BookmarkId=" & request("BookmarkId") 
      ObjConnectionExecute(SQL)
      Response.Write getTranslation("Bookmark wurde erfolgreich gelöscht!")
      REsponse.write "<br>"

   end if 

    
    Dim descTyp:
    descTyp  = cleanUserInput(request("description"))
    
  		' Select all the parents.
		SQL = "Select * From UserBookmarks where (UserId=" &  _ 
		      getLOGIN() & ")" & " and Description like '" & descTyp & "'"
		Set RSParents = Server.CreateObject("ADODB.Recordset")
		RSParents.Open SQL, ObjConnection, 2, 3, 1

		'The main parent loop
		if RSParents.EOF then
		    Response.Write getTranslation("Sie haben keine Bookmarks!")
		end if 

		Do While Not RSParents.EOF
			Response.Write "<li><a href='" & RSParents("URL")& "'> " & rsParents("Name") & "</a>" 
                       'DELETE ACTION
                        Response.Write "  <a href='default.asp?pageToshow=MyBookmarks&description=" & descTyp   & "&action=dilete&bookmarkid=" & RSParents("BookmarkId") & "'><font color=red> " & getTranslation("löschen") & "</font></a>" 		
			RSParents.MoveNext
		Loop
		RSParents.Close 
		
	end if ' logged	
		
		
%>
