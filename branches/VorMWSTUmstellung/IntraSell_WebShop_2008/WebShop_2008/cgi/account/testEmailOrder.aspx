<%
    'Example to call this ASP page:  
    ' http://www.ptec.co.at/default.aspx?pageToShow=TestEmailOrder&kdnr=33214&AuftragNr=2600&debug=true
    Dim mailtext As String
    Dim KDNR1 As String = Request("kdnr")
    Dim AuftragNr As String = Request("AuftragNr")
    'Dim Name : Name = TABLEVALUE("ofAdressen","IDNR", KDNR, "Name")   
    mailtext = MAKE_EMAIL_ORDER(KDNR1, AuftragNr)
    'send mail to client      
    sendMailFromWithSending(GetClientEmail(KDNR1), getTranslation("Ihre Bestellung #") & AuftragNr, mailtext, VARVALUE("EMAIL_AUTOCONFIRM"))

    Response.Write("Sending should be OK!")
%>