<%
'******************************************************************
' Function [Name]
' Description []
' Autor: 
' Changes: 
'******************************************************************
function makeMerchantView(merchantId)
  if merchantId = "" then 
		makeMerchantView = ""
		exit function 
  end if 
  
   Dim sql, rs
   sql = " SELECT LieferantNr, Firma, Name, Stars, PaymentMode, Web  " & _ 
		 " FROM lieferantenAdressen INNER JOIN priceCompareHaendler ON " & _ 
		 " (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) " & _ 
		 " AND (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr) " & _ 
		 " WHERE LieferantNr = " &  merchantID 
  'Response.Write sql	 	 
   set rs = objConnectionExecute(sql)
   if rs.EOF then 
      makeMerchantView = "N/A"
      exit function
   end if 
   dim stars: stars = rs("stars")
   dim i, starshtml
   for i = 1 to cint(stars)  
      starshtml = "*" & starshtml
   next    
   Dim html'<td width=50>" & starshtml & "</td>" & _ 
    html = "<table border=0><tr><td>" 
    html = html & "<a href=""default.asp?pageToShow=LieferantenInformationen&MERCHANT_HOME="& rs("web") & "&merchantId=" & merchantID & """ target=""_new"">" 
	
	'LOGO VIEW 
	'click on logo goes directly to the merchant homepage
	if lcase(rs("PaymentMode")) = "top" then 
	 html = html & "<img border=""0"" _width=100 _height=25 alt=""" & rs("Firma") & """ src=""../merchantLogos/" & rs ("LieferantNr")& ".jpg"">"
	end if 
	'BOLD VIEW 
	if lcase(rs("PaymentMode")) =  "middle" then html = html & "<b>" & rs("Firma") & "</b>"
	
	'ONLY COMPANY NAME
	if lcase(rs("PaymentMode")) =  "base" then html = html & rs("Firma")

	
    html = html & "</a>"
    'html = html & " <a href=""cgi/priceCompare/merchantPage.asp?merchantId=" & merchantID & """>info</a>" 
    html = html & " <a href=""default.asp?pageToShow=LieferantenInformationen&merchantId=" & merchantID & """>info</a>" 
    
    'TODO: not needed now
    'if rs("web") <> "" then html = html & " <a href=""merchantPage.asp?MERCHANT_HOME="& rs("web") &"&merchantId=" & merchantID & """>home</a>" 
    html = html & "</td></tr></table>"
    
    makeMerchantView  =html
   rs.close 
   'write log for statistics 
'   sql = "INSERT INTO login(PATH_TRANSLATED,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER)  VALUES " & _
'		 "('showMerchantAsFeaturedMerchant?merchantId=" & merchantID & "','" & _ 
'          Request.ServerVariables("REMOTE_ADDR ") & " ','" & _
'		  Request.ServerVariables("REMOTE_HOST") & "','" & _
'		  Request.ServerVariables("REMOTE_USER") & "')"
'	objConnectionExecute(sql)	   
end function 


function makeMerchantViewBewertung(merchantId)
  if merchantId = "" then 
		makeMerchantViewBewertung = ""
		exit function 
  end if 
  
   Dim sql, rs
   sql = " SELECT LieferantNr, Firma, Name, Stars, PaymentMode, Web  " & _ 
		 " FROM lieferantenAdressen INNER JOIN priceCompareHaendler ON " & _ 
		 " (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) " & _ 
		 " AND (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr) " & _ 
		 " WHERE LieferantNr = " &  merchantID 
  'Response.Write sql	 	 
   set rs = objConnectionExecute(sql)
   if rs.EOF then 
      makeMerchantViewBewertung = "N/A"
      exit function
   end if 
   
   dim stars: stars = rs("stars")
   
   dim i, starshtml
   'for i = 1 to cint(stars)  
   '   starshtml = "*" & starshtml
   'next   
   
   starshtml = makeBewertungStarsMerchant(cdbl(stars))
    
   makeMerchantViewBewertung = starshtml  & "<br><font color='gray'>Bewertungen</font>"    
end function 


