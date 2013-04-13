<!--#include file="../defaultHead.inc.aspx"-->
<head>
    <link href="<%=BASENAME%>/Style.css" type="text/css" rel="stylesheet">
    <title>Request [<%=request("JOB")%>]</title>
</head>
<%  Dim JobDescription : JobDescription = "Request [" & Request("JOB") & "] about Order # " & Request("OrderID") & ", Product # " & Request("ProductID")%>
<body>
    <center>
        <div align="center">
            <h2>
                Task:
                <%=request("JOB")%></h2>
            <form action='DoRequestJob.aspx' method='post'>
            <input type='hidden' name='OrderID' value='<%=request("OrderID")%>'>
            <input type='hidden' name='ProductID' value='<%=request("ProductID")%>'>
            <input type='hidden' name='JOB' value='<%=request("JOB")%>'>
            <input type='hidden' name='JobDescription' value='<%=JobDescription%>'>
            <table border="1" cellpadding="3" cellspacing="0">
                <tr>
                    <th align="right">
                        <b>
                            <%=GetTranslation("von")%>:</b>
                    </th>
                    <td>
                        <input type="input" name="FromMail" value="<%=getClientEmail(getLOGIN())%>" style="width: 100%">
                    </td>
                </tr>
                <tr>
                    <th align="right">
                        <b>
                            <%=GetTranslation("an")%>:</b>
                    </th>
                    <td>
                        <%= GetShopEMail()%>
                    </td>
                </tr>
                <input type="hidden" name="ToMail" value="<%=GetShopEMail()%>">
                <tr>
                    <th align="right">
                        <b>
                            <%=GetTranslation("Betreff")%>:</b>
                    </th>
                    <td>
                        <%=jobDescription%>
                    </td>
                </tr>
                <tr>
                    <th align="right">
                        <b>
                            <%=GetTranslation("Text")%>:</b>
                    </th>
                    <td>
                        <textarea name="BodyMail" rows="10" style="width: 100%"></textarea>
                    </td>
                </tr>
                <tr>
                    <th colspan="2" align="center">
                        <input type="submit">
                        <input type="button" onclick="window.close()" name="close" value="Close">
                    </th>
                </tr>
            </form>
            </table>
        </div>
    </center>
</body>
<!--#include file="../../intrasoft/connClose.aspx"-->
