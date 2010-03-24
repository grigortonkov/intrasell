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

    BASENAME = Session("BASENAME")
    dbType = Session("dbType")
    
    '********************************************************************
    ' get db connecit5on from global.asa file
    '********************************************************************

    If (objConnection) Is Nothing Then
        Response.Write("No Database Connection! Please set it in the global.asa file!")
        Response.End()
    Else
        'On Error resume next 
        'set objConnection = Session("objConnection")
        'On Error GoTo 0
    End If

    '********************************************************************
    'RECOVER SQL Connection, to work properly the transaction cannot be supported!!! just for client part 
    '********************************************************************
    'On Error resume next 
    If InStr(VARVALUE("Email").ToString(), "@") <= 0 Then ' DB connection is NOT okay!!!! 
        ' On Error GoTo 0
        'create new connection
        Response.Write("The DB connection is not okay! Please report to system administrator!") : Response.Flush()
        'Response.write "Trying to resume it..."  & Session ("MyDSN") 
        objConnection = Server.CreateObject("adodb.connection")
        objConnection.open(Session("MyDSN"))
        'Set Session("objConnection") = 	objConnection
        'Response.Write "DB connection created!"
    Else 'DB connection is okay!!!! 
        'Response.Write "DB connection is Okay!" 
    End If
    'On Error GoTo 0
    'END recover 
    
    htmlstart = ""
    htmlend = ""
    rowstart = ""
    rowend = ""
    fieldstart = ""
    fieldend = ""
    namestart = ""
    nameend = ""
    'fieldnames
    fieldnames = False
    'End Sub

    
%>

