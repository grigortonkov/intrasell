<%
'****************************************************************
' Module reference contains functions that are needed 
' for the reference business functionality
' Warning: these functions are used in cgi and admin but the implementation 
' connected with referals is here! 
'****************************************************************
'
'****************************************************************
' get internal referer Id
' returns -1 if nothing found 
' else returns the IDNR 
'****************************************************************
function getInternalIDNRFromForeignRefererId(foreignRefererId)
   'defaultings 
   if foreignRefererId = "" then 
	foreignRefererId = "0"
   end if 
   
   dim sql, rs
   sql ="select * from webreferers where refererId=" & foreignRefererId
   set rs = ObjConnection.execute(sql)	
   if rs.eOF then
		getInternalIDNRFromForeignRefererId = -1
   else
        getInternalIDNRFromForeignRefererId = rs("IDNR")
        'Response.Write "Sie sind auf dieser Seite aufgrund Referer " & foreignRefererId & "/" & rs("IDNR")
   end if 
   
end function 

'****************************************************************
' creates an entry in the database when the user buys something
'****************************************************************
function createReference(OrderType, OrderNummer, RefererId)
   if RefererId = "" or RefererId<=0 then exit function
   
   dim sql
   sql  = "INSERT INTO webOrderReferenz (RefererId, OrderNummer, OrderType, Bezahlt) " & _ 
		  "Values (" & RefererId & "," & OrderNummer &",'" & OrderType &  "',-1)"   
		  
   ObjConnection.execute(sql)		  
		  
end function 

'****************************************************************
' isRefererAllowed
'****************************************************************
function isRefererAllowed(RefererId)
  Dim sql, rs 
  sql = "Select * from webreferers Where idnr=" & RefererId
  set rs = ObjConnection.execute(sql)	
  isRefererAllowed = NOT rs.EOF  
end function

'****************************************************************
' getExternalRefererId
' returns -1 when not defined
'****************************************************************
function getExternalRefererId(idnr)
  Dim sql, rs 
  sql = "Select * from webreferers Where idnr=" & idnr
'response.write sql
  set rs = ObjConnection.execute(sql)	
  if not rs.EOF then 
       getExternalRefererId = rs("refererId")
  else 
      getExternalRefererId =  -1
  end if 

end function


'****************************************************************
' needed for the my account 
'****************************************************************
function  showMyReferedSells(RefererId, OrderType, fromDatem, toDate)
dim sql, rs 
dim tableName: tableName = getNameForTableProducts(OrderType)
dim tableNameOrder: tableNameOrder = getNameForTable(OrderType)

sql = "SELECT webOrderReferenz.RefererId, " & tableNameOrder & ".Datum, " & tableNameOrder & ".Nummer, " &  _
	" Sum([" & tableName & "].[PreisATS]*[Stk]) AS Umsatz ,  " & _ 
    " Sum([" & tableName & "].[PreisATS]*[Stk]*[GewinnReferenz]) AS Gewinn " & _ 
	" FROM [grArtikel-Kategorien] RIGHT JOIN (grArtikel RIGHT JOIN " & _ 
	" ((webOrderReferenz LEFT JOIN " & tableNameOrder & " ON webOrderReferenz.OrderNummer = " & tableNameOrder & ".Nummer) " & _ 
	" LEFT JOIN [" & tableName & "] ON " & tableNameOrder & ".Nummer = [" & tableName & "].RechNr) ON " & _ 
	" grArtikel.ArtNr = [" & tableName & "].ArtNR) ON [grArtikel-Kategorien].ArtKatNr = grArtikel.ArtKatNr " & _ 
	" WHERE RefererID= " & RefererId & _ 
	" GROUP BY webOrderReferenz.RefererId, " & tableNameOrder & ".Datum, " & tableNameOrder & ".Nummer"
'Response.Write "<br>sql=" & sql	
Set rs = ObjConnection.execute(sql)		

%>

<h1><font color="#000000">

My Refered Orders/Sells</font></h1>
<TABLE border=1 cellPadding=2 cellSpacing=0 width="409">
  
  <TR>
    <TH width="102">
      <P align=center>RId</P></TH>
      <TH width="99">
      <P align=center>Datum</P></TH>
    <TH width="106">
      <P align=center>Umsatzsumme</P></TH>
    <TH width="92">
      <P align=center>Ihr Gewinn</P></TH>
  </TR><%
while not rs.EOF 
%>
  <TR>
    <TD align=right width="102"><%=rs("RefererId")%></TD>
    <TD align=right width="99"><%=rs("Datum")%></TD>
    <TD align=right width="106"><%if not isnull(rs("Umsatz")) then Response.write FormatNumber(rs("Umsatz"),2)%>€</TD>
    <TD align=right width="92"><%if not isnull(rs("Gewinn")) then Response.write FormatNumber(rs("Gewinn"),2)%>€</TD>
    </TR>
<%
rs.moveNext
wend
%>
</TABLE>
<%
rs.close 	
end function 




'****************************************************************************
' Show the top products for some referer 
'****************************************************************************
sub showRefererProducts (idnr)

Dim Sql: Sql = "select * from webReferersProducts where IDNR=" & idnr
Dim rsTop, inRow


%>

<h1 align="center">Meine sechs Produkte</h1>
Hallo! Hier sind meine sechs lieblings Produkte! Ich kann Dir diese Produkte heiss empfehlen! <br>
Liebe Grüsse! <br>
<%=TABLEVALUE("ofAdressen","idnr",idnr,"Name")%>

<%
Set rsTop  = ObjConnection.execute(sql)
if rsTop.BOF and rsTop.EOF then
else
	inRow = 0
	%>
	<center>
	<table  border="1" width="100%" cellspacing="10" cellpadding="0" bordercolor="#F7F7F7">
	<%
	while not rsTop.EOF 
		if inRow=0 then	%><tr><%end if %>
	   <td>
	    <%
	    inRow = inRow +1
		Call makeProductPageSmall(rsTop("ArtNr"), "")
		rsTop.moveNext
		%>
	   </td>
	    <%
	    if inRow>2 then ' 3 in a ROW
		inRow =0
		%>
		</tr>
		<%
		end if
	wend
%>	
</tr>
</table></center>
<%
end if
rsTop.close
end sub
%>
