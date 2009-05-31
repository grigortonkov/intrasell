<%
'===========================================================================
' Autor: Written and edited by Grigor Tonkov 2001 (R)
' See intrasoft.soft-ware.de for last changes. 
'
' General ASP Functions
' This is collection of usefull ASP functions and procedures.
' IMPORTANT: The Software NEEDS "." Set as decimal point for the Internet User Account on the Internet Information Server 
'============================================================================
' History
'____________________________________________________________________________
' DATE         WHAT
'____________________________________________________________________________
' 20.06.2001   Database connection moved to the global.asa file 
' 08.05.2001   First Release
' 10.05.2001   Generic Database Support
' 10.01.2007   small changes
' ...........
'**Start Encode**
'This vars must be set in the global asa file!°!!! 
Dim BASENAME: BASENAME = Session("BASENAME")
Dim dbType : dbType = Session("dbType")
 


'********************************************************************
' get db connecit5on from global.asa file
'********************************************************************

if IsNull(objConnection) then 
    Response.Write "No Database Connection! Please set it in the global.asa file!"
    Response.end
else 
    'On Error resume next 
	'set objConnection = Session("objConnection")
	'On Error GoTo 0
end if

'********************************************************************
'RECOVER SQL Connection, to work properly the transaction cannot be supported!!! just for client part 
'********************************************************************
'On Error resume next 
if InStr(VARVALUE("Email"),"@")<=0 then ' DB connection is NOT okay!!!! 
   ' On Error GoTo 0
     'create new connection
     Response.Write "the DB connection is not okay! Please report to system administrator!": Response.Flush
     'Response.write "Trying to resume it..."  & Session ("MyDSN") 
	set objConnection=server.createobject("adodb.connection")
		objConnection.open Session ("MyDSN")
	 'Set Session("objConnection") = 	objConnection
	 'Response.Write "DB connection created!"
else 'DB connection is okay!!!! 
     'Response.Write "DB connection is Okay!" 
end if 
On Error GoTo 0
'END recover 

'********************************************************************
'returns string that represents date in SQL 92 format for access or SQL server
'********************************************************************
FUNCTION SQLDATE(abstand)
Dim d: d = date() + abstand
if dbType = "ACCESS" then 
	SQLDATE = "#" & month(d) & "/" & day(d) & "/" & year(d) & "#"
else 'SQL server
    SQLDATE = "'" & day(d) & "." & month(d) & "." & year(d) & "'"
end if 

if dbType ="MySQL" then 
	SQLDATE = "'" & year(d) & "-" & month(d) & "-" & day(d) & "'"
end if 
END FUNCTION

'********************************************************************
'ACCESS VERSION
'germanDate = dd.mm.yyyy
' Warning ! this function works only at account with german language set! 
'********************************************************************
FUNCTION TOSQLDATE(germanDate)
dim d: d = date() 
    d = germanDate
    if dbType = "ACCESS"  then 
		TOSQLDATE = "#" & month(d) & "/" & day(d) & "/" & year(d) & "#"
	else 
		if dbType="SQL"  then 
			TOSQLDATE = "'" &  day(d) & "." & month(d) & "." & year(d) & "'"
		else 
			if dbType ="MySQL" then 
			    'yyyy-mm-dd
				TOSQLDATE = "'" & year(d) & "-" & month(d) & "-" & day(d) & "'"
			end if 
		end if
	end if
END FUNCTION

'********************************************************************
' ACCESS AND SQL AND MySQL VERSION
' abstand in Days
'********************************************************************
FUNCTION SQLNOW(abstand)
  abstand = replace(abstand,",",".") 'convert to SQL format
  if dbType = "ACCESS" then 'ACCESS VERSION 
    SQLNOW = "NOW()+" & abstand    
  else 	'SQL SERVER VERSION 
    if dbType = "SQL" then 
		SQLNOW = "CURRENT_TIMESTAMP+" & replace(abstand,",",".")  
	else 
	   if dbType = "MySQL" then 
	       'wrong->SQLNOW = "(CURRENT_TIMESTAMP+" & "240000*(" & replace(abstand,",",".")  & "))"
	       'wrong->SQLNOW = "(DATE_ADD(NOW(), INTERVAL " & abstand & " DAY))" 
	       'response.Write "abstand=" & cdbl(abstand)
	       dim abstandInSeconds: abstandInSeconds = 24*60*60*cdbl(abstand)
	       SQLNOW = "(DATE_ADD(NOW(), INTERVAL " & abstandInSeconds & " SECOND))" 
	   end if 	
	end if 
  end if 	
END FUNCTION

