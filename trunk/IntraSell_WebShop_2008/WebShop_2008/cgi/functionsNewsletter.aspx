<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: Written and edited by Grigor Tonkov 2001 (R)
    ' See www.griton.eu for last changes. 
    '===========================================================================

    '****************************************************************
    ' registerForNewsletter
    ' EmailForNewsletter = Email of requestor
    ' Newslettername = request("Interest") - that means can be collection of objects 
    '****************************************************************
    Sub registerForNewsletter(ByVal EmailForNewsletter As String, ByVal NewsletterName As String)
        If EMailCheck(EmailForNewsletter) Then
            'delete first all old newsletter 
            Dim sqlNL As String = "delete from webNewsletter where Email like '" & Left(EmailForNewsletter, 255) & "'"
            objConnectionExecute(sqlNL)
            Dim newsletterRegistriert : newsletterRegistriert = False
            Dim newsletterItem : newsletterItem = ""
   
            Response.Write("Ihre Anmeldung f�r Newsletter [" + NewsletterName & "]: <br/>")
            'response.end
            For Each newsletterItem In Split(NewsletterName, ",")
                Dim nIdNL As Long = nextId("webNewsletter", "nlId")
                sqlNL = "insert into webNewsletter(NLID,Email, NewsletterName, fromIP, Aktiv, [Timestamp]) values(" & _
                     nIdNL & ",'" & Left(EmailForNewsletter, 255) & "','" & _
                     Left(newsletterItem, 1000) & "','" & Request.ServerVariables("REMOTE_HOST") & "', false, " & SQLNOW(0) & ")"
                objConnectionExecute(sqlNL)
                newsletterRegistriert = True
            Next
   
            If newsletterRegistriert Then
                Dim body As String = MAKE_EMAIL_NEWSLETTER(EmailForNewsletter)
                
                Response.Write("Vielen Dank f�r Ihre Registrierung. Zum Abschlie�en klicken Sie bitte auf den Best�tigungslink in der Email, die wir Ihnen gerade gesendet haben.")
                'Response.Write("Vielen Dank f�r Ihre Registrierung des " & VARVALUE("DOMAIN") & " Newsletters.")
                'Response.Write("<p>Wir werden Sie w�chentlich �ber unsere Neuigkeiten informieren.</p>")
         
                'Response.Write(body)
        
                Response.Write("SENDING... ")
                sendMailFromWithSending(EmailForNewsletter, "Ihre Newsletter registrierung bei " & VARVALUE("DOMAIN"), _
                      body, VARVALUE("EMAIL_REGISTER"))
                Response.Write(" OK!")
            Else 'keine Registrierung 
                Response.Write(getTranslation("Sie haben kein Newsletter ausgew�hlt. Sie werden kein Newsletter bekommen!"))
            End If
        End If 'Email nicht korrekt 
    End Sub


    '****************************************************************
    Sub registerForNewsletterStep2Confirm(ByVal EmailForNewsletter As String)
        If EMailCheck(EmailForNewsletter) Then
            'update newsletter table 
            Dim sqlNL As String = "update webNewsletter set aktiv=true where Email like '" & Left(EmailForNewsletter, 255) & "'"
            objConnectionExecute(sqlNL)
            
  
            Response.Write("Vielen Dank f�r Best�tigung des " & VARVALUE("DOMAIN") & " Newsletters.")
            Response.Write("<p>Wir werden Sie w�chentlich �ber unsere Neuigkeiten informieren.</p>")
        Else
            Response.Write("<p>Die angegeben Emailadresse ist ung�ltig.</p>")
        End If 'Email nicht korrekt 
    End Sub
    
    '****************************************************************
    ' registerForNewsletter
    '****************************************************************
    Function unregisterForNewsletter(ByVal EmailForNewsletter As String) As Boolean
        If EMailCheck(EmailForNewsletter) Then
            Dim nIdNL As Long = nextId("webNewsletter", "nlId")
            Dim topic As String = Request("Interest")
            If topic = "" Then topic = "standart"

            Dim sqlNL As String = "DELETE FROM webNewsletter WHERE Email = '" & EmailForNewsletter & "'"
            objConnectionExecute(sqlNL)

            Response.Write("<p>Vielen Dank! <br/> " & _
            " Sie werden keine Newsletters mehr von uns bekommen.<br/>" & _
            " Wollen Sie uns mitteilen warum Sie sich abgemeldet haben? <br/>" & _
            " Schreiben Sie uns an <a href='mailto:" & varvalue_default("EMAIL", "office@griton.eu") & "'>" & varvalue_default("EMAIL", "office@griton.eu") & "</a>" & _
            " </p>")
            Return True
        Else
            Response.Write(String.Format("<p>{0} ist keine g�ltige Emailadresse!</p>", EmailForNewsletter))
            Return False
        End If
    End Function

</script>
