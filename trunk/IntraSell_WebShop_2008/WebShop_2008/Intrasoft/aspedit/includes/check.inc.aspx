<%
If Level<>0 then
        If Session("aspEdit_UserName") = "" Then Response.Redirect("users.aspx?action=logon")
        If Int(Session("aspEdit_Level")) < Level Then Response.Redirect("users.aspx?action=level")
end if

%>

<script language="VB" runat="server">
Public Function EnCode(Eingabe)  As String 
	Dim Key=int(len(Eingabe)+2)
	Encode = ""
    Dim i As Integer
	For i = 1 to  Len(Eingabe)
         Encode=Encode & (Chr(key Xor Asc(Mid(Eingabe,  i, 1))))
	next 
End Function

Public Function DeCode(Eingabe) As String
	Dim Key=int(len(Eingabe)+2)
	DeCode = ""
	Dim i As Integer
	For i = 1 to Len(Eingabe)
		 Decode=Decode & (Chr(key Xor Asc(Mid(Eingabe, i, 1))))
	next
End Function

Public Sub  DoAction(ByVal db, ByVal Level)

        Dim rs1
        Dim x As Integer
        Dim Errors As String = ""
        Dim UserName as String = Encode(Request.Form("UserName"))
        Dim Password as String = Encode(Request.Form("Password"))

        Dim action As String = Request.QueryString("action")
 
        If action = "logedit" Then
            Response.Write("<div align='center'>[<a href='users.aspx?action=logdeleteall'>Delete all</a>]<br /><br />	<table border='0' cellpadding='0' cellspacing='0'><tr><td colspan='3' bgcolor='#31618c'><div align='center'><b><font color='white'>Log</font></b></div></td></tr><tr><td width='200' bgcolor='#31618c'><div align='center'><b><font size='-2'>UserName</font></b></div></td><td width='200' bgcolor='#31618c'><div align='center'><font size='-2'><b>Date</b></font></div></td><td bgcolor='#31618c'></td></tr>")
            rs1 = db.execute("SELECT * FROM [user] INNER JOIN log ON user.UserID = log.UserID;")
            Do While Not rs1.EOF
                Response.Write("<tr><td width='200'>" & DeCode(rs1.fields("UserName")) & "</td><td width='200'>" & rs1.fields("LogOnDate") & "</td><td><div align='right'><font size='-2'>[<a href='users.aspx?action=logdelete&logid=" & rs1.fields("LogID") & "'>delete</a>]</font></div></td></tr>")
                rs1.movenext()
            Loop
            Response.Write("</table></div>")
        End If
	
        If action = "logdelete" Then
            If Request.QueryString("logid") <> "" Then
                db.Execute("DELETE * FROM [log] WHERE (((log.logID)=" & Request.QueryString("logid") & "));")
                Response.Write("The specified data of the log has been deleted.<br /><br /><br />Click <a href=users.aspx?action=logedit>here</a> to proceed.")
            Else
                Response.Write("An error occurred: A needed parameter has not been specified.<br /><br /><br />Click <a href=users.aspx?action=logedit>here</a> to proceed.")
            End If
        End If
 
        If action = "logdeleteall" Then
            db.Execute("DELETE * FROM [log];")
            Response.Write("The log has been cleared.<br /><br /><br />Click <a href=users.aspx?action=logedit>here</a> to proceed.")
        End If

        If action = "logon" Then
            Response.Write("<div align='center'><form action='users.aspx?action=dologon' method='post'><table border='0' cellpadding='0' cellspacing='1'><tr><td colspan='2' bgcolor='#31618c'><div align='center'><b><font color='white'>LogOn to aspEdit </font></b></div></td></tr><tr><td bgcolor='#31618c' width='75'><b><font size='-2'>UserName:</font></b></td><td><div align='right'><input type='text' name='UserName' size='24'></div></td></tr><tr><td bgcolor='#31618c' width='75'><b><font size='-2'>Password:</font></b></td><td><div align='right'><input type='password' name='password' size='24'></div></td></tr></table><input type='submit' name='submitButtonName' value='LogOn...'></form></div>")
        End If

        If action = "dologon" Then

            If UserName = "" Then Errors = Errors & "<li>No UserName entered."
            If Password = "" Then Errors = Errors & "<li>No Password entered."
            rs1 = db.Execute("SELECT * FROM user WHERE user.UserName='" & UserName & "' AND user.Password='" & Password & "';")
            If UserName <> "" And Password <> "" And rs1.EOF = True Then Errors = Errors & "<li>Wrong UserName and/or Password."
            If Errors <> "" Then Response.Write("<div align='left'>The following error(s) occured:<ul>" & Errors & "</ul></div><br /><br />Click <a href='javascript:history.back()'>here</a> to try again.")
            If Errors = "" Then
                Session("aspEdit_UserName") = DeCode(UserName)
                Session("aspEdit_Level") = rs1.fields("Level").Value
                'db.Execute("INSERT INTO log(UserID,LogOnDate) VALUES (" & rs1.fields("UserID") & ",'" & now & "');")
                Response.Write("<br />You succesfully logged on.<br /><br /><br />Click <a href='aspedit.aspx'>here</a> to proceed.")
            End If
            rs1.Close()
            rs1 = Nothing
        End If
	
        If action = "level" Then
            Response.Write("You tried to enter a section with a higher Security-Level than yours. You can not enter that section with your current Authentification-Level.<br /><br /><br />Click <a href='aspedit.aspx'>here</a> to proceed or <a href='users.aspx?action=logon'>here</a> to logon with another UserName.")
        End If

        If action = "edit" Then
 
            Response.Write("<div align='center'>[<a href='users.aspx?action=create'>Create new User</a>]<br /><br /><table border='0' cellpadding='0' cellspacing='0'><tr><td colspan='4' bgcolor='#31618c'><div align='center'><b><font color='white'>User-Accounts:</font></b></div></td></tr><tr><td width='200' bgcolor='#31618c'><div align='center'><font size='-2'><b>UserName</b></font></div></td><td width='200' bgcolor='#31618c'><div align='center'><font size='-2'><b>Password</b></font></div></td><td width='150' bgcolor='#31618c'><div align='center'><font size='-2'><b>Authentification-Level</b></font></div></td><td width='70' bgcolor='#31618c'></td></tr>")
            rs1 = db.Execute("SELECT * FROM user")
            Do While Not rs1.EOF
                Response.Write("<tr><td width='200'>" & DeCode(rs1.fields("UserName")) & "</td><td width='200'>" & DeCode(rs1.fields("Password")) & "</td><td width='150'><div align='center'>")
                Level = ""
                For x = 1 To rs1.fields("Level")
                    Level = Level & "I"
                Next
                Response.Write(Level & "</div></td><td width='70'><div align='right'><font size='-2'>[<a href='users.aspx?action=change&userid=" & rs1.fields("UserID") & "'>edit</a>][<a href='users.aspx?action=delete&userid=" & rs1.fields("UserID") & "'>delete</a>]</font></div></td></tr>")
                rs1.MoveNext()
            Loop
            rs1.Close()
            rs1 = Nothing
            Response.Write("</table></div>")
        End If
	
        If action = "delete" Then
            If Request.QueryString("userid") <> "" Then
                db.Execute("DELETE * FROM [user] WHERE (((user.UserID)=" & Request.QueryString("userid") & "));")
                Response.Write("User has been deleted.<br /><br /><br />Click <a href=users.aspx?action=edit>here</a> to proceed.")
            Else
                Response.Write("An error occurred: A needed parameter has not been specified.<br /><br /><br />Click <a href=users.aspx?action=edit>here</a> to proceed.")
            End If
        End If
	
        If action = "create" Then
            Response.Write("<div align='center'><form name='FormName' action='users.aspx?action=docreate' method='post'><table border='0' cellpadding='0' cellspacing='1'><tr><td colspan='2' bgcolor='#31618c'><div align='center'><b><font color='white'>New User</font></b></div></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>UserName:</b></font></td><td><input type='text' name='UserName' size='24'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Password:</b></font></td><td><input type='text' name='Password' size='24'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Authentification-Level:</b></font></td><td><input type='radio' value='1' name='Level' checked>I<br /><input type='radio' value='2' name='Level'>II<br /><input type='radio' value='3' name='Level'>III</td></tr></table><input type='submit' name='submitButtonName' value='Create new User...'></form></div>")
        End If

        If action = "docreate" Then
            UserName = Encode(Request.Form("UserName"))
            Password = Encode(Request.Form("Password"))
            Level = Int(Request.Form("Level"))
            If UserName = "" Then Errors = Errors & "<li>No UserName entered."
            If Password = "" Then Errors = Errors & "<li>No Password entered."
            rs1 = db.Execute("SELECT * FROM user WHERE user.UserName='" & UserName & "';")
            If UserName <> "" And Password <> "" And rs1.EOF <> True Then Errors = Errors & "<li>UserName already exists."
            If Errors <> "" Then Response.Write("<div align='left'>The following error(s) occured:<ul>" & Errors & "</ul></div><br /><br />Click <a href='javascript:history.back()'>here</a> to try again.")
            If Errors = "" Then
                db.Execute("INSERT INTO [user]([UserName],[Password],[Level]) VALUES ('" & UserName & "','" & Password & "'," & Level & ");")
                Response.Write("New User successfully created.<br /><br /><br />Click <a href='users.aspx?action=edit'>here</a> to proceed.")
            End If
            rs1.Close()
            rs1 = Nothing
        End If
	
        If action = "change" Then
            rs1 = db.Execute("SELECT * FROM user WHERE user.userid=" & Request.QueryString("userid") & ";")
            Response.Write("<div align='center'><form name='FormName' action='users.aspx?action=dochange&userid=" & rs1.fields("UserID") & "' method='post'><table border='0' cellpadding='0' cellspacing='1'><tr><td colspan='2' bgcolor='#31618c'><div align='center'><b><font color='white'>Edit User</font></b></div></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>UserName:</b></font></td><td><input type='text' name='UserName' size='24' value='" & DeCode(rs1.fields("UserName")) & "'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Password:</b></font></td><td><input type='text' name='Password' size='24'value='" & DeCode(rs1.fields("Password")) & "'></td></tr><tr><td width='130' bgcolor='#31618c'><font size='-2'><b>Authentification-Level:</b></font></td><td><input type='radio' value='1' name='Level'")
            If rs1.fields("Level") = 1 Then Response.Write("checked")
            Response.Write(">I<br /><input type='radio' value='2' name='Level'")
            If rs1.fields("Level") = 2 Then Response.Write("checked")
            Response.Write(">II<br /><input type='radio' value='3' name='Level'")
            If rs1.fields("Level") = 3 Then Response.Write("checked")
            Response.Write(">III</td></tr></table><input type='submit' name='submitButtonName' value='Save Changes...'><input type='reset' name='resetButtonName' value='ReSet...'></form></div>")
        End If

        If action = "dochange" Then
            If Request.QueryString("userid") <> "" Then
                UserName = Encode(Request.Form("UserName"))
                Password = Encode(Request.Form("Password"))
                Level = Int(Request.Form("Level"))
                If UserName = "" Then Errors = Errors & "<li>No UserName entered."
                If Password = "" Then Errors = Errors & "<li>No Password entered."
                If Errors <> "" Then Response.Write("<div align='left'>The following error(s) occured:<ul>" & Errors & "</ul></div><br /><br />Click <a href='javascript:history.back()'>here</a> to try again.")
                If Errors = "" Then
                    db.Execute("UPDATE [user] SET [user].UserName = '" & UserName & "', [user].[Password] = '" & Password & "', [user].[Level] = " & Level & " WHERE (((user.UserID)=" & Request.QueryString("userid") & "));")
                    Response.Write("Changes successfully saved.<br /><br /><br />Click <a href='users.aspx?action=edit'>here</a> to proceed.")
                End If
            Else
                Response.Write("An error occurred: A needed parameter has not been specified.<br /><br /><br />Click <a href=users.aspx?action=edit>here</a> to proceed.")
            End If
        End If
    End sub
</script>

