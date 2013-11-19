<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'===========================================================================
const ACCOUNT=1
const INVOICE=3
const SHIPPING=2
const PASSWORD_LENGTH = 6 
const STATE_NOT_CONFIRMED_CLIENT = "Neu"
const IDNR_TAG  = "IDNR"



function isLoggedIn()
   isLoggedIn = false   
   if isNumeric(getLOGIN()) then 
      if getLOGIN() > 0 then 
		  isLoggedIn = true 
	  end if 
   end if  
end function 

'*************************************************************************
'AUTHENITFICATION
' Sets the session vars LOG_IN and LAND
' returns the IDNR of client if auth okay
' returns "" if not ok 
'*************************************************************************
function authenticate(Email, Password)
	Dim SQL 
		'Find Client 
		Email = trim(left(Email,50))
		Password = trim(left(Password,16))
		SQL ="SELECT * from ofAdressen Where Status<>'" & STATE_NOT_CONFIRMED_CLIENT & "' and Email = '" & Email & "' AND Passwort = '" & Password  & "'"
		'response.write "<br>" & sql
		dim rsP : set rsP  = objConnectionExecute(sql)
		if rsP.EOF then 
		
		'check if user has an unlocked account 
		SQL ="SELECT * from ofAdressen Where Status='" & STATE_NOT_CONFIRMED_CLIENT & "' and Email = '" & Email & "' AND Passwort = '" & Password  & "'"
		
		set rsP  = objConnectionExecute(sql)
		Dim LoginError 'as string 
		
		if rsP.EOF then 
				LoginError = getTranslation("Das Passwort oder der Name stimmt nicht!") 
		else 'has unlocked account 
				LoginError = getTranslation("Ihr Account ist noch NICHT nicht freigeschalten!") & "<br>"  & _ 
				             getTranslation("Bitte zuerst den Link (in Ihrem Emailprogramm) anklicken fuer Account Aktivierung und dann Anmelden probieren!") & "<br>" & _
				             getTranslation("Wir haben Ihnen gerade Email für Accountaktivierung gesendet!") & "<br>" & _
				             getTranslation("Die Email wurde an :") & getClientEmail(rsP("idnr")) & getTranslation("gesendet!")   
				                            'resend Email with confirmation 
				                            
				  sendMailFromWithSending getClientEmail(rsP("idnr")),  _ 
			        "Ihre Registrierung bei " & VARVALUE("DOMAIN") & "!", _
				    MAKE_EMAIL_REGISTRATION_SIMPLE(rsP("idnr")) , _
				    VARVALUE("EMAIL_REGISTER")
				                            
		end if 
			    authenticate = ""  
			
				Response.Write "<LoginError>" & LoginError & "</LoginError>"
				Response.Write "Sorry! <font color=""#FF0000"">" & LoginError & "</font>" &_ 
									"<br><font color=black>" & getTranslation("Benutzen Sie unbedingt die Zurueck Schaltflaeche um Ihre Eingaben nicht zu verlieren!")  & "</font>" & _ 
									"<br> <a href='javascript:window.back()'>" & getTranslation("Zurueck") & "</a>"		
			    
			    exit function 
				
		end if
		authenticate = rsP("IDNR")
		Session("LOG_IN")=authenticate
		'Session("LAND") = getClientLand(authenticate) 
		Session("LAND") = getClientDestinationLand(authenticate) 
		'update session
		sql = "update webSessions set kundenIdnr=" & rsP ("IDNR") & " where SID=" & getSid() 
		objConnectionExecute(sql)
        response.Write "<!--<" &  IDNR_TAG & ">" & rsP("IDNR") & "</" & IDNR_TAG & ">-->" 'write this for services parcing 
	rsP.close
end function 


'**********************************************************************************
' Save User Profile to the DB 
' returns the number of the saved ofaddressen
' typeOfAddress - (1)main adress, (2)shipping address, (3)invoice address
' showForm - the requester can accuire form or not 
'**********************************************************************************

function saveProfile(typeOfAddress)
Dim showForm : if lcase(request("showForm") = "false" ) then showForm = false else showForm = true 
'response.write "Saving address...type:" & typeOfAddress
saveProfile = 0
Dim tableName : tableName = "ofAdressen"

if typeOfAddress = SHIPPING or typeOfAddress=INVOICE then tableName = "[ofAdressen-Weitere]"

Dim rsPLZORT, sql, rs
Dim Anrede, Titel, Firma, Name, Strasse, PLZ, Ort, Email, Tel, Passwort, PasswortII, Land, TelII, Geburtstag, Vorname
Dim Mobil, Fax, Web, Branche
Dim IchWillNewsletter
Dim UID 

Firma    = Request("Firma"&typeOfAddress ): if trim(Firma)="" then Firma = " "
Name     = Request("Name"&typeOfAddress )
Vorname  = Request("Vorname"&typeOfAddress )
Anrede   = Request("Anrede"&typeOfAddress )
Titel    = Request("Titel"&typeOfAddress )
Strasse  = Request("Strasse"&typeOfAddress )
PLZ      = Request("PLZ"&typeOfAddress ) : PLZ = left(PLZ, 26)
Ort      = Request("Ort"&typeOfAddress )
Email    = Request("Email"&typeOfAddress )   
Tel      = Request("Tel"&typeOfAddress )     

Mobil    = Request("Mobil"&typeOfAddress )   
Fax      = Request("Fax"&typeOfAddress )   
Web      = Request("Web"&typeOfAddress )   

TelII    = Request("TelII"&typeOfAddress ) : if TelII =""  then TelII="x" 

Passwort = Request("Passwort"&typeOfAddress )
PasswortII = Request("PasswortII"&typeOfAddress )

Land	 = Request("land"&typeOfAddress ): if len(land)=0 then land = varvalue("DEFAULT_LAND_NR")
Geburtstag = Request("Geburtstag"&typeOfAddress ): if len(Geburtstag)<>10 then Geburtstag = "01.01.1900"

Branche = Request("Branche"&typeOfAddress ): if not isnumeric(branche) then branche = 0

IchWillNewsletter = request("IchWillNewsletter"&typeOfAddress)

UID = request("UID"&typeOfAddress)


'make log entry 
dim logLine: logLine = Email & "; " & Vorname & " " & Name & "; " & PLZ & "-" & Ort
call writeLog("saveProfile.log",logLine)
if typeOfAddress =SHIPPING or typeOfAddress =INVOICE then 
     if Email = "" then Email="x"
     if Tel = ""  then Tel="x"  
     if Passwort = "" then Passwort="xxxxxx"
     if PasswortII = "" then PasswortII="xxxxxx"
end if 
 
'retain umlaute da einige seiten decoding machen 
	Firma      = retainUmlaute(Firma)
	Name       = retainUmlaute(Name)
	Vorname    = retainUmlaute(Vorname)
	Strasse    = retainUmlaute(Strasse)
	Ort        = retainUmlaute(Ort)
'end retain  
  
'check data 
if Name = "" or Vorname = "" or Strasse = "" or PLZ = "" or Ort = "" or Land = ""  or Anrede = "" _
   or Email = ""  or Tel = ""  or Passwort = "" then 
		if typeOfAddress = ACCOUNT or _
		  (Name<>"" and (typeOfAddress = SHIPPING or typeOfAddress = INVOICE)) then ' only for the first address
            %>
			<font id="ErrorMessage" color="red"><b><%=getTranslation("Bitte fuellen Sie alle mit * gekennzeichneten Felder aus!")%></b><br></font>
			<%
			'if showForm then 
			if showForm then call drawEmptyProfileForm(typeOfAddress, true)
			end if 
		exit function 
end if 
'check tel 


'check tel nr 
if typeOfAddress = ACCOUNT then 
	if not checkTELNR(Tel) then 
	   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Ungueltige TelNr!?!")%></b><br></font>
	   <%
	   		if showForm then call drawEmptyProfileForm(typeOfAddress, true)
			exit function 
	end if 
end if 


