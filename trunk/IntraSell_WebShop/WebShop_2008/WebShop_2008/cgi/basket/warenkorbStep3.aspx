<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<p align="left">
    <%
        Dim EmailStep3, PasswordStep3, kdnrStep3
        Dim landOfCalculation

        payMode = Session("PayMode")
        postMode = Session("PostMode")
        destination = Session("Destination")
        landOfCalculation = Session("Land")

        EmailStep3 = Request("EmailOld")
        PasswordStep3 = Request("PasswordOld")

        'response.write Email & Password
        'Find Client 
        Dim KundNrStep3 : KundNrStep3 = authenticate(EmailStep3, PasswordStep3) 'stops processing on this page if not proper authenitification !!!
        Dim errorsFound : errorsFound = False

        If KundNrStep3 = "" Or KundNrStep3 = "0" Then errorsFound = True

        If isWarenkorbEmpty(getSID()) Then
    %><font color="red"><%=getTranslation("Ihr Warenkorb ist leer!")%></font>
    <%
        errorsFound = True
    End If

    'Add Default Gesetzt akzeptieren 
    If VARVALUE("SHOP_USER_MUST_ACCEPT_LAW") <> "TRUE" And VARVALUE("SHOP_USER_MUST_ACCEPT_LAW") <> "FALSE" Then 'this var is not set
        Call SETVARVALUE("SHOP_USER_MUST_ACCEPT_LAW", "TRUE")
    End If


    If Not errorsFound Then

    %>
    <form method="POST" action="default.asp" name="warenkorbStep3">
    <input type="hidden" name="EmailOld" size="20" value="<%=EmailStep3%>">
    <input type="hidden" name="PasswordOld" size="20" value="<%=PasswordStep3%>">
    <input type="hidden" name="PageToShow" value="warenkorbStep4">
    <div align="center">
        <center>
            <table border="1" width="550" bordercolor="#CCCCCC" style="border-collapse: collapse"
                cellpadding="5" cellspacing="0">
                <tr>
                    <td width="50%" align="center" bgcolor="#F3F3F3">
                        <%=getTranslation("Aktuelle Lieferadresse")%>
                    </td>
                    <td width="50%" align="center" bgcolor="#F3F3F3">
                        <%=getTranslation("Aktuelle Rechnungsadresse")%>
                    </td>
                </tr>
                <tr>
                    <td width="50%" align="left">
                        <%=printAddress(KundNrStep3,"LI",TRUE)%>
                    </td>
                    <td width="50%" align="left">
                        <%=printAddress(KundNrStep3,"AR",TRUE)%>
                    </td>
                </tr>
                <tr>
                    <td width="50%" colspan="1">
                        <p align="center">
                            <a href="default.aspx?pageToShow=createUpdateAddressSpecial&typeOfAddress=LI">
                                <%=getTranslation("aendern")%>
                            </a>
                        </p>
                    </td>
                    <td width="50%" colspan="1">
                        <p align="center">
                            <a href="default.aspx?pageToShow=createUpdateAddressSpecial&typeOfAddress=AR">
                                <%=getTranslation("aendern")%>
                            </a>
                        </p>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <br>
    <br>
    <%Call visualizeWarenkorb("3", Session("LAND"), PayMode, PostMode, destination)%>
    <br>
    <br>
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
        bordercolor="#111111" width="100%" id="AutoNumber15">
        <tr>
            <td>
                <p align="left">
                    <input type="checkbox" name="AGB" value="ON" class="submit">
                    <a name="agb"></a>&nbsp;<%=getTranslation("Ich habe die AGB gelesen und akzeptiert!")%>
                    <a href="default.aspx?PageToShow=AGB">
                        <%=getTranslation("AGB lesen ...")%></a>
                    <br>
                    <% If VARVALUE("SHOP_USER_MUST_ACCEPT_LAW") = "TRUE" Then%>
                    <input type="checkbox" name="GESETZ" value="ON" class="submit">
                    <a name="agb"></a>&nbsp;<%=getTranslation("Informationen zum Fernabsatzgesetz gelesen!")%>
                    <a href="default.aspx?PageToShow=GESETZ">
                        <%=getTranslation("Informationen zum Fernabsatzgesetz lesen ...")%></a>
                    <% End If%>
            </td>
        </tr>
        <tr>
            <td>
                <td>
                    <p align="right">
                        <input type="button" class="button" value="<%=getTranslation("Bestellung ändern")%>"
                            onclick="document.location='default.aspx?pageToShow=warenkorbStep1'" />
                        &nbsp; &nbsp;
                        <input type="submit" class="button" value="<%=getTranslation("bestellen")%>">
                    </p>
                </td>
        </tr>
    </table>
    </form>
    <%
    End If ' errors found%>
