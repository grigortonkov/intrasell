<!--#include file="../defaultHead.inc.aspx"-->
<head>
    <link href="<%=BASENAME%>/Style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            text-align: left;
            width: 168px;
        }
    </style>
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
                    <td border="0" class="style1">
                        Von Email:
                    </td>
                    <td>
                        <input type='input' name='FromMail' value='<%=GetClientEMail (Session ("LOG_IN"))%>'>
                    </td>
                </tr>
                <tr>
                    <th class="style1">
                        Name:
                    </th>
                    <td>
                        <input type='input' name='FromName' value=''>
                    </td>
                </tr>
                <tr>
                    <th class="style1">
                        Tel:
                    </th>
                    <td>
                        <input type='input' name='FromTel' value=''>
                    </td>
                </tr>
                <tr>
                    <td border="0" class="style1">
                        An:
                    </td>
                    <td>
                        <%=GetShopEMail%>
                    </td>
                </tr>
                <input type='hidden' name='ToMail' value='<%=GetShopEMail%>'>
                <tr>
                    <td border="0" class="style1">
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
                    <td border="0" class="style1">
                        Bestellnummer:
                    </td>
                    <td>
                        <input type='_hidden' name='Nummer' value='<%=request("Nummer")%>'>
                    </td>
                </tr>
                <tr>
                    <td border="0" class="style1">
                        Produktnummer:
                    </td>
                    <td>
                        <input type='_hidden' name='ProductID' value='<%=request("ArtNr")%>'>
                    </td>
                </tr>
                <tr>
                    <td border="0" class="style1">
                        Betreff:
                    </td>
                    <td>
                        Ich habe ein Problem mit Produkt #<%=request("ArtNr")%>
                    </td>
                </tr>
                <tr>
                    <td border="0" class="style1" title="RMA Request">
                        Text/Fehlerbeschreibung:
                    </td>
                    <td>
                        <textarea name='FromMail' cols="30" rows="10">Bitte erledigen Sie das folgende Problem mit Produkt #<%=request("ArtNr")%>:</textarea>
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
