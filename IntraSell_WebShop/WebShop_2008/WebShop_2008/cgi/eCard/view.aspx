<%
    
    Dim GERMAN, ENGLISH As Boolean
    
    GERMAN = varvalue("LANGUAGE") <> "ENG"
    ENGLISH = Not GERMAN

    Dim Modus, Errors, Preview

    Modus = Request.Form("Modus")
    Errors = False
    Preview = False
    If Modus = "Preview" Then Preview = True

    Dim FromName = Request("FromName")
    Dim FromEmail = Request("FromEmail")
    Dim ToName = Request("ToName")
    Dim ToEmail = Request("ToEmail")
    Dim LoveText = Request("LoveText")
    Dim CardName = Request("CardName")


    If Not Preview Then

        ' View mode - the normal mode to see the postcard
        Dim SQL = "SELECT * FROM webCards " & _
         " WHERE LoveCard_Id =" & Request("LoveCard_Id") & _
         " AND ToName='" & Request("ToName") & "' " & _
         " ORDER BY DATEFROM DESC"
        Dim rs = objConnectionExecute(SQL)

        If Not rs.EOF Then
            FromName = rs("FromName").Value
            FromEmail = rs("FromEmail").Value
            ToName = rs("ToName").Value
            ToEmail = rs("ToEmail").Value
            LoveText = rs("LoveText").Value
            CardName = rs("CardName").Value
        Else
            Errors = True
        End If
    End If
    

%>
<%
    If GERMAN Then%>
<%


    'Response.write "Modus =" & Modus 

    If Preview Then
 
        'response.Write "Check " & FromEmail & CheckEmail(FromEmail): response.end ' 
        If Not CheckEmail(FromEmail) Then
%>
<br>
<font color="red">Ihre Emailadresse ist keine gültige Emailadresse! </font>
<% 
    Errors = True
End If

If Len(ToName) < 1 Then
%>
<br>
<font color="red">Sie haben keinen Empfänger eingegeben! </font>
<% 
    Errors = True
End If
 
If Len(FromName) < 1 Then
%>
<br>
<font color="red">Ihr Name wurde nicht eingegeben! </font>
<% 
    Errors = True
End If
 
If Len(LoveText) = 0 Then
%>
<br>
<font color="red">Sie haben keinen Text verfasst! </font>
<% 
    Errors = True
End If
 
End If


If Not CheckEmail(ToEmail) Then
%>
<br>
<font color="red">Die Emailadresse des Empfängers ist keine gültige Emailadresse!
</font>
<% 
    Errors = True
End If
%>
<%  If Preview Then%>
<h1 align="center">
    Vorschau&nbsp;
</h1>
<%  End If%>
<%  If Not Errors Then%>
<form method="post" action="default.aspx?pageToShow=EcardSend" id="Form1">
<input type="hidden" name="FromEmail" value="<%=FromEmail%>" size="30" id="Hidden1">
<input type="hidden" name="FromName" value="<%=FromName%>" size="30" id="Hidden2">
<input type="hidden" name="ToEmail" value="<%=ToEmail%>" size="30" id="Hidden3">
<input type="hidden" name="ToName" value="<%=ToName%>" size="30" id="Hidden4">
<input type="hidden" name="LoveText" value="<%=LoveText%>" size="30" id="Hidden5">
<input type="hidden" name="CardName" value="<%=CardName%>" size="30" id="Hidden6">
<table border="0" width="716" id="Table1">
    <tr>
        <td height="225" width="373">
            <p align="right">
                <font face="Bangle" size="3"><i>
                    <%=LoveText%>
                    <p align="right">
                        mit Liebe
                        <%=FromName%>
                </i></font>
            </p>
            <p>
            </p>
        </td>
        <td height="225" width="329">
            <h2 align="left">
                e-card für
                <%=ToName%>
                !</h2>
            <div align="left">
                <table border="5" width="90" id="Table2">
                    <tr>
                        <td>
                            <a href="defaut.aspx?PageToShow=Ecard">
                                <img border="0" src="cgi/ecard/<%=CardName%>" width="265" height="281"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<p>
    <%If Preview Then%>
    <p align="center">
        <input type="submit" value="Dem Empfänger senden" name="Send" id="Submit1"></p>
    <%Else%>
    <p align="center">
        Senden Sie auch eine Karte: <a href="default.aspx?PageToShow=Ecard">e-card</a></p>
    <%End If%>
</form>
<%  Else 'ERROR FOUND%>
<p align="center">
    <a href='javascript:history.back();'><strong>BACK</strong></a></p>
<%  End If ' errors%>
<%  End If ' GERMAN%>
<%  If ENGLISH Then%>
<%

 
    'Response.write "Modus =" & Modus 



    If Not CheckEmail(ToEmail) Then
    
%>
<br>
<font color="red">Your email address is not correct! </font>
<% 
    Errors = True
End If

If Len(ToName) < 1 Then
%>
<br>
<font color="red">The receiving person name is missing! </font>
<% 
    Errors = True
End If
     
If Len(FromName) < 1 Then
%>
<br>
<font color="red">Your name is missing! </font>
<% 
    Errors = True
End If
     
If Len(LoveText) = 0 Then
%>
<br>
<font color="red">You have to type some text! </font>
<% 
    Errors = True
End If
 



If Not CheckEmail(ToEmail) Then
%>
<br>
<font color="red">The receiver's email address is not correct! </font>
<% 
    Errors = True
End If
%>
</p>
<h1 align="center">
    Card &nbsp;
    <%If Preview Then%>
    preview
    <%End If%>
</h1>
<%  If Not Errors Then%>
<form method="post" action="default.aspx?pageToShow=EcardSend" id="Form2">
<input type="hidden" name="FromEmail" value="<%=FromEmail%>" size="30" id="Hidden7">
<input type="hidden" name="FromName" value="<%=FromName%>" size="30" id="Hidden8">
<input type="hidden" name="ToEmail" value="<%=ToEmail%>" size="30" id="Hidden9">
<input type="hidden" name="ToName" value="<%=ToName%>" size="30" id="Hidden10">
<input type="hidden" name="LoveText" value="<%=LoveText%>" size="30" id="Hidden11">
<input type="hidden" name="CardName" value="<%=CardName%>" size="30" id="Hidden12">
<table border="0" width="716" id="Table3">
    <tr>
        <td height="225" width="373">
            <p align="right">
                <font face="Bangle" size="3"><i>
                    <%=LoveText%>
                    <p align="right">
                        with Love
                        <%=FromName%>
                </i></font>
            </p>
            <p>
            </p>
        </td>
        <td height="225" width="329">
            <h2 align="left">
                e-card for
                <%=ToName%>
                !</h2>
            <div align="left">
                <table border="5" width="90" id="Table4">
                    <tr>
                        <td>
                            <a href="defaul.aspx">
                                <img border="0" src="cgi/ecard/<%=CardName%>" width="265" height="281"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<p>
    <%If Preview Then%>
    <p align="center">
        <input type="submit" value=" Send this e-card " name="Send" id="Submit2"></p>
    <%Else%>
    <p align="center">
        You can send also a card: <a href="default.aspx?PageToShow=Ecard">e-card</a></p>
    <%End If%>
</form>
<%  Else 'ERROR FOUND%>
<p align="center">
    <a href='javascript:history.back();'><strong>BACK</strong></a></p>
<%  End If ' errors%>
<%  End If ' ENGLISH%>
