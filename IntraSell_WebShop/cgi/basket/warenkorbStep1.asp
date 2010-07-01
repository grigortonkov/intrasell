<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================

Const SHOW_SELECT_POST = false 
Const SHOW_SELECT_DESTINATION = false 

%>
<div id="Hinweis" style="color=red">&nbsp;</div>
<Script language="JavaScript">
			function WaitForCalculation() {    
			   //alert("Warten Sie bis die Berechnung l&auml;uft!");
			  if(document.all) //IEXplorer 
			   document.getElementById("Hinweis").innerText = "<%=getTranslation("Warten Sie bis die Berechnung fertig ist!") & getTranslation(" Tipp: Browser Symbol dreht sich nicht mehr.")%>";
			   //document.write("Warten Sie bis die Berechnung l&auml;uft!");
			 }; 	 
</Script>
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


if not isPurchasingAllowed() then
     response.Write getTranslation("Einkaufen ist nur für registrierte Kunden erlaubt!")
else 'allowed  
       	 
payMode = Request("PayMode"):   if payMode&"" = "" then payMode = Session("PayMode"): if payMode&"" = "" then payMode = DEFAULT_PAYMODE
postMode = Request("postMode"): if postMode&"" = "" then postMode = Session("postMode"): if postMode&"" = "" then postMode = DEFAULT_POSTMODE
destination = Request("destination"): if destination&"" = "" then destination  = Session("destination"): if destination&"" = "" then destination  = DEFAULT_POSTMODE_DESTINATION
if destination <> "" then Session("LAND") = destination ' Change destination 

Session("PayMode") = PayMode
Session("postMode") = postMode
Session("destination") = destination

if debug() then 
    Response.Write "payMode=" & payMode 
    Response.Write "DEFAULT_PAYMODE=" & DEFAULT_PAYMODE
end if 

'for mecom 
if destination = "Germany" then payMode = "Vorauskasse"
If request("notiz") <> "" then Session("notiz")=request("notiz")


'GUTSCHEIN PROBLEMATIK 
'Response.Write "gutscheinNummer: " & request("gutscheinNummer")
If request("gutscheinNummer") <> "" then 
  if getPreisForGutschein(request("gutscheinNummer")) > 0 then 
		Session("gutscheinNummer")=request("gutscheinNummer")
  else 
	    Response.Write "Gutschein Nr. [" & request("gutscheinNummer") & "] wurde nicht akzeptiert!" 
  end if  
end if    

'Response.Write "ITEMS:" & request("Items")
if request("Items") <> "" Then ' Update is needed
	For i = 1 to CInt(request("Items"))
		an = "Art" & i
		qn = "Stk" & i
		chn = "checkD" & i 
		'Response.write " qn = " & request(qn) & " checked is : " & request(chn)
		if lcase(request(chn)) = "on" then ' delete item
			sql = "Update webWarenkorb set Quantity='0'"
			sql = sql & " WHERE ArtNr = " &  request(an)
			sql = sql & " AND SID=" & getSID()
			set rsWK = objConnectionExecute(sql)
		Else ' update quantity
			sql = "Update webWarenkorb set Quantity='" & request(qn)
			sql = sql & "' WHERE ArtNr = " &  request(an)
			sql = sql & " AND SID=" & getSID()
			set rsWK = objConnectionExecute(sql)
		End if	
			
	Next
	
End if

emptySet = visualizeWarenkorb("1", Session("LAND"), payMode, postMode, destination)
%>
	<%if emptySet then %>
		<input type="submit" class="button"  value="<%=getTranslation("Warenkorb aktualisieren")%>">
	<%end if%>
