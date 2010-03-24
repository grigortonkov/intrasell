<%

Dim GERMAN: GERMAN = false 
Dim ENGLISH: ENGLISH = true 

GERMAN = varvalue("LANGUAGE") <> "ENG"  
ENGLISH = NOT GERMAN

Dim CardName, FromName, FromEmail, ToName, ToEmail, LoveText	


CardName   = request("CardName")
if Len(CardName)<4 THEN 
   CardName  = "card_1.gif"
END IF


FromName = Request("FromName")
FromEmail = Request("FromEmail")
ToName = Request("ToName")
ToEmail = Request("ToEmail")
LoveText = Request("LoveText")


%>
Language:
<%=varvalue("LANGUAGE")%>
<%IF GERMAN THEN%>
<!--webbot BOT="GeneratedScript" PREVIEW=" " startspan -->

<script language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{

  if (theForm.ToName.value == "")
  {
    alert("Please enter a value for the \"ToName\" field.");
    theForm.ToName.focus();
    return (false);
  }

  if (theForm.ToName.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"ToName\" field.");
    theForm.ToName.focus();
    return (false);
  }

  if (theForm.ToEmail.value == "")
  {
    alert("Please enter a value for the \"ToEmail\" field.");
    theForm.ToEmail.focus();
    return (false);
  }

  if (theForm.ToEmail.value.length < 5)
  {
    alert("Please enter at least 5 characters in the \"ToEmail\" field.");
    theForm.ToEmail.focus();
    return (false);
  }

  if (theForm.FromName.value == "")
  {
    alert("Please enter a value for the \"FromName\" field.");
    theForm.FromName.focus();
    return (false);
  }

  if (theForm.FromName.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"FromName\" field.");
    theForm.FromName.focus();
    return (false);
  }

  if (theForm.FromEmail.value == "")
  {
    alert("Please enter a value for the \"FromEmail\" field.");
    theForm.FromEmail.focus();
    return (false);
  }

  if (theForm.FromEmail.value.length < 5)
  {
    alert("Please enter at least 5 characters in the \"FromEmail\" field.");
    theForm.FromEmail.focus();
    return (false);
  }
  return (true);
}
//--></script>

<!--webbot BOT="GeneratedScript" endspan -->
<form method="post" action="default.aspx?PageToShow=EcardView" onsubmit="return FrontPage_Form1_Validator(this)"
name="FrontPage_Form1" language="JavaScript">
<input type="hidden" name="Modus" value="Preview">
<input type="hidden" name="CardName" value="<%=CardName%>">
<h1 align="center">
    e-card</h1>
<div align="center">
    <center>
        <table border="0" width="747" height="231">
            <tr>
                <td height="225" width="522">
                    <p>
                        Wenn Sie jemandem eine Überraschung machen möchten, dann sind Sie hier richtig!<br>
                        Ihre Emailpostkarte wird sicherlich Ihrem lieben Menschen Freude mitbringen.<br>
                        <font size="3"></font>
                    </p>
                    <p>
                        <font size="3">Füllen Sie bitte die Felder aus!</font></p>
                    <div align="center">
                        <table border="0" width="440" height="126">
                            <tr>
                                <td width="517">
                                    Empfängers name:*&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" b-value-required="TRUE" i-minimum-length="1" -->
                                    <input name="ToName" value="<%=ToName%>" size="18">
                                </td>
                            </tr>
                            <tr>
                                <td width="517">
                                    Empfängers Email:*&nbsp;&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" b-value-required="TRUE" i-minimum-length="5" -->
                                    <input name="ToEmail" size="18" value="<%=ToEmail%>">
                                </td>
                            </tr>
                            <tr>
                                <td width="517">
                                    Ihr Name:*&nbsp;&nbsp;&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" b-value-required="TRUE" i-minimum-length="1" -->
                                    <input name="FromName" size="18" value="<%=FromName%>">
                                </td>
                            </tr>
                            <tr>
                                <td width="517">
                                    Ihr Email:*&nbsp;&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" s-data-type="String" b-value-required="TRUE" i-minimum-length="5" -->
                                    <input name="FromEmail" size="18" value="<%=FromEmail%>">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p>
                        <br>
                        Ihr Love Text<textarea cols="55" name="LoveText" rows="3"></textarea>
                    </p>
                    <p align="center">
                        <input type="submit" value="Preview" name="ModusButton"></p>
                </td>
                <td height="225" width="218">
                    <h2 align="center">
                        Ihre Karte</h2>
                    <div align="center">
                        <table border="5" width="90" align="center">
                            <tr>
                                <td>
                                    <img border="0" src="cgi/ecard/<%=CardName%>" width="190" height="199">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p align="center">
                        Wählen Sie eine andere Karte aus:
                    </p>
                    <div align="center">
                        <table border="1" width="90" height="26" cellspacing="6">
                            <tr>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_1.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_1.gif" width="50">
                                    </a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_2.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_2.gif" width="50">
                                    </a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_3.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_3.gif" width="50"></a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_4.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_4.gif" width="50"></a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_5.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_5.gif" width="50"></a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_6.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_6.gif" width="50"></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h2 align="center">
                        &nbsp;</h2>
                </td>
            </tr>
        </table>
    </center>