if typeOfAddress = ACCOUNT then 
    'check email 
	if not EMailCheck(Email) then 
	   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Ungueltige Email Adresse!?!")%></b><br></font>
	   <%
	   		if showForm then call drawEmptyProfileForm(typeOfAddress, true)
			exit function 
	end if 

    'check only when new account 
    if getLOGIN()= "" then 'NEW ACCOUNT 
						'check passwort 
						if  Passwort<>PasswortII then 
						   
						   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Die Passwortbestaetigung stimmt nicht!")%></b><br></font>
						   <%
						   		if showForm then call drawEmptyProfileForm(typeOfAddress, true)
								exit function 
						end if 

						'check passwort length
						if len(Passwort)<PASSWORD_LENGTH then 
						   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Das Passwort muss " & PASSWORD_LENGTH & " Zeichen lang sein!")%></b><br></font>
						   <%
						   		if showForm then call drawEmptyProfileForm(typeOfAddress, true)
								exit function 
						end if 
	
	
						'check is password was used already 
						Dim accountUsed: accountUsed = false

						if getLOGIN() = "" and typeOfAddress=ACCOUNT then ' WE HAVE NEW ACOCUNT 
						sql  = "select * from ofAdressen where Email like '" & Email & "'" '  and Passwort like '" & Passwort & "'" 
						set rs = objConnectionExecute(SQL)
						if not rs.eOF then 'password used 
						    accountUsed=true
						end if 
						end if    
 
						if accountUsed then  %>
								<font id="ErrorMessage" color="red">
								<b><%=getTranslation("Diese von Ihnen angegebe Emailadresse ist bereits vorhanden!")%> 
								   <%'=getTranslation("Hinweis: Bitte mit Email und Passwort anmelden um &Auml;nderungen vorzunehmen!")%></b><br>
								</font>
								  <%
								if showForm then call drawEmptyProfileForm(typeOfAddress, true)
								exit function   
						end if 
		end if 'NEW ACCOUNT 				  
end if 

 'create newsletter registration
  if lcase(IchWillNewsletter) = "on" then 
			call registerForNewsletter(Email, "Standart")	
  end if 	

'Find PLZ, ORT
Dim NextIDNRPLZ :  NextIDNRPLZ = getPLZ(Land, Ort, PLZ)

Dim typ : typ = getTyp(typeOfAddress)
'PROFILE UPDATE
if getLOGIN()<> "" then ' WE HAVE UPDATE OR NEW ADDITIONAL ADDRESS 
			Dim idnrToUpdate : idnrToUpdate = getLOGIN()
			   'if typeOfAddress = 2 then ' take the next idnr 
			   '   idnrToUpdate = TABLEVALUE("ofAdressen","idnr", idnrToUpdate , "nextIDNR")      
			   'end if
			   
			     'check if the second address is existing 
                  
				  dim additionalWhere : 
				  
				  if typeOfAddress <> ACCOUNT then 
				    additionalWhere =" AND typ= '" & typ & "'" 
				  end if 
				  		
			      sql = "SELECT * FROM " & tableName & " where IDNR=" & idnrToUpdate & additionalWhere 
			      Dim rsUPDT  
			      set rsUPDT  = objConnectionExecute(SQL)      
			      if rsUPDT.EOF THEN 'the second address is not existing for example 
			     	    dim NextIDNR : NextIDNR = getLOGIN()
			   	     	SQL = " INSERT INTO " & tableName & " (IDNR, Anrede, Titel, Firma, Name, Vorname, Adresse, PLZ, Ort,  Email, Web, Tel, Tel2, Passwort ,Land, Branche, Geburtstag, Typ, UID) " & _ 
					          " VALUES (" & NextIDNR & ",'" & Anrede & "','" & Titel & "', '" & Firma & "','" & Name & "','" & Vorname & "','" & Strasse & "','" & _ 
					            NextIDNRPLZ  & "','" &  Ort & "','" &  Email & "','x','" & Tel & "','" & TelII & "','" & Passwort  & "', " & Land & "," & Branche & "," & makeSQLDate(Geburtstag) & ",'" & typ & "','" & UID  & "')"  
						objConnectionExecute(SQL) 		
						saveProfile =    NextIDNR 
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
						
						
						exit function 
			      end if 
			     'end check  
                 
				'Update profile
				dim where 
				where ="IDNR = " & idnrToUpdate
				if typeOfAddress <> ACCOUNT then
				   where = " ID=" & rsUPDT("ID")  
				end if  
				SQL = " UPDATE " & tableName & " Set Anrede = '" & Anrede & "', Titel = '" & Titel & "', " & _ 
				      " Firma = '" & Firma & "', Name = '" & Name & "', VorName = '" & VorName & "', Adresse = '" & Strasse & "', Plz = '" & NextIDNRPLZ & "', Ort = '" & Ort & "'" & _
					  " , Land = " & Land & ", Email = '" & Email & "', Tel = '" & Tel & "', Tel2 = '" & TelII & "' " & _ 
					  " , Web = '" & Web & "', Mobil = '" & Mobil & "', Fax = '" & Fax & "', Branche=" & Branche & ", UID = '" & UID & "' WHERE " & where 
				'Response.Write "SQL:" & SQL: Response.Flush
				'Response.Flush
				objConnectionExecute(SQL)
				saveProfile = idnrToUpdate 
				if typeOfAddress = 1 then 
				        'bitte html comment nicht ändert da es als function result ausgelesen wird
						%>
						<!--USERACCOUNTUPDATE_OK[<%=idnrToUpdate%>]
						<IDNR><%=idnrToUpdate%></IDNR>
						-->
						<h3 align="center">
						 <%=getTranslation("Vielen Dank! Ihre Daten wurden erfolgreich geändert.")%>
						 </h3   >
						 <p align=center>
						 <a href="default.asp?pageToShow=MyAccount"><%=getTranslation("Weiter zum Konto")%></a>
						 </p>
					    <%
					    
			   end if
else ' NEW ACCOUNT
     saveProfile =  createNewAdress(typeOfAddress, NextID("ofAdressen", "IDNR"),Firma, Anrede, Name, Vorname, Strasse, NextIDNRPLZ, Email, _ 
                      Passwort,Land, Tel, TelII, Geburtstag, Titel, "Kunde", Mobil, Fax, Web, Branche, UID) 
end if
end function 



function saveProfileSimple(typeOfAddress)
'response.write "Saving address...type:" & typeOfAddress
saveProfileSimple = 0
Dim tableName : tableName = "ofAdressen"

if typeOfAddress = SHIPPING or typeOfAddress=INVOICE then tableName = "[ofAdressen-Weitere]"

Dim rsPLZORT, sql, rs
Dim Anrede, Firma, Name, Strasse, PLZ, Ort, Email, Tel, Passwort, PasswortII
Dim Land, TelII, Geburtstag, Vorname, Titel, Branche

Firma    = "x" 'Request("Firma"&typeOfAddress ): if trim(Firma)="" then Firma = "-"
Name     = "x" 'Request("Name"&typeOfAddress )
Vorname  = "x" 'Request("Vorname"&typeOfAddress )
Anrede   = "x" 'Request("Anrede"&typeOfAddress )
Titel    = "x" 'Request("Titel"&typeOfAddress )
Strasse  = "x" 'Request("Strasse"&typeOfAddress )
PLZ      = "0" 'Request("PLZ"&typeOfAddress )
Ort      = "Ort" 'Request("Ort"&typeOfAddress )
Email    = Request("Email"&typeOfAddress )   
Tel      = "0" 'Request("Tel"&typeOfAddress )     
TelII    = "0" 'Request("TelII"&typeOfAddress ) : if TelII =""  then TelII="x" 
Passwort = Request("Passwort"&typeOfAddress )
PasswortII = Request("PasswortII"&typeOfAddress )
Land	 = Request("land"&typeOfAddress ): if len(land)=0 then land = varvalue("DEFAULT_LAND_NR")
Geburtstag = Request("Geburtstag"&typeOfAddress ): if len(Geburtstag)<>10 then Geburtstag = "01.01.1900"
Branche	 = Request("Branche"&typeOfAddress ): if not isNumeric(Branche) then Branche = 0

'Name = Email
 
 
'check data 
if Name = "" or Vorname = "" or Strasse = "" or PLZ = "" or Ort = "" or Land = ""  or Anrede = "" _
   or Email = ""  or Tel = ""  or Passwort = "" then 
		if typeOfAddress = ACCOUNT or _
		  (Name<>"" and (typeOfAddress = SHIPPING or typeOfAddress = INVOICE)) then ' only for the first address
				
           %>
			<font id="ErrorMessage" color="red"><b><%=getTranslation("Bitte füllen Sie alle mit * gekennzeichneten Felder aus!")%></b><br></font>
			<%
			call drawEmptyProfileFormSimple(typeOfAddress, true)
			end if 
		exit function 
