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

const PAGE_BASE_URL = "cgi/account/"

if request("action") <> "add" then %>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
<td valign="top" bgcolor="#F7F7F7"> 
</td>
<td>
</td>
<td valign=top>
<%
end if 

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
Dim action : action = cleanUserInput(Request ("action"))
Dim Uid : Uid = getLOGIN() '----------- it must be changed ! - it is 1 only for testing
if uid ="" then uid = request("uid")

Dim userQuery : userQuery = " and UserId = " & Uid

'error when the user is not loggin 
 if getLOGIN() = "" then 
   call drawErrorBox("Speichern fehlgeschlagen", "Sie sind leider noch nicht angemeldet. Wollen Sie sich einloggen bzw. registrieren?", "", "")
   %>
</body>
</html>
   <%
   Response.End 
 end if 
%>

<%' INTENDED INSERTING
  ' Added by Grigor 
  ' Takes parameters from the requesting Form for later inserting 
  if Request("Method") = "INTENDEDINSERTING" THEN 
	my_name = Request("Title")
	my_descr = Request("Description")
	my_url = Request("URL")
	'Response.Write "INTENDEDINSERTING" & my_url
  END IF 
%>

<%

Level = 0
'On error resume next ' index out of border error on next line :TODO
if inStr(Request("curr_id"),",")>0 then 
	curr_id = Request("curr_id")(1)
end if 
if curr_id = "" then curr_id = 0
if IsNumeric(curr_id) then curr_id = CInt(curr_id)
'REsponse.write "curr_id=" & curr_id
if curr_id > 0 then 
	Set RSNode = Server.CreateObject("ADODB.Recordset")
	SQL = "Select * From UserBookmarks where BookmarkId = " & curr_id & userQuery
	RSNode.Open SQL,ObjConnection, 2, 3, 1
	if not RSNode.EOF then
		my_name = RSNode("Name")
		my_descr = RSNode("Description")
		my_url = RSNode("Url")
	end if	
else	
	Set RSNode = Server.CreateObject("ADODB.Recordset")
	SQL = "Select * From UserBookmarks where UserId = " & Uid
	RSNode.Open SQL,ObjConnection, 2, 3, 1
	if RSNode.EOF then 	message = " Your Bookmark list is empty ! "
	'my_name = "" ' Otherwise overwites the INTENDEDINSERTING setting
	'my_descr = ""
	'my_url = ""
end if	

'We have another parameter that show the action that we need if we delete the object

