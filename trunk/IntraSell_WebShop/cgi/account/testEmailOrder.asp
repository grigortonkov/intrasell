<%
   Dim mailtext 
   Dim KDNR1 : KDNR1 = 1229 
   Dim AuftragNr: AuftragNr = 10502989
   'Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")   
   mailtext = MAKE_EMAIL_ORDER(KDNR1, AuftragNr)				
   'send mail to client      
   sendMailFromWithSending GetClientEmail (KDNR1) , getTranslation("Ihre Bestellung #") & AuftragNr, mailtext , VARVALUE("EMAIL_AUTOCONFIRM")
%>