end if 


if typeOfAddress = ACCOUNT then 
    'check email 
	if not EMailCheck(Email) then 
	   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Ung&uuml;ltige Email Adresse!?!")%></b><br></font>
	   <%
	   		call drawEmptyProfileFormSimple(typeOfAddress, true)
			exit function 
	end if 

    'check onle when new account 
    if getLOGIN()= "" then 'NEW ACCOUNT 
						'check passwort 
						if  Passwort<>PasswortII then 
						   
						   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Die Passwortbest&auml;tigung stimmt nicht!")%></b><br></font>
						   <%
						   		call drawEmptyProfileFormSimple(typeOfAddress, true)
								exit function 
						end if 

						'check passwort length
						if len(Passwort)<PASSWORD_LENGTH then 
						   %><font id="ErrorMessage" color="red"><b><%=getTranslation("Das Passwort muss " & PASSWORD_LENGTH & " Zeichen lang sein!")%></b><br></font>
						   <%
						   		call drawEmptyProfileFormSimple(typeOfAddress, true)
								exit function 
						end if 
	
	
						'check is password was used already 
						Dim accountUsed: accountUsed = false

						if getLOGIN() = "" and typeOfAddress=ACCOUNT then ' WE HAVE NEW ACOCUNT 
						sql  = "select * from ofAdressen where Email like '" & Email & "'" '  and Passwort like '" & Passwort & "'" 
						set rs = objConnectionExecute(SQL)
						if not rs.eOF then 'password used 
						    accountUsed=true
						end if 
						end if    
 
						if accountUsed then  %>
								<font id="ErrorMessage" color="red">
								<b><%=getTranslation("Die von Ihnen angegebene Emailadresse wurde bereits verwendet!")%></b><br>
								</font>
								  <%
								call drawEmptyProfileFormSimple(typeOfAddress, true)
								exit function   
						end if 
		end if 'NEW ACCOUNT 			
end if 'ACCOUNT


'Find PLZ, ORT
Dim NextIDNRPLZ :  NextIDNRPLZ = getPLZ(Land, Ort, PLZ)

Dim typ : typ = getTyp(typeOfAddress)
'PROFILE UPDATE
if getLOGIN()<> "" then ' WE HAVE UPDATE 
				  Dim idnrToUpdate : idnrToUpdate = getLOGIN()
				  dim additionalWhere  
				  
				  if typeOfAddress <> ACCOUNT then 
				    additionalWhere =" AND typ= '" & typ & "'" 
				  end if 
				  		
			      sql = "SELECT * FROM " & tableName & " where IDNR=" & idnrToUpdate & additionalWhere 
			      Dim rsUPDT  
			      set rsUPDT  = objConnectionExecute(SQL)      
			      if rsUPDT.EOF THEN 'the second address is not existing for example 
			     	    dim NextIDNR : NextIDNR = getLOGIN()
			   	     	SQL = " INSERT INTO " & tableName & " (IDNR, Anrede, Titel, Firma, Name, Vorname, Adresse, PLZ, Email, Web, Tel, Tel2, Passwort ,Land, Branche, Geburtstag, Typ) " & _ 
					          " VALUES (" & NextIDNR & ",'" & Anrede & "','" & Titel & "','" & Firma & "','" & Name & "','" & Vorname & "','" & Strasse & "'," & _ 
					          "'" &  NextIDNRPLZ  & "','" &  Email & "','x','" & Tel & "','" & TelII & "','" & Passwort  & "', " & Land & "," & Branche & "," & makeSQLDate(Geburtstag) & ",'" & typ & "')"  
						objConnectionExecute(SQL) 		
						saveProfile =    NextIDNR 
						'add LI or AR
						'response.write sql 
						exit function 
			      end if 
			     'end check  
                 
				'Update profile
				dim where 
				where ="IDNR = " & idnrToUpdate
				if typeOfAddress <> ACCOUNT then
				   where = " ID=" & rsUPDT("ID")  
				end if  
				SQL = " UPDATE " & tableName & " Set Anrede = '" & Anrede & "', Titel = '" & Titel & "', Firma = '" & Firma & "', Name = '" & Name & "', VorName = '" & VorName & "', Adresse = '" & Strasse & "', Plz = '" & NextIDNRPLZ & _
					  "' , Land = " & Land & ", Email = '" & Email & "', Tel = '" & Tel & "', Tel2 = '" & TelII & "', Branche=" & Branche & " WHERE " & where 
				'Response.Write "SQL:" & SQL: Response.Flush
				'Response.Flush
				objConnectionExecute(SQL)
				saveProfileSimple = idnrToUpdate 
				if typeOfAddress = 1 then 
						%><h2 align="center">
						  <%=getTranslation("Vielen Dank! Ihre Daten wurden erfolgreich ge&auml;ndert.")%>
						 </h2>
						 <p align=center>
						 <a href="default.asp?pageToShow=MyAccount"><%=getTranslation("Weiter zum Konto")%></a>
					    <%
					    
			   end if
else ' NEW ACCOUNT
     saveProfileSimple =  createNewAdress(typeOfAddress &"_simple", NextID("ofAdressen", "IDNR"), Firma, Anrede, Name, Vorname, Strasse,NextIDNRPLZ, Email, _ 
                                          Passwort,Land, Tel, TelII, Geburtstag, Titel, STATE_NOT_CONFIRMED_CLIENT,"x","x","x",Branche, UID) 
end if
end function 


function getTyp(typeOfAddress) 
   getTyp= "LI"
	if typeOfAddress = INVOICE then 
		getTyp = "AR" 
	end if 				
end function


'help function 
function createNewAdress(typeOfAddress, Idnr, Firma, Anrede, Name, Vorname, Strasse, NextIDNRPLZ, Email, _ 
                         Passwort, Land ,Tel, TelII, Geburtstag, Titel, Status, Mobil, Fax, Web, BrancheNr, UID)