Select Case action
	Case "delete"
		if curr_id > 0 then 
			Dim isEmpty 
			Dim newCurrent
			SQL = "Select BookmarkID FROM UserBookmarks WHERE PreBookmarkID = " & curr_id
			Set rs = objConnectionExecute (SQL)
			isEmpty = rs.EOF
			SQL = "Select PreBookmarkID as fldr_id FROM UserBookmarks WHERE BookmarkID = " & curr_id
			Set rs = objConnectionExecute (SQL)
			newCurrent = rs("fldr_id")
			if isEmpty then
				SQL = "Delete FROM UserBookmarks WHERE BookMarkID = " & curr_id 
				Set rs = objConnectionExecute (SQL)
				curr_id = newCurrent	
			else
				Message = "You can not delete a non-empty Bookmark	folder!"
			end if
			action = ""	
			my_name = ""
			my_descr = ""
			my_url = ""
			if newCurrent <> 0 then 
				SQL = "Select * FROM UserBookmarks WHERE BookmarkID = " & newCurrent
				Set rs = objConnectionExecute (SQL)
				if not rs.EOF then 
					my_name = Server.HTMLEncode(rs("Name"))
					my_descr = Server.HTMLEncode(rs("Description"))
				end if 
			else 	
				curr_id = 0
				SQL = "Select BookmarkId FROM UserBookmarks"
				Set rs = objConnectionExecute (SQL)
				if rs.EOF then message = " Your Bookmark list is empty ! "
			end if	
		end if	
	Case "add"
		Dim newid
		Dim preid
		newid = nextId( "UserBookmarks", "BookmarkId" ) ' from functionsWMS.asp
		my_name = trim(Request("Title"))
		my_descr = trim(Request("Description"))
		my_url = trim(Request("Url"))
		SQL = "Select Url as prid FROM UserBookmarks WHERE BookmarkID = " & curr_id			
		Set rs = objConnectionExecute (SQL)
		if rs.EOF then preid = "" else preid = rs("prid")	'a check for adding main folder	
		if preid <> "" then ' the current is file and the parent for our new bookmark will be it's parent
			SQL = "Select PreBookmarkId as prid FROM UserBookmarks WHERE BookmarkID = " & curr_id			
			Set rs = objConnectionExecute (SQL)
			preid = rs("prid") 
		else 
			preid = curr_id ' set the user id to take the user bookmarks o this number later
		end if		
		if my_name = "" then
			message="You have to specify a name for the new bookmark"
		else	
			SQL = "SELECT * FROM UserBookmarks WHERE PreBookmarkID = " & preid ' select all nodes at same level
			Set rs = objConnectionExecute (SQL)
			
			do while not rs.EOF
				if rs("Name") = my_name and rs("Url") = my_url then exit do
				rs.moveNext
			Loop
			
			if rs.EOF then 
				SQL= "Insert into userBookmarks(BookMarkId, Url, UserId, PreBookmarkId, Name, Description) values ("
				SQL= SQL & newid & ", "
				SQL= SQL & "'" & my_url & "', "
				SQL= SQL & Uid & ","     '----------------------------------------ADD USER ID
				SQL= SQL & preid & ", "
				SQL= SQL & "'" & my_name & "', "
				SQL= SQL & "'" & my_descr  & "')"
				Set rs = objConnectionExecute (SQL)
				curr_id = newid
				message= "Sie haben erfolgreich ein Bookmark angelegt!"				
				'response.redirect "myAccount.asp" 
			else
				message = "Sie haben schon ein Bookmark mit diesen Namen!"
			end if	
		end if
		
		
		action = ""
		'added special for priceCompare
		'Response.Clear
		Response.write drawMsgBox("Bookmarks",message,"","") 
		'response.end 
					
	Case "update"
		Dim turl
		SQL = "Select * FROM UserBookmarks WHERE BookmarkID = " & curr_id		
		Set rs = objConnectionExecute (SQL)
		if rs.EOF = FALSE and curr_id > 0 then 
			my_name = trim(Request("Title"))
			my_descr = trim(Request("Description"))
			my_url = trim(Request("Url"))
			turl = trim(rs("Url"))
			if  IsNull( turl ) then turl = "" 
			if rs("Name") <> my_name or rs("Description") <> my_descr or turl <> my_url then
				if ( turl <> "" and my_url <> "" ) or ( turl = "" and my_url = "" ) then
					SQL = "Update userBookmarks set "
					SQL = SQL & "Name='" & my_name & "', "
					SQL = SQL & "Url='" & my_url & "', "
					SQL = SQL & "Description='" & my_descr
					SQL = SQL & "' Where BookmarkId =" & curr_id 
					Set rs = objConnectionExecute (SQL)
				else 
					message = "You can not change the type of the Bookmark ( Folder / file ) !"
				end if
				my_url = turl
			else
				'message = " There is nothing to edit ! "
			end if	
					
			
		end if
		action = ""
	Case "send"
		if my_url = "" then	
			message = " You can not send a Folder Bookmark!"
		else	 
			Dim strTo
			if Request.Form("other") <> "" then
				strTo = Request.Form("other")
			else	
				if Request.Form("users")="" then  ' target user is not selected  
					message = " You have to select the the target user or type it's email !"
				else	
					SQL = "Select EMail FROM Users WHERE UserId <>" & Uid ' all other users
					Set rs = objConnectionExecute (SQL)
					strTo = rs("EMail") 'Request.Form("users")
				end if	
			end if
			
			if IsEmail (strTo) = ""  then
				Dim myCDONTSMail
				Dim strFrom
				Dim strSubject
				Dim strMessage
				SQL = "Select EMail FROM Users WHERE UserId = " & Uid ' all other users
				Set rs = objConnectionExecute (SQL)
				strFrom = rs("EMail")
				strSubject = "Bookmark URL!"
				strMessage = Request.Form("url")
				Set myCDONTSMail = CreateObject("CDONTS.NewMail")
				myCDONTSMail.Send strFrom, strTo, strSubject, strMessage, lngImportance
				Set myCDONTSMail  = Nothing
				message = "Mail has been sent."
			else
				message = IsEmail(strTo)
			end if
		end if
		action = ""				
	End Select		

%>

<%'Functions 
Sub Display (txtDisplay, intLevel, ID, url, descr) 
Dim LevelCounter
	if Trim (url) <> "" then %>
       <tr bgcolor=#DDDDDD> 
          <td width="1%">&nbsp;</td>
          <td width="3%"> 
            <input type="radio" name="curr_id" value="<%=ID%>" LANGUAGE="JavaScript" OnClick="LoadId(<%=ID%>)" <%if CInt(id)=CInt(curr_id) then Response.Write ("CHECKED")%>>
          </td>
          <td width="44%">
				<%For LevelCounter = 0 to intLevel %>
					<img src="<%=PAGE_BASE_URL%>img/shim.gif" width="7" height="8"><img src="<%=PAGE_BASE_URL%>img/shim.gif" width="7" height="8">
				<%Next%>
				<img src="<%=PAGE_BASE_URL%>img/icon_text.gif" border="0" width="17" height="16">
				<a href="#" OnClick="window.parent.location='<%=Trim (url)%>'">
				<%Response.Write(Trim(txtDisplay))%></a>
			</td>
          <td width="52%"><%=descr%></td>
        </tr>