<script language="VB" runat="server"> 
    'This vars must be set in the global asa file!�!!! 
    Dim BASENAME As Object ': BASENAME = Session("BASENAME")
    Dim dbType ': dbType = Session("dbType")
    Dim objConnection As Object
 
 
 
    
    '********************************************************************
    'returns string that represents date in SQL 92 format for access or SQL server
    '********************************************************************
    Function SQLDATE(ByVal abstand) As String
        Dim d : d = Date.Today + abstand
        If dbType = "ACCESS" Then
            SQLDATE = "#" & Month(d) & "/" & Day(d) & "/" & Year(d) & "#"
        Else 'SQL server
            SQLDATE = "'" & Day(d) & "." & Month(d) & "." & Year(d) & "'"
        End If

        If dbType = "MySQL" Then
            SQLDATE = "'" & Year(d) & "-" & Month(d) & "-" & Day(d) & "'"
        End If
    End Function

    '********************************************************************
    'ACCESS VERSION
    'germanDate = dd.mm.yyyy
    ' Warning ! this function works only at account with german language set! 
    '********************************************************************
    Function TOSQLDATE(ByVal germanDate)
        Dim d : d = Date.Today
        d = germanDate
        If dbType = "ACCESS" Then
            TOSQLDATE = "#" & Month(d) & "/" & Day(d) & "/" & Year(d) & "#"
        Else
            If dbType = "SQL" Then
                TOSQLDATE = "'" & Day(d) & "." & Month(d) & "." & Year(d) & "'"
            Else
                If dbType = "MySQL" Then
                    'yyyy-mm-dd
                    TOSQLDATE = "'" & Year(d) & "-" & Month(d) & "-" & Day(d) & "'"
                End If
            End If
        End If
    End Function

    '********************************************************************
    ' ACCESS AND SQL AND MySQL VERSION
    ' abstand in Days
    '********************************************************************
    Function SQLNOW(ByVal abstand)
        abstand = Replace(abstand, ",", ".") 'convert to SQL format
        If dbType = "ACCESS" Then 'ACCESS VERSION 
            SQLNOW = "NOW()+" & abstand
        Else  'SQL SERVER VERSION 
            If dbType = "SQL" Then
                SQLNOW = "CURRENT_TIMESTAMP+" & Replace(abstand, ",", ".")
            Else
                If dbType = "MySQL" Then
                    'wrong->SQLNOW = "(CURRENT_TIMESTAMP+" & "240000*(" & replace(abstand,",",".")  & "))"
                    'wrong->SQLNOW = "(DATE_ADD(NOW(), INTERVAL " & abstand & " DAY))" 
                    'response.Write "abstand=" & cdbl(abstand)
                    Dim abstandInSeconds : abstandInSeconds = 24 * 60 * 60 * CDbl(abstand)
                    SQLNOW = "(DATE_ADD(NOW(), INTERVAL " & abstandInSeconds & " SECOND))"
                End If
            End If
        End If
    End Function

    'Example stringDate = 31.12.2004 in German Format
    Function makeSQLDate(ByVal stringDate)
        If UCase(Session("dbType")) = "ACCESS" Then
            makeSQLDate = "#" & Mid(stringDate, 4, 2) & "/" & Mid(stringDate, 1, 2) & "/" & Mid(stringDate, 7, 4) & "#"
        Else
            If UCase(Session("dbType")) = "SQL" Then 'MS SQL Server 
                If UCase(Session("DB_LANGUAGE")) = "DE" Then 'German Date Format
                    makeSQLDate = "'" & Mid(stringDate, 1, 2) & "." & Mid(stringDate, 4, 2) & "." & Mid(stringDate, 7, 4) & "'"
                Else 'english format
                    makeSQLDate = "'" & Mid(stringDate, 4, 2) & "/" & Mid(stringDate, 1, 2) & "/" & Mid(stringDate, 7, 4) & "'"
                End If
            Else 'MYSQL
                makeSQLDate = "CURRENT_TIMESTAMP" ' nicht unterst�tzt!
            End If
        End If
    End Function

    'converts 1/10/2002 to 10.01.2002
    ' 
    Function makeStringDate(ByVal sqlDate)
        sqlDate = sqlDate & ""
        If InStr(sqlDate, "/") <= 0 Then makeStringDate = sqlDate : Exit Function
        Dim tokens
        tokens = Split(sqlDate, "/")
        makeStringDate = Right("0" & tokens(1), 2) & "." & Right("0" & tokens(0), 2) & "." & Right("0000" & tokens(2), 4)
    End Function

    '********************************************************************
    ' SQL SERVER
    ' Formats Date object as dd.mm.yyyy String 
    '********************************************************************
    Function GermanSQLDate(ByVal d)
        GermanSQLDate = Day(d) & "." & Month(d) & "." & Year(d)
    End Function


    '********************************************************************
    ' ONLY FOR SQL SERVER
    ' Formats Date object as dd.mm.yyyy DAte - clenas the time part .works only on SQL server 
    '********************************************************************
    Function DateFormat(ByVal dField)
        'for english language 
        'DateFormat =  "CAST(RTRIM(CAST(MONTH(" & dField & ")  as CHAR)) + '/' + RTRIM(CAST(DAY(" & dField & ") as CHAR)) +  '/' + Rtrim(CAST(YEAR(" & dField & ")  as CHAR)) AS DATETIME)"
    
        'for german language 
        DateFormat = "CAST(RTRIM(CAST(DAY(" & dField & ")  as CHAR)) + '.' + RTRIM(CAST(MONTH(" & dField & ") as CHAR)) +  '.' + Rtrim(CAST(YEAR(" & dField & ")  as CHAR)) AS DATETIME)"
    End Function

    '******************************************************************************
    ' SQL QUERY WRAPPER
    ' wrapper function because of problems with mySQL databases
    '
    ' Param: showSQLSlowerThan=10
    ' if parameter showSQLSlowerThan=10 then the sql that is slower 
    ' than the paramter in milliseconds will be displaid 
    '******************************************************************************
    Public Function objConnectionExecute(ByVal sql)
        Dim startTime : startTime = Now()
        If dbType = "MySQL" Then 'mySQL cannot read table names like '[grArtikel-KAtegorien] -> they must be translated 
            sql = Replace(sql, "[", "`")
            sql = Replace(sql, "]", "`")
        End If
    
        If showDebug() Then
            Response.Write("<br>" & sql) : Response.Flush()
        End If
   
        On Error GoTo 0
        Err.Clear()
        On Error Resume Next 'catch the MSDE Error 'SQL Server does not exist or access denied. 
        objConnectionExecute = objConnection.Execute(sql)

        If Err.Number <> 0 Then
            'if showDebug() then 
            Response.Write("<font color=red>" & Err.Number & ":" & Err.Description & "</font>")
            Response.Write("Wrong SQL:" & sql)
            If InStr(Err.Description, "does not exist") > 0 Then 'try again
                objConnectionExecute = objConnectionExecute(sql) 'try again, till asp timeout error happens 
            End If
            Response.End()
        End If
   
        Dim endTime : endTime = Now()
   
        If Request("showSQLSlowerThan") & "" <> "" Then 'specified 
            Dim execTime : execTime = (endTime - startTime) * 24 * 60 * 60 * 100
            If execTime > CLng(Request("showSQLSlowerThan")) Then
                Response.Write("<br><font color=red>Slow SQL:" & sql & "</font>") : Response.Flush()
                Response.Write("ExecTime was: " & execTime)
            End If
        End If
        'Response.Write "ExecTime: " & execTime  
    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN DER VARS TABELLE
    '********************************************************************
    Function VARVALUE(ByVal varname As String) As String
        Dim temp
        Dim CACHE_NAME : CACHE_NAME = "VARVALUE_" & varname
        temp = getCache(CACHE_NAME)
        If temp = "" Then 'set cache  
            temp = setCache(CACHE_NAME, VARVALUE_NO_CHACHE(varname))
        End If
        VARVALUE = temp
    End Function

    Function VARVALUE_NO_CHACHE(ByVal varname) As String
        Dim rs, SQLString
        SQLString = "SELECT * FROM ofVARS WHERE Name='" & varname & "'"
        rs = objConnection.Execute(SQLString)
        If rs.EOF Then
            VARVALUE_NO_CHACHE = ""
            Response.Write("Die Variable " & varname & " ist nicht vorhanden!!!")
        Else
            VARVALUE_NO_CHACHE = rs.fields.Item("Wert").Value()
        End If
        rs.close()
    End Function

    '********************************************************************
    'SPEICHERT EINE VARIABLE IN DIE VARS TABELLE
    '********************************************************************
    Public Function SETVARVALUE(ByVal varname, ByVal varvalue)
        'DoCmd.SetWarnings False
        Dim SQLString
        'try insert first 
        Dim varExists : varExists = VARVALUE_NO_CHACHE(varname)
   
        If varExists & "" = "" Then
            SQLString = "INSERT INTO ofVARS (Id, Wert,[Name]) values(" & nextId("ofVars", "Id") & ", '" & varvalue & "', '" & varname & "')"
            'on error resume next 'error because constraint on name when double import
            Call objConnectionExecute(SQLString)
        End If
        'on error goto 0
        'now update 
        SQLString = "UPDATE ofVARS Set Wert = '" & varvalue & "' WHERE Name='" & varname & "'"
        Call objConnectionExecute(SQLString)
        SETVARVALUE = varvalue
        'DoCmd.SetWarnings True
    End Function


    '********************************************************************
    'SUCHT EINE VARIABLE IN DIE VARS TABELLE und SETZT DIESE FALLS NICHT DEFINIERT
    '********************************************************************
    Function VARVALUE_DEFAULT(ByVal varname, ByVal default_value) As String  'from cache 
        Dim temp : temp = VARVALUE_NO_CHACHE(varname)
        If temp & "" = "" Then 'ist noch nicht definiert 
            VARVALUE_DEFAULT = SETVARVALUE(varname, default_value)
        Else
            VARVALUE_DEFAULT = temp
        End If
    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN EINE TABELLE
    '********************************************************************
    Function TABLEVALUE(ByVal tablename, ByVal colname, ByVal varname, ByVal searchfield) As String
        On Error Resume Next
        Dim rs
        If Trim(tablename & "") = "" Or Trim(colname & "") = "" Or Trim(varname & "") = "" Or Trim(searchfield & "") = "" Then
            TABLEVALUE = "<font color=red>Wrong usage! Parameter " & varname & " ist nicht vorhanden!</font>"
            Exit Function
        End If
        'on error resume next
        'response.write varname
        Dim SQLString
        SQLString = "SELECT " & searchfield & " FROM " & tablename & " WHERE " & colname & "=" & varname
        'SQLString = "SELECT * FROM " &  tablename & " WHERE " & colname & "=" & varname  
        'response.write SQLString & " --> " & searchfield 
        'Response.Flush
        rs = objConnectionExecute(SQLString)
        If rs.EOF Then
            TABLEVALUE = "<font color=red>Datensatz [" + searchfield + "] in Tabelle [" + tablename + "] und spalte [" + colname + "] mit Wert " & varname & " ist nicht vorhanden!</font>"
        Else
            TABLEVALUE = rs(searchfield)
        End If
        rs.close()
    End Function

    '********************************************************************
    'SUCHT EINE VARIABLE IN EINE TABELLE
    '********************************************************************
    Function FIRSTVALUE(ByVal SQLString) As String
        Dim rs
        rs = objConnectionExecute(SQLString)
        If rs.EOF Then
            FIRSTVALUE = "N.A."
        Else
            FIRSTVALUE = rs(0)
        End If
        rs.close()
    End Function


    '=============================================================================
    ' getFirstField
    '=============================================================================
    Function getFirstField(ByVal sql) As String
        Dim rs

        rs = objConnectionExecute(sql)
        If rs.EOF Then
            getFirstField = Nothing
        Else
            getFirstField = rs.fields(0)
        End If
        rs.close()
    End Function

    Public Function isDebug() As Boolean
        isDebug = showDebug()
    End Function

    Public Function debug() As Boolean
        debug = showDebug()
    End Function

    Public Function showDebug() As Boolean
        If UCase(Request("DEBUG")) = "TRUE" Then
            showDebug = True
        Else
            showDebug = False
        End If
         
    End Function

    '********************************************************************
    'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
    '********************************************************************
    Public Function sendMailFromWithSending(ByVal Recipient, ByVal Subject, ByVal MailText, ByVal From_Email) As Boolean
        'on error resume next 
 
        If showDebug() Then
            Response.Write("<br/>Start sendMailFromWithSending")
            Response.Write("<br/>Recipient: " & Recipient)
            Response.Write("<br/>Subject: " & Subject)
            Response.Write("<br/>From_Email: " & From_Email)
            Response.Write("<br/>MAILER_COMPONENT_NAME: " & VARVALUE("MAILER_COMPONENT_NAME"))
            Response.Write("<br/>")
        End If
 
        'Basic checks 
        If Recipient & "" = "" Then
            Response.Write("<br><b><p class='error'><font color=red>Function sendMailFromWithSending: Recipient is empty</font></p></b><br>")
        End If
 
        'Basic checks 
        If From_Email & "" = "" Then
            Response.Write("<br><b><p class='error'><font color=red>Function sendMailFromWithSending: From_Email is empty</font></p></b><br>")
        End If
 

        'SET THE MAILER COMPONENT HERE!!!
        Dim MailerComponentName : MailerComponentName = VARVALUE("MAILER_COMPONENT_NAME")
 
        If MailerComponentName = "PERSISTS" Then
            sendMailFromWithSending = sendMailFromWithSendingPersists(Recipient, Subject, MailText, From_Email)
            'exit function 
        End If
 
        If MailerComponentName = "SVG" Then
            sendMailFromWithSending = sendMailFromWithSendingSVG(Recipient, Subject, MailText, From_Email)
            'exit function 
        End If
 
        If MailerComponentName = "CDONT" Then
            sendMailFromWithSending = sendMailFromWithSendingCDONT(Recipient, Subject, MailText, From_Email)
            'exit function 
        End If
 
        'START ERROR HANDLING
        If Err.Number = 0 Then
            'Response.write "OK"   
        Else
            Response.Write("<br><font color=red>Error Number= #<b>" & Err.Number & "</font></b><br>")
            Response.Write(Err.Description)
            sendMailFromWithSending = False
        End If 'END ERROR HANDLING
 
    End Function

    Function sendMailFromWithSendingCDONT(ByVal Recipient, ByVal Subject, ByVal MailText, ByVal from_email) As Boolean
        Const cstCdoMailFormatMime = 1
        Const cstCdoMailFormatText = 0

        Const cstCdoBodyFormatHTML = 0
        Const cstCdoBodyFormatText = 1

        Const cstCdoLow = 0   ' Low importance  
        Const cstCdoNormal = 1   ' Normal importance (default)  
        Const cstCdoHigh = 2   ' High importance  

        Dim myCDONTSMail
        myCDONTSMail = CreateObject("CDONTS.NewMail")
        myCDONTSMail.Importance = cstCdoHigh
        myCDONTSMail.MailFormat = cstCdoBodyFormatHTML
        myCDONTSMail.BodyFormat = cstCdoBodyFormatHTML

        myCDONTSMail.Send(from_email, Recipient, Subject, MailText, 0) 'lngImportance
        myCDONTSMail = Nothing
        sendMailFromWithSendingCDONT = True '"Mail has been sent."
    End Function

    '********************************************************************
    'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
    ' SENDS HTML MAILS
    '********************************************************************
    Function sendMailFromWithSendingPersists(ByVal Recipient, ByVal Subject, ByVal MailText, ByVal from_email) As Boolean
        On Error Resume Next
        sendMailFromWithSendingPersists = False
        'on error resume next 
        If Len(Trim(Recipient)) > 4 Then
            Dim Mail
            Mail = Server.CreateObject("Persits.MailSender")
            Mail.Host = VARVALUE("SMTP")
            'Mail.Port = 35
            Mail.From = from_email
            'Mail.AppendBodyFromFile "d:\dir\SampleBody.htm"
            'Mail.AddEmbeddedImage "d:\dir\margin.gif", "My-Background-Image"
            Mail.AddAddress(Recipient)
            Mail.Subject = Subject
            'Response.write "Mail:" & Recipient & Subject & MailText &  from_email  
            Mail.Body = MailText
            Mail.isHTML = True
     
            Mail.Send()
            sendMailFromWithSendingPersists = True
        Else
            sendMailFromWithSendingPersists = False
        End If
    End Function

    '********************************************************************
    'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
    '********************************************************************
    Function sendMailFromWithSendingSVG(ByVal Recipient, ByVal Subject, ByVal MailText, ByVal from_email)
        'on error resume next 
        'Response.Write "Send mail from " & from_email & " to " & Recipient
        If Len(Trim(Recipient)) > 4 Then
            Dim Mailer
            Mailer = Server.CreateObject("SMTPsvg.Mailer")
            Mailer.FromName = from_email
            Mailer.FromAddress = from_email
            'Mailer.FromAddress = "xx@xxx.at"
            Mailer.Subject = Subject
            Mailer.BodyText = MailText
            Mailer.RemoteHost = VARVALUE("SMTP")
            Mailer.AddRecipient(Recipient, Recipient)

            If Mailer.SendMail Then
                'Message sent sucessfully 
                Response.Write("Your message was sent")
                sendMailFromWithSendingSVG = True
            Else
                'Message send failure 
                Response.Write("Your message was not sent. ")
                Response.Write("The error was: " & Mailer.Response)
                sendMailFromWithSendingSVG = False
            End If
	
        Else
            Response.Write("The recipient is invalid!")
            sendMailFromWithSendingSVG = False
        End If
    End Function



    '********************************************************************
    'SENDS DIRECTLY THE EMAIL WITHOUT TO SAVE IT IN THE Table for Sending
    '********************************************************************
    Sub sendSpamMail(ByVal Recipient As String, ByVal Subject As String, ByVal MailText As String, ByVal from_email As String)
        If Len(Trim(Recipient)) > 4 Then
            Dim mail
            mail = Server.CreateObject("Persits.MailSender")
            mail.Host = VARVALUE("SMTPSPAM")
            'Mail.Port = 35
            mail.From = from_email
            'Mail.AppendBodyFromFile "d:\dir\SampleBody.htm"
            'Mail.AddEmbeddedImage "d:\dir\margin.gif", "My-Background-Image"
            mail.AddAddress(Recipient)
            mail.Subject = Subject
            'Response.write "Mail:" & Recipient & Subject & MailText &  from_email  
            mail.Body = MailText
            mail.Send()
        End If
    End Sub

    '********************************************************************
    ' sendMailFrom
    '********************************************************************
    Function sendMailFrom(ByVal Recipient, ByVal Subject, ByVal Text, ByVal from_email) As Boolean
        sendMailFrom = False
        If Len(Trim(Recipient)) > 4 Then
            Dim sql
            sql = "INSERT INTO MailsToSend(Recipient , Subject , MailText, from_email, priority) " & _
                  " VALUES('" & _
                    Recipient & "','" & Subject & "','" & Text & "','" & from_email & "', 1)"
            objConnectionExecute(sql)
            sendMailFrom = True
        End If
    End Function


    'SUB sendMail(Recipient , Subject , Text)
    ' from_email ="Evelyn@date-for-you.com"
    ' call sendMailFrom (Recipient , Subject , Text, from_email)
    'END Sub


    '********************************************************************
    'saves user logs in table Login
    '********************************************************************
    Function LOG()
        'STATS
        'ON ERROR RESUME NEXT 
        Dim SQLQuery As String
        ' save statistics
        Dim requestedFile As String
        requestedFile = Request.ServerVariables("PATH_TRANSLATED")
        While InStr(requestedFile, "\") > 0  ' remove path 
            requestedFile = Mid(requestedFile, InStr(requestedFile, "\") + 1)
        End While
   
        SQLQuery = "INSERT INTO login(PATH_TRANSLATED,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER,HTTP_REFERER)  VALUES " & _
        "('" & requestedFile & "?" & Request.QueryString.ToString() & "','" & _
         Request.ServerVariables("REMOTE_ADDR") & " ','" & _
         Request.ServerVariables("REMOTE_HOST") & "','" & _
         Request.ServerVariables("REMOTE_USER") & "','" & _
         Request.ServerVariables("HTTP_REFERER") & "')"

        'Response.write SQLQuery

        objConnectionExecute(SQLQuery)
    End Function

    '********************************************************************
    'extracts only the filename from fullfilename
    ' example: c:\autoexec.bat
    ' return autoexec.bat
    '********************************************************************
    Function getOnlyFilename(ByVal fullFilename)
        Dim arrayString
        If InStr(fullFilename, "\") > 0 Then
            arrayString = Split(fullFilename, "\")
            getOnlyFilename = arrayString(UBound(arrayString))
        Else
            getOnlyFilename = fullFilename
        End If
    End Function


    '********************************************************************
    'creates recursively all folders 
    'Filename = c:\daten\test\xxxx 
    '********************************************************************
    Function createFoldersIfNotExists(ByVal Filename)
        'CREATE DIRECTORY IF NOT EXISTS 
           
        'Response.Write "<BR>Create Directory if not exists." 
        Dim FULLFOLDER
        FULLFOLDER = Left(Filename, InStr(Filename, getOnlyFilename(Filename)) - 2)
        'Response.Write "Foder to crate is : " & FULLFOLDER
    
        Dim filesystem
        filesystem = CreateObject("Scripting.FileSystemObject")
        Dim PARTFOLDER, FULLPARTFOLDER
        FULLPARTFOLDER = ""
	
        For Each PARTFOLDER In Split(FULLFOLDER, "\")
            FULLPARTFOLDER = FULLPARTFOLDER & PARTFOLDER & "\"
            'Response.Write "<BR>FULLPARTFOLDER=" & FULLPARTFOLDER
            'Response.Flush
            If Not filesystem.FolderExists(FULLPARTFOLDER) Then
                filesystem.createFolder(FULLPARTFOLDER) 'for files 
            End If
        Next
	
    End Function


    '********************************************************************
    'CHECKS if A FILE EXISTS
    ' mypath - relative path 
    ' sfilename - name to exist 
    '********************************************************************
    Function file_exists(ByVal mypath As String, ByVal sfilename As String) As Boolean
        Dim found As Boolean
        found = False
        Dim FileSystem
        Dim Folder
        Dim FileCollection
        Dim File
        Dim fn As String
    
        FileSystem = CreateObject("Scripting.FileSystemObject")
        Folder = FileSystem.GetFolder(Server.MapPath(mypath))
        FileCollection = Folder.Files
	
        For Each File In FileCollection
            fn = File.name
	 
            If (fn = sfilename) Then
                found = True
            End If
        Next
	 	
        FileSystem = Nothing
        Folder = Nothing
        FileCollection = Nothing
        file_exists = found
    End Function


    '********************************************************************
    ' FILE  EXISTS 
    ' sfilename - name to exist 
    '********************************************************************
    Function FileExists(ByVal filename) As Boolean
        On Error Resume Next
        Dim filesystem
        filesystem = CreateObject("Scripting.FileSystemObject")
        FileExists = filesystem.FileExists(filename)
        filesystem = Nothing
    End Function

    '********************************************************************
    ' DELETE FILE 
    ' sfilename - name to exist 
    '********************************************************************
    Function DeleteFile(ByVal filename) As Boolean
        On Error Resume Next
        Dim filesystem
        filesystem = CreateObject("Scripting.FileSystemObject")

        filesystem.DeleteFile(filename)
        filesystem = Nothing
        DeleteFile = True
    End Function


    '********************************************************************
    ' DELETE FOLDER 
    ' sfilename - name to exist 
    '********************************************************************
    Function DeleteFolder(ByVal foldername)
        ' On error resume next 
        If foldername <> "" Then
            Dim filesystem
            filesystem = CreateObject("Scripting.FileSystemObject")
            If filesystem.FolderExists(foldername) Then
                filesystem.DeleteFolder(foldername, True)
            End If
            filesystem = Nothing
            DeleteFolder = True
        End If
    End Function

    '********************************************************************
    ' COPY FILE 
    ' sfilename - name to exist 
    '********************************************************************
    Function CopyFile(ByVal filename, ByVal toFilename)
        Dim filesystem
        filesystem = CreateObject("Scripting.FileSystemObject")

        filesystem.CopyFile(filename, toFilename)
        filesystem = Nothing
        CopyFile = True
    End Function

    '********************************************************************
    ' COPY FILE 
    ' sfilename - name to exist 
    '********************************************************************
    Function MoveFile(ByVal filename, ByVal toFilename)
        Dim filesystem
        filesystem = CreateObject("Scripting.FileSystemObject")

        filesystem.MoveFile(filename, toFilename)
        filesystem = Nothing
        MoveFile = True

    End Function

    '********************************************************************
    ' CREATE FOLDER
    '********************************************************************
    Function Createfolder(ByVal folder)
        Dim filesystem
        filesystem = CreateObject("Scripting.FileSystemObject")
        filesystem.CreateFolder(folder)
        filesystem = Nothing
        'file_delete = True
    End Function

    'CLEANS THE USER INPUT FROM UNNOLLOWED CHARS 
    Function cleanUserInput(ByVal userInput)
        Dim cleaned
        Dim errorFound : errorFound = False
		
        cleaned = Replace(userInput, "*", "")
        cleaned = Replace(cleaned, "%", "")
        cleaned = Replace(cleaned, "'", "")
        'cleaned = replace(cleaned,"""","")
	
        If InStr(UCase(userInput), "DELETE") > 0 Then
            errorFound = True
        End If
		
        If InStr(UCase(userInput), "DROP") > 0 Then
            errorFound = True
        End If

        If InStr(UCase(userInput), "SELECT") > 0 Then
            errorFound = True
        End If

        If InStr(UCase(userInput), "EXEC") > 0 Then
            errorFound = True
        End If
		
        'shitched off because of EAN Numbers with -- 		
        'if inStr(ucase(userInput),"--")>0 then
        '  errorFound = true 
        'end if  
		
        If errorFound Then
            Response.Write("<font color=red>Do not play games with with us!")
            cleanUserInput = ""
        Else
            cleanUserInput = cleaned
        End If
    End Function

    '********************************************************************
    ' DIESE FUNKTION ERSETZT EIN SYMBOL MIT EINEM ANDEREN
    ' The Name is changed from replace
    '********************************************************************
    Function replaceAll(ByVal intext, ByVal what, ByVal withsymbol)
        Dim resulttext, i
        i = 1
        resulttext = ""
        While i <= Len(intext)

            If Right(Left(intext, i), 1) = what Then
                resulttext = resulttext + withsymbol
            Else
                resulttext = resulttext + Right(Left(intext, i), 1)
            End If
            i = i + 1
        End While
        replaceAll = resulttext
    End Function

    '********************************************************************
    'Make Progress Bar - please move to Functions.asp
    '********************************************************************
    Function showProgressBar(ByVal percent, ByVal showPercents) As String
        Dim htmlStat : htmlStat = ""
        If percent > 100 Then percent = 100
        If percent < 0 Then percent = 1
  
        htmlStat = "<table border=0 width=100 cellspacing=0 cellpadding=0 height=1>" & _
        "<tr>" & _
        "  <td width=""100%"" height=""1"">" & _
        "    <table border=""0"" width=""" & percent & "%"" cellspacing=""0"" cellpadding=""0"">" & _
        "      <tr>" & _
        "        <td width=""" & percent & "%"" bordercolor=""#00FF00"" bgcolor=""#0000FF"">&nbsp;</td>" & _
        "      </tr>" & _
        "    </table>" & _
        "  </td>" & _
        "<td>"
        If showPercents Then htmlStat = htmlStat & Int(percent) & "%"
   
        htmlStat = htmlStat & "  </td>" & _
        "</tr>" & _
        "</table>"

        showProgressBar = htmlStat
    End Function


    '********************************************************************
    'format HTML Output as error 
    '********************************************************************
    Function formatAsError(ByVal html) As String
        formatAsError = "<hr><font color=red> " & html & "</font><hr>"
    End Function



    Function RegExpTest(ByVal patrn, ByVal strng)
        Dim regEx, Match, Matches ' Create variable. 
        'regEx = New RegExp ' Create regular expression. 
        regEx.Pattern = "\b" & patrn & "\b"  ' Set pattern. 
        regEx.IgnoreCase = True ' Set case insensitivity. 
        regEx.Global = True ' Set global applicability. 
        Matches = regEx.Execute(strng) ' Execute search. 

        RegExpTest = Matches.Count
    End Function


    '********************************************************************
    ' generates nextId from Table and FieldName 
    ' fileNames - array with filenames(normaly in the user's folder), if empty will be created an empty document
    ' return value is the new documentId
    '********************************************************************
    Function nextId(ByVal table As String, ByVal column As String) As Long
        Dim newId, sql, rs
        'find the next Id
        sql = "SELECT * FROM " & table
        rs = objConnectionExecute(sql)
        If rs.EOF Then
            nextId = 1
            Exit Function
        End If
        sql = "SELECT max(" & column & ") as maxId FROM " & table
        'Response.Write sql:Response.Flush
        rs = objConnectionExecute(sql)
        If rs.EOF Then
            newId = 1
        Else
            'Response.Write "MaxID=" & rs("maxId"):Response.Flush
            newId = CDbl(rs("maxId").Value) + 1
        End If

        If newId = Nothing   Then
            nextId = 1
        Else
            nextId = newId
        End If
        rs.close()
        rs = Nothing
    End Function 'createDocument 


    '********************************************************************
    'Wait - needs componets - WaitFor
    '********************************************************************
    Sub Wait(ByVal seconds)
        REM ******************************************************
        REM * Instantiate the component
        REM ******************************************************
        Dim WaitObj
        WaitObj = Server.CreateObject("WaitFor.Comp")

        'Response.Write "Beginning to wait at: " & Time & "<br>"
        Response.Flush()

        REM ******************************************************
        REM * WaitForSeconds takes one parameter:
        REM *  an integer value for the number of seconds to wait
        REM *  The component will not return until this time
        REM *  has elapsed
        REM ******************************************************
        WaitObj.WaitForSeconds(seconds)

        'Response.Write "Finished waiting: " & Time
        Response.Flush()
    End Sub


    '********************************************************************
    ' other simple function testing if string is email
    '********************************************************************
    Function CheckEmail(ByVal Email)
        'response.Write "Checking Email:" & Email: response.end
        If InStr(Email, "@") < 2 Or Len(Email) < 5 Or InStr(Email, ".") < 2 Then
            CheckEmail = False
        Else
            CheckEmail = True
        End If
    End Function


    '********************************************************************
    ' usefull function, thaht checks email format, is an strinc falid email or not 
    '********************************************************************
    Function EMailCheck(ByVal email)
        Dim FirstOcrDot
        Dim FirstOcrAt
        Dim lastOcrDot
        lastOcrDot = InStrRev(email, ".")
        FirstOcrDot = CInt(InStr(1, email, "."))
        FirstOcrAt = CInt(InStr(1, email, "@"))
        If Len(email) > 5 Then
            If FirstOcrAt > 0 Then
                If Mid(email, FirstOcrAt + 1, 1) <> "." And Mid(email, FirstOcrAt - 1, 1) <> "." Then
                    If InStr(1, email, " ") = 0 Then
                        If InStrRev(email, ".") > CInt(FirstOcrAt) + 1 Then
                            If lastOcrDot < Len(email) - 1 Then
                                If FirstOcrAt < Len(email) - 1 And FirstOcrAt > 1 Then
                                    If FirstOcrDot > 1 Then
                                        EMailCheck = True
                                        Exit Function
                                    Else
	
                                        Response.Write("Dot in starting<br>")
                                    End If
                                Else
                                    Response.Write("@ Not between first and last<br>")
                                End If
                            Else
                                Response.Write(". before last two chars<br>")
                            End If
                        Else
                            Response.Write("Last Dot after @ missing or @ and . are not seperated by a Char<br>")
                        End If
                    Else
                        Response.Write("Space Not Allowed<br>")
                    End If
                Else
                    Response.Write("A Dot Just before or after @ not allowed<br>")
                End If
            Else
                Response.Write("A required Character Missing<br> ")
            End If
        Else
            Response.Write("Email cannot be less than 6 characters<br> ")
        End If
	
        EMailCheck = False
    End Function




    '********************************************************************
    '
    '  These reusable functions were copied from 
    '  http://www.learnasp.com/learn/subreusable.asp  
    '
    '********************************************************************
    'Sub InitVars()
    Dim htmlstart As String, htmlend As String, rowstart As String, rowend As String
    Dim fieldstart As String, fieldend As String, namestart As String, nameend As String, fieldnames As String

    Dim fsa
    Dim fea
    
    Sub query2list(ByVal myquery, ByVal listname)
        htmlstart = "<select name='" & listname & "'><option></option>"
        htmlend = "</select>"
        rowstart = "<option>"
        rowend = "</option>"
        fieldstart = ""
        fieldend = ""
        Call query2html(myquery)
    End Sub

    Sub query2listMultiLines(ByVal myquery, ByVal listname, ByVal lines)
        htmlstart = "<select name='" & listname & "' size='" & lines & "'>"
        rowstart = "<option>"
        rowend = "</option>"
        htmlend = "</select>"
        fieldstart = ""
        fieldend = ""
        Call query2html(myquery)
    End Sub

    Sub query2table(ByVal myquery)
        htmlstart = "<table border=1>"
        htmlend = "</table>"
        rowstart = "<tr>"
        rowend = "</tr>"
        fieldstart = "<td valign=top>"
        fieldend = "</td>"
        Call query2html(myquery)
    End Sub

    Sub query2form(ByVal myquery)
        htmlstart = ""
        htmlend = ""
        rowstart = ""
        rowend = "<hr>"
        fieldstart = ""
        fieldend = "<br>"
        fieldnames = True
        namestart = ""
        nameend = "&nbsp;=&nbsp;"
        Call query2html(myquery)
    End Sub

    Sub query2entryform(ByVal myquery)
        htmlstart = ""
        htmlend = ""
        rowstart = ""
        rowend = ""
        fieldstart = "%name%&nbsp;=&nbsp;<input type='text name='%name%' value='"
        fieldend = "' size='%size%'><br>"
        fieldnames = False
        namestart = ""
        nameend = "&nbsp;&nbsp;="
        Call query2html(myquery)
    End Sub

    '********************************************************************
    '********************************************************************
    Sub query2html(ByVal inputquery As Object)
        'set conntemp=server.createobject("adodb.connection")
        'conntemp.open "DSN=Student;uid=student;pwd=magic"
        Dim conntemp, rstemp
        conntemp = objConnection
        rstemp = conntemp.execute(inputquery)
        If rstemp.EOF Then Exit Sub
        Dim howmanyfields, i, counter
        howmanyfields = rstemp.fields.count - 1
        ReDim fsa(howmanyfields)
        ReDim fea(howmanyfields)
        Dim tempstart, tempend
        For i = 0 To howmanyfields
            tempstart = Replace(fieldstart, "%name%", rstemp(i).name)
            tempend = Replace(fieldend, "%name%", rstemp(i).name)
            tempstart = Replace(tempstart, "%size%", rstemp(i).actualsize)
            tempend = Replace(tempend, "%size%", rstemp(i).actualsize)
            fsa(i) = tempstart
            fea(i) = tempend
        Next
        Response.Write(htmlstart & vbCrLf)
        counter = 0
        Do Until rstemp.eof
            Response.Write(rowstart & vbCrLf)
            For i = 0 To howmanyfields
                If fieldnames = True Then
                    Response.Write(namestart & rstemp(i).name & nameend)
                End If
                Response.Write(fsa(i) & rstemp(i) & fea(i) & vbCrLf)
            Next
            Response.Write(rowend & vbCrLf)
            counter = counter + 1
            rstemp.movenext()
            If Response.IsClientConnected = False Then
                Exit Do
            End If
        Loop
        'rstemp.close
        rstemp = Nothing
        'conntemp.close
        'set conntemp=nothing ' needed also by other connections
        Response.Write(htmlend)
    End Sub



    'sqlToHTML
    Public Function sqlToHTML(ByVal sql, ByVal showColNames, ByVal makeHTMLTable) As String
        Dim html
        Dim rs
        Dim i
        Dim alternateRowColor
        rs = objConnectionExecute(sql)
        html = html & "<table>"
        Dim counter : counter = 0
        While Not rs.eof
            counter = counter + 1
            If alternateRowColor = "#FFFFCC" Then alternateRowColor = "#FFFFFF" Else alternateRowColor = "#FFFFCC"
            html = html & "<tr>"
            For i = 1 To rs.fields.count
                If (counter Mod 2) = 0 Then
                    html = html & "<TD _bgcolor=""" & alternateRowColor & """ class=""alternate"">" & rs.fields(i - 1).value & " </TD>"
                Else
                    html = html & "<TD _bgcolor=""" & alternateRowColor & """>" & rs.fields(i - 1).value & " </TD>"
                End If
                'if isnumeric(rs.fields(i-1)) then  sumRow(i) = sumRow(i) + rs.fields(i-1).value 
            Next
            html = html & "</tr>"
            rs.MoveNext()
        End While
        rs.close()
        html = html & "</table>"
        sqlToHTML = html
    End Function
 
 
    'sqlToHTML
    Public Function sqlToSimple(ByVal sql, ByVal showColNames, ByVal makeHTMLTable) As String
        Dim html
        Dim rs
        Dim i
    
        rs = objConnectionExecute(sql)
        'response.write sql    

        Dim counter : counter = 0
        While Not rs.eof
            counter = counter + 1
            For i = 1 To rs.fields.count
                html = html & " " & rs.fields(i - 1).value '& rs.fields(i-1).Name
            Next
            rs.MoveNext()
        End While
        rs.close()
 
        sqlToSimple = html
    End Function
 
 
    'url = Replace(url"Ae", "�", )
    Function retainUmlaute(ByVal url) As String
        url = Replace(url, "Ae", "�")
        url = Replace(url, "Oe", "�")
        url = Replace(url, "Ue", "�")

        url = Replace(url, "Auml", "�")
        url = Replace(url, "Ouml", "�")
        url = Replace(url, "Uuml", "�")
            
        'url = Replace(url, "ae", "�")
        'url = Replace(url, "oe", "�")
        'url = Replace(url, "ue", "�")
        url = Replace(url, "&auml;", "�")
        url = Replace(url, "&ouml;", "�")
        url = Replace(url, "&uuml;", "�")
            
        url = Replace(url, "auml", "�")
        url = Replace(url, "ouml", "�")
        url = Replace(url, "uuml", "�")
            
        retainUmlaute = url
    End Function

  
  
    'adds spaces to the regquired length 
    Function pad(ByVal stringToPad, ByVal length)
  
        Dim i : i = 0
        If Len(stringToPad) < length Then
            Dim missingChars : missingChars = length - Len(stringToPad)
            For i = 1 To missingChars
                stringToPad = stringToPad & " "
            Next
            pad = stringToPad
        Else ' more the length signs 
            pad = Left(stringToPad, length - 3) & "..."
        End If
     
    End Function
 
</script>
