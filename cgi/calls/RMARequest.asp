<!--#include file="../defaultHead.inc"-->
<head>
<LINK href="<%=BASENAME%>/Style.css" type="text/css" rel="stylesheet">
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            text-align: left;
            width: 168px;
        }
    </style>
    <title>RMA / Rücksendung</title>
</head>
<BODY>
		<center>  
		<h2>
            RMA / Rücksendung</h2>
		<div align=center>  
		<form action='doRMARequest.asp' method='post'>  
		
     
		<TABLE border=0 borderColor=green cellPadding=3 cellSpacing=0>  
		<TR>  
		<Td border=0 class="style1">Von Email:</Td>  
		<td><input type='input' name='FromMail' value='<%=GetClientEMail (Session ("LOG_IN"))%>'></td>  
		</tr><tr>
		<Th class="style1">Name:  </Th>  
		<td>  <input type='input' name='FromName' value=''></td>  
		</tr><tr>
    	<Th class="style1">Tel:</Th>  
		<td><input type='input' name='FromTel' value=''></td>  
		
		</tr>

		<TR>  
		<Td border=0 class="style1">An:</Td>  
		<td><%=GetShopEMail%></td>  
		</tr>
		

		
		<input type='hidden' name='ToMail' value='<%=GetShopEMail%>'>  

		<TR>  
		<Td border=0 class="style1">Rücksendegrund:</Td> 
		<td> 
		    <Select name="Reason">
                 <Option>Storno/Vetragsrücktritt</Option>  
                 <Option>Falschlieferung</Option> 
                 <Option>defektes Produkt</Option>
                 <Option>anderer Grund</Option>
            </Select>
        </td>  
		</tr>


	    <tr>  
		<Td border=0 class="style1">Bestellnummer:</Td>  
		<td><input type='_hidden' name='Nummer' value='<%=request("Nummer")%>'>  </td>  
		</tr>

        <tr>  
		<Td border=0 class="style1">Produktnummer:</Td>  
		<td><input type='_hidden' name='ProductID' value='<%=request("ArtNr")%>'>    </td>  
		</tr>
        

		<tr>  
		<Td border=0 class="style1">Betreff:</Td>  
		<td>Ich habe ein Problem mit Produkt #<%=request("ArtNr")%></td>  
		</tr>

		<TR>  
		<Td border=0 class="style1" title="RMA Request">Text/Fehlerbeschreibung:</Td>  
		<td><textarea name='FromMail' cols=30 rows=10>Bitte erledigen Sie das folgende Problem mit Produkt #<%=request("ArtNr")%>:</textarea></td>  
		</tr>
		
		<TR>  
		<Td border=0 colspan=2 align=center>  
		<input type='submit'>  
		   <input type=button onClick='window.close()' name=close value=Close></td>  
		</tr>
		</table>  
		</form>  
		</div>
    </center>  
  </BODY>
</HTML>  
		
<!--#include file="../../intrasoft/connClose.asp"-->