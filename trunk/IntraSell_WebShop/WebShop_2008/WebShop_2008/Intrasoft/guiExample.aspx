<%@Page Language="VB" AspCompat = "true"%>
<!--#include file="functionsGUI.aspx"-->
<head>
    <link rel="stylesheet" href="styleButtons.css" type="text/css">
</head>
<body>
    <h1>
        GUI Example</h1>
    <p>
        Author: Grigor Tonkov</p>
    <p>
        Example: Window with Actions</p>
    <p>
        Example: Error Message</p>
    <%
Dim butArr(3,2)
butArr(1,1) = "Set Home"
butArr(2,1) = "Get Home"
butArr(3,1) = "Go Home"
butArr(1,2) = "Set Home"
butArr(2,2) = "Get Home"
butArr(3,2) = "Go Home"
    %>
    <%call drawWindow("First window","Body HTML","state",butArr)%>
    <%call drawButton("mnu3_3","Home","http://www.noxel.com","white")%>
</body>
