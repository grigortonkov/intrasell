<!--#include virtual="/cgi/defaulthead.inc"-->
<html>
<head>
    <link rel='stylesheet' href='../style.css' type='text/css'>
</head>
<body bgcolor="#FFFFFF">
    <center>
        <table width="300" border="0" cellspacing="0" bordercolor="#0000A0">
            <tr>
                <td>
                    <img src="<%=imageFullName("callmeback.gif")%>" align="left"><big></big>
                </td>
            </tr>
        </table>
        <form action='DoCallMeBack.aspx' method='post'>
        <table border="0" bordercolor="green" cellpadding="3" cellspacing="0">
            <tr>
                <td align="center" border="0">
                    <b>Von:</b>
                </td>
                <td>
                    Email:&nbsp;
                    <input type='input' name='FromMail' value='<%=GetClientEMail (getLOGIN())%>'>
                </td>
            </tr>
            <tr>
                <th align="right">
                </th>
                <td>
                    Name:
                    <input type='input' name='FromName' value=''>
                </td>
            </tr>
            <tr>
                <th align="right">
                </th>
                <td>
                    Tel:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type='input' name='FromTel' value=''>
                </td>
            </tr>
            <tr>
                <td align="center" border="0">
                    <b>An:</b>
                </td>
                <td>
                    <%=GetShopEMail()%>
                </td>
            </tr>
            <input type='hidden' name='ProductID' value='" + artNr + "'>
            <input type='hidden' name='ToMail' value='<%=GetShopEMail%>'>
            <tr>
                <td align="center" border="0">
                    <b>Betreff:</b>
                </td>
                <td>
                    <!--Request More Information about Product-->
                    Informationen über Produkt Nr.:<%=request("ArtNr")%>
                    anfragen
                </td>
            </tr>
            <tr>
                <td align="center" border="0">
                    <b>Text:</b>
                </td>
                <td>
                    <textarea name='BodyMail' cols="62" rows="10">Informationen über Produkt Nr.: <%=request("ArtNr")%> anfragen.</textarea>
                </td>
            </tr>
            <tr>
                <td border="0" colspan="2" align="center">
                    <input type='submit' value='Send'>
                    <input type="button" onclick='window.close()' name="close" value="Close">
                </td>
            </tr>
        </form>
        </table>
    </center>
</body>
</html>
