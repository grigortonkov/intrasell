<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
%>


<!-- WARENKORB STEP 3-->

<%
    If IsNumeric(Request("UseOldLI2")) Then Session("UseOldLI2") = Request("UseOldLI2")
    If IsNumeric(Request("UseOldAR2")) Then Session("UseOldAR2") = Request("UseOldAR2")

    'response.write Email & Password
    'Find Client 
    Dim KundNrStep3 As Long : KundNrStep3 = authenticate(Session("EmailOld"), Session("PasswordOld")) 'stops processing on this page if not proper authenitification !!!
    
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
             
    //Submit this basket as an offer
     function submitOffer() {
       var note = document.forms['FormBasket'].Notiz; 

         if (note.style.display == "none") {
          
             note.value = "<%=getTranslation("Geben Sie hier Ihre Tel.Nr und/oder Email bekannt:")%>";
             //set visible 
             note.style.display = "block"; 
         } else {
             document.forms['FormBasket'].PageToShow.value = 'warenkorbStepOffer';
             document.forms['FormBasket'].submit();
         }
     }  

                  
    //Submit this basket as an order
     function submitOrder() {
       
          var myProfile = document.getElementById("ProfileForm"); //document.forms['FormBasket'].ProfileForm; //
          //alert(myProfile.style.display);

         if (myProfile.style.display == "none") {
             myProfile.style.display = "block";
             document.forms['FormBasket'].Notiz.style.display = "block";
             

             //document.getElementById("EmailwiederholungAD").style.display = "none"; 
             document.getElementById("PasswortAD").value = "asdfasdf"; //something else josef ? 
             document.getElementById("PasswortAD").style.display = "none"; 
             document.getElementById("RowPasswort").style.display = "none"; 

             document.getElementById("PasswortIIAD").value = "asdfasdf"; //something else josef ? 
             document.getElementById("PasswortIIAD").style.display = "none";          
             document.getElementById("RowPasswortII").style.display = "none";    

             document.getElementById("IchWillNewsletterAD").checked = false;
             
             //hide fields 
             document.getElementById("FirmaAD").style.display = "none"; 
             document.getElementById("UIDAD").style.display = "none"; 
             document.getElementById("GeburtstagAD").style.display = "none";    
             document.getElementById("MobilAD").style.display = "none"; 
             document.getElementById("FaxAD").style.display = "none"; 
             document.getElementById("WebAD").style.display = "none"; 
             document.getElementById("TelIIAD").style.display = "none"; 
             

         } else 
         {

             //check if all fields are filled in 
             var Firma = document.getElementById("FirmaAD").value;
             var Anrede = document.getElementById("AnredeAD").value;
             var Titel = document.getElementById("TitelAD").value;

             // ab hier pflichtige 
             var Vorname = document.getElementById("VornameAD").value;
             var Name = document.getElementById("NameAD").value;
             var Strasse = document.getElementById("StrasseAD").value;
             var Ort = document.getElementById("OrtAD").value;
             var Tel = document.getElementById("TelAD").value;
             var Email = document.getElementById("EmailAD").value;
  
            // alert(firma);  
             var errors = ""; 
                //alert(Vorname);
             if (document.getElementById("AnredeAD").selectedIndex == 0)
                 if (Anrede == "" || Anrede == null) 
                    errors = errors + " Anrede"; 
             if (Vorname == "" || Vorname == null)   
                errors = " Vorname"; 
             if (Name == "" || Name == null)   
                errors = errors + " Name"; 
             if (Strasse == "" || Strasse == null)   
                errors = errors + " Strasse"; 
             if (Ort == "" || Ort == null)   
                errors = errors + " Ort"; 
             if (Tel == "" || Tel == null)   
                errors = errors + " Tel"; 
             if (Email == "" || Email == null) 
                errors = errors + " Email"; 


             if (errors != "") { 
                  alert ("Bitte alle Felder ausfüllen! Es fehlen folgende Angaben: " + errors); 
                  return; 
         }
         //else 

             document.getElementById("Hinweis").innerText = '<%=getTranslation("Bestellvorgang läuft. Warten Sie bis die Bestellung abgeschlossen ist!")%>';
             document.forms['FormBasket'].PageToShow.value = 'warenkorbStepOrder';
             document.forms['FormBasket'].submit();
         }
     }  

      function cancel() {
       
        var myProfile = document.getElementById("ProfileForm"); 
        
        myProfile.style.display = "none"; 
        document.forms['FormBasket'].Notiz.style.display = "none";
        document.forms['FormBasket'].Notiz.value = "";
        document.forms['FormBasket'].PageToShow.value = 'warenkorbStep3';

      }

