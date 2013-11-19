<!--#include file="defaulthead.inc"-->
<%
 'Wait 10
 Dim httpReader
             Set httpReader = Server.CreateObject("Tonkov.aspHttp")
 dim orderHTML: orderHTML = httpReader.getURL ("http://www.google.at")

response.write orderHTML 

response.end
response.write varvalue("ADMIN") 
response.write varvalue("ADMINPASS") 
response.write VarValue("SMTP") 
response.flush

'    dim myCDONTSMail 
'	Set myCDONTSMail = CreateObject("CDONTS.NewMail")


     'response.end 

Set httpReader = Server.CreateObject("Tonkov.aspHttp")


 Dim mailtext 
   Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")   
   mailtext = MAKE_EMAIL_ORDER(1, 1)				

   response.write mailtext  

 'send mail to client      
  ' sendMailFromWithSending GetClientEmail (KDNR) , getTranslation("Ihre Bestellung #") & AuftragNr, mailtext , VARVALUE("EMAIL_AUTOCONFIRM")
   'send same mail to shop manager
  ' sendMailFromWithSending VARVALUE("EMAIL"), getTranslation("Ihre Bestellung #") & AuftragNr , mailtext , VARVALUE("EMAIL_AUTOCONFIRM")
   'send same mail to shop manager
   'sendMailFromWithSending VARVALUE("ADMIN_EMAIL"), getTranslation("Ihre Bestellung #") & AuftragNr , mailtext , VARVALUE("EMAIL_AUTOCONFIRM")

%>