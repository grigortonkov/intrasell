<!--#include file="../defaultHead.inc.aspx"-->
Batch Job "Send Mails for diabled objects to all Users"<br />
Important: This job only creates mails, please use the mail tool to send the emails!<br />
<%
    'Sends once a day mails with disabled user products to their owners 
    Const PRODUCTS_DISABLED_AFTER_DAYS = 30 '-1 for test
    Const mailname = "email_disabled_products.htm"
    Dim mailtext : mailtext = readTextFile(Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname))
              
    'Response.Write "mailtext:" & mailtext & Server.MapPath("../../skins/skin" & SkinNumber & "/emails/" & mailname) : Response.Flush
    Dim addFormElements, singleFormElement : addFormElements = ""
    Dim sqlBatch : sqlBatch = " SELECT DISTINCT a.HerstellerNr, l.Email, l.Name from grArtikel a, lieferantenAdressen l where " & _
                             " a.HerstellerNr=l.IDNR and a.ProduktAktiv<>0 and a.AngelegtAm<" & SQLNOW(-1 * PRODUCTS_DISABLED_AFTER_DAYS) & _
                             " GROUP BY a.HerstellerNr, l.Email, l.Name"
                                
    Dim rsBatch : rsBatch = ObjConnectionExecute(sqlBatch)
    Dim emailAnbieter, subject, userMailtext
    Dim sqlNewObjects, rsNewObjects
    Dim objectFound
    Dim sqlK 'some sql holder 
    Dim totalMailsCreated : totalMailsCreated = 0
    Dim totalQueriesChecked : totalQueriesChecked = 0
    Dim totalProductsDisabled : totalProductsDisabled = 0

    While Not rsBatch.EOF
        totalQueriesChecked = totalQueriesChecked + 1
        userMailtext = mailtext & "" 'copy from template 
        objectFound = False 'true when some found  
        emailAnbieter = rsBatch("Email").Value
         
        sqlNewObjects = "select * from grArtikel where HerstellerNr=" & rsBatch("HerstellerNr").Value & _
                        " and ProduktAktiv<>0 and AngelegtAm<" & SQLNOW(-1 * PRODUCTS_DISABLED_AFTER_DAYS)
                         
        subject = getTranslation("Ihre Objekte wurden deaktiviert!")
         
        rsNewObjects = objConnectionExecute(sqlNewObjects)
         
        Dim htmlListNewObjects : htmlListNewObjects = ""
        Dim counterI : counterI = 0
        While Not rsNewObjects.eof
            totalProductsDisabled = totalProductsDisabled + 1
            counterI = counterI + 1
            objectFound = True
            htmlListNewObjects = htmlListNewObjects & _
                                 counterI & ".&nbsp;<a href='http://" & varvalue("DOMAIN") & "/default.aspx?ArtNr=" & rsNewObjects("ArtNr").Value & "'>" & _
                                 rsNewObjects("Bezeichnung").Value & "</a> "
         
            'Link für Objekt aktivieren!
            htmlListNewObjects = htmlListNewObjects & _
                                 ".&nbsp;<a href='http://" & varvalue("DOMAIN") & "/cgi/immo/jobs/immoAktivieren.aspx?produktAktiv=-1&anbieter=" & rsBatch("HerstellerNr").Value & "&ArtNr=" & rsNewObjects("ArtNr").Value & "'>" & _
                                 getTranslation("Objekt aktivieren") & "</a><br />"
                                                         
            'TODO: Link so dass der User direkt von Email aktivieren kann 
            rsNewObjects.moveNext()
            
        End While
        rsNewObjects.close()
        rsNewObjects = Nothing
         
        'prepare mail 
        If objectFound Then
            userMailtext = Replace(userMailtext, "[NAME]", rsBatch("Name").Value)
            'userMailtext = replace(userMailtext, "[VORNAME]", rsBatch("Vorname")) 
            userMailtext = Replace(userMailtext, "[EMAIL]", rsBatch("Email").Value)
            userMailtext = Replace(userMailtext, "[PRODUCTLIST]", htmlListNewObjects)
                     
            If isDebug() Then
                Response.Write("sqlNewObjects=" & sqlNewObjects)
                Response.Write("Emailtext:<hr/>" & userMailtext & "<hr/>")
            End If

            userMailtext = Replace(userMailtext, """", "~")
            userMailtext = Replace(userMailtext, "'", "~")
       
            'send to the user'just saved in the database  
            Call sendMailFrom(emailAnbieter, subject, userMailtext, varvalue("EMAIL"))
            If True Then
                totalMailsCreated = totalMailsCreated + 1
                sqlK = "INSERT INTO ofKorespondenz(idnr, [subjekt], [text]) values(" & _
                     rsBatch("HerstellerNr").Value & ",'" & subject & "','" & userMailtext & "')"
                objConnectionExecute(sqlK)
                'TODO: save this for the statistics 
                        
                'DISABLE PRODUCTS 
                sqlK = "update grArtikel set ProduktAktiv=0 " & _
                 " where HerstellerNr=" & rsBatch("HerstellerNr").Value & _
                                " and ProduktAktiv<>0 and AngelegtAm<" & SQLNOW(-1 * PRODUCTS_DISABLED_AFTER_DAYS)
                objConnectionExecute(sqlK)
                        
            Else
                Response.Write("Cannot send/save Email!<br />")
            End If
                    
        Else ' no object found 
            Response.Write("<br />No Objects found for Lieferant=" & rsBatch("HerstellerNr").Value & " and Email: " & rsBatch("Email").Value)
        End If
        rsBatch.MoveNext()
    End While
    rsBatch.close()
    'send mail to the administrator 
    Dim mailToAdmin : mailToAdmin = "totalMailsCreated=" & totalMailsCreated & ", totalProductsDisabled=" & totalProductsDisabled
    Call sendMailFromWithSending(varvalue("EMAIL"), "Batch Job Disabled Objects", mailToAdmin, varvalue("EMAIL"))
    Response.Write("<br />Please do not forget to send all Emails from this batch!")
%>