</script>
<!-- END WARENKORB UPDATE FORM-->
<form method='post' action="default.aspx" id="FormBasket" name="warenkorbStep3">
<input type="hidden" name="PageToShow" value="warenkorbStep4">
<input type='hidden' name='showForm' value='false'><!-- do not show profile form on error -->
<%

    
    If Not isPurchasingAllowed() Then
        Response.Write(getTranslation("Bestellen ist nur für registrierte Kunden gestattet."))
    Else 'allowed  
            
        paymode = Request("PayMode") : If paymode & "" = "" Then paymode = Session("PayMode") : If paymode & "" = "" Then paymode = DEFAULT_PAYMODE
        postmode = Request("PostMode") : If postmode & "" = "" Then postmode = Session("PostMode") : If postmode & "" = "" Then postmode = DEFAULT_POSTMODE
        destination = Request("Destination") : If destination & "" = "" Then destination = Session("Destination") : If destination & "" = "" Then destination = DEFAULT_POSTMODE_DESTINATION
        If destination <> "" Then Session("LAND") = destination

        Session("PayMode") = paymode
        Session("PostMode") = postmode
        Session("Destination") = destination
        
        'Response.Write("<br/>PayMode=" & Session("PayMode"))
        'Response.Write("<br/>PostMode=" & Session("PostMode"))
        'Response.Write("<br/>Destination=" & Session("Destination"))
%>
<%isWarenkorbVoll = visualizeWarenkorb("3", Session("LAND"), paymode, postmode, destination)%>
<center>
    <table border="0" cellpadding="5" cellspacing="5" style="border-collapse: collapse"
        bordercolor="#111111" height="1" width="100%">
        <!-- WARENKORB POSTMODE-->
        <%If VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" Then%>
      
        <tr>
            <th height="21" valign="middle" style="text-align: left">
                1.<%=getTranslation("Transport:")%>
            </th>
            <td height="21" valign="middle" align="left">
                <%
                    'dim rsZM, selected            
                    sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
                    Dim rsZM = objConnectionExecute(sql)
                    While Not rsZM.EOF
                        If UCase(Trim(postmode)) = UCase(Trim(rsZM("methode").Value)) Then selected = "checked" Else selected = ""
                        'Response.Write selected
                %>
                <input type="radio" class="submit" value="<%=rsZM("methode").Value%>" name="PostMode"
                    <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep3&paymode=<%=paymode%>&postmode=<%=rsZM("methode").Value%>';">
                <%=rsZM("methode").Value%>
                <%
                    rsZM.MoveNExt()
                End While
                %>
            </td>
        </tr>
        <%End If%>
        <!-- END WARENKORB POSTMODE-->
        <!--SELECT PLACE OF DELIVERY -->
        <% If varvalue("CALCULATE_CHANGE_DESTINATION") = "TRUE" Then%>
        <% If varvalue(CALCULATE_POSTCOSTS) = "TRUE" Then%>
   
        <tr>
            <th valign="middle" width="257" style="text-align: left">
                2.<%=getTranslation("Destination der Lieferung:")%>
            </th>
            <td valign="middle" width="490" align="left" style="border-style: dashed none none none; border-width: thin"> 
                <%
                    
                    'Die Lieferadresse Drucken 
                    Dim lieferAdresse As String
                    If IsNumeric(Session("UseOldLI2")) Then
                        lieferAdresse = printAddress(KundNrStep3, TypeOfAddress.SHIPPING2, False, False, False, Session("UseOldLI2"))
                    Else
                        lieferAdresse = printAddress(KundNrStep3, TypeOfAddress.SHIPPING, False, False, False)
                    End If
                    Response.Write(lieferAdresse)
                     
                    'Response.Write("Zustellland=" & GetLieferland(KundNrStep3, Session("UseOldLI2")))
                    
                    Dim lieferLand As String = FIRSTVALUE("select iso2 from grLand where idnr='" & GetLieferland(KundNrStep3, Session("UseOldLI2")) & "'")
                    destination = lieferLand 'Der Kunde kann es nicht mehr auswählen
                    Session("Destination") = destination
                    'Response.Write("Zustellland=" & lieferLand)
                    
                    Dim selected
                    sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' and Methode = '" & postmode & "' and destination is not null group by destination order by destination"
                    Dim rsZM1 = objConnectionExecute(sql)
                    While Not rsZM1.EOF
                        If Not IsDBNull(rsZM1("destination").Value) And Not IsDBNull(destination) Then
                            If UCase(Trim(destination)) = UCase(Trim(rsZM1("destination").Value)) Then selected = "checked" Else selected = ""
                        End If
                        'Response.Write selected
                %>
                <input type="radio" disabled="disabled" class="submit" value="<%=rsZM1("destination").Value%>" name="destination"
                    <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep3&paymode=<%=paymode%>&postmode=<%=postmode%>&destination=<%=rsZM1("destination").Value%>';">
                <%=getFriendlyDestination(rsZM1("destination").Value)%>
                <%
                    rsZM1.MoveNExt()
                End While
                %>
                </select>
            </td>
        </tr>
        <%End If%>
        <%If VARVALUE(CALCULATE_POSTCOSTS) = "TRUE" Then%>

        <tr>
            <th style="text-align: left">
                3.
                <%=getTranslation("Waehlen Sie Transportart fuer Ihre Lieferung:")%>
            </th>
            <td align="left" style="border-style: dashed none none none; border-width: thin">
                <%=showPossiblePostMethodsAccordungDestination(destination, postMode, paymode)%>
            </td>
        </tr>
        <!-- END OF DELIVERY -->
        <%End If%>

        <!-- WARENKORB PAYMODE-->
        <tr>
            <th height="1" valign="middle" width="257" style="text-align: left">
                4.
                <%=getTranslation("Bestellung-/Zahlungsart:")%>
            </th>
            <td valign="middle" align="left" style="border-style: dashed none none none; border-width: thin">
             <table border="0"><tr>
                <%
                                  
                    sql = "select methode, Destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, Destination order by methode"
                    Dim rsZM = objConnectionExecute(sql)
                    While Not rsZM.EOF
                        'show only PayMethods for the selected destination or general destinations 
                        If UCase(Trim(rsZM("destination").Value)) = "" Or UCase(Trim(rsZM("destination").Value)) = UCase(Trim(destination)) Then
                            If UCase(Trim(paymode)) = UCase(Trim(rsZM("methode").Value)) Then selected = "checked" Else selected = ""
                            'Response.Write selected
                %>
               <td valign="top">
                <input type="radio" class="submit" value="<%=rsZM("methode").Value%>" name="PayMode"
                    <%=selected%> onclick="WaitForCalculation();document.location='default.aspx?pageToShow=warenkorbStep3&paymode=<%=rsZM("methode").Value%>&postmode=<%=postmode%>';">
                <table border="0">
                    <tr>
                        <td>
                            <%=rsZM("methode").Value%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <!--Bild Zahlart-->
                            <img src="/skins/skin<%=SkinNumber%>/images/payment/<%=rsZM("methode").Value%>.jpg" />
                        </td>
                    </tr>
                </table>
                </td>
                <%
                End If
                rsZM.MoveNExt()
            End While
                %>
               </tr> </table>
            </td>
        </tr>
        <!-- END WARENKORB PAYMODE-->
  
        <%End If%>
        <!-- END SELECT PLACE OF DELIVERY  -->
    </table>
    <textarea id="Notiz" name="Notiz" rows="3" visible="false" style="display: none;"
        cols="80">
    </textarea>
    <div id="ProfileForm" name="ProfileForm" style="display: none;">
        <%= drawEmptyProfileForm(TypeOfAddress.ACCOUNT, False,-1)%>
    </div>