'==========================================================================================
' creates image html for the product "bewertung" 
'==========================================================================================
function makeBewertungStarsMerchant(byVal points)

         if points - round(points,0)<= 0.25 or round(points,0)-points > 0.75 then 
            points = round(points,0) 
         else 
            points = int(points) +0.5 
         end if 
            
         dim imageName: imageName = "" & replace(round(points,1),".",",")
         makeBewertungStarsMerchant = "<img alt="""& Points &" Points"" src=""skins/skin" & SkinNumber & "/images/imagesStars/" & imageName & ".gif"">" 
    
end function 


'******************************************************************
' Function [makeMerchantSimpleView]
' Description Merchant view for the Featured merchant Table + Log entry
' Autor: 
' Changes: 
'******************************************************************
function makeMerchantSimpleView(byval merchantId)
 'Response.Write "Merchant ..."
  if merchantId = "" then 
		makeMerchantSimpleView = "N/A"
		exit function 
  end if 
  
   Dim sql, rs
   sql = " SELECT LieferantNr, Firma, Name, Stars, PaymentMode, Web  " & _ 
		 " FROM lieferantenAdressen INNER JOIN priceCompareHaendler ON " & _ 
		 " (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) " & _ 
		 " AND (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr) " & _ 
		 " WHERE LieferantNr = " &  merchantID 
 ' Response.Write sql	 	 
  
   set rs = objConnectionExecute(sql)
   if rs.EOF then 
      makeMerchantSimpleView = "N/A"
      exit function
   end if 
   dim stars: stars = rs("stars")
   dim i, starshtml
   for i = 1 to stars  
      starshtml = "*" & starshtml
   next    
   Dim html
    html = "<table border=0><tr><td>" & _ 
           " <a href=""cgi/priceCompare/merchantPage.asp?MERCHANT_HOME="& rs("web") &"&merchantId=" & merchantID & """ target=""_new"">"  & rs("Firma") & "</a>" & _ 
           " <a href=""cgi/priceCompare/merchantPage.asp?merchantId=" & merchantID & """>info</a>" 
    html = html & "</td></tr></table>"
    
    makeMerchantSimpleView  = html
   rs.close 
   'write log for statistics 
   sql = "INSERT INTO login(PATH_TRANSLATED,REMOTE_ADDR,REMOTE_HOST,REMOTE_USER)  VALUES " & _
		 "('showMerchantAsFeaturedMerchant?merchantId=" & merchantID & "','" & _ 
          Request.ServerVariables("REMOTE_ADDR ") & " ','" & _
		  Request.ServerVariables("REMOTE_HOST") & "','" & _
		  Request.ServerVariables("REMOTE_USER") & "')"
	objConnectionExecute(sql)	   
end function 



'******************************************************************
' Function [Name]
' Description []
' Autor: 
' Changes: 
'******************************************************************
function makeManufacturerView(merchantId)
 'makeManufacturerView = makeMerchantView(merchantId)
  makeManufacturerView = tablevalue("lieferantenAdressen","IdNR",merchantId,"Firma")
end function 


'******************************************************************
' Function [Name]
' Description []
' Autor: 
' Changes: 
'******************************************************************
function makeMerchantViewWithBanner(merchantId)
end function 



'******************************************************************
' Function [Name]
' Description []
' Autor: 
' Changes: 
'******************************************************************
function makeMerchantViewWithBannerAndSlogan(merchantId)
end function 

'******************************************************************
' Function [Name]
' Description []
' Autor: 
' Changes: 
' parameters 
' filename - physical filename on server
' merchantId - merchantid 
' importfunction - name of function wich must be used to import the file, if no 
'     importfunction set, then take default function 
'******************************************************************
function importPriceList(filename, merchantId, importfunction)
end function 

'******************************************************************
' Function [Name]
' Description [deletes the merchant and all depending information, files and so on ]
' Autor: 
' Changes: 
'******************************************************************
function deleteMerchant(merchantId)

end function 

