<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================

    Const SHOW_SELECT_POST = False
    Const SHOW_SELECT_DESTINATION = False

%>
<div id="Hinweis" style="color=red">
    &nbsp;</div>

<script language="JavaScript">
			function WaitForCalculation() {    
			   //alert("Warten Sie bis die Berechnung l&auml;uft!");
			  if(document.all) //IEXplorer 
			   document.getElementById("Hinweis").innerText = "<%=getTranslation("Warten Sie bis die Berechnung fertig ist!") & getTranslation(" Tipp: Browser Symbol dreht sich nicht mehr.")%>";
			   //document.write("Warten Sie bis die Berechnung l&auml;uft!");
			 }; 	 
</script>

<form method="POST" action="default.asp" id="warenkorbStep1" name="warenkorbStep1">
<input type='hidden' name='pageToShow' value='warenkorbStep1'>
<!-- WARENKORB -->
<%

    Dim i, pos
    Dim an, qn, chn
    Dim rsWK
    Dim sql
    Dim emptySet
    Dim paymode, postmode, destination
    Dim gutscheinNummer


    If Not isPurchasingAllowed() Then
        Response.Write(getTranslation("Einkaufen ist nur für registrierte Kunden erlaubt!"))
    Else 'allowed  
       	 
payMode = Request("PayMode"):   if payMode&"" = "" then payMode = Session("PayMode"): if payMode&"" = "" then payMode = DEFAULT_PAYMODE
postMode = Request("postMode"): if postMode&"" = "" then postMode = Session("postMode"): if postMode&"" = "" then postMode = DEFAULT_POSTMODE
destination = Request("destination"): if destination&"" = "" then destination  = Session("destination"): if destination&"" = "" then destination  = DEFAULT_POSTMODE_DESTINATION
                                'Session("LAND") = destination 

                                Session("PayMode") = paymode
                                Session("postMode") = postmode
                                Session("destination") = destination

                                If debug() Then
                                    Response.Write("payMode=" & paymode)
                                    Response.Write("DEFAULT_PAYMODE=" & DEFAULT_PAYMODE)
                                End If

                                'for mecom 
                                If destination = "Germany" Then paymode = "Vorauskasse"
                                If Request("notiz") <> "" Then Session("notiz") = Request("notiz")


                                'GUTSCHEIN PROBLEMATIK 
                                'Response.Write "gutscheinNummer: " & request("gutscheinNummer")
                                If Request("gutscheinNummer") <> "" Then
                                    If getPreisForGutschein(Request("gutscheinNummer")) > 0 Then
                                        Session("gutscheinNummer") = Request("gutscheinNummer")
                                    Else
                                        Response.Write("Gutschein Nr. [" & Request("gutscheinNummer") & "] wurde nicht akzeptiert!")
                                    End If
                                End If

                                'Response.Write "ITEMS:" & request("Items")
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
<input type="submit" class="button" value="<%=getTranslation("Warenkorb aktualisieren")%>">
<%  End If%>
</form>
<!-- END WARENKORB UPDATE FORM-->
<%  If emptySet Then%>
<form method="POST" action="default.asp">
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
                    1.
                    <%=getTranslation("Transport:")%>
                </th>
                <td height="21" valign="middle" align="left">
                    <%
                        'dim rsZM, selected            
                        sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
                        rsZM = objConnectionExecute(sql)
                        While Not rsZM.EOF
                            If UCase(Trim(postmode)) = UCase(Trim(rsZM("methode"))) Then selected = "checked" Else selected = ""
                            'Response.Write selected
                    %>
                    <input type="radio" class="submit" value="<%=rsZM("methode")%>" name="PostMode" <%=selected%>
                        onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=rsZM("methode")%>';">
                    <%=rsZM("methode")%>
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
                            'dim rsZM, selected            
                            sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' and Methode = '" & postmode & "' group by destination  order by destination"
                            rsZM = objConnectionExecute(sql)
                            While Not rsZM.EOF
                                If UCase(Trim(destination)) = UCase(Trim(rsZM("destination"))) Then selected = "checked" Else selected = ""
                                'Response.Write selected
                        %>
                        <!--<option class="submit" value="<%=rsZM("destination")%>"> <%=rsZM("destination")%>
								-->
                        <input type="radio" class="submit" value="<%=rsZM("destination")%>" name="destination"
                            <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination=<%=rsZM("destination")%>';">
                        <%=rsZM("destination")%>
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
                            <%=showPossiblePostMethodsAccordungDestination(destination,postMode,paymode)%>
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
                                    Dim rsZM, selected
            
                                    sql = "select methode, Destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, Destination order by methode"
                                    rsZM = objConnectionExecute(sql)
                                    While Not rsZM.EOF
                                        'show only PayMethods for the selected destination or general destinations 
                                        If UCase(Trim(rsZM("destination"))) = "" Or UCase(Trim(rsZM("destination"))) = UCase(Trim(destination)) Then
                                            If UCase(Trim(paymode)) = UCase(Trim(rsZM("methode"))) Then selected = "checked" Else selected = ""
                                            'Response.Write selected
                                %>
                                <input type="radio" class="submit" value="<%=rsZM("methode")%>" name="PayMode" <%=selected%>
                                    onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep1&paymode=<%=rsZM("methode")%>&postmode=<%=postmode%>';">
                                <%=rsZM("methode")%>
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
                                <hr>
                            </td>
                            </td>
                            <%End If%>
                            <!-- END SELECT PLACE OF DELIVERY  -->
    </table>
</center>
<p align="right">
    <%if (not payMode& "" = "" ) and (not postMode& "" = "" ) and (not destination& "" = "" ) then %>
    <input type="submit" class="button" value="<%=getTranslation("zur Kasse")%>">
    <% Else%>
    <img src="<%=imageFullName("zurkasse.gif")%>" value="<%=getTranslation("zur Kasse")%>">
    <%End If%>
</p>
</form>
<%  End If
End If 'purchasing allowed 
%>
<%
    Dim logHTML1
    logHTML1 = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_functions.htm"))
    logHTML1 = parseTemplate(logHTML, null)
    Response.Write(logHTML1)

%>
<!-- END WARENKORB  -->
