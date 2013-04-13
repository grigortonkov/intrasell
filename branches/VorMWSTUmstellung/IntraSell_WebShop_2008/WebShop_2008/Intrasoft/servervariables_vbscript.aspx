<%@Page  Language="JScript" %>
<!************************* This sample is provided for educational purposes only.
It is not intended to be used in a production environment, has not been tested in
a production environment, and Microsoft will not provide technical support for it.
*************************>
<html>
<head>
    <title>HTTP Server Variables</title>
</head>
<body bgcolor="White" topmargin="10" leftmargin="10">
    <!-- Display header. -->
    <font size="4" face="ARIAL, HELVETICA"><b>HTTP Server Variables</b></font><br />
    <hr size="1" color="#000000">
    <!-- Use a HTML table to format the server variables -->
    <!-- and respective values. -->
    <table border="1">
        <!-- Table header. -->
        <tr>
            <td>
                <b>Variables</b>
            </td>
            <td>
                <b>Value</b>
            </td>
        </tr>
        <tr>
            <td>
                ALL_HTTP
            </td>
            <td>
                <%= Request.ServerVariables("ALL_HTTP") %>
            </td>
        </tr>
        <tr>
            <td>
                ALL_RAW
            </td>
            <td>
                <%= Request.ServerVariables("ALL_RAW") %>
            </td>
        </tr>
        <tr>
            <td>
                CONTENT_LENGTH
            </td>
            <td>
                <%= Request.ServerVariables("CONTENT_LENGTH") %>
            </td>
        </tr>
        <tr>
            <td>
                CONTENT_TYPE
            </td>
            <td>
                <%= Request.ServerVariables("CONTENT_TYPE") %>
            </td>
        </tr>
        <tr>
            <td>
                QUERY_STRING
            </td>
            <td>
                <%= Request.ServerVariables("QUERY_STRING") %>
            </td>
        </tr>
        <tr>
            <td>
                SERVER_SOFTWARE
            </td>
            <td>
                <%= Request.ServerVariables("SERVER_SOFTWARE") %>
            </td>
        </tr>
        <tr>
            <td>
                CONTENT_LENGTH
            </td>
            <td>
                <%= Request.ServerVariables("CONTENT_LENGTH") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTPS
            </td>
            <td>
                <%= Request.ServerVariables("HTTPS") %>
            </td>
        </tr>
        <tr>
            <td>
                LOCAL_ADDR
            </td>
            <td>
                <%= Request.ServerVariables("LOCAL_ADDR") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTPS
            </td>
            <td>
                <%= Request.ServerVariables("HTTPS") %>
            </td>
        </tr>
        <tr>
            <td>
                PATH_INFO
            </td>
            <td>
                <%= Request.ServerVariables("PATH_INFO") %>
            </td>
        </tr>
        <tr>
            <td>
                PATH_TRANSLATED
            </td>
            <td>
                <%= Request.ServerVariables("PATH_TRANSLATED") %>
            </td>
        </tr>
        <tr>
            <td>
                REMOTE_ADDR
            </td>
            <td>
                <%= Request.ServerVariables("REMOTE_ADDR") %>
            </td>
        </tr>
        <tr>
            <td>
                REMOTE_HOST
            </td>
            <td>
                <%= Request.ServerVariables("REMOTE_HOST") %>
            </td>
        </tr>
        <tr>
            <td>
                REQUEST_METHOD
            </td>
            <td>
                <%= Request.ServerVariables("REQUEST_METHOD") %>
            </td>
        </tr>
        <tr>
            <td>
                SERVER_NAME
            </td>
            <td>
                <%= Request.ServerVariables("SERVER_NAME") %>
            </td>
        </tr>
        <tr>
            <td>
                SERVER_PORT
            </td>
            <td>
                <%= Request.ServerVariables("SERVER_PORT") %>
            </td>
        </tr>
        <tr>
            <td>
                SERVER_PROTOCOL
            </td>
            <td>
                <%= Request.ServerVariables("SERVER_PROTOCOL") %>
            </td>
        </tr>
        <tr>
            <td>
                SERVER_SOFTWARE
            </td>
            <td>
                <%= Request.ServerVariables("SERVER_SOFTWARE") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_ACCEPT
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_ACCEPT") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_USER_AGENT
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_USER_AGENT") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_UA_PIXELS
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_UA_PIXELS") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_UA_COLOR
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_UA_COLOR") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_UA_OS
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_UA_OS") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_UA_CPU
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_UA_CPU") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_REFERER
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_REFERER") %>
            </td>
        </tr>
        <tr>
            <td>
                HTTP_CONNECTION
            </td>
            <td>
                <%= Request.ServerVariables("HTTP_CONNECTION") %>
            </td>
        </tr>
        <tr>
            <td>
                URL
            </td>
            <td>
                <%= Request.ServerVariables("URL") %>
            </td>
        </tr>
        <tr>
            <td>
                REMOTE_USER
            </td>
            <td>
                <%= Request.ServerVariables("REMOTE_USER") %>
            </td>
        </tr>
    </table>
</body>
</html>
