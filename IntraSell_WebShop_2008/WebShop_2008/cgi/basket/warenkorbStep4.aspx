<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>
<!-- WARENKORB STEP 4-->
<p align="left">
    <%
        Dim EmailStep3 As String, PasswordStep3 As String, kdnrStep3 As Long
        Dim landOfCalculation As String
        
        If Request("notiz") <> "" Then Session("notiz") = Request("notiz")
        
       
        payMode = Session("PayMode")
        postMode = Session("PostMode")
        destination = Session("Destination")
        landOfCalculation = Session("Land")

        EmailStep3 = Session("EmailOld")
        PasswordStep3 = Session("PasswordOld")

        'response.write Email & Password
        'Find Client 
        Dim KundNrStep3 As Long : KundNrStep3 = authenticate(EmailStep3, PasswordStep3) 'stops processing on this page if not proper authenitification !!!
        Dim errorsFound As Boolean : errorsFound = False

        If KundNrStep3 <= 0 Then errorsFound = True

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
    <form action="default.aspx" name="warenkorbStep4">
    <input type="hidden" name="PageToShow" value="warenkorbStep5" />
    <input type="hidden" name="EmailOld" size="20" value="<%=EmailStep3%>" />
    <input type="hidden" name="PasswordOld" size="20" value="<%=PasswordStep3%>" />
    
  
    <br />
    <%Call visualizeWarenkorb("4", Session("LAND"), PayMode, PostMode, destination)%>
    <br />
    <br />
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse"
        bordercolor="#111111" width="100%" id="AutoNumber15">
        <tr>
            <td>
                <p align="left">
                   <input type="checkbox" name="AGB" value="ON" />
                    <a name="agb"></a>&nbsp;<%=getTranslation("Ich habe die AGB gelesen und akzeptiert!")%>
                    <a href="default.aspx?PageToShow=AGB">
                        <%=getTranslation("AGB anzeigen")%></a>
                    <br />
                    <% If VARVALUE("SHOP_USER_MUST_ACCEPT_LAW") = "TRUE" Then%>
                    <input type="checkbox" name="GESETZ" value="ON" />
                    <a name="agb"></a>&nbsp;<%=getTranslation("Informationen zur Widerrufsbelehrung gelesen!")%>
                    <a href="default.aspx?PageToShow=GESETZ">
                        <%=getTranslation("Informationen zur Widerrufsbelehrung anzeigen")%></a>
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
                        <input type="submit" class="button" value="<%=getTranslation("zahlungspflichtig bestellen")%>" />
                    </p>
                </td>
        </tr>
    </table>
    </form>
    <%
    End If ' errors found%>