'Example stringDate = 31.12.2004 in German Format
function makeSQLDate(stringDate) 
  if ucase(Session("dbType")) = "ACCESS" then 
     makeSQLDate   ="#" & mid(stringDate,4,2) & "/" & mid(stringDate,1,2) & "/" & mid(stringDate,7,4) &  "#"
  else
     if ucase(Session("dbType")) = "SQL" then 'MS SQL Server 
        if ucase(Session("DB_LANGUAGE")) = "DE" then 'German Date Format
            makeSQLDate = "'" & mid(stringDate,1,2) & "." & mid(stringDate,4,2) & "." & mid(stringDate,7,4) &  "'"
        else 'english format
			makeSQLDate = "'" & mid(stringDate,4,2) & "/" & mid(stringDate,1,2) & "/" & mid(stringDate,7,4) &  "'"
		end if 
	 else 'MYSQL
	    makeSQLDate = "CURRENT_TIMESTAMP" ' nicht unterstützt!
	 end if 	 	
  end if    
end function 

'converts 1/10/2002 to 10.01.2002
' 
function makeStringDate(sqlDate) 
sqlDate = sqlDate & ""
if instr(sqlDate,"/")<=0 then makeStringDate = sqlDate : exit function 
 dim tokens 
    tokens = split(sqlDate,"/") 
	makeStringDate   = right("0" & tokens(1),2) & "." & right("0" & tokens(0),2) & "." & right("0000" & tokens(2),4) 
end function 

'********************************************************************
' SQL SERVER
' Formats Date object as dd.mm.yyyy String 
'********************************************************************
Function GermanSQLDate(byVal d)
    GermanSQLDate =  day(d) & "." & month(d) & "." & year(d) 
END Function


'********************************************************************
' ONLY FOR SQL SERVER
' Formats Date object as dd.mm.yyyy DAte - clenas the time part .works only on SQL server 
'********************************************************************
Function DateFormat(byVal dField)
    'for english language 
    'DateFormat =  "CAST(RTRIM(CAST(MONTH(" & dField & ")  as CHAR)) + '/' + RTRIM(CAST(DAY(" & dField & ") as CHAR)) +  '/' + Rtrim(CAST(YEAR(" & dField & ")  as CHAR)) AS DATETIME)"
    
    'for german language 
    DateFormat =  "CAST(RTRIM(CAST(DAY(" & dField & ")  as CHAR)) + '.' + RTRIM(CAST(MONTH(" & dField & ") as CHAR)) +  '.' + Rtrim(CAST(YEAR(" & dField & ")  as CHAR)) AS DATETIME)"
END Function

'******************************************************************************
' SQL QUERY WRAPPER
' wrapper function because of problems with mySQL databases
'
' Param: showSQLSlowerThan=10
' if parameter showSQLSlowerThan=10 then the sql that is slower 
' than the paramter in milliseconds will be displaid 
'******************************************************************************
public function objConnectionExecute(byval sql) 
   Dim startTime: startTime = now()
   if dbType = "MySQL" then 'mySQL cannot read table names like '[grArtikel-KAtegorien] -> they must be translated 
        sql = replace(sql,"[","`") 
        sql = replace(sql,"]","`")        
   end if   
    
   if showDebug() then 
		Response.Write "<br>" & sql: Response.Flush  
   end if 
   
   on error goto 0
   err.Clear 
   on error resume next 'catch the MSDE Error 'SQL Server does not exist or access denied. 
   set objConnectionExecute = objConnection.Execute(sql)

   if err.number <> 0 then 
       'if showDebug() then 
       response.write "<font color=red>" & err.Number & ":" & err.Description  & "</font>"
       response.write "Wrong SQL:" & sql
       if InStr(err.Description, "does not exist") > 0 then 'try again
           set objConnectionExecute = objConnectionExecute(sql) 'try again, till asp timeout error happens 
       end if   
       response.end
   end if 
   
   Dim endTime: endTime = now()
   
   if request("showSQLSlowerThan") & "" <> "" then 'specified 
            Dim execTime: execTime = (endTime-startTime)*24*60*60*100
			if execTime > clng(request("showSQLSlowerThan")) then
					Response.Write "<br><font color=red>Slow SQL:" & sql & "</font>": Response.Flush
					Response.Write "ExecTime was: " & execTime  
			end if 
   end if 
   'Response.Write "ExecTime: " & execTime  
end function 

'********************************************************************
'SUCHT EINE VARIABLE IN DER VARS TABELLE
'********************************************************************
FUNCTION VARVALUE(varname)'from cache
   Dim temp
   Dim  CACHE_NAME: CACHE_NAME = "VARVALUE_" & varname
   temp = getCache(CACHE_NAME)
   if temp = "" then 'set cache  
      temp = setCache(CACHE_NAME, VARVALUE_NO_CHACHE(varname))
   end if    
   VARVALUE = temp 
END FUNCTION

FUNCTION VARVALUE_NO_CHACHE(varname)
   Dim rs, SQLString
   SQLString = "SELECT * FROM ofVARS WHERE Name='" & varname & "'"  
   Set rs = objConnection.Execute(SQLString)   
   if rs.EOF THEN
       VARVALUE_NO_CHACHE = ""
       response.write "Die Variable " & varname  & " ist nicht vorhanden!!!"
   else 
        VARVALUE_NO_CHACHE = rs.fields("Wert")
   end if 
   rs.close
