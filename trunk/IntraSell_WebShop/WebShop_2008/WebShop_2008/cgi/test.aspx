<!--#include file="defaulthead.inc.aspx"-->
<%
    'Wait 10
    Dim httpReader
    httpReader = Server.CreateObject("Tonkov.aspHttp")
    Dim orderHTML : orderHTML = httpReader.getURL("http://www.google.at")

    Response.Write(orderHTML)

    Response.End()
    Response.Write(varvalue("ADMIN"))
    Response.Write(varvalue("ADMINPASS"))
    Response.Write(VarValue("SMTP"))
    Response.Flush()

    '    dim myCDONTSMail 
    '    Set myCDONTSMail = CreateObject("CDONTS.NewMail")


    'response.end 

    httpReader = Server.CreateObject("Tonkov.aspHttp")


    Dim mailtext
    Dim Name : Name = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Name")
    mailtext = MAKE_EMAIL_ORDER(1, 1)

    Response.Write(mailtext)

    'send mail to client      
    ' sendMailFromWithSending GetClientEmail (KDNR) , getTranslation("Ihre Bestellung #") & AuftragNr, mailtext , VARVALUE("EMAIL_AUTOCONFIRM")
    'send same mail to shop manager
    ' sendMailFromWithSending VARVALUE("EMAIL"), getTranslation("Ihre Bestellung #") & AuftragNr , mailtext , VARVALUE("EMAIL_AUTOCONFIRM")
    'send same mail to shop manager
    'sendMailFromWithSending VARVALUE("ADMIN_EMAIL"), getTranslation("Ihre Bestellung #") & AuftragNr , mailtext , VARVALUE("EMAIL_AUTOCONFIRM")

%>