'******************************************************************
' Function [Name]
' Description [activates or deactivates the merchant for uncertain time,
'             the merchant cannot make anything on the site ]
' Autor: 
' Changes: 
'******************************************************************
function deactivateMerchant(merchantId)
end function 
function activateMerchant(merchantId)
end function 

%>
<%

function getSQLForFeaturedMerchants(byVal catList)
			  getSQLForFeaturedMerchants = " SELECT priceCompareHaendler.LieferantNr, lieferantenAdressen.Firma, lieferantenAdressen.Name " & _ 
					" FROM priceCompareCatTopHandlers INNER JOIN (lieferantenAdressen " & _ 
					" INNER JOIN priceCompareHaendler ON (priceCompareHaendler.LieferantNr = lieferantenAdressen.IDNR) AND " & _ 
					" (lieferantenAdressen.IDNR = priceCompareHaendler.LieferantNr)) ON priceCompareCatTopHandlers.LieferantNr = priceCompareHaendler.LieferantNr " & _ 
					" WHERE priceCompareCatTopHandlers.CatID in (" & catList & ")" & _ 
					" GROUP BY priceCompareHaendler.LieferantNr, lieferantenAdressen.Firma, lieferantenAdressen.Name " & _ 
					" ORDER BY lieferantenAdressen.Firma"
end function 
'****************************************************************************
' statistics for the most clicked merchants by category 
'****************************************************************************
function showFeaturedMerchants(ArtKatNr)
Dim MAX_PRODUCTS : MAX_PRODUCTS = 5
Dim sql
Dim html': html = "Featured Merchants"
sql = getSQLForFeaturedMerchants(ArtKatNr)
'Response.Write sql
Dim rs: set rs = objConnectionExecute(sql)
Dim i : i = 0
Dim alreadyUsed : alreadyUsed = true 
Dim listedMerchants: listedMerchants =""
	if rs.eOF then 
			sql = getSQLForFeaturedMerchants(makeSuperCategoriesList(ArtKatNr))
			set rs = objConnectionExecute(sql)
			'Response.Write sql
	end if 
	while not rs.EOF AND i < MAX_PRODUCTS
	  if InStr(listedMerchants,"," & rs("LieferantNr")) <= 0 then
		html = html  &  makeMerchantSimpleView(rs("LieferantNr"))
		listedMerchants = listedMerchants & "," & rs("LieferantNr")
		i = i + 1
	  end if 
		rs.movenext
		if rs.eOF and i< MAX_PRODUCTS and not alreadyUsed then 'search again in super cats 
			  sql = getSQLForFeaturedMerchants(makeSuperCategoriesList(ArtKatNr))
				'Response.Write sql
		      set rs = objConnectionExecute(sql)
		      alreadyUsed = true 
		
		end if 
		
		
		
	wend
rs.close
showFeaturedMerchants=html
end function 

'****************************************************************************
'listDeliveryMethods - listes the delivery methods for some merchant
'****************************************************************************
function listDeliveryMethods(MerchantId)
   dim rs, sql, strAll
   sql = "SELECT [priceCompareHaendler_Zahlungsbedingungen].IDNR, grZahlungsbedingung.Methode " & _ 
         " FROM grZahlungsbedingung INNER JOIN [priceCompareHaendler_Zahlungsbedingungen] " & _ 
         " ON grZahlungsbedingung.Nr = [priceCompareHaendler_Zahlungsbedingungen].Bedingung " & _ 
         " WHERE IDNR = " & merchantId
   set rs = objConnectionExecute(sql) 
         
 while not rs.EOF         
       strAll = strAll & ", " &  rs("Methode")  
       rs.moveNext 
 wend      
 if strAll = "" then strAll = "xx "
 listDeliveryMethods = mid(strAll,3)
end function 

function listPaymentMethods(MerchantId)
   dim rs, sql, strAll
   sql = "SELECT * FROM [priceCompareHaendler_Zahlungsmethoden] " & _
         " WHERE IDNR = " & merchantId
   set rs = objConnectionExecute(sql) 
         
 while not rs.EOF         
       strAll = strAll & ", " &  rs("Methode")  
       rs.moveNext 
 wend      
 if strAll = "" then strAll = "xx "
 listPaymentMethods = mid(strAll,3)

