<%
    Dim Url, Folder, Title
    Url = cleanUserInput(Request("Url"))
    Folder = cleanUserInput(Request("folder"))
    Title = cleanUserInput(Request("Title"))
    Session("USERID") = curr_id
    
    'Response.Redirect "../../default.aspx?pagetoShow=Bookmarks&curr_id=" & curr_id & "&action=add&Description=" & Folder & "&Title=" & Title & "&Url="  & Url
    'Response.Redirect "userBookmarks.asp?curr_id=" & curr_id & "&action=add&Description=" & Folder & "&Title=" & Title & "&Url="  & Url



if getLOGIN()&"" = "" or trim(url&"")="" then 
        message = getTranslation("Sie sind nicht angemeldet!")
        Response.Write("<font color=red>" & message & "</font><br>")
        'load login page
	
        accountLoginPageHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/account/myAccountLogin.htm"))
        Response.Write(accountLoginPageHTML)
    Else

        SQL = "Insert into userBookmarks(BookMarkId, Url, UserId, PreBookmarkId, Name, Description) values ("
        SQL = SQL & nextId("UserBookmarks", "BookmarkId") & ", "
        SQL = SQL & "'" & Url & "', "
        SQL = SQL & getLOGIN() & ","
        SQL = SQL & "0, "
        SQL = SQL & "'" & Title & "', "
        SQL = SQL & "'" & Folder & "')"
        objConnectionExecute(SQL)
        message = getTranslation("Sie haben erfolgreich ein Bookmark angelegt!")
        Response.Write(message)
    End If

%>
