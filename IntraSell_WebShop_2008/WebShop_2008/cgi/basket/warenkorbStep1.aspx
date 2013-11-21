<!-- WARENKORB STEP 1-->
<%
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
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
        document.forms['FormBasket'].PageToShow.value = 'warenkorbStep1';

      }

</script>
<div>
<form action="default.aspx" method='post' id="warenkorbStep1" name="warenkorbStep1">
<input type='hidden' name='pageToShow' value='warenkorbStep1' />
<input type='hidden' name='showForm' value='false'><!-- do not show profile form on error -->
<!-- WARENKORB -->
<%

 

        If Request("notiz") <> "" Then Session("notiz") = Request("notiz")

        'GUTSCHEIN 
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

        isWarenkorbVoll = visualizeWarenkorb("1", Session("LAND"), Nothing, Nothing, Nothing)
%>
<br />
<%  If isWarenkorbVoll Then%>
<input type="submit" class="button" value="<%=getTranslation("Warenkorb aktualisieren")%>" />&nbsp;
<input type="button" class="button" value="<%=getTranslation("weiter shoppen")%>" onclick="document.location='default.aspx';" />&nbsp;
<%  End If%>
</form>


<!-- Next Step -->


<%  If isWarenkorbVoll Then%>
<form method='post' action="default.aspx" id="FormBasket" name="warenkorbStep1a">
    <input type="hidden" name="PageToShow" value="warenkorbStep2" />
    <input type='hidden' name='showForm' value='false' />
    <p align="right">
        <input type="button" class="button" value="<%=getTranslation("abbrechen")%>" onclick="cancel();" />

        <% If VARVALUE_DEFAULT("SHOP_SHOW_ALLOW_ORDER", "true") = "true" Then%>
            &nbsp;<input type="submit" class="button" value="<%=getTranslation("zur Kasse")%>" />
        <% End If%>

        <br />
    </p>
</form>

    <%Else%>
 

<%  End If%>

</div>

 <%
Dim logHTML As String
logHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_functions.htm"))
logHTML = parseTemplate(logHTML, Nothing)
Response.Write(logHTML)
%>
<!-- END WARENKORB  -->
<script language="VB" runat="server">
    Dim rsWK
    Dim i As Integer, pos As Integer
    Dim an As String, chn
    Dim qn As String
    Dim sql As String
    Dim isWarenkorbVoll As Boolean
    Dim gutscheinNummer As String
</script>
