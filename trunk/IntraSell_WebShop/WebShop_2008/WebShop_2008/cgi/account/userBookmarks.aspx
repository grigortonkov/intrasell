<!--
<html>
<head>
<title>Bookmarks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="../../style.css" type="text/css" rel="stylesheet">
</head>
<body >
-->
<%

    Const PAGE_BASE_URL = "cgi/account/"

    If Request("action") <> "add" Then%>
<table border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td valign="top" bgcolor="#F7F7F7">
        </td>
        <td>
        </td>
        <td valign="top">
            <%
            End If

            'Define ADO Related Objects
            'Dim ObjConnection
            Dim RSNode
            'Dim SQL 
            Dim RSParents
            Dim rs ' temp recordset
            'Define the Variables for Tree and Node
            Dim Level
            Dim curr_id 'bookmark id
            Dim my_name
            Dim my_descr
            Dim my_url
            'Dim message : message = ""
            Dim action : action = cleanUserInput(Request("action"))
            Dim Uid : Uid = getLOGIN() '----------- it must be changed ! - it is 1 only for testing
            If Uid = "" Then Uid = Request("uid")

            Dim userQuery : userQuery = " and UserId = " & Uid

            'error when the user is not loggin 
            If getLOGIN() = "" Then
                Call drawErrorBox("Speichern fehlgeschlagen", "Sie sind leider noch nicht angemeldet. Wollen Sie sich einloggen bzw. registrieren?", "", "")
            %>
            </body> </html>
            <%
                Response.End()
            End If
            %>
            <%  ' INTENDED INSERTING
                ' Added by Grigor 
                ' Takes parameters from the requesting Form for later inserting 
                If Request("Method") = "INTENDEDINSERTING" Then
                    my_name = Request("Title")
                    my_descr = Request("Description")
                    my_url = Request("URL")
                    'Response.Write "INTENDEDINSERTING" & my_url
                End If
            %>
            <%

                Level = 0
                'On error resume next ' index out of border error on next line :TODO
                If InStr(Request("curr_id"), ",") > 0 Then
                    curr_id = Request("curr_id")(1)
                End If
                If curr_id = "" Then curr_id = 0
                If IsNumeric(curr_id) Then curr_id = CInt(curr_id)
                'REsponse.write "curr_id=" & curr_id
                If curr_id > 0 Then
                    RSNode = Server.CreateObject("ADODB.Recordset")
                    SQL = "Select * From UserBookmarks where BookmarkId = " & curr_id & userQuery
                    RSNode.Open(SQL, ObjConnection, 2, 3, 1)
                    If Not RSNode.EOF Then
                        my_name = RSNode("Name")
                        my_descr = RSNode("Description")
                        my_url = RSNode("Url")
                    End If
                Else
                    RSNode = Server.CreateObject("ADODB.Recordset")
                    SQL = "Select * From UserBookmarks where UserId = " & Uid
                    RSNode.Open(SQL, ObjConnection, 2, 3, 1)
                    If RSNode.EOF Then message = " Your Bookmark list is empty ! "
                    'my_name = "" ' Otherwise overwites the INTENDEDINSERTING setting
                    'my_descr = ""
                    'my_url = ""
                End If

                'We have another parameter that show the action that we need if we delete the object

                Select Case action
                    Case "delete"
                        If curr_id > 0 Then
                            Dim isEmpty
                            Dim newCurrent
                            SQL = "Select BookmarkID FROM UserBookmarks WHERE PreBookmarkID = " & curr_id
                            rs = objConnectionExecute(SQL)
                            isEmpty = rs.EOF
                            SQL = "Select PreBookmarkID as fldr_id FROM UserBookmarks WHERE BookmarkID = " & curr_id
                            rs = objConnectionExecute(SQL)
                            newCurrent = rs("fldr_id")
                            If isEmpty Then
                                SQL = "Delete FROM UserBookmarks WHERE BookMarkID = " & curr_id
                                rs = objConnectionExecute(SQL)
                                curr_id = newCurrent
                            Else
                                Message = "You can not delete a non-empty Bookmark	folder!"
                            End If
                            action = ""
                            my_name = ""
                            my_descr = ""
                            my_url = ""
                            If newCurrent <> 0 Then
                                SQL = "Select * FROM UserBookmarks WHERE BookmarkID = " & newCurrent
                                rs = objConnectionExecute(SQL)
                                If Not rs.EOF Then
                                    my_name = Server.HtmlEncode(rs("Name"))
                                    my_descr = Server.HtmlEncode(rs("Description"))
                                End If
                            Else
                                curr_id = 0
                                SQL = "Select BookmarkId FROM UserBookmarks"
                                rs = objConnectionExecute(SQL)
                                If rs.EOF Then message = " Your Bookmark list is empty ! "
                            End If
                        End If
                    Case "add"
                        Dim newid
                        Dim preid
                        newid = nextId("UserBookmarks", "BookmarkId") ' from functionsWMS.asp
                        my_name = Trim(Request("Title"))
                        my_descr = Trim(Request("Description"))
                        my_url = Trim(Request("Url"))
                        SQL = "Select Url as prid FROM UserBookmarks WHERE BookmarkID = " & curr_id
                        rs = objConnectionExecute(SQL)
                        If rs.EOF Then preid = "" Else preid = rs("prid") 'a check for adding main folder	
                        If preid <> "" Then ' the current is file and the parent for our new bookmark will be it's parent
                            SQL = "Select PreBookmarkId as prid FROM UserBookmarks WHERE BookmarkID = " & curr_id
                            rs = objConnectionExecute(SQL)
                            preid = rs("prid")
                        Else
                            preid = curr_id ' set the user id to take the user bookmarks o this number later
                        End If
                        If my_name = "" Then
                            message = "You have to specify a name for the new bookmark"
                        Else
                            SQL = "SELECT * FROM UserBookmarks WHERE PreBookmarkID = " & preid ' select all nodes at same level
                            rs = objConnectionExecute(SQL)
			
                            Do While Not rs.EOF
                                If rs("Name") = my_name And rs("Url") = my_url Then Exit Do
                                rs.moveNext()
                            Loop
			
                            If rs.EOF Then
                                SQL = "Insert into userBookmarks(BookMarkId, Url, UserId, PreBookmarkId, Name, Description) values ("
                                SQL = SQL & newid & ", "
                                SQL = SQL & "'" & my_url & "', "
                                SQL = SQL & Uid & ","     '----------------------------------------ADD USER ID
                                SQL = SQL & preid & ", "
                                SQL = SQL & "'" & my_name & "', "
                                SQL = SQL & "'" & my_descr & "')"
                                rs = objConnectionExecute(SQL)
                                curr_id = newid
                                message = "Sie haben erfolgreich ein Bookmark angelegt!"
                                'response.redirect "myAccount.asp" 
                            Else
                                message = "Sie haben schon ein Bookmark mit diesen Namen!"
                            End If
                        End If
		
		
                        action = ""
                        'added special for priceCompare
                        'Response.Clear
                        Response.Write(drawMsgBox("Bookmarks", message, "", ""))
                        'response.end 
					
                    Case "update"
                        Dim turl
                        SQL = "Select * FROM UserBookmarks WHERE BookmarkID = " & curr_id
                        rs = objConnectionExecute(SQL)
                        If rs.EOF = False And curr_id > 0 Then
                            my_name = Trim(Request("Title"))
                            my_descr = Trim(Request("Description"))
                            my_url = Trim(Request("Url"))
                            turl = Trim(rs("Url"))
                            If (turl) Is Nothing Then turl = ""
                            If rs("Name") <> my_name Or rs("Description") <> my_descr Or turl <> my_url Then
                                If (turl <> "" And my_url <> "") Or (turl = "" And my_url = "") Then
                                    SQL = "Update userBookmarks set "
                                    SQL = SQL & "Name='" & my_name & "', "
                                    SQL = SQL & "Url='" & my_url & "', "
                                    SQL = SQL & "Description='" & my_descr
                                    SQL = SQL & "' Where BookmarkId =" & curr_id
                                    rs = objConnectionExecute(SQL)
                                Else
                                    message = "You can not change the type of the Bookmark ( Folder / file ) !"
                                End If
                                my_url = turl
                            Else
                                'message = " There is nothing to edit ! "
                            End If
					
			
                        End If
                        action = ""
                    Case "send"
                        If my_url = "" Then
                            message = " You can not send a Folder Bookmark!"
                        Else
                            Dim strTo
                            If Request.Form("other") <> "" Then
                                strTo = Request.Form("other")
                            Else
                                If Request.Form("users") = "" Then  ' target user is not selected  
                                    message = " You have to select the the target user or type it's email !"
                                Else
                                    SQL = "Select EMail FROM Users WHERE UserId <>" & Uid ' all other users
                                    rs = objConnectionExecute(SQL)
                                    strTo = rs("EMail") 'Request.Form("users")
                                End If
                            End If
			
                            If IsEmail(strTo) = "" Then
                                Dim myCDONTSMail
                                Dim strFrom
                                Dim strSubject
                                Dim strMessage
                                SQL = "Select EMail FROM Users WHERE UserId = " & Uid ' all other users
                                rs = objConnectionExecute(SQL)
                                strFrom = rs("EMail")
                                strSubject = "Bookmark URL!"
                                strMessage = Request.Form("url")
                                myCDONTSMail = CreateObject("CDONTS.NewMail")
                                myCDONTSMail.Send(strFrom, strTo, strSubject, strMessage, lngImportance)
                                myCDONTSMail = Nothing
                                message = "Mail has been sent."
                            Else
                                message = IsEmail(strTo)
                            End If
                        End If
                        action = ""
                End Select

            %>
            <%  'Functions 
