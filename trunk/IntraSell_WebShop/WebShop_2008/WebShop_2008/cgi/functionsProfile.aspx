<script language="VB" runat="server">  
    '===========================================================================
    ' Autor: written and edited by Grigor Tonkov 2001-2010 (R)
    ' See intrasoft.soft-ware.de for last changes. 
    '===========================================================================
    
    Public Class TypeOfAddress
    
        Public Const ACCOUNT As String = "AD"
        Public Const SHIPPING As String = "LI"
        Public Const INVOICE As String = "AR"
        Public Const INVOICE2 As String = "AR2" 'Backup
        Public Const SHIPPING2 As String = "LI2" 'Backup 
 
    End Class

    
    Const PASSWORD_LENGTH As Integer = 6
    Const STATE_NOT_CONFIRMED_CLIENT As String = "Neu"
    Const IDNR_TAG As String = "IDNR"

    ''' <summary>
    ''' isLoggedIn
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function isLoggedIn() As Boolean
        isLoggedIn = False
        If IsNumeric(getLOGIN()) Then
            If getLOGIN() > 0 Then
                isLoggedIn = True
            End If
        End If
    End Function
     
    
    ''' <summary>
    ' AUTHENITFICATION
    ' Sets the session vars LOG_IN and LAND
    ' returns the IDNR of client if auth okay
    ' returns "" if not ok 
    ''' </summary>
    ''' <param name="Email"></param>
    ''' <param name="Password"></param>
    ''' <returns>KDNR or -1 if wrong</returns>
    ''' <remarks></remarks>
    Function authenticate(ByVal Email As String, ByVal Password As String) As Object
        Dim SQL As String
        'Find Client 
        Email = Trim(Left(Email, 50))
        Password = Trim(Left(Password, 16))
        SQL = "SELECT * from ofAdressen Where Status<>'" & STATE_NOT_CONFIRMED_CLIENT & "' and Email Like '" & Email & "' AND Passwort Like '" & Password & "'"
        'response.write "<br />" & sql
        Dim rsP = objConnectionExecute(SQL)
        If rsP.EOF Then
            'check if user has an unlocked account 
            SQL = "SELECT * from ofAdressen Where Status='" & STATE_NOT_CONFIRMED_CLIENT & "' and Email Like '" & Email & "' AND Passwort Like '" & Password & "'"
        
            rsP = objConnectionExecute(SQL)
            Dim LoginError As String
        
            If rsP.EOF Then
                LoginError = getTranslation("Das Passwort oder der Name stimmt nicht!")
            Else 'has unlocked account 
                LoginError = getTranslation("Ihr Account ist noch NICHT nicht freigeschalten!") & "<br />" & _
                             getTranslation("Bitte zuerst den Link (in Ihrem Emailprogramm) anklicken fuer Account Aktivierung und dann Anmelden probieren!") & "<br />" & _
                             getTranslation("Wir haben Ihnen gerade Email für Accountaktivierung gesendet!") & "<br />" & _
                             getTranslation("Die Email wurde an: ") & getClientEmail(rsP("idnr").Value) & " " & getTranslation("gesendet!")
                'resend Email with confirmation 
                            
                sendMailFromWithSending(getClientEmail(rsP("idnr").Value), _
                     "Ihre Registrierung bei " & VARVALUE("DOMAIN") & "!", _
                  MAKE_EMAIL_REGISTRATION_SIMPLE(rsP("idnr").Value), _
                  VARVALUE("EMAIL_REGISTER"))

            End If
            authenticate = -1
            Response.Write("<LoginError>" & LoginError & "</LoginError>")
            Response.Write("Sorry! <font color=""#FF0000"">" & LoginError & "</font>" & _
         "<br /><font color=black>" & getTranslation("Benutzen Sie unbedingt die 'Zurueck' Schaltflaeche um Ihre Eingaben nicht zu verlieren!") & "</font>" & _
         "<br /> <a href='javascript:window.back()'>" & getTranslation("Zurueck") & "</a>")
                
            Exit Function
                
        End If
        authenticate = rsP("IDNR").Value
        Session("LOG_IN") = authenticate
        'Session("LAND") = getClientLand(authenticate) 
        Session("LAND") = getClientDestinationLand(authenticate)
        'update session
        SQL = "update webSessions set kundenIdnr=" & rsP("IDNR").Value & " where SID=" & getSid()
        objConnectionExecute(SQL)
        Response.Write("<!--<" & IDNR_TAG & ">" & rsP("IDNR").Value & "</" & IDNR_TAG & ">-->") 'write this out for services parcing 
        rsP.close()
    End Function




    ''' <summary>
    '**********************************************************************************
    ' Save User Profile to the DB 
    ' returns the number of the saved ofaddressen
    ' typeOfAddress - (1)main adress, (2)shipping address, (3)invoice address
    ' showForm - the requester can accuire form or not 
    ' createBackUpAddress - the updated address will bew backed up for later use in basket for example.
    '**********************************************************************************
    ''' </summary>
    ''' <param name="typeOfAddress"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function saveProfile(ByVal typeOfAddr As String, Optional ByVal createBackUpAddress As Boolean = False) As Long
        Dim showForm As Boolean : If LCase(Request("showForm") = "false") Then showForm = False Else showForm = True
        'response.write "Saving address...type:" & typeOfAddress
        saveProfile = 0
        Dim tableName As String : tableName = "ofAdressen"
        Dim html As String
        
        If typeOfAddr <> TypeOfAddress.ACCOUNT Then tableName = "[ofAdressen-Weitere]"

        Dim rsPLZORT, sql As String, rs
        Dim Anrede As String, Titel As String, Firma As String, Vorname As String, Name As String, Strasse As String, PLZ As String, Ort As String
        Dim Email As String, Tel As String, Passwort As String, PasswortII As String, Land As String, TelII As String
        Dim Geburtstag
        Dim Mobil As String, Fax As String, Web As String, Branche As String
        Dim IchWillNewsletter
        Dim UID As String

        Firma = Request("Firma" & typeOfAddr) : If Trim(Firma) = "" Then Firma = " "
        Name = Request("Name" & typeOfAddr)
        Vorname = Request("Vorname" & typeOfAddr)
        Anrede = Request("Anrede" & typeOfAddr)
        Titel = Request("Titel" & typeOfAddr)
        Strasse = Request("Strasse" & typeOfAddr)
        PLZ = Request("PLZ" & typeOfAddr) : PLZ = Left(PLZ, 26)
        Ort = Request("Ort" & typeOfAddr)
        Email = Request("Email" & typeOfAddr)
        Tel = Request("Tel" & typeOfAddr)

        Mobil = Request("Mobil" & typeOfAddr)
        Fax = Request("Fax" & typeOfAddr)
        Web = Request("Web" & typeOfAddr)
        TelII = Request("TelII" & typeOfAddr) : If TelII = "" Then TelII = "x"

        Passwort = Request("Passwort" & typeOfAddr)
        PasswortII = Request("PasswortII" & typeOfAddr)

        Land = Request("land" & typeOfAddr) : If Len(Land) = 0 Then Land = varvalue("DEFAULT_LAND_NR")
        Geburtstag = Request("Geburtstag" & typeOfAddr) : If Len(Geburtstag) <> 10 Then Geburtstag = "01.01.1900"
        Branche = Request("Branche" & typeOfAddr) : If Not IsNumeric(Branche) Then Branche = 0
        IchWillNewsletter = Request("IchWillNewsletter" & typeOfAddr)
        UID = Request("UID" & typeOfAddr)


        'make log entry 
        Dim logLine As String = Email & "; " & Vorname & " " & Name & "; " & PLZ & "-" & Ort
        Call writeLog("saveProfile.log", logLine)
        If typeOfAddr = TypeOfAddress.SHIPPING Or typeOfAddr = TypeOfAddress.INVOICE Then
            If Email = "" Then Email = "x"
            If Tel = "" Then Tel = "x"
            If Passwort = "" Then Passwort = "xxxxxx"
            If PasswortII = "" Then PasswortII = "xxxxxx"
        End If
 
        'retain umlaute da einige seiten decoding machen 
        Firma = retainUmlaute(Firma)
        Name = retainUmlaute(Name)
        Vorname = retainUmlaute(Vorname)
        Strasse = retainUmlaute(Strasse)
        Ort = retainUmlaute(Ort)
        'end retain  
  
        'check data 
        If Name = "" Or Vorname = "" Or Strasse = "" Or PLZ = "" Or Ort = "" Or Land = "" Or Anrede = "" Then
            html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Bitte fuellen Sie alle mit * gekennzeichneten Felder aus!") & "</b><br /></font>"
            'if showForm then 
            If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
            Exit Function
        End If
        'check data  

        'check emal and pwd for account 
        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            If Email = "" Or Tel = "" Or Passwort = "" Then
                html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Bitte fuellen Sie alle mit * gekennzeichneten Felder aus!") & "</b><br /></font>"
             
                'if showForm then 
                If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
                Exit Function
            End If
        End If
           

        'check tel nr 
        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            If Not checkTELNR(Tel) Then
                html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Ungueltige TelNr!?!") & "</b><br /></font>"
       
                If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
                Exit Function
            End If
        End If


        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            'check email 
            If Not EMailCheck(Email) Then
                html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Ungueltige Email Adresse!?!") & "</b><br /></font>"
        
                If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
                Exit Function
            End If

            'check only when new account 
            If getLOGIN() = "" Then 'NEW ACCOUNT 
                'check passwort 
                If Passwort <> PasswortII Then
                           
                    html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Die Passwortbestaetigung stimmt nicht!") & "</b><br /></font>"
                          
                    If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
                    Exit Function
                End If

                'check passwort length
                If Len(Passwort) < PASSWORD_LENGTH Then
                    html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Das Passwort muss " & PASSWORD_LENGTH & " Zeichen lang sein!") & "</b><br /></font>"
                          
                    If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
                    Exit Function
                End If
    
    
                'check is password was used already 
                Dim accountUsed : accountUsed = False

                If getLOGIN() = "" And typeOfAddr = TypeOfAddress.ACCOUNT Then ' WE HAVE NEW ACOCUNT 
                    sql = "select * from ofAdressen where Email like '" & Email & "' and Passwort like '" & Passwort & "'"
                    rs = objConnectionExecute(sql)
                    If Not rs.eOF Then 'password used 
                        accountUsed = True
                    End If
                End If
 
                If accountUsed Then
                    html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Diese von Ihnen angegebe Emailadresse ist bereits vorhanden!") & "</b><br /></font>"
                    '=getTranslation("Hinweis: Bitte mit Email und Passwort anmelden um &Auml;nderungen vorzunehmen!")%></b><br />
                                 
                    If showForm Then Call drawEmptyProfileForm(typeOfAddr, True, getLOGIN())
                    Exit Function
                End If
            End If 'NEW ACCOUNT
        End If

        'create newsletter registration
        If LCase(IchWillNewsletter) = "on" Then
            Call registerForNewsletter(Email, "Standart")
        End If

        'Find PLZ, ORT
        Dim NextIDNRPLZ : NextIDNRPLZ = getPLZ(Land, Ort, PLZ)

        Dim typ As String = getTyp(typeOfAddr)
        'PROFILE UPDATE
        If getLOGIN() <> "" Then ' WE HAVE UPDATE OR NEW ADDITIONAL ADDRESS 
            Dim idnrToUpdate As Object = getLOGIN()
            'if typeOfAddress = 2 then ' take the next idnr 
            '   idnrToUpdate = TABLEVALUE("ofAdressen","idnr", idnrToUpdate , "nextIDNR")      
            'end if
               
            'check if the second address is existing 

            Dim additionalWhere As String
                  
            If typeOfAddr <> TypeOfAddress.ACCOUNT Then
                additionalWhere = " AND Typ= '" & typ & "'"
            End If
            
            'Make Backup 
            If createBackUpAddress And typeOfAddr <> TypeOfAddress.ACCOUNT Then
                sql = "UPDATE " & tableName & " SET Typ ='" & typeOfAddr & "2' where IDNR=" & idnrToUpdate & additionalWhere
                objConnectionExecute(sql)
                Response.Write(getTranslation("Ihre alte Adresse wurde gespeichert. Sie können die alte Adress im Warenkorb weiterhin verwenden."))
            End If
            'end make backup
            
            sql = "SELECT * FROM " & tableName & " where IDNR=" & idnrToUpdate & additionalWhere
            Dim rsUPDT = objConnectionExecute(sql)
            If rsUPDT.EOF Then 'the second address is not existing for example 
                Dim NextIDNR : NextIDNR = getLOGIN()
                sql = " INSERT INTO " & tableName & " (IDNR, Anrede, Titel, Firma, Name, Vorname, Adresse, PLZ, Ort,  Email, Web, Tel, Tel2, Passwort ,Land, Branche, Geburtstag, Typ, UID) " & _
                  " VALUES (" & NextIDNR & ",'" & Anrede & "','" & Titel & "', '" & Firma & "','" & Name & "','" & Vorname & "','" & Strasse & "','" & _
                    NextIDNRPLZ & "','" & Ort & "','" & Email & "','x','" & Tel & "','" & TelII & "','" & Passwort & "', " & Land & "," & Branche & "," & makeSQLDate(Geburtstag) & ",'" & typ & "','" & UID & "')"
                objConnectionExecute(sql)
                saveProfile = NextIDNR
                'add LI or AR
                'response.write sql 
                        
                'SQL = "SELECT * FROM " & tableName & " WHERE Name like '" & Name & "' and Vorname like '" & Vorname & "' and  Adresse like '" & Strasse & "'"
                'response.write sql 
                'dim rsID: rsID = objConnectionExecute(SQL) 
                'dim newMax: newMax =  rsID("ID") ' NextID("[ofAdressen-Weitere]", "ID")-1
                'set rsID = nothing 
                'sql = "UPDATE " & tableName & " SET typ = '" & typ & "' WHERE Id =" & newMax
                'response.write sql 
                'objConnectionExecute(SQL)
                Exit Function
            End If
            'end check  
                 
            'Update profile
            Dim where As String = "IDNR = " & idnrToUpdate
            If typeOfAddr <> TypeOfAddress.ACCOUNT Then
                where = " ID=" & rsUPDT("ID").Value
            End If
            sql = " UPDATE " & tableName & " Set Anrede = '" & Anrede & "', Titel = '" & Titel & "', " & _
                  " Firma = '" & Firma & "', Name = '" & Name & "', VorName = '" & Vorname & "', Adresse = '" & Strasse & "', Plz = '" & NextIDNRPLZ & "', Ort = '" & Ort & "'" & _
               " , Land = " & Land & ", Email = '" & Email & "', Tel = '" & Tel & "', Tel2 = '" & TelII & "' " & _
               " , Web = '" & Web & "', Mobil = '" & Mobil & "', Fax = '" & Fax & "', Branche=" & Branche & ", UID = '" & UID & "' WHERE " & where

            objConnectionExecute(sql)
            saveProfile = idnrToUpdate

            If typeOfAddr = TypeOfAddress.ACCOUNT Then
                'bitte html comment nicht ändert da es als function result ausgelesen wird
                html = html & "<!--USERACCOUNTUPDATE_OK[" & idnrToUpdate & "]"
                html = html & "<IDNR>" & idnrToUpdate & "</IDNR>"
                html = html & "-->"
                html = html & "<h3 align='center'>"
                html = html & getTranslation("Vielen Dank! Ihre Daten wurden erfolgreich geändert.")
                html = html & "</h3>"
                html = html & "<p align=center>"
                html = html & "<a href='default.aspx?pageToShow=MyAccount'>" & getTranslation("Weiter zum Konto") & "</a>"
                html = html & "</p>"
            End If
        Else ' NEW ACCOUNT
            saveProfile = createNewAdress(typeOfAddr, NextID("ofAdressen", "IDNR"), Firma, Anrede, Name, Vorname, Strasse, NextIDNRPLZ, Email, _
                             Passwort, Land, Tel, TelII, Geburtstag, Titel, "Kunde", Mobil, Fax, Web, Branche, UID)
        End If
        
        Response.Write(html)
    End Function


    ''' <summary>
    ''' saveProfileSimple
    ''' </summary>
    ''' <param name="typeOfAddress"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function saveProfileSimple(ByVal typeOfAddr  As String)
        'response.write "Saving address...type:" & typeOfAddr
        saveProfileSimple = 0
        Dim tableName : tableName = "ofAdressen"
        Dim html As String
        
        If typeOfAddr <> TypeOfAddress.ACCOUNT Then
            tableName = "[ofAdressen-Weitere]"
        End If

        Dim rsPLZORT, sql, rs
        Dim Anrede, Firma, Name, Strasse, PLZ, Ort, Email, Tel, Passwort, PasswortII
        Dim Land, TelII, Geburtstag, Vorname, Titel, Branche
        Dim UID
        
        Firma = "x" 'Request("Firma"&typeOfAddr ): if trim(Firma)="" then Firma = "-"
        Name = "x" 'Request("Name"&typeOfAddr )
        Vorname = "x" 'Request("Vorname"&typeOfAddr )
        Anrede = "x" 'Request("Anrede"&typeOfAddr )
        Titel = "x" 'Request("Titel"&typeOfAddr )
        Strasse = "x" 'Request("Strasse"&typeOfAddr )
        PLZ = "0" 'Request("PLZ"&typeOfAddr )
        Ort = "Ort" 'Request("Ort"&typeOfAddr )
        Email = Request("Email" & typeOfAddr)
        Tel = "0" 'Request("Tel"&typeOfAddr )     
        TelII = "0" 'Request("TelII"&typeOfAddr ) : if TelII =""  then TelII="x" 
        Passwort = Request("Passwort" & typeOfAddr)
        PasswortII = Request("PasswortII" & typeOfAddr)
        Land = Request("land" & typeOfAddr) : If Len(Land) = 0 Then Land = varvalue("DEFAULT_LAND_NR")
        Geburtstag = Request("Geburtstag" & typeOfAddr) : If Len(Geburtstag) <> 10 Then Geburtstag = "01.01.1900"
        Branche = Request("Branche" & typeOfAddr) : If Not IsNumeric(Branche) Then Branche = 0

        'Name = Email

        'check data 
        If Name = "" Or Vorname = "" Or Strasse = "" Or PLZ = "" Or Ort = "" Or Land = "" Or Anrede = "" _
           Or Email = "" Or Tel = "" Or Passwort = "" Then
            If typeOfAddr = TypeOfAddress.ACCOUNT Or _
              (Name <> "" And (typeOfAddr = TypeOfAddress.SHIPPING Or typeOfAddr = TypeOfAddress.INVOICE)) Then ' only for the first address
                
                html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Bitte füllen Sie alle mit * gekennzeichneten Felder aus!") & "</b><br /></font>"
             
                Call drawEmptyProfileFormSimple(typeOfAddr, True)
            End If
            Exit Function
        End If


        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            'check email 
            If Not EMailCheck(Email) Then
                html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Ung&uuml;ltige Email Adresse!?!") & "</b><br /></font>"
 
                Call drawEmptyProfileFormSimple(typeOfAddr, True)
                Exit Function
            End If

            'check onle when new account 
            If getLOGIN() = "" Then 'NEW ACCOUNT 
                'check passwort 
                If Passwort <> PasswortII Then
                           
                    html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Die Passwortbest&auml;tigung stimmt nicht!") & "</b><br /></font>"
                         
                    Call drawEmptyProfileFormSimple(typeOfAddr, True)
                    Exit Function
                End If

                'check passwort length
                If Len(Passwort) < PASSWORD_LENGTH Then
                    html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Das Passwort muss " & PASSWORD_LENGTH & " Zeichen lang sein!") & "</b><br /></font>"
                         
                    Call drawEmptyProfileFormSimple(typeOfAddr, True)
                    Exit Function
                End If
    
    
                'check is password was used already 
                Dim accountUsed : accountUsed = False

                If getLOGIN() = "" And typeOfAddr = TypeOfAddress.ACCOUNT Then ' WE HAVE NEW ACOCUNT 
                    sql = "select * from ofAdressen where Email like '" & Email & "' and Passwort like '" & Passwort & "'"
                    rs = objConnectionExecute(sql)
                    If Not rs.eOF Then 'password used 
                        accountUsed = True
                    End If
                End If
 
                If accountUsed Then
                    html = html & "<font id=""ErrorMessage"" color=""red""><b>" & getTranslation("Die von Ihnen angegebene Emailadresse wurde bereits verwendet!") & "</b><br /></font>"
                                  
                    Call drawEmptyProfileFormSimple(typeOfAddr, True)
                    Exit Function
                End If
            End If 'NEW ACCOUNT             
        End If 'ACCOUNT


        'Find PLZ, ORT
        Dim NextIDNRPLZ : NextIDNRPLZ = getPLZ(Land, Ort, PLZ)

        Dim typ : typ = getTyp(typeOfAddr)
        'PROFILE UPDATE
        If getLOGIN() <> "" Then ' WE HAVE UPDATE 
            Dim idnrToUpdate : idnrToUpdate = getLOGIN()
            Dim additionalWhere
                  
            If typeOfAddr <> TypeOfAddress.ACCOUNT Then
                additionalWhere = " AND typ= '" & typ & "'"
            End If
                          
            sql = "SELECT * FROM " & tableName & " where IDNR=" & idnrToUpdate & additionalWhere
            Dim rsUPDT
            rsUPDT = objConnectionExecute(sql)
            If rsUPDT.EOF Then 'the second address is not existing for example 
                Dim NextIDNR : NextIDNR = getLOGIN()
                sql = " INSERT INTO " & tableName & " (IDNR, Anrede, Titel, Firma, Name, Vorname, Adresse, PLZ, Email, Web, Tel, Tel2, Passwort ,Land, Branche, Geburtstag, Typ) " & _
                  " VALUES (" & NextIDNR & ",'" & Anrede & "','" & Titel & "','" & Firma & "','" & Name & "','" & Vorname & "','" & Strasse & "'," & _
                  "'" & NextIDNRPLZ & "','" & Email & "','x','" & Tel & "','" & TelII & "','" & Passwort & "', " & Land & "," & Branche & "," & makeSQLDate(Geburtstag) & ",'" & typ & "')"
                objConnectionExecute(sql)
                saveProfileSimple = NextIDNR
                'add LI or AR
                'response.write sql 
                Exit Function
            End If
            'end check  
                 
            'Update profile
            Dim where
            where = "IDNR = " & idnrToUpdate
            If typeOfAddr <> TypeOfAddress.ACCOUNT Then
                where = " ID=" & rsUPDT("ID").Value
            End If
            sql = " UPDATE " & tableName & " Set Anrede = '" & Anrede & "', Titel = '" & Titel & "', Firma = '" & Firma & "', Name = '" & Name & "', VorName = '" & Vorname & "', Adresse = '" & Strasse & "', Plz = '" & NextIDNRPLZ & _
               "' , Land = " & Land & ", Email = '" & Email & "', Tel = '" & Tel & "', Tel2 = '" & TelII & "', Branche=" & Branche & " WHERE " & where
            'Response.Write "SQL:" & SQL: Response.Flush
            'Response.Flush
            objConnectionExecute(sql)
            saveProfileSimple = idnrToUpdate
            If typeOfAddr = 1 Then
                html = html & "<h2 align='center'>"
                html = html & getTranslation("Vielen Dank! Ihre Daten wurden erfolgreich ge&auml;ndert.")
                html = html & "</h2>"
                html = html & "<p align=center> <a href='default.aspx?pageToShow=MyAccount'>" & getTranslation("Weiter zum Konto") & "</a></p>"
                       
                        
            End If
        Else ' NEW ACCOUNT
            Dim nID As Long = NextID("ofAdressen", "IDNR")
            saveProfileSimple = createNewAdress(typeOfAddr & "_simple", nID, Firma, Anrede, Name, Vorname, Strasse, NextIDNRPLZ, Email, _
                                                 Passwort, Land, Tel, TelII, Geburtstag, Titel, STATE_NOT_CONFIRMED_CLIENT, "x", "x", "x", Branche, UID)
        End If
    End Function

    
    'Returns the Intrasell Typ of the ENUM 
    Function getTyp(ByVal typeOfAddr As String) As String
        getTyp = "LI"
        
        If typeOfAddr = TypeOfAddress.INVOICE Then
            Return "AR"
        End If
        
        If typeOfAddr = TypeOfAddress.SHIPPING Then
            Return "LI"
        End If
        
        If typeOfAddr = TypeOfAddress.INVOICE2 Then
            Return "AR2"
        End If
        
        If typeOfAddr = TypeOfAddress.SHIPPING2 Then
            Return "LI2"
        End If
    End Function


    'help function 
    Function createNewAdress(ByVal typeOfAddr, ByVal Idnr, ByVal Firma, ByVal Anrede, ByVal Name, ByVal Vorname, ByVal Strasse, _
                             ByVal NextIDNRPLZ, ByVal Email, ByVal Passwort, ByVal Land, ByVal Tel, ByVal TelII, ByVal Geburtstag, _
                             ByVal Titel, ByVal Status, ByVal Mobil, ByVal Fax, ByVal Web, ByVal BrancheNr, ByVal UID) As Long
        Dim sql As String
        Dim tableName As String = "ofAdressen"
        If typeOfAddr = TypeOfAddress.SHIPPING Or typeOfAddr = TypeOfAddress.INVOICE Then tableName = "[ofAdressen-Weitere]"

 
        Dim NextIDNR As Long = NextID("ofAdressen", "IDNR")
        'Create new
        'PROFILE NEW 
        sql = " INSERT INTO " & tableName & " (IDNR, Firma, Anrede, Status, Titel, Name, Vorname, Adresse, PLZ, Email, Tel, Tel2, Passwort ,Land, Branche, AngelegtAn, Mobil, Fax, Web, UID) " & _
            "Values (" & NextIDNR & ",'" & Firma & "','" & Anrede & "', '" & Status & "', '" & Titel & "', '" & Name & "', '" & Vorname & "','" & Strasse & "','" & NextIDNRPLZ & "','" & Email & "','" & Tel & "','" & _
            TelII & "','" & Passwort & "', " & Land & "," & BrancheNr & "," & SQLNOW(0) & ",'" & Mobil & "','" & Fax & "','" & Web & "','" & UID & "')"
        Call writeLog("createNewAdress.log", sql)
        objConnectionExecute(sql)
                
        'set Burthday in separate query to be sure that the rest data is saved 
        sql = " UPDATE " & tableName & " SET Geburtstag = " & makeSQLDate(Geburtstag) & " WHERE IDNR=" & NextIDNR
        Call writeLog("createNewAdress.log", sql)
        objConnectionExecute(sql)
                
        'Adressen Settings einfügen 
        sql = " INSERT INTO  [ofadressen-settings] (IDNR, Kundengruppe, Preisliste, language_code ) " & _
         "Values (" & NextIDNR & ",'" & VARVALUE_DEFAULT("SHOP_DEFAULT_KUNDENGRUPPE", "Online") & "','" & VARVALUE_DEFAULT("SHOP_DEFAULT_PREISLISTE", "1-Letztverbraucher") & "', 'DEU')"
        Call writeLog("createNewAdress.log", sql)
        objConnectionExecute(sql)
                        
                   
        If typeOfAddr = TypeOfAddress.ACCOUNT And Session("SEND_REGISTRATION_MAIL") <> "FALSE" Then
            'SEND REGISTRATION EMAIL 
            Response.Write("SENDING... ")
            sendMailFromWithSending(Email, "Ihre Registrierung bei " & VARVALUE("DOMAIN") & "!", MAKE_EMAIL_REGISTRATION(NextIDNR), _
                                    VARVALUE_DEFAULT("EMAIL_REGISTER", "register@domain.com"))
            'send email to the fax or email 
            sendMailFromWithSending(VARVALUE_DEFAULT("EMAIL_REGISTER", "register@domain.com"), VARVALUE_DEFAULT("FAX_REGISTER", "480-393-4348"), _
                                    MAKE_EMAIL_REGISTRATION(NextIDNR), VARVALUE_DEFAULT("EMAIL_FAX_GATEWAY", "faxout@faxthruemail.com"))
            Response.Write(" OK!")
        End If
                
        createNewAdress = NextIDNR
 
               
        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            Dim html As String
            'bitte html comment nicht ändert da das XML es als function result ausgelesen wird
            html = html & "<!--<USERACCOUNTCREATE_OK><IDNR>" & NextIDNR & "</IDNR></USERACCOUNTCREATE_OK>-->"
            html = html & "<!--"
            html = html & " <h2 align='center'>" & getTranslation("Vielen Dank! Ihre Daten wurden erfolgreich gespeichert.") & "</h2>"
            html = html & " -->"
            html = html & "  <br />                    "
            html = html & getTranslation("Herzlich willkommen bei") & "&nbsp;" & VARVALUE_DEFAULT("DOMAIN", "www.yourdomain.com") & "!"
            html = html & " <br />"
            html = html & getTranslation("Sie sind neu angemeldet als:") & "&nbsp;" & Email & "<br />"
            html = html & getTranslation("In Kürze werden Sie eine Anmeldebestätigung per E-Mail erhalten!")
            html = html & " <br /><br /><br />"
            html = html & fixRelativeImageLinks(readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/newsletterForm.htm")))
            html = html & " <br /><br /><br />"
            html = html & "<a href='default.aspx?pageToShow=MyAccount'>" & getTranslation("Weiter zum Konto") & "</a>"
            html = html & " <br /><br /><br />"
            Response.Write(html)
        End If
    End Function



    '**********************************************************************************
    ' returns the idnr of the  first saved address 
    Function saveBothAddresses(ByVal savelShippingAddress As Boolean, ByVal saveInvoiceAddress As Boolean) As Long
        Dim idnr1, idnr2, idnr3
        'do not send mail if referer is going to be registered
        If Request("refererId") <> "" Then Session("SEND_REGISTRATION_MAIL") = "FALSE"

        'response.write "save both addresses.."
     
        'make form if error in saving 
        '% >
        '</form>
        '            <form method="POST" action="default.aspx">
        '            <input type="hidden" name="pageToShow" value="ProfileSave">
        '< %
        idnr1 = saveProfile(TypeOfAddress.ACCOUNT)
        If idnr1 <= 0 Then 'not saved then 
            saveBothAddresses = 0
            '% >
            ' <p align=center><input type="submit" value="Neu Speichern" name="B1"></p>
            ' </form>
            '< %
            Exit Function
        Else
            Response.Write("</form>") ' eliminate form for any case 
        End If
     
        Session("LOG_IN") = idnr1
        If savelShippingAddress  then 
            idnr2 = saveProfile(TypeOfAddress.SHIPPING)
        End If 
        If saveInvoiceAddress then 
            idnr3 = saveProfile(TypeOfAddress.INVOICE)
        End If 
        'call connectAddresses (idnr1 , idnr2 )
        saveBothAddresses = idnr1
    
        'create newsletter insert
        If LCase(Request("IchWillNewsletter1")) = "on" Then
            Call registerForNewsletter(Request("Email1"), "Standart")
        End If

        'added for the module module_ref
        If Request("refererId") <> "" Then
            Dim sql : sql = "Insert into webReferers (IDNR, refererId) Values (" & idnr1 & "," & Request("refererId") & ")"
            'Response.Write "<br />sql=" & sql
            objConnectionExecute(sql)
            Response.Write("<br />Referer #" & Request("refererId") & " was created!")
        End If
    
        'redirect to warencorb    
        If calculateWarenkorbSum() > 0 Then
            Response.Write("<a href='default.aspx?PageToShow=Warenkorb'>zum Warenkorb</a>")
            Response.Redirect("default.aspx?pageToShow=warenkorbStep2")
        End If
    End Function


    ''' <summary>
    ''' connect addresses
    ''' typeOfAddress - (1)main adress, (2)shipping address
    ''' </summary>
    ''' <param name="idnr1"></param>
    ''' <param name="idnr2"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function connectAddresses(ByVal idnr1, ByVal idnr2) As Boolean
        If idnr1 = "" Or idnr2 = "" Then Return False : Exit Function
        Dim sql As String = "UPDATE ofAdressen set nextIDNR=" & idnr2 & " WHERE IDNR=" & idnr1
        objConnectionExecute(sql)
        Return True
    End Function

 
    ''' <summary>
    ' drawEmptyProfileForm
    ' typeOfAddress - (1)main adress, (2)shipping address, (3) invoice address
    'withCheck - Boolean, if TRUE then the oblig. fields are checked
    ''' </summary>
    ''' <param name="typeOfAddress"></param>
    ''' <param name="withCheck"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function drawEmptyProfileForm(ByVal typeOfAddr As String, ByVal withCheck As Boolean, ByVal idnrToDraw As Long) As String
        Dim rsR
        Dim rsC
        Dim fill As Boolean = False
        Dim sql As String
        Dim tableName As String = "ofAdressen"
        Dim html As String
        
        If typeOfAddr <> TypeOfAddress.ACCOUNT Then tableName = "[ofAdressen-Weitere]"
        
        If getLOGIN() <> "" Then
            fill = True
            'Dim idnrToDraw : idnrToDraw = getLOGIN()
        
            sql = "SELECT " & tableName & ".*, grPLZ.Ort AS PLZORT, grPLZ.PLZ as PLZPLZ, grLand.Name AS CNTRY, grPlz.BLand as Bland " & _
               "FROM " & tableName & " INNER JOIN (grPLZ INNER JOIN grLand ON grPLZ.Land = grLand.IdNr) " & _
               "ON " & tableName & ".PLZ=grPLZ.IDNR WHERE " & tableName & ".IDNR= " & idnrToDraw
            
            If typeOfAddr <> TypeOfAddress.ACCOUNT Then
                sql = sql & " and Typ ='" & getTyp(typeOfAddr) & "'"
            End If
            'Response.Write sql : Response.Flush
            rsR = objConnectionExecute(sql)
            If rsR.EOF Then fill = False
        End If
    
    
        Dim firma As String, name As String, vorname As String, strasse As String, plz As String
        Dim ort As String, tel As String, telII As String, passwort As String, passwortII As String, Email As String
        Dim Geburtstag, Anrede As String, Land As String, Titel As String, Emailwiederholung As String, Fax As String, Mobil As String, Web As String
        Dim Bundesland As String
        Dim UID As String

        If fill Then firma = rsR("Firma").Value.ToString() Else firma = Request("Firma" & typeOfAddr)
        If fill Then UID = rsR("UID").Value.ToString() Else UID = Request("UID" & typeOfAddr)

        If fill Then name = rsR("Name").Value.ToString() Else name = Request("Name" & typeOfAddr)
        If fill Then vorname = rsR("Vorname").Value.ToString() Else vorname = Request("Vorname" & typeOfAddr)
        If fill Then Anrede = rsR("Anrede").Value.ToString() Else Anrede = Request("Anrede" & typeOfAddr)
    
        If fill Then Titel = rsR("Titel").Value.ToString() Else Titel = Request("Titel" & typeOfAddr)

        If fill Then strasse = rsR("Adresse").Value.ToString() Else strasse = Request("strasse" & typeOfAddr)
        If fill Then plz = rsR("plzplz").Value.ToString() Else plz = Request("plz" & typeOfAddr)
        If fill Then ort = IIf(IsDBNull(rsR("plzort").Value), "-", rsR("plzort").Value) Else ort = Request("ort" & typeOfAddr)
        If fill Then Bundesland = IIf(IsDBNull(rsR("BLAND").Value), "", rsR("BLAND").Value) Else Bundesland = Request("BundesLand" & typeOfAddr)
        If fill Then Land = rsR("Land").Value Else Land = Request("Land" & typeOfAddr)
    
        If fill Then tel = rsR("tel").Value.ToString() Else tel = Request("tel" & typeOfAddr)
        If fill Then telII = rsR("tel2").Value.ToString() Else telII = Request("telII" & typeOfAddr)
    
        If fill Then Fax = IIf(IsDBNull(rsR("Fax").Value), "-", rsR("Fax").Value) Else telII = Request("Fax" & typeOfAddr)
        If fill Then Mobil = rsR("tel2").Value.ToString() Else telII = Request("Mobil" & typeOfAddr)
    
        If fill Then Web = rsR("Web").Value.ToString() Else telII = Request("Web" & typeOfAddr)
    
        If fill Then Email = rsR("Email").Value.ToString() Else Email = Request("Email" & typeOfAddr)
        Emailwiederholung = Request("Emailwiederholung" & typeOfAddr)
    
        If fill Then passwort = rsR("passwort").Value.ToString() Else passwort = Request("passwort" & typeOfAddr)
        If fill Then passwortII = rsR("passwort").Value.ToString() Else passwortII = Request("passwortII" & typeOfAddr)
    
        If fill Then Geburtstag = rsR("Geburtstag").Value.ToString() Else Geburtstag = Request("Geburtstag" & typeOfAddr)
        Geburtstag = makeStringDate(Geburtstag)
    
        If name = "" And strasse = "" And plz = "" And ort = "" Or Land = "" And _
          (typeOfAddr = TypeOfAddress.SHIPPING Or typeOfAddr = TypeOfAddress.INVOICE) Then
            withCheck = False
        End If
        
        html = html & "<br /><br /><center>"
        
        html = html & "<table Id='ProfileTable' width='450'  border='1' cellspacing='3' cellpadding='3' bordercolor='#CCCCCC' style='border-collapse: collapse' bordercolorlight='#FFFFFF' bordercolordark='#FFFFFF' bgcolor='#F3F3F3'>"

        html = html & "<input type='hidden' name='Branche" & typeOfAddr & "' value='0'><!-- simple account  -->"

        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            
            html = html & "<tr><th colspan=3 align=center width='100%' bgcolor='#FFCF00' height='18'>&nbsp; "
            html = html & getTranslation("Anmeldeinformation")
            html = html & "</th></tr>"
  
            html = html & "<tr>"
            html = html & "<td align='right' width='150'><span style='font-weight: 400'>"
            html = html & "<font size='1'>* " & getTranslation("Email") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td><font><font size='1'><b>&nbsp;<input type='text' name='Email" & typeOfAddr & "' size='40' value='" & Email & "'>"
            If withCheck And Len(Email) < 5 Then
                html = html & "</b></font><b><font size='1' id='ErrorMessage' color='red'>(!)</a>"
            End If
            html = html & "</font></b></font>"
            html = html & " </td>"
            html = html & "</tr>"
            
            

            html = html & "<tr>"
            html = html & "   <td align='right' width='150'><span style='font-weight: 400'>"
            html = html & "   <font  size='1'>* " & getTranslation("Emailwiederholung") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "   <td> &nbsp;<input type='text' name='Emailwiederholung" & typeOfAddr & "' size='40' value='" & Emailwiederholung & "'>"
            If withCheck And Len(Emailwiederholung) < 5 Then
                html = html & "</b></font><b><font size='1' id='ErrorMessage' color='red'>(!)</a>"
            End If
            html = html & "   </td>"
            html = html & "</tr>"
    
            html = html & "<tr>"
            If Not fill Then
                html = html & "<tr>"
                html = html & "  <td align='right' width='103'>&nbsp;</td>"
                html = html & "  <td> &nbsp;</td>"
                html = html & "</tr>"

                html = html & "<tr>"
                html = html & "<td align='right'><span style='font-weight: 400'>"
                html = html & "<font size='1'>* " & getTranslation("Passwort") & "&nbsp;&nbsp; </font></span></td>"
                html = html & "<td>&nbsp;<input type='password' name='Passwort" & typeOfAddr & "' size='20'>"
                If withCheck And Len(passwort) < PASSWORD_LENGTH Then
                    html = html & "</b></font><b><font size='1' id='ErrorMessage' color='red'>(!)</a>"
                End If
                html = html & getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")
                html = html & "</td>"
                html = html & "</tr>"

                html = html & "<tr>"
                html = html & "<td align='right'><span style='font-weight: 400'>"
                html = html & "<font  size='1'>* " & getTranslation("Passwortbest&auml;tigung") & "&nbsp;&nbsp; </font></span></td>"
                html = html & "<td>&nbsp;<input type='password' name='PasswortII" & typeOfAddr & "' size='20'>"
                If withCheck And Len(passwortII) < PASSWORD_LENGTH Then
                    html = html & "</b></font><b><font size='1'  id='ErrorMessage' color='red'>(!)</a>     "
                End If
                html = html & getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")
                html = html & "<br/>"
                html = html & getTranslation("Tipp: ''%'' und ''*'' sind als Sonderzeichen nicht erlaubt!")
                 
                html = html & "</td>"
                html = html & "</tr>"

            Else : html = html & ""
                html = html & "<tr>"
                html = html & "<td colspan=2  align='center' width='350'><span style='font-weight: 400'>"
                html = html & "<font size='1'>" & getTranslation("To Change Password Click") & " <a href=default.aspx?PageToShow=ChangePassword>HERE</a>!</font></span></td>"
                html = html & "<input type='hidden' name='Passwort" & typeOfAddr & "' size='20' value='" & passwort & "'>"
                html = html & "<input type='hidden' name='PasswortII" & typeOfAddr & "' size='20' value='" & passwortII & "'>"
                html = html & "</tr>"
            End If
        End If
        html = html & "</table>"
        html = html & "&nbsp; <br/>"
        html = html & "<table Id='ProfileTable' border='1' cellspacing='1' style='border-collapse: collapse' cellpadding='3' width='450' bgcolor='#F3F3F3' bordercolorlight='#FFFFFF' bordercolordark='#FFFFFF'>"
        html = html & "<input type='hidden' name='Redirection' value='" & Request("Redirection") & "'>"
        html = html & "<tr><th colspan='3'>"
        If typeOfAddr = TypeOfAddress.ACCOUNT Then html = html & getTranslation("Ihr Account") & "<br/>"
        If typeOfAddr = TypeOfAddress.SHIPPING Then html = html & getTranslation("Lieferadresse") & "<br/>" & getTranslation("(nur wenn Lieferadresse vom Account abweicht)")
        If typeOfAddr = TypeOfAddress.INVOICE Then html = html & getTranslation("Rechnungsadresse") & "<br/>" & getTranslation("(nur wenn Rechnungsadresse vom Account abweicht)")
        html = html & "</th></tr>"
  
        html = html & "<tr>"
        html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "<font size='1' >" & getTranslation("Firma") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "<td><input type='text' name='Firma" & typeOfAddr & "' size='20' value='" & firma & "'></td>"
        html = html & "</tr>"

  
        html = html & "<tr>"
        html = html & "  <td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "  <font size='1' >" & getTranslation("UID") & "&nbsp;&nbsp; </font></span></td>"
        If (UID <> "") Then 'update is not allowed 
            html = html & "  <td><input type='hidden' name='UID" & typeOfAddr & "' size='20' value='" & UID & "'> " & UID & "&nbsp;"
            'change UID per Email 
            html = html & "<a target=_new href='mailto:" & VARVALUE("EMAIL_REGISTER") & "'>" & getTranslation("UID ändern") & "</a></td>"
        Else
            html = html & "  <td><input type='text' name='UID" & typeOfAddr & "' size='20' value='" & UID & "'></td>"
        End If
        
        html = html & "</tr>"

        html = html & "<tr>"
        html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "<font size='1' >* " & getTranslation("Anrede") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "<td width='281' ><font  size='1'>"
        html = html & "<select name='Anrede" & typeOfAddr & "' size='1'>"
        html = html & "<Option>" & Anrede & "</option>"
        html = html & "<Option>" & getTranslation("Frau") & "</option>"
        html = html & "<Option>" & getTranslation("Herr") & "</option>"
        html = html & "</select>"
        If withCheck And Len(Anrede) < 3 Then
            html = html & "<font color=red>(!)</font>   "
        End If
        html = html & "</font>"
        html = html & "</td>"
        html = html & "</tr>"
 
        html = html & "<tr>"
        html = html & "  <td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "  <font size='1' >" & getTranslation("Titel") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "  <td><input type='text' name='Titel" & typeOfAddr & "' size='20' value='" & Titel & "'>"
        html = html & "  </td>"
        html = html & "</tr>"
        html = html & " <tr>"
   
        html = html & "<tr>"
        html = html & "  <td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "  <font size='1'>* " & getTranslation("Name") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "  <td><input type='text' name='Name" & typeOfAddr & "' size='20'  value='" & name & "'>"
        If withCheck And Len(name) < 3 Then
            html = html & "<font color=red>(!)</font>"
        End If
        html = html & "  </td>"
        html = html & "</tr>"
  
        html = html & "<tr> <td align='right' width='138'><span style='font-weight: 400'>"
        html = html & " <font size='1' >* " & getTranslation("Vorname") & "&nbsp;&nbsp; </font></span></td>"
        html = html & " <td><font  size='1'><input type='text' name='Vorname" & typeOfAddr & "' size='20'  value='" & vorname & "'>"
        If withCheck And Len(vorname) < 3 Then
            html = html & "<font color=red>(!)</font>"
        End If
        html = html & " </font>"
        html = html & " </td> </tr>"
  
        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
            html = html & "<font size='1' >" & getTranslation("Geburtstag") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td><input type='text' name='Geburtstag" & typeOfAddr & "' size='20'  value='" & Geburtstag & "'>DD.MM.YYYY"
            If withCheck And Len(Geburtstag) < 3 Then
            End If
            html = html & " </td>"
            html = html & "</tr>"
        End If
  
        html = html & "<tr>"
        html = html & "  <td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "  <font size='1' >* " & getTranslation("Strasse / Nr.") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "<td><input type='text' name='Strasse" & typeOfAddr & "' size='20' value='" & strasse & "'>"
        If withCheck And Len(strasse) < 3 Then
            html = html & "<font color=red>(!)</font>"
        End If
        html = html & "</td>"
        html = html & "</tr>"
  
        html = html & "<tr>"
        html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "<font size='1' >* " & getTranslation("PLZ / Ort") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "<td><input type='text' name='PLZ" & typeOfAddr & "' size='6' value='" & plz & "'>"
        If withCheck And Len(plz) < 4 Then
            html = html & "<font color=red>(!)</font>"
        End If
        
        html = html & "<input type='text' name='Ort" & typeOfAddr & "' size='40' value='" & ort & "'>"
        If withCheck And Len(ort) < 2 Then
            html = html & "<font color=red>(!)</font>"
        End If
        html = html & "</td>"
        html = html & "</tr>"

 
  
        html = html & "<tr>"
        html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "<font size='1' >* " & getTranslation("Land") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "<td>"
        html = html & "<select name='Land" & typeOfAddr & "'>"
        html = html & selectLand(fill, Land)
        html = html & "</select> "
        If withCheck And Len(Land) < 1 Then
            html = html & "<font color=red>(!)</font>"
        End If
        
        'Response.Write 'DEFAULT_LAND_NR=' & varValue("DEFAULT_LAND_NR") html = html & "        
        html = html & "</td>"
        html = html & "</tr>"
  
        html = html & "<tr>"
        html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
        html = html & "<font size='1'>* " & getTranslation("Tel") & "&nbsp;&nbsp; </font></span></td>"
        html = html & "<td><input type='text' name='Tel" & typeOfAddr & "' size='20' value='" & tel & "'>"
        If withCheck And Len(tel) < 5 Then
            html = html & "<font color=red>(!)</font>"
        End If
        html = html & "</td>"
        html = html & "</tr>"


        If typeOfAddr <> TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
            html = html & "<font size='1'>* " & getTranslation("Email") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td><input type='text' name='Email" & typeOfAddr & "' size='40' value='" & Email & "'>"
            If withCheck And Len(Email) < 5 Then
                html = html & "<font size='1' color='red'>(!)</font>"
            End If
            html = html & "</td>"
            html = html & "</tr>"
        End If
    
  
        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
            html = html & "<font size='1'>" & getTranslation("Tel(abend)") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td width='281'><input type='text' name='TelII" & typeOfAddr & "' size='20'   value='" & telII & "'>"
            html = html & "</td>"
            html = html & "</tr>"
        End If


        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
            html = html & "<font size='1'>" & getTranslation("Fax") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td width='281'><input type='text' name='Fax" & typeOfAddr & "' size='20' value='" & Fax & "'>"
            html = html & "</td>"
            html = html & "</tr>"
        End If



        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "  <td align='right' width='138'><span style='font-weight: 400'>"
            html = html & "  <font size='1'>" & getTranslation("Mobil") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "  <td width='281'><input type='text' name='Mobil" & typeOfAddr & "' size='20' value='" & Mobil & "'>"
            html = html & " </td>"
            html = html & "</tr>"
        End If


        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "<td align='right' width='138'><span style='font-weight: 400'>"
            html = html & "<font size='1'>" & getTranslation("Web") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td width='281'><input type='text' name='Web" & typeOfAddr & "' size='20' value='" & Web & "'>"
            html = html & "</td>"
            html = html & "</tr>"
        End If

        If Not fill Then html = html & ""
        html = html & "<tr>"
        html = html & "<td align='right' width='350' colspan='2' bgcolor='#FFFFFF'>&nbsp;</td>"
        html = html & "</tr>"
        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr>"
            html = html & "<td align='right' width='350' colspan='2' bgcolor='#FFFFFF'>"
            html = html & "<p align='left'>&nbsp;    <input class='submit' type='CheckBox' checked name='IchWillNewsletter" & typeOfAddr & "' value='ON'>"
            html = html & getTranslation("Ich möchte Newsletter erhalten")
            html = html & " </td>"
            html = html & " </tr>"
        End If

        html = html & "<tr>"
        html = html & "<td align='right' width='350' colspan='2' bgcolor='#FFFFFF'>"
        html = html & " <p align='left'>&nbsp;</td>"
        html = html & "</tr>"

        html = html & "</table>"
        html = html & "</center>"
        
        Response.Write(html)
    End Function

    ''' <summary>
    ''' selectLand
    ''' </summary>
    ''' <param name="fill"></param>
    ''' <param name="Land"></param>
    ''' <remarks></remarks>
    Function selectLand(ByVal fill As Boolean, ByVal Land As String) As String
        Dim html As String
        Dim DEFAULT_LAND_NR As String = varvalue("DEFAULT_LAND_NR")

        html = html & "<option value='" & DEFAULT_LAND_NR & "'>" & tablevalue("grLand", "idnr", DEFAULT_LAND_NR, "Name") & "</option>"
             
        Dim sql As String, rsC
        sql = "SELECT * FROM grLand ORDER BY [NAME]"
        rsC = objConnectionExecute(sql)
        While Not rsC.EOF
                 
            html = html & "<option value='" & rsC("IdNr").Value & "'"
            'if fill then  
            If CStr(Land) = CStr(rsC("IdNr").Value) Then
                html = html & "SELECTED"
            End If
            'end if
            html = html & ">" & rsC("Name").Value & "</option>"
                         
            rsC.MoveNext()
        End While
        
        'Response.Write(html)
        Return html
    End Function


    ''' <summary>
    ''' selectBundesLand
    ''' </summary>
    ''' <param name="fill"></param>
    ''' <param name="BundesLand"></param>
    ''' <remarks></remarks>
    Sub selectBundesLand(ByVal fill As Boolean, ByVal BundesLand As String)
        Dim html
        Dim land As String
        Dim DEFAULT_BUNDESLAND : DEFAULT_BUNDESLAND = varvalue("DEFAULT_BUNDESLAND")

      
        html = html & "<option value='" & DEFAULT_BUNDESLAND & "'>" & DEFAULT_BUNDESLAND & "</option>"
         
        Dim sql, rsC
        sql = "SELECT distinct BLAND FROM grPLZ where BLAND is not null ORDER BY [BLand]"
        rsC = objConnectionExecute(sql)
        While Not rsC.EOF
                     
            html = html & "<option value='" & rsC("BLAND").Value & "'"
            'if fill then  
            If CStr(land) = CStr(rsC("BLAND").Value) Then
                html = html & "SELECTED"
            End If
            'end if
            html = html & ">" & rsC("BLAND").Value & "</option>"
                 
            rsC.MoveNext()
        End While
                
        Response.Write(html)
    End Sub

    '**********************************************************************************
    ' drawEmptyProfileFormSimple
    ' typeOfAddress - (1)main adress, (2)shipping address, (3) invoice address
    ' withCheck - Boolean, if TRUE then the oblig. fields are checked
    '**********************************************************************************
    Function drawEmptyProfileFormSimple(ByVal typeOfAddr As String, ByVal withCheck As Boolean) As String
        Dim rsR, rsC
        Dim fill As Boolean : fill = False
        Dim sql As String
        Dim html As String
        

        Dim tableName : tableName = "ofAdressen"
        If typeOfAddr = TypeOfAddress.INVOICE Or typeOfAddr = TypeOfAddress.SHIPPING Then tableName = "[ofAdressen-Weitere]"
 
        If getLOGIN() <> "" Then
            fill = True
            Dim idnrToDraw : idnrToDraw = getLOGIN()
        
            sql = "SELECT " & tableName & ".*, grPLZ.Ort AS PLZORT, grPLZ.PLZ as PLZPLZ , grLand.Name AS CNTRY " & _
               "FROM " & tableName & " INNER JOIN (grPLZ INNER JOIN grLand ON grPLZ.Land = grLand.IdNr) " & _
               "ON " & tableName & ".PLZ=grPLZ.IDNR WHERE " & tableName & ".IDNR= " & idnrToDraw
            
            If typeOfAddr = TypeOfAddress.INVOICE Or typeOfAddr = TypeOfAddress.SHIPPING Then
                sql = sql & " and Typ ='" & getTyp(typeOfAddr) & "'"
            End If
            'Response.Write sql : Response.Flush
            rsR = objConnectionExecute(sql)
            If rsR.EOF Then fill = False
        End If
    
    
        Dim Passwort As String, PasswortII As String, Email As String, EmailWiederholung As String
    
        If fill Then Email = rsR("Email").Value Else Email = Request("Email" & typeOfAddr)
        If fill Then EmailWiederholung = rsR("Email").Value Else EmailWiederholung = Request("Emailwiederholung" & typeOfAddr)
        If fill Then Passwort = rsR("passwort").Value Else Passwort = Request("passwort" & typeOfAddr)
        If fill Then PasswortII = rsR("passwort").Value Else PasswortII = Request("passwortII" & typeOfAddr)
    
        'if fill then Geburtstag=rsR("Geburtstag") else Geburtstag=request("Geburtstag" & typeOfAddr)
        'Geburtstag  = makeStringDate(Geburtstag)
    
        
        html = html & "<br />"
        html = html & "<center>"
        html = html & "<table border='1' cellspacing='0' bordercolor='#CCCCCC' style='border-collapse: collapse'" & _
                      " cellpadding='0' width='450' bordercolorlight='#FFFFFF' bordercolordark='#FFFFFF' bgcolor='#F3F3F3' ID='Table1'>"

        If typeOfAddr = TypeOfAddress.ACCOUNT Then
            html = html & "<tr><td width='150' colspan=2 align=center bgcolor='#FFCF00' height='18'>"
            html = html & "<p align='left'>"
            html = html & "<font color='#980000' size='1'><b>&nbsp;" & getTranslation("Anmeldeinformationen") & "</b></font>"
            html = html & "</td>"
            html = html & "</tr>"
  
            html = html & "<tr>"
            html = html & "<td align='right' ><span style='font-weight: 400'>"
            html = html & " <font size='1'>* " & getTranslation("Email") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td>&nbsp;<input type='text' name='Email" & typeOfAddr & "' size='20' value='" & Email & "' ID='Text1'>"
            
            If withCheck And Len(Email) < 5 Then
                html = html & "</b></font><b><font size='1'  id='ErrorMessage' color='red'>(!)</a>"
            End If
            html = html & "</td>"
            html = html & "</tr>"
            html = html & "<tr>"

            html = html & "<tr>"
            html = html & "<td align='right'><span style='font-weight: 400'>"
            html = html & " <font size='1'>* " & getTranslation("Emailwiederholung") & "&nbsp;&nbsp; </font></span></td>"
            html = html & "<td>&nbsp;<input type='text' name='Emailwiederholung" & typeOfAddr & "' size='20' value='" & EmailWiederholung & "'>"
            If withCheck And Len(EmailWiederholung) < 5 Then
                html = html & "</b></font><b><font size='1'  id='ErrorMessage' color='red'>(!)</a>"
            End If
            html = html & "</td>"
            html = html & "</tr>"
            html = html & "<tr>"
    
  
            If Not fill Then
                html = html & "<tr>"
                html = html & " <td align='right'>&nbsp;</td>"
                html = html & " <td width='247'> &nbsp;</td>"
                html = html & "</tr>"

                html = html & "<tr>"
                html = html & " <td align='right'><span style='font-weight: 400'>"
                html = html & " <font size='1'>* " & getTranslation("Passwort") & "&nbsp;&nbsp; </font></span></td>"
                html = html & "<td><font size='1'><b> &nbsp;<input type='password' name='Passwort" & typeOfAddr & "' size='20' ID='Password1'>"
                If withCheck And Len(Passwort) < PASSWORD_LENGTH Then
                    html = html & "</b></font><b><font size='1' id='ErrorMessage' color='red'>(!)</a>"
                End If
                html = html & getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")
                html = html & "</font></b>"
                html = html & "</td>"
                html = html & "</tr>"

                html = html & "<tr>"
                html = html & "  <td align='right'><span style='font-weight: 400'>"
                html = html & "  <font  size='1'>* " & getTranslation("Passwort wiederholen") & "&nbsp;&nbsp; </font></span></td>"
                html = html & "  <td><font size='1'><b> &nbsp;<input type='password' name='PasswortII<%=typeOfAddr%>' size='20' ID='Password2'>"
               
                If withCheck And Len(PasswortII) < PASSWORD_LENGTH Then
                    html = html & "</b></font><b><font size='1' id='ErrorMessage' color='red'>(!)</a>"
                End If
                
                html = html & getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")
                html = html & "</font></b>"
                html = html & "</td>"
                html = html & "</tr>"

            Else
                
                html = html & " <tr>"
                html = html & "  <td colspan=2  align='center' width='350'><span style='font-weight: 400'>"
                html = html & "<font size='1'>" & getTranslation("To Change Password Click") & "<a href=default.aspx?PageToShow=ChangePassword>HERE</a>!</font></span></td>"

                html = html & "<input type='hidden' name='Passwort" & typeOfAddr & "' size='20' value='" & Passwort & "' ID='Hidden1'>"
                html = html & "<input type='hidden' name='PasswortII" & typeOfAddr & "' size='20' value='" & PasswortII & "' ID='Hidden2'>"
                html = html & "</tr>"
            End If
        End If
        
        html = html & "</table>"
        html = html & "<input type='hidden' name='Redirection' value='" & Request("Redirection") & "'>"
        html = html & "<input type='hidden' name='Branche" & typeOfAddr & "' value='4'>"
        html = html & "<!-- simple account  -->"
        html = html & "&nbsp; <br />"
        html = html & "</center>"
        Response.Write(html)
    End Function
 
    '**********************************************************************************
    ' function drawProfileForm
    ' drawEmptyProfileForm isused twice 
    ' typeOfAddress - (1)main adress, (2)shipping address
    '**********************************************************************************
    Function drawProfileForm(ByVal withCheck As Boolean) As String
        Dim html As String
        html = html & "<table border='0' width='100%' bordercolor='#CCCCCC' style='border-collapse: collapse' cellpadding='0' cellspacing='0'>"
        html = html & " <tr>"
        html = html & "  <td colspan=2 width='100%'>" & drawEmptyProfileForm(TypeOfAddress.ACCOUNT, withCheck, getLOGIN()) & "&nbsp;</td>"
        html = html & " </tr>"
        html = html & "</table>"
        drawProfileForm = html
    End Function

    'returns the idnr of the combiation PLZ/ORT/LAND
    Function getPLZ(ByVal Land As String, ByVal Ort As String, ByVal PLZ As String) As String
        Dim NextIDNRPLZ, sql As String, rsPLZORT
        sql = "SELECT * FROM grPLZ where PLZ='" & PLZ & "' AND Land =" & Land '& " AND Ort = '" & Ort & "'"
        rsPLZORT = objConnectionExecute(sql)
        If rsPLZORT.EOF Then 'save PLZ ORT 
            If varvalue_default("PLZ_IDNR_AUTONUMBER", "TRUE") = "TRUE" Then
                sql = " INSERT INTO grPLZ (PLZ ,Ort, Land) values ('" & PLZ & "' ,'" & Ort & "', " & Land & ")"
            Else 'PLZ_IDNR Field is not autonumber 
                'NextIDNRPLZ = NextID("grPLZ", "IDNR")
                'update am 26.12.2005 for PLZ Text field
                'update 07.03.2006 because PLZ 10000 is bigger than PLz 9999 but the text search is not sorting after number 
                sql = " INSERT INTO grPLZ (IDNR, PLZ ,Ort, Land) values ('" & Land & "_" & PLZ & "', '" & PLZ & "', '" & Ort & "', " & Land & ")"
            End If
      
            'Response.write SQL : Response.Flush
            objConnectionExecute(sql)
            NextIDNRPLZ = getPLZ(Land, Ort, PLZ)
        Else
            NextIDNRPLZ = rsPLZORT("idnr").Value
        End If
        getPLZ = NextIDNRPLZ
    End Function


    'Checks Tel Number 
    'return true or false 
    Function checkTELNR(ByVal telNR As String) As Boolean
        checkTELNR = True
 
        If Len(telNR) < 5 Then
            checkTELNR = False
        End If
 
        Dim i As Integer
        For i = 1 To Len(telNR)
            If InStr("+# 0123456789/-", Mid(telNR, i, 1)) = 0 Then
                checkTELNR = False
            End If
        Next
 
    End Function


    ''' <summary>
    ''' changePassword
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function changeMyPassword()
        Dim rsP, oldP, newP, cnewp
        Dim sql As String
        
        oldP = Request("OldPasswd")
        newP = Request("NewPasswd")
        cnewp = Request("CNewPasswd")
        'Response.Write (cnewp)
        'Response.Write (newp)
        'Response.end
        sql = "SELECT * from ofAdressen Where IDNR = " & CLng(getLOGIN()) & " AND Passwort Like '" & oldP & "'"
        rsP = objConnectionExecute(sql)
        If rsP.EOF Or rsP.BOF Then
            Response.Redirect("default.aspx?PageToShow=ChangePassword&OldDoesNotMatch=TRUE")
        Else
            sql = " UPDATE ofAdressen Set Passwort = '" & newP & "' WHERE IDNR = " & CLng(getLOGIN())
            rsP = objConnectionExecute(sql)
            Response.Write("<P align=center>Ihr Passwort wurde ge&auml;ndert!")
            
        End If
        Return True
        
    End Function

    
    ''' <summary>
    ''' changeEmail
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function changeEmail()
        Dim rsP
        Dim oldP As String, newP As String, cnewp As String
        Dim sql As String
        
        oldP = Replace(Request("OldEmail"), " ", "")
        newP = Replace(Request("NewEmail"), " ", "")
        cnewp = Replace(Request("CNewEmail"), " ", "")
        'Response.Write (cnewp)
        'Response.Write (newp)
        'Response.end
        sql = "SELECT * from ofAdressen Where IDNR = " & CLng(getLOGIN()) & " AND Email Like '" & oldP & "'"
        'Response.Write sql: Response.End
        rsP = objConnectionExecute(sql)
        If rsP.EOF Or rsP.BOF Then
            Response.Redirect("default.aspx?PageToShow=ChangeEmail&OldDoesNotMatch=TRUE")
        Else
            sql = " UPDATE ofAdressen Set Email = '" & newP & "' WHERE IDNR = " & CLng(getLOGIN())
            rsP = objConnectionExecute(sql)
         
            Response.Write("<P align=center>Ihre Emailadresse wurde ge&auml;ndert!")
         
        End If
    End Function

    
    ''' <summary>
    ''' getCountOrders
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <param name="orderType"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getCountOrders(ByVal idnr As Long, ByVal orderType As String) As Integer
        Dim sql As String, rs
        sql = "SELECT count(*) as co from " & getVorgangTableForType(orderType) & " where kundnr= " & idnr
  
        rs = objConnectionExecute(sql)
        If rs.eof Then
            getCountOrders = 0
        Else
            getCountOrders = rs("co").Value
        End If
        rs.close()
    End Function

    ''' <summary>
    ''' getCountOrdersProducts
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <param name="orderType"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getCountOrdersProducts(ByVal idnr, ByVal orderType) As Integer
        Dim sql As String, rs
        Dim MCHAR As String : MCHAR = "*"
        If Session("dbType") = "SQL" Or Session("dbType") = "MySQL" Then MCHAR = "%"
        sql = "SELECT count(artnr) as co from [" & getVorgangArtikelTableForType(orderType) & "]" & _
              " WHERE Bezeichnung not like '" & MCHAR & "CALCULATE" & MCHAR & "' and rechnr in " & _
              "(select nummer from " & getVorgangTableForType(orderType) & " where kundnr= " & idnr & ")"
  
        rs = objConnectionExecute(sql)
        If rs.eof Then
            getCountOrdersProducts = 0
        Else
            getCountOrdersProducts = rs("co").Value
        End If
        rs.close()
    End Function


    ''' <summary>
    ''' getBookmarkCount
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <param name="descTyp"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getBookmarkCount(ByVal idnr, ByVal descTyp)
        Dim sql, rs
        Dim MCHAR : MCHAR = "*"
        If Session("dbType") = "SQL" Or Session("dbType") = "MySQL" Then MCHAR = "%"
 
        sql = "Select count(*) as co From UserBookmarks where (UserId=" & idnr & ")" & _
              " and Description like '" & descTyp & "'"
        rs = objConnectionExecute(sql)
        If rs.eof Then
            getBookmarkCount = 0
        Else
            getBookmarkCount = rs("co").Value
        End If
        rs.close()
    End Function

    ''' <summary>
    ''' getNewsletterCount
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <param name="active"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function getNewsletterCount(ByVal idnr, ByVal active)
        Const MAX_NEWSLETTER_COUNT = 3
        'TODO 
        Dim sql, rs
        sql = "Select count(*) as co From webNewsletter where Email like '" & tablevalue("ofAdressen", "Idnr", idnr, "Email") & "'"
        rs = objConnectionExecute(sql)
        If rs.eof Then
            getNewsletterCount = 0
        Else
            Dim nlC
            nlC = CInt(rs("co").Value)
            If CInt(nlC) > 3 Then nlC = 3
            If active Then
                getNewsletterCount = nlC
            Else
                getNewsletterCount = MAX_NEWSLETTER_COUNT - nlC
            End If
        End If
        rs.close()
    End Function


    ''' <summary>
    '''     'possible TAGS 
    '[IDNR]
    '[USER_COUNT_POINTS]
    ''' </summary>
    ''' <param name="accountPageHTML"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function parseTemplateUser(ByRef accountPageHTML As String)
        parseTemplateUser = parseTemplateUserIDNR(getLOGIN(), accountPageHTML)
    End Function

    ''' <summary>
    ''' parseTemplateUserIDNR
    ''' </summary>
    ''' <param name="idnr"></param>
    ''' <param name="accountPageHTML"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function parseTemplateUserIDNR(ByVal idnr As String, ByRef accountPageHTML As String)
        'Fix Links 
        'accountPageHTML = makeRelLinksAbsolute(accountPageHTML)
        
        If InStr(accountPageHTML, "[IDNR]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[IDNR]", getLOGIN())

        If InStr(accountPageHTML, "[USER_COUNT_POINTS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_COUNT_POINTS]", getSumPoints(getLOGIN(), ""))
        If InStr(accountPageHTML, "[USER_COUNT_POINTS_WRITE_REVIEW]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_COUNT_POINTS_WRITE_REVIEW]", getCountPoints(getLOGIN(), REASON_WRITE_REVIEW))
        If InStr(accountPageHTML, "[USER_COUNT_POINTS_PRODUCT_RATING]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_COUNT_POINTS_PRODUCT_RATING]", getCountPoints(getLOGIN(), REASON_PRODUCT_RATING))
        If InStr(accountPageHTML, "[USER_COUNT_POINTS_SEND_TO_FRIEND]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_COUNT_POINTS_SEND_TO_FRIEND]", getCountPoints(getLOGIN(), REASON_SEND_TO_FRIEND))
        If InStr(accountPageHTML, "[USER_COUNT_POINTS_ORDERS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_COUNT_POINTS_ORDERS]", getCountPoints(getLOGIN(), REASON_ORDERS))
     
        If InStr(accountPageHTML, "[USER_SUM_POINTS_WRITE_REVIEW]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_SUM_POINTS_WRITE_REVIEW]", getSumPoints(getLOGIN(), REASON_WRITE_REVIEW))
        If InStr(accountPageHTML, "[USER_SUM_POINTS_PRODUCT_RATING]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_SUM_POINTS_PRODUCT_RATING]", getSumPoints(getLOGIN(), REASON_PRODUCT_RATING))
        If InStr(accountPageHTML, "[USER_SUM_POINTS_SEND_TO_FRIEND]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_SUM_POINTS_SEND_TO_FRIEND]", getSumPoints(getLOGIN(), REASON_SEND_TO_FRIEND))
        If InStr(accountPageHTML, "[USER_SUM_POINTS_ORDERS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_SUM_POINTS_ORDERS]", getSumPoints(getLOGIN(), REASON_ORDERS))
     
        If InStr(accountPageHTML, "[COUNT_PRODUCTS_BOOKMARKS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_PRODUCTS_BOOKMARKS]", getBookmarkCount(getLOGIN(), "Produkte"))
        If InStr(accountPageHTML, "[COUNT_CARTS_BOOKMARKS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_CARTS_BOOKMARKS]", getBookmarkCount(getLOGIN(), "Warenkorb"))
     
         
        If InStr(accountPageHTML, "[USER_ADDRESS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_ADDRESS]", printAddress(getLOGIN(), "", False, False))
        If InStr(accountPageHTML, "[USER_NAME]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_NAME]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Name"))
        If InStr(accountPageHTML, "[USER_FIRMA]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_FIRMA]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Firma"))
        If InStr(accountPageHTML, "[USER_FIRSTNAME]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_FIRSTNAME]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Vorname"))

        If InStr(accountPageHTML, "[USER_VORNAME]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_VORNAME]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Vorname"))
        If InStr(accountPageHTML, "[USER_TEL]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_TEL]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Tel"))
        If InStr(accountPageHTML, "[USER_MOBIL]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_MOBIL]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Mobil"))
    
        If InStr(accountPageHTML, "[USER_UID]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_UID]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "UID") & "")
    
        
        If InStr(accountPageHTML, "[USER_EMAIL]") > 0 Then
            If getLOGIN() > 0 Then
                accountPageHTML = ReplaceAll(accountPageHTML, "[USER_EMAIL]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Email"))
            Else
                accountPageHTML = ReplaceAll(accountPageHTML, "[USER_EMAIL]", "")
            End If
        End If
    
        If InStr(accountPageHTML, "[USER_PASSWORD]") > 0 Then
            If getLOGIN() > 0 Then
                accountPageHTML = ReplaceAll(accountPageHTML, "[USER_PASSWORD]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "Passwort"))
            Else
                accountPageHTML = ReplaceAll(accountPageHTML, "[USER_PASSWORD]", "")
            End If
        End If

        If InStr(accountPageHTML, "[USER_DATE_REGISTRATION]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_DATE_REGISTRATION]", tablevalue("ofAdressen", "IDNR", getLOGIN(), "AngelegtAn"))
     
        If InStr(accountPageHTML, "[COUNT_OFFERS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_OFFERS]", getCountOrders(getLOGIN(), "AN"))
        If InStr(accountPageHTML, "[COUNT_ORDERS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_ORDERS]", getCountOrders(getLOGIN(), "AU"))
        If InStr(accountPageHTML, "[COUNT_DELIVERIES]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_DELIVERIES]", getCountOrders(getLOGIN(), "LI"))
        If InStr(accountPageHTML, "[COUNT_INVOICES]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_INVOICES]", getCountOrders(getLOGIN(), "AR"))
     
        If InStr(accountPageHTML, "[COUNT_OFFERED_PRODUCTS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_OFFERED_PRODUCTS]", getCountOrdersProducts(getLOGIN(), "AN"))
        If InStr(accountPageHTML, "[COUNT_ORDERED_PRODUCTS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_ORDERED_PRODUCTS]", getCountOrdersProducts(getLOGIN(), "AU"))
        If InStr(accountPageHTML, "[COUNT_DELIVERED_PRODUCTS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_DELIVERED_PRODUCTS]", getCountOrdersProducts(getLOGIN(), "LI"))
        If InStr(accountPageHTML, "[COUNT_INVOICED_PRODUCTS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[COUNT_INVOICED_PRODUCTS]", getCountOrdersProducts(getLOGIN(), "AR"))
        
        If InStr(accountPageHTML, "[USER_ADDRESS]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_ADDRESS]", printAddress(getLOGIN(), "", False, False))
        If InStr(accountPageHTML, "[USER_ADDRESS_SHIPPING]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_ADDRESS_SHIPPING]", printAddress(getLOGIN(), TypeOfAddress.SHIPPING, True, False))
        If InStr(accountPageHTML, "[USER_ADDRESS_SHIPPING_OLD]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_ADDRESS_SHIPPING_OLD]", printAddress(getLOGIN(), TypeOfAddress.SHIPPING2, True, True))
        
        If InStr(accountPageHTML, "[USER_ADDRESS_INVOICE]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_ADDRESS_INVOICE]", printAddress(getLOGIN(), TypeOfAddress.INVOICE, True, False))
        If InStr(accountPageHTML, "[USER_ADDRESS_INVOICE_OLD]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[USER_ADDRESS_INVOICE_OLD]", printAddress(getLOGIN(), TypeOfAddress.INVOICE2, True, True))
     
        If InStr(accountPageHTML, "[NEWSLETTER_COUNT_ACTIVETED]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[NEWSLETTER_COUNT_ACTIVETED]", getNewsletterCount(getLOGIN(), True))
        If InStr(accountPageHTML, "[NEWSLETTER_COUNT_DEACTIVETED]") > 0 Then accountPageHTML = ReplaceAll(accountPageHTML, "[NEWSLETTER_COUNT_DEACTIVETED]", getNewsletterCount(getLOGIN(), False))

        accountPageHTML = replaceTagsForStatistics(accountPageHTML, idnr)
          
        parseTemplateUserIDNR = accountPageHTML
     
    End Function
    
    
    
    
    '*************************************************************************
    ' printAddress
    ' addressType = "LI", "AR", "" basis
    ' showMessages BOOLEAN
    ' returns Lieferschein, Basis or Invoice address as HTML String 
    '*************************************************************************
    Function printAddress(ByVal kdnr As Long, ByVal addressType As String, ByVal showMessages As String, _ 
                          Optional printAll As Boolean = False, Optional showSelectBox As Boolean = false) As String
        Dim rsKUND
        Dim sql As String
        Dim html As String
        Dim message As String = ""

        If addressType = "" Then
            sql = "Select * from ofAdressen where IDNR=" & kdnr
        Else
            sql = "Select * from [ofAdressen-Weitere] where typ= '" & addressType & "' and IDNR=" & kdnr
        End If
        rsKUND = objConnectionExecute(sql)

        'Response.Write showMessages
        If rsKUND.EOF and not printAll Then
            If showMessages Then 'show mesasge 
                message = getTranslation("Die gleiche Adresse wie im Profil.")
            End If
            'printAddress = printAddress(kdnr,"",showMessages)
            'exit function 
            sql = "Select * from ofAdressen where IDNR=" & kdnr
            rsKUND = objConnectionExecute(sql)
        End If
        Dim PLZ As String, Ort As String, Landname As String
        
        html = "<b>" & message & "</b><br/><br/>"
        
        While Not rsKUND.EOF 
            
            PLZ = TableValue("grPLZ", "IDNR", "'" & rsKUND("PLZ").Value & "'", "PLZ")
            Ort = TableValue("grPLZ", "IDNR", "'" & rsKUND("PLZ").Value & "'", "Ort")
            Landname = TableValue("grLand", "IdNr", rsKUND("Land").Value, "Name")

            

            If Trim(rsKUND("Firma").Value & "") <> "" Then
                html = html & rsKUND("Firma").Value & "<br />"
            End If
                    
            html = html & rsKUND("Anrede").Value & " " & rsKUND("Name").Value & " " & rsKUND("Vorname").Value & "<br />"
            html = html & rsKUND("Adresse").Value & " <br />"
            html = html & PLZ & "-" & Ort & " <br />"
            html = html & Landname & " <br />"
            html = html & "Tel: <a href='call:" & rsKUND("Tel").Value & "'>" & rsKUND("Tel").Value & "</a> <br />"
            html = html & "Email: <a href='mailto:" & rsKUND("Email").Value & "'>" & rsKUND("Email").Value & "</a><br />"
            
            If showSelectBox then 
                html = html & "<input type='checkbox' Name='UseOld"& addressType &"' Value='" & rsKUND("ID").Value & "'> ich möchte diese Adresse verwenden"
            End If 
            
            If printAll then 
                html = html & "<hr/>"
            Else 
                Return  html
            End If 
            rsKUND.MoveNext
        End While

        printAddress = html
    End Function

</script>

