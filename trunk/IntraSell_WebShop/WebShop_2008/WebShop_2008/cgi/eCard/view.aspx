<%
GERMAN = varvalue("LANGUAGE") <> "ENG"  
ENGLISH = NOT GERMAN

Dim Modus, Errors, Preview

Modus =  Request.Form("Modus")
Errors = FALSE 
Preview = FALSE 
if Modus = "Preview" THEN Preview = TRUE 



if Preview THEN 
	FromName = Request("FromName")
	FromEmail = Request("FromEmail")
	ToName = Request("ToName")
	ToEmail = Request("ToEmail")
	LoveText = Request("LoveText")
	CardName = Request("CardName")

	else   ' View mode - the normal mode to see the postcard
	SQL = "SELECT * FROM webCards " & _ 
		" WHERE LoveCard_Id =" & Request("LoveCard_Id") & _ 
		" AND ToName='" & Request("ToName") & "' " & _ 
		" ORDER BY DATEFROM DESC"
	Set rs = objConnectionExecute(SQL)

		IF NOT rs.EOF THEN 
 			FromName = Rs("FromName")
			FromEmail = Rs("FromEmail")
			ToName = Rs("ToName")
			ToEmail = Rs("ToEmail")
			LoveText = Rs("LoveText")
			CardName  = Rs("CardName")
		ELSE 
			Errors = TRUE 
		END IF 
	END IF
	

%>
<%
IF GERMAN THEN%>
<%


'Response.write "Modus =" & Modus 

if Preview THEN 
 
 'response.Write "Check " & FromEmail & CheckEmail(FromEmail): response.end ' 
 if NOT CheckEmail(FromEmail) THEN
%>
<br>
<font color="red">Ihre Emailadresse ist keine gültige Emailadresse! </font>
<% 
    Errors = true 
 END IF

 if Len (ToName)<1 THEN
%>
<br>
<font color="red">Sie haben keinen Empfänger eingegeben! </font>
<% 
    Errors = true 
 END IF
 
 if Len (FromName)<1 THEN
%>
<br>
<font color="red">Ihr Name wurde nicht eingegeben! </font>
<% 
    Errors = true 
 END IF
 
 if Len (LoveText)=0 THEN
%>
<br>
<font color="red">Sie haben keinen Text verfasst! </font>
<% 
    Errors = true 
 END IF
 
END IF


 if NOT CheckEmail (ToEmail) THEN
%>
<br>
<font color="red">Die Emailadresse des Empfängers ist keine gültige Emailadresse!
</font>
<% 
  Errors = true 
 END IF
%>
<%If Preview THEN%>
<h1 align="center">
    Vorschau&nbsp;
</h1>
<% end if %>
<%if not errors THEN %>
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
                            <a href="defaut.asp?PageToShow=Ecard">
                                <img border="0" src="cgi/ecard/<%=CardName%>" width="265" height="281"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<p>
    <%If Preview THEN%>
    <p align="center">
        <input type="submit" value="Dem Empfänger senden" name="Send" id="Submit1"></p>
    <%ELSE %>
    <p align="center">
        Senden Sie auch eine Karte: <a href="default.aspx?PageToShow=Ecard">e-card</a></p>
    <%END IF%>
</form>
<%ELSE'ERROR FOUND%>
<p align="center">
    <a href='javascript:history.back();'><strong>BACK</strong></a></p>
<%END IF ' errors%>
<%END IF ' GERMAN%>
<%IF ENGLISH THEN%>
<%

 
'Response.write "Modus =" & Modus 



	if NOT CheckEmail(ToEmail) THEN
	
%>
<br>
<font color="red">Your email address is not correct! </font>
<% 
		Errors = true 
	END IF

	if Len (ToName)<1 THEN
%>
<br>
<font color="red">The receiving person name is missing! </font>
<% 
		Errors = true 
	END IF
	 
	if Len (FromName)<1 THEN
%>
<br>
<font color="red">Your name is missing! </font>
<% 
		Errors = true 
	END IF
	 
	if Len (LoveText)=0 THEN
%>
<br>
<font color="red">You have to type some text! </font>
<% 
		Errors = true 
	END IF
 



 if NOT CheckEmail(ToEmail) THEN
%>
<br>
<font color="red">The receiver's email address is not correct! </font>
<% 
  Errors = true 
 END IF
%>
</p>
<h1 align="center">
    Card &nbsp;
    <%If Preview THEN%>
    preview
    <%END IF%>
</h1>
<%if not errors THEN %>
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
                            <a href="defaul.asp">
                                <img border="0" src="cgi/ecard/<%=CardName%>" width="265" height="281"></a>
                        </td>
                    </tr>
                </table>
            </div>
        </td>
    </tr>
</table>
<p>
    <%If Preview THEN%>
    <p align="center">
        <input type="submit" value=" Send this e-card " name="Send" id="Submit2"></p>
    <%ELSE %>
    <p align="center">
        You can send also a card: <a href="default.aspx?PageToShow=Ecard">e-card</a></p>
    <%END IF%>
</form>
<%ELSE'ERROR FOUND%>
<p align="center">
    <a href='javascript:history.back();'><strong>BACK</strong></a></p>
<%END IF' errors%>
<%END IF ' ENGLISH%>
