<!--#include file="defaulthead.inc"-->
<body><h1 align="center">Meine Produkte (Verwaltung)</h1>

<%
'one of both idnr or refereridmust be defined
'Dim refererID 'incoming parameter
Dim idnr 'incoming parameter
Dim sql 

if request("idnr") <> "" then ' it is possible that the idnr is send instead of the referer id 
    idnr = request("idnr") 
    refererId= getExternalRefererId(idnr)
else 
    refererID = request("refererID")
    idnr = getInternalIDNRFromForeignRefererId(refererID)
end if 

if clng(idnr) <> clng(getLOGIN()) then 'not okay!!! 
 call drawErrorBox("Not logged in!","Sie sollten sich vorher anmelden!"  ,"","") 
 response.write "</body>"
 Response.End  
end if 


if idnr < 0 then 'not okay!!! 
 call drawErrorBox("Referer not existing!","No referer for this refererId is internaly defined! " &_ 
				   " Please, contact the administrator!","","") 
 response.write "</body>"
 Response.End  
end if 

dim mode: mode = request("mode")
'INSERT
if request("ArtNR") <> "" and mode="insert" then  
   sql = "Insert Into webReferersProducts (Idnr, ArtNR) values (" & idNR & ","& request("ArtNR") & ")"
   'response.write sql
   objConnectionExecute(sql) 
end if 

'DELETE 
if request("ArtNR") <> "" and mode="delete" then  
   sql = "delete from webReferersProducts where Idnr=" & idNR & " AND ArtNR="& request("ArtNR")
   objConnectionExecute(sql) 
end if 

%>

<table border="1" width="500" cellspacing="3" cellpadding="0" bordercolor="#F7F7F7">
  <tr>
    <td width="609">
      <!--webbot BOT="GeneratedScript" PREVIEW=" " startspan --><script Language="JavaScript"><!--
function FrontPage_Form1_Validator(theForm)
{

  var checkOK = "0123456789-";
  var checkStr = theForm.ArtNr.value;
  var allValid = true;
  var decPoints = 0;
  var allNum = "";
  for (i = 0;  i < checkStr.length;  i++)
  {
    ch = checkStr.charAt(i);
    for (j = 0;  j < checkOK.length;  j++)
      if (ch == checkOK.charAt(j))
        break;
    if (j == checkOK.length)
    {
      allValid = false;
      break;
    }
    allNum += ch;
  }
  if (!allValid)
  {
    alert("Geben Sie nur Ziffern in das Feld \"ArtNr\" ein.");
    theForm.ArtNr.focus();
    return (false);
  }
  return (true);
}
//--></script><!--webbot BOT="GeneratedScript" endspan --><form method="POST" action="module_ref_showMyProductsAdmin.asp" onsubmit="return FrontPage_Form1_Validator(this)" name="FrontPage_Form1">
        <p align="left"><input type="hidden" name="refererID" size="9" value="<%=refererID%>"> 
        <input type="hidden" name="mode" size="9" value="insert"> 
        Produktnummer <!--webbot
        bot="Validation" S-Data-Type="Integer" S-Number-Separators="x" -->
        <input type="text" name="ArtNr" size="9">  <input type="submit" value="Produkt auswählen" name="send"></p>
        (<a href="default.asp" target="_new">Suchen</a>) Tipp: Das ist die ArtNr. im Detailansicht eines Produktes!
      </form>
    </td>
  </tr>
</table>
<table border="1" width="500" cellspacing="3" cellpadding="0" bordercolor="#F7F7F7">
  <tr>
    <th width="184" height="26">Produkt</th>
    <th width="281" height="26">Aktion</th>
    </tr>
<%
Sql = "select * from webReferersProducts where IDNR=" & idnr
Dim rsTop
Set rsTop  = objConnectionExecute(sql)

while not rsTop.EOF 
  %>
<form method="POST" action="module_ref_showMyProductsAdmin.asp">
  <tr>
    <td width="182" height="26"><%=TABLEVALUE("grArtikel","ArtNR",rsTop("ArtNR"),"Bezeichnung")%> </td>
    <td width="279" valign="middle">      
      <input type="hidden" name="refererID" size="9" value="<%=refererID%>"> 
        <input type="hidden" name="mode" size="9" value="delete"><!--webbot bot="Validation" S-Data-Type="Integer" S-Number-Separators="x" -->
        <input type="hidden" name="ArtNr" value="<%=rsTop("ArtNR")%>" size="9">
        <input type="submit" value="löschen" name="entfernen">
  </tr> 
</form>
  <%
   rsTop.moveNext 
wend 

rsTop.close 
%>
</table>

&nbsp;
<p>...&nbsp; und so schaut es aus: 
<%
call showRefererProducts(idnr)
%>
</p>
</body>