END FUNCTION

'********************************************************************
'SPEICHERT EINE VARIABLE IN DIE VARS TABELLE
'********************************************************************
Public Function SETVARVALUE(varname, varvalue)
   'DoCmd.SetWarnings False
   Dim SQLString
   'try insert first 
   Dim varExists: varExists  = VARVALUE_NO_CHACHE(varname) 
   
   if varExists & ""  = "" then  
	 SQLString = "INSERT INTO ofVARS (Id, Wert,[Name]) values(" & nextId("ofVars","Id") & ", '" & varvalue & "', '" & varname & "')"
	 'on error resume next 'error because constraint on name when double import
	 call objConnectionExecute(SQLString)
   end if 
   'on error goto 0
   'now update 
   SQLString = "UPDATE ofVARS Set Wert = '" & varvalue & "' WHERE Name='" & varname & "'"
   call objConnectionExecute(SQLString)
   SETVARVALUE = varvalue
   'DoCmd.SetWarnings True
End Function


'********************************************************************
'SUCHT EINE VARIABLE IN DIE VARS TABELLE und SETZT DIESE FALLS NICHT DEFINIERT
'********************************************************************
FUNCTION VARVALUE_DEFAULT(byval varname, byVal default_value)'from cache
   Dim temp: temp = VARVALUE_NO_CHACHE(varname) 
   if temp & "" = "" then 'ist noch nicht definiert 
		VARVALUE_DEFAULT = SETVARVALUE(varname, default_value) 
   else
		VARVALUE_DEFAULT = temp	
   end if 
END FUNCTION

'********************************************************************
'SUCHT EINE VARIABLE IN EINE TABELLE
'********************************************************************
FUNCTION TABLEVALUE(byval tablename, byval colname, byval varname, byval searchfield)
on error resume next 
Dim rs 
 if trim(tablename&"") = "" or trim(colname&"") = "" or trim(varname&"") = "" or trim(searchfield&"") = "" then 
	TABLEVALUE = "<font color=red>Wrong usage! Parameter " & varname  & " ist nicht vorhanden!</font>"
	exit FUNCTION
 end if 
   'on error resume next
   'response.write varname
   Dim SQLString 
   SQLString = "SELECT " & searchfield & " FROM " &  tablename & " WHERE " & colname & "=" & varname 
   'SQLString = "SELECT * FROM " &  tablename & " WHERE " & colname & "=" & varname  
   'response.write SQLString & " --> " & searchfield 
   'Response.Flush
   Set rs = objConnectionExecute(SQLString)   
   if rs.EOF THEN
       TABLEVALUE = "<font color=red>Datensatz [" + searchfield + "] in Tabelle [" + tablename + "] und spalte [" + colname + "] mit Wert " & varname  & " ist nicht vorhanden!</font>"
   else 
       TABLEVALUE = rs(searchfield)
   end if 
    rs.close
END FUNCTION

'********************************************************************
'SUCHT EINE VARIABLE IN EINE TABELLE
'********************************************************************
FUNCTION FIRSTVALUE(byval SQLString)
Dim rs 
   Set rs = objConnectionExecute(SQLString)   
   if rs.EOF THEN
       FIRSTVALUE = "N.A."
   else 
       FIRSTVALUE = rs(0)
   end if 
    rs.close
END FUNCTION


'=============================================================================
' getFirstField
'=============================================================================
function getFirstField(sql)
 dim rs

 set rs = ObjConnectionExecute(SQL)
 if rs.EOF then 
   getFirstField = nothing 
 else 
   getFirstField = rs.fields(0)
 end if 
 rs.close 
end function 

public function isDebug()
 isDebug = showDebug()
end function 

public function debug()
 debug = showDebug()
end function 

public function showDebug()
 if ucase(request("DEBUG")) = "TRUE" then showDebug = true else showDebug = false 
end function 

'********************************************************************
'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
'********************************************************************
public function sendMailFromWithSending(Recipient , Subject , MailText, from_email )
 'on error resume next 
 'SET THE MAILER COMPONENT HERE!!!
 Dim MailerComponentName: MailerComponentName = VARVALUE("MAILER_COMPONENT_NAME")
 if MailerComponentName = "PERSISTS" then
	sendMailFromWithSending = sendMailFromWithSendingPersists (Recipient , Subject , MailText, from_email )
	'exit function 
 end if 
 
 if MailerComponentName = "SVG" then
	sendMailFromWithSending = sendMailFromWithSendingSVG (Recipient , Subject , MailText, from_email )
	'exit function 
 end if 
 
 if MailerComponentName = "CDONT" then
	sendMailFromWithSending = sendMailFromWithSendingCDONT (Recipient , Subject , MailText, from_email )
	'exit function 
 end if 
 
   'START ERROR HANDLING
   IF err.number=0 THEN         
       'Response.write "OK"   
   else
   	response.write "<br><font color=red>Error Number= #<b>" & err & "</font></b><br>"
   	Response.Write err.description
   	sendMailFromWithSending = false
   END IF 'END ERROR HANDLING
 