</center>
<p align="right">
    <%If (Not paymode & "" = "") And (Not postmode & "" = "") And (Not destination & "" = "") Then%>
    <% If VARVALUE_DEFAULT("SHOW_SHOW_BUTTON_SHOPPING", "true") = "true" Then%>
    <input type="button" class="button" value="<%=getTranslation("weiter shoppen")%>"
        onclick="document.location='default.aspx';">&nbsp;
    <% End If%>
    <input type="button" class="button" value="<%=getTranslation("abbrechen")%>" onclick="cancel();" />
    <% If VARVALUE_DEFAULT("SHOP_SHOW_ALLOW_OFFERS", "true") = "true" Then%>
    &nbsp;<input type="button" class="button" value="<%=getTranslation("Angebot anfordern")%>"
        onclick="submitOffer();" />
    <%  End If%>
    <% If VARVALUE_DEFAULT("SHOP_SHOW_ALLOW_ORDER_WITHOUT_REGISTRATION", "true") = "true" Then%>
    &nbsp;<input type="button" class="button" value="<%=getTranslation("bestellen")%>"
        onclick="submitOrder();" />
    <%End If%>
    <% If VARVALUE_DEFAULT("SHOP_SHOW_ALLOW_ORDER", "true") = "true" Then%>
    &nbsp;<input type="submit" class="button" value="<%=getTranslation("zur Kasse")%>" />
    <% End If%>
    <%Else%>
    <% If VARVALUE_DEFAULT("SHOP_SHOW_ALLOW_ORDER", "true") = "true" Then%>
    <img src="<%=imageFullName("zurkasse.gif")%>" value="<%=getTranslation("zur Kasse")%>"
        alt="<%=getTranslation("zur Kasse")%>" />
    <% End If%>
    <%End If%>
    <br />
</p>
</form>
<%  End If 'purchasing allowed 
%>
<!-- END WARENKORB  -->
<script language="VB" runat="server">
    '
    'Dim rsZM
    Dim paymode As String, postmode As String, destination As String
    Dim selected As String
</script>
 
 