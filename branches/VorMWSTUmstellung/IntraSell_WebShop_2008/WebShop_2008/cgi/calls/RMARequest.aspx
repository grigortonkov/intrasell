<!--#include file="../defaultHead.inc.aspx"-->
<head>
    <link href="<%=BASENAME%>/Style.css" type="text/css" rel="stylesheet">
 
    <title>RMA / Rücksendung</title>
</head>
<body>
    <center>
        <h2>
            RMA / Rücksendung</h2>
        <div align="center">
            <form action='doRMARequest.aspx' method='post'>
            <table border="0" bordercolor="green" cellpadding="3" cellspacing="0">
                <tr>
                    <td border="0" >
                        Von Email:
                    </td>
                    <td>
                        <input type='input' name='FromMail' 
                            value='<%=GetClientEMail (Session ("LOG_IN"))%>' style="width: 250px">
                    </td>
                </tr>
                <tr>
                    <th >
                        Name:
                    </th>
                    <td>
                        <input type='input' name='FromName' value=''  style="width: 250px">
                    </td>
                </tr>
                <tr>
                    <th >
                        Tel:
                    </th>
                    <td>
                        <input type='input' name='FromTel' value=''  style="width: 250px">
                    </td>
                </tr>
                <tr>
                    <td border="0" >
                        An:
                    </td>
                    <td>
                        <%=GetShopEMail%>
                    </td>
                </tr>
                <input type='hidden' name='ToMail' value='<%=GetShopEMail()%>'>
                <tr>
                    <td border="0" >
                        Rücksendegrund:
                    </td>
                    <td>
                        <select name="Reason">
                            <option>Storno/Vetragsrücktritt</option>
                            <option>Falschlieferung</option>
                            <option>defektes Produkt</option>
                            <option>anderer Grund</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td border="0" >
                        Bestellnummer:
                    </td>
                    <td>
                        <input type='_hidden' name='Nummer' value='<%=request("Nummer")%>'>
                    </td>
                </tr>
                <tr>
                    <td border="0" >
                        Produktnummer:
                    </td>
                    <td>
                        <input type='_hidden' name='ProductID' value='<%=request("ArtNr")%>'>
                    </td>
                </tr>
                <tr>
                    <td border="0" >
                        Betreff:
                    </td>
                    <td>
                        Ich habe ein Problem mit Produkt #<%=request("ArtNr")%>
                    </td>
                </tr>
                <tr>
                    <td border="0"  title="RMA Request">
                        Text/Fehlerbeschreibung:
                    </td>
                    <td>
                        <textarea name='FromMail' cols="60" rows="10">Bitte erledigen Sie das folgende Problem mit Produkt #<%=request("ArtNr")%>:</textarea>
                    </td>
                </tr>
                <tr>
                    <td border="0" colspan="2" align="center">
                        <input type='submit'>
                        <input type="button" onclick='window.close()' name="close" value="Close">
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </center>
</body>
</HTML>
<!--#include file="../../intrasoft/connClose.aspx"-->