</div>
</form>
<%END IF 'GERMAN%>
<%IF ENGLISH THEN%>
<!--webbot BOT="GeneratedScript" PREVIEW=" " startspan -->

<script language="JavaScript"><!--
function FrontPage_Form2_Validator(theForm)
{

  if (theForm.ToName.value == "")
  {
    alert("Please enter a value for the \"ToName\" field.");
    theForm.ToName.focus();
    return (false);
  }

  if (theForm.ToName.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"ToName\" field.");
    theForm.ToName.focus();
    return (false);
  }

  if (theForm.ToEmail.value == "")
  {
    alert("Please enter a value for the \"ToEmail\" field.");
    theForm.ToEmail.focus();
    return (false);
  }

  if (theForm.ToEmail.value.length < 5)
  {
    alert("Please enter at least 5 characters in the \"ToEmail\" field.");
    theForm.ToEmail.focus();
    return (false);
  }

  if (theForm.FromName.value == "")
  {
    alert("Please enter a value for the \"FromName\" field.");
    theForm.FromName.focus();
    return (false);
  }

  if (theForm.FromName.value.length < 1)
  {
    alert("Please enter at least 1 characters in the \"FromName\" field.");
    theForm.FromName.focus();
    return (false);
  }

  if (theForm.FromEmail.value == "")
  {
    alert("Please enter a value for the \"FromEmail\" field.");
    theForm.FromEmail.focus();
    return (false);
  }

  if (theForm.FromEmail.value.length < 5)
  {
    alert("Please enter at least 5 characters in the \"FromEmail\" field.");
    theForm.FromEmail.focus();
    return (false);
  }
  return (true);
}
//--></script>

<!--webbot BOT="GeneratedScript" endspan -->
<form method="post" action="default.aspx?PageToShow=EcardView" onsubmit="return FrontPage_Form2_Validator(this)"
name="FrontPage_Form2" language="JavaScript">
<input type="hidden" name="Modus" value="Preview">
<input type="hidden" name="CardName" value="cgi/ecard/<%=CardName%>">
<h1 align="center">
    e-card</h1>
<div align="center">
    <center>
        <table border="0" width="747" height="231">
            <tr>
                <td height="225" width="522">
                    <p>
                        If you want to make an surprise,
                        <br>
                        then this is the right place !!!
                        <br>
                        Your Ecard will bring joy and happiness.&nbsp;<font color="#cc0099" size="3">
                            <br>
                        </font>
                    </p>
                    <p>
                        <i><font size="3">Please, fill out the fields, preview your card and send it!</font></p>
                    <div align="center">
                        <table border="0" width="393">
                            <tr>
                                <td width="276">
                                    Reciever's Name:*&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" b-value-required="TRUE" i-minimum-length="1" -->
                                    <input name="ToName" value="<%=ToName%>" size="19">
                                </td>
                            </tr>
                            <tr>
                                <td width="276">
                                    Reciever's Email:*&nbsp;&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" b-value-required="TRUE" i-minimum-length="5" -->
                                    <input name="ToEmail" size="19" value="<%=ToEmail%>">
                                </td>
                            </tr>
                            <tr>
                                <td width="276">
                                    Your Name:*&nbsp;&nbsp;&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" b-value-required="TRUE" i-minimum-length="1" -->
                                    <input name="FromName" size="19" value="<%=FromName%>">
                                </td>
                            </tr>
                            <tr>
                                <td width="276">
                                    Your Email:*&nbsp;&nbsp;
                                </td>
                                <td width="220">
                                    <!--webbot bot="Validation" s-data-type="String" b-value-required="TRUE" i-minimum-length="5" -->
                                    <input name="FromEmail" size="19" value="<%=FromEmail%>">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p>
                        <br>
                        Your Love Text<textarea cols="55" name="LoveText" rows="3"></textarea>
                    </p>
                    <p align="center">
                        <input type="submit" value="Preview" name="ModusButton"></p>
                    </I>
                </td>
                <td height="225" width="218">
                    <h2 align="center">
                        Your card</h2>
                    <div align="center">
                        <table border="5" width="90">
                            <tr>
                                <td>
                                    <img border="0" src="cgi/ecard/<%=CardName%>" width="190" height="199">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <p align="center">
                        Select one card:
                    </p>
                    <div align="center">
                        <table border="1" width="90" height="26" cellspacing="6">
                            <tr>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_1.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_1.gif" width="50">
                                    </a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_2.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_2.gif" width="50">
                                    </a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_3.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_3.gif" width="50"></a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_4.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_4.gif" width="50"></a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_5.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_5.gif" width="50"></a>
                                </td>
                                <td height="20">
                                    <a href="default.aspx?PageToShow=Ecard&amp;CardName=card_6.gif">
                                        <img border="0" height="50" src="cgi/ecard/card_6.gif" width="50"></a>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <h2 align="center">
                        &nbsp;</h2>
                </td>
            </tr>
        </table>
    </center>
</div>
</form>
<%END IF 'ENGLISH%>
