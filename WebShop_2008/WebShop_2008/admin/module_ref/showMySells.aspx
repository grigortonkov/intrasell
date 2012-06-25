<!--#include virtual="/intrasoft/functions.aspx"-->
<!--#include file="functionsReferers.aspx"-->
<head>
<meta http-equiv="Content-Language" content="de">
<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
</head>
<body>
<h1 align="center">My sells</h1>
<%

Dim refererID: refererID = request("refererID")
call showMyReferedSells(refererID ,"AU",0,0)%>

</body>
