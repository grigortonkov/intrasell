<%
'Example to call this ASP page:  
' http://www.ptec.co.at/default.asp?pageToShow=TestEmailOrder&kdnr=33214&AuftragNr=2600&debug=true
   Dim mailtext 
   Dim KDNR1 : KDNR1 = request("kdnr") 
   Dim AuftragNr: AuftragNr = request("AuftragNr")
   'Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")   
   mailtext = MAKE_EMAIL_ORDER(KDNR1, AuftragNr)				
   'send mail to client      
   sendMailFromWithSending GetClientEmail (KDNR1) , getTranslation("Ihre Bestellung #") & AuftragNr, mailtext , VARVALUE("EMAIL_AUTOCONFIRM")

   Response.Write "Sending should be OK!"
%>