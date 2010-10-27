 
<% 
    ' Generic Database - Error Message
    ' Notice: (c) 1998, 1999 Eli Robillard, All Rights Reserved. 
    ' E-Mail: erobillard@ofifc.org
    ' URL: http://www.ofifc.org/Eli/ASP/
    ' Revision History:
    ' 29 Oct 1999 - Improved error handling during Edits
    ' 28 Jun 1999 - If called by an error handler, display the error

    If txtError = "" Then
        ' Default Error message text
        txtError = "Error"
        txtErrorMsg1 = "An Error Occurred"
        txtErrorMsg2 = "Possible causes:"
        txtErrorMsg3 = "You do not have permission to view this page."
        txtErrorMsg4 = "Your session timed out."
        txtErrorMsg5 = "If this problem continues, please notify your system administrator. "
        txtErrorMsg6 = "Please report the above error to your system administrator. "
        txtErrorMsg7 = "Your system administrator will want to know what you clicked to receive this message."
        txtErrorMsg8 = "Scripting error."
    End If
%>
<html>
<head>
    <title>
        <%=txtError%></title>
</head>
<body>
    <font color="RED">
        <h2>
            <%=txtErrorMsg1%></h2>
    </font>
    <hr noshade>
    <p>
        <h3>
            <%=txtErrorMsg2%></h3>
        <% If Session("ErrNumber") = 0 Then%>
        <ul>
            <li><strong>
                <%=txtErrorMsg3%></strong>
                <li><strong>
                    <%=txtErrorMsg4%></strong>
        </ul>
        <%=txtErrorMsg5%>
        <%=txtErrorMsg7%>
        <% ElseIf Session("ErrNumber") = 99 Then%>
        <%= Session("ErrDesc") %>
        <% Else%>
        <ul>
            <li>
                <%=txtErrorMsg8%>
        </ul>
        <%=txtErrorMsg6%>
        <%=txtErrorMsg7%>
        <% End If%>
        <!-- Place custom message/link here to log back in or link to your home page -->
        <!-- <p>Click <a href="">here</a> to log back in. -->
        <% If Session("ErrNumber") <> 0 Then%>
        <p>
            <hr noshade>
            <font size="-1">
                <!-- Error Number: <%= Session("ErrNumber") %><br /> -->
                Error:
                <%= Session("ErrDesc") %><br />
                <!-- Source: <%= Session("ErrSource") %><br /> -->
                Line:
                <%= Session("ErrLine") %><br />
                <%= Session("ErrMsg") %><br />
            </font>
            <%  Session("ErrorNumber") = 0
            End If%>
</body>
</html>