END function 

function sendMailFromWithSendingCDONT(Recipient , Subject , MailText, from_email )
Const cstCdoMailFormatMime = 1
Const cstCdoMailFormatText = 0

Const cstCdoBodyFormatHTML = 0
Const cstCdoBodyFormatText  = 1

Const cstCdoLow    = 0   ' Low importance  
Const cstCdoNormal = 1   ' Normal importance (default)  
Const cstCdoHigh   = 2   ' High importance  

                dim myCDONTSMail 
				Set myCDONTSMail = CreateObject("CDONTS.NewMail")
				myCDONTSMail.Importance = cstCdoHigh
				myCDONTSMail.MailFormat = cstCdoBodyFormatHTML
				myCDONTSMail.BodyFormat = cstCdoBodyFormatHTML

				


				myCDONTSMail.Send from_email, Recipient, Subject, MailText, 0 'lngImportance
				Set myCDONTSMail  = Nothing
				sendMailFromWithSendingCDONT = true '"Mail has been sent."
end function 				
'********************************************************************
'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
' SENDS HTML MAILS
'********************************************************************
function sendMailFromWithSendingPersists(Recipient , Subject , MailText, from_email )
 on error resume next 
 sendMailFromWithSendingPersists = false 
 'on error resume next 
 if len(trim(Recipient)) > 4 THEN 
     Dim Mail
  	 Set Mail = Server.CreateObject("Persits.MailSender")
	 Mail.Host = VarValue("SMTP") 
	'Mail.Port = 35
	 Mail.From = from_email
	'Mail.AppendBodyFromFile "d:\dir\SampleBody.htm"
	'Mail.AddEmbeddedImage "d:\dir\margin.gif", "My-Background-Image"
	 Mail.AddAddress Recipient
     Mail.Subject = Subject 	
    'Response.write "Mail:" & Recipient & Subject & MailText &  from_email  
     Mail.Body = MailText 
     Mail.isHTML = true 
     
	 Mail.Send
	 sendMailFromWithSendingPersists = true 
 else 
  	 sendMailFromWithSendingPersists  =false 
 END IF
END function 

'********************************************************************
'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
'********************************************************************
function sendMailFromWithSendingSVG(Recipient , Subject , MailText, from_email )
  'on error resume next 
 'Response.Write "Send mail from " & from_email & " to " & Recipient
 if len(trim(Recipient)) > 4 THEN
    Dim Mailer 
  	Set Mailer = Server.CreateObject ("SMTPsvg.Mailer") 
    Mailer.FromName = from_email
    Mailer.FromAddress = from_email
    'Mailer.FromAddress = "xx@xxx.at"
    Mailer.Subject = Subject
    Mailer.BodyText = MailText
    Mailer.RemoteHost = VarValue("SMTP") 
    Mailer.AddRecipient Recipient, Recipient

    if Mailer.SendMail then 
       'Message sent sucessfully 
        response.write ("Your message was sent") 
        sendMailFromWithSendingSVG = true      
    else 
       'Message send failure 
        response.write ("Your message was not sent. ") 
        response.write ("The error was: " & Mailer.Response) 
        sendMailFromWithSendingSVG = false 
    end if 
	
 ELSE 
   response.write "The recipient is invalid!"
   sendMailFromWithSendingSVG = false 
 END IF
END function 



'********************************************************************
'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
'********************************************************************
SUB sendSpamMail(Recipient , Subject , MailText, from_email )
 if len(trim(Recipient)) > 4 THEN 
     Dim mail
  	 Set Mail = Server.CreateObject("Persits.MailSender")
	 Mail.Host = VarValue("SMTPSPAM")
	'Mail.Port = 35
	 Mail.From = from_email
	'Mail.AppendBodyFromFile "d:\dir\SampleBody.htm"
	'Mail.AddEmbeddedImage "d:\dir\margin.gif", "My-Background-Image"
	 Mail.AddAddress Recipient
     Mail.Subject = Subject 	
    'Response.write "Mail:" & Recipient & Subject & MailText &  from_email  
     Mail.Body = MailText 
	 Mail.Send
 END IF
END Sub

'********************************************************************
' sendMailFrom
'********************************************************************
Function  sendMailFrom(Recipient , Subject , Text, from_email )
sendMailFrom = false 
	 if len(trim(Recipient)) > 4 THEN 
	    Dim sql
		sql = "INSERT INTO MailsToSend(Recipient , Subject , MailText, from_email, priority) " & _ 
		      " VALUES('" & _ 
		        Recipient & "','" &  Subject & "','" &  Text & "','" & from_email & "', 1)"  
		ObjConnectionExecute(sql)  
		sendMailFrom = true 
	END IF