Sub Display (txtDisplay, intLevel, ID, url, descr) 
                Dim LevelCounter
                If Trim(url) <> "" Then%>
            <tr bgcolor="#DDDDDD">
                <td width="1%">
                    &nbsp;
                </td>
                <td width="3%">
                    <input type="radio" name="curr_id" value="<%=ID%>" language="JavaScript" onclick="LoadId(<%=ID%>)"
                        <%if CInt(id)=CInt(curr_id) then Response.Write ("CHECKED")%>>
                </td>
                <td width="44%">
                    <%For LevelCounter = 0 To intLevel%>
                    <img src="<%=PAGE_BASE_URL%>img/shim.gif" width="7" height="8"><img src="<%=PAGE_BASE_URL%>img/shim.gif"
                        width="7" height="8">
                    <%Next%>
                    <img src="<%=PAGE_BASE_URL%>img/icon_text.gif" border="0" width="17" height="16">
                    <a href="#" onclick="window.parent.location='<%=Trim (url)%>'">
                        <%Response.Write(Trim(txtDisplay))%></a>
                </td>
                <td width="52%">
                    <%=descr%>
                </td>
            </tr>
            <%Else%>
            <tr>
                <td width="1%">
                    &nbsp;
                </td>
                <td width="3%">
                    <input type="radio" name="curr_id" value="<%=ID%>" language="JavaScript" onclick="LoadId(<%=ID%>)"
                        <%if CInt(id)=CInt(curr_id) then Response.Write ("CHECKED")%>>
                </td>
                <td width="44%">
                    <%For LevelCounter = 0 To intLevel%>
                    <img src="<%=PAGE_BASE_URL%>img/shim.gif" width="7" height="8"><img src="<%=PAGE_BASE_URL%>img/shim.gif"
                        width="7" height="8">
                    <%Next%>
                    <img src="<%=PAGE_BASE_URL%>img/icon_closedFolder.gif" border="0" width="27" height="15">
                    <b>
                        <%Response.Write(Trim(txtDisplay) & "<BR>")%></a></b>
                </td>
                <td width="52%">
                    <%=descr%>
                </td>
            </tr>
            <%End If%>
            <%  End Sub

                Sub OutputChildren(ByVal idParent, ByVal intLevel)
                    Dim RSChildren
                    'Select the Children
                    ' Create the children object
                    RSChildren = Server.CreateObject("ADODB.Recordset")
                    SQL = "Select * From UserBookmarks where PreBookmarkId = " & idParent & userQuery
                    RSChildren.Open(SQL, ObjConnection, 2, 3, 1)
                    Do While Not RSChildren.EOF
                        Display(RSChildren("Name"), intLevel, RSChildren("BookmarkId"), RSChildren("URL"), RSChildren("Description"))
                        OutputChildren(RSChildren("BookmarkId"), intLevel + 1)
                        RSChildren.MoveNext()
                    Loop
                    RSChildren.Close()
                    RSChildren = Nothing
                    'end if
                End Sub

                Function IsEmail(ByVal myValue)
                    Dim theRest
                    Dim warn
                    warn = " Incorrect e-mail address!"
                    If InStr(1, myValue, "@") <> 0 And InStr(1, myValue, ".") <> 0 Then
                        IsEmail = ""
                        theRest = Right(myValue, Len(myValue) - InStr(1, myValue, "@"))
                        If InStr(1, theRest, "@") <> 0 Or Right(myValue, 1) = "@" Or Right(myValue, 1) = "." Or Left(myValue, 1) = "." Or Left(myValue, 1) = "@" Then
                            IsEmail = warn
                        Else
                            If InStr(1, myValue, "@") = InStr(1, myValue, ".") + 1 Or InStr(1, myValue, "@") = InStr(1, myValue, ".") - 1 Then
                                IsEmail = warn
                            Else
                                If InStr(1, myValue, "..") <> 0 Then IsEmail = warn
                            End If
                        End If
                    Else
                        IsEmail = warn
                    End If
                End Function

			
            %>
            <%
                Dim butArr(5, 2)
