<!--#include file="../defaulthead.inc"-->
Batch Job "Send Mails for diabled objects to all Users"<br>
Important: This job only creates mails, please use the mail tool to send the emails!<br>
<%
'Sends once a day mails with disabled user products to their owners 
 Const PRODUCTS_DISABLED_AFTER_DAYS = 30 '-1 for test
 Const mailname = "email_disabled_products.htm"
 Dim mailtext: mailtext=readTextFile(Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname))	
 	  	   
'Response.Write "mailtext:" & mailtext & Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname) : Response.Flush
Dim addFormElements, singleFormElement: addFormElements = ""
Dim sqlBatch: sqlBatch = " SELECT DISTINCT a.HerstellerNr, l.Email, l.Name from grArtikel a, lieferantenAdressen l where " & _ 
                         " a.HerstellerNr=l.IDNR and a.ProduktAktiv<>0 and a.AngelegtAm<" & SQLNOW(-1*PRODUCTS_DISABLED_AFTER_DAYS) & _
                         " GROUP BY a.HerstellerNr, l.Email, l.Name"	
                          	  
Dim rsBatch: set rsBatch = ObjConnectionExecute(sqlBatch)
Dim emailAnbieter, subject, userMailtext  
Dim sqlNewObjects, rsNewObjects 
Dim objectFound 
Dim sqlK 'some sql holder 
Dim totalMailsCreated : totalMailsCreated = 0
Dim totalQueriesChecked : totalQueriesChecked = 0
Dim totalProductsDisabled : totalProductsDisabled = 0

while not rsBatch.EOF
         totalQueriesChecked = totalQueriesChecked +1 
         userMailtext = mailtext & "" 'copy from template 
         objectFound = false 'true when some found  
	     EmailAnbieter = rsBatch("Email") 
	     
	     sqlNewObjects = "select * from grArtikel where HerstellerNr=" & rsBatch("HerstellerNr") & _ 
	                     " and ProduktAktiv<>0 and AngelegtAm<" & SQLNOW(-1*PRODUCTS_DISABLED_AFTER_DAYS)	
	                     
         Subject = getTranslation("Ihre Objekte wurden deaktiviert!")
         
		 set rsNewObjects = objConnectionExecute(sqlNewObjects)
		 
		 Dim htmlListNewObjects:htmlListNewObjects=""
		 Dim counterI: counterI = 0 
		 while not rsNewObjects.eof
		    totalProductsDisabled = totalProductsDisabled + 1  
		    counterI = counterI + 1 
		    objectFound = true 
		    htmlListNewObjects = htmlListNewObjects & _ 
		                         counterI & ".&nbsp;<a href='http://" & varvalue("DOMAIN") & "/default.asp?ArtNr=" & rsNewObjects("ArtNr") & "'>"  & _ 
		                         rsNewObjects("Bezeichnung") & "</a> "
		 
		 'Link für Objekt aktivieren!
		    htmlListNewObjects = htmlListNewObjects & _ 
		                         ".&nbsp;<a href='http://" & varvalue("DOMAIN") & "/cgi/immo/jobs/immoAktivieren.asp?produktAktiv=-1&anbieter=" & rsBatch("HerstellerNr") & "&ArtNr=" & rsNewObjects("ArtNr") & "'>"  & _ 
		                         getTranslation("Objekt aktivieren") & "</a><br>"
		                                                 
		                         'TODO: Link so dass der User direkt von Email aktivieren kann 
		    rsNewObjects.moveNext 
		    
		 wend 
		 rsNewObjects.close 
		 set rsNewObjects = nothing
		 
		 'prepare mail 
		 if objectFound then 
		             userMailtext = replace(userMailtext, "[NAME]", rsBatch("Name")) 
		             'userMailtext = replace(userMailtext, "[VORNAME]", rsBatch("Vorname")) 
		             userMailtext = replace(userMailtext, "[EMAIL]", rsBatch("Email")) 
					 userMailtext = replace(userMailtext, "[PRODUCTLIST]", htmlListNewObjects) 
					 
					if lcase(request("debug")) = "true" then 
					    response.Write "sqlNewObjects=" & sqlNewObjects
						response.Write "Emailtext:<hr/>" & userMailtext & "<hr/>"
					end if 

	                userMailtext = replace(userMailtext,"""","~") 
					userMailtext = replace(userMailtext,"'","~") 
	   
					'send to the user'just saved in the database  
					call sendMailFrom(EmailAnbieter, subject,  userMailtext , varvalue("EMAIL"))
					if true then 
					    totalMailsCreated = totalMailsCreated + 1 
						sqlK = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & _ 
							    rsBatch("HerstellerNr") & ",'" & subject & "','" & userMailtext & "')"
						objConnectionExecute(sqlK)	    
						'TODO: save this for the statistics 
						
						'DISABLE PRODUCTS 
						sqlK = "update grArtikel set ProduktAktiv=0 " & _ 
						 " where HerstellerNr=" & rsBatch("HerstellerNr") & _ 
	                     " and ProduktAktiv<>0 and AngelegtAm<" & SQLNOW(-1*PRODUCTS_DISABLED_AFTER_DAYS) 
						objConnectionExecute(sqlK)
						
					else 
					    Response.Write "Cannot send/save Email!<br>"
					end if 
					
		else ' no object found 
		   Response.Write "<br>No Objects found for Lieferant=" & rsBatch("HerstellerNr") & " and Email: " &  rsBatch("Email")
		end if 
		rsBatch.MoveNext 
wend 
rsBatch.close 
'send mail to the administrator 
Dim mailToAdmin: mailToAdmin = "totalMailsCreated=" & totalMailsCreated & ", totalProductsDisabled=" & totalProductsDisabled
call sendMailFromWithSending(varvalue("EMAIL"), "Batch Job Disabled Objects", mailtoAdmin , varvalue("EMAIL"))	
Response.Write "<br>Please do not forget to send all Emails from this batch!"         
%>
