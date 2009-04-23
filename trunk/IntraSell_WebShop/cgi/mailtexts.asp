<%

function MAKE_EMAIL_REGISTRATION(KDNR)

Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")   
Dim Email : Email = TABLEVALUE("ofAdressen","IDNR", KDNR, "Email")   
Dim Passwort : Passwort = TABLEVALUE("ofAdressen","IDNR", KDNR, "Passwort")   
Dim html 


html =  readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_registration_confirmation.htm"))


html = replace(html, "[DOMAIN]", VARVALUE("DOMAIN"))
html = replace(html, "[Email]", Email)
html = replace(html, "[Passwort]", Passwort)
html = replace(html, "[Name]", Name)
html = replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
html = replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
'html = replace(html, "[LINK_REGISTRATION]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccount")
html = replace(html, "[LINK_REGISTRATION]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccount&Email=" & Email & "&Password=" & Passwort)

call replaceUserTags(KDNR,html)
MAKE_EMAIL_REGISTRATION = html 									
end function 


function MAKE_EMAIL_REGISTRATION_SIMPLE(KDNR)

		Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")   
		Dim Email : Email = TABLEVALUE("ofAdressen","IDNR", KDNR, "Email")   
		Dim Passwort : Passwort = TABLEVALUE("ofAdressen","IDNR", KDNR, "Passwort")   
		Dim html 


		html = readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_registration_confirmation_simple.htm"))

		html = replace(html, "[DOMAIN]", VARVALUE("DOMAIN"))
		html = replace(html, "[Email]", Email)
		html = replace(html, "[Passwort]", Passwort)
		html = replace(html, "[Name]", Name)
		html = replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
		html = replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
		html = replace(html, "[LINK_REGISTRATION]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccount&Email=" & Email & "&Password=" & Passwort)
		html = replace(html, "[LINK_REGISTRATION_ACTIVATION]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccountActivate&Email=" & Email & "&Password=" & Passwort)

		call replaceUserTags(KDNR,html)
		MAKE_EMAIL_REGISTRATION_SIMPLE = html
	 									
end function 


function MAKE_EMAIL_SEND_PASSWORD(KDNR)
 
		Dim html 
        Dim Passwort
        
		html = readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_send_password.htm"))
		html = replace(html, "[DOMAIN]", VARVALUE("DOMAIN"))
		html = replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
		html = replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
		html = replace(html, "[LINK_REGISTRATION]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccount&Email=" & Email & "&Password=" & Passwort)
		html = replace(html, "[LINK_REGISTRATION_ACTIVATION]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccountActivate&Email=" & Email & "&Password=" & Passwort)

        call replaceUserTags(kdnr, html)
        
		MAKE_EMAIL_SEND_PASSWORD = html
	 																 								
end function 

function MAKE_EMAIL_ORDER(KDNR, AuftragNr)
   const TAG_EMBED_ORDER = "[EMBED_ORDER]"
		Dim html 
		
		'reads from root folder 
		html =  readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_order_confirmation.htm"))		
		
		html = replace(html, "[AuftragNr]", AuftragNr)
		html = replace(html, "[LINK_ORDER]", SESSION("BASENAME") & "/default.asp?pageToShow=MyAccount")
		html = replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
		html = replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
        'get the last object inserted 
        
        
        '[OBJECT_VIEW]
        dim rsLO, sqlLO: sqlLO = "select max(ArtNr) as lO from [buchAuftrag-Artikel] where RechNr=" & AuftragNr
        set rsLO = ObjConnectionExecute(sqlLO)
        if not rsLO.eof then 
            dim filenameForTemplate: filenameForTemplate = "productPage_OrderConfirmation.htm"
            dim maxArt: maxArt = rsLO("lo")
            if isnull(maxArt) then maxArt = "-1" 
            dim objectHTML: objectHTML = makeProductPageWithTemplate(maxArt, readTextFile(Server.MapPath(filenameForTemplate)))
			html = replace(html, "[OBJECT_VIEW]", objectHTML)
        end if 
        rsLo.close 

       '[LINK_ORDER_DIRECT]
        Dim realOrderLink: realOrderLink = SESSION("BASENAME") & "/cgi/account/printPreviewOrder.asp?kdnr=" & KDNR & "&nummer=" & AuftragNr & "&OrderType=AU"
        html = replace(html, "[LINK_ORDER_DIRECT]", realOrderLink)

       '[EMBED_ORDER] -embeds the html for the order directly to the mail 
        if inStr(html, TAG_EMBED_ORDER)> 0 then 'required 
             'try create the object 
             Dim httpReader
             Set httpReader = Server.CreateObject("Tonkov.aspHttp")
             Dim orderHTML: orderHTML = httpReader.getURL (realOrderLink)
             html = replace(html, TAG_EMBED_ORDER, orderHTML)
        end if 

        call replaceUserTags(kdnr, html)
		MAKE_EMAIL_ORDER = html		 
end function

function MAKE_EMAIL_TELL_A_FRIEND(ProductURL, BodyMail)
	dim html 
	dim name: name = request("ToName")
	dim artNr: artNr = request("ArtNr")

	html = BodyMail 'readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/emails/email_send_a_friend.htm"))
	
	html = replace(html, "[Name]", Name)
	html = replace(html, "[User text]", BodyMail)
	html = replace(html, "[ProductURL]", ProductURL)
	html = replace(html, "[FromMail]", request("FromMail"))
    html = replace(html, "[UserText]", request("UserText"))
    
	html = makeProductPageWithTemplate(ArtNr,html)
	
	MAKE_EMAIL_TELL_A_FRIEND = html 

	exit function 

	MAKE_EMAIL_TELL_A_FRIEND = "HI!" & chr(10) & chr(13) & _
			"This e-mail was sent via " & VARVALUE("DOMAIN") & " e-mail notification by request from your friend to " & _
			"infrom you about our greatest product list. Check your friend suggestion at: " & _
			 chr(10) & chr(13) & _
			 ProductURL & _
			 chr(10) & chr(13) & _
			 chr(10) & chr(13) & _
			 BodyMail
			 
	MAKE_EMAIL_TELL_A_FRIEND = BodyMail		 
		 
