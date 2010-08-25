 
<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

    Const SHOW_SELECT_POST As Boolean = False
    Const SHOW_SELECT_DESTINATION As Boolean = False

%>
<div id="Hinweis" style="color: red">
    &nbsp;</div>

<script language="JavaScript">
            function WaitForCalculation() {    
               //alert("Warten Sie bis die Berechnung l&auml;uft!");
              if(document.all) //IEXplorer 
               document.getElementById("Hinweis").innerText = "<%=getTranslation("Warten Sie bis die Berechnung abgeschlossen ist!") & getTranslation(" Tipp: Der Browser Symbol dreht sich nicht mehr sobald die Berechnung abgeschlossen wurde.")%>";
               //document.write("Warten Sie bis die Berechnung l&auml;uft!");
             };      
</script>

<form method="POST" action="default.aspx" id="warenkorbStep1" name="warenkorbStep1">
<input type='hidden' name='pageToShow' value='warenkorbStep1'>
<!-- WARENKORB -->
<%

 
    If Not isPurchasingAllowed() Then
        Response.Write(getTranslation("Einkaufen ist nur für registrierte Kunden erlaubt!"))
    Else 'allowed  
            
        paymode = Request("PayMode") : If paymode & "" = "" Then paymode = Session("PayMode") : If paymode & "" = "" Then paymode = DEFAULT_PAYMODE
        postmode = Request("postMode") : If postmode & "" = "" Then postmode = Session("posIMode") : If postmode & "" = "" Then postmode = DEFAULT_POSTMODE
        destination = Request("destination") : If destination & "" = "" Then destination = Session("destination") : If destination & "" = "" Then destination = DEFAULT_POSTMODE_DESTINATION
        If destination <> "" Then Session("LAND") = destination

        Session("PayMode") = paymode
        Session("postMode") = postmode
        Session("destination") = destination

        If showDebug() Then
            Response.Write("payMode=" & paymode)
            Response.Write("DEFAULT_PAYMODE=" & DEFAULT_PAYMODE)
        End If

        'for mecom 
        If destination = "Germany" Then paymode = "Vorauskasse"
        If Request("notiz") <> "" Then Session("notiz") = Request("notiz")


        'GUTSCHEIN LOGIK 
        'Response.Write "gutscheinNummer: " & request("gutscheinNummer")
        If Request("gutscheinNummer") <> "" Then
            If getPreisForGutschein(Request("gutscheinNummer")) > 0 Then
                Session("gutscheinNummer") = Request("gutscheinNummer")
            Else
                Response.Write("Gutschein Nr. [" & Request("gutscheinNummer") & "] wurde nicht akzeptiert!")
            End If
        End If

        'Response.Write("ITEMS:" & Request("Items"))
        If Request("Items") <> "" Then ' Update is needed
            For i = 1 To CInt(Request("Items"))
                an = "Art" & i
                qn = "Stk" & i
                chn = "checkD" & i
                'Response.write " qn = " & request(qn) & " checked is : " & request(chn)
                If LCase(Request(chn)) = "on" Then ' delete item
                    sql = "Update webWarenkorb set Quantity='0'"
                    sql = sql & " WHERE ArtNr = " & Request(an)
                    sql = sql & " AND SID=" & getSID()
                    rsWK = objConnectionExecute(sql)
                Else ' update quantity
                    sql = "Update webWarenkorb set Quantity='" & Request(qn)
                    sql = sql & "' WHERE ArtNr = " & Request(an)
                    sql = sql & " AND SID=" & getSID()
                    rsWK = objConnectionExecute(sql)
                End If
            
            Next
        End If

        emptySet = visualizeWarenkorb("1", Session("LAND"), paymode, postmode, destination)
%>
<%  If emptySet Then%>
<input type="submit" class="button" value="<%=getTranslation("Warenkorb aktualisieren")%>">&nbsp;
<a href="default.aspx">
    <%=getTranslation("weiter shoppen")%></a>
