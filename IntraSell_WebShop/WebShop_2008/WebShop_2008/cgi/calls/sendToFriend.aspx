<!--#include file="../defaultHead.inc.aspx"-->
<html>
<head>
    <link rel='stylesheet' href='<%=BASENAME%>'>
    /style.css' TYPE='text/css'>
</head>
<body bgcolor="#FFFFFF">
    <form action='DoSendToFriend.aspx' method='post'>
    <table border="0" cellspacing="0" bordercolor="#0000A0">
        <tr>
            <td>
                <img src="<%=imageFullName("emailafriend.gif")%>" align="left">
            </td>
        </tr>
    </table>
    <table border="0" bordercolor="#008000" cellpadding="3" cellspacing="0" width="500">
        <tr>
            <td align="right" border="0">
                <b>Von:</b>
            </td>
            <td>
                <input type='input' name='FromMail' value='<%=GetClientEMail (getLOGIN())%>'>
            </td>
        </tr>
        <input type='hidden' name='ProductUrl' value=''>
        <tr>
            <td border="0" align="right">
                <b>
                    <%=getTranslation("An")%>:</b>
            </td>
            <td>
                <input type='input' name='ToMail'>
            </td>
        </tr>
        <tr>
            <td align="right" border="0">
                <b>
                    <%=getTranslation("Betreff")%>:</b>
            </td>
            <td>
                <input type='input' name='Subject'>
            </td>
        </tr>
        <tr>
            <td align="right" border="0">
                <b>
                    <%=getTranslation("Text")%>:</b>
            </td>
            <td>
                <br>
                <textarea name='BodyMail' cols="59" rows="7">
<%=getTranslation("Produktempfehlung")%>
<%=getTranslation("Dieses E-Mail wurde an Sie via nachfolgender gesendet.")%> <%=VARVALUE ("EMAIL")%> 
<%=getTranslation("Es beinhaltet Produktinformationen welche Ihnen ein Freund mitteilen m&ouml;chte:")%>
<%  Response.Write("http://" & varvalue("DOMAIN") & "/cgi/default.aspx?ArtNr=" & Request("ArtNr"))%>
        </textarea>
            </td>
        </tr>
        <tr>
            <td border="0" colspan="2" align="center">
                <input type='submit' value='<%=getTranslation("senden")%>'><input type="button" onclick='window.close()'
                    name="close" value="Close">
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