end function 
		 
function MAKE_EMAIL_NEWSLETTER(Email)
		MAKE_EMAIL_NEWSLETTER = " Liebe(r)  Benutzer(in)!" & chr(10) & chr(13) & _
		" Vielen Dank f&uuml;r Ihre Registrierung des " & VARVALUE("DOMAIN") & " Newsletters." & chr(10) & chr(13) & _
		" Sie haben sich am " & now & " von der IP Adresse " & Request.ServerVariables("REMOTE_HOST") & chr(10) & chr(13) & _
		" f&uuml;r unseren Newsletter angemeldet." & chr(10) & chr(13) & chr(10) & chr(13) & _
		" Regelm&auml;ßig werden Sie &uuml;ber Produkte, Angebote, Gewinnspiele, Vorteile uvm informiert." & chr(10) & chr(13) & chr(10) & chr(13) & _
		" " & chr(10) & chr(13) & _ 
		" Viel Spass w&uuml;nscht Ihnen" & chr(10) & chr(13) & chr(10) & chr(13) & _
		" Ihr Team" 
end function 	
	 
'replaces user tags as [Name] [Email] in the emailtext 
sub replaceUserTags(byVal idnr, byRef html) 
  Dim kdnr: kdnr = idnr
        Dim Firma : Firma = TABLEVALUE("ofAdressen","IDNR", KDNR, "Firma")
 	    Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")
		Dim Vorname : VorName = TABLEVALUE("ofAdressen","IDNR", KDNR, "Vorname") 
		Dim Anrede : Anrede = TABLEVALUE("ofAdressen","IDNR", KDNR, "Anrede")   
		Dim Titel : Titel = TABLEVALUE("ofAdressen","IDNR", KDNR, "Titel")  
		Dim Email : Email = TABLEVALUE("ofAdressen","IDNR", KDNR, "Email")   
		Dim Passwort : Passwort = TABLEVALUE("ofAdressen","IDNR", KDNR, "Passwort")   
	    Dim Begruessung: Begruessung = "geehrter": if lcase(Anrede)<>"herr" then Begruessung = "geehrte"


		html = replace(html, "[Email]", Email & "")
		html = replace(html, "[Passwort]", Passwort & "")
		
        html = replace(html, "[Firma]", Firma & "")
		html = replace(html, "[Name]", Name & "")
		html = replace(html, "[Nachname]", Name & "")
		html = replace(html, "[Vorname]", Vorname & "")
		
		html = replace(html, "[Begruessung]", Begruessung & "") 
		html = replace(html, "[Anrede]", Anrede & "")
		html = replace(html, "[Titel]", Titel & "")  
		
		html = parseTemplateUserIDNR(idnr,html)  
end sub 

'==============================================================================
'Description: creates an email from emails template and sends it! 
'Parameters
'mailname - filename of file in scins 
'optional - idnr - if provided the mailtext will be saved in ofKorrespondenz
'==============================================================================
public function prepareAndSendEmail(mailname, subject, idnr)
   Dim mailtext:mailtext=readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/emails/" & mailname))		  	   
		 
		  dim addFormElements, singleFormElement
		  addFormElements = ""
		  
		  for each singleFormElement in request.Form 
		   if request.form(singleFormElement) <> "" then 
			   addFormElements = addFormElements & singleFormElement & " = " &  request.form(singleFormElement) & "<br>"
		       
		   end if 
		       mailtext = replace(mailtext,"[" & singleFormElement & "]", request.form(singleFormElement))
		  next 

		  for each singleFormElement in request.querystring 
		   if request(request.querystring(singleFormElement)) then 
			addFormElements = addFormElements & singleFormElement & " = " &  request.querystring(singleFormElement) & "<br>"
		   end if 
		   mailtext = replace(mailtext,"[" & singleFormElement & "]", request.querystring(singleFormElement))
		  next 
		  
		'mailtext = mailtext + "<hr>" & addFormElements	   
     
         call replaceUserTags(idnr, mailtext) 

		'response.Write "artNrAnfrage=" & artNrAnfrage
		if lcase(request("debug")) = "true" then 
			response.Write 	"Emailtext:<hr/>" & mailtext & "<hr/>"
			response.Write "All Form elements<br>" & addFormElements
		end if 

		'TODO: save this for the statistics 
		dim sqlK 
		sqlK = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & _ 
			idnr & ",'" & subject & "','" & replace(mailtext,"'","")  & "')"

		objConnectionExecute(sqlK)
			   
		     if sendMailFromWithSending(EmailAnbieter, subject, mailtext , varvalue("EMAIL")) then 
					response.write "<font color=""green"">Ihre Anfrage wurde erfolgreich abgesendet!</font>"
			 else 
					response.write "<font color=""red"">Das Email konnte nicht versendet werden!</font>"
			 end if 
		'send to webmaster too 
		call sendMailFromWithSending(varvalue("EMAIL"), subject,  mailtext , varvalue("EMAIL"))
        
end function 		 
%>