<!--#include file="defaultHead.inc.aspx"-->
<body>
    <h1 align="center">
        Meine Produkte (Verwaltung)</h1>
    <%
        'one of both idnr or refereridmust be defined
        'Dim refererID 'incoming parameter
        Dim idnr 'incoming parameter
        Dim sql As String

        If Request("idnr") <> "" Then ' it is possible that the idnr is send instead of the referer id 
            idnr = Request("idnr")
            refererId = getExternalRefererId(idnr)
        Else
            refererID = Request("refererID")
            idnr = getInternalIDNRFromForeignRefererId(refererID)
        End If

        If CLng(idnr) <> CLng(getLOGIN()) Then 'not okay!!! 
            Response.Write( drawErrorBox("Not logged in!", "Sie sollten sich vorher anmelden!", "", ""))
            Response.Write("</body>")
            Response.End()
        End If


        If idnr < 0 Then 'not okay!!! 
            Response.Write( drawErrorBox("Referer not existing!","No referer for this refererId is internaly defined! " &_ 
                   " Please, contact the administrator!","","") )
            Response.Write("</body>")
            Response.End()
        End If

        Dim mode : mode = Request("mode")
        'INSERT
        If Request("ArtNR") <> "" And mode = "insert" Then
            sql = "Insert Into webReferersProducts (Idnr, ArtNR) values (" & idnr & "," & Request("ArtNR") & ")"
            'response.write sql
            objConnectionExecute(sql)
        End If

        'DELETE 
        If Request("ArtNR") <> "" And mode = "delete" Then
            sql = "delete from webReferersProducts where Idnr=" & idnr & " AND ArtNR=" & Request("ArtNR")
            objConnectionExecute(sql)
        End If

    %>
    <table border="1" width="500" cellspacing="3" cellpadding="0" bordercolor="#F7F7F7">
        <tr>
            <td width="609">
                <!--webbot BOT="GeneratedScript" PREVIEW=" " startspan -->

                <script language="JavaScript"><!--
                    function FrontPage_Form1_Validator(theForm) {

                        var checkOK = "0123456789-";
                        var checkStr = theForm.ArtNr.value;
                        var allValid = true;
                        var decPoints = 0;
                        var allNum = "";
                        for (i = 0; i < checkStr.length; i++) {
                            ch = checkStr.charAt(i);
                            for (j = 0; j < checkOK.length; j++)
                                if (ch == checkOK.charAt(j))
                                break;
                            if (j == checkOK.length) {
                                allValid = false;
                                break;
                            }
                            allNum += ch;
                        }
                        if (!allValid) {
                            alert("Geben Sie nur Ziffern in das Feld \"ArtNr\" ein.");
                            theForm.ArtNr.focus();
                            return (false);
                        }
                        return (true);
                    }
//--></script>

                <!--webbot BOT="GeneratedScript" endspan -->
                <form method="POST" action="module_ref_showMyProductsAdmin.aspx" onsubmit="return FrontPage_Form1_Validator(this)"
                name="FrontPage_Form1">
                <p align="left">
                    <input type="hidden" name="refererID" size="9" value="<%=refererID%>">
                    <input type="hidden" name="mode" size="9" value="insert">
                    Produktnummer
                    <!--webbot
        bot="Validation" S-Data-Type="Integer" S-Number-Separators="x" -->
                    <input type="text" name="ArtNr" size="9">
                    <input type="submit" value="Produkt auswählen" name="send"></p>
                (<a href="default.aspx" target="_new">Suchen</a>) Tipp: Das ist die ArtNr. im Detailansicht
                eines Produktes!
                </form>
            </td>
        </tr>
    </table>
    <table border="1" width="500" cellspacing="3" cellpadding="0" bordercolor="#F7F7F7">
        <tr>
            <th width="184" height="26">
                Produkt
            </th>
            <th width="281" height="26">
                Aktion
            </th>
        </tr>
        <%
            sql = "select * from webReferersProducts where IDNR=" & idnr
            Dim rsTop
            rsTop = objConnectionExecute(sql)

            While Not rsTop.EOF
        %>
        <form method="POST" action="module_ref_showMyProductsAdmin.aspx">
        <tr>
            <td width="182" height="26">
                <%=TABLEVALUE("grArtikel","ArtNR",rsTop("ArtNR"),"Bezeichnung")%>
            </td>
            <td width="279" valign="middle">
                <input type="hidden" name="refererID" size="9" value="<%=refererID%>">
                <input type="hidden" name="mode" size="9" value="delete"><!--webbot bot="Validation" S-Data-Type="Integer" S-Number-Separators="x" -->
                <input type="hidden" name="ArtNr" value="<%=rsTop("ArtNR").Value%>" size="9">
                <input type="submit" value="löschen" name="entfernen">
        </tr>
        </form>
        <%
            rsTop.moveNext()
        End While

        rsTop.close()
        %>
    </table>
    &nbsp;
    <p>
        ...&nbsp; und so schaut es aus:
        <%
            Call showRefererProducts(idnr)
        %>
    </p>
</body>
