<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================



'****************************************************************
' registerForNewsletter
' EmailForNewsletter = Email of requestor
' Newslettername = request("Interest") - that means can be collection of objects 
'****************************************************************
function registerForNewsletter(byVal EmailForNewsletter, byVal NewsletterName)  
 if EMailCheck(EmailForNewsletter) then 
   'delete first all old newsletter 
   Dim sqlNL: sqlNL= "delete from webNewsletter where Email like '" & left(EmailForNewsletter,255)  & "'"
   objConnectionExecute(sqlNL)
   Dim newsletterRegistriert: newsletterRegistriert = false 
   Dim newsletterItem: newsletterItem = ""
   
   response.Write "Ihre Anmeldung für Newsletter [" + NewsletterName & "]: <br/>"
   'response.end
   for each newsletterItem in Split(NewsletterName, ",")
        Dim nIdNL: nIdNL  = nextId("webNewsletter","nlId")
		sqlNL= "insert into webNewsletter(NLID,Email, NewsletterName, fromIP, Aktiv, [Timestamp]) values(" & _ 
							nIdNL    & ",'" & left(EmailForNewsletter,255)  & "','" & _ 
							left(newsletterItem,1000) & "','" & Request.ServerVariables("REMOTE_HOST") & "', true, " & SQLNOW(0) & ")"
		objConnectionExecute(sqlNL)
		newsletterRegistriert = true 
   next 
   
   if newsletterRegistriert then 
		%>
		Vielen Dank für Ihre Registrierung des <%=VARVALUE("DOMAIN")%> Newsletters.
		<p>Wir werden Sie wöchentlich über unsere Neuigkeiten  informieren.</p>
		<% 
		
			response.write "SENDING... "								
			sendMailFromWithSending EmailForNewsletter,  "Ihre Newsletter registrierung bei " & VARVALUE("DOMAIN") & "!", _ 
									MAKE_EMAIL_NEWSLETTER(EmailForNewsletter) , VARVALUE("EMAIL_REGISTER")
			response.write " OK!"
	else 'keine Registrierung 
		response.Write getTranslation("Sie haben kein Newsletter ausgewählt! Sie werden kein Newsletter bekommen!")
    end if 
  end if 'Email nicht korrekt 
end function  


'****************************************************************
' registerForNewsletter
'****************************************************************
function unregisterForNewsletter(EmailForNewsletter )  
 if EMailCheck(EmailForNewsletter) then 
   Dim nIdNL : nIdNL  = nextId("webNewsletter","nlId")
   Dim topic: topic = request("Interest")
   if topic = "" then topic = "standart"
   
   dim sqlNL: sqlNL= "DELETE FROM webNewsletter WHERE Email = '" & EmailForNewsletter  & "'"
   objConnectionExecute(sqlNL)

  %>
<p>
Fertig! <br/>
Sie werden keine Newsletters mehr von uns bekommen.<br/>
Wollen Sie uns mitteilen warum Sie sich abgemeldet haben? <br/>
Schreiben Sie an <a href="mailto:<%=varvalue("EMAIL")%>"><%=varvalue("EMAIL")%></a>
</p>
  <% 
  end if 
end function 
%>