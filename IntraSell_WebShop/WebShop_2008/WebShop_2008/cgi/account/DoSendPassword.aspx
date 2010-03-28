<!--#include file="../defaultHead.inc"-->
<html>
<head>
    <title>Lost Password</title>
</head>
<body width="300">
    <br>
    <br>
    <br>
    <br>
    <%
        
        'ONLY EMAIL IS NEEDED FOR SEND PASS FUNCTIONS        
        
        Dim ParamsOK, Name, Email
        ParamsOK = False
        Name = Trim(Request("Name"))
        Email = Trim(Request("Email"))

        'if Len(Name)> 1 AND Len(Name) < 25 AND Len(Email)>5  THEN 
        If Len(Email) > 5 Then 'ONLY EMAIL IS NEEDED
            'If CheckEmail(Email) THEN  ParamsOK = TRUE  
            ParamsOK = True
        End If

     
        If Not ParamsOK Then ' PARAMS ARE NOT OK 
    %>
    <h2 align="center">
        <font face="Arial">
            <%=getTranslation("Ihre Angaben sind nicht richtig!")%></font></h2>
    <p align="center">
        <input type="button" onclick="javascript:history.go(-1)" name="Back" value="Back">&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" onclick="window.close()" name="close" value="Close"></p>
    <%  Else

            'Line brake
            Dim CHR13CHR10
            Dim SQLString, rsF

            CHR13CHR10 = Chr(13) & Chr(10)
            'MAIL_TEXT_3K_NACHBEARBEITUNG
            SQLString = "SELECT * from ofAdressen Where Email = '" & Email & "'" ' AND Name = '" & Name  & "'"
            rsF = objConnectionExecute(SQLString)
            If rsF.EOF Then  ' no such user
    %>
    <h2 align="center">
        <%=getTranslation("Es wurde leider kein Passwort für die angegebene Name und Email gefunden!")%></h2>
    <%  Else
            Dim email_text, subject, recipient
    
            'email_text = "Hallo " & rsF("Name")   & " !" & CHR13CHR10 & CHR13CHR10& _ 
            '            "Da sind die angeforderten Daten. " & _ 
            '            "Fur den Einstieg in " & varvalue("DOMAIN") & " ben&ouml;tigen Sie Ihr Email " & CHR13CHR10& _ 
            '            "und Passwort.  " & CHR13CHR10& _ 
            '            "Ihr Passwort ist: " & rsF("Passwort")  & CHR13CHR10 & CHR13CHR10 & _ 
            '            "Viel Spass dabei!!! " & CHR13CHR10 
                 
            email_text = MAKE_EMAIL_SEND_PASSWORD(rsF("idnr").Value)

            subject = getTranslation("Ihr Passwort")
            recipient = Request("Email")
            If sendMailFromWithSending(recipient, subject, email_text, VARVALUE("Email")) Then
    %>
    <h2 align="center">
        <%=getTranslation("Ihr Passwort wurde gesendet!")%></h2>
    <p align="center">
        <%Else%>
        <font color="#ff0000">
            <%=getTranslation("Ihr Passwort konnte nicht gesendet werden. Versuchen Sie wieder später!")%></font>
        <%End If%>
        <p align="center">
            <input type="button" onclick="window.close()" name="close" value="Close"></p>
        <%
        End If
    End If
        %>
</body>
</html>
