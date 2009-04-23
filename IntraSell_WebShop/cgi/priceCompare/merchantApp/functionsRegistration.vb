Module functionsRegistration
    Sub sendRegEmail(ByVal subject, ByVal mailText)
        Dim msgMail As System.Web.Mail.MailMessage
        msgMail = New System.Web.Mail.MailMessage()
        msgMail.To = "office@vegsys.com"
        msgMail.Cc = ""
        msgMail.From = "webmaster@smartefox.at"
        msgMail.Subject = subject
        msgMail.BodyFormat = System.Web.Mail.MailFormat.Html
        msgMail.Body = mailText
        System.Web.Mail.SmtpMail.SmtpServer = "smtp.smartefox.com"
        System.Web.Mail.SmtpMail.Send(msgMail)
        'Response.Write("Email was send!")
    End Sub

End Module
