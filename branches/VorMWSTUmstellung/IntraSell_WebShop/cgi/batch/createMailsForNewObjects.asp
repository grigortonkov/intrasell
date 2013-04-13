<!--#include file="../defaulthead.inc"-->
Batch Job "Send Mails with new Objects to all Users"<br>
Important: This job only creates mails, please use the mail tool to send the emails!<br>
<%
'Sends once a day mails with new Product to all registered users 

 Const mailname = "email_new_products.htm"
 Dim mailtext: mailtext=readTextFile(Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname))	
 	  	   
 'Response.Write "mailtext:" & mailtext & Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname) : Response.Flush
 Dim addFormElements, singleFormElement
 addFormElements = ""
 Dim sqlBatch: sqlBatch = "SELECT UserQueries.QueryId,  " & _
					 " ofAdressen.Idnr, ofAdressen.Name, ofAdressen.Vorname, ofAdressen.Email, IntervalInDays, NextRun, SQLDescription, SQLString  " & _ 
					 " FROM ofAdressen , UserQueries " & _ 
					 " WHERE ofAdressen.IDNR = UserQueries.UserId " & _
					 " and IntervalInDays>=1 and NextRun <=" & SQLNOW(0)		  
 Dim rsBatch: set rsBatch = ObjConnectionExecute(sqlBatch)

Dim EmailAnbieter
Dim subject, userMailtext  
Dim sqlNewObjects, rsNewObjects 
Dim objectFound 
Dim sqlK 'some sql holder 
Dim totalMailsCreated : totalMailsCreated = 0
Dim totalQueriesChecked : totalQueriesChecked = 0
while not rsBatch.EOF
totalQueriesChecked = totalQueriesChecked +1 
         userMailtext = mailtext & "" 'copy from template 
         objectFound = false 'true when some found  
	     EmailAnbieter = rsBatch("Email") 
	     sqlNewObjects = rsBatch("SQLString")
         Subject = getTranslation("Neue Objekte eingetroffen! Ihre Suche:") & rsBatch("SQLDescription") 
         
         'Response.Write "<br>sqlBatch('SQLString')=" & sqlNewObjects:Response.Flush
         sqlNewObjects = replace(sqlNewObjects, "~", "'")
         sqlNewObjects = sqlNewObjects & " AND angelegtAm > " & SQLNOW(-1*(rsBatch("IntervalInDays")))
		 set rsNewObjects = objConnectionExecute(sqlNewObjects)
		 
		 dim htmlListNewObjects:htmlListNewObjects=""
		 Dim counterI: counterI = 0 
		 while not rsNewObjects.eof 
		    counterI = counterI + 1 
		    objectFound = true 
		    htmlListNewObjects = htmlListNewObjects & _ 
		                         counterI & ".&nbsp;<a href='http://" & varvalue("DOMAIN") & "/default.asp?ArtNr=" & rsNewObjects("ArtNr") & "'>"  & _ 
		                         rsNewObjects("Bezeichnung") & "</a><br>"
		    rsNewObjects.moveNext 
		    
		 wend 
		 rsNewObjects.close 
		 set rsNewObjects = nothing
		 
		 'prepare mail 
		 if objectFound then 
		             userMailtext = replace(userMailtext, "[NAME]", rsBatch("Name")) 
		             userMailtext = replace(userMailtext, "[VORNAME]", rsBatch("Vorname")) 
		             userMailtext = replace(userMailtext, "[EMAIL]", rsBatch("Email")) 
					 userMailtext = replace(userMailtext, "[PRODUCTLIST]", htmlListNewObjects) 
					 
					if lcase(request("debug")) = "true" then 
					    response.Write "sqlNewObjects=" & sqlNewObjects
						response.Write "Emailtext:<hr/>" & userMailtext & "<hr/>"
					end if 

	                userMailtext = replace(userMailtext,"""","~") 
					userMailtext = replace(userMailtext,"'","~") 
	   
					'send to webmaster too 
					call sendMailFrom(EmailAnbieter, subject,  userMailtext , varvalue("EMAIL"))
					if  true then 
					totalMailsCreated = totalMailsCreated + 1 
						sqlK = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & _ 
							    rsBatch("idnr") & ",'" & subject & "','" & userMailtext & "')"
						objConnectionExecute(sqlK)	    
						
						'TODO: save this for the statistics 
						sqlK = "Update UserQueries set NextRun =" & SQLNOW(rsBatch("IntervalInDays")) & " where queryId=" & rsBatch("QueryId")
						objConnectionExecute(sqlK)
						
					else 
					    Response.Write "Cannot send/save Email!<br>"
					end if 
					
		else ' no object found 
		   Response.Write "<br>No Objects found for QueryId=" & rsBatch("QueryId") & " and Email: " &  rsBatch("Email")
		end if 
		rsBatch.MoveNext 
wend 
rsBatch.close 
'send mail to the administrator 
Dim mailToAdmin: mailToAdmin = "totalMailsCreated=" & totalMailsCreated & ", totalQueriesChecked=" & totalQueriesChecked
call sendMailFromWithSending(varvalue("EMAIL"), "Batch Job New Objects", mailtoAdmin , varvalue("EMAIL"))	
Response.Write "<br>Please do not forget to send all Emails from this batch!"         
%>