<%  End If%>
</form>
<!-- END WARENKORB UPDATE FORM-->
<%  If emptySet Then%>
<form method="POST" action="default.aspx" id="FormBasket">
<input type="hidden" name="PageToShow" value="warenkorbStep2">
<center>
    <table border="0" cellpadding="5" cellspacing="5" style="border-collapse: collapse"
        bordercolor="#111111" height="1" width="100%">
        <tr>
            <td colspan="2">
                <hr>
            </td>
            </td>
            <!-- WARENKORB POSTMODE-->
            <tr>
                <th height="21" valign="middle">
                    1.<%=getTranslation("Transport:")%>
                </th>
                <td height="21" valign="middle" align="left">
                    <%
                        'dim rsZM, selected            
                        sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
                        rsZM = objConnectionExecute(sql)
                        While Not rsZM.EOF
                            If UCase(Trim(postmode)) = UCase(Trim(rsZM("methode").Value)) Then selected = "checked" Else selected = ""
                            'Response.Write selected
                    %>
                    <input type="radio" class="submit" value="<%=rsZM("methode").Value%>" name="PostMode"
                        <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=rsZM("methode").Value%>';">
                    <%=rsZM("methode").Value%>
                    <%
                        rsZM.MoveNExt()
                    End While
                    %>
                </td>
            </tr>
            <!-- END WARENKORB POSTMODE-->
            <tr>
                <td colspan="2">
                    <hr>
                </td>
                </td>
                <!--SELECT PLACE OF DELIVERY -->
                <% If varvalue("CALCULATE_CHANGE_DESTINATION") = "TRUE" Then%>
                <tr>
                    <th valign="middle" width="257">
                        2.<%=getTranslation("Destination der Lieferung:")%>
                    </th>
                    <td valign="middle" width="490" align="left">
                        <!--
                             <select name="destination" onClick="document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination='+document('destination');">
                             <option class="submit" value="<%=destination%>"> <%=destination%>
                             -->
                        <%
                            Dim rsZM, selected
                            sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' and Methode = '" & postmode & "' group by destination  order by destination"
                            rsZM = objConnectionExecute(sql)
                            While Not rsZM.EOF
                                If UCase(Trim(destination)) = UCase(Trim(rsZM("destination").Value)) Then selected = "checked" Else selected = ""
                                'Response.Write selected
                        %>
                        <!--<option class="submit" value="<%=rsZM("destination")%>"> <%=rsZM("destination")%>
                                -->
                        <input type="radio" class="submit" value="<%=rsZM("destination").Value%>" name="destination"
                            <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination=<%=rsZM("destination").Value%>';">
                        <%=rsZM("destination").Value%>
                        <%
                            rsZM.MoveNExt()
                        End While
                        %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <hr>
                    </td>
                    </td>
                    <tr>
                        <th>
                            3.
                            <%=getTranslation("Waehlen Sie Transportart fuer Ihre Lieferung:")%>
                        </th>
                        <td align="left">
                            <%=showPossiblePostMethodsAccordungDestination(destination, postMode, paymode)%>
                        </td>
                    </tr>
                    <!-- END OF DELIVERY -->
                    <tr>
                        <td colspan="2">
                            <hr>
                        </td>
                        </td>
                        <!-- WARENKORB PAYMODE-->
                        <tr>
                            <th height="1" valign="middle" width="257">
                                4.
                                <%=getTranslation("Bestellung-/Zahlungsart:")%>
                            </th>
                            <td valign="middle" align="left">
                                <%
                                  
                                    sql = "select methode, Destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, Destination order by methode"
                                    rsZM = objConnectionExecute(sql)
                                    While Not rsZM.EOF
                                        'show only PayMethods for the selected destination or general destinations 
                                        If UCase(Trim(rsZM("destination").Value)) = "" Or UCase(Trim(rsZM("destination").Value)) = UCase(Trim(destination)) Then
                                            If UCase(Trim(paymode)) = UCase(Trim(rsZM("methode").Value)) Then selected = "checked" Else selected = ""
                                            'Response.Write selected
                                %>
                                <input type="radio" class="submit" value="<%=rsZM("methode").Value%>" name="PayMode"
                                    <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=rsZM("methode").Value%>&postmode=<%=postmode%>';">
                                <%=rsZM("methode").Value%>
                                <%
                                End If
                                rsZM.MoveNExt()
                            End While
                                %>
                            </td>
                        </tr>
                        <!-- END WARENKORB PAYMODE-->
                        <tr>
                            <td colspan="2">
                                <hr />
                            </td>
                            </td>
                            <%End If%>
                            <!-- END SELECT PLACE OF DELIVERY  -->
    </table>
    
    
<textarea id="Notiz" name="Notiz" rows="3" visible="false" style="height: 25px; width: 0px;">
<%=getTranslation("Geben Sie hier Ihre Tel.Nr und/oder Email bekannt:")%>
</textarea>&nbsp;

</center>


<p align="right">
    <%If (Not paymode & "" = "") And (Not postmode & "" = "") And (Not destination & "" = "") Then%>
    <a href="default.asp">
        <%=getTranslation("weiter shoppen")%></a>
        &nbsp;<input type="button" class="button" value="<%=getTranslation("Angebot anfordern")%>" onclick="submitOffer();">
        &nbsp;<input type="submit" class="button" value="<%=getTranslation("zur Kasse")%>">
    <%Else%>
    <img src="<%=imageFullName("zurkasse.gif")%>" value="<%=getTranslation("zur Kasse")%>">
    <%End If%>

 <br />

</p>
</form>

 <script language="javascript">

     //Submit this basket as an offer

     function submitOffer() {
       
         if (!document.forms['FormBasket'].Notiz.visible || document.forms['FormBasket'].Notiz.style.height == "25px") {
             document.forms['FormBasket'].Notiz.visible = true;
             //set visible 
             document.forms['FormBasket'].Notiz.style.width = "300px";
             document.forms['FormBasket'].Notiz.style.height = "100px";
         } else {
             document.forms['FormBasket'].PageToShow.value = 'warenkorbStepOffer';
             document.forms['FormBasket'].submit();
         }
     }
 </script>
 
<%  End If
End If 'purchasing allowed 
%>
<%
    Dim logHTML
    logHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_functions.htm"))
    logHTML = parseTemplate(logHTML, Nothing)
    Response.Write(logHTML)

%>
<!-- END WARENKORB  -->

<script language="VB" runat="server">
    Dim rsZM
    Dim rsWK
    Dim i As Integer, pos As Integer
    Dim an As String, chn
    Dim qn As String
    Dim sql As String
    Dim emptySet
    Dim paymode As String, postmode As String, destination As String
    Dim gutscheinNummer As String
    Dim selected As String
</script>

