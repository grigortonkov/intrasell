<%

    GERMAN = varvalue("LANGUAGE") <> "ENG"
    ENGLISH = Not GERMAN
 
    'Dim SQL, RS
    Dim LoveCard_ID

    FromName = Request("FromName")
    FromEmail = Request("FromEmail")
    ToName = Request("ToName")
    ToEmail = Request("ToEmail")
    LoveText = Request("LoveText")
    CardName = Request("CardName")

    Dim nextCardId : nextCardId = nextId("webCards", "LoveCard_Id")

    SQL = "INSERT INTO webCards (LoveCard_Id, FromName,FromEmail, ToName, ToEmail, LoveText, CardName, DateFrom)" & _
          "VALUES(" & nextCardId & ",'" & FromName & "','" & FromEmail & "','" & ToName & "','" & ToEmail & "','" & LoveText & "','" & _
            CardName & "'," & SQLNOW(0) & ")"

    'response.write SQL

    rs = objConnectionExecute(SQL)

    'GET THE CARD ID 
    SQL = "SELECT * FROM webCards ORDER BY LoveCard_Id DESC"
    rs = objConnectionExecute(SQL)
 
    LoveCard_ID = rs("LoveCard_Id")

    If GERMAN Then
        MailText = "Hallo " & ToName & "!" & Chr(13) & Chr(10) & _
               FromName & " hat Ihnen gerade eine e-card geschickt." & Chr(13) & Chr(10) & _
               "Klicken sie hier an um Ihr e-card anzusehen!" & Chr(13) & Chr(10) & _
               BASENAME & "/default.aspx?pageToShow=EcardView&LoveCard_Id=" & LoveCard_ID & "&ToName=" & ToName & "&ToEmail=" & ToEmail & _
               Chr(13) & Chr(10) & _
               "Liebe Gr&uuml;sse " & Chr(13) & Chr(10) & _
               VARVALUE("FIRMA")
    End If
  
    If ENGLISH Then
        MailText = "Hello " & ToName & "!" & Chr(13) & Chr(10) & _
               FromName & " sent you an e-card." & Chr(13) & Chr(10) & _
               "Click herw to see your e-card!" & Chr(13) & Chr(10) & _
               BASENAME & "/default.aspx?pageToShow=EcardView&LoveCard_Id=" & LoveCard_ID & "&ToName=" & ToName & "&ToEmail=" & ToEmail & _
               Chr(13) & Chr(10) & _
               "with kind regards" & Chr(13) & Chr(10) & _
              VARVALUE("FIRMA")
    End If
  
     
    Response.Write("<center>SENDING... ")
     	

     	
    FromEmail = VARVALUE("Email")
    On Error Resume Next
    sendMailFromWithSending(ToEmail, "e-card fuer " + ToName, MailText, FromEmail)
    If Err.Number > 0 Then
        Response.Write(" <font color=red>Error when seind you card </font></center>")
    Else
        Response.Write(" OK!</center>")
    End If
     

%>
<%  If GERMAN Then%>
<h1 align="center">
    Absenden</h1>
<p align="center">
    Die Karte wurde mit dem folgenden Text gesendet:
    <div align="center">
        <center>
            <table border="1" width="399">
                <tr>
                    <td width="389">
                        <p align="center">
                            <textarea rows="11" cols="64"><%=MailText%></textarea></p>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <p align="center">
        Senden Sie eine andere Karte: <a href="default.aspx?PageToShow=Ecard">e-card</a></p>
    <%End If%>
    <%If ENGLISH Then%>
    <h1 align="center">
        Send</h1>
    <p align="center">
        Your card was send with the following text:
        <div align="center">
            <center>
                <table border="1" width="399">
                    <tr>
                        <td width="389">
                            <p align="center">
                                <textarea rows="11" cols="64" id="Textarea1" name="Textarea1"><%=MailText%></textarea></p>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
        <p align="center">
            Send another&nbsp;card: <a href="default.aspx?PageToShow=Ecard">e-card</a></p>
        <%End If%>
