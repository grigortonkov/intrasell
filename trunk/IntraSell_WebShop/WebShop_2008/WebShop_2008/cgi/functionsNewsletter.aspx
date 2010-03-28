<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================



    '****************************************************************
    ' registerForNewsletter
    ' EmailForNewsletter = Email of requestor
    ' Newslettername = request("Interest") - that means can be collection of objects 
    '****************************************************************
    Function registerForNewsletter(ByVal EmailForNewsletter, ByVal NewsletterName)
        If EMailCheck(EmailForNewsletter) Then
            'delete first all old newsletter 
            Dim sqlNL : sqlNL = "delete from webNewsletter where Email like '" & Left(EmailForNewsletter, 255) & "'"
            objConnectionExecute(sqlNL)
            Dim newsletterRegistriert : newsletterRegistriert = False
            Dim newsletterItem : newsletterItem = ""
   
            Response.Write("Ihre Anmeldung für Newsletter [" + NewsletterName & "]: <br/>")
            'response.end
            For Each newsletterItem In Split(NewsletterName, ",")
                Dim nIdNL : nIdNL = nextId("webNewsletter", "nlId")
                sqlNL = "insert into webNewsletter(NLID,Email, NewsletterName, fromIP, Aktiv, [Timestamp]) values(" & _
                     nIdNL & ",'" & Left(EmailForNewsletter, 255) & "','" & _
                     Left(newsletterItem, 1000) & "','" & Request.ServerVariables("REMOTE_HOST") & "', true, " & SQLNOW(0) & ")"
                objConnectionExecute(sqlNL)
                newsletterRegistriert = True
            Next
   
            If newsletterRegistriert Then
                Response.Write("Vielen Dank für Ihre Registrierung des " & VARVALUE("DOMAIN") & " Newsletters.")
                Response.Write("<p>Wir werden Sie wöchentlich über unsere Neuigkeiten  informieren.</p>")
         
        
                Response.Write("SENDING... ")
                sendMailFromWithSending(EmailForNewsletter, "Ihre Newsletter registrierung bei " & VARVALUE("DOMAIN") & "!", _
                      MAKE_EMAIL_NEWSLETTER(EmailForNewsletter), VARVALUE("EMAIL_REGISTER"))
                Response.Write(" OK!")
            Else 'keine Registrierung 
                Response.Write(getTranslation("Sie haben kein Newsletter ausgewählt! Sie werden kein Newsletter bekommen!"))
            End If
        End If 'Email nicht korrekt 
end function  


    '****************************************************************
    ' registerForNewsletter
    '****************************************************************
    Function unregisterForNewsletter(ByVal EmailForNewsletter)
        If EMailCheck(EmailForNewsletter) Then
            Dim nIdNL : nIdNL = nextId("webNewsletter", "nlId")
            Dim topic : topic = Request("Interest")
            If topic = "" Then topic = "standart"
   
            Dim sqlNL : sqlNL = "DELETE FROM webNewsletter WHERE Email = '" & EmailForNewsletter & "'"
            objConnectionExecute(sqlNL)

            Response.Write("<p>Fertig! <br/> " & _
            " Sie werden keine Newsletters mehr von uns bekommen.<br/>" & _
            " Wollen Sie uns mitteilen warum Sie sich abgemeldet haben? <br/>" & _
            " Schreiben Sie an <a href='mailto:" & varvalue("EMAIL") & "'><" & varvalue("EMAIL") & "</a>" & _
            " </p>")
   
        End If
end function 
</script>

