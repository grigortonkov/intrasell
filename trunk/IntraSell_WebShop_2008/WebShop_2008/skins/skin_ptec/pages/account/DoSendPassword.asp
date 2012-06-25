  <!--#include file="../defaultHead.inc"-->
<HTML>
	<HEAD>
		<TITLE>Lost Password</TITLE>
	</HEAD>
	<link REL="stylesheet" HREF="../../style.css" TYPE="text/css">
		<br />
		<br />
		<br />
		<br />
		<%
		
'ONLY EMAIL IS NEEDED FOR SEND PASS FUNCTIONS		
		
Dim ParamsOK, Name, Email
ParamsOK = FALSE 
Name = trim(Request("Name")) 
Email = trim(Request("Email")) 

'if Len(Name)> 1 AND Len(Name) < 25 AND Len(Email)>5  THEN 
if Len(Email)>5  THEN 'ONLY EMAIL IS NEEDED
 'If IsEmail(Email) THEN  ParamsOK = TRUE  
 ParamsOK = TRUE  
END IF 

     
IF NOT ParamsOK  THEN ' PARAMS ARE NOT OK 
%>
		<h2 align="center"><font face="Arial">Ihre Angaben sind <font color="#ff0000">nicht </font>
				richtig!</font></h2>
		<P align="center">
			<input type="button" onClick='javascript:history.go(-1)' name="Back" value="Back">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" onClick='window.close()' name="close" value="Close">
		</P>
		<%Else

'Line brake
Dim CHR13CHR10
Dim SQLString, rsF

CHR13CHR10 =  CHR(13) & CHR(10)
'MAIL_TEXT_3K_NACHBEARBEITUNG
    SQLString = "SELECT * from ofAdressen Where Email = '" & Email & "'" ' AND Name = '" & Name  & "'"
    Set rsF = objConnectionExecute(SQLString) 
	if rsF.EOF then  ' no such user
	 %>
		<h2 align="center">
			<font face="Arial"></font>Es wurde leider <font color="#ff0000">kein Passwort</font>
			für die angegebene Name und Email gefunden!&nbsp; <font face="Arial"></font>
		</h2>
		<%else
	Dim email_text, subject, recipient
	
    'email_text = "Hallo " & rsF("Name")   & " !" & CHR13CHR10 & CHR13CHR10& _ 
	'			"Da sind die angeforderten Daten. " & _ 
	'			"Fur den Einstieg in " & varvalue("DOMAIN") & " ben&ouml;tigen Sie Ihr Email " & CHR13CHR10& _ 
	'			"und Passwort.  " & CHR13CHR10& _ 
	'			"Ihr Passwort ist: " & rsF("Passwort")  & CHR13CHR10 & CHR13CHR10 & _ 
	'			"Viel Spass dabei!!! " & CHR13CHR10 
				 
    email_text = MAKE_EMAIL_SEND_PASSWORD(rsF("idnr"))

	subject = getTranslation("Ihr Passwort")
    recipient = request("Email")
    if  sendMailFromWithSending ( recipient, subject, email_text, VARVALUE("Email")) then 
%>
		<h2 align="center">Ihr Passwort wurde gesendet!</h2>
		<p align="center">
			<%else %>
			<font color="#ff0000">Ihr Passwort konnte nicht gesendet werden. Versuchen Sie 
				wieder später!</font>
			<%end if %>
		<P align="center">
			<input type="button" onClick='window.close()' name="close" value="Close">
		</P>
		<%
 END IF 
 END IF  
%>
</HTML>
