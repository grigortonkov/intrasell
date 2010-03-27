<!--#include file="../defaultHead.inc.aspx"-->
<%
    Dim ParamsOK, Name, Email
    ParamsOK = False

    Name = cleanUserInput(Request("Name"))
    Email = cleanUserInput(Request("Email"))



    'Line brake
    CHR13CHR10 = Chr(13) & Chr(10)

    'MAIL_TEXT_3K_NACHBEARBEITUNG
FUNCTION MAIL_LOST_PASSWORD(Person_Id)
     Dim SQLString, EMAILTEXT. rs
    SQLString = " SELECT Personen.*, Kunden.Passwort " & _
                " FROM Personen INNER JOIN Kunden ON Personen.Person_Id = Kunden.Person_id " & _
                " WHERE PERSONEN.Person_Id = Kunden.Person_Id AND  Personen.Person_Id=" & Person_Id

    rs = objConnectionExecute(SQLString)



   EMAILTEXT = "Hallo " & rs.fields("Name")   & " !" & CHR13CHR10 & CHR13CHR10& _ 
    "Da sind die angeforderten Daten. " & _ 
    "F&uuml;r den Einstieg in http://www.date-for-you.com  ben&ouml;tigen Sie Ihre Profil Nr. " & CHR13CHR10& _ 
    "und Passwort.  " & CHR13CHR10& _ 
    "Ihre Profil Nr. lautet: " & rs.fields("Person_Id")   & CHR13CHR10& _ 
    "Ihr Passwort ist: " & rs.fields("Passwort")  & CHR13CHR10 & CHR13CHR10 & _ 
    "Viel Spass dabei!!! " & CHR13CHR10& _ 
    "Evelyn  " 


    MAIL_LOST_PASSWORD = EMAILTEXT
End Function





%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=windows-1252">
    <title>Lost Password</title>
    <link rel="stylesheet" href="../../style.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" text="#000080" link="#000000" alink="#000000" vlink="#000000"
    background="../../resources/Hintergrund.jpg">
    <h2>
        &nbsp;</h2>
    <h2>
        &nbsp;</h2>
    <h2>
        &nbsp;</h2>
    <%

if Len(NAme)> 1 AND Len(NAme) < 20 AND Len(Email)>5  THEN 
 If IsEmail(Email) THEN  ParamsOK = TRUE  
END IF 

     
 IF NOT ParamsOK  THEN ' PARAMS ARE NOT OK 

    %>
    <h2 align="center">
        <font face="Arial">
            <img border="0" src="../../resources/heart_normal.GIF" width="20" height="17">
            Ihre Angaben sind <font color="#FF0000">nicht </font>richtig!<img border="0" src="../../resources/heart_normal.GIF"
                width="20" height="17"></font></h2>
    <%    
 END IF 
      
 IF  ParamsOK  THEN 
        ' IN Spammails speichern
     	SQLString = " SELECT Personen.Person_ID, Passwort, Name, Email " & _ 
     				  " FROM  Personen, Kunden " & _ 
     				  " WHERE Kunden.Person_Id = Personen.Person_ID " & _ 
     				  " AND EMail = '" & Email & "'" & _ 
     				  " AND Name = '" & Name & "'"
     				   
     	Set rs_pass = objConnectionExecute(SQLString) 
     
 IF rs_pass.EOF THEN 
    %>
    <h2 align="center">
        <font face="Arial">
            <img border="0" src="../../resources/heart_normal.GIF" width="20" height="17"></font>Es
        wurde leider <font color="#FF0000">kein Passwort</font> f&uuml;r die angegebene
        Name und Email gefunden! <font face="Arial">
            <img border="0" src="../../resources/heart_normal.GIF" width="20" height="17"></font>
    </h2>
    <%
 ELSE      
	   email_text = MAIL_LOST_PASSWORD(rs_pass("Person_ID"))
       subject = "Ihr Passwort"
     	email_sender = VARVALUE("OFFICEEmail")
     	recipient = rs_pass("Email")
     	
        'Response.write email_text
     	
    	response.write "SENDING... "
        'sendMailFrom recipient, subject, email_text, email_sender
     	response.write " OK!"
		
		rs_pass.close 
    %>
    <h2 align="center">
        <font face="Arial">
            <img border="0" src="../../resources/heart_normal.GIF" width="20" height="17">Ihr
            Passwort wurde gesendet!<img border="0" src="../../resources/heart_normal.GIF" width="20"
                height="17"></font></h2>
    <%
 END IF 
 END IF  
    %>
</body>
