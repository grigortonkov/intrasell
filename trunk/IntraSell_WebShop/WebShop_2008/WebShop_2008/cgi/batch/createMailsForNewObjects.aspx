<!--#include file="../defaulthead.inc"-->
Batch Job "Send Mails with new Objects to all Users"<br>
Important: This job only creates mails, please use the mail tool to send the emails!<br>
<%
    'Sends once a day mails with new Product to all registered users 

    Const mailname = "email_new_products.htm"
    Dim mailtext : mailtext = readTextFile(Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname))
 	  	   
    'Response.Write "mailtext:" & mailtext & Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname) : Response.Flush
    Dim addFormElements, singleFormElement
    addFormElements = ""
    Dim sqlBatch : sqlBatch = "SELECT UserQueries.QueryId,  " & _
         " ofAdressen.Idnr, ofAdressen.Name, ofAdressen.Vorname, ofAdressen.Email, IntervalInDays, NextRun, SQLDescription, SQLString  " & _
         " FROM ofAdressen , UserQueries " & _
         " WHERE ofAdressen.IDNR = UserQueries.UserId " & _
         " and IntervalInDays>=1 and NextRun <=" & SQLNOW(0)
    Dim rsBatch : rsBatch = ObjConnectionExecute(sqlBatch)

    Dim EmailAnbieter
    Dim subject, userMailtext
    Dim sqlNewObjects, rsNewObjects
    Dim objectFound
    Dim sqlK 'some sql holder 
    Dim totalMailsCreated : totalMailsCreated = 0
    Dim totalQueriesChecked : totalQueriesChecked = 0
    While Not rsBatch.EOF
        totalQueriesChecked = totalQueriesChecked + 1
        userMailtext = mailtext & "" 'copy from template 
        objectFound = False 'true when some found  
        EmailAnbieter = rsBatch("Email").Value
        sqlNewObjects = rsBatch("SQLString").Value
        subject = getTranslation("Neue Objekte eingetroffen! Ihre Suche:") & rsBatch("SQLDescription").Value
         
        'Response.Write "<br>sqlBatch('SQLString')=" & sqlNewObjects:Response.Flush
        sqlNewObjects = Replace(sqlNewObjects, "~", "'")
        sqlNewObjects = sqlNewObjects & " AND angelegtAm > " & SQLNOW(-1 * (rsBatch("IntervalInDays").Value))
        rsNewObjects = objConnectionExecute(sqlNewObjects)
		 
        Dim htmlListNewObjects : htmlListNewObjects = ""
        Dim counterI : counterI = 0
        While Not rsNewObjects.eof
            counterI = counterI + 1
            objectFound = True
            htmlListNewObjects = htmlListNewObjects & _
                                 counterI & ".&nbsp;<a href='http://" & varvalue("DOMAIN") & "/default.aspx?ArtNr=" & rsNewObjects("ArtNr").Value & "'>" & _
                                 rsNewObjects("Bezeichnung").Value & "</a><br>"
            rsNewObjects.moveNext()
		    
        End While
        rsNewObjects.close()
        rsNewObjects = Nothing
		 
        'prepare mail 
        If objectFound Then
            userMailtext = Replace(userMailtext, "[NAME]", rsBatch("Name").Value)
            userMailtext = Replace(userMailtext, "[VORNAME]", rsBatch("Vorname").Value)
            userMailtext = Replace(userMailtext, "[EMAIL]", rsBatch("Email").Value)
            userMailtext = Replace(userMailtext, "[PRODUCTLIST]", htmlListNewObjects)
					 
            If LCase(Request("debug")) = "true" Then
                Response.Write("sqlNewObjects=" & sqlNewObjects)
                Response.Write("Emailtext:<hr/>" & userMailtext & "<hr/>")
            End If

            userMailtext = Replace(userMailtext, """", "~")
            userMailtext = Replace(userMailtext, "'", "~")
	   
            'send to webmaster too 
            Call sendMailFrom(EmailAnbieter, subject, userMailtext, varvalue("EMAIL"))
            If True Then
                totalMailsCreated = totalMailsCreated + 1
                sqlK = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & _
                     rsBatch("idnr").Value & ",'" & subject & "','" & userMailtext & "')"
                objConnectionExecute(sqlK)
						
                'TODO: save this for the statistics 
                sqlK = "Update UserQueries set NextRun =" & SQLNOW(rsBatch("IntervalInDays").Value) & " where queryId=" & rsBatch("QueryId").Value
                objConnectionExecute(sqlK)
						
            Else
                Response.Write("Cannot send/save Email!<br>")
            End If
					
        Else ' no object found 
            Response.Write("<br>No Objects found for QueryId=" & rsBatch("QueryId").Value & " and Email: " & rsBatch("Email").Value)
        End If
        rsBatch.MoveNext()
    End While
    rsBatch.close()
    'send mail to the administrator 
    Dim mailToAdmin : mailToAdmin = "totalMailsCreated=" & totalMailsCreated & ", totalQueriesChecked=" & totalQueriesChecked
    Call sendMailFromWithSending(varvalue("EMAIL"), "Batch Job New Objects", mailToAdmin, varvalue("EMAIL"))
    Response.Write("<br>Please do not forget to send all Emails from this batch!")
%>
