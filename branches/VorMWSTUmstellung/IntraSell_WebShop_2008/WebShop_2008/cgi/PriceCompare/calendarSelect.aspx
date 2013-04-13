<%@  Language="VBScript.Encode" %>
<%
'this parameter is needed to set the value to the opening form 
Dim toElementName: toElementName = "'" & Request("toElementName") & "'"
%>
<html xmlns:ie>
<head>
    <meta http-equiv="Content-Language" content="de-at">
    <meta name="GENERATOR" content="Microsoft FrontPage 4.0">
    <meta name="ProgId" content="FrontPage.Editor.Document">
    <title>Calendar Control</title>
    <link href="../../style.css" type="text/css" rel="stylesheet">
    <style>
        @media all
        {
            IE\:Calendar
            {
                behavior: url(calendar_de.htc);
                width: 33%;
            }
        }
        A:link
        {
            color: #003399;
            text-decoration: none;
        }
        A:visited
        {
            color: #6699CC;
            text-decoration: none;
        }
        A:hover
        {
            text-decoration: underline;
        }
    </style>

    <script language="JavaScript">
    <!-- 
function applyDate(toElementName){
 if (cal!=null  && cal.value!=null) {
           //alert('Heute ist:' + cal.value);
           opener.document.all(toElementName).value = cal.value; 
           window.close();            
   }
}
// -->
    </script>

</head>
<body bgcolor="#ffffff" text="#000000" language="De">
    <center>
        <ie:calendar name="cal1" id="cal" style="border-bottom: black 1px solid; border-left: black 1px solid;
            border-right: black 1px solid; border-top: black 1px solid; height: 275px; width: 300px"
            _onpropertychange="applyDate(<%=toElementName%>);">
</ie:calendar>
    </center>
    <p align="center">
        <input type="button" value="Datum anwenden" name="B3" onclick="applyDate(<%=toElementName%>);"></p>
</body>
</html>