end function 


'*************************************************************************
'printAddress
'*************************************************************************
function printAddressLieferanten(kdnr)

printAddressLieferanten = "" 
exit function 
Dim rsKUND
Dim sql
sql = "Select * from lieferantenAdressen where IDNR=" & kdnr
set rsKUND = objConnectionExecute(sql)
Dim PLZ, Ort, Landname
PLZ = TableValue("grPLZ","IDNR", rsKUND ("PLZ"), "PLZ")
Ort = TableValue("grPLZ","IDNR", rsKUND ("PLZ"), "Ort")
LandName = TableValue("grLand","IdNr", rsKUND ("Land"), "Name")
%>
			   <%if trim(rsKUND("Firma")) <> "" then%>
			   Fa. <%=rsKUND("Firma")%> <br>
			   <%end if%>
				<%'=rsKUND ("Anrede")%> <%'=rsKUND ("Name")<br>%> 
				<%=rsKUND ("Adresse")%> <br>
				<%=PLZ%>-<%=Ort%><br>
				<%=LandName%> <br>
				Tel:<%=rsKUND ("Tel")%><br>
<%
end function

'
' searches for merchants of a productin a zip region 
'
function findMerchants(bundesland, ort, plz, artnr, searchWideArea)
		if bundesland = "" and ort = "" and plz = "" then 
			call drawErrorBox("Fehler", "Sie haben keine Kriterien eingegeben!","","")
			Response.End 
		end if 
		Dim sql
		sql = " SELECT lieferantenAdressen.*, grPLZ.Ort, grPLZ.Land, grPLZ.PLZ, grPLZ_1.PLZ " & _ 
			  " FROM ((grPLZ INNER JOIN lieferantenAdressen ON grPLZ.IdNr = lieferantenAdressen.PLZ) " & _ 
		      " LEFT JOIN priceCompareNextPLZ ON grPLZ.IdNr = priceCompareNextPLZ.PLZID) " & _ 
		      " LEFT JOIN grPLZ AS grPLZ_1 ON priceCompareNextPLZ.NextPLZID = grPLZ_1.IdNr " & _ 
		      " WHERE 1=1 " 
		      
		if PLZ<>"" then 
			sql = sql & " AND (grPLZ.PLZ=" & plz & " OR grPLZ_1.PLZ=" & plz & ")"
		end if       
		
		if Bundesland <> ""  then 
		  sql = sql & " AND grPLZ.PLZ In (Select PLZ from grPLZ where BLand Like '" & Bundesland & "')"
		end if 
		
		if Ort <> "" then 
		   sql = sql & "AND grPLZ.PLZ In (Select PLZ from grPLZ where Ort Like '" & Ort & "')"
		end if 
		    
		'Response.Write "sql=" & sql		 
		Dim rs: set rs = objConnectionExecute(sql)
		If rs.eof then
			call drawErrorBox("Fehler", "Es sind uns leider keine Zulieferer in diesem Gebiet bekannt." ,"","")   
			exit function 
		end if 
		%>
		<%
		Dim butArr(0,0)
		call drawWindowPart1("Liste Zulieferer in PLZ [" & PLZ &  "] und Umgebung:"," ","", butArr)
		%>				
		<table border="0" cellspacing="0">
		<tr>
		<th width="177" align="center">Name</th>
		<th width="166" align="center">Adresse</th>
		<!--<th width="269" align="center">Weg Beschreibung (route.web.de)</th>-->
		</tr>
		<%
		Dim i : i = 0
			while not rs.EOF 
				%><tr><td width="177"> <%=makeMerchantView(rs("IDNR")) %> 
				</td><td width="166"><% 
				call printAddressLieferanten(rs("IDNR")) 
				%>
				</td><td>

				<!-- WEB.DE Routenplanung Beginn -->
				<!--
				<FORM TARGET="_blank" ACTION="http://route.web.de/Europa/" METHOD="GET">
				<INPUT TYPE=HIDDEN NAME="tocity" VALUE="Linz (A)">
				<INPUT TYPE=HIDDEN NAME="tostreet" VALUE="Urfahr">
				<INPUT TYPE=HIDDEN NAME="tolat" VALUE="483132">
				<INPUT TYPE=HIDDEN NAME="tolon" VALUE="142806">
				<TABLE BORDER="1" CELLPADDING="4" CELLSPACING="0">
				<TR BGCOLOR="#CC510A">
				<TD><FONT FACE="Arial, Helvetica" SIZE="-1" COLOR="#FFFFFF"><B> <B>Routenplanung:</B><BR>
				 Ihr Weg nach <B>Linz (A), Urfahr</B></FONT></TD>
				</TR>
				<TR>
				<TD ALIGN="CENTER">
				<TABLE BORDER="0" CELLPADDING="2" CELLSPACING="1" WIDTH="100%">
				<TR>
				<TD BGCOLOR="#FFD8BF"><FONT FACE="Arial, Helvetica" SIZE="-2"> <B>Ort:</B> </FONT></TD>
				<TD BGCOLOR="#EFEFEF"><FONT FACE="Arial, Helvetica" SIZE="-1"> <INPUT TYPE="text" NAME="fromcity" VALUE=""></FONT></TD>
				<TD ALIGN="CENTER" ROWSPAN="2" VALIGN="MIDDLE" BGCOLOR="#EFEFEF">
				<INPUT TYPE="IMAGE" SRC="http://img.web.de/web/img/v4/route/napping.gif" WIDTH="144" HEIGHT="40" BORDER="0" ALT="Routenplanung starten">
				</TD>
				</TR><TR>
				<TD ALIGN="LEFT" BGCOLOR="#FFD8BF"><FONT FACE="Arial, Helvetica" SIZE="-2"> <B>Stadtteil:</B> </FONT></TD>
				<TD BGCOLOR="#EFEFEF"><FONT FACE="Arial, Helvetica" SIZE="-1"> <INPUT TYPE="text" NAME="fromstreet" VALUE=""></FONT></TD>
				</TR>
				</TABLE>
				</TD>
				</TR>
				</TABLE>
				</FORM>
				-->
				<!-- WEB.DE Routenplanung Ende -->
				</td></tr>
				<%
				rs.movenext
				i = i + 1
			wend
			%></table><%
		rs.close
	call drawWindowPart2("Liste Zulieferer in PLZ [" & PLZ &  "] und Umgebung:"," ","", butArr)	