Dim tableName : tableName = "ofAdressen"
if typeOfAddress = SHIPPING or typeOfAddress=INVOICE then tableName = "[ofAdressen-Weitere]"

			'response.write "LoG=" & Session ("LOG_IN")
			'Response.End 
			    Dim NextIDNR: NextIDNR = NextID("ofAdressen", "IDNR")
				'Create new
				'PROFILE NEW 
				SQL = " INSERT INTO " & tableName & " (IDNR, Firma, Anrede, Status, Titel, Name, Vorname, Adresse, PLZ, Email, Tel, Tel2, Passwort ,Land, Branche, AngelegtAn, Mobil, Fax, Web, UID) " & _ 
					   "Values (" & NextIDNR & ",'" & Firma & "','" & Anrede  & "', '" & Status  & "', '" & Titel  & "', '" & Name & "', '" & Vorname & "','" & Strasse & "','" & NextIDNRPLZ  & "','" &  Email & "','" & Tel & "','" & _
					   TelII & "','" & Passwort  & "', " & Land & "," & BrancheNr & "," & SQLNOW(0) & ",'" & Mobil & "','" & Fax & "','" & Web & "','" & UID & "')"  
				call writeLog ("createNewAdress.log", SQL)
				objConnectionExecute(SQL)
			    
			    'set Burthday in separate query to be sure that the rest data is saved 
				SQL = " UPDATE " & tableName & " SET Geburtstag = " & makeSQLDate(Geburtstag) & " WHERE IDNR=" & NextIDNR  
				call writeLog ("createNewAdress.log", SQL)
				objConnectionExecute(SQL)
				
				'Adressen Settings einfügen 
			    SQL = " INSERT INTO  [ofadressen-settings] (IDNR, Kundengruppe, Preisliste, language_code ) " & _ 
					   "Values (" & NextIDNR & ",'" & VARVALUE_DEFAULT("SHOP_DEFAULT_KUNDENGRUPPE","Online") & "','" & VARVALUE_DEFAULT("SHOP_DEFAULT_PREISLISTE","1-Letztverbraucher")  & "', 'DEU')"  
				call writeLog ("createNewAdress.log", SQL)
				objConnectionExecute(SQL)
			 		   
			   	
				if typeOfAddress = ACCOUNT and Session("SEND_REGISTRATION_MAIL") <> "FALSE" then 
					'SEND REGISTRATION EMAIL 
					response.write "SENDING... "								
					sendMailFromWithSending Email,  "Ihre Registrierung bei " & VARVALUE("DOMAIN") & "!", MAKE_EMAIL_REGISTRATION(NextIDNR) , VARVALUE_DEFAULT("EMAIL_REGISTER","register@domain.com")
					'send email to the fax or email 
					sendMailFromWithSending VARVALUE_DEFAULT("EMAIL_REGISTER","register@domain.com"), VARVALUE_DEFAULT("FAX_REGISTER","480-393-4348"), MAKE_EMAIL_REGISTRATION(NextIDNR),  VARVALUE_DEFAULT("EMAIL_FAX_GATEWAY", "faxout@faxthruemail.com")
					response.write " OK!"
				 end if    
				
			   createNewAdress = NextIDNR 
			   
			
			   
			   if typeOfAddress = ACCOUNT then 
			   'bitte html comment nicht ändert da das XML es als function result ausgelesen wird
					    %>
						<!--<USERACCOUNTCREATE_OK><IDNR><%=NextIDNR%></IDNR></USERACCOUNTCREATE_OK>-->
					    <!--
					   <h2 align="center"><%=getTranslation("Vielen Dank! Ihre Daten wurden erfolgreich gespeichert.")%></h2>
					   -->
					   <br>					
					   <%=getTranslation("Herzlich willkommen bei")%>&nbsp;<%=VARVALUE_DEFAULT("DOMAIN","www.yourdomain.com")%>!
					   <br>
					   <%=getTranslation("Sie sind neu angemeldet als:")%>&nbsp;<%=Email%><br>
					   <%=getTranslation("In Kürze werden Sie eine Anmeldebestätigung per E-Mail erhalten!")%>
					   <br><br><br>
					   <%=fixRelativeImageLinks(readTextFile(Server.MapPath("skins/skin" & SkinNumber & "/pages/newsletterForm.htm")))%>
					   <br><br><br>
					   <a href="default.asp?pageToShow=MyAccount"><%=getTranslation("Weiter zum Konto")%></a>
					   <br><br><br>
					   <%
			   end if     
end function 



'**********************************************************************************
' returns the idnr of the  first saved address 
function saveBothAddresses()
  Dim idnr1, idnr2, idnr3
  'do not send mail if referer is going to be registered
  if request("refererId") <> "" then Session("SEND_REGISTRATION_MAIL") = "FALSE" 

   'response.write "save both addresses.."
 	
 	'make form if error in saving 
 '% >
 '</form>
 '			<form method="POST" action="default.asp">
 '			<input type="hidden" name="pageToShow" value="ProfileSave">
 '< %
 	idnr1 = saveProfile(ACCOUNT)
 	if idnr1<=0 then 'not saved then 
 	     saveBothAddresses=0
 	     '% >
 	      ' <p align=center><input type="submit" value="Neu Speichern" name="B1"></p>
          ' </form>
         '< %
 	     exit function 
   else 
      Response.Write "</form>"' eliminate form for any case 
 	end if 
 	
 	Session("LOG_IN") = idnr1
 	idnr2 = saveProfile(SHIPPING)
 	idnr3 = saveProfile(INVOICE)
 	'call connectAddresses (idnr1 , idnr2 )
	saveBothAddresses = idnr1
	
	   'create newsletter insert
		if lcase(request("IchWillNewsletter1")) = "on" then 
			call registerForNewsletter(request("Email1"), "Standart")	
		end if 	

		'added for the module module_ref
		if request("refererId")<> "" then 
			dim sql: sql = "Insert into webReferers (IDNR, refererId) Values (" & idnr1 & "," & request("refererId") & ")"
			'Response.Write "<br>sql=" & sql
			objConnectionExecute(SQL)
			Response.Write "<br>Referer #" & request("refererId") & " was created!"
		end if 
	
		'redirect to warencorb    
		if calculateWarenkorbSum()>0 then 
			Response.Write "<a href=""default.asp?PageToShow=Warenkorb"">zum Warenkorb</a>" 
			Response.Redirect "default.asp?pageToShow=warenkorbStep2" 
		end if    
					
end function 


'**********************************************************************************
' connect addresses
' typeOfAddress - (1)main adress, (2)shipping address
'**********************************************************************************
function connectAddresses(idnr1, idnr2)
dim sql
  if idnr1 = "" or idnr2="" then exit function 
   sql = "UPDATE ofAdressen set nextIDNR=" & idnr2 & " WHERE IDNR=" & idnr1
   objConnectionExecute(sql)
   
end function 

'**********************************************************************************
' drawEmptyProfileForm
' typeOfAddress - (1)main adress, (2)shipping address, (3) invoice address
'withCheck - Boolean, if TRUE then the oblig. fields are checked
'**********************************************************************************
function drawEmptyProfileForm(typeOfAddress, withCheck)
Dim rsR
Dim rsC
Dim fill:fill = False
Dim sql


Dim tableName : tableName = "ofAdressen"
if typeOfAddress = INVOICE or typeOfAddress = SHIPPING  then tableName = "[ofAdressen-Weitere]"

	
	if getLOGIN() <> "" then 
			fill = True
			Dim idnrToDraw: idnrToDraw = getLOGIN()
		
			SQL = "SELECT " & tableName & ".*, grPLZ.Ort AS PLZORT, grPLZ.PLZ as PLZPLZ , grLand.Name AS CNTRY, grPlz.BLand as Bland " & _
				  "FROM " & tableName & " INNER JOIN (grPLZ INNER JOIN grLand ON grPLZ.Land = grLand.IdNr) " & _
				  "ON " & tableName & ".PLZ=grPLZ.IDNR WHERE " & tableName & ".IDNR= " & idnrToDraw 
			
			if typeOfAddress = INVOICE or typeOfAddress = SHIPPING  then 
			   SQL = SQL & " and Typ ='" & getTyp(typeOfAddress) & "'"	
			end if       
			'Response.Write sql : Response.Flush
			set rsR  = objConnectionExecute(sql)
			if rsR.EOF then fill = false 
	End if
	
	
	Dim firma, name, vorname, strasse, plz, ort, tel, telII, passwort, passwortII,  Email
    Dim Geburtstag, Anrede, Land, Titel, Emailwiederholung, Fax, Mobil, Web
	Dim Bundesland
    Dim UID

	if fill then firma=rsR("Firma") else firma=request("Firma" & typeOfAddress)
    if fill then UID=rsR("UID") else UID=request("UID" & typeOfAddress)

	if fill then name=rsR("name") else name=request("Name" & typeOfAddress)
	if fill then Vorname=rsR("Vorname") else vorname=request("Vorname" & typeOfAddress)
    if fill then Anrede=rsR("Anrede") else Anrede=request("Anrede" & typeOfAddress)
    
    if fill then Titel=rsR("Titel") else Titel=request("Titel" & typeOfAddress)

	if fill then strasse=rsR("Adresse") else strasse=request("strasse" & typeOfAddress)
	if fill then plz=rsR("plzplz") else plz=request("plz" & typeOfAddress)
	if fill then ort=rsR("plzort") else ort=request("ort" & typeOfAddress)
	if fill then BundesLand=rsR("BLAND")  else BundesLand=request("BundesLand" & typeOfAddress)
	if fill then Land=rsR("Land")  else Land=request("Land" & typeOfAddress)
	
	if fill then tel=rsR("tel") else tel=request("tel" & typeOfAddress)
    if fill then telII=rsR("tel2") else telII=request("telII" & typeOfAddress)
    
    if fill then Fax=rsR("Fax") else telII=request("Fax" & typeOfAddress)
    if fill then Mobil=rsR("tel2") else telII=request("Mobil" & typeOfAddress)
    
    if fill then Web=rsR("Web") else telII=request("Web" & typeOfAddress)
    
    if fill then Email=rsR("Email") else Email=request("Email" & typeOfAddress)
    Emailwiederholung=request("Emailwiederholung" & typeOfAddress)
    
	if fill then passwort=rsR("passwort") else passwort=request("passwort" & typeOfAddress)
	if fill then passwortII=rsR("passwort") else passwortII=request("passwortII" & typeOfAddress)
	
	if fill then Geburtstag=rsR("Geburtstag") else Geburtstag=request("Geburtstag" & typeOfAddress)
	Geburtstag  = makeStringDate(Geburtstag)
	
	if Name = "" and Strasse = "" and PLZ = "" and Ort = "" or Land = "" and _
	  (typeOfAddress=2 or typeOfAddress=3) then 
	   withCheck = false
	end if
