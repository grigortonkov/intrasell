<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================
%>
<!-- WARENKORB -->
<%

'CHECK AUTHENTIFICATION AND SEND TO STEP 3
   if request("CHECK_AUTHENTIFICATION")="YES" then 
       Dim KundNrStep2
       KundNrStep2 = authenticate(request("EmailOld"), request("PasswordOld"))'stops processing on this page if not proper authenitification !!!
        if KundNrStep2 <> ""  then ' OK
          
          Response.Redirect "default.asp?pageToShow=warenkorbStep3&EmailOld="&request("EmailOld")&"&PasswordOld="&replace(request("PasswordOld"),"#","RRAAUUTTEE")
        else 
        
          Response.Write getTranslation("Ihre Angaben sind nicht korrekt!")
        end if 
         
        
   end if 
'END CHECK 


payMode = Request("PayMode")
if payMode = "" then payMode = Session("payMode")
if payMode = "" then payMode = DEFAULT_PAYMODE
Session("payMode") = payMode

postMode = Request("postMode")
if postMode = "" then postMode = Session("postMode")
if postMode = "" then postMode = DEFAULT_POSTMODE
Session("postMode") = postMode

destination = Request("destination")
if destination = "" then destination = Session("destination")
if destination = "" then destination = DEFAULT_POSTMODE_DESTINATION
Session("destination") = destination


Dim ccNr, CCDat
ccNr = requesT("ccNR")
ccDat = requesT("ccDat")


If request("notiz") <> "" then Session("notiz")=request("notiz")

%>  
<%call visualizeWarenkorb("2", Session("LAND"), PayMode, PostMode, Destination)%>		  
<%
     Dim EmailOld, PasswordOld 
     if SESSION ("LOG_IN") <> "" then 	 
		EmailOld = TABLEVALUE("ofAdressen","IDNR", getLOGIN(), "Email")
		PasswordOld = TABLEVALUE("ofAdressen","IDNR", getLOGIN(), "Passwort")
     end if 
%>
	        
<form method="POST" action="default.asp">
<input type="hidden" name="PageToShow" value="warenkorbStep2">
<input type="hidden" name="CHECK_AUTHENTIFICATION" value="YES">
   
 <p align=right>
                <input type="button" class="button"  value="<%=getTranslation("weiter shoppen")%>" onclick="document.location='default.asp';">&nbsp;&nbsp;
                <input type="submit" class="button"  value="<%=getTranslation("Bestellung abschliessen")%>">
 </p>
                       
<%
'get LOGIN HTML 

dim logHTML: logHTML = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/basket/warenkorb_login.htm"))

'SET tags 
logHTML = replace (logHTML,"[USER_PASSWORD]",PasswordOld)
logHTML = replace (logHTML,"[USER_EMAIL]",EmailOld)

logHTML = parseTemplate(logHTML, null)


Response.Write logHTML
%>

</form>
<!-- WARENKORB -->