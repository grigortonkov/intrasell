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

Sub ShowLogin
%>
<form action="default.aspx" method="post">
<div align="center">
    <center>
        <table width="316" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0"
            cellspacing="0">
            <tr>
                <td width="152">
                    <p align="center">
                        <img hspace="0" id="IMG1" src="../company/images/company.gif">
                </td>
                <td width="150">
                    <p align="center">
                        <br>
                        <b><font face="Verdana" size="2">Admin Login<br>
                        </font></b>
                        <br>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td width="152">
                    <font face="Verdana" size="2">User Name : </font>
                </td>
                <td width="150">
                    <input type="text" name="username" size="20">
                </td>
            </tr>
            <tr>
                <td width="152">
                    <font face="Verdana" size="2">Password : </font>
                </td>
                <td width="150">
                    <input type="password" name="userpwd" size="20">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="hidden" name="login" value="true">
                    <input type="submit" value="Login">
                </td>
            </tr>
        </table>
    </center>
</div>
</form>
<center>
    <font size="1">* Wenn Sie das erste mal hier sind, verwenden Sie: Name:<b>WebShop</b>
        und Passwort:<b>123</b> </font>
</center>
<%
    Response.End()
End Sub

Sub CheckLogin()
    Response.Write("Check login for " & Request.Form("username") & "|" & Request.Form("userpwd"))
    If LCase(Request.Form("username")) = LCase(VARVALUE("ADMIN")) And LCase(Request.Form("userpwd")) = LCase(VARVALUE("ADMINPASS")) Then
        Session("UserLoggedIn") = "true"
        Session("ADMIN") = "TRUE" 'used to show "product bearbeiten" in normal shop
        Response.Redirect("default.aspx")
    Else
%><font color="#FF0000">Login Failed.</font><br>
<% 
    ShowLogin()
End If
End Sub
%>