<script language="VB" runat="server">  
 
    Function MAKE_EMAIL_REGISTRATION(ByVal KDNR)

        Dim Name : Name = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Name")
        Dim Email : Email = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Email")
        Dim Passwort : Passwort = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Passwort")
        Dim html

        'Do not send pwd in clear text 
        Passwort = Left(Passwort, 2) & Left("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", Len(Passwort) - 2)  'hide password 

        html = readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_registration_confirmation.htm"))


        html = Replace(html, "[DOMAIN]", VARVALUE("DOMAIN"))
        html = Replace(html, "[Email]", Email)
        html = Replace(html, "[Passwort]", Passwort)
        html = Replace(html, "[Name]", Name)
        html = Replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
        html = Replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
        'html = replace(html, "[LINK_REGISTRATION]", SESSION("BASENAME") & "/default.aspx?pageToShow=MyAccount")
        html = Replace(html, "[LINK_REGISTRATION]", Session("BASENAME") & "/default.aspx?pageToShow=MyAccount&Email=" & Email & "&Password=" & Passwort)

        Call replaceUserTags(KDNR, html)
        MAKE_EMAIL_REGISTRATION = html
    End Function


    Function MAKE_EMAIL_REGISTRATION_SIMPLE(ByVal KDNR)

        Dim Name : Name = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Name")
        Dim Email : Email = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Email")
        Dim Passwort : Passwort = TABLEVALUE("ofAdressen", "IDNR", KDNR, "Passwort")
        Dim html


        Passwort = Left(Passwort, 2) & Left("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", Len(Passwort) - 2)  'hide password 
        
        html = readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_registration_confirmation_simple.htm"))

        html = Replace(html, "[DOMAIN]", VARVALUE("DOMAIN"))
        html = Replace(html, "[Email]", Email)
        html = Replace(html, "[Passwort]", Passwort)
        html = Replace(html, "[Name]", Name)
        html = Replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
        html = Replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
        html = Replace(html, "[LINK_REGISTRATION]", Session("BASENAME") & "/default.aspx?pageToShow=MyAccount&Email=" & Email & "&Password=" & Passwort)
        html = Replace(html, "[LINK_REGISTRATION_ACTIVATION]", Session("BASENAME") & "/default.aspx?pageToShow=MyAccountActivate&Email=" & Email & "&Password=" & Passwort)

        Call replaceUserTags(KDNR, html)
        MAKE_EMAIL_REGISTRATION_SIMPLE = html
                                         
    End Function


    ''' <summary>
    ''' MAKE_EMAIL_SEND_PASSWORD
    ''' </summary>
    ''' <param name="KDNR"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function MAKE_EMAIL_SEND_PASSWORD(ByVal KDNR)
 
        Dim html As String
        Dim Passwort As String
        Dim Email As String
        
        html = readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_send_password.htm"))
        html = Replace(html, "[DOMAIN]", VARVALUE("DOMAIN"))
        html = Replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
        html = Replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
        html = Replace(html, "[LINK_REGISTRATION]", Session("BASENAME") & "/default.aspx?pageToShow=MyAccount&Email=" & Email & "&Password=" & Passwort)
        html = Replace(html, "[LINK_REGISTRATION_ACTIVATION]", Session("BASENAME") & "/default.aspx?pageToShow=MyAccountActivate&Email=" & Email & "&Password=" & Passwort)

        Call replaceUserTags(KDNR, html)
        
        MAKE_EMAIL_SEND_PASSWORD = html
    End Function

    ''' <summary>
    ''' Make Email Order 
    ''' </summary>
    ''' <param name="KDNR"></param>
    ''' <param name="AuftragNr"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function MAKE_EMAIL_ORDER(ByVal KDNR, ByVal AuftragNr)
        Const TAG_EMBED_ORDER As String = "[EMBED_ORDER]"
        Dim html As String
        
        'reads from root folder 
        html = readTextFile(Server.MapPath("/skins/skin" & SkinNumber & "/emails/email_order_confirmation.htm"))
        
        html = Replace(html, "[AuftragNr]", AuftragNr)
        html = Replace(html, "[LINK_ORDER]", Session("BASENAME") & "/default.aspx?pageToShow=MyAccount")
        html = Replace(html, "[FIRMA_EMAIL_SALE]", VARVALUE("EMAIL_SALE"))
        html = Replace(html, "[FIRMA_TEL]", VARVALUE("TEL"))
        'get the last object inserted 
        
        '[OBJECT_VIEW]
        Dim rsLO
        Dim sqlLO As String : sqlLO = "select max(ArtNr) as lO from [buchAuftrag-Artikel] where RechNr=" & AuftragNr
        rsLO = ObjConnectionExecute(sqlLO)
        If Not rsLO.eof Then
            Dim filenameForTemplate : filenameForTemplate = "productPage_OrderConfirmation.htm"
            Dim maxArt : maxArt = rsLO("lo").Value
            If (maxArt) Is Nothing Or IsDBNull(maxArt) Then maxArt = "-1"
            Dim objectHTML : objectHTML = makeProductPageWithTemplate(maxArt, readTextFile(Server.MapPath(filenameForTemplate)))
            html = Replace(html, "[OBJECT_VIEW]", objectHTML)
        End If
        rsLO.close()

        '[LINK_ORDER_DIRECT]
        Dim realOrderLink : realOrderLink = Session("BASENAME") & "/cgi/account/printPreviewOrder.aspx?kdnr=" & KDNR & "&nummer=" & AuftragNr & "&OrderType=AU"
        html = Replace(html, "[LINK_ORDER_DIRECT]", realOrderLink)

        If showDebug() Then
            Response.Write("realOrderLink=" & realOrderLink)
        End If

        'IF NOT RTF ORDER PRINTING , try to embed the order
        If Not LCase(VARVALUE_DEFAULT("SHOP_USE_RTF_ORDER_PRINT", "true")) = "true" Then
            '[EMBED_ORDER] - embeds the html for the order directly to the mail 
            If InStr(html, TAG_EMBED_ORDER) > 0 Then 'required 
                'try create the object 
                Dim httpReader
                httpReader = Server.CreateObject("Tonkov.aspHttp")
                Dim orderHTML : orderHTML = httpReader.getURL(realOrderLink)
                html = Replace(html, TAG_EMBED_ORDER, orderHTML)
            End If
        Else
            html = Replace(html, TAG_EMBED_ORDER, realOrderLink)
        End If
         
        Call replaceUserTags(KDNR, html)
        MAKE_EMAIL_ORDER = html
    End Function

    ''' <summary>
    ''' MAKE_EMAIL_TELL_A_FRIEND
    ''' </summary>
    ''' <param name="ProductURL"></param>
    ''' <param name="BodyMail"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function MAKE_EMAIL_TELL_A_FRIEND(ByVal ProductURL, ByVal BodyMail)
        Dim html
        Dim name : name = Request("ToName")
        Dim artNr : artNr = Request("ArtNr")

        html = BodyMail 'readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/emails/email_send_a_friend.htm"))
    
        html = Replace(html, "[Name]", name)
        html = Replace(html, "[User text]", BodyMail)
        html = Replace(html, "[ProductURL]", ProductURL)
        html = Replace(html, "[FromMail]", Request("FromMail"))
        html = Replace(html, "[UserText]", Request("UserText"))
    
        html = makeProductPageWithTemplate(artNr, html)
    
        MAKE_EMAIL_TELL_A_FRIEND = html

        Exit Function

        MAKE_EMAIL_TELL_A_FRIEND = "HI!" & Chr(10) & Chr(13) & _
          "This e-mail was sent via " & VARVALUE("DOMAIN") & " e-mail notification by request from your friend to " & _
          "infrom you about our greatest product list. Check your friend suggestion at: " & _
           Chr(10) & Chr(13) & _
           ProductURL & _
           Chr(10) & Chr(13) & _
           Chr(10) & Chr(13) & _
           BodyMail
             
        MAKE_EMAIL_TELL_A_FRIEND = BodyMail
         
    End Function
         
    ''' <summary>
    ''' MAKE_EMAIL_NEWSLETTER
    ''' </summary>
    ''' <param name="Email"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function MAKE_EMAIL_NEWSLETTER(ByVal Email)
        MAKE_EMAIL_NEWSLETTER = " Liebe(r)  Benutzer(in)!" & Chr(10) & Chr(13) & _
        " Vielen Dank f&uuml;r Ihre Registrierung des " & VARVALUE("DOMAIN") & " Newsletters." & Chr(10) & Chr(13) & _
        " Sie haben sich am " & Now & " von der IP Adresse " & Request.ServerVariables("REMOTE_HOST") & Chr(10) & Chr(13) & _
        " f&uuml;r unseren Newsletter angemeldet." & Chr(10) & Chr(13) & Chr(10) & Chr(13) & _
        " Regelm&auml;ßig werden Sie &uuml;ber Produkte, Angebote, Gewinnspiele, Vorteile uvm informiert." & Chr(10) & Chr(13) & Chr(10) & Chr(13) & _
        " " & Chr(10) & Chr(13) & _
        " Viel Spass w&uuml;nscht Ihnen" & Chr(10) & Chr(13) & Chr(10) & Chr(13) & _
        " Ihr Team"
    End Function
     
    '
    ''' <summary>
    ''' replaces user tags as [Name] [Email] in the emailtext 
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <param name="html"></param>
    ''' <remarks></remarks>
    Sub replaceUserTags(ByVal idnr, ByRef html)
        Dim kdnr : kdnr = idnr
        Dim Firma As String : Firma = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Firma")
        Dim Name As String : Name = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Name")
        Dim Vorname As String : Vorname = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Vorname")
        Dim Anrede As String : Anrede = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Anrede")
        Dim Titel As String : Titel = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Titel")
        Dim Email As String : Email = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Email")
        Dim Passwort As String : Passwort = TABLEVALUE("ofAdressen", "IDNR", kdnr, "Passwort")
        Dim Begruessung As String : Begruessung = "geehrter" : If LCase(Anrede) <> "herr" Then Begruessung = "geehrte"


        html = Replace(html, "[Email]", Email & "")
        html = Replace(html, "[Passwort]", Passwort & "")
        
        html = Replace(html, "[Firma]", Firma & "")
        html = Replace(html, "[Name]", Name & "")
        html = Replace(html, "[Nachname]", Name & "")
        html = Replace(html, "[Vorname]", Vorname & "")
        
        html = Replace(html, "[Begruessung]", Begruessung & "")
        html = Replace(html, "[Anrede]", Anrede & "")
        html = Replace(html, "[Titel]", Titel & "")
        
        html = parseTemplateUserIDNR(idnr, html)
    End Sub

    '==============================================================================
    'Description: creates an email from emails template and sends it! 
    'Parameters
    'mailname - filename of file in scins 
    'optional - idnr - if provided the mailtext will be saved in ofKorrespondenz
    '==============================================================================
    Public Function prepareAndSendEmail(ByVal mailname, ByVal subject, ByVal idnr)
        Dim mailtext : mailtext = readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/emails/" & mailname))
        Dim EmailAnbieter : EmailAnbieter = firstValue("select Email from ofAdressen where idnr = " & idnr)
        Dim addFormElements, singleFormElement
        addFormElements = ""
          
        For Each singleFormElement In Request.Form
            If Request.Form(singleFormElement) <> "" Then
                addFormElements = addFormElements & singleFormElement & " = " & Request.Form(singleFormElement) & "<br>"
               
            End If
            mailtext = Replace(mailtext, "[" & singleFormElement & "]", Request.Form(singleFormElement))
        Next

        For Each singleFormElement In Request.QueryString
            If Request(Request.QueryString(singleFormElement)) Then
                addFormElements = addFormElements & singleFormElement & " = " & Request.QueryString(singleFormElement) & "<br>"
            End If
            mailtext = Replace(mailtext, "[" & singleFormElement & "]", Request.QueryString(singleFormElement))
        Next
          
        'mailtext = mailtext + "<hr>" & addFormElements       
     
        Call replaceUserTags(idnr, mailtext)

        'response.Write "artNrAnfrage=" & artNrAnfrage
        If LCase(Request("debug")) = "true" Then
            Response.Write("Emailtext:<hr/>" & mailtext & "<hr/>")
            Response.Write("All Form elements<br>" & addFormElements)
        End If

        'TODO: save this for the statistics 
        Dim sqlK
        sqlK = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & _
         idnr & ",'" & subject & "','" & Replace(mailtext, "'", "") & "')"

        objConnectionExecute(sqlK)
               
        If sendMailFromWithSending(EmailAnbieter, subject, mailtext, varvalue("EMAIL")) Then
            Response.Write("<font color=""green"">Ihre Anfrage wurde erfolgreich abgesendet!</font>")
        Else
            Response.Write("<font color=""red"">Das Email konnte nicht versendet werden!</font>")
        End If
        'send to webmaster too 
        Call sendMailFromWithSending(varvalue("EMAIL"), subject, mailtext, varvalue("EMAIL"))
        
    End Function
</script>