butArr(1,1) = "Profil_&auml;ndern"
butArr(2,1) = "Passwort_&auml;ndern"
butArr(3,1) = "Bookmarks"
butArr(4,1) = "neuer_Account"
butArr(5,1) = "Logout"
butArr(1,2) = "myProfile.asp"
butArr(2,2) = "ChangePassword.asp"
butArr(3,2) = "userBookmarks.asp?curr_Id=" & getLOGIN() & "&curr_Id=" & getLOGIN()
butArr(4,2) = "profileCreate.asp"
butArr(5,2) = "logout.asp"
                'call drawWindowPart1("Bookmarks"," ","", butArr)
            %>

            <script language="JavaScript">
	function LoadId( i) {
		document.forms("bookmark").item("curr_id").value = i ;
		document.forms("bookmark").submit();
	}
	function doSubmit(i) {
		var truefalse
		//if ( ( i == 'update' ) )//&& 
//		     truefalse = window.confirm(' You can not do that !');
		var str = i.toString() ;
		
		truefalse = true; //message not wished from BENE 
		                  //window.confirm(' You are about to ' + str + ' current bookmark !');
		if(truefalse) {
			document.forms("bookmark").item("action").value = i ;
			document.forms("bookmark").submit();
		}
	}	
            </script>

            <form name="bookmark" action="default.asp" method="POST">
            <input type="hidden" name="pageToShow" value="Bookmarks">
            <table width="800" align="center" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <th width="48%">
                        Bookmark-Verwaltung
                    </th>
                    <!--
    <input type="Button" class="SubmitButton" Value = "zureuck" 
    OnClick="document.location='main.asp';">
    -->
                </tr>
                <%'Response.Write " CID=" & curr_id & " <br> "%>
                <tr>
                    <td colspan="21">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <hr>
                            <%
                                ' Select all the parents.
		SQL = "Select * From UserBookmarks where (PreBookmarkId=0 or PreBookmarkId=" & Uid & ")" & userQuery
		Set RSParents = Server.CreateObject("ADODB.Recordset")
		RSParents.Open SQL, ObjConnection, 2, 3, 1

                                'The main parent loop

		Do While Not RSParents.EOF
			Display RSParents("Name"), Level, RSParents("BookmarkId"), RSParents("URL"), RSParents("Description")
			OutputChildren RSParents("BookmarkId"), Level + 1
			RSParents.MoveNext
		Loop
                            %>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td <%if message <> "" then %>bgcolor="#FF0000" <%else%>bgcolor="" <%end if%>>
                        <font size="2"><b><i>
                            <%Response.Write(message)%></i></b></font>
                </tr>
                <tr valign="top">
                    <td width="48%">
                        <div align="right">
                            Bezeichnung
                            <input type="text" name="title" value="<%=my_name%>">
                        </div>
                    </td>
                    <td width="52%">
                        <input name="action" type="hidden" value="">
                        <input name="curr_id" type="hidden" value="<%=curr_id%>">
                    </td>
                </tr>
                <tr>
                    <td height="8" width="48%">
                        <div align="right">
                            Kurzbeschreibung (optional)
                            <input type="text" name="description" value="<%=my_descr%>">
                        </div>
                    </td>
                    <td height="8" width="52%">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <td width="44%">
                                <div align="center">
                                    <input type="Button" class="SubmitButton" value="aktualisieren" <%if curr_id > 0 then %>
                                        onclick="doSubmit('update');" <%else%> onclick="alert('You have to select a Bookmark first !');"
                                        <%End if%>>
                            </td>
                            <td width="28%">
                                <input type="Button" class="SubmitButton" value="loeschen" <%if curr_id > 0 then %>
                                    onclick="doSubmit('delete');" <%else%> onclick="alert('You have to select a Bookmark first !');"
                                    <%End if%>>
                                </div>
                            </td>
                            <td width="28%">
                                <!--		
		<input type="Button" class="SubmitButton" Value = "anlegen" OnClick="doSubmit('add');">-->
                            </td>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="48%">
                        <div align="right">
                            Web-Link (optional)
                            <input type="text" name="url" value="<%=my_url%>">
                        </div>
                    </td>
                    <td width="52%">
                        &nbsp;
                    </td>
                </tr>
                <!-- 
  <tr> 
    <td align="right" width="48%">Senden an 
      <select name="users">
        <option selected value="">--bitte ausw&auml;hlen--</option>
        <%
        'SQL = "Select * FROM Users WHERE UserId <>" & Uid ' all other users
        'Set rs = objConnectionExecute (SQL)
        'while not rs.EOF%>
			<option value="<%'=rs("email")%>"><%'=rs("UserName")%></option>
			<%'rs.MoveNext
		'wend%>				
      </select>
      <br>
      oder 
      <input type="text" name="other">
    </td>
    <td width="52%"><img src="<%=PAGE_BASE_URL%>img/shim.gif" width="25" height="8" >
      <input type="Button"  class="button" Value = "senden" 
      OnClick="doSubmit('send');">
  </tr>
  -->
            </table>
            </form>
            <%'call drawWindowPart2("Bookmarks"," ","", butArr)%>
        </td>
    </tr>
</table>
<%
Set RSParents = Nothing
Set RSNode = Nothing
%>