<%else%>
       <tr> 
          <td width="1%">&nbsp;</td>
          <td width="3%"> 
			<input type="radio" name="curr_id" value="<%=ID%>" LANGUAGE="JavaScript" OnClick="LoadId(<%=ID%>)" <%if CInt(id)=CInt(curr_id) then Response.Write ("CHECKED")%>>
          </td>
          <td width="44%">
				<%For LevelCounter = 0 to intLevel %>
					<img src="<%=PAGE_BASE_URL%>img/shim.gif" width="7" height="8"><img src="<%=PAGE_BASE_URL%>img/shim.gif" width="7" height="8">
				<%Next%>
				<img src="<%=PAGE_BASE_URL%>img/icon_closedFolder.gif" border="0" width="27" height="15">
				<b>				
				<%Response.Write(Trim(txtDisplay) & "<BR>")%></a></b>
			</td>
          <td width="52%"><%=descr%></td>
        </tr>
        
<%end if%>

<%End Sub

Sub OutputChildren(idParent, intLevel)
Dim RSChildren
	'Select the Children
	' Create the children object
		Set RSChildren = Server.CreateObject("ADODB.Recordset")
		SQL = "Select * From UserBookmarks where PreBookmarkId = " & idParent & userQuery
		RSChildren.Open SQL, ObjConnection, 2,3 ,1
		Do While Not RSChildren.EOF
			Display RSChildren("Name"), intLevel, RSChildren("BookmarkId"), RSChildren("URL"), RSChildren("Description")
			OutputChildren RSChildren("BookmarkId"), intLevel + 1
			RSChildren.MoveNext
		Loop
		RSChildren.Close
		Set RSChildren = Nothing
	'end if
End Sub

Function IsEmail(myValue)
    Dim theRest
    Dim warn
    warn = " Incorrect e-mail address!"
    if inStr(1,myValue,"@") <> 0 and inStr(1,myValue,".") <> 0 then
		IsEmail = "" 
		theRest=right(myValue,Len(myValue)-inStr(1,myValue,"@"))
		if inStr(1,theRest,"@") <> 0 or right(myValue,1) = "@" or right(myValue,1) = "." or left(myValue,1) = "." or left(myValue,1) = "@" then
			IsEmail = warn
	    else
			if inStr(1,myValue,"@") = inStr(1,myValue,".")+1 or inStr(1,myValue,"@") = inStr(1,myValue,".")-1 then
				IsEmail = warn
			else 
				if inStr(1,myValue,"..") <> 0 then	IsEmail = warn
			end if	
		end if
	else
		IsEmail = warn
	end if
End Function				

			
%>

<%
Dim butArr(5,2)
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

 

<SCRIPT LANGUAGE="JavaScript">
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
</SCRIPT>



<form name="bookmark" action="default.asp" method="POST">
<input type=hidden name=pageToShow value=Bookmarks>
<table width="800" align=center border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <th width="48%">Bookmark-Verwaltung </th>
   <!--
    <input type="Button" class="SubmitButton" Value = "zureuck" 
    OnClick="document.location='main.asp';">
    -->
  </tr>
  <%'Response.Write " CID=" & curr_id & " <br> "%>
  <tr> 
    <td colspan="21"> 
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <HR>
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
    <td  <%if message <> "" then %>bgcolor="#FF0000"<%else%>bgcolor=""<%end if%> >
	<font size="2"><b><i><%Response.Write(message)%></i></b></font>
  </tr>
  <tr valign="top"> 
    <td width="48%"> 
      <div align="right">Bezeichnung 
        <input type="text" name="title" value="<%=my_name%>" >
      </div>
    </td>
    <td width="52%">
    <input name="action" type="hidden" value="">
    <input name="curr_id" type="hidden" value="<%=curr_id%>">
    </td>
  </tr>
  <tr> 
    <td height="8" width="48%"> 
      <div align="right">Kurzbeschreibung (optional) 
        <input type="text" name="description" value="<%=my_descr%>">
      </div>
    </td>
    <td height="8" width="52%">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<td width="44%">
		<div align="center">
		<input type="Button" class="SubmitButton" Value = "aktualisieren" 
        <%if curr_id > 0 then %> OnClick="doSubmit('update');"
        <%else%> OnClick="alert('You have to select a Bookmark first !');"
        <%End if%>>
    </td>    
	<td width="28%">
		<input type="Button" class="SubmitButton" Value = "loeschen" 
        <%if curr_id > 0 then %> OnClick="doSubmit('delete');"
        <%else%> OnClick="alert('You have to select a Bookmark first !');"
        <%End if%>>
		</div>
    </td>    
	<td width="28%"><!--		
		<input type="Button" class="SubmitButton" Value = "anlegen" OnClick="doSubmit('add');">-->
		
    </td>
    </table>    
    </td>
  </tr>
  <tr> 
    <td width="48%"> 
      <div align="right">Web-Link (optional) 
        <input type="text" name="url" value="<%=my_url%>">
      </div>
    </td>
    <td width="52%">&nbsp;</td>
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
