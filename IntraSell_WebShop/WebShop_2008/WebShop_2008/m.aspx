﻿<!--#include file="intrasoft/functions.aspx"-->
<!--#include file="intrasoft/functionsCache.aspx"-->
<%@ Page Language="vb" AutoEventWireup="false"   Inherits="WebApplicationTest.m" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Browser Detector... if mobile browser then we send the user to the mobile pages:<br />
    <% 
        Response.Write("isMobileBrowser=" & isMobileBrowser() & "<br />")
    %>

    </div>
    </form>
</body>
</html>
