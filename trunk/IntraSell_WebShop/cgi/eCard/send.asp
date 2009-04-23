<%

GERMAN = varvalue("LANGUAGE") <> "ENG"  
ENGLISH = NOT GERMAN
 
'Dim SQL, RS
Dim LoveCard_ID

FromName = Request("FromName")
FromEmail = Request("FromEmail")
ToName = Request("ToName")
ToEmail = Request("ToEmail")
LoveText = Request("LoveText")
CardName=  Request("CardName")

Dim nextCardId: nextCardId = nextId("webCards","LoveCard_Id")

SQL = "INSERT INTO webCards (LoveCard_Id, FromName,FromEmail, ToName, ToEmail, LoveText, CardName, DateFrom)" & _ 
      "VALUES(" & nextCardId & ",'"& FromName &"','"& FromEmail &"','"& ToName &"','"& ToEmail &"','"& LoveText &"','"& _ 
        CardName &"'," & SQLNOW(0) & ")"

'response.write SQL

 Set rs = objConnectionExecute(SQL)

'GET THE CARD ID 
 SQL = "SELECT * FROM webCards ORDER BY LoveCard_Id DESC"
 Set rs = objConnectionExecute(SQL)
 
LoveCard_Id = rs("LoveCard_Id") 

 IF GERMAN THEN 
MailText = "Hallo " & ToName & "!" & CHR(13) & CHR(10) & _ 
       FromName & " hat Ihnen gerade eine e-card geschickt." & CHR(13) & CHR(10) & _ 
       "Klicken sie hier an um Ihr e-card anzusehen!" & CHR(13) & CHR(10) & _ 
       BASENAME & "/default.asp?pageToShow=EcardView&LoveCard_Id=" & LoveCard_Id & "&ToName=" & ToName & "&ToEmail=" &  ToEmail & _ 
       CHR(13) & CHR(10) & _ 
       "Liebe Gr&uuml;sse "  & CHR(13) & CHR(10) & _ 
       VARVALUE("FIRMA")
  END IF 
  
 IF ENGLISH THEN 
MailText = "Hello " & ToName & "!" & CHR(13) & CHR(10) & _ 
       FromName & " sent you an e-card." & CHR(13) & CHR(10) & _ 
       "Click herw to see your e-card!" & CHR(13) & CHR(10) & _ 
       BASENAME & "/default.asp?pageToShow=EcardView&LoveCard_Id=" & LoveCard_Id & "&ToName=" & ToName & "&ToEmail=" &  ToEmail & _ 
       CHR(13) & CHR(10) & _ 
       "with kind regards"  & CHR(13) & CHR(10) & _ 
      VARVALUE("FIRMA")
  END IF 
  
     
     	response.write "<center>SENDING... "
     	

     	
     	FromEmail = VARVALUE("Email")
on error resume next 
     	sendMailFromWithSending ToEmail, "e-card fuer " + ToName , MailText, FromEmail
     if err.number	> 0 then 
			response.write " <font color=red>Error when seind you card </font></center>"
     else 
     		response.write " OK!</center>"
     end if 
     
     
     



%>
<%IF GERMAN THEN%>
<h1 align="center">Absenden</h1>
<p align="center">
	Die Karte wurde mit dem folgenden Text gesendet:
	<div align="center">
		<center>
			<table border="1" width="399">
				<tr>
					<td width="389">
						<p align="center">
							<textarea rows="11" cols="64"><%=MailText%></textarea></p>
					</td>
				</tr>
			</table>
		</center>
	</div>
<p align="center">Senden Sie eine andere Karte: <A href="default.asp?PageToShow=Ecard">e-card</A></p>
<%END IF%>
<%IF ENGLISH THEN%>
<h1 align="center">Send</h1>
<p align="center">
	Your card was send with the following text:
	<div align="center">
		<center>
			<table border="1" width="399">
				<tr>
					<td width="389">
						<p align="center"><textarea rows="11" cols="64" ID="Textarea1" NAME="Textarea1"><%=MailText%></textarea></p>
					</td>
				</tr>
			</table>
		</center>
	</div>
<p align="center">
	Send another&nbsp;card: <A href="default.asp?PageToShow=Ecard">e-card</A></p>
<%END IF%>
