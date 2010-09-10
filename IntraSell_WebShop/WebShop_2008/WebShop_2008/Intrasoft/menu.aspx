<!--#include virtual="/admin/includeall.inc.aspx"-->

<%
'Aplication settings for Generic ASP 
'Session("MyDSN") = ObjConnection
if Session("dbExitPage") = "" then
Session("dbExitPage") = "http://www.griton.eu"
end if	
Session("dbTitle") = "IntraSell"
'Session("dbType") = "Access" '"SQL"' 'set in global asa
Session("dbConn") = Session("MyDSN") 
Session("dbBorderColor") = "#6699FF"
Session("dbMenuColor")   = "#99CCFF"
'END Application settings for generic ASP 	
%>
<head>
    <link rel="stylesheet" href="<%=BASENAME%>/style.css" type="text/css">
    <link rel="stylesheet" href="<%=BASENAME%>/intrasoft/styleButtons.css" type="text/css">
    <title>IntraSell - Administration</title>

    <script language="JavaScript">
<!--
        /* this function will display the count-up */
        function updateFrame() {
            top.status = top.status + "+";
            if (top.status.length > 20) {
                top.status = "";
                //top.frames[1].location.reload(true);
                document.location.reload(true);
            }
            interval = document.forms[0].interval.value
            timerID = setTimeout("updateFrame()", interval * 100 * 60);
        }
//-->
    </script>

</head>
<body onload="updateFrame();" topmargin="1" leftmargin="1">
    <%call DisplayMainMenu("menu.aspx")%>
    <form>
    <input type="hidden" size="3" name="interval" value="<%=VARVALUE("REFRESH_INTERVAL")%>"></form>