end function 




'********************************************************************************************
' Getter and Setter for the Haendler Vars 
'********************************************************************************************
function varValueMerchant(byVal lieferantNr,byVal VarNAme)
Dim sql: sql = "select * from priceCompareHaendlerOfVars where LieferantNr= " & _ 
               LieferantNr & " And [Name] Like '" & VarNAme & "'"
Dim rs: set rs = objConnectionExecute(sql)
Dim UrlShop:  
if rs.EOF then  
    Response.Write "Die Variable ["  & VarNAme & "] ist nicht definiert für Haendler # " & lieferantNr & "!"
    varValueMerchant =""
else
    varValueMerchant = rs("Wert")
end if 
end function 

'********************************************************************************************
' Getter and Setter for the Haendler Vars 
'********************************************************************************************

function setVarValueMerchant(byVal lieferantNr,byVal VarNAme, byVal VarValue)
	Dim sql: sql = "select * from priceCompareHaendlerOfVars where LieferantNr= " & _ 
	               LieferantNr & " And [Name] Like '" & VarNAme & "'"
	Dim rs: set rs = objConnectionExecute(sql)
	Dim UrlShop:  
	if rs.EOF then  
	    sql = "INSERT INTO priceCompareHaendlerOfVars(LieferantNr, [NAme], [Wert]) Values ("& LieferantNr &",'"& VarNAme &"','" & VarValue & "')" 
	else
	    sql = "UPDATE priceCompareHaendlerOfVars Set [Wert] = '"& VarValue &"' Where [Name] like '" & VarName & "' AND LieferantNr=" & LieferantNr
	end if 
	'Response.write sql
   objConnectionExecute(sql)
end function 

%>