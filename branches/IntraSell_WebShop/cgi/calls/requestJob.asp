<!--#include file="../defaultHead.inc"-->
<head>
<LINK href="<%=BASENAME%>/Style.css" type="text/css" rel="stylesheet">
<title>Request [<%=request("JOB")%>]</title>
</head>
<%dim JobDescription: JobDescription = "Request [" & request("JOB") & "] about Order # " & request("OrderID") & ", Product # " & request("ProductID")%>
<body>
<center>
<div align=center>
<h2>Task: <%=request("JOB")%></h2>
<form action='DoRequestJob.asp' method='post'>

    <input type='hidden' name='OrderID' value='<%=request("OrderID")%>'>
    <input type='hidden' name='ProductID' value='<%=request("ProductID")%>'>
    <input type='hidden' name='JOB' value='<%=request("JOB")%>'>
    <input type='hidden' name='JobDescription' value='<%=JobDescription%>'>

    <TABLE border=1 cellPadding=3 cellSpacing=0>
    <TR>
        <Th align=right><B><%=GetTranslation("von")%>:</B></Th>
        <td><input type="input" name="FromMail" value="<%=getClientEmail(getLOGIN())%>" 
                style="width: 100%"></td>
        </tr><TR>
        <Th  align=right><B><%=GetTranslation("an")%>:</B></Th>
        <td><%= GetShopEMail()%></td>
    </TR>
    <input type="hidden" name="ToMail" value="<%=GetShopEMail()%>">
    <TR>
        <Th  align=right><B><%=GetTranslation("Betreff")%>:</B></Th>
        <td><%=jobDescription%></td>
        </tr><TR>
        <Th  align=right><B><%=GetTranslation("Text")%>:</B></Th>
        <td><textarea name="BodyMail" rows=10 style="width: 100%"></textarea></td>
    </TR>
    <TR>
        <Th colspan=2 align=center>
        <input type="submit">
        <input type=button onClick="window.close()" name=close value=Close>
        </th>
    </TR>
</form>
</table>
</div></center>

</body>
<!--#include file="../../intrasoft/connClose.asp"-->