%>
<br>
<br>
<center>
<table Id="ProfileTable" width="450"  border="1" cellspacing="3" cellpadding="3" bordercolor="#CCCCCC" style="border-collapse: collapse" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" bgcolor="#F3F3F3">

<input type="hidden" name="Branche<%=typeOfAddress%>" value="0"><!-- simple account  -->

  <%if typeOfAddress = ACCOUNT then %>
  <tr><th colspan=3 align=center width="100%" bgcolor="#FFCF00" height="18">
  &nbsp;<%=getTranslation("Anmeldeinformation")%>
  </th></tr>
  
  <tr>
    <td align="right" width="150"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Email")%>&nbsp;&nbsp; </font></span></td>
    <td><font ><font size="1"><b>&nbsp;<input type="text" name="Email<%=typeOfAddress%>" size="20" value="<%=Email%>">
        <%if withCheck and len(Email)<5 then %></b></font><b><font size="1" id="ErrorMessage" color="red">(!)</a><%end if%>
    </font></b></font>
    </td>
  </tr>

  <tr>
    <td align="right" width="150"><span style="font-weight: 400">
    <font  size="1">* <%=getTranslation("Emailwiederholung")%>&nbsp;&nbsp; </font></span></td>
    <td> &nbsp;<input type="text" name="Emailwiederholung<%=typeOfAddress%>" size="20" value="<%=Emailwiederholung%>">
        <%if withCheck and len(Emailwiederholung)<5 then %></b></font><b><font size="1" id="ErrorMessage" color="red">(!)</a><%end if%>
    </td>
  </tr>
    
  <tr>
 <%if not fill then%>
  <tr>
    <td align="right" width="103">&nbsp;</td>
    <td> &nbsp;</td>
  </tr>

  <tr>
    <td align="right"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Passwort")%>&nbsp;&nbsp; </font></span></td>
    <td>&nbsp;<input type="password" name="Passwort<%=typeOfAddress%>" size="20">
     <%if withCheck and len(Passwort)<PASSWORD_LENGTH then %></b></font><b><font size="1" id="ErrorMessage" color="red">(!)</a><%end if%>
     <%=getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")%>
    </td>
  </tr>

  <tr>
    <td align="right"><span style="font-weight: 400">
    <font  size="1">*<%=getTranslation("Passwortbest&auml;tigung")%>&nbsp;&nbsp; </font></span></td>
    <td>&nbsp;<input type="password" name="PasswortII<%=typeOfAddress%>" size="20">
     <%if withCheck and len(PasswortII)<PASSWORD_LENGTH then %></b></font><b><font size="1"  id="ErrorMessage" color="red">(!)</a><%end if%>
     <%=getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")%>
     <br/>
     <%=getTranslation("Tipp: ''%'' und ''*'' sind als Sonderzeichen nicht erlaubt!")%>
    </td>
  </tr>

  <% else  %>

  
  <tr>
    <td colspan=2  align="center" width="350"><span style="font-weight: 400">
    <font size="1"><%=getTranslation("To Change Password Click")%> <a href=default.asp?PageToShow=ChangePassword>HERE</a>!</font></span></td>
      <input type="hidden" name="Passwort<%=typeOfAddress%>" size="20" value="<%=Passwort%>">
      <input type="hidden" name="PasswortII<%=typeOfAddress%>" size="20" value="<%=PasswortII%>">
  </tr>
  <%end if%>
  <%end if %>
</table>
&nbsp; <br/>
<table Id="ProfileTable" border="1" cellspacing="1" style="border-collapse: collapse" cellpadding="3" width="450" bgcolor="#F3F3F3" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
  <input type="hidden" name="Redirection" value="<%=Request("Redirection")%>">
  <tr>
    <th colspan="3">
  <%if typeOfAddress= 1 then %><%=getTranslation("Ihr Account")%><br/><%end if%> 
  <%if typeOfAddress= 2 then %><%=getTranslation("Lieferadresse")%><br/><%=getTranslation("(nur wenn Lieferadresse vom Account abweicht)")%><%end if%> 
  <%if typeOfAddress= 3 then %><%=getTranslation("Rechnungsadresse")%><br/><%=getTranslation("(nur wenn Rechnungsadresse vom Account abweicht)")%><%end if%>
  </th></tr>
  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" ><%=getTranslation("Firma")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="Firma<%=typeOfAddress%>" size="20" value="<%=Firma%>"></td>
  </tr>

  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" ><%=getTranslation("UID")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="UID<%=typeOfAddress%>" size="20" value="<%=UID%>"></td>
  </tr>

  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("Anrede")%>&nbsp;&nbsp; </font></span></td>
    <td width="281" ><font  size="1">
    <select name="Anrede<%=typeOfAddress%>" size="1">
    <Option><%=anrede%></option>
    <Option><%=getTranslation("Frau")%></option>
    <Option><%=getTranslation("Herr")%></option>
    </select>
    <%if withCheck and len(Anrede)<3 then %><font color=red>(!)</font><%end if%>
    </font>
    </td>
  </tr>
 
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" > <%=getTranslation("Titel")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="Titel<%=typeOfAddress%>" size="20" value="<%=Titel%>">
    </td>
  </tr>
  <tr>
   
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Name")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="Name<%=typeOfAddress%>" size="20"  value="<%=name%>">
    <%if withCheck and len(Name)<3 then %><font color=red>(!)</font><%end if%>
    </td>
  </tr>
  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("Vorname")%>&nbsp;&nbsp; </font></span></td>
    <td><font  size="1"><input type="text" name="Vorname<%=typeOfAddress%>" size="20"  value="<%=vorname%>">
    <%if withCheck and len(vorName)<3 then %><font color=red>(!)</font><%end if%>
    </font>
    </td>
  </tr>
  
  <% if typeOfAddress = ACCOUNT then %>
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" ><%=getTranslation("Geburtstag")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="Geburtstag<%=typeOfAddress%>" size="20"  value="<%=Geburtstag%>">DD.MM.YYYY
    <%if withCheck and len(Geburtstag)<3 then %><%end if%>
    </td>
  </tr>
  <%end if %>
  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("Strasse / Nr.")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="Strasse<%=typeOfAddress%>" size="20" value="<%=Strasse%>">
    <%if withCheck and len(Strasse)<3 then %><font color=red>(!)</font><%end if%>
    </td>
  </tr>
  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("PLZ / Ort")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="PLZ<%=typeOfAddress%>" size="6" value="<%=PLZ%>">
    <%if withCheck and len(PLZ)<4 then %><font color=red>(!)</font><%end if%>
    <input type="text" name="Ort<%=typeOfAddress%>" size="20" value="<%=ORT%>">
    <%if withCheck and len(Ort)<2 then %><font color=red>(!)</font><%end if%>
    </td>
  </tr>

<!--
    <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("Bundesland")%>&nbsp;&nbsp; </font></span></td>
	<td>
		<select name="BundesLand<%=typeOfAddress%>">
         <%call selectBundesLand(fill, bundesland)%> 
         </select> 
         <%if withCheck and len(bundesland)<1 then %><font color=red>(!)</font><%end if%>       
	</td>
  </tr>
  -->
  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1" >* <%=getTranslation("Land")%>&nbsp;&nbsp; </font></span></td>
	<td>
		<select name="Land<%=typeOfAddress%>">
         <%call selectLand(fill,land)%> 
         </select> 
         <%if withCheck and len(land)<1 then %><font color=red>(!)</font><%end if%>
         <% 'Response.Write "DEFAULT_LAND_NR=" & varValue("DEFAULT_LAND_NR")%>        
	</td>
  </tr>
  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Tel")%>&nbsp;&nbsp; </font></span></td>
    <td><input type="text" name="Tel<%=typeOfAddress%>" size="20"   value="<%=Tel%>">
    <%if withCheck and len(Tel)<5 then %><font color=red>(!)</font><%end if%>
    </td>
  </tr>