END Function 


SUB sendMail(Recipient , Subject , Text)
 from_email ="Evelyn@date-for-you.com"
 call sendMailFrom (Recipient , Subject , Text, from_email)
END Sub


'********************************************************************
'saves user logs in table Login
'********************************************************************
FUNCTION LOG()
 'STATS
 'ON ERROR RESUME NEXT 
 Dim SQLQuery
   ' save statistics
    dim requestedFile
    requestedFile = Request.ServerVariables("PATH_TRANSLATED")
    while  inStr(requestedFile,"\") > 0  ' remove path 
       requestedFile = mid(requestedFile, inStr(requestedFile,"\")+1)
    wend 
   
     SQLQuery = "INSERT INTO login(PATH_TRANSLATED,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER,HTTP_REFERER)  VALUES " & _
				  "('" & requestedFile & "?" & Request.QueryString &  "','" & _ 
                     Request.ServerVariables("REMOTE_ADDR") & " ','" & _
				     Request.ServerVariables("REMOTE_HOST") & "','" & _
				     Request.ServerVariables("REMOTE_USER") & "','" & _
			         Request.ServerVariables("HTTP_REFERER") & "')" 

     'Response.write SQLQuery

     objConnection.Execute(SQLQuery)
END FUNCTION

 '********************************************************************
'extracts only the filename from fullfilename
' example: c:\autoexec.bat
' return autoexec.bat
'********************************************************************
function getOnlyFilename(byVal fullFilename)
  Dim arrayString 
	if instr(fullFilename,"\") > 0 then 
	arrayString = split(fullFilename,"\")
    getOnlyFilename = arrayString(Ubound(arrayString))
  else   
	getOnlyFilename = fullFilename
  end if 
end function 


'********************************************************************
'creates recursively all folders 
'Filename = c:\daten\test\xxxx 
'********************************************************************
function createFoldersIfNotExists(Filename)
           'CREATE DIRECTORY IF NOT EXISTS 
           
    'Response.Write "<BR>Create Directory if not exists." 
    Dim FULLFOLDER
    FULLFOLDER = Left(Filename, InStr(Filename, getOnlyFilename(Filename))-2)
    'Response.Write "Foder to crate is : " & FULLFOLDER
    
    dim filesystem
	Set filesystem = CreateObject("Scripting.FileSystemObject")
	Dim PARTFOLDER, FULLPARTFOLDER  
	FULLPARTFOLDER ="" 
	
	For each PARTFOLDER in Split(FULLFOLDER,"\") 
	   FULLPARTFOLDER = FULLPARTFOLDER & PARTFOLDER & "\" 
	   'Response.Write "<BR>FULLPARTFOLDER=" & FULLPARTFOLDER
	   'Response.Flush
		if NOT filesystem.FolderExists(FULLPARTFOLDER) THEN 
	       filesystem.createFolder(FULLPARTFOLDER) 'for files 
		END IF 
	NEXT 
	
end function 


'********************************************************************
'CHECKS if A FILE EXISTS
' mypath - relative path 
' sfilename - name to exist 
'********************************************************************
function file_exists(mypath, sfilename)
 Dim found 
 found = FALSE
	Set filesystem = CreateObject("Scripting.FileSystemObject")
	Set folder = filesystem.GetFolder(server.mappath(mypath))
	Set filecollection = folder.Files
	
	For Each file in filecollection
	 fn =  file.name
	 
	 IF (fn = sfilename) THEN 
	         found = true 
	      end if 
   Next
	 	
	set filesystem=nothing
	set folder=nothing
	set filecollection=nothing
file_exists = found
end function


'********************************************************************
' FILE  EXISTS 
' sfilename - name to exist 
'********************************************************************
function FileExists(filename)
 On Error resume next 
     Dim filesystem
	 Set filesystem = CreateObject("Scripting.FileSystemObject")
	 FileExists = 	filesystem.FileExists(filename)
	 set filesystem=nothing
end function

'********************************************************************
' DELETE FILE 
' sfilename - name to exist 
'********************************************************************
function DeleteFile(filename)
 On Error resume next 
    Dim filesystem
	Set filesystem = CreateObject("Scripting.FileSystemObject")

	 	filesystem.DeleteFile filename
	set filesystem=nothing
   DeleteFile = true 
end function


'********************************************************************
' DELETE FOLDER 
' sfilename - name to exist 
'********************************************************************
function DeleteFolder(foldername)
 ' On error resume next 
    if foldername <> "" THEN 
    Dim filesystem
	Set filesystem = CreateObject("Scripting.FileSystemObject")
     if filesystem.FolderExists(foldername) then 
	 	filesystem.DeleteFolder foldername,  true 
	 end if 	
	set filesystem=nothing
   DeleteFolder = true 
   end if 
end function
'********************************************************************
' COPY FILE 
' sfilename - name to exist 
'********************************************************************
function CopyFile(filename, toFilename)
    Dim filesystem
	Set filesystem = CreateObject("Scripting.FileSystemObject")

	 	filesystem.CopyFile filename, toFilename
	set filesystem=nothing
   CopyFile = true 
end function

'********************************************************************
' COPY FILE 
' sfilename - name to exist 
'********************************************************************
function MoveFile(filename, toFilename)
    Dim filesystem
	Set filesystem = CreateObject("Scripting.FileSystemObject")

	 	filesystem.MoveFile filename, toFilename
	set filesystem=nothing
   MoveFile = true 

end function

'********************************************************************
' CREATE FOLDER
'********************************************************************

function Createfolder(folder)
    Dim filesystem
	Set filesystem = CreateObject("Scripting.FileSystemObject")
	 	filesystem.CreateFolder folder
	set filesystem=nothing
file_delete = true 
end function

'CLEANS THE USER INPUT FROM UNNOLLOWED CHARS 
function cleanUserInput(userInput) 
		dim cleaned
		dim errorFound : errorFound = false 
		
		cleaned = replace(userInput,"*","")
		cleaned = replace(cleaned,"%","")
		cleaned = replace(cleaned,"'","")
		'cleaned = replace(cleaned,"""","")
	
		if inStr(ucase(userInput),"DELETE")>0 then
		  errorFound = true 
		end if  
		
		if inStr(ucase(userInput),"DROP")>0 then
		  errorFound = true 
		end if  

		if inStr(ucase(userInput),"SELECT")>0 then
		  errorFound = true 
		end if  

		if inStr(ucase(userInput),"EXEC")>0 then
		  errorFound = true 
		end if  
		
		'shitched off because of EAN Numbers with -- 		
		'if inStr(ucase(userInput),"--")>0 then
		'  errorFound = true 
		'end if  
		
		if errorFound then 
		response.write "<font color=red>Do not play games with with us!"
		cleanUserInput = ""
		else 
		cleanUserInput = cleaned
		end if 
end function 

'********************************************************************
' DIESE FUNKTION ERSETZT EIN SYMBOL MIT EINEM ANDEREN
' The Name is changed from replace
'********************************************************************
function replaceAll(intext, what, withsymbol)
 Dim resulttext, i
i = 1 
 resulttext = ""
 WHILE i <= len(intext)

  if right(left(intext,i),1) = what THEN    
     resulttext = resulttext  + withsymbol
   ELSE
     resulttext = resulttext  + right(left(intext,i),1) 
   END IF
   i = i + 1 
 WEND  
replaceAll = resulttext  
end function

'********************************************************************
'Make Progress Bar - please move to Functions.asp
'********************************************************************
Function showProgressBar(percent, showPercents) ' as string 
 Dim htmlStat:htmlStat=""
  if percent > 100 THEN percent = 100
  if percent < 0 THEN percent = 1 
  
  htmlStat ="<table border=0 width=100 cellspacing=0 cellpadding=0 height=1>" & _ 
  "<tr>" & _ 
  "  <td width=""100%"" height=""1"">" & _ 
  "    <table border=""0"" width=""" & percent & "%"" cellspacing=""0"" cellpadding=""0"">" & _ 
  "      <tr>" & _ 
  "        <td width=""" & percent & "%"" bordercolor=""#00FF00"" bgcolor=""#0000FF"">&nbsp;</td>" & _ 
  "      </tr>" & _ 
  "    </table>" & _       
  "  </td>" & _ 
  "<td>" 
  if showPercents then htmlStat =   htmlStat & Int(percent) & "%" 
   
  htmlStat =   htmlStat & "  </td>" & _ 
  "</tr>" & _ 
  "</table>"

  showProgressBar = htmlStat 
end Function


'********************************************************************
'format HTML Output as error 
'********************************************************************
function formatAsError(html)
 formatAsError =  "<hr><font color=red> " & html & "</font><hr>"
end function 



Function RegExpTest(patrn, strng) 
	Dim regEx, Match, Matches ' Create variable. 
	Set regEx = New RegExp ' Create regular expression. 
	regEx.Pattern = "\b" & patrn & "\b"  ' Set pattern. 
	regEx.IgnoreCase = True ' Set case insensitivity. 
	regEx.Global = True ' Set global applicability. 
	Set Matches = regEx.Execute(strng) ' Execute search. 

	RegExpTest = Matches.Count 
End Function 


'********************************************************************
' generates nextId from Table and FieldName 
' fileNames - array with filenames(normaly in the user's folder), if empty will be created an empty document
' return value is the new documentId
'********************************************************************
function nextId(table, column)
Dim newId, sql, rs
'find the next Id
sql = "SELECT * FROM " & Table
Set rs = ObjConnection.execute(sql)
if rs.EOF THEN 
  nextId = 1
  exit function
END IF
sql = "SELECT max(" & column & ") as maxId FROM " & Table
'Response.Write sql:Response.Flush
Set rs = ObjConnectionExecute(sql)
if rs.EOF THEN
newId = 1
ELSE 
'Response.Write "MaxID=" & rs("maxId"):Response.Flush
newId = cdbl(rs("maxId"))+1
END IF

if newId = null or newId = "" then 
	nextId = 1
else 
	nextId = newId
end if
rs.close
Set rs = Nothing
end function 'createDocument 


'********************************************************************
'Wait - needs componets - WaitFor
'********************************************************************
sub Wait(seconds)  
  rem ******************************************************
  rem * Instantiate the component
  rem ******************************************************
  Dim WaitObj
  Set WaitObj = Server.CreateObject ("WaitFor.Comp")

  'Response.Write "Beginning to wait at: " & Time & "<br>"
  Response.Flush

  rem ******************************************************
  rem * WaitForSeconds takes one parameter:
  rem *  an integer value for the number of seconds to wait
  rem *  The component will not return until this time
  rem *  has elapsed
  rem ******************************************************
  WaitObj.WaitForSeconds seconds

  'Response.Write "Finished waiting: " & Time
  Response.Flush
end sub 


'********************************************************************
' other simple function testing if string is email
'********************************************************************
Function CheckEmail (byVal Email)
'response.Write "Checking Email:" & Email: response.end
 if InStr(Email,"@") < 2 Or Len(Email)<5 OR  InStr(Email,".") < 2 THEN 
		CheckEmail  = FALSE  
 ELSE 
	    CheckEmail  = TRUE 
 END IF
END Function 


'********************************************************************
' usefull function, thaht checks email format, is an strinc falid email or not 
'********************************************************************
Function EMailCheck(email)
dim FirstOcrDot
dim FirstOcrAt
dim lastOcrDot
lastOcrDot = instrrev(email,".")
FirstOcrDot = cint(instr(1,email,"."))
FirstOcrAt = cint(instr(1,EMail,"@"))
if len(email) > 5 then
	if FirstOcrAt > 0 then
		if  mid(email,FirstOcrAt + 1,1) <> "." and mid(email,FirstOcrAt - 1, 1) <> "." then 
			if instr(1,email," ") = 0 then
				if instrrev(email,".") > cint(firstocrat) + 1 then
					if lastocrdot < len(email) - 1 then
						if firstOcrAt < len(email) -1 and firstOcrAt > 1 then
							if firstOcrDot > 1 then
								EMailCheck = true
								exit function
							else	
	
								Response.Write "Dot in starting<br>"				
							end if
						else
							Response.Write "@ Not between first and last<br>"				
						end if
					else
						Response.Write ". before last two chars<br>"
					end if
				else
					Response.Write "Last Dot after @ missing or @ and . are not seperated by a Char<br>"
				end if
			else
				Response.Write "Space Not Allowed<br>"	 
			end if
		else
			Response.Write "A Dot Just before or after @ not allowed<br>"
		end if
	else
		Response.Write "A required Character Missing<br> "
	end if		
else
	Response.Write "Email cannot be less than 6 characters<br> "
end if
	
EMailCheck = false	
end Function




'********************************************************************
'
'  These reusable functions were copied from 
'  http://www.learnasp.com/learn/subreusable.asp  
'
'********************************************************************
Dim htmlstart, htmlend, rowstart, rowend, fieldstart, fieldend, namestart, nameend, fieldnames
 htmlstart =""
 htmlend=""
 rowstart=""
 rowend=""
 fieldstart=""
 fieldend=""
 namestart=""
 nameend=""
 'fieldnames
 fieldnames=false

sub query2list(myquery,listname)
   htmlstart="<select name='" & listname & "'><option></option>" 
   htmlend="</select>"
   rowstart="<option>"
   rowend="</option>"
   fieldstart=""
   fieldend=""
   call query2html(myquery)
end sub

sub query2listMultiLines(myquery,listname, lines)
   htmlstart="<select name='" & listname & "' size='" &lines& "'>" 
   rowstart="<option>"
   rowend="</option>"
   htmlend="</select>"
   fieldstart=""
   fieldend=""
   call query2html(myquery)
end sub

sub query2table(myquery)
   htmlstart="<table border=1>"
   htmlend="</table>"
   rowstart="<tr>"
   rowend="</tr>"
   fieldstart="<td valign=top>"
   fieldend="</td>"
   call query2html(myquery)
end sub

sub query2form(myquery)
   htmlstart=""
   htmlend=""
   rowstart=""
   rowend="<hr>"
   fieldstart=""
   fieldend="<br>"
   fieldnames=true
   namestart=""
   nameend="&nbsp;=&nbsp;"
   call query2html(myquery)
end sub

sub query2entryform(myquery)
   htmlstart=""
   htmlend=""
   rowstart=""
   rowend=""
   fieldstart="%name%&nbsp;=&nbsp;<input type='text name='%name%' value='"
   fieldend="' size='%size%'><br>"
   fieldnames=false
   namestart=""
   nameend="&nbsp;&nbsp;="
   call query2html(myquery)
end sub

'********************************************************************
'********************************************************************
sub query2html(inputquery)
   'set conntemp=server.createobject("adodb.connection")
   'conntemp.open "DSN=Student;uid=student;pwd=magic"
   Dim conntemp, rstemp
   Set conntemp = ObjConnection
   set rstemp=conntemp.execute(inputquery)
   if rstemp.EOF then exit sub
   Dim howmanyfields, i, counter
   howmanyfields=rstemp.fields.count -1
   redim fsa(howmanyfields)
   redim fea(howmanyfields)
    Dim tempstart, tempend
   for i = 0 to howmanyfields
      tempstart=replace(fieldstart,"%name%",rstemp(i).name)
      tempend=replace(fieldend,"%name%",rstemp(i).name)
      tempstart=replace(tempstart,"%size%",rstemp(i).actualsize)
      tempend=replace(tempend,"%size%",rstemp(i).actualsize)
      fsa(i)=tempstart
      fea(i)=tempend
   next 
   response.write htmlstart & vbcrlf
   counter=0
   do until rstemp.eof
      response.write rowstart & vbcrlf
      for i = 0 to howmanyfields
         if fieldnames=true then
            response.write namestart & rstemp(i).name & nameend
         end if
         response.write fsa(i) & rstemp(i) & fea(i) & vbcrlf
      next 
      response.write rowend & vbcrlf
      counter=counter+1
      rstemp.movenext 
      if response.isclientconnected=false then
         exit do
      end if
   loop
'rstemp.close
set rstemp=nothing
'conntemp.close
'set conntemp=nothing ' needed also by other connections
response.write htmlend
end sub



 'sqlToHTML
 public function sqlToHTML(byval sql, byVal showColNames, byVal makeHTMLTable)
    Dim html 
    Dim rs 
    Dim i
    Dim alternateRowColor
    Set rs = ObjConnectionExecute(sql) 
    html = html  &  "<table>"
    Dim counter : counter = 0
    while not rs.eof 
          counter = counter + 1 
     	       if alternateRowColor ="#FFFFCC" then  alternateRowColor = "#FFFFFF" else alternateRowColor = "#FFFFCC"
    			html = html  &  "<tr>"
       		for i = 1 TO rs.fields.count 
       		   if (counter mod 2) = 0 then 
       		        html = html &  "<TD _bgcolor=""" & alternateRowColor & """ class=""alternate"">" & rs.fields(i-1).value & " </TD>" 
       		   else
          		    html = html &  "<TD _bgcolor=""" & alternateRowColor & """>" & rs.fields(i-1).value & " </TD>"
          	   end if 
          			 'if isnumeric(rs.fields(i-1)) then  sumRow(i) = sumRow(i) + rs.fields(i-1).value 
          		next 
          		html = html  &  "</tr>"
       rs.MoveNext 
    wend 
    rs.close
    html = html  &  "</table>"
    sqlToHTML = html
 end function 
 
 
  'sqlToHTML
 public function sqlToSimple(byval sql, byVal showColNames, byVal makeHTMLTable)
    Dim html 
    Dim rs 
    Dim i
    
    Set rs = ObjConnectionexecutE(sql) 
    'response.write sql    

    Dim counter : counter = 0
    while not rs.eof 
          counter = counter + 1   	     
       		for i = 1 TO rs.fields.count 
       		        html = html & " " & rs.fields(i-1).value '& rs.fields(i-1).Name
          	next 
       rs.MoveNext 
    wend 
    rs.close
 
    sqlToSimple = html
 end function 
 
 
'url = Replace(url"Ae", "Ä", )
function retainUmlaute(byval url) 'as string
            url = Replace(url, "Ae", "Ä")
            url = Replace(url, "Oe", "Ö")
            url = Replace(url, "Ue", "Ü")

            url = Replace(url, "Auml", "Ä")
            url = Replace(url, "Ouml", "Ö")
            url = Replace(url, "Uuml", "Ü")
            
            'url = Replace(url, "ae", "ä")
            'url = Replace(url, "oe", "ö")
            'url = Replace(url, "ue", "ü")
            url = Replace(url, "&auml;", "ä")
            url = Replace(url, "&ouml;", "ö")
            url = Replace(url, "&uuml;", "ü")
            
            url = Replace(url, "auml", "ä")
            url = Replace(url, "ouml", "ö")
            url = Replace(url, "uuml", "ü")
            
            retainUmlaute = url 
end function 

  
  
  'adds spaces to the regquired length 
  function pad(byVal stringToPad, length) 
  
    dim i: i = 0 
	if len(stringToPad) < length  then 
	  Dim missingChars : missingChars = length -len(stringToPad)
		for i = 1 to missingChars
			stringToPad = stringToPad & " " 
		next 
		pad = stringToPad
     else ' more the length signs 
		pad = left(stringToPad, length-3) & "..."
     end if 
     
  end function 
 
%>
