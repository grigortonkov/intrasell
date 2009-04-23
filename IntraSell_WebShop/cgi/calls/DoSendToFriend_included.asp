
<%
if Request ("ToMail") = "" or Request ("Subject")= "" or Request("FromMail") = "" then 
        Response.write getTranslation("Sie müssen alle Felder mit * befüllen!")
else      
		Dim body: body = MAKE_EMAIL_TELL_A_FRIEND(request("ProductURL"), Request ("BodyMail"))		 
		if sendMailFromWithSending (Request ("ToMail"), Request ("Subject") , body, Request("FromMail")) then 
		     call addUserPoints(getLOGIN(), COUNT_POINTS_SEND_TO_FRIEND, REASON_SEND_TO_FRIEND) 
		'Response.write (body)
		%>
		<h3><%=getTranslation("Ihre Nachricht wurde erfolgreich versendet")%> Email: <%=Request ("ToMail")%></h3>
		<%end if
 end if %>
 <br><br>
 <a href="<%=request("ProductURL")%>"><%=getTranslation("Zurück zur Produktseite")%></a>
 