<%if not typeOfAddress = ACCOUNT then %>
  <tr>
    <td align="right" width="150"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Email")%>&nbsp;&nbsp; </font></span></td>
    <td><font ><font size="1"><b>&nbsp;<input type="text" name="Email<%=typeOfAddress%>" size="20" value="<%=Email%>">
        <%if withCheck and len(Email)<5 then %></b></font><b><font size="1" id="ErrorMessage" color="red">(!)</a><%end if%>
    </font></b></font>
    </td>
  </tr>
  <%end if%>
    
  
<%if typeOfAddress = ACCOUNT then %>  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1"><%=getTranslation("Tel(abend)")%>&nbsp;&nbsp; </font></span></td>
    <td width="281"><input type="text" name="TelII<%=typeOfAddress%>" size="20"   value="<%=TelII%>">
    </td>
  </tr>
<%end if%>


<%if typeOfAddress = ACCOUNT then %>  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1"><%=getTranslation("Fax")%>&nbsp;&nbsp; </font></span></td>
    <td width="281"><input type="text" name="Fax<%=typeOfAddress%>" size="20" value="<%=Fax%>">
    </td>
  </tr>
<%end if%>



<%if typeOfAddress = ACCOUNT then %>  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1"><%=getTranslation("Mobil")%>&nbsp;&nbsp; </font></span></td>
    <td width="281"><input type="text" name="Mobil<%=typeOfAddress%>" size="20" value="<%=Mobil%>">
    </td>
  </tr>
<%end if%>


<%if typeOfAddress = ACCOUNT then %>  
  <tr>
    <td align="right" width="138"><span style="font-weight: 400">
    <font size="1"><%=getTranslation("Web")%>&nbsp;&nbsp; </font></span></td>
    <td width="281"><input type="text" name="Web<%=typeOfAddress%>" size="20" value="<%=Web%>">
    </td>
  </tr>
<%end if%>


  
  <%if not fill then %>
    <tr>
    <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <%if typeOfAddress = ACCOUNT then %> 
   <tr>
    <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">
    <p align="left">&nbsp;    <input class="submit" type="CheckBox" checked name="IchWillNewsletter<%=typeOfAddress%>" value="ON">
        <%=getTranslation("Ich möchte Newsletter erhalten")%> 
         </td>
  </tr>
 <%end if%>

    <tr>
    <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">
    <p align="left">&nbsp;</td>
  </tr>
  <%end if%>
</table>
</center>
<%
end function

sub selectLand(byVal fill, byVal Land)

		dim DEFAULT_LAND_NR: DEFAULT_LAND_NR = varvalue("DEFAULT_LAND_NR")

		%>
		<option value="<%=DEFAULT_LAND_NR%>"><%=tablevalue("grLand","idnr",DEFAULT_LAND_NR,"Name")%></option>
		<%
				dim sql, rsC
				sql = "SELECT * FROM grLand ORDER BY [NAME]"
				Set rsC = objConnectionExecute(sql)
				while NOT rsC.EOF
					%>
					<option value="<%=rsC("IdNr")%>" <%
					'if fill then  
						if CSTR(Land)=CSTR(rsC("IdNr")) then 
							Response.Write "SELECTED"
						end if
					'end if
					%>><%=rsC("Name")%></option>
					<%
					rsC.MoveNext
				wend%>	
				
		<%
end sub 


sub selectBundesLand(byVal fill, byVal BundesLand)

		dim DEFAULT_BUNDESLAND: DEFAULT_BUNDESLAND = varvalue("DEFAULT_BUNDESLAND")

		%>
		<option value="<%=DEFAULT_BUNDESLAND%>"><%=DEFAULT_BUNDESLAND%></option>
		<%
				dim sql, rsC
				sql = "SELECT distinct BLAND FROM grPLZ where BLAND is not null ORDER BY [BLand]"
				Set rsC = objConnectionExecute(sql)
				while NOT rsC.EOF
					%>
					<option value="<%=rsC("BLAND")%>" <%
					'if fill then  
						if CSTR(Land)=CSTR(rsC("BLAND")) then 
							Response.Write "SELECTED"
						end if
					'end if
					%>><%=rsC("BLAND")%></option>
					<%
					rsC.MoveNext
				wend%>	
				
		<%
end sub 
%>


<%
'**********************************************************************************
' drawEmptyProfileFormSimple
' typeOfAddress - (1)main adress, (2)shipping address, (3) invoice address
'withCheck - Boolean, if TRUE then the oblig. fields are checked
'**********************************************************************************
function drawEmptyProfileFormSimple(typeOfAddress, withCheck)
Dim rsR
Dim rsC
Dim fill:fill = False
Dim sql


Dim tableName : tableName = "ofAdressen"
if typeOfAddress = INVOICE or typeOfAddress = SHIPPING  then tableName = "[ofAdressen-Weitere]"

	
	if getLOGIN() <> "" then 
			fill = True
			Dim idnrToDraw: idnrToDraw = getLOGIN()
		
			SQL = "SELECT " & tableName & ".*, grPLZ.Ort AS PLZORT, grPLZ.PLZ as PLZPLZ , grLand.Name AS CNTRY " & _
				  "FROM " & tableName & " INNER JOIN (grPLZ INNER JOIN grLand ON grPLZ.Land = grLand.IdNr) " & _
				  "ON " & tableName & ".PLZ=grPLZ.IDNR WHERE " & tableName & ".IDNR= " & idnrToDraw 
			
			if typeOfAddress = INVOICE or typeOfAddress = SHIPPING  then 
			   SQL = SQL & " and Typ ='" & getTyp(typeOfAddress) & "'"	
			end if       
			'Response.Write sql : Response.Flush
			set rsR  = objConnectionExecute(sql)
			if rsR.EOF then fill = false 
	End if
	
	
	Dim  passwort, passwortII,  Email, Emailwiederholung
	

    
    if fill then Email=rsR("Email") else Email=request("Email" & typeOfAddress)
    if fill then Emailwiederholung=rsR("Email") else Emailwiederholung=request("Emailwiederholung" & typeOfAddress)
	if fill then passwort=rsR("passwort") else passwort=request("passwort" & typeOfAddress)
	if fill then passwortII=rsR("passwort") else passwortII=request("passwortII" & typeOfAddress)
	
	'if fill then Geburtstag=rsR("Geburtstag") else Geburtstag=request("Geburtstag" & typeOfAddress)
	'Geburtstag  = makeStringDate(Geburtstag)
	
%>
<br>
<center>
<table border="1" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse: collapse" cellpadding="0" width="450" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF" bgcolor="#F3F3F3" ID="Table1">

  <%if typeOfAddress = ACCOUNT then %>
  <tr><td width="150" colspan=2 align=center bgcolor="#FFCF00" height="18">
  <p align="left">
  <font color="#980000" size="1"><b>&nbsp;<%=getTranslation("Anmeldeinformationen")%></b></font>
  </td>
  </tr>
  
  <tr>
    <td align="right" ><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Email")%>&nbsp;&nbsp; </font></span></td>
    <td>&nbsp;<input type="text" name="Email<%=typeOfAddress%>" size="20" value="<%=Email%>" ID="Text1">
        <%if withCheck and len(Email)<5 then %></b></font><b><font size="1"  id="ErrorMessage" color="red">(!)</a><%end if%>
    </td>
  </tr>
  <tr>

  <tr>
    <td align="right"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Emailwiederholung")%>&nbsp;&nbsp; </font></span></td>
    <td>&nbsp;<input type="text" name="Emailwiederholung<%=typeOfAddress%>" size="20" value="<%=Emailwiederholung%>">
        <%if withCheck and len(Emailwiederholung)<5 then %></b></font><b><font size="1"  id="ErrorMessage" color="red">(!)</a><%end if%>
    </td>
  </tr>
  <tr>
    
  
 <%if not fill then%>
  <tr>
    <td align="right">&nbsp;</td>
    <td width="247"> &nbsp;</td>
  </tr>

  <tr>
    <td align="right"><span style="font-weight: 400">
    <font size="1">* <%=getTranslation("Passwort")%>&nbsp;&nbsp; </font></span></td>
    <td><font size="1"><b> &nbsp;<input type="password" name="Passwort<%=typeOfAddress%>" size="20" ID="Password1">
     <%if withCheck and len(Passwort)<PASSWORD_LENGTH then %></b></font><b><font size="1" id="ErrorMessage" color="red">(!)</a><%end if%>
     <%=getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")%>
    </font></b>
    </td>
  </tr>

  <tr>
    <td align="right"><span style="font-weight: 400">
    <font  size="1">* <%=getTranslation("Passwort wiederholen")%>&nbsp;&nbsp; </font></span></td>
    <td><font size="1"><b> &nbsp;<input type="password" name="PasswortII<%=typeOfAddress%>" size="20" ID="Password2">
     <%if withCheck and len(PasswortII)<PASSWORD_LENGTH then %></b></font><b><font size="1" id="ErrorMessage" color="red">(!)</a><%end if%>
     <%=getTranslation("Min " & PASSWORD_LENGTH & " Zeichen!")%>
    </font></b>
    </td>
  </tr>

  <% else  %>

  
  <tr>
    <td colspan=2  align="center" width="350"><span style="font-weight: 400">
    <font size="1"><%=getTranslation("To Change Password Click")%> <a href=default.asp?PageToShow=ChangePassword>HERE</a>!</font></span></td>

      <input type="hidden" name="Passwort<%=typeOfAddress%>" size="20" value="<%=Passwort%>" ID="Hidden1">
      <input type="hidden" name="PasswortII<%=typeOfAddress%>" size="20" value="<%=PasswortII%>" ID="Hidden2">
  </tr>
  <%end if%>
  <%end if %>
