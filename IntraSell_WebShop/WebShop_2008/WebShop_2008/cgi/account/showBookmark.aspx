<script language="VB" runat="server">  
    Sub showBoomarks()
        
        If getLOGIN() = "" Then
            Response.Write(getTranslation("Sie sind nicht angemeldet!"))
            'request("nextPageToShow") = "warenkorbStep1"
        Else 'logged 
   

            If Request("action") = "dilete" Then
                SQL = "delete from UserBookmarks " & _
                      " WHERE UserId=" & getLOGIN() & " and BookmarkId=" & Request("BookmarkId")
                ObjConnectionExecute(SQL)
                Response.Write(getTranslation("Bookmark wurde erfolgreich gel�scht!"))
                Response.Write("<br>")

            End If

    
            Dim descTyp
            descTyp = cleanUserInput(Request("description"))
    
            ' Select all the parents.
            SQL = "Select * From UserBookmarks where (UserId=" & _
                  getLOGIN() & ")" & " and Description like '" & descTyp & "'"
            RSParents = Server.CreateObject("ADODB.Recordset")
            RSParents.Open(SQL, ObjConnection, 2, 3, 1)

            'The main parent loop
            If RSParents.EOF Then
                Response.Write(getTranslation("Sie haben keine Bookmarks!"))
            End If

            Do While Not RSParents.EOF
                Response.Write("<li><a href='" & RSParents("URL").Value & "'> " & rsParents("Name").Value & "</a>")
                'DELETE ACTION
                Response.Write("  <a href='default.aspx?pageToshow=MyBookmarks&description=" & descTyp & "&action=dilete&bookmarkid=" & RSParents("BookmarkId").Value & "'><font color=red> " & getTranslation("l�schen") & "</font></a>")
                RSParents.MoveNext()
            Loop
            RSParents.Close()
		
        End If ' logged	
    End Sub
</script>