</form>
<!-- END WARENKORB UPDATE FORM-->
<%if emptySet then %>
<form method="POST" action="default.asp">
	<input type="hidden" name="PageToShow" value="warenkorbStep2">
	<center>
		<table border="0" cellpadding="5" cellspacing="5" style="border-collapse: collapse" bordercolor="#111111" height="1" width="100%">
		<tr><td colspan="2"><hr></td></td>
			<!-- WARENKORB POSTMODE-->
			<tr>
				<th height="21" valign="middle">1. <%=getTranslation("Transport:")%></th>
				<td height="21" valign="middle" align="left"><%
            'dim rsZM, selected            
            sql = "select methode from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' group by methode order by methode"
            set rsZM = objConnectionExecute(sql) 
            while not rsZM.EOF 
              if ucase(trim(postMode)) = ucase(trim(rsZM("methode"))) then selected = "checked" else selected=""
              'Response.Write selected
				%>
					<input type="radio" class="submit" value="<%=rsZM("methode")%>" name="PostMode" <%=selected%> onClick="WaitForCalculation();document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=rsZM("methode")%>';">
					<%=rsZM("methode")%>
					<%
				rsZM.MoveNExt
            wend
            %>
				</td>
			</tr>
			<!-- END WARENKORB POSTMODE-->
			
			<tr><td colspan="2"><hr></td></td>
			<!--SELECT PLACE OF DELIVERY -->
			<% if varvalue("CALCULATE_CHANGE_DESTINATION") = "TRUE" then %>
			<tr>
				<th valign="middle" width="257">
					2.<%=getTranslation("Destination der Lieferung:")%>
				</th>
				<td valign="middle" width="490" align="left">
					        <!--
							 <select name="destination" onClick="document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination='+document('destination');">
							 <option class="submit" value="<%=destination%>"> <%=destination%>
							 -->
					<%
							'dim rsZM, selected            
							sql = "select destination from [grArtikel-Vertriebskosten] where typ like 'TRANSPORT' and Methode = '" & postMode & "' group by destination  order by destination"
							set rsZM = objConnectionExecute(sql) 
							while not rsZM.EOF 
							  if ucase(trim(destination)) = ucase(trim(rsZM("destination"))) then selected = "checked" else selected=""
							  'Response.Write selected
								%>
					<!--<option class="submit" value="<%=rsZM("destination")%>"> <%=rsZM("destination")%>
								-->
					<input type="radio" class="submit" value="<%=rsZM("destination")%>" name="destination" <%=selected%> onClick="WaitForCalculation();document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=paymode%>&postmode=<%=postmode%>&destination=<%=rsZM("destination")%>';">
					<%=rsZM("destination")%>
					<%
								rsZM.MoveNExt
							wend
							%>
					</select>
				</td>
			</tr>
			
			<tr><td colspan="2"><hr></td></td>
			
			<tr>
				<th>3. <%=getTranslation("Waehlen Sie Transportart fuer Ihre Lieferung:")%></th>
				<td align="left">
					<%=showPossiblePostMethodsAccordungDestination(destination,postMode,paymode)%>
				</td>
			</tr>
			<!-- END OF DELIVERY -->
			<tr><td colspan="2"><hr></td></td>
			
			<!-- WARENKORB PAYMODE-->
			<tr>
				<th height="1" valign="middle" width="257">
			 
					4. <%=getTranslation("Bestellung-/Zahlungsart:")%>
				</th>
				<td valign="middle"  align="left">
				 
					<%
            dim rsZM, selected 
            
            sql = "select methode, Destination from [grArtikel-Vertriebskosten] where typ like 'PAYMENT' group by methode, Destination order by methode"
            set rsZM = objConnectionExecute(sql) 
            while not rsZM.EOF 
              'show only PayMethods for the selected destination or general destinations 
				if ucase(trim(rsZM("destination"))) = "" or ucase(trim(rsZM("destination"))) = ucase(trim(destination)) then 
					if ucase(trim(payMode)) = ucase(trim(rsZM("methode"))) then selected = "checked" else selected=""
					'Response.Write selected
					%>
					<input type="radio" class="submit" value="<%=rsZM("methode")%>" name="PayMode" <%=selected%> onClick="WaitForCalculation();document.location='default.asp?pageToShow=warenkorbStep1&paymode=<%=rsZM("methode")%>&postmode=<%=postmode%>';">
					<%=rsZM("methode")%>
					<%
				end if		
				rsZM.MoveNExt
            wend
            %>
          
				</td>
			</tr>
			<!-- END WARENKORB PAYMODE-->
			<tr><td colspan="2"><hr></td></td>
			
			<%end if %>
			<!-- END SELECT PLACE OF DELIVERY  -->
		</table>
	</center>
	<p align=right>
			<%if (not payMode& "" = "" ) and (not postMode& "" = "" ) and (not destination& "" = "" ) then %>
				<input type="submit" class="button" value="<%=getTranslation("zur Kasse")%>">
			<% else %>
			    <img src="<%=imageFullName("zurkasse.gif")%>" value="<%=getTranslation("zur Kasse")%>">
			<%end if %>
    </p>
</form>
<%end if
end if 'purchasing allowed 
%>
<%
dim logHTML1 
logHTML1 = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_functions.htm"))
logHTML1 = parseTemplate(logHTML, null)
Response.Write logHTML1

%>
<!-- END WARENKORB  -->