</table>
<input type="hidden" name="Redirection" value="<%=Request("Redirection")%>">
<input type="hidden" name="Branche<%=typeOfAddress%>" value="4"><!-- simple account  -->
&nbsp; <br>
&nbsp;<table border="1" cellspacing="1" style="border-collapse: collapse" cellpadding="0" width="390" bgcolor="#F3F3F3" bordercolorlight="#FFFFFF" bordercolordark="#FFFFFF">
  
<!--
  <%if not fill then%>
   <tr>
    <td align="right" width="350" colspan="2" bgcolor="#FFFFFF">
    <p align="left"><input class="submit" type="CheckBox" checked name="IchWillNewsletter<%=typeOfAddress%>" value="ON" ID="Checkbox1">
        <%=getTranslation("Ich m&ouml;chte Newsletter bekommen")%> <font color="#980000">NEWS CORNER</font></font> </td>
  </tr>
  <%end if%>
  -->

</table>
</center>
<%
end function
%>

<%
'**********************************************************************************
' function drawProfileForm
' drawEmptyProfileForm isused twice 
' typeOfAddress - (1)main adress, (2)shipping address
'**********************************************************************************
function drawProfileForm(withCheck)
%>
<table border="0" width="100%" bordercolor="#CCCCCC" style="border-collapse: collapse" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan=2 width="100%"><%=drawEmptyProfileForm(1, withCheck)%>&nbsp;</td>
   </tr>
   <% if false then%>
   <tr> 
    <td width="50%"><%=drawEmptyProfileForm(2, withCheck)%></td>
    <td width="50%"><%=drawEmptyProfileForm(3, withCheck)%></td>
  </tr>
  <% end if %>
</table>
<%
end function 

'returns the idnr of the combiation PLZ/ORT/LAND
function getPLZ(byval Land, byval  Ort, byval  PLZ)
dim NextIDNRPLZ, sql, rsPLZORT
sql  = "SELECT * FROM grPLZ where PLZ='" & PLZ & "' AND Land =" & Land '& " AND Ort = '" & Ort & "'"
Set rsPLZORT = objConnectionExecute(SQL)
 if rsPLZORT.EOF then 'save PLZ ORT 
 	 if varvalue_default("PLZ_IDNR_AUTONUMBER", "TRUE") = "TRUE" then 
             sql = " INSERT INTO grPLZ (PLZ ,Ort, Land) values ('" & PLZ & "' ,'"& Ort &"', " & Land & ")"
 	 else 'PLZ_IDNR Field is not autonumber 
 	     'NextIDNRPLZ = NextID("grPLZ", "IDNR")
 	     'update am 26.12.2005 for PLZ Text field
             'update 07.03.2006 because PLZ 10000 is bigger than PLz 9999 but the text search is not sorting after number 
 	     sql = " INSERT INTO grPLZ (IDNR, PLZ ,Ort, Land) values ('" & Land  & "_" & PLZ  & "', '" & PLZ & "', '"& Ort &"', " & Land & ")" 		 
 	 end if 
 	 
 	'Response.write SQL : Response.Flush
 	objConnectionExecute(SQL)
 	NextIDNRPLZ = getPLZ(Land, Ort, PLZ)
 else 
	 NextIDNRPLZ = rsPLZORT("idnr")
 end if 
 getPLZ = NextIDNRPLZ
end function 



'return true or false 
function checkTELNR(telNR)
 checkTELNR = true 
 
 if len(telNR) < 5 then 
   checkTELNR = false 
 end if 
 
 Dim i 
 for i = 1 to len(telNR) 
   if inStr("+# 0123456789/-",mid(telNR,i,1)) = 0 then 
      checkTELNR = false 
   end if 
 next 
 
end function 


function changePassword()
	Dim rsP, oldP, newP, cnewp
	oldp = request("OldPasswd")
	newp = request("NewPasswd")
	cnewp = request("CNewPasswd")
	'Response.Write (cnewp)
	'Response.Write (newp)
	'Response.end
	SQL ="SELECT * from ofAdressen Where IDNR = " & Clng(getLOGIN()) & " AND Passwort Like '" & oldp & "'"
	set rsP  = objConnectionExecute(SQL)
	if rsP.EOF OR rsP.BOF then 
		Response.Redirect ("default.asp?PageToShow=ChangePassword&OldDoesNotMatch=TRUE")
	else
		SQL = " UPDATE ofAdressen Set Passwort = '" & newp & "' WHERE IDNR = " & Clng(getLOGIN())
		set rsP  = objConnectionExecute(SQL)
		%>
<P align=center>Ihr Passwort wurde ge&auml;ndert!
		<%
	end if

end function 

function changeEmail()
	Dim rsP, oldP, newP, cnewp
	oldp = replace(request("OldEmail"), " ", "")
	newp = replace(request("NewEmail"), " ", "")
	cnewp = replace(request("CNewEmail"), " ", "")
	'Response.Write (cnewp)
	'Response.Write (newp)
	'Response.end
	SQL ="SELECT * from ofAdressen Where IDNR = " & Clng(getLOGIN()) & " AND Email Like '" & oldp & "'"
	'Response.Write sql: Response.End
	set rsP  = objConnectionExecute(SQL)
	if rsP.EOF OR rsP.BOF then 
		Response.Redirect ("default.asp?PageToShow=ChangeEmail&OldDoesNotMatch=TRUE")
	else
		SQL = " UPDATE ofAdressen Set Email = '" & newp & "' WHERE IDNR = " & Clng(getLOGIN())
		set rsP  = objConnectionExecute(SQL)
		%>
<P align=center>Ihr Email wurde ge&auml;ndert!
		<%
	end if


end function 

public function getCountOrders(idnr, orderType)
  dim sql, rs 
  sql = "SELECT count(*) as co from " & getVorgangTableForType(orderType) & " where kundnr= " & idnr
  
  set rs =  objConnectionExecute(SQL)
  if rs.eof then 
      getCountOrders = 0
  else 
      getCountOrders = rs("co")
  end if 
  rs.close 
end function 


public function getCountOrdersProducts(idnr, orderType)
  dim sql, rs 
  dim MCHAR: MCHAR="*"
   if session("dbType") = "SQL" or  session("dbType") = "MySQL" then MCHAR = "%"
  sql = "SELECT count(artnr) as co from [" & getVorgangArtikelTableForType(orderType) & "]" &  _
        " WHERE Bezeichnung not like '" & MCHAR & "CALCULATE" &  MCHAR & "' and rechnr in " & _ 
        "(select nummer from " & getVorgangTableForType(orderType) & " where kundnr= " & idnr & ")"
  
  set rs =  objConnectionExecute(SQL)
  if rs.eof then 
      getCountOrdersProducts = 0
  else 
      getCountOrdersProducts = rs("co")
  end if 
  rs.close 
end function 



