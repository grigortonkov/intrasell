<%
    Response.Expires = -1000 'Makes the browser not cache this page
    Response.Buffer = True 'Buffers the content so our Response.Redirect will work
    'Session("UserLoggedIn") = ""
    'User is logged in do not make log check

    If Not Session("UserLoggedIn") = "true" Then
        If Request.Form("login") = "true" Then
            CheckLogin()
        Else
            ShowLogin()
        End If
    End If
%>

<script language="VB" runat="server">
    ''' <summary>
    ''' Log In
    ''' </summary>
    ''' <remarks></remarks>
    Sub ShowLogin()
        Dim content As String = readTextFile(Server.MapPath("loginForm.html"))
        Response.Write(content)
        Response.End()
    End Sub

    ''' <summary>
    ''' Login Check
    ''' </summary>
    ''' <remarks></remarks>
    Sub CheckLogin()
        Response.Write("Check login for " & Request.Form("username") & "|" & Request.Form("userpwd"))
        If LCase(Request.Form("username")) = LCase(VARVALUE("ADMIN")) And LCase(Request.Form("userpwd")) = LCase(VARVALUE("ADMINPASS")) Then
            Session("UserLoggedIn") = "true"
            Session("ADMIN") = "TRUE" 'used to show "product bearbeiten" in normal shop
            Response.Redirect("default.aspx")
        Else
            Response.Write("<font color='#FF0000#>Login Failed.</font><br>")
            ShowLogin()
        End If
    End Sub
</script>