public function getBookmarkCount(idnr, descTyp)
  dim sql, rs 
  dim MCHAR: MCHAR="*"
   if session("dbType") = "SQL" or  session("dbType") = "MySQL" then MCHAR = "%"
 
SQL = "Select count(*) as co From UserBookmarks where (UserId=" & idnr & ")" &  _ 
      " and Description like '" & descTyp & "'"
  set rs =  objConnectionExecute(SQL)
  if rs.eof then 
      getBookmarkCount = 0
  else 
      getBookmarkCount = rs("co")
  end if 
  rs.close 
end function 


public function getNewsletterCount(idnr, active)
 Const MAX_NEWSLETTER_COUNT = 3
'TODO 
  dim sql, rs 
  SQL = "Select count(*) as co From webNewsletter where Email like '" & tablevalue("ofAdressen","Idnr",idnr,"Email") & "'"
  set rs =  objConnectionExecute(SQL)
  if rs.eof then 
      getNewsletterCount = 0
  else 
   dim nlC
	 nlC = cint(rs("co"))
    if cint(nlc)>3 then nlc = 3
    if active then 
      	getNewsletterCount = nlc 
     else
     	getNewsletterCount = MAX_NEWSLETTER_COUNT - nlc 
    end if   
  end if 
  rs.close 
end function 

	        

'possible TAGS 
'[IDNR]
'[USER_COUNT_POINTS]


public function parseTemplateUser(accountPageHTML)
	parseTemplateUser = parseTemplateUserIDNR(getLOGIN(),accountPageHTML)
end function 


public function parseTemplateUserIDNR(idnr, accountPageHTML)
	 
	 if inStr(accountPageHTML,"[IDNR]")>0 then  accountPageHTML = replace(accountPageHTML,"[IDNR]", getLOGIN())

	 if inStr(accountPageHTML,"[USER_COUNT_POINTS]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_COUNT_POINTS]", getSumPoints(getLOGIN(),"")) 
	 if inStr(accountPageHTML,"[USER_COUNT_POINTS_WRITE_REVIEW]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_COUNT_POINTS_WRITE_REVIEW]", getCountPoints(getLOGIN(), REASON_WRITE_REVIEW))
	 if inStr(accountPageHTML,"[USER_COUNT_POINTS_PRODUCT_RATING]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_COUNT_POINTS_PRODUCT_RATING]", getCountPoints(getLOGIN(), REASON_PRODUCT_RATING))
	 if inStr(accountPageHTML,"[USER_COUNT_POINTS_SEND_TO_FRIEND]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_COUNT_POINTS_SEND_TO_FRIEND]", getCountPoints(getLOGIN(), REASON_SEND_TO_FRIEND))
	 if inStr(accountPageHTML,"[USER_COUNT_POINTS_ORDERS]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_COUNT_POINTS_ORDERS]", getCountPoints(getLOGIN(), REASON_ORDERS))
	 
	 if inStr(accountPageHTML,"[USER_SUM_POINTS_WRITE_REVIEW]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_SUM_POINTS_WRITE_REVIEW]", getSumPoints(getLOGIN(), REASON_WRITE_REVIEW))
	 if inStr(accountPageHTML,"[USER_SUM_POINTS_PRODUCT_RATING]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_SUM_POINTS_PRODUCT_RATING]", getSumPoints(getLOGIN(), REASON_PRODUCT_RATING))
	 if inStr(accountPageHTML,"[USER_SUM_POINTS_SEND_TO_FRIEND]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_SUM_POINTS_SEND_TO_FRIEND]", getSumPoints(getLOGIN(), REASON_SEND_TO_FRIEND))
	 if inStr(accountPageHTML,"[USER_SUM_POINTS_ORDERS]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_SUM_POINTS_ORDERS]", getSumPoints(getLOGIN(), REASON_ORDERS))
	 
	 if inStr(accountPageHTML,"[COUNT_PRODUCTS_BOOKMARKS]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_PRODUCTS_BOOKMARKS]", getBookmarkCount(getLOGIN(), "Produkte"))
	 if inStr(accountPageHTML,"[COUNT_CARTS_BOOKMARKS]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_CARTS_BOOKMARKS]", getBookmarkCount(getLOGIN(), "Warenkorb")) 	 
	 
	 	
	 if inStr(accountPageHTML,"[USER_ADDRESS]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_ADDRESS]", printAddress(getLOGIN(), "",FALSE))
	 if inStr(accountPageHTML,"[USER_NAME]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_NAME]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Name"))
	 if inStr(accountPageHTML,"[USER_FIRMA]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_FIRMA]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Firma"))
     if inStr(accountPageHTML,"[USER_FIRSTNAME]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_FIRSTNAME]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Vorname"))

	 if inStr(accountPageHTML,"[USER_VORNAME]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_VORNAME]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Vorname"))
     if inStr(accountPageHTML,"[USER_TEL]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_TEL]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Tel"))
     if inStr(accountPageHTML,"[USER_MOBIL]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_MOBIL]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Mobil"))
	
     if inStr(accountPageHTML,"[USER_UID]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_UID]", tablevalue("ofAdressen","IDNR",getLOGIN(),"UID") & "")
	
		
	 if inStr(accountPageHTML,"[USER_EMAIL]")>0 then  
            if getLOGIN() > 0 then
		accountPageHTML = replace(accountPageHTML,"[USER_EMAIL]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Email"))
            else
		accountPageHTML = replace(accountPageHTML,"[USER_EMAIL]", "")
	    end if
	end if 
	
	 if inStr(accountPageHTML,"[USER_PASSWORD]")>0 then  
            if getLOGIN() > 0 then
		accountPageHTML = replace(accountPageHTML,"[USER_PASSWORD]", tablevalue("ofAdressen","IDNR",getLOGIN(),"Passwort"))
            else
		accountPageHTML = replace(accountPageHTML,"[USER_PASSWORD]", "")
	    end if
	end if 

	 if inStr(accountPageHTML,"[USER_DATE_REGISTRATION]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_DATE_REGISTRATION]", tablevalue("ofAdressen","IDNR",getLOGIN(),"AngelegtAn"))  
	 
	 if inStr(accountPageHTML,"[COUNT_ORDERS]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_ORDERS]", getCountOrders(getLOGIN(),"AU"))
	 if inStr(accountPageHTML,"[COUNT_DELIVERIES]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_DELIVERIES]", getCountOrders(getLOGIN(),"LI"))
	 if inStr(accountPageHTML,"[COUNT_INVOICES]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_INVOICES]", getCountOrders(getLOGIN(),"AR"))
	 
	 if inStr(accountPageHTML,"[COUNT_ORDERED_PRODUCTS]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_ORDERED_PRODUCTS]", getCountOrdersProducts(getLOGIN(),"AU"))
     if inStr(accountPageHTML,"[COUNT_DELIVERED_PRODUCTS]")>0 then  accountPageHTML = replace(accountPageHTML,"[COUNT_DELIVERED_PRODUCTS]", getCountDeliveredProducts(getLOGIN(),"AR"))
 
	 if inStr(accountPageHTML,"[USER_ADDRESS]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_ADDRESS]", printAddress(getLOGIN(),"", FALSE))
	 if inStr(accountPageHTML,"[USER_ADDRESS_SHIPPING]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_ADDRESS_SHIPPING]", printAddress(getLOGIN(),"LI", TRUE))
	 if inStr(accountPageHTML,"[USER_ADDRESS_INOVICE]")>0 then  accountPageHTML = replace(accountPageHTML,"[USER_ADDRESS_INOVICE]", printAddress(getLOGIN(),"AR", TRUE))
	 
	 if inStr(accountPageHTML,"[NEWSLETTER_COUNT_ACTIVETED]")>0   then  accountPageHTML = replace(accountPageHTML,"[NEWSLETTER_COUNT_ACTIVETED]", getNewsletterCount(getLOGIN(),TRUE))
	 if inStr(accountPageHTML,"[NEWSLETTER_COUNT_DEACTIVETED]")>0 then  accountPageHTML = replace(accountPageHTML,"[NEWSLETTER_COUNT_DEACTIVETED]", getNewsletterCount(getLOGIN(),FALSE))

	 accountPageHTML = replaceTagsForStatistics(accountPageHTML, idnr)
	 	 
	parseTemplateUserIDNR =  accountPageHTML
	 
end function 
%>